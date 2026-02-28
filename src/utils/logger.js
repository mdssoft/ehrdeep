const levels = ['debug', 'info', 'warn', 'error'];

function shouldLog(configLevel, messageLevel) {
  return levels.indexOf(messageLevel) >= levels.indexOf(configLevel);
}

export function createLogger(level = 'info', scope = 'app') {
  const normalizedLevel = levels.includes(level) ? level : 'info';

  function log(messageLevel, message, data) {
    if (!shouldLog(normalizedLevel, messageLevel)) {
      return;
    }

    const payload = {
      ts: new Date().toISOString(),
      level: messageLevel,
      scope,
      message
    };

    if (data !== undefined) {
      payload.data = data;
    }

    const serialized = JSON.stringify(payload);

    if (messageLevel === 'error') {
      console.error(serialized);
      return;
    }

    if (messageLevel === 'warn') {
      console.warn(serialized);
      return;
    }

    console.log(serialized);
  }

  return {
    debug: (message, data) => log('debug', message, data),
    info: (message, data) => log('info', message, data),
    warn: (message, data) => log('warn', message, data),
    error: (message, data) => log('error', message, data)
  };
}
