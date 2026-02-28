import { loadConfig } from './config/env.js';
import { createLogger } from './utils/logger.js';
import { MisClient } from './mis/misClient.js';
import { SqliteRepository } from './storage/sqliteRepository.js';
import { createVectorStore } from './vector/vectorStoreFactory.js';
import { OpenRouterClient } from './ai/openRouterClient.js';
import { DatasetIngestionService } from './pipeline/datasetIngestionService.js';
import { DiagnosisPatternService } from './analysis/diagnosisPatternService.js';
import { CaseAnalysisService } from './analysis/caseAnalysisService.js';

export async function createApp() {
  const config = loadConfig();
  const logger = createLogger(config.logLevel, 'ehrdeep');

  const repository = new SqliteRepository({
    dbPath: config.storage.sqliteDbPath,
    logger
  });

  const vectorStore = createVectorStore({
    engine: config.storage.vector.engine,
    vectorDbPath: config.storage.vector.vectorDbPath,
    dimension: config.storage.vector.dimension,
    sqliteVecExtensionPath: config.storage.vector.sqliteVecExtensionPath,
    lanceDir: config.storage.vector.lanceDir
  }, logger);

  const openRouterClient = new OpenRouterClient({
    config: config.openRouter,
    logger,
    dimension: config.storage.vector.dimension
  });

  const misClient = new MisClient({
    serverIp: config.mis.serverIp,
    serverPort: config.mis.serverPort,
    auth: config.mis.auth,
    timeoutMs: config.mis.timeoutMs,
    docsEndpoint: config.mis.docsEndpoint,
    chunkLimit: config.mis.chunkLimit,
    logger
  });

  const ingestionService = new DatasetIngestionService({
    misClient,
    repository,
    vectorStore,
    openRouterClient,
    logger
  });

  const diagnosisPatternService = new DiagnosisPatternService({
    repository,
    openRouterClient,
    logger
  });

  const caseAnalysisService = new CaseAnalysisService({
    repository,
    vectorStore,
    openRouterClient,
    diagnosisPatternService,
    logger,
    config: config.analysis
  });

  return {
    config,
    logger,
    repository,
    vectorStore,
    openRouterClient,
    misClient,
    ingestionService,
    diagnosisPatternService,
    caseAnalysisService,
    async close() {
      await vectorStore.close();
      repository.close();
    }
  };
}
