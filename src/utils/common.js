import fs from 'node:fs';
import path from 'node:path';

export function ensureParentDir(filePath) {
  const dir = path.dirname(path.resolve(filePath));
  fs.mkdirSync(dir, { recursive: true });
}

export function withTimeout(promiseFactory, timeoutMs, onTimeoutMessage = 'Operation timed out') {
  const controller = new AbortController();
  const timeout = setTimeout(() => controller.abort(new Error(onTimeoutMessage)), timeoutMs);

  return promiseFactory(controller.signal)
    .finally(() => clearTimeout(timeout));
}

export function chunkArray(input, chunkSize) {
  const output = [];
  for (let i = 0; i < input.length; i += chunkSize) {
    output.push(input.slice(i, i + chunkSize));
  }
  return output;
}

export function nowIso() {
  return new Date().toISOString();
}
