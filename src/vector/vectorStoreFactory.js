import { SqliteVecStore } from './sqliteVecStore.js';
import { LanceDbStore } from './lanceDbStore.js';

class AsyncVectorStoreAdapter {
  constructor(store) {
    this.store = store;
  }

  async upsertMany(items) {
    return this.store.upsertMany(items);
  }

  async querySimilar(vector, options) {
    return this.store.querySimilar(vector, options);
  }

  async deleteByIds(ids) {
    return this.store.deleteByIds(ids);
  }

  async close() {
    if (typeof this.store.close === 'function') {
      await this.store.close();
    }
  }
}

export function createVectorStore(config, logger) {
  const engine = config.engine;

  if (engine === 'sqlite') {
    const store = new SqliteVecStore({
      dbPath: config.vectorDbPath,
      dimension: config.dimension,
      sqliteVecExtensionPath: config.sqliteVecExtensionPath,
      logger
    });

    return new AsyncVectorStoreAdapter(store);
  }

  if (engine === 'lance') {
    const store = new LanceDbStore({
      dir: config.lanceDir,
      dimension: config.dimension,
      logger
    });

    return new AsyncVectorStoreAdapter(store);
  }

  throw new Error(`Unsupported vector DB engine: ${engine}`);
}
