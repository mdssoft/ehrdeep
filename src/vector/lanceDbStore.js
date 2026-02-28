function hasDiagnosisOverlap(rowDiagnosisCodes, diagnosisCodes) {
  if (!diagnosisCodes?.length) {
    return true;
  }

  const set = new Set(rowDiagnosisCodes || []);
  return diagnosisCodes.some((code) => set.has(code));
}

function escapeSingleQuotes(value) {
  return String(value).replace(/'/g, "''");
}

export class LanceDbStore {
  constructor({ dir, dimension, logger }) {
    this.dir = dir;
    this.dimension = dimension;
    this.logger = logger;
    this.tableName = 'ehr_vectors';
    this.table = null;
    this.initialized = false;
  }

  async init() {
    if (this.initialized) {
      return;
    }

    let lancedb;
    try {
      lancedb = await import('@lancedb/lancedb');
    } catch (error) {
      throw new Error(`LanceDB package is not available. Install optional dependency @lancedb/lancedb. ${error.message}`);
    }

    this.db = await lancedb.connect(this.dir);

    const tableNames = await this.db.tableNames();
    if (tableNames.includes(this.tableName)) {
      this.table = await this.db.openTable(this.tableName);
      this.initialized = true;
      return;
    }

    const seed = {
      id: '__seed__',
      vector: Array.from({ length: this.dimension }, () => 0),
      diagnosisCodesJson: '[]',
      diagnosisKey: '',
      metadataJson: '{}'
    };

    this.table = await this.db.createTable(this.tableName, [seed]);
    if (typeof this.table.delete === 'function') {
      await this.table.delete("id = '__seed__'");
    }

    this.initialized = true;
  }

  async upsertMany(items) {
    if (!items.length) {
      return;
    }

    await this.init();

    if (typeof this.table.delete === 'function') {
      for (const item of items) {
        await this.table.delete(`id = '${escapeSingleQuotes(item.id)}'`);
      }
    }

    const records = items.map((item) => ({
      id: item.id,
      vector: item.vector,
      diagnosisCodesJson: JSON.stringify(item.diagnosisCodes || []),
      diagnosisKey: item.diagnosisKey || '',
      metadataJson: JSON.stringify(item.metadata || {})
    }));

    await this.table.add(records);
  }

  async querySimilar(vector, { k = 12, diagnosisCodes = [] } = {}) {
    await this.init();

    let query;
    if (typeof this.table.vectorSearch === 'function') {
      query = this.table.vectorSearch(vector);
    } else if (typeof this.table.search === 'function') {
      query = this.table.search(vector);
    } else if (typeof this.table.query === 'function') {
      query = this.table.query().nearestTo(vector);
    } else {
      throw new Error('Unsupported LanceDB query API in installed SDK version');
    }

    if (typeof query.limit === 'function') {
      query = query.limit(Math.max(k * 6, 50));
    }

    let rows;
    if (typeof query.toArray === 'function') {
      rows = await query.toArray();
    } else if (typeof query.toList === 'function') {
      rows = await query.toList();
    } else if (typeof query.execute === 'function') {
      rows = await query.execute();
    } else {
      throw new Error('Unsupported LanceDB result API in installed SDK version');
    }

    const normalized = rows
      .filter((row) => {
        const rowDiagnosis = JSON.parse(row.diagnosisCodesJson || '[]');
        return hasDiagnosisOverlap(rowDiagnosis, diagnosisCodes);
      })
      .map((row) => ({
        id: row.id,
        score: Number(row._distance ?? row.distance ?? 0),
        metadata: JSON.parse(row.metadataJson || '{}')
      }));

    // If score is distance, smaller is better. Convert to similarity-like descending scale.
    normalized.sort((a, b) => a.score - b.score);

    return normalized.slice(0, k).map((item) => ({
      ...item,
      score: 1 / (1 + item.score)
    }));
  }

  async deleteByIds(ids = []) {
    if (!ids.length) {
      return;
    }

    await this.init();

    if (typeof this.table.delete !== 'function') {
      this.logger.warn('LanceDB SDK does not expose table.delete; deleteByIds skipped');
      return;
    }

    for (const id of ids) {
      await this.table.delete(`id = '${escapeSingleQuotes(id)}'`);
    }
  }

  async close() {
    this.table = null;
    this.db = null;
    this.initialized = false;
  }
}
