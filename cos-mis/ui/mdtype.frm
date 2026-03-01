[form]
SMode = 1
Name = mdtype
W = 9975
H = 9000
X = 0
Y = 500
Color = $AE7651
Title = Справочник :: типы документов ЭИБ
Border = none

[css]
.ctab { border-style: solid; border-width: thin } 

[menu]
<menu name="export" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
<item name="Полный экспорт" cmd="mdtype_btn_export_full"/>
<item name="Выгрузка HTML описания" cmd="mdtype_btn_export_html"/>
<item name="HTML справочники по врачу" cmd="mdtype_btn_export_vhtml"/>
<item name="Выгрузка HTML шаблонов" cmd="mdtype_btn_export_shtml"/>
<item name="HTML шаблоны по врачу" cmd="mdtype_btn_export_svhtml"/>
</menu>
<menu name="import" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
<item name="Импорт из файла" cmd="mdtype_btn_imp_full"/>
<item name="Импорт текстового описания" cmd="mdtype_btn_imp_txt"/>
</menu>
<menu name="folders" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
<item name="Добавить" cmd="mdtype_folder_add"/>
<item name="Переименовать" cmd="mdtype_folder_cng"/>
<item name="Удалить" cmd="mdtype_folder_del"/>
</menu>
<menu name="spec" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
<item name="Очистить все" cmd="mdtype_spec_clear"/>
<item name="-"/>
<item name="Найти" cmd="mdtype_spec_fnd"/>
</menu>
<menu name="otd" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
<item name="Очистить все" cmd="mdtype_otd_clear"/>
<item name="-"/>
<item name="Найти" cmd="mdtype_otd_fnd"/>
</menu>

[object]
Type = BVL
X = 4750
Y = 900
W = 5200
H = 9000
Name = bvl2
Title = Bevel
UseLabel = no
Font = 4
FontSize = 4
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 1
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 0
Y = 0
W = 10000
H = 750
Name = shape0
UseLabel = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 4
BColor = $805539
ExtColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 0
Y = 740
W = 10000
H = 50
Name = shape1
UseLabel = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 4
BColor = White
ExtColor = $CEA993
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 100
Y = 75
W = 3000
H = 600
Name = label
Title = Типы документов ЭИБ
UseLabel = no
Font = 16
FontSize = 8
FontName = Arial
FontStyle = none
Color = White
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 3700
Y = 125
W = 1000
H = 550
Name = btn_new
Title = Создать
UseLabel = no
File = ndoc.bmp
Link = mdtype_btn_new_link
Font = 6
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Создать новую запись (F5)
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
Key = F5

[object]
Type = B
X = 4750
Y = 125
W = 1000
H = 550
Name = btn_save
Title = Сохранить
UseLabel = no
File = save24.bmp
Link = mdtype_btn_save_link
Font = 6
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Сохранить данные (F6)
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
Key = F6

[object]
Type = B
X = 5800
Y = 125
W = 1000
H = 550
Name = btn_export
Title = Экспорт
UseLabel = no
File = export24.bmp
Link = mdtype_btn_export_link
Font = 6
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Экспорт выбранного документа в файл
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
PopupMenu = export

[object]
Type = B
X = 6850
Y = 125
W = 1000
H = 550
Name = btn_import
Title = Импорт
UseLabel = no
File = import24.bmp
Link = mdtype_btn_import_link
Font = 6
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Импорт документа из файла
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
PopupMenu = import

[object]
Type = B
X = 7900
Y = 125
W = 1000
H = 550
Name = btn_del
Title = Удалить
UseLabel = no
File = deldoc.bmp
Link = mdtype_btn_del_link
Font = 6
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Удалить документ
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
Key = F8

[object]
Type = B
X = 8950
Y = 125
W = 1000
H = 550
Name = btn_close
Title = Закрыть
UseLabel = no
File = img_close4.bmp
Link = RUN_EX_REPORT{mdtype.frm}
Font = 6
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Закрыть (F10)
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
Key = F10

[object]
Type = S
X = 50
Y = 900
W = 3550
H = 350
Name = ftext
Title = Что искать
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes
Lang = ru
KeyProc = mdtype_ftext_keyproc

[object]
Type = T
X = 50
Y = 1300
W = 3550
H = 300
Name = ffolder
Title = В папке
UseLabel = yes
Default = 0
File = net:LFT^YIMHS\?
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 3700
Y = 1300
W = 1000
H = 350
Name = fvis
Title = Видимые
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Искать только видимые пользователям документы
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 3700
Y = 900
W = 1000
H = 350
Name = btn_find
Title = Найти
UseLabel = no
Link = mdtype_btn_find_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Создать новую запись (F5)
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = ETAB
X = 50
Y = 1750
W = 4650
H = 8200
Name = table
Title = Перечень типов документов ЭИБ
UseLabel = no
Default = Наименование:6500;Папка:2900
Link = mdtype_table_link
Font = 6
FontSize = 6
FontName = Arial
FontStyle = none
Color = Black
Style = 2641922
BColor = $FFFBF0
ExtColor = $72ABCF
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
CSS = ctab

[object]
Type = B
X = 4850
Y = 2550
W = 1500
H = 310
Name = bt_page1
Title = Документ
UseLabel = no
Link = mdtype_bt_page1_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold|underline
Color = White
Style = 10
BColor = $AE7651
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6400
Y = 2550
W = 1500
H = 310
Name = bt_page2
Title = Дополнительно
UseLabel = no
Link = mdtype_bt_page2_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
BColor = $AE7651
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7950
Y = 2550
W = 1500
H = 310
Name = bt_page3
Title = Триггеры
Link = mdtype_bt_page3_link
UseLabel = no
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
BColor = $AE7651
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = PNL
X = 4850
Y = 2850
W = 5050
H = 1600
Name = page1
UseLabel = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 4850
Y = 2850
W = 5050
H = 1600
Name = page2
UseLabel = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $AE7651
Visible = no
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 4850
Y = 2850
W = 5050
H = 1600
Name = page3
UseLabel = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $AE7651
Visible = no
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 4900
Y = 1100
W = 4950
H = 350
Name = tname
Title = Наименование
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 4900
Y = 1600
W = 4950
H = 350
Name = cap
Title = Заголовок
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 4900
Y = 2100
W = 2800
H = 300
Name = folder
Title = Папка
UseLabel = yes
Default = 0
File = net:LFT^YIMHS\?
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 100
Y = 700
W = 3500
H = 2200
Name = dtp
Parent = page1
Title = Тип
UseLabel = yes
Default = 0
File = string:1|Главный\r\n0|Вспомогательный
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 8050
Y = 2100
W = 1800
H = 350
Name = ext
Title = Формат
UseLabel = yes
File = string:rpt|Структурный\r\nrtf|RichText\ntxt|Text\r\njpg|Image\r\ndcm|DICOM\r\nfrm|Форма\r\nfrx|Форма-панель\r\ntab|Таблица
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 5
Hint = Расширение файла
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 3800
Y = 700
W = 6100
H = 2200
Name = pfile
Parent = page1
Title = Файл шаблона
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 100
Y = 3800
W = 4800
H = 2200
Name = rproc
Parent = page1
Title = Процедура чтения
UseLabel = yes
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 5000
Y = 3800
W = 4900
H = 2200
Name = wproc
Parent = page1
Title = Процедура записи
UseLabel = yes
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 100
Y = 3800
W = 6100
H = 2200
Name = recipient
Parent = page2
Title = Адрес рассылки
UseLabel = yes
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 6400
Y = 3800
W = 3500
H = 2200
Name = sendto
Parent = page2
Title = Тип адреса
UseLabel = yes
Default = 0
File = string:0|нет\r\n1|spool\r\n2|user\r\n3|client\r\n4|email\r\n5|SMS\r\n6|NetPager\r\n7|client list
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = White
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 100
Y = 6800
W = 6100
H = 2200
Name = altid
Parent = page2
Title = Родственные ID
UseLabel = yes
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = White
Style = 0
Hint = Коды других документов, одинаковых по содержанию с текущим. Указывать через запятую.
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 6400
Y = 6800
W = 3500
H = 2200
Name = aclevel
Parent = page2
Title = Уровень доступа
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 100
Y = 700
W = 4700
H = 2000
Name = owner
Parent = page2
Title = Владелец
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 5000
Y = 700
W = 2800
H = 2000
Name = ownert
Parent = page2
Title = Тип
UseLabel = yes
File = string:D|Сотрудник\r\nP|Пациент\r\nO|Физ. лицо\r\nL|Пользователь
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = White
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 7900
Y = 700
W = 2000
H = 2200
Name = rights
Parent = page2
Title = Права
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 100
Y = 6900
W = 4800
H = 2200
Name = rank
Parent = page1
Title = Индекс документа
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Индекс документа определяет последовательность сортировки документов у пользователей
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 5000
Y = 6900
W = 4900
H = 2000
Name = sbstype
Parent = page1
Title = Вид подписи
UseLabel = yes
File = string:0|Полностью\r\n1|По разделам
Font = 8
FontSize = 6
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 4900
Y = 8950
W = 2400
H = 350
Name = uid
Title = UID
UseLabel = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Уникальный идентификатор документа
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 4900
Y = 4500
W = 2000
H = 350
Name = bdoc
Title = Уникальный документ
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Документ может быть только один, находится вверху списка
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 4900
Y = 4800
W = 2300
H = 350
Name = mu
Title = Многопользовательский
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Документ, позволяющий изменение несколькими пользователями
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 4900
Y = 5100
W = 2300
H = 350
Name = urgent
Title = 'Срочный' документ
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Документ, требующий срочной отправки при создании
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 4900
Y = 5400
W = 2300
H = 350
Name = use
Title = Архивный документ
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Неиспользуемый документ (запрещенный к созданию, но отображаемый у пациента)
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 4900
Y = 5700
W = 2300
H = 350
Name = hidden
Title = 'Скрытый' документ
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Неотображаемый, системный документ
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 7400
Y = 6300
W = 1500
H = 300
Name = spec_label
Title = Специальность
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CLST
X = 7350
Y = 6600
W = 2500
H = 2300
Name = spec
UseLabel = no
Default = 0
File = storage:spec
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes
PopupMenu = spec

[object]
Type = L
X = 4850
Y = 6300
W = 1500
H = 300
Name = otd_label
Title = Отделения
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CLST
X = 4800
Y = 6600
W = 2500
H = 2300
Name = otd
UseLabel = no
Default = 0
File = storage:otd
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 1
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes
PopupMenu = otd

[object]
Type = L
X = 7400
Y = 4500
W = 1500
H = 300
Name = vr_label
Title = Сотрудники
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = LST
X = 7350
Y = 4800
W = 2500
H = 1450
Name = tn
UseLabel = no
Link = mdtype_tn_link
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 194
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 4800
Y = 9350
W = 1000
H = 450
Name = bt_subscr
Title = Подписи
UseLabel = no
Link = mdtype_bt_subscr_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5800
Y = 9350
W = 1000
H = 450
Name = bt_profile
Title = Профили
UseLabel = no
Link = mdtype_bt_profile_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Профили документа
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6800
Y = 9350
W = 1050
H = 450
Name = bt_lists
Title = Справочники
UseLabel = no
Link = mdtype_bt_lists_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7850
Y = 9350
W = 1000
H = 450
Name = bt_struct
Title = Структура
UseLabel = no
Link = mdtype_bt_struct_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 8850
Y = 9350
W = 1000
H = 450
Name = bt_vform
Title = Шаблон
UseLabel = no
Link = mdtype_bt_vform_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no

[object]
Type = OBJ
Name = id
Style = 0
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = OBJ
Name = print
Style = 0
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = OBJ
Name = printfn
Style = 0
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = OBJ
Name = printname
Style = 0
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = OBJ
Name = list
Style = 0
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 9500
Y = 4500
W = 350
H = 300
Name = add_tn
Title = (+)
UseLabel = no
Link = mdtype_add_tn_link
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 24
Hint = Добавить сотрудника
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 7400
Y = 8975
W = 1500
H = 300
Name = info
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 4900
Y = 6000
W = 2300
H = 350
Name = cmm
Title = 'Общий' документ
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 0
Hint = Документ, доступный всем для изменения и подписи
BColor = $AE7651
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 7725
Y = 2100
W = 250
H = 310
Name = bt_fedit
UseLabel = no
File = edit16.bmp
Link = mdtype_bt_fedit_link
Font = 7
FontSize = 6
FontName = Times New Roman
FontStyle = none
Color = White
Style = 10
Hint = Изменить папки
BColor = $AE7651
ExtColor = White
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = no
PopupMenu = folders

[object]
Type = L
X = 100
Y = 100
W = 4000
H = 2200
Name = autofields_label
Parent = page3
Title = Заполнение полей
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 6000
Y = 100
W = 4000
H = 2200
Name = sbproc_label
Parent = page3
Title = Подпись документа
UseLabel = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = TXT
X = 100
Y = 2500
W = 5800
H = 7000
Name = autofields
Parent = page3
UseLabel = no
Font = 6
FontSize = 6
FontName = Courier New
FontStyle = none
Color = Black
Style = 4
Hint = имя поля=процедура
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = TXT
X = 6000
Y = 2500
W = 3900
H = 7000
Name = sbproc
Parent = page3
UseLabel = no
Font = 6
FontSize = 6
FontName = Courier New
FontStyle = none
Color = Black
Style = 4
Hint = Перечень процедур
BColor = Window
Visible = yes
XPath = /nb_console/mdtype/
XValue = no
XRequest = no
XWrited = yes

[request]
name = save
question = aclevel
question = autofields
question = altid
question = bdoc
question = cap
question = cmm
question = dtp
question = ext
question = folder
question = hidden
question = id
question = list
question = mu
question = otd
question = owner
question = ownert
question = pfile
question = printfn
question = rank
question = recipient
question = rights
question = rproc
question = sbproc
question = sbstype
question = sendto
question = spec
question = tn
question = tname
question = tparent
question = uid
question = urgent
question = use
question = wproc
name = prnsave
question = id
question = print
question = printname


[script]
event mdtype_btn_find_link(a,b);

event mdtypeOpen(a,b)
{
	mdtype_btn_find_link(0,0);
}

event mdtype_reset(a,b)
{
	mdtype.id.data = "";
	mdtype.folder.data = "";
	mdtype.tname.data = "";
	mdtype.cap.data = "";
	mdtype.ext.data = "";
	mdtype.pfile.data = "";
	mdtype.recipient.data = "";
	mdtype.sendto.data = 0;
	mdtype.owner.data = "";
	mdtype.ownert.data = "D";
	mdtype.rproc.data = "";
	mdtype.wproc.data = "";
	mdtype.rights.data = "aaa";
	mdtype.rank.data = "";
	mdtype.uid.data = "";
	mdtype.bdoc.data = 0;
	mdtype.urgent.data = 0;
	mdtype.mu.data = 0;
	mdtype.use.data = 0;
	mdtype.hidden.data = 0;
	mdtype.sbstype.data = 0;
	mdtype.cmm.data = 0;
	mdtype.otd.UnCheckAll();
	mdtype.spec.UnCheckAll();
	mdtype.tn.text = "";
	mdtype.print.data = "";
	mdtype.altid.text = "";
	mdtype.aclevel.data = "";
	mdtype.printfn.data = "";
	mdtype.sbproc.data = "";
	mdtype.autofields.data = "";
}

event mdtype_btn_new_link(a,b)
{
	a = trim(mdtype.id.data);
	b = trim(mdtype.tname.data);
	mdtype_reset(0,0);
	if( a != "" ) {
		if( confirm("Создать новый документ на основе существующего:\r\n\""+b+"\" ?") == 1 ) {

			main.NetProc("NDTF^YIMHS",a);
			return;
		}
	}
	mdtype.id.data = main.NetFunc("NDT^YIMHS");
}

event mdtype_btn_save_link(a,b)
{
	b = mdtype.xRequests("save","SDT^YIMHS()");
	if( (b != "xml")&&(strlen(b)>0) ) {
		cout(b);
	}
	a = mdtype.table.row;
	mdtype_btn_find_link(0,0);
	mdtype.table.row = a;
}

event mdtype_table_link(a,b)
{
	mdtype_reset(0,0);
	a = int(mdtype.table.index());
	if( a < 1 ) return;
	main.NetProc("LDT^YIMHS",mdtype.table.key(a));
}

event mdtype_bt_vform_link(a,b)
{
	var str;
	if( mdtype.id.data == "" ) {
		cout("В начале сохраните документ.");
		return;
	}
	if( mdtype.ext.data == "tab" )
	{
		str = mdtype.printfn.data;
		str = trim(utility.InputBox("Шаблон печати","Имя файла",str,1));
		if( strsub(str,1,1) == "0" ) return;
		mdtype.printfn.data = strdel(str,1,1);
		mdtype_btn_save_link(0,0);
		return;
	}
	if( mdtype.ext.data != "rpt" )
	{
		cout("Предназначено только для структурных и табличных документов.");
		return;
	}
	main.CreateForm("mdprint.frm",0-2,1);
}

event mdtype_bt_struct_link(a,b)
{
	if( mdtype.id.data == "" )
	{
		cout("В начале сохраните документ.");
		return;
	}
	if( mdtype.ext.data != "rpt" )
	{
		cout("Предназначено только для структурных документов.");
		return;
	}
	main.CreateForm("mdfield.frm",0-2,1);
}

event mdtype_bt_lists_link(a,b)
{
	if( mdtype.id.data == "" )
	{
		cout("В начале сохраните документ.");
		return;
	}
	if( mdtype.ext.data == "rpt" )
	{
		main.CreateForm("mdslist.frm",0-2,1);
		return;
	}
	main.CreateHForm("etxt.frm");
	a = main.report("etxt");
	a.label.Title = "Справочник документа";
	a.txt.Text = mdtype.list.data;
	main.CreateForm("etxt.frm",0-2,1);
	if( a.ModalResult != 1 ) return;
	mdtype.list.data = a.txt.Text;
	mdtype.xRequests("save","SDT^YIMHS()");
}

event mdtype_btn_find_link(a,b)
{
	a = mdtype.ffolder.data;
	b = mdtype.fvis.data;
	mdtype.table.text = main.NetFunc("LTXTDT^YIMHS",mdtype.ftext.data,a,b);
	if( mdtype.table.rows == 2 )
	{
		mdtype_table_link(0,0);
	}
}

event mdtype_ftext_keyproc(a,b)
{
	if( int(a) != 13 ) return;
	mdtype_btn_find_link(0,0);
	mdtype.table.SetFocus();
}

event mdtype_btn_del_link(a,b)
{
	b = mdtype.id.data;
	if( b == "" ) return;
	if( confirm("Удалить текущий документ ?") == 0 ) return;
	a = main.NetFunc("DELDT^YIMHS",b));
	if( a != "" ) {
		cout(a);
		return;
	}
	mdtype_reset(0,0);
	mdtype_btn_find_link(0,0);
}

event mdtype_bt_profile_link(a,b)
{
	if( mdtype.id.data == "" ) {
		cout("В начале сохраните документ.");
		return;
	}
	main.CreateForm("mdprofil.frm",0-2,1);
}

event mdtype_btn_export_link(a,b)
{
	mdtype.btn_export.PopupMenu(1);
}

event mdtype_btn_export_full(a,b)
{
	b = mdtype.id.data;
	if( b == "" ) return;
	var fn;
	fn = disk.SaveDialog("*.xgl");
	if( strlen(fn) > 0 ) {
		main.NetProcToFile("EXPORT^YIMHS",fn,b);
		cout("Экспорт завершен.");
	}
}

event mdtype_btn_export_html(a,b)
{
	b = mdtype.id.data;
	if( b == "" ) return;
	var fn;
	fn = disk.SaveDialog("*.htm");
	if( strlen(fn) > 0 ) {
		main.NetProcToFile("GENDTP^YIMHH",fn,b);
		cout("Экспорт завершен.");
	}
}

event mdtype_btn_export_vhtml(a,b)
{
	b = mdtype.id.data;
	if( b == "" ) return;
	main.CreateHForm("sellst.frm");
	a = main.report("sellst");
	a.lst.Style = 2;
	a.lst.Text = main.NetFunc("LSTVR^NEPRPT",b);
	a.l_doc_title.data = "Выгрузка по врачу";
	main.CreateForm("sellst.frm",0-2,1);
	if( a.ModalResult == 0 ) return;
	a = a.lst.Data;

	var fn;
	fn = disk.SaveDialog("*.htm");
	if( strlen(fn) > 0 )
	{
		main.NetProcToFile("GENDTP^YIMHH",fn,b,a);
		cout("Экспорт завершен.");
	}
}

event mdtype_btn_export_shtml(a,b)
{
	b = mdtype.id.data;
	if( b == "" ) return;
	var fn;
	fn = disk.SaveDialog("*.htm");
	if( strlen(fn) > 0 )
	{
		main.NetProcToFile("GENDTPP^YIMHH",fn,b);
		cout("Экспорт завершен.");
	}
}

event mdtype_btn_export_svhtml(a,b)
{
	b = mdtype.id.data;
	if( b == "" ) return;
	main.CreateHForm("sellst.frm");
	a = main.report("sellst");
	a.lst.Style = 2;
	a.lst.Text = main.NetFunc("LSTVR^NEPRPT",b);
	a.l_doc_title.data = "Выгрузка по врачу";
	main.CreateForm("sellst.frm",0-2,1);
	if( a.ModalResult == 0 ) return;
	a = a.lst.Data;

	var fn;
	fn = disk.SaveDialog("*.htm");
	if( strlen(fn) > 0 ) {
		main.NetProcToFile("GENDTPP^YIMHH",fn,b,a);
		cout("Экспорт завершен.");
	}
}

event mdtype_btn_import_link(a,b)
{
	mdtype.btn_import.PopupMenu(1);
}

event mdtype_btn_imp_full(a,b)
{
	var fn = "";
	fn = disk.OpenDialog(fn);
	if( strlen(fn) > 0 ) {
		main.NetPostFile("IMPORT^YIMHS",fn);
		cout("Импорт завершен.");
	}
}

event mdtype_btn_imp_txt(a,b)
{
	main.CreateHForm("etxt.frm");
	a = main.report("etxt");
	a.label.Title = "Текстовый шаблон";
	a.txt.Text = "";
	main.CreateForm("etxt.frm",0-2,1);
	if( a.ModalResult != 1 ) return;
	b = trim(a.txt.Text);
	if( strlen(b) == 0 ) return;
	main.NetPostData("INTXT^YIMHU",b);
	cout("Импорт завершен.");
}

event mdtype_tn_link(a,b)
{
	b = mdtype.tn.SelText;
	if( b == "" ) return;
	if( confirm("Удалить \""+b+"\" ?") == 0 ) return;
	mdtype.tn.Delete();
}

event mdtype_add_tn_link(a,b)
{
	main.CreateForm("vrfind.frm",0-2,1);
	if( main.report("vrfind").ModalResult != 1 ) return;
	a = main.report("vrfind");
	b = a.setvar.UserData;
	if( mdtype.tn.FindData(b) != "-1" ) return;
	mdtype.tn.Add(a.setvarn.UserData,b);
}

event mdtype_bt_subscr_link(a,b)
{
	main.CreateForm("mdsbsc.frm",0-2,1);
}

event mdtype_bt_page1_link(a,b)
{
	if( mdtype.page1.visible == "no" ) {
		mdtype.page1.visible = "yes";
		mdtype.page2.visible = "no";
		mdtype.page3.visible = "no";
		mdtype.bt_page1.FontStyle = "bold|underline";
		mdtype.bt_page2.FontStyle = "bold";
		mdtype.bt_page3.FontStyle = "bold";
	}
}

event mdtype_bt_page2_link(a,b)
{
	if( mdtype.page2.visible == "no" ) {
		mdtype.page2.visible = "yes";
		mdtype.page1.visible = "no";
		mdtype.page3.visible = "no";
		mdtype.bt_page2.FontStyle = "bold|underline";
		mdtype.bt_page1.FontStyle = "bold";
		mdtype.bt_page3.FontStyle = "bold";
	}
}

event mdtype_bt_page3_link(a,b)
{
	if( mdtype.page3.visible == "no" ) {
		mdtype.page3.visible = "yes";
		mdtype.page1.visible = "no";
		mdtype.page2.visible = "no";
		mdtype.bt_page3.FontStyle = "bold|underline";
		mdtype.bt_page1.FontStyle = "bold";
		mdtype.bt_page2.FontStyle = "bold";
	}
}

event mdtype_folder_add(a,b)
{
	a = trim(prompt("Наименование папки",""));
	if( a == "" ) return;
	mdtype.folder.text = main.NetFunc("AFT^YIMHS",a);
}

event mdtype_folder_cng(a,b)
{
	var i;
	b = mdtype.folder.data;
	if( b == "" )
	{
		cout("Папка не выбрана.");
		return;
	}
	a = mdtype.folder.SelText;
	a = trim(prompt("Наименование папки",a));
	if( a == "" ) return;
	i = mdtype.folder.index;
	mdtype.folder.text = main.NetFunc("NFT^YIMHS",b,a);
	mdtype.folder.index = i;
}

event mdtype_folder_del(a,b)
{
	b = mdtype.folder.data;
	if( b == "" )
	{
		cout("Папка не выбрана.");
		return;
	}
	if( confirm("Удалить папку ?") == 0 ) return;
	a = trim(main.NetFunc("DFT^YIMHS",b));
	if( a != "" )
	{
		cout(a);
		return;
	}
	mdtype.folder.text = main.NetFunc("LFT^YIMHS"); 
}

event mdtype_bt_fedit_link(a,b)
{
	mdtype.bt_fedit.PopupMenu(1);
}

event mdtype_spec_clear(a,b) {
	mdtype.spec.UnCheckAll();
}

event mdtype_spec_fnd(a,b) {
	var i, c, str;
	a = trim(prompt("Найти",""));
	if( a == "" ) return;
	a = strlower(a);
	c = mdtype.spec.count;
	for( i = 0 ; i < c ; i++ ) {
		str = strlower(mdtype.spec.string(i));
		if( strpos(str,a) != 0 ) {
			mdtype.spec.index = i;
			return;
		}
	}
}


event mdtype_otd_clear(a,b) {
	mdtype.otd.UnCheckAll();
}

event mdtype_otd_fnd(a,b) {
	var i, c, str;
	a = trim(prompt("Найти",""));
	if( a == "" ) return;
	a = strlower(a);
	c = mdtype.otd.count;
	for( i = 0 ; i < c ; i++ ) {
		str = strlower(mdtype.otd.string(i));
		if( strpos(str,a) != 0 ) {
			mdtype.otd.index = i;
			return;
		}
	}
}
