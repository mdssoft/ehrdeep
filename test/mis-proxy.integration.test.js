import http from 'node:http';
import fs from 'node:fs';
import os from 'node:os';
import path from 'node:path';
import test from 'node:test';
import assert from 'node:assert/strict';
import { MisClient } from '../src/mis/misClient.js';
import { MisProxyServer, MisProxyAgentClient, MisProxyClientGateway } from '../mis-proxy/src/index.js';

function createSilentLogger() {
  return {
    debug: () => {},
    info: () => {},
    warn: () => {},
    error: () => {}
  };
}

function delay(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function tempDir(prefix = 'mis-proxy-test-') {
  return fs.mkdtempSync(path.join(os.tmpdir(), prefix));
}

async function waitFor(predicate, { timeoutMs = 3000, intervalMs = 25 } = {}) {
  const deadline = Date.now() + timeoutMs;
  while (Date.now() < deadline) {
    if (predicate()) {
      return;
    }
    await delay(intervalMs);
  }
  throw new Error('waitFor timeout');
}

async function startHttpServer(handler, { host = '127.0.0.1', port = 0 } = {}) {
  const server = http.createServer(handler);
  await new Promise((resolve, reject) => {
    server.once('error', reject);
    server.listen(port, host, () => {
      server.off('error', reject);
      resolve();
    });
  });

  const address = server.address();
  if (!address || typeof address === 'string') {
    throw new Error('Could not resolve started server address');
  }

  return {
    server,
    host: address.address,
    port: address.port,
    async close() {
      await new Promise((resolve) => server.close(() => resolve()));
    }
  };
}

async function createMockMisServer({ username, password, docPrefix, port = 0 }) {
  const requests = [];
  const serverRef = await startHttpServer((req, res) => {
    const auth = req.headers.authorization || '';
    requests.push({
      method: req.method || 'GET',
      url: req.url || '/',
      authorization: auth
    });

    const expectedAuth = `Basic ${Buffer.from(`${username}:${password}`).toString('base64')}`;
    if (auth !== expectedAuth) {
      const body = Buffer.from('Unauthorized', 'utf8');
      res.writeHead(401, {
        'content-type': 'text/plain; charset=utf-8',
        'content-length': String(body.length)
      });
      res.end(body);
      return;
    }

    const urlObj = new URL(req.url || '/', 'http://localhost');
    if (!/^\/AUTH\/zWS\d{4}\/ANONDOCS_MECRAG$/.test(urlObj.pathname)) {
      const body = Buffer.from('Not found', 'utf8');
      res.writeHead(404, {
        'content-type': 'text/plain; charset=utf-8',
        'content-length': String(body.length)
      });
      res.end(body);
      return;
    }

    const payload = {
      items: [
        {
          sample_id: `${docPrefix}-sample-1`,
          patient_ref: `${docPrefix}-patient-1`,
          doc_id: `${docPrefix}-doc-1`,
          doc_date: '2026-02-28',
          doc_name: `${docPrefix}-epicrisis`,
          diag_primary: 'K74.6',
          diag_all: 'K74.6',
          complaints: `complaints-${docPrefix}`,
          anamnesis: `anamnesis-${docPrefix}`,
          findings: `findings-${docPrefix}`
        }
      ],
      nextCursor: '',
      hasMore: 0
    };

    const body = Buffer.from(JSON.stringify(payload), 'utf8');
    res.writeHead(200, {
      'content-type': 'application/json; charset=utf-8',
      'content-length': String(body.length)
    });
    res.end(body);
  }, { port });

  return {
    ...serverRef,
    requests
  };
}

function createMisClient({ host, port, username, password }) {
  return new MisClient({
    serverIp: host,
    serverPort: port,
    auth: { username, password },
    timeoutMs: 5000,
    docsEndpoint: '/ANONDOCS_MECRAG',
    chunkLimit: 100,
    logger: createSilentLogger()
  });
}

test('mis-proxy e2e chain works through gateway with existing MisClient', async (t) => {
  const misUser = 'mis_user';
  const misPass = 'mis_pass';

  const mockMis = await createMockMisServer({
    username: misUser,
    password: misPass,
    docPrefix: 'target-a'
  });
  t.after(async () => mockMis.close());

  const proxy = new MisProxyServer({
    host: '127.0.0.1',
    port: 0,
    agentKeys: { 'target-a': 'agent-secret-a' },
    clientKeys: { 'gateway-a': { key: 'client-secret-a', targets: ['target-a'] } },
    requestTimeoutMs: 3000,
    logger: createSilentLogger()
  });
  await proxy.start();
  t.after(async () => proxy.stop());

  const proxyAddr = proxy.getAddress();
  const proxyBaseUrl = `http://127.0.0.1:${proxyAddr.port}`;

  const agent = new MisProxyAgentClient({
    proxyBaseUrl,
    misBaseUrl: `http://127.0.0.1:${mockMis.port}`,
    targetId: 'target-a',
    agentId: 'agent-a-1',
    agentKey: 'agent-secret-a',
    heartbeatMs: 5000,
    pollRetryMs: 50,
    logger: createSilentLogger()
  });
  await agent.start();
  t.after(async () => agent.stop());

  const gateway = new MisProxyClientGateway({
    host: '127.0.0.1',
    port: 0,
    proxyBaseUrl,
    targetId: 'target-a',
    clientId: 'gateway-a',
    clientKey: 'client-secret-a',
    allowlist: ['127.0.0.1', '::1'],
    logger: createSilentLogger()
  });
  await gateway.start();
  t.after(async () => gateway.stop());

  const gatewayAddr = gateway.getAddress();
  const misClient = createMisClient({
    host: '127.0.0.1',
    port: gatewayAddr.port,
    username: misUser,
    password: misPass
  });

  const response = await misClient.getAnonymizedDocuments({
    dateFrom: '01.01.2025',
    dateTo: '31.12.2025',
    diagnosis: 'K74.6'
  });

  assert.equal(response.success, true);
  assert.equal(response.data.items.length, 1);
  assert.equal(response.data.items[0].doc_id, 'target-a-doc-1');
  assert.equal(mockMis.requests.length, 1);
  assert.match(mockMis.requests[0].url, /^\/AUTH\/zWS\d{4}\/ANONDOCS_MECRAG\?/);
  assert.ok(mockMis.requests[0].authorization.startsWith('Basic '));
});

test('mis-proxy routes multiple targets to distinct MIS instances', async (t) => {
  const misUser = 'u';
  const misPass = 'p';
  const misA = await createMockMisServer({ username: misUser, password: misPass, docPrefix: 'A' });
  const misB = await createMockMisServer({ username: misUser, password: misPass, docPrefix: 'B' });
  t.after(async () => {
    await misA.close();
    await misB.close();
  });

  const proxy = new MisProxyServer({
    host: '127.0.0.1',
    port: 0,
    agentKeys: { a: 'agent-a', b: 'agent-b' },
    clientKeys: {
      'gateway-a': { key: 'client-a', targets: ['a'] },
      'gateway-b': { key: 'client-b', targets: ['b'] }
    },
    requestTimeoutMs: 3000,
    logger: createSilentLogger()
  });
  await proxy.start();
  t.after(async () => proxy.stop());

  const proxyPort = proxy.getAddress().port;
  const proxyBaseUrl = `http://127.0.0.1:${proxyPort}`;

  const agentA = new MisProxyAgentClient({
    proxyBaseUrl,
    misBaseUrl: `http://127.0.0.1:${misA.port}`,
    targetId: 'a',
    agentId: 'agent-a-1',
    agentKey: 'agent-a',
    logger: createSilentLogger(),
    pollRetryMs: 50
  });
  const agentB = new MisProxyAgentClient({
    proxyBaseUrl,
    misBaseUrl: `http://127.0.0.1:${misB.port}`,
    targetId: 'b',
    agentId: 'agent-b-1',
    agentKey: 'agent-b',
    logger: createSilentLogger(),
    pollRetryMs: 50
  });
  await Promise.all([agentA.start(), agentB.start()]);
  t.after(async () => {
    await Promise.all([agentA.stop(), agentB.stop()]);
  });

  const gatewayA = new MisProxyClientGateway({
    host: '127.0.0.1',
    port: 0,
    proxyBaseUrl,
    targetId: 'a',
    clientId: 'gateway-a',
    clientKey: 'client-a',
    logger: createSilentLogger()
  });
  const gatewayB = new MisProxyClientGateway({
    host: '127.0.0.1',
    port: 0,
    proxyBaseUrl,
    targetId: 'b',
    clientId: 'gateway-b',
    clientKey: 'client-b',
    logger: createSilentLogger()
  });
  await Promise.all([gatewayA.start(), gatewayB.start()]);
  t.after(async () => {
    await Promise.all([gatewayA.stop(), gatewayB.stop()]);
  });

  const clientA = createMisClient({
    host: '127.0.0.1',
    port: gatewayA.getAddress().port,
    username: misUser,
    password: misPass
  });
  const clientB = createMisClient({
    host: '127.0.0.1',
    port: gatewayB.getAddress().port,
    username: misUser,
    password: misPass
  });

  const [responseA, responseB] = await Promise.all([
    clientA.getAnonymizedDocuments({ dateFrom: '01.01.2025', dateTo: '31.12.2025' }),
    clientB.getAnonymizedDocuments({ dateFrom: '01.01.2025', dateTo: '31.12.2025' })
  ]);

  assert.equal(responseA.success, true);
  assert.equal(responseB.success, true);
  assert.equal(responseA.data.items[0].doc_id, 'A-doc-1');
  assert.equal(responseB.data.items[0].doc_id, 'B-doc-1');
  assert.equal(misA.requests.length, 1);
  assert.equal(misB.requests.length, 1);
});

test('mis-proxy rejects unauthorized clients and enforces rate limits', async (t) => {
  const proxy = new MisProxyServer({
    host: '127.0.0.1',
    port: 0,
    agentKeys: { secured: 'agent-key' },
    clientKeys: { trusted: { key: 'trusted-key', targets: ['secured'] } },
    requestTimeoutMs: 50,
    rateLimitWindowMs: 1000,
    rateLimitIpMax: 2,
    rateLimitClientMax: 2,
    logger: createSilentLogger()
  });
  await proxy.start();
  t.after(async () => proxy.stop());

  const proxyUrl = `http://127.0.0.1:${proxy.getAddress().port}`;
  const endpoint = `${proxyUrl}/proxy/secured/AUTH/zWS1111/ANONDOCS_MECRAG`;

  const unauthorized = await fetch(endpoint, {
    method: 'GET',
    headers: {
      'x-proxy-client-id': 'trusted',
      'x-proxy-client-key': 'wrong-key'
    }
  });
  assert.equal(unauthorized.status, 401);

  const first = await fetch(endpoint, {
    method: 'GET',
    headers: {
      'x-proxy-client-id': 'trusted',
      'x-proxy-client-key': 'trusted-key'
    }
  });
  const second = await fetch(endpoint, {
    method: 'GET',
    headers: {
      'x-proxy-client-id': 'trusted',
      'x-proxy-client-key': 'trusted-key'
    }
  });
  const third = await fetch(endpoint, {
    method: 'GET',
    headers: {
      'x-proxy-client-id': 'trusted',
      'x-proxy-client-key': 'trusted-key'
    }
  });

  assert.equal(first.status, 504);
  assert.equal(second.status, 504);
  assert.equal(third.status, 429);
});

test('mis-proxy agent retries MIS request on broken connection and succeeds after recovery', async (t) => {
  const misUser = 'mis_user';
  const misPass = 'mis_pass';

  const reserved = await startHttpServer(() => {}, { host: '127.0.0.1', port: 0 });
  const misPort = reserved.port;
  await reserved.close();

  let recoveredMis = null;
  const recoveredMisStart = (async () => {
    await delay(45);
    recoveredMis = await createMockMisServer({
      username: misUser,
      password: misPass,
      docPrefix: 'recovered',
      port: misPort
    });
  })();
  t.after(async () => {
    await recoveredMisStart;
    if (recoveredMis) {
      await recoveredMis.close();
    }
  });

  const proxy = new MisProxyServer({
    host: '127.0.0.1',
    port: 0,
    agentKeys: { recovery: 'agent-recovery-key' },
    clientKeys: { recoveryClient: { key: 'client-recovery-key', targets: ['recovery'] } },
    requestTimeoutMs: 2000,
    logger: createSilentLogger()
  });
  await proxy.start();
  t.after(async () => proxy.stop());

  const proxyBaseUrl = `http://127.0.0.1:${proxy.getAddress().port}`;

  const agent = new MisProxyAgentClient({
    proxyBaseUrl,
    misBaseUrl: `http://127.0.0.1:${misPort}`,
    targetId: 'recovery',
    agentId: 'recovery-agent-1',
    agentKey: 'agent-recovery-key',
    requestTimeoutMs: 80,
    misMaxAttempts: 5,
    misRetryDelayStartMs: 10,
    misRetryDelayMaxMs: 60,
    pollRetryMs: 25,
    errorBackoffMs: 25,
    heartbeatMs: 5000,
    logger: createSilentLogger()
  });
  await agent.start();
  t.after(async () => agent.stop());

  const gateway = new MisProxyClientGateway({
    host: '127.0.0.1',
    port: 0,
    proxyBaseUrl,
    targetId: 'recovery',
    clientId: 'recoveryClient',
    clientKey: 'client-recovery-key',
    allowlist: ['127.0.0.1', '::1'],
    logger: createSilentLogger()
  });
  await gateway.start();
  t.after(async () => gateway.stop());

  const misClient = createMisClient({
    host: '127.0.0.1',
    port: gateway.getAddress().port,
    username: misUser,
    password: misPass
  });

  const response = await misClient.getAnonymizedDocuments({
    dateFrom: '01.01.2025',
    dateTo: '31.12.2025',
    diagnosis: 'K74.6'
  });

  await recoveredMisStart;

  assert.equal(response.success, true);
  assert.equal(response.data.items[0].doc_id, 'recovered-doc-1');
  assert.ok(recoveredMis.requests.length >= 1);
  assert.ok((agent.lastMisRequestState?.attempt || 1) > 1);
});

test('mis-proxy agent does not re-execute MIS request after successful duplicate delivery', async (t) => {
  let misCallCount = 0;
  const misServer = await startHttpServer((req, res) => {
    misCallCount += 1;
    const body = Buffer.from('OK', 'utf8');
    res.writeHead(200, {
      'content-type': 'text/plain; charset=utf-8',
      'content-length': String(body.length)
    });
    res.end(body);
  });
  t.after(async () => misServer.close());

  const requestId = 'dup-req-1';
  const job = {
    requestId,
    method: 'GET',
    path: '/AUTH/zWS1234/ANONDOCS_MECRAG?p1=%30%31',
    headers: {
      authorization: `Basic ${Buffer.from('mis:pwd').toString('base64')}`
    },
    bodyBase64: ''
  };

  let pullCount = 0;
  let respondCount = 0;
  const receivedPayloads = [];

  const proxyMock = await startHttpServer(async (req, res) => {
    if (req.url === '/agent/register' || req.url === '/agent/heartbeat') {
      res.writeHead(200, { 'content-type': 'application/json; charset=utf-8' });
      res.end('{"ok":true}');
      return;
    }

    if (req.url === '/agent/pull') {
      pullCount += 1;
      if (pullCount <= 2) {
        const body = Buffer.from(JSON.stringify(job), 'utf8');
        res.writeHead(200, {
          'content-type': 'application/json; charset=utf-8',
          'content-length': String(body.length)
        });
        res.end(body);
        return;
      }

      res.writeHead(204);
      res.end();
      return;
    }

    if (req.url === '/agent/respond') {
      const chunks = [];
      for await (const chunk of req) {
        chunks.push(chunk);
      }

      const payload = JSON.parse(Buffer.concat(chunks).toString('utf8'));
      receivedPayloads.push(payload);
      respondCount += 1;

      if (respondCount === 1) {
        res.writeHead(500, { 'content-type': 'text/plain; charset=utf-8' });
        res.end('temporary send failure');
        return;
      }

      res.writeHead(200, { 'content-type': 'application/json; charset=utf-8' });
      res.end('{"ok":true}');
      return;
    }

    res.writeHead(404, { 'content-type': 'text/plain; charset=utf-8' });
    res.end('not found');
  });
  t.after(async () => proxyMock.close());

  const agent = new MisProxyAgentClient({
    proxyBaseUrl: `http://127.0.0.1:${proxyMock.port}`,
    misBaseUrl: `http://127.0.0.1:${misServer.port}`,
    targetId: 'dup-target',
    agentId: 'dup-agent',
    agentKey: 'dup-key',
    pollRetryMs: 15,
    errorBackoffMs: 15,
    heartbeatMs: 10000,
    misMaxAttempts: 5,
    misRetryDelayStartMs: 10,
    misRetryDelayMaxMs: 30,
    logger: createSilentLogger()
  });
  await agent.start();
  t.after(async () => agent.stop());

  await waitFor(() => respondCount >= 2, { timeoutMs: 2500, intervalMs: 20 });

  assert.equal(misCallCount, 1);
  assert.equal(receivedPayloads.length, 2);
  assert.equal(receivedPayloads[0].requestId, requestId);
  assert.equal(receivedPayloads[1].requestId, requestId);
  assert.equal(receivedPayloads[0].statusCode, 200);
  assert.equal(receivedPayloads[1].statusCode, 200);
});

test('mis-proxy agent uses persistent sqlite cache across restart when enabled', async (t) => {
  try {
    await import('node:sqlite');
  } catch {
    t.skip('node:sqlite is not available in this runtime');
    return;
  }

  let misCallCount = 0;
  const misServer = await startHttpServer((req, res) => {
    misCallCount += 1;
    const body = Buffer.from('OK', 'utf8');
    res.writeHead(200, {
      'content-type': 'text/plain; charset=utf-8',
      'content-length': String(body.length)
    });
    res.end(body);
  });
  t.after(async () => misServer.close());

  const tmp = tempDir('mis-proxy-sqlite-');
  const sqliteDbPath = path.join(tmp, 'agent-cache.sqlite');
  const job = {
    requestId: 'persistent-req-1',
    method: 'GET',
    path: '/AUTH/zWS1234/ANONDOCS_MECRAG?p1=%30%31',
    headers: {
      authorization: `Basic ${Buffer.from('mis:pwd').toString('base64')}`
    },
    bodyBase64: ''
  };

  const agent1 = new MisProxyAgentClient({
    proxyBaseUrl: 'http://127.0.0.1:1',
    misBaseUrl: `http://127.0.0.1:${misServer.port}`,
    targetId: 'persist-target',
    agentId: 'persist-agent-1',
    agentKey: 'persist-key',
    sqlitePersistenceEnabled: true,
    sqliteDbPath,
    logger: createSilentLogger()
  });
  agent1._sendProxyResponse = async () => true;
  await agent1._handleJob(job);
  await agent1.stop();

  assert.equal(misCallCount, 1);
  assert.equal(agent1.persistenceMode, 'sqlite');

  const agent2 = new MisProxyAgentClient({
    proxyBaseUrl: 'http://127.0.0.1:1',
    misBaseUrl: `http://127.0.0.1:${misServer.port}`,
    targetId: 'persist-target',
    agentId: 'persist-agent-2',
    agentKey: 'persist-key',
    sqlitePersistenceEnabled: true,
    sqliteDbPath,
    logger: createSilentLogger()
  });
  agent2._sendProxyResponse = async () => true;
  await agent2._handleJob(job);
  await agent2.stop();

  assert.equal(agent2.persistenceMode, 'sqlite');
  assert.equal(misCallCount, 1);
});
