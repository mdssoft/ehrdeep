const ICD10_REGEX = /\b([A-TV-Z][0-9]{2}(?:\.[0-9A-Z]{1,4})?)\b/gi;

const STOP_WORDS = new Set([
  'пациент',
  'жалобы',
  'анамнез',
  'объективно',
  'осмотр',
  'данные',
  'дата',
  'документ'
]);

function normalizeWhitespace(value) {
  return String(value || '')
    .replace(/\r\n/g, '\n')
    .replace(/\u00A0/g, ' ')
    .replace(/[ \t]+/g, ' ')
    .replace(/\n{3,}/g, '\n\n')
    .trim();
}

function redactIdentifiers(value) {
  return value
    .replace(/\b\+?7[\s\-()]*\d{3}[\s\-()]*\d{3}[\s\-()]*\d{2}[\s\-()]*\d{2}\b/g, '[PHONE]')
    .replace(/\b\d{3}-?\d{3}-?\d{3}\s?\d{2}\b/g, '[SNILS]')
    .replace(/\b\d{4}\s?\d{6}\b/g, '[PASSPORT]')
    .replace(/\b[\w.%+-]+@[\w.-]+\.[A-Za-z]{2,}\b/g, '[EMAIL]')
    .replace(/\b[А-ЯЁ][а-яё]+\s+[А-ЯЁ]\.\s*[А-ЯЁ]\./g, '[PERSON]')
    .replace(/\b(ул\.|улица|пр-т|проспект|д\.|дом|кв\.)\s*[^\n,]+/gi, '[ADDRESS]');
}

function extractIcd10Codes(text) {
  const matches = text.match(ICD10_REGEX) || [];
  const unique = new Set(matches.map((code) => code.toUpperCase()));
  return Array.from(unique).sort();
}

function tokenize(text) {
  return normalizeWhitespace(text)
    .toLowerCase()
    .replace(/[^\p{L}\p{N}\s]/gu, ' ')
    .split(/\s+/)
    .filter((token) => token.length > 2 && !STOP_WORDS.has(token));
}

export function normalizeMedicalDocument(raw) {
  const diagnosisRaw = [
    raw.diag_primary || '',
    raw.diag_all || '',
    raw.diagnosis || ''
  ].join(', ');

  const complaints = normalizeWhitespace(raw.complaints || raw.chief_complaints || '');
  const anamnesis = normalizeWhitespace(raw.anamnesis || raw.history || '');
  const findings = normalizeWhitespace(raw.findings || raw.objective || raw.assessment || '');
  const recommendation = normalizeWhitespace(raw.recommendation || raw.plan || '');

  const mergedText = normalizeWhitespace([
    complaints ? `Жалобы: ${complaints}` : '',
    anamnesis ? `Анамнез: ${anamnesis}` : '',
    findings ? `Объективно: ${findings}` : '',
    recommendation ? `Рекомендации: ${recommendation}` : ''
  ].filter(Boolean).join('\n'));

  const deidentifiedText = redactIdentifiers(mergedText);

  const diagnosisCodes = Array.from(new Set([
    ...extractIcd10Codes(diagnosisRaw),
    ...extractIcd10Codes(deidentifiedText)
  ])).sort();

  const diagnosisKey = diagnosisCodes.join('+');

  return {
    sampleId: String(raw.sample_id || `${raw.patient_ref || 'anon'}-${raw.doc_id || 'doc'}`),
    patientRef: String(raw.patient_ref || 'anon'),
    sourceDocId: String(raw.doc_id || raw.key || ''),
    sourceDate: String(raw.doc_date || raw.date || ''),
    sourceName: String(raw.doc_name || raw.name || ''),
    diagnosisCodes,
    diagnosisKey,
    sections: {
      complaints,
      anamnesis,
      findings,
      recommendation
    },
    text: deidentifiedText,
    tokens: tokenize(deidentifiedText),
    metadata: {
      origin: 'mis',
      rawDiagnosis: diagnosisRaw
    }
  };
}

export function normalizeNewCaseInput({ diagnosis = [], text = '', complaints = '', anamnesis = '' } = {}) {
  const combined = normalizeWhitespace([
    complaints ? `Жалобы: ${complaints}` : '',
    anamnesis ? `Анамнез: ${anamnesis}` : '',
    text
  ].filter(Boolean).join('\n'));

  const deidentifiedText = redactIdentifiers(combined);
  const extracted = extractIcd10Codes(`${Array.isArray(diagnosis) ? diagnosis.join(',') : diagnosis || ''} ${deidentifiedText}`);

  return {
    text: deidentifiedText,
    diagnosisCodes: extracted,
    diagnosisKey: extracted.join('+'),
    tokens: tokenize(deidentifiedText)
  };
}
