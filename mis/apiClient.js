// apiClient.js
import iconv from 'iconv-lite';
import { getLogger } from '@server/utils/logger.js';
import { Agent } from 'undici';

const logger = getLogger('mis');

export function createApiClient(config) {
  if (!config || !config.server_ip || !config.server_port || !config.auth) {
    throw new Error('Конфигурация API клиента предоставлена не полностью. Требуются server_ip, server_port и auth.');
  }

  const { server_ip, server_port, auth } = config;
  let isBlocked = false;
  let lastError = null;

  const maxConnections = parseInt(process.env.MIS_MAX_CONNECTIONS || '2', 10);
  const dispatcher = new Agent({
    connections: maxConnections,
    keepAliveTimeout: 180000, // 3 minutes
  });

  function logMisError(message, urlWithoutParams) {
    const logMessage = `[MIS] ${message} | ${urlWithoutParams}`;
    console.log(logMessage);
    logger.error(logMessage);
  }

  function getUrlWithoutParams(urlObject) {
    return `${urlObject.origin}${urlObject.pathname}`.replace(/\?$/, '');
  }

  async function _request(method, endpoint, { params = {}, body = null, bodyType = 'text' }) {
    if (isBlocked) {
      return {
        success: false,
        error: {
          message: 'Обмен с MIS остановлен после предыдущей ошибки',
          details: lastError?.message || 'Unknown error',
          statusCode: null,
        },
      };
    }

    const random = Math.floor((Math.random() * 8999) + 1000);
    const baseUrl = `http://${server_ip}:${server_port}/AUTH/zWS${random}${endpoint}`;

    /* w.o. encoding 
    const searchParams = new URLSearchParams(params);
    const fullUrl = `${baseUrl}?${searchParams.toString()}`;*/
    
    let queryString = '';

    // Проверяем, является ли запрос методом GET и есть ли у него параметры
    if (method === 'GET' && Object.keys(params).length > 0) {
      // Вручную собираем строку запроса с кодировкой windows-1251
      queryString = Object.entries(params)
        .map(([key, value]) => {
          // Кодируем значение параметра в буфер windows-1251
          const encodedBuffer = iconv.encode(String(value), 'win1251');
          
          // Преобразуем буфер в строку с процентным кодированием (URL-encoding)
          const percentEncodedValue = Array.from(encodedBuffer)
            .map(byte => '%' + byte.toString(16).padStart(2, '0').toUpperCase())
            .join('');
            
          // Собираем пару "ключ=значение"
          return `${encodeURIComponent(key)}=${percentEncodedValue}`;
        })
        .join('&');
    } else if (Object.keys(params).length > 0) {
      // Для всех остальных методов (POST, PUT и т.д.) используем стандартное поведение
      queryString = new URLSearchParams(params).toString();
    }

    // Собираем итоговый URL, '?' - всегда вставляем тк не запрос файлов, специфика API
    const fullUrl = `${baseUrl}${'?' + (queryString ? queryString : '')}`;
    const urlObj = new URL(fullUrl);
    // WARN повтороное принудительное присвоение '?'
    if(!queryString) urlObj.pathname = urlObj.pathname+'?'
    const urlWithoutParams = getUrlWithoutParams(urlObj);

    
    const authHeader = 'Basic ' + Buffer.from(`${auth.username}:${auth.password}`).toString('base64');
    const headers = {
      'Authorization': authHeader,
    };

    const fetchOptions = {
      method,
      headers,
      dispatcher,
    };

    if ((method === 'POST' || method === 'PUT') && body) {
      if (bodyType === 'json') {
        headers['Content-Type'] = 'application/json; charset=utf-8';
        fetchOptions.body = JSON.stringify(body);
      } else if (bodyType === 'xml') {
        headers['Content-Type'] = 'application/xml; charset=utf-8';
        fetchOptions.body = body;
      } else {
        headers['Content-Type'] = 'text/plain; charset=utf-8';
        fetchOptions.body = body;
      }
    }

    try {
      const response = await fetch(urlObj, fetchOptions);

      if (!response.ok) {
        const errorMessage = `Ошибка при ${method} запросе к ${endpoint}`;
        logMisError(`${errorMessage}. Статус ${response.status}`, urlWithoutParams);
        isBlocked = true;
        lastError = new Error(`HTTP ${response.status}`);
        return {
          success: false,
          error: {
            message: errorMessage,
            details: `Сервер ответил со статусом ${response.status}`,
            statusCode: response.status,
          },
        };
      }
      
      if (response.status === 204 || !response.headers.get('content-length') || response.headers.get('content-length') === '0') {
          return { success: true, data: { body: '', contentType: '' } };
      }

      const contentType = response.headers.get('content-type') || '';
      const responseBuffer = await response.arrayBuffer();
      const buffer = Buffer.from(responseBuffer);
      let responseBody;

      if (contentType.includes('windows-1251') || !contentType.includes('charset=')) {
        responseBody = iconv.decode(buffer, 'win1251');
      } else {
        responseBody = buffer.toString('utf8');
      }
//console.log('_request END')
      return {
        success: true,
        data: {
          body: responseBody,
          contentType,
        },
      };
    } catch (err) {
      logMisError(`Сетевая ошибка или ошибка выполнения запроса: ${err.message}`, urlWithoutParams);
      isBlocked = true;
      lastError = err;
      return {
        success: false,
        error: {
          message: 'Сетевая ошибка или ошибка выполнения запроса',
          details: err.message,
          statusCode: null,
        },
      };
    }
  }

  return {
    get: (endpoint, params) => _request('GET', endpoint, { params }),
    post: (endpoint, { body, bodyType = 'json' }) => _request('POST', endpoint, { body, bodyType }),
    put: (endpoint, { body, bodyType = 'json' }) => _request('PUT', endpoint, { body, bodyType }),
  };
}
