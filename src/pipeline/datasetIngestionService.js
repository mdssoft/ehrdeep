import { normalizeMedicalDocument } from '../nlp/normalize.js';

export class DatasetIngestionService {
  constructor({ misClient, repository, vectorStore, openRouterClient, logger }) {
    this.misClient = misClient;
    this.repository = repository;
    this.vectorStore = vectorStore;
    this.openRouterClient = openRouterClient;
    this.logger = logger;
  }

  async ingestDocuments({ dateFrom = '', dateTo = '', diagnosis = '', maxPages = 100 } = {}) {
    let cursor = '';
    let hasMore = true;
    let page = 0;
    let totalReceived = 0;
    let totalSaved = 0;

    while (hasMore && page < maxPages) {
      const response = await this.misClient.getAnonymizedDocuments({
        dateFrom,
        dateTo,
        diagnosis,
        cursor,
        limit: this.misClient.chunkLimit || 100
      });

      if (!response.success) {
        throw new Error(response.error?.message || 'Failed to fetch anonymized documents from MIS');
      }

      const rawItems = response.data.items || [];
      totalReceived += rawItems.length;

      if (!rawItems.length) {
        break;
      }

      const normalized = rawItems
        .map((raw) => normalizeMedicalDocument(raw))
        .filter((doc) => doc.text && doc.text.length > 0);

      if (!normalized.length) {
        this.logger.warn('MIS page has no valid normalized documents', { cursor, page });
      } else {
        const vectors = await this.openRouterClient.embedTexts(normalized.map((doc) => doc.text));

        for (let i = 0; i < normalized.length; i += 1) {
          this.repository.upsertDocument(normalized[i]);
        }

        await this.vectorStore.upsertMany(normalized.map((doc, i) => ({
          id: doc.sampleId,
          vector: vectors[i],
          diagnosisCodes: doc.diagnosisCodes,
          diagnosisKey: doc.diagnosisKey,
          metadata: {
            sampleId: doc.sampleId,
            sourceDate: doc.sourceDate,
            sourceName: doc.sourceName
          }
        })));

        totalSaved += normalized.length;
      }

      cursor = response.data.nextCursor || '';
      hasMore = Boolean(response.data.hasMore && cursor);
      page += 1;

      this.logger.info('MIS ingestion page done', {
        page,
        pageReceived: rawItems.length,
        pageSaved: normalized.length,
        hasMore
      });
    }

    return {
      totalReceived,
      totalSaved,
      pages: page
    };
  }
}
