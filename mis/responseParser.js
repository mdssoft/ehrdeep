// responseParser.js
import { parseStringPromise } from 'xml2js';
import { applyTypeParser } from './transform.js';


export function parseJson(text) {
  try {
    return JSON.parse(text);
  } catch (e) {
    throw new Error('Ошибка парсинга JSON: ' + e.message);
  }
}

export async function parseXml(text) {
  const options = {
    explicitArray: false,
    ignoreAttrs: true,
  };
  return await parseStringPromise(text, options);
}

export function parseTextAsKeyValue(text, delimiter = '|') {
  if (!text || typeof text !== 'string') {
    return {};
  }
  return text
    .trim()
    .split(/\r?\n/)
    .reduce((acc, line) => {
      const parts = line.split(delimiter);
      if (parts.length >= 2) {
        const key = parts[0].trim();
        const value = parts.slice(1).join(delimiter).trim();
        if (key) {
          acc[key] = value;
        }
      }
      return acc;
    }, {});
}

/**
 * Парсит текст в массив объектов (таблицу) на основе конфигурации колонок.
 * @param {string} text - Входной текст для парсинга.
 * @param {object} config - Конфигурация парсинга.
 * @param {Array<object|string>} config.columns - Массив с описанием колонок.
 * Элементом массива может быть:
 * - {string} - имя свойства в результирующем объекте. Тип данных будет 'string'.
 * - {object} - объект с полями:
 * - name: {string} - имя свойства.
 * - type: {string} (опционально) - тип ('string', 'number', 'date', 'time', 'bool'). По умолчанию 'string'.
 * @param {boolean} [config.hasHeader=true] - Есть ли в тексте строка заголовков.
 * @param {string} [config.delimiter='|'] - Разделитель колонок.
 * @returns {Array<object>} - Массив объектов, представляющих строки таблицы.
 */
export function parseTextAsTable(text, config) {
  if (!text || typeof text !== 'string') {
    return [];
  }

  const { columns, hasHeader = true, delimiter = '|' } = config;
  const lines = text.trim().split(/\r?\n/);

  if (!columns || !Array.isArray(columns) || columns.length === 0) {
      throw new Error('Конфигурация колонок (config.columns) не задана или пуста.');
  }

  const dataLines = hasHeader ? lines.slice(1) : lines;

  return dataLines.map(line => {
    const values = line.split(delimiter);
    const rowObject = {};

    columns.forEach((columnConfig, index) => {
      const rawValue = values[index] ? values[index].trim() : undefined;
      
      let columnName;
      let columnType;

      // Проверяем, как задана конфигурация колонки: строкой или объектом
      if (typeof columnConfig === 'string') {
        columnName = columnConfig;
        columnType = 'string'; // Для строки тип всегда 'string'
      } else if (typeof columnConfig === 'object' && columnConfig !== null && columnConfig.name) {
        columnName = columnConfig.name;
        columnType = columnConfig.type || 'string';
      } else {
        // Пропускаем некорректно сконфигурированные колонки
        return;
      }
      
      if (rawValue === undefined || rawValue === '') {
          rowObject[columnName] = null;
          return;
      }
      
      // Применяем парсер в любом случае.
      // Для типа 'string' он просто вернет исходное значение.
      rowObject[columnName] = applyTypeParser(rawValue, columnType);
    });

    return rowObject;
  });
}