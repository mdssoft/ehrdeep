import iconv from 'iconv-lite';

function percentEncodeWin1251(value) {
  const encodedBuffer = iconv.encode(String(value), 'win1251');
  return Array.from(encodedBuffer)
    .map((byte) => `%${byte.toString(16).padStart(2, '0').toUpperCase()}`)
    .join('');
}

function normalizeEndpoint(endpoint) {
  return endpoint.startsWith('/') ? endpoint : `/${endpoint}`;
}

function safeJsonParse(text) {
  try {
    return JSON.parse(text);
  } catch {
    return null;
  }
}

export class MisClient {
  constructor({ serverIp, serverPort, auth, timeoutMs, docsEndpoint, chunkLimit = 100, logger }) {
    this.serverIp = serverIp;
    this.serverPort = serverPort;
    this.auth = auth;
    this.timeoutMs = timeoutMs;
    this.docsEndpoint = normalizeEndpoint(docsEndpoint);
    this.chunkLimit = chunkLimit;
    this.logger = logger;
  }

  async request(endpoint, params = {}) {
    const random = Math.floor(Math.random() * 8999) + 1000;
    const safeEndpoint = normalizeEndpoint(endpoint);
    const queryString = Object.entries(params)
      .map(([key, value]) => `${encodeURIComponent(key)}=${percentEncodeWin1251(value)}`)
      .join('&');

    const baseUrl = `http://${this.serverIp}:${this.serverPort}/AUTH/zWS${random}${safeEndpoint}`;
    const url = `${baseUrl}?${queryString}`;

    const authHeader = Buffer
      .from(`${this.auth.username}:${this.auth.password}`)
      .toString('base64');

    const controller = new AbortController();
    const timer = setTimeout(() => controller.abort(new Error('MIS timeout')), this.timeoutMs);

    try {
      const response = await fetch(url, {
        method: 'GET',
        headers: {
          Authorization: `Basic ${authHeader}`
        },
        signal: controller.signal
      });

      if (!response.ok) {
        throw new Error(`MIS HTTP ${response.status}`);
      }

      const contentType = response.headers.get('content-type') || '';
      const buffer = Buffer.from(await response.arrayBuffer());
      const isWin1251 = contentType.includes('windows-1251') || !contentType.includes('charset=');
      const body = isWin1251 ? iconv.decode(buffer, 'win1251') : buffer.toString('utf8');

      return {
        success: true,
        data: {
          body,
          contentType
        }
      };
    } catch (error) {
      this.logger.error('MIS request failed', { endpoint: safeEndpoint, error: error.message });
      return {
        success: false,
        error: {
          message: 'MIS request failed',
          details: error.message
        }
      };
    } finally {
      clearTimeout(timer);
    }
  }

  async getAnonymizedDocuments({ dateFrom = '', dateTo = '', cursor = '', limit = 100, diagnosis = '' } = {}) {
    const response = await this.request(this.docsEndpoint, {
      p1: dateFrom,
      p2: dateTo,
      p3: Math.min(Number(limit) || 100, 1000),
      p4: cursor,
      p5: diagnosis
    });

    if (!response.success) {
      return response;
    }

    const payload = safeJsonParse(response.data.body);
    if (!payload || !Array.isArray(payload.items)) {
      this.logger.warn('MIS ANONDOCS payload is not valid JSON list', {
        sample: response.data.body.slice(0, 256)
      });
      return {
        success: false,
        error: {
          message: 'Unexpected ANONDOCS payload format'
        }
      };
    }

    return {
      success: true,
      data: {
        items: payload.items,
        nextCursor: payload.nextCursor || '',
        hasMore: Boolean(payload.hasMore)
      }
    };
  }
}
