import dayjs from 'dayjs';
import customParseFormat from 'dayjs/plugin/customParseFormat.js';

// Подключаем плагин для парсинга по кастомным форматам
dayjs.extend(customParseFormat);

/**
 * Форматирует дату в строку формата DD.MM.YYYY
 * @param {Date|string} date - Входная дата (Date, 'YYYY-MM-DD', 'ISO 8601', 'DD.MM.YY' или '')
 * @returns {string} Отформатированная дата в формате DD.MM.YYYY или пустая строка
 */
export function formatMisDate(date) {
  // Если пустая строка или null/undefined — возвращаем пустую строку
  if (!date) return '';

  let parsedDate;

  // Если это объект Date
  if (date instanceof Date) {
    parsedDate = dayjs(date);
  }
  // Если это строка
  else if (typeof date === 'string') {
    // Пустая строка
    if (date === '') return '';

    // Пробуем парсить различные форматы
    const formats = [
      'YYYY-MM-DD',           // 2025-08-20
      'YYYY-MM-DDTHH:mm:ss.SSSZ', // 2025-08-20T21:37:16.312Z
      'DD.MM.YY',             // 20.08.25
      'DD.MM.YYYY'            // 20.08.2025
    ];

    for (const format of formats) {
      const tryDate = dayjs(date, format, true); // true — строгий парсинг
      if (tryDate.isValid()) {
        parsedDate = tryDate;
        break;
      }
    }
  }

  // Если дата не распознана или невалидна
  if (!parsedDate || !parsedDate.isValid()) {
    return '';
  }

  // Возвращаем отформатированную дату
  return parsedDate.format('DD.MM.YYYY');
}

/**
 * Парсит строковое представление булева значения.
 * "true", "yes", "1" преобразуются в true.
 * "false", "no", "0" преобразуются в false.
 * @param {string | any} value - Входное значение.
 * @returns {boolean|null} - Возвращает true, false или null, если не удалось распознать.
 */
export function parseMisBoolean(value) {
  if (typeof value !== 'string') return null;
  const lowerCaseValue = value.toLowerCase().trim();
  if (['true', 'yes', '1'].includes(lowerCaseValue)) {
    return true;
  }
  if (['false', 'no', '0'].includes(lowerCaseValue)) {
    return false;
  }
  return null;
}

/**
 * Парсит дату из строки, используя различные форматы.
 * Поддерживаемые форматы: 'DD.MM.YYYY HH:mm:ss', 'DD.MM.YYYY HH:mm', 'DD.MM.YYYY', 'DD.MM.YY', ISO и др.
 * @param {string | any} value - Входная строка с датой.
 * @returns {Date|null} - Объект Date или null, если парсинг не удался.
 */
export function parseMisDate(value) {
  if (!value || typeof value !== 'string') return null;

  const formats = [
    'DD.MM.YYYY HH:mm:ss',
    'DD.MM.YYYY HH:mm',
    'DD.MM.YYYY',
    'DD.MM.YY',
    'YYYY-MM-DDTHH:mm:ss.SSSZ', // ISO
    'YYYY-MM-DD',
  ];

  // Создаем объект dayjs, пробуя парсить по списку форматов
  // true в третьем параметре включает строгий режим парсинга
  const parsedDate = dayjs(value, formats, true);

  // Если дата валидна, возвращаем объект Date, иначе null
  return parsedDate.isValid() ? parsedDate.toDate() : null;
}

/**
 * Парсит время из строки.
 * Поддерживаемые форматы: 'HH:mm:ss', 'HH:mm'.
 * @param {string | any} value - Входная строка с временем.
 * @returns {string|null} - Строка времени в формате HH:mm:ss или null.
 */
export function parseMisTime(value) {
  if (!value || typeof value !== 'string') return null;

  const formats = ['HH:mm:ss', 'HH:mm'];
  const parsedTime = dayjs(value, formats, true);

  return parsedTime.isValid() ? parsedTime.format('HH:mm:ss') : null;
}

/**
 * Применяет парсер к значению на основе типа колонки.
 * @param {string} value - Значение для парсинга.
 * @param {string} type - Тип колонки ('date', 'time', 'bool', 'number', 'string').
 * @returns {Date|string|boolean|number|null} - Распарсенное значение.
 */
export function applyTypeParser(value, type) {
    switch (type) {
        case 'date':
            return parseMisDate(value);
        case 'time':
            return parseMisTime(value);
        case 'bool':
            return parseMisBoolean(value);
        case 'number':
            // Заменяем запятую на точку для десятичных чисел
            const num = parseFloat(String(value).replace(',', '.'));
            return isNaN(num) ? null : num;
        case 'string':
        default:
            return value;
    }
}