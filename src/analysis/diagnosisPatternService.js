function keywordFrequency(docs, maxItems = 12) {
  const freq = new Map();
  for (const doc of docs) {
    for (const token of doc.tokens || []) {
      freq.set(token, (freq.get(token) || 0) + 1);
    }
  }

  return Array.from(freq.entries())
    .sort((a, b) => b[1] - a[1])
    .slice(0, maxItems)
    .map(([token]) => token);
}

export class DiagnosisPatternService {
  constructor({ repository, openRouterClient, logger, minDocs = 8 }) {
    this.repository = repository;
    this.openRouterClient = openRouterClient;
    this.logger = logger;
    this.minDocs = minDocs;
  }

  async refreshPattern(diagnosisCodes = []) {
    const normalizedCodes = Array.from(new Set((diagnosisCodes || []).map((x) => x.toUpperCase())));
    const diagnosisKey = normalizedCodes.join('+');

    if (!diagnosisKey) {
      return null;
    }

    const docs = this.repository.getDocumentsForDiagnosis(normalizedCodes, 120);
    if (docs.length < this.minDocs) {
      this.logger.warn('Not enough historical documents for robust diagnosis pattern', {
        diagnosisKey,
        docs: docs.length,
        minDocs: this.minDocs
      });

      return null;
    }

    let pattern;
    let model = this.openRouterClient.config.connections?.analysis?.model
      || this.openRouterClient.config.connections?.default?.model
      || 'unknown-model';

    try {
      pattern = await this.openRouterClient.createChecklistPattern({
        diagnosisCodes: normalizedCodes,
        examples: docs.slice(0, 30)
      });
    } catch (error) {
      this.logger.warn('OpenRouter pattern generation failed, fallback to heuristic pattern', {
        diagnosisKey,
        error: error.message
      });

      model = 'heuristic-fallback';
      pattern = {
        required_questions: [
          'Уточнить длительность и динамику симптомов',
          'Уточнить провоцирующие и облегчающие факторы',
          'Проверить ранее проведенное лечение и ответ на него'
        ],
        red_flags: [
          'Симптомы прогрессируют несмотря на терапию',
          'Есть системные признаки ухудшения (лихорадка, выраженная слабость, потеря веса)'
        ],
        common_context: keywordFrequency(docs, 10),
        diagnostic_focus: normalizedCodes
      };
    }

    this.repository.saveDiagnosisPattern({
      diagnosisKey,
      diagnosisCodes: normalizedCodes,
      pattern,
      model
    });

    return {
      diagnosisKey,
      diagnosisCodes: normalizedCodes,
      pattern,
      model,
      basedOnDocuments: docs.length
    };
  }
}
