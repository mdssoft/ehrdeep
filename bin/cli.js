#!/usr/bin/env node
import fs from 'node:fs';
import { createApp } from '../src/app.js';

function parseArgs(argv) {
  const [, , command = 'help', ...rest] = argv;
  const args = { _: command };

  for (let i = 0; i < rest.length; i += 1) {
    const token = rest[i];
    if (!token.startsWith('--')) {
      continue;
    }

    const key = token.slice(2);
    const value = rest[i + 1] && !rest[i + 1].startsWith('--') ? rest[i + 1] : true;
    args[key] = value;
    if (value !== true) {
      i += 1;
    }
  }

  return args;
}

function splitDiagnosis(value) {
  if (!value || value === true) {
    return [];
  }

  return String(value)
    .split(/[;,\s]+/)
    .map((x) => x.trim().toUpperCase())
    .filter(Boolean);
}

function printHelp() {
  console.log(`Usage:
  node bin/cli.js ingest --date-from 01.01.2025 --date-to 31.12.2025 --diagnosis K74.6
  node bin/cli.js pattern --diagnosis K74.6,K76.0
  node bin/cli.js analyze --text-file ./new-case.txt --diagnosis K74.6
`);
}

async function main() {
  const args = parseArgs(process.argv);
  const command = args._;

  if (command === 'help' || command === '--help' || command === '-h') {
    printHelp();
    return;
  }

  const app = await createApp();

  try {
    if (command === 'ingest') {
      const result = await app.ingestionService.ingestDocuments({
        dateFrom: args['date-from'] || '',
        dateTo: args['date-to'] || '',
        diagnosis: args.diagnosis || '',
        maxPages: Number(args['max-pages'] || 100)
      });

      console.log(JSON.stringify(result, null, 2));
      return;
    }

    if (command === 'pattern') {
      const diagnosisCodes = splitDiagnosis(args.diagnosis);
      if (!diagnosisCodes.length) {
        throw new Error('Provide --diagnosis for pattern command');
      }

      const result = await app.diagnosisPatternService.refreshPattern(diagnosisCodes);
      console.log(JSON.stringify(result, null, 2));
      return;
    }

    if (command === 'analyze') {
      const diagnosisCodes = splitDiagnosis(args.diagnosis);
      const text = args['text-file']
        ? fs.readFileSync(String(args['text-file']), 'utf8')
        : String(args.text || '');

      if (!text.trim()) {
        throw new Error('Provide --text or --text-file for analyze command');
      }

      const result = await app.caseAnalysisService.analyzeNewCase({
        diagnosis: diagnosisCodes,
        text,
        complaints: args.complaints || '',
        anamnesis: args.anamnesis || ''
      });

      console.log(JSON.stringify(result, null, 2));
      return;
    }

    throw new Error(`Unknown command: ${command}`);
  } finally {
    await app.close();
  }
}

main().catch((error) => {
  console.error(error.stack || error.message);
  process.exitCode = 1;
});
