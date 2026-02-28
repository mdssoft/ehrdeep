#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';
import { config as dotenvConfig } from 'dotenv';
import { OpenRouterClient } from '../src/ai/openRouterClient.js';
import { createLogger } from '../src/utils/logger.js';

const envPath = path.join(process.cwd(), '.env');
if (fs.existsSync(envPath)) {
  dotenvConfig({ path: envPath });
}

const baseUrlFallback = process.env.OPENROUTER_BASE_URL || 'https://openrouter.ai/api/v1';
const defaultKey = process.env.OPENROUTER_DEFAULT_API_KEY || process.env.OPENROUTER_API_KEY || '';
const analysisKey = process.env.OPENROUTER_ANALYSIS_API_KEY || process.env.OPENROUTER_API_KEY || defaultKey;
const embeddingKey = process.env.OPENROUTER_EMBEDDING_API_KEY || process.env.OPENROUTER_API_KEY || defaultKey;

if (!defaultKey) {
  console.error('Default OpenRouter key is missing. Set OPENROUTER_DEFAULT_API_KEY or OPENROUTER_API_KEY in .env');
  process.exit(1);
}

const client = new OpenRouterClient({
  logger: createLogger(process.env.LOG_LEVEL || 'info', 'openrouter-smoke'),
  dimension: Number(process.env.VECTOR_DIMENSION || 1024),
  config: {
    siteUrl: process.env.OPENROUTER_SITE_URL || 'https://localhost/ehrdeep',
    appName: process.env.OPENROUTER_APP_NAME || 'ehrdeep',
    timeoutMs: Number(process.env.OPENROUTER_TIMEOUT_MS || 45000),
    maxRetries: Number(process.env.OPENROUTER_MAX_RETRIES || 2),
    allowLocalEmbeddingFallback: String(process.env.ALLOW_LOCAL_EMBEDDING_FALLBACK || 'true').toLowerCase() === 'true',
    connections: {
      default: {
        model: process.env.OPENROUTER_MODEL || 'qwen/qwen-2.5-72b-instruct',
        baseUrl: process.env.OPENROUTER_DEFAULT_BASE_URL || baseUrlFallback,
        apiKey: defaultKey
      },
      analysis: {
        model: process.env.OPENROUTER_ANALYSIS_MODEL || process.env.OPENROUTER_MODEL || 'qwen/qwen-2.5-72b-instruct',
        baseUrl: process.env.OPENROUTER_ANALYSIS_BASE_URL || baseUrlFallback,
        apiKey: analysisKey
      },
      embedding: {
        model: process.env.OPENROUTER_EMBEDDING_MODEL || 'qwen/qwen3-embedding-8b',
        baseUrl: process.env.OPENROUTER_EMBEDDING_BASE_URL || baseUrlFallback,
        apiKey: embeddingKey
      }
    }
  }
});

try {
  const result = await client.runDefaultModelCheck('Ответь одним словом: OK');
  console.log(JSON.stringify({
    ok: true,
    model: result.model,
    content: result.content
  }, null, 2));
} catch (error) {
  console.error(JSON.stringify({
    ok: false,
    error: error.message
  }, null, 2));
  process.exit(1);
}
