import { createApiClient } from './apiClient.js';
import { parseJson } from './responseParser.js';

/**
 * Расширение для stage dataset/systematization.
 * Не изменяет существующий `mis/index.js`, а добавляет отдельный клиент.
 */
export function createMisDatasetClient(config) {
  const api = createApiClient(config);

  return {
    /**
     * Получение обезличенных документов из COS routine `MECRAG.ANONDOCS`.
     *
     * @param {object} params
     * @param {string} [params.dateFrom=''] DD.MM.YYYY
     * @param {string} [params.dateTo=''] DD.MM.YYYY
     * @param {number} [params.limit=100]
     * @param {string} [params.cursor=''] format DT|NI|ID
     * @param {string} [params.diagnosis=''] comma-separated ICD codes
     */
    async getAnonymizedDocs({ dateFrom = '', dateTo = '', limit = 100, cursor = '', diagnosis = '' } = {}) {
      const result = await api.get('/ANONDOCS_MECRAG', {
        p1: dateFrom,
        p2: dateTo,
        p3: Math.min(Number(limit) || 100, 1000),
        p4: cursor,
        p5: diagnosis,
      });

      if (!result.success) {
        return result;
      }

      try {
        result.data = parseJson(result.data.body);
      } catch (error) {
        return {
          success: false,
          error: {
            message: 'Ошибка парсинга ANONDOCS_MECRAG ответа',
            details: error.message,
            statusCode: 200,
          }
        };
      }

      return result;
    }
  };
}
