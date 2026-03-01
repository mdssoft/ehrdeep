#!/usr/bin/env node
import fs from 'node:fs';
import path from 'node:path';

const ENTITY_EXT = {
  Routine: '.mac',
  Class: '.cls',
  CSPPage: '.csp',
  Global: '.gbl'
};

function usage() {
  console.log(`Usage:
  node bin/cache-export.js build [xmlPath] [outputDir]
  node bin/cache-export.js list [pattern] [indexPath]
  node bin/cache-export.js get <name> [indexPath]

Defaults:
  xmlPath   = cos-mis/full_src/all.xml
  outputDir = cos-mis/full_src/indexed
  indexPath = cos-mis/full_src/indexed/index.json`);
}

function parseAttributes(raw) {
  const attrs = {};
  const attrRe = /(\w+)="([^"]*)"/g;
  let m;
  while ((m = attrRe.exec(raw)) !== null) {
    attrs[m[1]] = m[2];
  }
  return attrs;
}

function buildLineStarts(text) {
  const starts = [0];
  for (let i = 0; i < text.length; i += 1) {
    if (text.charCodeAt(i) === 10) {
      starts.push(i + 1);
    }
  }
  return starts;
}

function offsetToLine(offset, starts) {
  let lo = 0;
  let hi = starts.length - 1;
  while (lo <= hi) {
    const mid = (lo + hi) >> 1;
    if (starts[mid] <= offset) {
      lo = mid + 1;
    } else {
      hi = mid - 1;
    }
  }
  return hi + 1;
}

function normalizeCodeSlice(code) {
  if (code.startsWith('\r\n')) code = code.slice(2);
  else if (code.startsWith('\n')) code = code.slice(1);

  if (code.endsWith('\r\n')) code = code.slice(0, -2);
  else if (code.endsWith('\n')) code = code.slice(0, -1);

  return code;
}

function ensureDir(dir) {
  fs.mkdirSync(dir, { recursive: true });
}

function safeName(name) {
  return name.replace(/[^A-Za-z0-9_.-]/g, '_');
}

function parseExport(xmlText) {
  const lineStarts = buildLineStarts(xmlText);
  const startRe = /<(Routine|Class|CSPPage|Global)\b([^>]*)><!\[CDATA\[/g;
  const entities = [];
  const nameCounters = new Map();
  let m;

  while ((m = startRe.exec(xmlText)) !== null) {
    const kind = m[1];
    const attrs = parseAttributes(m[2]);
    const name = attrs.name || `${kind}_${entities.length + 1}`;

    const cdataOpenEnd = startRe.lastIndex;
    const closeToken = `]]></${kind}>`;
    const closeIndex = xmlText.indexOf(closeToken, cdataOpenEnd);
    if (closeIndex === -1) {
      throw new Error(`Unclosed ${kind} block: ${name}`);
    }

    const blockEnd = closeIndex + closeToken.length;
    const startOffset = m.index;
    const codeRaw = xmlText.slice(cdataOpenEnd, closeIndex);
    const code = normalizeCodeSlice(codeRaw);

    const key = `${kind}:${name.toUpperCase()}`;
    const count = nameCounters.get(key) || 0;
    nameCounters.set(key, count + 1);
    const duplicateIndex = count + 1;

    entities.push({
      id: `${kind}:${name}#${duplicateIndex}`,
      kind,
      name,
      duplicateIndex,
      attrs,
      startLine: offsetToLine(startOffset, lineStarts),
      endLine: offsetToLine(blockEnd - 1, lineStarts),
      code,
      codeLineCount: code.length === 0 ? 0 : code.split(/\r?\n/).length
    });

    startRe.lastIndex = blockEnd;
  }

  return entities;
}

function build(xmlPath, outputDir) {
  const xmlText = fs.readFileSync(xmlPath, 'utf8');
  const entities = parseExport(xmlText);

  ensureDir(outputDir);
  const srcDir = path.join(outputDir, 'src');
  ensureDir(srcDir);

  const written = [];
  const nameSeen = new Map();

  for (const entity of entities) {
    const ext = ENTITY_EXT[entity.kind] || '.txt';
    const kindDir = path.join(srcDir, entity.kind);
    ensureDir(kindDir);

    const base = safeName(entity.name);
    const seen = nameSeen.get(`${entity.kind}:${base}`) || 0;
    nameSeen.set(`${entity.kind}:${base}`, seen + 1);
    const suffix = seen === 0 ? '' : `__${seen + 1}`;
    const filename = `${base}${suffix}${ext}`;

    const abs = path.join(kindDir, filename);
    fs.writeFileSync(abs, `${entity.code}\n`, 'utf8');

    written.push({
      ...entity,
      file: path.relative(outputDir, abs).replace(/\\/g, '/')
    });
  }

  const index = {
    source: path.resolve(xmlPath),
    generatedAt: new Date().toISOString(),
    total: written.length,
    byKind: written.reduce((acc, e) => {
      acc[e.kind] = (acc[e.kind] || 0) + 1;
      return acc;
    }, {}),
    entities: written.map(({ code, ...rest }) => rest)
  };

  fs.writeFileSync(path.join(outputDir, 'index.json'), `${JSON.stringify(index, null, 2)}\n`, 'utf8');

  const nameMap = {};
  for (const e of written) {
    if (!nameMap[e.name]) nameMap[e.name] = [];
    nameMap[e.name].push({
      kind: e.kind,
      file: e.file,
      startLine: e.startLine,
      endLine: e.endLine,
      id: e.id
    });
  }
  fs.writeFileSync(path.join(outputDir, 'by-name.json'), `${JSON.stringify(nameMap, null, 2)}\n`, 'utf8');

  console.log(`Indexed ${written.length} entities into ${outputDir}`);
}

function loadIndex(indexPath) {
  return JSON.parse(fs.readFileSync(indexPath, 'utf8'));
}

function list(pattern, indexPath) {
  const idx = loadIndex(indexPath);
  const p = (pattern || '').toLowerCase();
  const rows = idx.entities.filter((e) => {
    if (!p) return true;
    return e.name.toLowerCase().includes(p) || e.kind.toLowerCase().includes(p);
  });

  for (const e of rows) {
    console.log(`${e.kind}\t${e.name}\t${e.file}\t${e.startLine}-${e.endLine}`);
  }
  console.log(`Total: ${rows.length}`);
}

function getByName(name, indexPath) {
  const idx = loadIndex(indexPath);
  const rows = idx.entities.filter((e) => e.name.toLowerCase() === name.toLowerCase());
  if (rows.length === 0) {
    console.error(`No entity found by name: ${name}`);
    process.exitCode = 1;
    return;
  }

  for (const e of rows) {
    console.log(JSON.stringify(e, null, 2));
  }
}

function main() {
  const cmd = process.argv[2];
  const defaultXml = path.resolve('cos-mis/full_src/all.xml');
  const defaultOut = path.resolve('cos-mis/full_src/indexed');
  const defaultIndex = path.resolve('cos-mis/full_src/indexed/index.json');

  if (!cmd || cmd === '--help' || cmd === '-h') {
    usage();
    return;
  }

  if (cmd === 'build') {
    const xmlPath = path.resolve(process.argv[3] || defaultXml);
    const outputDir = path.resolve(process.argv[4] || defaultOut);
    build(xmlPath, outputDir);
    return;
  }

  if (cmd === 'list') {
    const pattern = process.argv[3] || '';
    const indexPath = path.resolve(process.argv[4] || defaultIndex);
    list(pattern, indexPath);
    return;
  }

  if (cmd === 'get') {
    const name = process.argv[3];
    if (!name) {
      usage();
      process.exitCode = 1;
      return;
    }
    const indexPath = path.resolve(process.argv[4] || defaultIndex);
    getByName(name, indexPath);
    return;
  }

  usage();
  process.exitCode = 1;
}

main();
