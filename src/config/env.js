import fs from 'node:fs';
import path from 'node:path';
import { config as dotenvConfig } from 'dotenv';
import { z } from 'zod';

const projectRoot = process.cwd();
const envPath = path.join(projectRoot, '.env');

if (fs.existsSync(envPath)) {
  dotenvConfig({ path: envPath });
}

const boolFromString = z
  .string()
  .optional()
  .transform((value) => String(value ?? 'false').toLowerCase() === 'true');

const schema = z.object({
  NODE_ENV: z.string().default('development'),
  LOG_LEVEL: z.string().default('info'),

  MIS_SERVER_IP: z.string().min(1),
  MIS_SERVER_PORT: z.coerce.number().int().positive(),
  MIS_AUTH_USERNAME: z.string().min(1),
  MIS_AUTH_PASSWORD: z.string().min(1),
  MIS_TIMEOUT_MS: z.coerce.number().int().positive().default(30000),
  MIS_DOC_ENDPOINT: z.string().default('/ANONDOCS_MECRAG'),
  MIS_CHUNK_LIMIT: z.coerce.number().int().positive().max(1000).default(100),

  SQLITE_DB_PATH: z.string().default('./var/ehrdeep.db'),
  VECTOR_DB_ENGINE: z.enum(['sqlite', 'lance']).default('sqlite'),
  VECTOR_DB_PATH: z.string().default('./var/vector.db'),
  VECTOR_DIMENSION: z.coerce.number().int().positive().default(1024),
  SQLITE_VEC_EXTENSION_PATH: z.string().optional().default(''),
  LANCEDB_DIR: z.string().default('./var/lancedb'),

  OPENROUTER_API_KEY: z.string().optional().default(''),
  OPENROUTER_BASE_URL: z.string().url().default('https://openrouter.ai/api/v1'),
  OPENROUTER_DEFAULT_API_KEY: z.string().optional().default(''),
  OPENROUTER_DEFAULT_BASE_URL: z.string().optional().default(''),
  OPENROUTER_ANALYSIS_API_KEY: z.string().optional().default(''),
  OPENROUTER_ANALYSIS_BASE_URL: z.string().optional().default(''),
  OPENROUTER_EMBEDDING_API_KEY: z.string().optional().default(''),
  OPENROUTER_EMBEDDING_BASE_URL: z.string().optional().default(''),
  OPENROUTER_SITE_URL: z.string().url().default('https://localhost/ehrdeep'),
  OPENROUTER_APP_NAME: z.string().default('ehrdeep'),
  OPENROUTER_MODEL: z.string().default('qwen/qwen-2.5-72b-instruct'),
  OPENROUTER_ANALYSIS_MODEL: z.string().default('qwen/qwen-2.5-72b-instruct'),
  OPENROUTER_EMBEDDING_MODEL: z.string().default('qwen/qwen3-embedding-8b'),
  OPENROUTER_TIMEOUT_MS: z.coerce.number().int().positive().default(45000),
  OPENROUTER_MAX_RETRIES: z.coerce.number().int().min(0).max(5).default(2),
  ALLOW_LOCAL_EMBEDDING_FALLBACK: boolFromString,

  SIMILARITY_TOP_K: z.coerce.number().int().positive().default(12),
  CONTEXT_DOC_LIMIT: z.coerce.number().int().positive().default(12)
});

export function loadConfig() {
  const parsed = schema.safeParse(process.env);
  if (!parsed.success) {
    const details = parsed.error.issues.map((issue) => `${issue.path.join('.')}: ${issue.message}`).join('; ');
    throw new Error(`Invalid environment configuration: ${details}`);
  }

  const env = parsed.data;
  const baseUrlFallback = env.OPENROUTER_BASE_URL;
  const defaultKey = env.OPENROUTER_DEFAULT_API_KEY || env.OPENROUTER_API_KEY;
  const analysisKey = env.OPENROUTER_ANALYSIS_API_KEY || env.OPENROUTER_API_KEY;
  const embeddingKey = env.OPENROUTER_EMBEDDING_API_KEY || env.OPENROUTER_API_KEY;

  if (!defaultKey) {
    throw new Error('Invalid environment configuration: OPENROUTER_DEFAULT_API_KEY (or OPENROUTER_API_KEY) is required');
  }

  if (!analysisKey) {
    throw new Error('Invalid environment configuration: OPENROUTER_ANALYSIS_API_KEY (or OPENROUTER_API_KEY) is required');
  }

  if (!embeddingKey) {
    throw new Error('Invalid environment configuration: OPENROUTER_EMBEDDING_API_KEY (or OPENROUTER_API_KEY) is required');
  }

  return {
    nodeEnv: env.NODE_ENV,
    logLevel: env.LOG_LEVEL,
    mis: {
      serverIp: env.MIS_SERVER_IP,
      serverPort: env.MIS_SERVER_PORT,
      auth: {
        username: env.MIS_AUTH_USERNAME,
        password: env.MIS_AUTH_PASSWORD
      },
      timeoutMs: env.MIS_TIMEOUT_MS,
      docsEndpoint: env.MIS_DOC_ENDPOINT,
      chunkLimit: env.MIS_CHUNK_LIMIT
    },
    storage: {
      sqliteDbPath: env.SQLITE_DB_PATH,
      vector: {
        engine: env.VECTOR_DB_ENGINE,
        vectorDbPath: env.VECTOR_DB_PATH,
        dimension: env.VECTOR_DIMENSION,
        sqliteVecExtensionPath: env.SQLITE_VEC_EXTENSION_PATH,
        lanceDir: env.LANCEDB_DIR
      }
    },
    openRouter: {
      siteUrl: env.OPENROUTER_SITE_URL,
      appName: env.OPENROUTER_APP_NAME,
      timeoutMs: env.OPENROUTER_TIMEOUT_MS,
      maxRetries: env.OPENROUTER_MAX_RETRIES,
      allowLocalEmbeddingFallback: env.ALLOW_LOCAL_EMBEDDING_FALLBACK,
      connections: {
        default: {
          model: env.OPENROUTER_MODEL,
          apiKey: defaultKey,
          baseUrl: env.OPENROUTER_DEFAULT_BASE_URL || baseUrlFallback
        },
        analysis: {
          model: env.OPENROUTER_ANALYSIS_MODEL,
          apiKey: analysisKey,
          baseUrl: env.OPENROUTER_ANALYSIS_BASE_URL || baseUrlFallback
        },
        embedding: {
          model: env.OPENROUTER_EMBEDDING_MODEL,
          apiKey: embeddingKey,
          baseUrl: env.OPENROUTER_EMBEDDING_BASE_URL || baseUrlFallback
        }
      }
    },
    analysis: {
      topK: env.SIMILARITY_TOP_K,
      contextDocLimit: env.CONTEXT_DOC_LIMIT
    }
  };
}
