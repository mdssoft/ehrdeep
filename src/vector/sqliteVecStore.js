import Database from 'better-sqlite3';
import { ensureParentDir, nowIso } from '../utils/common.js';
import { cosineSimilarity } from './math.js';

function normalizeVector(vector, expectedDimension) {
  if (!Array.isArray(vector)) {
    throw new Error('Vector must be an array');
  }

  if (vector.length !== expectedDimension) {
    throw new Error(`Vector dimension mismatch: expected ${expectedDimension}, got ${vector.length}`);
  }

  return vector.map((value) => Number(value));
}

function hasDiagnosisOverlap(rowDiagnosis, diagnosisCodes) {
  if (!diagnosisCodes?.length) {
    return true;
  }

  const rowCodes = new Set(JSON.parse(rowDiagnosis || '[]'));
  return diagnosisCodes.some((code) => rowCodes.has(code));
}

export class SqliteVecStore {
  constructor({ dbPath, dimension, sqliteVecExtensionPath, logger }) {
    ensureParentDir(dbPath);
    this.db = new Database(dbPath);
    this.dimension = dimension;
    this.sqliteVecExtensionPath = sqliteVecExtensionPath;
    this.logger = logger;
    this.sqliteVecEnabled = false;
    this.init();
  }

  init() {
    this.db.pragma('journal_mode = WAL');
    this.db.exec(`
      CREATE TABLE IF NOT EXISTS vectors (
        id TEXT PRIMARY KEY,
        vector_json TEXT NOT NULL,
        diagnosis_codes_json TEXT NOT NULL,
        diagnosis_key TEXT,
        metadata_json TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      );

      CREATE INDEX IF NOT EXISTS idx_vectors_diag_key ON vectors(diagnosis_key);
    `);

    if (!this.sqliteVecExtensionPath) {
      this.logger.info('sqlite-vec extension path is empty, fallback to JS cosine search');
      return;
    }

    try {
      this.db.loadExtension(this.sqliteVecExtensionPath);
      this.sqliteVecEnabled = true;
      this.logger.info('sqlite-vec extension loaded', { extensionPath: this.sqliteVecExtensionPath });
    } catch (error) {
      this.logger.warn('Failed to load sqlite-vec extension, fallback to JS cosine search', {
        error: error.message
      });
      this.sqliteVecEnabled = false;
    }
  }

  upsertMany(items) {
    if (!items.length) {
      return;
    }

    const now = nowIso();
    const upsert = this.db.prepare(`
      INSERT INTO vectors (
        id,
        vector_json,
        diagnosis_codes_json,
        diagnosis_key,
        metadata_json,
        created_at,
        updated_at
      ) VALUES (
        @id,
        @vector_json,
        @diagnosis_codes_json,
        @diagnosis_key,
        @metadata_json,
        @created_at,
        @updated_at
      )
      ON CONFLICT(id) DO UPDATE SET
        vector_json = excluded.vector_json,
        diagnosis_codes_json = excluded.diagnosis_codes_json,
        diagnosis_key = excluded.diagnosis_key,
        metadata_json = excluded.metadata_json,
        updated_at = excluded.updated_at
    `);

    const findCreatedAt = this.db.prepare('SELECT created_at FROM vectors WHERE id = ?');

    const tx = this.db.transaction((batch) => {
      for (const item of batch) {
        const normalized = normalizeVector(item.vector, this.dimension);
        const existing = findCreatedAt.get(item.id);

        upsert.run({
          id: item.id,
          vector_json: JSON.stringify(normalized),
          diagnosis_codes_json: JSON.stringify(item.diagnosisCodes || []),
          diagnosis_key: item.diagnosisKey || '',
          metadata_json: JSON.stringify(item.metadata || {}),
          created_at: existing?.created_at || now,
          updated_at: now
        });
      }
    });

    tx(items);
  }

  querySimilar(vector, { k = 12, diagnosisCodes = [] } = {}) {
    const normalizedQuery = normalizeVector(vector, this.dimension);

    const rows = this.db
      .prepare('SELECT id, vector_json, diagnosis_codes_json, metadata_json FROM vectors')
      .all();

    const scored = [];
    for (const row of rows) {
      if (!hasDiagnosisOverlap(row.diagnosis_codes_json, diagnosisCodes)) {
        continue;
      }

      const candidateVector = JSON.parse(row.vector_json);
      const score = cosineSimilarity(normalizedQuery, candidateVector);

      scored.push({
        id: row.id,
        score,
        metadata: JSON.parse(row.metadata_json)
      });
    }

    scored.sort((a, b) => b.score - a.score);
    return scored.slice(0, k);
  }

  deleteByIds(ids = []) {
    if (!ids.length) {
      return;
    }

    const placeholders = ids.map(() => '?').join(',');
    this.db.prepare(`DELETE FROM vectors WHERE id IN (${placeholders})`).run(...ids);
  }

  close() {
    this.db.close();
  }
}
