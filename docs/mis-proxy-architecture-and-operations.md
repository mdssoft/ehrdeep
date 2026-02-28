# MIS Proxy: Architecture, Security, and Test Report

## 1. Goal

Add an auxiliary proxy transport that connects two isolated security zones:

- Zone A: service client (`ehrdeep`) without direct MIS access.
- Zone B: MIS environment with local-only MIS endpoint.

Required transport:

`Zone A client -> public proxy -> Zone B agent -> MIS`

Implemented as a standalone module in [`mis-proxy/`](../mis-proxy/README.md).

## 2. Implemented Architecture

### 2.1. Public proxy server

File: `mis-proxy/src/proxyServer.js`

- Public HTTP endpoint with routes:
  - `POST /agent/register`
  - `POST /agent/heartbeat`
  - `GET /agent/pull`
  - `POST /agent/respond`
  - `ANY /proxy/:target/*`
  - `GET /healthz`
- Keeps in-memory queues by `targetId`.
- Supports multiple clients and multiple MIS targets simultaneously.
- Uses long-poll for agent delivery.

### 2.2. MIS-side agent

File: `mis-proxy/src/agentClient.js`

- Runs inside MIS network.
- Opens outbound connection to public proxy.
- Pulls proxy jobs and forwards to local MIS URL (`MIS_LOCAL_BASE_URL`).
- Sends full upstream HTTP response back to proxy.
- Retries MIS transport failures up to 5 attempts (configurable), with increasing backoff from 5s to 60s by default.
- Stores last MIS request execution state and caches successful results by `requestId` to avoid duplicate MIS execution on repeated delivery.
- Supports optional durable persistence on built-in `node:sqlite` (when runtime supports it).

### 2.3. Client-side gateway

File: `mis-proxy/src/clientGateway.js`

- Runs near `ehrdeep`.
- Exposes local HTTP endpoint compatible with existing `MisClient`.
- Adds proxy credentials and forwards traffic to public proxy.

## 3. Security Measures Implemented

- Secret key auth:
  - Agent credentials are bound to `targetId`.
  - Client credentials are bound to allowed target list.
- Constant-time secret comparisons.
- Request rate-limiting:
  - per source IP
  - per client ID
- Queue limit per target.
- Max request payload enforcement.
- Agent session liveness timeout and stale-session cleanup.
- Proxy/internal header filtering.
- Request timeouts and structured error responses for edge failures.
- MIS retry and dedupe logic in agent:
  - retries only when MIS transport call fails (connection/timeout-level failure);
  - stops retries immediately after first successful MIS response;
  - duplicate `requestId` after success is served from cache without re-calling MIS.
- Runtime compatibility:
  - SQLite persistence is enabled only when explicitly configured and when built-in `node:sqlite` is available.
  - If current Node.js runtime does not provide `node:sqlite`, persistence mode is unavailable and agent uses in-memory mode.

## 4. Edge Cases Covered

- No connected agent for target -> queued request timeout (`504`).
- Unknown/mismatched credentials -> `401`.
- Target not allowed for client -> `401`.
- Target queue overload -> `503`.
- Rate limit exceeded -> `429` + `retry-after`.
- Oversized payload -> `413`.
- Stale/disconnected agent session -> `410` (for pending pull).
- Client abort during wait -> pending request cleanup.
- Broken proxy<->MIS connection in MIS zone:
  - agent stores last request state,
  - retries up to 5 attempts with incremental backoff,
  - succeeds automatically when MIS connectivity is restored within retry window.
- Duplicate delivery of already successful `requestId`:
  - response is resent from success cache,
  - MIS endpoint is not executed again.

## 5. Local Test Strategy

Automated integration tests added in:

- `test/mis-proxy.integration.test.js`

Covered scenarios:

1. End-to-end path with existing `src/mis/misClient.js`.
2. Multi-target routing to multiple MIS instances.
3. Security and DDoS baseline controls (auth + rate-limit).
4. Retry after MIS connection recovery.
5. Duplicate-delivery dedupe (no re-execution after success).

Local smoke script with fixed proxy port `17800`:

- `mis-proxy/scripts/local-smoke.js`
- Run with `npm run proxy:smoke`

Port layout used by smoke:

- MIS mock: `18081`
- Proxy: `17800`
- Client gateway: dynamic free port (`127.0.0.1:<port>`)

This satisfies the requirement to run proxy on a port different from MIS.

## 6. Operational Notes

- For production, deploy proxy behind TLS reverse-proxy with IP filtering.
- Keep key material in a secret manager, rotate regularly.
- Add upstream DDoS service/WAF for internet-exposed proxy.
- Consider moving in-memory queues/sessions to Redis for horizontal scaling.
