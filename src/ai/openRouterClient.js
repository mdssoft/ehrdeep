import crypto from 'node:crypto';
import { chunkArray } from '../utils/common.js';

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function deterministicLocalEmbedding(text, dimension) {
  const hash = crypto.createHash('sha256').update(text).digest();
  const vector = new Array(dimension).fill(0);

  for (let i = 0; i < dimension; i += 1) {
    const byte = hash[i % hash.length];
    const sign = (byte & 1) === 0 ? 1 : -1;
    const magnitude = (byte / 255);
    vector[i] = sign * magnitude;
  }

  return vector;
}

function extractFirstJsonObject(text) {
  const start = text.indexOf('{');
  const end = text.lastIndexOf('}');

  if (start === -1 || end === -1 || end <= start) {
    throw new Error('No JSON object found in model output');
  }

  return JSON.parse(text.slice(start, end + 1));
}

export class OpenRouterClient {
  constructor({ config, logger, dimension }) {
    this.config = config;
    this.logger = logger;
    this.dimension = dimension;
  }

  #resolveConnection(kind) {
    const connection = this.config.connections?.[kind];
    if (!connection) {
      throw new Error(`OpenRouter connection is not configured for "${kind}"`);
    }

    if (!connection.apiKey) {
      throw new Error(`OpenRouter API key is missing for "${kind}" connection`);
    }

    if (!connection.baseUrl) {
      throw new Error(`OpenRouter base URL is missing for "${kind}" connection`);
    }

    if (!connection.model) {
      throw new Error(`OpenRouter model is missing for "${kind}" connection`);
    }

    return connection;
  }

  async #request(kind, path, payload) {
    const connection = this.#resolveConnection(kind);
    const url = `${connection.baseUrl}${path}`;
    const maxAttempts = this.config.maxRetries + 1;

    for (let attempt = 1; attempt <= maxAttempts; attempt += 1) {
      const controller = new AbortController();
      const timeout = setTimeout(() => controller.abort(new Error('OpenRouter timeout')), this.config.timeoutMs);

      try {
        const response = await fetch(url, {
          method: 'POST',
          headers: {
            Authorization: `Bearer ${connection.apiKey}`,
            'Content-Type': 'application/json',
            'HTTP-Referer': this.config.siteUrl,
            'X-Title': this.config.appName
          },
          body: JSON.stringify(payload),
          signal: controller.signal
        });

        if (!response.ok) {
          const body = await response.text();
          throw new Error(`OpenRouter HTTP ${response.status}: ${body.slice(0, 400)}`);
        }

        return await response.json();
      } catch (error) {
        this.logger.warn('OpenRouter request attempt failed', {
          path,
          connection: kind,
          attempt,
          maxAttempts,
          error: error.message
        });

        if (attempt === maxAttempts) {
          throw error;
        }

        await sleep(300 * attempt);
      } finally {
        clearTimeout(timeout);
      }
    }

    throw new Error('Unexpected retry state');
  }

  async embedTexts(texts) {
    const vectors = [];
    const embeddingConnection = this.#resolveConnection('embedding');

    for (const batch of chunkArray(texts, 32)) {
      try {
        const response = await this.#request('embedding', '/embeddings', {
          model: embeddingConnection.model,
          input: batch
        });

        const resultVectors = response?.data?.map((item) => item.embedding);
        if (!Array.isArray(resultVectors) || resultVectors.length !== batch.length) {
          throw new Error('OpenRouter embeddings response shape mismatch');
        }

        vectors.push(...resultVectors);
      } catch (error) {
        if (!this.config.allowLocalEmbeddingFallback) {
          throw error;
        }

        this.logger.warn('Using local deterministic embeddings fallback', {
          reason: error.message
        });

        vectors.push(...batch.map((text) => deterministicLocalEmbedding(text, this.dimension)));
      }
    }

    return vectors;
  }

  async embedOne(text) {
    const [vector] = await this.embedTexts([text]);
    return vector;
  }

  async createChecklistPattern({ diagnosisCodes, examples }) {
    const analysisConnection = this.#resolveConnection('analysis');
    const prompt = [
      'Ты клинический аналитик. Построй компактный паттерн опроса и анамнеза по ретроспективным обезличенным данным.',
      'Верни строго JSON:',
      '{',
      '  "required_questions": [string],',
      '  "red_flags": [string],',
      '  "common_context": [string],',
      '  "diagnostic_focus": [string]',
      '}',
      '',
      `Диагнозы: ${diagnosisCodes.join(', ') || 'не указаны'}`,
      'Примеры документов:',
      examples.map((doc, index) => `#${index + 1}\n${doc.text}`).join('\n\n---\n\n')
    ].join('\n');

    const response = await this.#request('analysis', '/chat/completions', {
      model: analysisConnection.model,
      temperature: 0.2,
      messages: [
        {
          role: 'system',
          content: 'Отвечай только валидным JSON без markdown.'
        },
        {
          role: 'user',
          content: prompt
        }
      ]
    });

    const content = response?.choices?.[0]?.message?.content;
    if (!content) {
      throw new Error('OpenRouter returned empty content for checklist pattern');
    }

    return extractFirstJsonObject(content);
  }

  async analyzeCase({ diagnosisCodes, caseText, contextDocs, pattern }) {
    const analysisConnection = this.#resolveConnection('analysis');
    const prompt = [
      'Ты клинический контролер качества сбора анамнеза и жалоб.',
      'Проверь, что врач мог пропустить по тексту текущего случая.',
      'Учитывай только клинически релевантные пункты, не выдумывай противопоказания без основания.',
      '',
      'Верни строго JSON:',
      '{',
      '  "risk_level": "low|medium|high",',
      '  "missing_anamnesis": ["..."]',
      '  "missing_complaints": ["..."]',
      '  "recommended_questions": ["..."]',
      '  "reasoning": "краткое обоснование"',
      '}',
      '',
      `Диагнозы: ${diagnosisCodes.join(', ') || 'не указаны'}`,
      '',
      `Паттерн (если есть): ${pattern ? JSON.stringify(pattern) : 'нет'}`,
      '',
      'Текущий текст:',
      caseText,
      '',
      'Похожие кейсы:',
      contextDocs.map((doc, index) => `#${index + 1} [score=${doc.score.toFixed(4)}]\n${doc.text}`).join('\n\n---\n\n')
    ].join('\n');

    const response = await this.#request('analysis', '/chat/completions', {
      model: analysisConnection.model,
      temperature: 0.1,
      messages: [
        {
          role: 'system',
          content: 'Отвечай только валидным JSON без markdown и без лишних ключей.'
        },
        {
          role: 'user',
          content: prompt
        }
      ]
    });

    const content = response?.choices?.[0]?.message?.content;
    if (!content) {
      throw new Error('OpenRouter returned empty content for case analysis');
    }

    return {
      model: response?.model || analysisConnection.model,
      rawText: content,
      json: extractFirstJsonObject(content)
    };
  }

  async runDefaultModelCheck(prompt = 'Ответь строго "OK".') {
    const defaultConnection = this.#resolveConnection('default');
    const response = await this.#request('default', '/chat/completions', {
      model: defaultConnection.model,
      temperature: 0,
      messages: [
        {
          role: 'system',
          content: 'You are a test assistant. Keep responses short.'
        },
        {
          role: 'user',
          content: prompt
        }
      ]
    });

    const content = response?.choices?.[0]?.message?.content || '';
    return {
      model: response?.model || defaultConnection.model,
      content: String(content).trim()
    };
  }
}
