import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import os from 'node:os';
import { normalizeMedicalDocument, normalizeNewCaseInput } from '../src/nlp/normalize.js';
import { SqliteRepository } from '../src/storage/sqliteRepository.js';
import { createLogger } from '../src/utils/logger.js';
import { SqliteVecStore } from '../src/vector/sqliteVecStore.js';

function tempFile(name) {
  const dir = fs.mkdtempSync(path.join(os.tmpdir(), 'ehrdeep-test-'));
  return path.join(dir, name);
}

test('normalizeMedicalDocument extracts diagnosis and redacts phone', () => {
  const doc = normalizeMedicalDocument({
    sample_id: '1',
    patient_ref: 'abc',
    doc_id: '7',
    complaints: 'Боль в животе, звоните +7 (999) 123-45-67',
    anamnesis: '2 месяца',
    findings: 'Диагноз K74.6',
    diag_primary: 'K74.6'
  });

  assert.equal(doc.sampleId, '1');
  assert.ok(doc.text.includes('[PHONE]'));
  assert.ok(doc.diagnosisCodes.includes('K74.6'));
  assert.equal(doc.diagnosisKey, 'K74.6');
});

test('normalizeNewCaseInput merges text and diagnosis', () => {
  const normalized = normalizeNewCaseInput({
    diagnosis: ['K76.0'],
    text: 'Подозрение на K74.6'
  });

  assert.deepEqual(normalized.diagnosisCodes, ['K74.6', 'K76.0']);
  assert.ok(normalized.text.includes('K74.6'));
});

test('repository + vector store roundtrip', async () => {
  const logger = createLogger('error', 'test');
  const dbPath = tempFile('repo.db');
  const vectorPath = tempFile('vector.db');

  const repository = new SqliteRepository({ dbPath, logger });
  const store = new SqliteVecStore({ dbPath: vectorPath, dimension: 4, logger, sqliteVecExtensionPath: '' });

  repository.upsertDocument({
    sampleId: 's1',
    patientRef: 'p1',
    sourceDocId: 'd1',
    sourceDate: '2026-02-23',
    sourceName: 'doc',
    diagnosisKey: 'K74.6',
    diagnosisCodes: ['K74.6'],
    sections: { complaints: 'pain' },
    text: 'pain and weakness',
    tokens: ['pain', 'weakness'],
    metadata: { origin: 'test' }
  });

  await store.upsertMany([
    {
      id: 's1',
      vector: [1, 0, 0, 0],
      diagnosisCodes: ['K74.6'],
      diagnosisKey: 'K74.6',
      metadata: { sampleId: 's1' }
    }
  ]);

  const docs = repository.getDocumentsByIds(['s1']);
  assert.equal(docs.length, 1);

  const nearest = await store.querySimilar([1, 0, 0, 0], { k: 1, diagnosisCodes: ['K74.6'] });
  assert.equal(nearest.length, 1);
  assert.equal(nearest[0].id, 's1');

  repository.close();
  await store.close();
});
