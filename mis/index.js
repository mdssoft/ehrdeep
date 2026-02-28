// mis/index.js
import { createApiClient } from './apiClient.js';
import { parseJson, parseTextAsKeyValue, parseTextAsTable } from './responseParser.js';
import iconv from 'iconv-lite';
import { getLogger } from '@server/utils/logger.js';
import { formatMisDate } from './transform.js'

const syncLogger = getLogger('sync');

export default function initialize(config) {
  const api = createApiClient(config);

  function _safeJsonParse(result) {
console.log(result)
    if (!result.success) return result;
    try {
      result.data = parseJson(result.data.body);
console.log(result.data)
    } catch (e) {
      return { success: false, error: { message: 'Ошибка парсинга JSON ответа', details: e.message, statusCode: 200 }};
    }
    return result;
  }

  const schedule = {
    /**
     * Получает расписание врачей для указанной специальности и клиники.
     * @param {string} specialityCode - Код специальности.
     * @param {string} startDate - Дата начала периода (формат DD.MM.YYYY).
     * @param {number} daysCount - Количество дней.
     * @param {string} clinicCode - Код клиники.
     * @returns {Promise<object>}
     */
  async getScheduleForSpeciality(specialityCode, startDate, daysCount, clinicCode) {
      const result = await api.get('/SPTIME_NSRASP', { p1: specialityCode, p2: startDate, p3: daysCount, p4: clinicCode, p5: 2, p6: 1 });
      
      if (!result.success) {
        return result;
      }

      const textBody = result.data.body;
      if (!textBody || typeof textBody !== 'string') {
        result.data = []; // Возвращаем пустой массив в случае отсутствия данных
        return result;
      }
      
      const lines = textBody.trim().split(/\r?\n/);
      if (lines.length < 2) {
        result.data = []; // Требуется как минимум строка заголовка и строка данных
        return result;
      }
console.log('lines',specialityCode,lines)
      // 1. Парсинг заголовка для получения массива дат
      const headerParts = lines[0].split('|');
      const dates = headerParts.slice(5); // Даты начинаются с 6-й колонки (индекс 5)

      // 2. Парсинг строк с данными о расписании
      const scheduleData = lines.slice(1).map(line => {
        const rowParts = line.split('|');

        const scheduleInfo = {
          key: rowParts[0] || '',
          departmentId: rowParts[1] || '',
          doctorId: rowParts[2] || '',
          specialityId: rowParts[3] || '',
          scheduleByDate: []
        };
        
        // Времена работы начинаются с 6-й колонки (индекс 5)
        const dailySchedulesRaw = rowParts.slice(5);

        dailySchedulesRaw.forEach((scheduleString, index) => {
          // Пропускаем пустые значения, означающие отсутствие приема в этот день
          if (!scheduleString) {
            return;
          }
console.log('scheduleString',index,scheduleString,dates[index],addDaysToDate(startDate,index))
          // Парсинг времени
          const timeSplit = scheduleString.split('-');
          
          const startTime = timeSplit[0] || '';
          const endTime = timeSplit[1] || '';
          
          // Определяем флаги
          const isLocked = timeSplit[2] == 'L';
          const isChildren = timeSplit[3] == 'C';
          
          scheduleInfo.scheduleByDate.push({
            date: addDaysToDate(startDate,index),
            startTime: startTime,
            endTime: endTime,
            isLocked: isLocked,
            isChildren: isChildren
          });
        });

        return scheduleInfo;
      }).filter(item => item.key); // Отфильтровываем пустые или некорректные строки

      result.data = scheduleData;
      return result;
      
      function addDaysToDate(dateStr, idx) {
          const [day, month, year] = dateStr.split('.').map(Number);
          const date = new Date(year, month - 1, day);
          date.setDate(date.getDate() + idx);
          
          const dd = String(date.getDate()).padStart(2, '0');
          const mm = String(date.getMonth() + 1).padStart(2, '0');
          const yyyy = date.getFullYear();
          
          return `${dd}.${mm}.${yyyy}`;
      }
    },
    /**
     * Возвращает доступное время приема для указанного ключа.
     * @param {string} key - Ключ (например, lp(код Клиники),sp(Код специальности),vr(Код врача),dt(Системный код даты)).
     * @returns {Promise<object>}
     */
    async getAppointmentSlots(key) {
        const result = await api.get('/VRDAY_NPPCAB', { p1: key, p2: 1 });
        if (!result.success) {
            return result;
        }

        const textBody = result.data.body;
console.log('getAppointmentSlots',textBody)
        // Проверка на пустой или невалидный ответ
        if (!textBody || typeof textBody !== 'string') {
            result.data = { dayKey: '', doctorName: '', cabinet: '', date: '', slotsPerTime: 1, slots: [] };
            return result;
        }

        const lines = textBody.trim().split(/\r?\n/);
        if (lines.length === 0) {
            result.data = { dayKey: '', doctorName: '', cabinet: '', date: '', slotsPerTime: 1, slots: [] };
            return result;
        }

        // Парсинг строки 1: Информация о дне
        const headerParts = lines[0].split('|');
        const dayInfo = {
            dayKey: headerParts[0] || '',
            doctorName: headerParts[4] || '',
            cabinet: headerParts[5] || '',
            date: headerParts[6] || '', // old version - 5
            slotsPerTime: parseInt(headerParts[7], 10) || 1, // По умолчанию 1
        };

        // Парсинг строк 2...N: Временные слоты
        const slots = lines.slice(1).map(line => {
            const slotParts = line.split('|');
            return {
                slotKey: slotParts[0] || '',
                time: slotParts[1] || '',
                duration: parseInt(slotParts[2], 10) || 0, // Длительность в минутах
                type: slotParts[3] || '',
            };
        }).filter(slot => slot.slotKey); // Отфильтровываем пустые строки

        // Объединяем все в единую структуру
        result.data = {
            ...dayInfo,
            slots,
        };
console.log('getAppointmentSlots=',result)
        return result;
    }
  };

  const auth = {
    async checkConnection(text) {
      const result = await api.get('/ISOK_NPPCAB', { p1: text });
      if (!result.success) return result;
      result.data = result.data.body=='OK'?true:false
      return result;
    },
    async checkUser(login, password) {
      const result = await api.get('/CHK_NPPCAB', { p1: login, p2: password });
      if (!result.success) return result;
      result.data = parseTextAsKeyValue(result.data.body);
      return result;
    },
    async registerUserByFIO(userData) {
      const params = {
        p1: userData.login, p2: userData.password, p3: userData.medicalHistoryNumber,
        p4: userData.lastName, p5: userData.firstName, p6: userData.middleName, p7: formatMisDate(userData.birthDate),
      };
      const result = await api.get('/REGFIO_NPPCAB', params);
console.log('REGFIO_NPPCAB',result)
        if (!result.success) return result;
        if (result.data.body.startsWith('ERR')) {
            result.data = { error: result.data.body.substr(4,999) };
        } else {
            result.data = parseTextAsKeyValue(result.data.body);
        }
      return result;
    },
    async registerUserByPhone(lastName, firstName, middleName, phone) {
        const result = await api.get('/REGPHN_NPPCAB', { p1: lastName, p2: firstName, p3: middleName, p4: phone });
console.log('REGPHN_NPPCAB',result)
        if (!result.success) return result;
        if (result.data.body.startsWith('ERR')) {
            result.data = { error: result.data.body.substr(4,999) };
        } else {
            result.data = parseTextAsKeyValue(result.data.body);
        }
        return result;
    }
  };

  const appointments = {
    async getPatientAppointments(userId, syncDate) {
        const result = await api.get('/MYDSH_NPPCAB', { p1: userId, p2: 2, p3: syncDate?formatMisDate(syncDate):'' });
        if (!result.success) return result;
        const columns = [
          'key',
          { name:'date', type:'date'} ,
          'time',
          'doctor',
          'speciality',
          'cabinet',
          'clinic',
          {name:'duration', type:'time'},
          {name:'confirm', type:'date'}, 
          {name:'come', type:'date'}, 
          'phone', 
          'ecode', ];

        result.data = parseTextAsTable(result.data.body, { columns, hasHeader: false });
        return result;
    },
    async deleteAppointment(userId, recordKey) {
        const result = await api.get('/DELDSH_NPPCAB', { p1: userId, p2: (recordKey||'').replaceAll(",","~") });
        if (!result.success) return result;
        result.data = result.data.body;
        if( result.data != '' ) result.success = false; // если сообщение - ошибка
        return result;
    },
    async makeAppointment(userId, recordKey, time, externalId = 0) {
        const result = await api.get('/ZPS_NPPCAB', { p1: userId, p2: recordKey, p3: time, p4: externalId, p5: 1 });
        if (!result.success) return result;
        result.data = result.data.body;
        if( result.data != 'OK' ) result.success = false; // если не OK, то сообщение о ошибке
        if( result.data && result.data.length>1 && result.data[0] == '#' ) {
          result.data = 'Запись невозможна, обратитесь в регистратуру'
          result.success = false;
        }
        return result;
    },
    async makeAppointmentExtended(recordKey, time, patientData, comment, externalRef, externalPatientRef, externalUser) {
        const p3 = [
            patientData.nib || '', patientData.lastName || '', patientData.firstName || '',
            patientData.middleName || '', patientData.sex || '', patientData.birthDate || '',
            patientData.phone || '', patientData.polis || ''
        ].join('|');

        const params = { p1: recordKey, p2: time, p3, p4: comment, p5: externalRef, p6: externalPatientRef, p7: externalUser };
        const result = await api.get('/ZPSA_NPPCAB', params);
        if (!result.success) return result;
        result.data = result.data.body;
        if( result.data != '' ) result.success = false; // если сообщение - ошибка
        return result;
    }
  };

  const specialities = {
    async getSpecialities(p_identifier, departmentCode) {
        const result = await api.get('/SPLST_NSRASP', { p: p_identifier, p1: departmentCode });
        if (!result.success) return result;
        result.data = parseTextAsTable(result.data.body, { columns: ['id', 'name'], hasHeader: false });
        return result;
    },
    /**
     * Получает полный список специальностей.
     * @param {string} [flg=''] - опциональный флаг.
     * @returns {Promise<object>}
     */
    async getFullSpecialities(flg = '') {
        const params = { p1: 1, p2: flg };
        return _safeJsonParse(await api.get('/SPEC_NSPRAVJ', params));
    }
  };
  
  // объект `departments`
  const departments = {
    /**
     * Получает полный список отделений.
     * @param {string} [flg=''] - опциональный флаг.
     * @returns {Promise<object>}
     */
    async getFullDepartment(flg = '') {
        const params = { p1: 1, p2: flg };
        return _safeJsonParse(await api.get('/OTD_NSPRAVJ', params));
    }
  };

  const clinics = {
    async getClinics(departmentCode) {
        const result = await api.get('/LSTLPU_NSRASP', { mod: 1, p1: departmentCode });
        if (!result.success) return result;
        result.data = parseTextAsTable(result.data.body, { columns: ['id', 'name', 'address', 'phone'], hasHeader: false });
        return result;
    }
  };
  
  const pricelist = {
     async getPriceGroups() {
        return _safeJsonParse(await api.get('/JSON_NPRICEG'));
     },
    async getFullPriceList(departmentCode) {
        return _safeJsonParse(await api.get('/JSON_YNPRICE', { p1: '', p2: 0, p3: departmentCode }));
    }
  };

  const doctors = {
    async getDoctorDetails(departmentCode) {
        return _safeJsonParse(await api.get('/JSON_YIKADRY', { p1: 1, p2: 1, p3: 0, p4: departmentCode }));
    }
  };

  const documents = {
    async getPatientDocuments(userId, startDate = '', endDate = '') {
        return _safeJsonParse(await api.get('/EPR_NPPCAB', { p1: userId, p2: startDate, p3: endDate }));
    }
  };

  const users = {
    async getUsersChunk(startLogin = '', limit = 100, organizationId = 0) {
      const safeLimit = Math.min(Number(limit) || 100, 100);
      const safeOrganizationId = Number(organizationId) || 0;
      const result = await api.get('/USRLST_NIPPCAB', { p1: startLogin || '', p2: safeLimit, p3: safeOrganizationId });

      if (!result.success) return result;

      const textBody = result?.data?.body;
      if (!textBody || typeof textBody !== 'string' || !textBody.trim()) {
        result.data = [];
        return result;
      }

      // Дополнительная проверка/нормализация кодировки win1251 -> utf8 для случаев,
      // когда upstream отдал данные в legacy-формате.
      const normalizedBody = normalizeWin1251Text(textBody);

      result.data = parseTextAsTable(normalizedBody, {
        columns: [
          'login',
          'password',
          'first_name',
          'last_name',
          'middle_name',
          'birth_date',
          'gender',
          'phone',
          'organization_id',
          'medical_history_number'
        ],
        hasHeader: false
      });

      if (process.env.NODE_ENV === 'development') {
        syncLogger.info(`[MIS users.getUsersChunk] parsed rows=${result.data.length} data=${JSON.stringify(result.data)}`);
      }

      return result;
    },

    async generatePasswordResetCode({ phone = '', email = '', login = '' } = {}) {
      const result = await api.get('/GENOTP_NIPPCAB', {
        p1: phone,
        p2: email,
        p3: login,
      });

      if (!result.success) return result;
      const body = (result.data?.body || '').toString().trim();
      result.data = {
        code: body,
      };
      return result;
    },

    async resetPasswordWithCode({ phone = '', email = '', login = '', code = '', newPassword = '', birthDate = '' } = {}) {
      const result = await api.get('/CHGPWD_NIPPCAB', {
        p1: phone,
        p2: email,
        p3: login,
        p4: newPassword,
        p5: code,
        p6: birthDate,
      });

      if (!result.success) return result;
      const body = (result.data?.body || '').toString().trim();
      result.success = body === '' || body === 'OK' || body === '1';
      result.data = { raw: body };
      return result;
    }
  };

  function normalizeWin1251Text(rawText) {
    const decodedFromLatin1 = iconv.decode(Buffer.from(rawText, 'latin1'), 'win1251');
    const cyrillicChars = /[А-Яа-яЁё]/g;
    const sourceScore = (rawText.match(cyrillicChars) || []).length;
    const decodedScore = (decodedFromLatin1.match(cyrillicChars) || []).length;

    return decodedScore > sourceScore ? decodedFromLatin1 : rawText;
  }

  return {
    schedule,
    auth,
    appointments,
    specialities,
    departments,
    clinics,
    pricelist,
    doctors,
    documents,
    users,
  };
}
