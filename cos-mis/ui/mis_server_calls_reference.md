# MIS server calls map from UI (mdtype.frm, mhist.frm)

Generated from direct string calls in main.NetFunc/main.NetProc/main.NetPostData/main.NetPostFile/main.NetProcToFile.

## mdtype.frm

| Call | Net method | UI lines | Server entry | Description |
|---|---|---|---|---|
| `AFT^YIMHS` | `Func` | `mdtype.frm:1985` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:825` | Добавить папку |
| `DELDT^YIMHS` | `Func` | `mdtype.frm:1790` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:315` | Удалить тип документа |
| `DFT^YIMHS` | `Func` | `mdtype.frm:2014` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:832` | Удалить папку |
| `EXPORT^YIMHS` | `ProcToFile` | `mdtype.frm:1820` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:738` | Экспорт документа с шаблонами в XGL |
| `GENDTP^YIMHH` | `ProcToFile` | `mdtype.frm:1832, 1854` | `cos-mis/full_src/indexed/src/Routine/YIMHH.mac:131` | Generate HTML DType |
| `GENDTPP^YIMHH` | `ProcToFile` | `mdtype.frm:1867, 1888` | `cos-mis/full_src/indexed/src/Routine/YIMHH.mac:153` | Generate HTML DType with patterns |
| `IMPORT^YIMHS` | `PostFile` | `mdtype.frm:1903` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:764` | Импорт документа из XGL |
| `INTXT^YIMHU` | `PostData` | `mdtype.frm:1918` | `cos-mis/full_src/indexed/src/Routine/YIMHU.mac:24` | Автосоздание документа из импортируемого текста |
| `LDT^YIMHS` | `Proc` | `mdtype.frm:1703` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:15` | ЗАГРУЗКА |
| `LFT^YIMHS` | `Func` | `mdtype.frm:2020` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:309` | Список папок |
| `LSTVR^NEPRPT` | `Func` | `mdtype.frm:1844, 1879` | `cos-mis/full_src/indexed/src/Routine/NEPRPT.mac:39` | Список авторов по шаблону определнного типа |
| `LTXTDT^YIMHS` | `Func` | `mdtype.frm:1771` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:241` | ; Список типов для редактора с поиском |
| `NDT^YIMHS` | `Func` | `mdtype.frm:1684` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:3` | Новый номер |
| `NDTF^YIMHS` | `Proc` | `mdtype.frm:1680` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:8` | Новый номер из старого |
| `NFT^YIMHS` | `Func` | `mdtype.frm:2001` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:841` | Переименовать папку |

## mhist.frm

| Call | Net method | UI lines | Server entry | Description |
|---|---|---|---|---|
| `ADDAGR^NGRNL` | `Func` | `mhist.frm:9011` | `cos-mis/full_src/indexed/src/Routine/NGRNL.mac:318` | Добавить письмо по согласованию |
| `ADDF^YIMH` | `Proc` | `mhist.frm:5139` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:515` | Добавить в ИЗБРАННЫЕ ДОКУМЕНТЫ |
| `CEL^YNED` | `Func` | `mhist.frm:4115, 4116` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:804` | Вывод прейскуранта |
| `CHKED^NDMS` | `Proc` | `mhist.frm:8561` | `cos-mis/full_src/indexed/src/Routine/NDMS.mac:?` | Routine file not found in full_src |
| `CHKUSBS^YIMH` | `Func` | `mhist.frm:5004, 8479` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:365` | Проверить на права расподписи |
| `COMMLST^YIMH` | `Func` | `mhist.frm:8209` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:776` | Список комментариев |
| `CTP^YICARDS` | `Func` | `mhist.frm:7239` | `cos-mis/full_src/indexed/src/Routine/YICARDS.mac:2` | PIN КАРТЫ |
| `DELD^YIMH` | `Func` | `mhist.frm:4692, 6318` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:803` | УДАЛЕНИЕ ДОКУМЕНТА |
| `DELF^YIMH` | `Proc` | `mhist.frm:5143` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:521` | Удалить из ИЗБРАННЫХ ДОКУМЕНТОВ |
| `DETOOTH^NSTOMEPR` | `Func` | `mhist.frm:7931` | `cos-mis/full_src/indexed/src/Routine/NSTOMEPR.mac:2` | Удаленные через | |
| `DH^YNED` | `Func` | `mhist.frm:7049` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:702` | Удалить услугу |
| `DOGTXT^NFNPAC` | `Proc` | `mhist.frm:7922` | `cos-mis/full_src/indexed/src/Routine/NFNPAC.mac:18` | Описание по договору |
| `DUSLH^NFNPAC` | `Func` | `mhist.frm:8619` | `cos-mis/full_src/indexed/src/Routine/NFNPAC.mac:198` | Условия по услуге с предисторией |
| `END^YIMHP` | `Proc` | `mhist.frm:3689` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:526` | Конец работы с ЭИБ |
| `ESTIM^YIMHS` | `Func` | `mhist.frm:8229` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:855` | Список оценок документа |
| `EVLIST^YIMH` | `Func` | `mhist.frm:8178` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:782` | Список событий по пациенту |
| `FILL^NEPRPT` | `Proc` | `mhist.frm:5887` | `cos-mis/full_src/indexed/src/Routine/NEPRPT.mac:104` | Заполнить документ |
| `FND^YIMHP` | `Func` | `mhist.frm:4238` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:2` | Поиск |
| `GDL^YIMH` | `Func` | `mhist.frm:5573` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:5` | Перечень создаваемых документов |
| `GDST^YIMH` | `Func` | `mhist.frm:5873` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:32` | Строка для создаваемого документа с проверкой прав |
| `GETFLG^YIMHS` | `Func` | `mhist.frm:4528, 7278` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:564` | Получить флаги регистрации услуг |
| `GETINF^NGRNL` | `Func` | `mhist.frm:8745` | `cos-mis/full_src/indexed/src/Routine/NGRNL.mac:379` | Информация по ГП в HTML |
| `GETINF^YNED` | `Func` | `mhist.frm:8551` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:924` | Подробная информация по услуге |
| `GFLG^YNED` | `Func` | `mhist.frm:7098` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:543` | Получить флаги |
| `GMATT^YNED` | `Func` | `mhist.frm:8596` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:571` | Получить имя формы и список материалов |
| `GNZUB^YNED` | `Func` | `mhist.frm:8566` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:549` | Получить № зуба |
| `GSIGN^YIMH` | `Func` | `mhist.frm:4664, 6141, 8168` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:360` | Получить хэш или ЭП для документа |
| `INIT^YIMH` | `Proc` | `mhist.frm:8862` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:2` |  |
| `LDGNCNG^YIMHP` | `Proc` | `mhist.frm:8036` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:151` | Изменение договора в паспортной части |
| `LDPRN^YIMH` | `Func` | `mhist.frm:4770, 6242, 7513` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:760` | Load print pattern |
| `LDV^YIMH` | `Proc` | `mhist.frm:4883, 5106` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:665` | ВЫВОД ДОКУМЕНТА |
| `LDVD^YIMH` | `Func` | `mhist.frm:4668, 5080, 5124, 6100, 6145, 8167` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:723` | ВЫВОД ДАННЫХ ДОКУМЕНТА |
| `LI^YIMH` | `Func` | `mhist.frm:3967, 4644` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:527` | Show patient EPR tree |
| `LNEW^YIMH` | `Func` | `mhist.frm:5688` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:46` | Load pattern of new document |
| `LPC^YIMHP` | `Proc` | `mhist.frm:4388` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:33` | ЗАГРУЗКА ПАСПОРТНОЙ ЧАСТИ ПАЦИЕНТА |
| `LRPT^YIMH` | `Func` | `mhist.frm:5079, 5123, 5821` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:71` | Load 'clear' pattern of rpt document |
| `LRPTLI^YIMH` | `Proc` | `mhist.frm:8410` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:176` | Загрузка справочника по полю |
| `LSBS^YIMH` | `Proc` | `mhist.frm:5928, 5938, 6012, 6021` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:461` | Загрузить данные для подписи |
| `LSTEV^YIMHP` | `Func` | `mhist.frm:8085` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:488` | Список событий |
| `LT^YIMH` | `Func` | `mhist.frm:4655` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:607` | ВЫВОД ДЕРЕВА ИСТОРИИ ПО ПОИСКУ |
| `MSLIST^NEDE` | `Func` | `mhist.frm:3654` | `cos-mis/full_src/indexed/src/Routine/NEDE.mac:413` | Список медсестер для ввода |
| `MSSET^NEDE` | `Func` | `mhist.frm:3665` | `cos-mis/full_src/indexed/src/Routine/NEDE.mac:436` | Выбор медсестры, работающей с врачем |
| `NMLST^NSPRAV` | `Func` | `mhist.frm:8757` | `cos-mis/full_src/indexed/src/Routine/NSPRAV.mac:230` | По имени, да/нет пустая строка/все |
| `NUL^NISUTL` | `Func` | `mhist.frm:5909, 5997` | `cos-mis/full_src/indexed/src/Routine/NISUTL.mac:2` | For ping network connection |
| `PACHTML^YNEDU` | `Func` | `mhist.frm:8718` | `cos-mis/full_src/indexed/src/Routine/YNEDU.mac:165` | Информация по пациенту в HTML |
| `PKVT^YNED` | `Func` | `mhist.frm:8026` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:929` | Печать квитанции |
| `REDOC^YIMH` | `Func` | `mhist.frm:8192` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:507` | Восстановить документ из предыдущей копии |
| `RESH^YNED` | `Func` | `mhist.frm:6940` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:289` | Retreive save state |
| `RH^YNED` | `Proc` | `mhist.frm:7142` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:711` | Вывести услугу |
| `RRH^YNED` | `Proc` | `mhist.frm:4201, 6983, 8562` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:727` | Таблица услуг |
| `SBSC^YIMH` | `Func` | `mhist.frm:5739, 6072, 8450` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:418` | ПОДПИСАТЬ |
| `SBSFLST^YIMH` | `Func` | `mhist.frm:5022` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:336` | Перечень подписанных полей |
| `SBSUP^YNED` | `Func` | `mhist.frm:7259` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:931` | Подпись услуг |
| `SCNT^YNED` | `Func` | `mhist.frm:7115` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:508` | Set count |
| `SCOM^YNED` | `Func` | `mhist.frm:7135` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:406` | Изменить комментарий |
| `SDIA^YNED` | `Func` | `mhist.frm:7092, 7178` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:392` | Изменить диагноз |
| `SELNIB^YIMHP` | `Proc` | `mhist.frm:4478` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:333` | Пациент пришел |
| `SELVNIB^YIMHP` | `Proc` | `mhist.frm:7415` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:428` | Выбор пациента для просмотра |
| `SEQES^YIMH` | `PostData` | `mhist.frm:6105` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:342` | Сохранить УКЭП для документа |
| `SERVHTML^YNEDU` | `Func` | `mhist.frm:8633` | `cos-mis/full_src/indexed/src/Routine/YNEDU.mac:285` | Информация по услуге в HTML |
| `SETCOMM^YIMH` | `Func` | `mhist.frm:8223` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:842` | Добавить комментарий |
| `SETDSHF^YIMHP` | `Proc` | `mhist.frm:8985, 8990` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:534` | Установить статус "свободного кабинета" |
| `SETEST^YIMH` | `Func` | `mhist.frm:8235` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:838` | Установить оценку |
| `SFLG^YNED` | `Func` | `mhist.frm:7107` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:415` | Изменить флаги |
| `SH^YNED` | `Func` | `mhist.frm:6920` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:15` | Добавить услугу |
| `SNZUB^YNED` | `Func` | `mhist.frm:8581` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:557` | Сохранить № зуба |
| `SRPTGEN^YIMHS` | `PostData` | `mhist.frm:8391` | `cos-mis/full_src/indexed/src/Routine/YIMHS.mac:346` | Save report and generate print, if fields changed |
| `SSUM^YNED` | `Func` | `mhist.frm:7127` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:459` | Установить сумму |
| `TPLST^YIMH` | `Func` | `mhist.frm:7481` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:795` | Перечень типов документов |
| `UNAME^YNPRICE` | `Func` | `mhist.frm:6803` | `cos-mis/full_src/indexed/src/Routine/YNPRICE.mac:654` | Расшифровка имени услуги |
| `UNSBSC^YIMH` | `Func` | `mhist.frm:5027, 5038, 8498` | `cos-mis/full_src/indexed/src/Routine/YIMH.mac:382` | Расподписать |
| `USELNIB^YIMHP` | `Proc` | `mhist.frm:3878` | `cos-mis/full_src/indexed/src/Routine/YIMHP.mac:508` | Пациент ушел |
| `VCDIA^YNED` | `Func` | `mhist.frm:6721` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:1097` | Проверить и расшифровать диагноз |
| `VIEWDOC^YIMHH` | `Func` | `mhist.frm:4785` | `cos-mis/full_src/indexed/src/Routine/YIMHH.mac:78` | Вывод единичного документа |
| `WH^YNED` | `Proc` | `mhist.frm:7201` | `cos-mis/full_src/indexed/src/Routine/YNED.mac:370` | Изменить услугу - todo |

## Dynamic calls to resolve separately

- `mhist.frm:6495` `main.NetFunc(piece(str,"@",1),piece(str,"@",2),pid,vr_id,spec_id)`
- `mhist.frm:6503` `main.NetFunc(piece(str,"@",1),piece(str,"@",2),pid,vr_id,spec_id,a)`
- `mhist.frm:6584` `main.NetFunc(piece(tmp,"@",1),a,pid,vr_id,spec_id)`
- `mhist.frm:7216` `main.NetFunc(a,vr_id,otd_id,spec_id,pid,trim(mhist.inf.i("sdate")))`
- `mhist.frm:7287` `main.NetFunc(piece(b,":",1),pid,otd_id,vr_id,spec_id,piece(b,":",2))`
- `mhist.frm:7830` `main.NetProc(str,b)`
- `mhist.frm:7916` `main.NetProc(a,pid,"",b,trim(mhist.inf.i("selprog")),trim(mhist.inf.i("sdate")))`
- `mhist.frm:8043` `main.NetFunc(prg,mhist.inf.i("pac_dog"),id)`
- `mhist.frm:8061` `main.NetProc(prg,mhist.pac_id.data,id)`

## Notes

- `CHKED^NDMS` is called in `mhist.frm:8561`, but `NDMS.mac` is not present in current `full_src/indexed/src/Routine` snapshot.
