# ehrdeep

Production foundation for medical text pattern analytics:

- MIS (Cache Object Script) -> anonymized document export
- NLP normalization + de-identification
- Vector storage abstraction (`sqlite` or `lance`)
- OpenRouter (`qwen 2.5 / qwen 3`) for pattern generation and case analysis
- Persistent audit storage in SQLite

## 1. Quick start

```bash
cp .env.example .env
npm install
npm run ingest -- --date-from 01.01.2025 --date-to 31.12.2025
npm run pattern -- --diagnosis K74.6
npm run analyze -- --text-file ./sample-new-case.txt --diagnosis K74.6
```

## 2. Main modules

- `src/mis/misClient.js`: HTTP integration with MIS endpoint `/ANONDOCS_MECRAG`.
- `src/pipeline/datasetIngestionService.js`: ingestion and indexing pipeline.
- `src/nlp/normalize.js`: normalization and extra de-identification.
- `src/vector/*`: universal vector DB layer (SQLite/cosine and optional LanceDB).
- `src/ai/openRouterClient.js`: OpenRouter API client (`/chat/completions`, `/embeddings`).
- `src/analysis/*`: diagnosis pattern generation and new-case analysis.
- `src/storage/sqliteRepository.js`: persistent storage for docs, patterns, and analysis runs.

## 3. COS routine

Added new routine: `cos-mis/MECRAG.int`

Entry point expected by Node service:

- `ANONDOCS_MECRAG` (label `ANONDOCS`) 

Parameters:

- `p1`: date from (`DD.MM.YYYY`)
- `p2`: date to (`DD.MM.YYYY`)
- `p3`: limit
- `p4`: cursor (`NI|ID`)
- `p5`: diagnosis filter (optional, comma-separated ICD)

Response: JSON object

```json
{
  "items": [
    {
      "sample_id": "...",
      "patient_ref": "...",
      "doc_id": "...",
      "doc_date": "...",
      "doc_name": "...",
      "diag_primary": "...",
      "diag_all": "...",
      "complaints": "...",
      "anamnesis": "...",
      "findings": "..."
    }
  ],
  "nextCursor": "NI|ID",
  "hasMore": 0
}
```

## 4. Method plan and critique

See `docs/analysis-method-plan.md`.

Additional detailed method docs:

- `docs/nlp-normalization-method.md`
- `docs/pattern-layer-method.md`
- `docs/task-understanding-and-architecture-decisions.md`

## 5. Notes

- For production with `sqlite-vec`, set `SQLITE_VEC_EXTENSION_PATH`.
- For `lance`, set `VECTOR_DB_ENGINE=lance` and install optional dependency.
- OpenRouter model can be switched to `qwen` variants through `.env`.
- MIS proxy utilities for isolated-network deployments are available in `mis-proxy/` (see `mis-proxy/README.md`).

## 6. OpenRouter model roles

The project keeps three OpenRouter model variables by design:

- `OPENROUTER_MODEL`: default LLM fallback. Used as a common baseline when a specific model is not set for a task.
- `OPENROUTER_ANALYSIS_MODEL`: clinical reasoning model for checklist/pattern generation and new-case gap analysis (`/chat/completions`).
- `OPENROUTER_EMBEDDING_MODEL`: embedding model for vectorization and retrieval quality (`/embeddings`).

Why split them:

- Cost control: embeddings are high-volume calls, reasoning calls are lower-volume but require stronger instruction-following.
- Quality control: best embedding model is often different from best reasoning model.
- Operational flexibility: you can upgrade/tune one part (retrieval or analysis) without changing the other and without retraining data.

Per-model connections and keys:

- Default model connection: `OPENROUTER_MODEL` + `OPENROUTER_DEFAULT_BASE_URL` + `OPENROUTER_DEFAULT_API_KEY`
- Analysis model connection: `OPENROUTER_ANALYSIS_MODEL` + `OPENROUTER_ANALYSIS_BASE_URL` + `OPENROUTER_ANALYSIS_API_KEY`
- Embedding model connection: `OPENROUTER_EMBEDDING_MODEL` + `OPENROUTER_EMBEDDING_BASE_URL` + `OPENROUTER_EMBEDDING_API_KEY`

If `*_BASE_URL` is empty, `OPENROUTER_BASE_URL` is used.
If `*_API_KEY` is empty, legacy `OPENROUTER_API_KEY` is used.

## 7. MIS proxy utilities

Additional tools for secure bridging between isolated MIS and client zones:

- `npm run proxy:server`
- `npm run proxy:agent`
- `npm run proxy:gateway`
- `npm run proxy:smoke` (local end-to-end smoke, proxy on `17800`)

Detailed setup and security notes:

- `mis-proxy/README.md`
- `docs/mis-proxy-architecture-and-operations.md`
