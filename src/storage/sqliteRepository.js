import Database from 'better-sqlite3';
import { ensureParentDir, nowIso } from '../utils/common.js';

export class SqliteRepository {
  constructor({ dbPath, logger }) {
    ensureParentDir(dbPath);
    this.db = new Database(dbPath);
    this.logger = logger;
    this.init();
  }

  init() {
    this.db.pragma('journal_mode = WAL');
    this.db.exec(`
      CREATE TABLE IF NOT EXISTS documents (
        sample_id TEXT PRIMARY KEY,
        patient_ref TEXT NOT NULL,
        source_doc_id TEXT,
        source_date TEXT,
        source_name TEXT,
        diagnosis_key TEXT,
        diagnosis_codes_json TEXT NOT NULL,
        sections_json TEXT NOT NULL,
        text TEXT NOT NULL,
        tokens_json TEXT NOT NULL,
        metadata_json TEXT NOT NULL,
        created_at TEXT NOT NULL,
        updated_at TEXT NOT NULL
      );

      CREATE INDEX IF NOT EXISTS idx_documents_diag_key ON documents(diagnosis_key);
      CREATE INDEX IF NOT EXISTS idx_documents_source_date ON documents(source_date);

      CREATE TABLE IF NOT EXISTS diagnosis_patterns (
        diagnosis_key TEXT PRIMARY KEY,
        diagnosis_codes_json TEXT NOT NULL,
        pattern_json TEXT NOT NULL,
        generated_at TEXT NOT NULL,
        model TEXT NOT NULL
      );

      CREATE TABLE IF NOT EXISTS analysis_runs (
        run_id TEXT PRIMARY KEY,
        diagnosis_codes_json TEXT NOT NULL,
        input_text TEXT NOT NULL,
        context_json TEXT NOT NULL,
        llm_model TEXT NOT NULL,
        output_json TEXT NOT NULL,
        created_at TEXT NOT NULL
      );
    `);
  }

  upsertDocument(document) {
    const now = nowIso();
    const existing = this.db
      .prepare('SELECT sample_id, created_at FROM documents WHERE sample_id = ?')
      .get(document.sampleId);

    const stmt = this.db.prepare(`
      INSERT INTO documents (
        sample_id,
        patient_ref,
        source_doc_id,
        source_date,
        source_name,
        diagnosis_key,
        diagnosis_codes_json,
        sections_json,
        text,
        tokens_json,
        metadata_json,
        created_at,
        updated_at
      ) VALUES (
        @sample_id,
        @patient_ref,
        @source_doc_id,
        @source_date,
        @source_name,
        @diagnosis_key,
        @diagnosis_codes_json,
        @sections_json,
        @text,
        @tokens_json,
        @metadata_json,
        @created_at,
        @updated_at
      )
      ON CONFLICT(sample_id) DO UPDATE SET
        patient_ref = excluded.patient_ref,
        source_doc_id = excluded.source_doc_id,
        source_date = excluded.source_date,
        source_name = excluded.source_name,
        diagnosis_key = excluded.diagnosis_key,
        diagnosis_codes_json = excluded.diagnosis_codes_json,
        sections_json = excluded.sections_json,
        text = excluded.text,
        tokens_json = excluded.tokens_json,
        metadata_json = excluded.metadata_json,
        updated_at = excluded.updated_at
    `);

    stmt.run({
      sample_id: document.sampleId,
      patient_ref: document.patientRef,
      source_doc_id: document.sourceDocId,
      source_date: document.sourceDate,
      source_name: document.sourceName,
      diagnosis_key: document.diagnosisKey,
      diagnosis_codes_json: JSON.stringify(document.diagnosisCodes || []),
      sections_json: JSON.stringify(document.sections || {}),
      text: document.text || '',
      tokens_json: JSON.stringify(document.tokens || []),
      metadata_json: JSON.stringify(document.metadata || {}),
      created_at: existing?.created_at || now,
      updated_at: now
    });
  }

  getDocumentsByIds(ids = []) {
    if (!ids.length) {
      return [];
    }

    const placeholders = ids.map(() => '?').join(',');
    const rows = this.db
      .prepare(`SELECT * FROM documents WHERE sample_id IN (${placeholders})`)
      .all(...ids);

    return rows.map(this.#mapDocumentRow);
  }

  getDocumentsForDiagnosis(diagnosisCodes = [], limit = 100) {
    if (!diagnosisCodes.length) {
      return [];
    }

    const query = `
      SELECT *
      FROM documents
      WHERE ${diagnosisCodes.map(() => 'diagnosis_codes_json LIKE ?').join(' OR ')}
      ORDER BY source_date DESC
      LIMIT ?
    `;

    const args = diagnosisCodes.map((code) => `%${code.toUpperCase()}%`);
    args.push(limit);

    return this.db.prepare(query).all(...args).map(this.#mapDocumentRow);
  }

  saveDiagnosisPattern({ diagnosisKey, diagnosisCodes, pattern, model }) {
    const stmt = this.db.prepare(`
      INSERT INTO diagnosis_patterns (
        diagnosis_key,
        diagnosis_codes_json,
        pattern_json,
        generated_at,
        model
      ) VALUES (?, ?, ?, ?, ?)
      ON CONFLICT(diagnosis_key) DO UPDATE SET
        diagnosis_codes_json = excluded.diagnosis_codes_json,
        pattern_json = excluded.pattern_json,
        generated_at = excluded.generated_at,
        model = excluded.model
    `);

    stmt.run(
      diagnosisKey,
      JSON.stringify(diagnosisCodes || []),
      JSON.stringify(pattern || {}),
      nowIso(),
      model
    );
  }

  getDiagnosisPattern(diagnosisKey) {
    const row = this.db
      .prepare('SELECT * FROM diagnosis_patterns WHERE diagnosis_key = ?')
      .get(diagnosisKey);

    if (!row) {
      return null;
    }

    return {
      diagnosisKey: row.diagnosis_key,
      diagnosisCodes: JSON.parse(row.diagnosis_codes_json),
      pattern: JSON.parse(row.pattern_json),
      generatedAt: row.generated_at,
      model: row.model
    };
  }

  saveAnalysisRun({ runId, diagnosisCodes, inputText, context, model, output }) {
    this.db
      .prepare(`
        INSERT INTO analysis_runs (
          run_id,
          diagnosis_codes_json,
          input_text,
          context_json,
          llm_model,
          output_json,
          created_at
        ) VALUES (?, ?, ?, ?, ?, ?, ?)
      `)
      .run(
        runId,
        JSON.stringify(diagnosisCodes || []),
        inputText,
        JSON.stringify(context || {}),
        model,
        JSON.stringify(output || {}),
        nowIso()
      );
  }

  close() {
    this.db.close();
  }

  #mapDocumentRow(row) {
    return {
      sampleId: row.sample_id,
      patientRef: row.patient_ref,
      sourceDocId: row.source_doc_id,
      sourceDate: row.source_date,
      sourceName: row.source_name,
      diagnosisKey: row.diagnosis_key,
      diagnosisCodes: JSON.parse(row.diagnosis_codes_json),
      sections: JSON.parse(row.sections_json),
      text: row.text,
      tokens: JSON.parse(row.tokens_json),
      metadata: JSON.parse(row.metadata_json),
      createdAt: row.created_at,
      updatedAt: row.updated_at
    };
  }
}
