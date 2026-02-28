import crypto from 'node:crypto';
import { z } from 'zod';
import { normalizeNewCaseInput } from '../nlp/normalize.js';

const analysisSchema = z.object({
  risk_level: z.enum(['low', 'medium', 'high']),
  missing_anamnesis: z.array(z.string()).default([]),
  missing_complaints: z.array(z.string()).default([]),
  recommended_questions: z.array(z.string()).default([]),
  reasoning: z.string().default('')
});

function genRunId(payload) {
  return crypto
    .createHash('sha256')
    .update(JSON.stringify(payload))
    .digest('hex')
    .slice(0, 20);
}

export class CaseAnalysisService {
  constructor({ repository, vectorStore, openRouterClient, diagnosisPatternService, logger, config }) {
    this.repository = repository;
    this.vectorStore = vectorStore;
    this.openRouterClient = openRouterClient;
    this.diagnosisPatternService = diagnosisPatternService;
    this.logger = logger;
    this.config = config;
  }

  async analyzeNewCase({ diagnosis = [], text = '', complaints = '', anamnesis = '' }) {
    const normalized = normalizeNewCaseInput({ diagnosis, text, complaints, anamnesis });

    const vector = await this.openRouterClient.embedOne(normalized.text);

    const nearest = await this.vectorStore.querySimilar(vector, {
      k: this.config.topK,
      diagnosisCodes: normalized.diagnosisCodes
    });

    const ids = nearest.map((item) => item.id);
    const docs = this.repository.getDocumentsByIds(ids);
    const docsMap = new Map(docs.map((doc) => [doc.sampleId, doc]));

    const contextDocs = nearest
      .map((item) => ({
        ...docsMap.get(item.id),
        score: item.score
      }))
      .filter((item) => Boolean(item?.sampleId))
      .slice(0, this.config.contextDocLimit);

    let pattern = this.repository.getDiagnosisPattern(normalized.diagnosisKey)?.pattern || null;
    if (!pattern && normalized.diagnosisCodes.length) {
      const generated = await this.diagnosisPatternService.refreshPattern(normalized.diagnosisCodes);
      pattern = generated?.pattern || null;
    }

    const llmResult = await this.openRouterClient.analyzeCase({
      diagnosisCodes: normalized.diagnosisCodes,
      caseText: normalized.text,
      contextDocs,
      pattern
    });

    const parsed = analysisSchema.safeParse(llmResult.json);
    if (!parsed.success) {
      this.logger.error('Invalid LLM analysis JSON', {
        issues: parsed.error.issues,
        raw: llmResult.rawText
      });
      throw new Error('Model returned invalid analysis schema');
    }

    const runId = genRunId({
      diagnosisCodes: normalized.diagnosisCodes,
      text: normalized.text,
      time: Date.now()
    });

    const result = {
      runId,
      diagnosisCodes: normalized.diagnosisCodes,
      riskLevel: parsed.data.risk_level,
      missingAnamnesis: parsed.data.missing_anamnesis,
      missingComplaints: parsed.data.missing_complaints,
      recommendedQuestions: parsed.data.recommended_questions,
      reasoning: parsed.data.reasoning,
      contextUsed: contextDocs.map((doc) => ({
        sampleId: doc.sampleId,
        sourceDate: doc.sourceDate,
        sourceName: doc.sourceName,
        score: doc.score
      })),
      llmModel: llmResult.model
    };

    this.repository.saveAnalysisRun({
      runId,
      diagnosisCodes: normalized.diagnosisCodes,
      inputText: normalized.text,
      context: result.contextUsed,
      model: llmResult.model,
      output: result
    });

    return result;
  }
}
