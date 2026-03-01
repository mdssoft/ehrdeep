[form]
SMode = 1
Name = mhist
W = 10000
H = 9100
X = 0
Y = 500
Color = $885B3D
Border = none

[css]
.ctab { border-style: solid; border-width: thin } 

[menu]
<menu name="wfnd" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
	<item name="В контингенте" cmd="mhist_wfnd_con" id="v1"/>
	<item name="В расписании" cmd="mhist_wfnd_rasp" id="v2"/>
	<item name="В журнале посещений" cmd="mhist_wfnd_jrn" id="v3"/>
	<item name="В неподписанных документах" cmd="mhist_wfnd_unsbs" id="v4"/>
	<item name="-"/>
	<item name="В журнале подразделения" cmd="mhist_wfnd_jrnot" id="v5"/>
	<item name="Аналитическая выборка" cmd="mhist_wfnd_user" id="uf"/>
</menu>
<menu name="docmenu" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
	<item name="Настройки пользователя" cmd="mhist_vr_label_link"/>
	<item name="-"/>
	<item name="Редактор справочников" cmd="mhist_sel_edit"/>
	<item name="-"/>
	<item name="Начать свободный прием" cmd="mhist_dsh_free_on"/>
	<item name="Завершить свободный прием" cmd="mhist_dsh_free_off"/>
</menu>
<menu name="sptree" color="$885B3D" fontcolor="white" selcolor="$6B462E">
	<item name="Добавить" cmd="mhist_field_sym(0,1);"/>
	<item name="Вставить" cmd="mhist_field_sym(0,7);"/>
	<item name="Очистить" cmd="mhist_field_sym(0,2);"/>
	<item name="Запятая" cmd="mhist_field_sym(0,3);"/>
	<item name="Тире" cmd="mhist_field_sym(0,4);"/>
	<item name="Точка" cmd="mhist_field_sym(0,5);"/>
	<item name="Новая строка" cmd="mhist_field_sym(0,6);"/>
	<item name="-"/>
	<item name="Следующее поле" cmd="mhist_field_next"/>
	<item name="Предыдущее поле" cmd="mhist_field_prev"/>
</menu>
<menu name="sptreetop" color="$885B3D" fontcolor="white" selcolor="$6B462E" popup="mhist_sptree_popup">
	<item name="Общий справочник" cmd="mhist_coder_common" id="cmm"/>
	<item name="Личный справочник" cmd="mhist_coder_private" id="prv"/>
	<item name="Справочник по шаблону" cmd="mhist_coder_pattern" id="pat"/>
	<item name="-"/>
	<item name="Изменить справочник" cmd="mhist_bt_coder_cfg_link" id="cdr"/>
	<item name="-" id="cdrln"/>
	<item name="Добавить" cmd="mhist_field_sym(0,1);"/>
	<item name="Вставить" cmd="mhist_field_sym(0,7);"/>
	<item name="Очистить" cmd="mhist_field_sym(0,2);"/>
	<item name="Запятая" cmd="mhist_field_sym(0,3);"/>
	<item name="Тире" cmd="mhist_field_sym(0,4);"/>
	<item name="Точка" cmd="mhist_field_sym(0,5);"/>
	<item name="Новая строка" cmd="mhist_field_sym(0,6);"/>
	<item name="-"/>
	<item name="Следующее поле" cmd="mhist_field_next"/>
	<item name="Предыдущее поле" cmd="mhist_field_prev"/>
</menu>
<menu name="spltree" color="$885B3D" fontcolor="white" selcolor="$6B462E">
	<item name="Добавить" cmd="mhist_field_sym(0,1);"/>
	<item name="Запятая" cmd="mhist_field_sym(0,3);"/>
	<item name="Тире" cmd="mhist_field_sym(0,4);"/>
	<item name="Точка" cmd="mhist_field_sym(0,5);"/>
	<item name="Новая строка" cmd="mhist_field_sym(0,6);"/>
</menu>
<menu name="usltree" color="$885B3D" fontcolor="white" selcolor="$6B462E">
	<item name="Условия по услуге" cmd="mhist_serv_info"/>
	<item name="Подробно по услуге" cmd="mhist_serv_dinf"/>
	<item name="-"/>
	<item name="Назначить услугу" cmd="mhist_serv_naz"/>
	<item name="-"/>
	<item name="Отправить на согласование" cmd="mhist_serv_sogl"/>
	<item name="-"/>
	<item name="Найти" cmd="mhist_serv_fnd"/>
</menu>
<menu name="uslmnu" color="$885B3D" fontcolor="white" selcolor="$6B462E">
	<item name="Упорядочить по коду" cmd="mhist_serv_sortc"/>
	<item name="Упорядочить по наименованию" cmd="mhist_serv_sortn"/>
	<item name="-"/>
	<item name="Все услуги" cmd="mhist_serv_dlist"/>
	<item name="Только разрешенные услуги" cmd="mhist_serv_alist"/>
	<item name="-"/>
	<item name="Найти" cmd="mhist_serv_fnd"/>
</menu>
<menu name="servtab" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
	<item name="Удалить услугу" cmd="mhist_u_delete"/>
	<item name="Очистить диагноз" cmd="mhist_serv_clrd"/>
</menu>
<menu name="vrpt" color="$DAD2CC" fontcolor="black" selcolor="$A8A898" popup="mhist_vrpt_popup">
	<item name="Копировать в редактируемый" cmd="mhist_rec_copydoc" id="cpy"/>
	<item name="Копировать в буфер документов" cmd="mhist_rec_copyclip" id="cpyc"/>
	<item name="-"/>
	<item name="Создать новый из текущего" cmd="mhist_rec_new_fromthis" id="mk"/>
	<item name="-"/>
	<item name="Подписать" cmd="mhist_vrpt_subscr" id="sbs"/>
	<item name="Подписать от имени" cmd="mhist_vrpt_subscrw" id="sbsw"/>
	<item name="Убрать подпись" cmd="mhist_vrpt_unsubscr" id="usb"/>
	<item name="Изменить" cmd="mhist_bt_hist_cng_link" id="cng"/>
	<item name="Удалить" cmd="mhist_bt_hist_print_link" id="del"/>
	<item name="-"/>
	<item name="Русский" cmd="mhist_view_lru"/>
	<item name="English" cmd="mhist_view_len"/>
	<item name="-"/>
	<item name="Администрирование" cmd="mhist_bt_hist_adm_link" id="adm"/>
	<item name="Экспорт в HTML" cmd="mhist_bt_hist_html" id="htm"/>
</menu>
<menu name="rec_inf" color="$DAD2CC" fontcolor="black" selcolor="$A8A898" popup="mhist_rinf_popup">
	<item name="О пациенте" cmd="mhist_pac_label_link"/>
	<item name="-"/>
	<item name="Смарт-карта" cmd="mhist_pac_reg_card"/>
	<item name="-"/>
	<item name="Эпикриз" cmd="mhist_bt_serv_list_link"/>
	<item name="Лист диагнозов" cmd="mhist_rec_diaglst"/>
	<item name="Лист назначений" cmd="mhist_rec_nazlst"/>
	<item name="План лечения (стоматология)" cmd="mhist_rec_nazstom" id="nzlist"/>
	<item name="Медстандарты" cmd="mhist_standart"/>
	<item name="Краткая история болезни" cmd="mhist_rec_viewepr"/>
	<item name="Зуботехнический наряд" cmd="mhist_zlab" id="zlab"/>
	<item name="Госпитализация" cmd="mhist_hosp" id="hosp"/>
	<item name="-"/>
	<item name="Условия обслуживания" cmd="mhist_infos_link"/>
	<item name="Описание программы" cmd="mhist_infot_link" id="dsc"/>
	<item name="Страховой калькулятор" cmd="mhist_serv_calc_nks" id="cnks"/>
	<item name="Гарантийные письма" cmd="mhist_grnl_link" id="grn"/>
	<item name="-"/>
	<item name="Справочник лекарств" cmd="mhist_lek_list"/>
	<item name="Нормативные документы" cmd="mhist_normo_doc"/>
	<item name="-"/>
	<item name="Калькулятор дат" cmd="mhist_daycalc"/>
</menu>
<menu name="vrptc" color="$885B3D" fontcolor="white" selcolor="$6B462E">
	<item name="Копировать" cmd="mhist_vrpt_tcpu" id="cpu"/>
	<item name="Копировать как текст" cmd="mhist_vrpt_wcpu" id="cpuw"/>
	<item name="Печать изображения" cmd="mhist_vrpt_img_prn" id="imgp"/>
	<item name="Сравнить" cmd="mhist_vrpt_cimg" id="img"/>
</menu>
<menu name="docmnu" color="$885B3D" fontcolor="white" selcolor="$6B462E">
	<item name="Изменить имя" cmd="mhist_doc_m_cname" id="cpu"/>
	<item name="-"/>
	<item name="Подписать и напечатать" cmd="mhist_doc_m_sp"/>
	<item name="-"/>
	<item name="Сохранить и закрыть" cmd="mhist_rec_sclose"/>
	<item name="-"/>
	<item name="Русский" cmd="mhist_doc_m_lru"/>
	<item name="English" cmd="mhist_doc_m_len"/>
</menu>
<menu name="servnz" color="$DAD2CC" fontcolor="black" selcolor="$A8A898">
	<item name="Детская формула" cmd="mhist_serv_nz_child"/>
	<item name="Взрослая формула" cmd="mhist_serv_nz_adult"/>
</menu>

[object]
Type = SHAPE
X = 50
Y = 100
W = 5300
H = 525
Name = shape_tit_1
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 50
Y = 1700
W = 6500
H = 400
Name = shape_left_hdr
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 3
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 50
Y = 2000
W = 6500
H = 7950
Name = shape_left
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 6600
Y = 1700
W = 3350
H = 425
Name = shape_right_hdr
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 3
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 6600
Y = 2000
W = 3300
H = 7950
Name = shape_right
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 5400
Y = 100
W = 2250
H = 525
Name = shape_pac
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = SHAPE
X = 7700
Y = 100
W = 2250
H = 525
Name = shape_doc
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $D5AD8C
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 50
Y = 700
W = 9900
H = 900
Name = pac_btns
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 50
Y = 700
W = 9900
H = 900
Name = hist_btns
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 50
Y = 700
W = 9900
H = 900
Name = rec_btns
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 50
Y = 700
W = 9900
H = 900
Name = serv_btns
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 6600
Y = 2050
W = 3350
H = 7900
Name = panel_pac
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 6600
Y = 2050
W = 3350
H = 7900
Name = panel_coder
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 200
Y = 150
W = 4100
H = 400
Name = top_title
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = bold
Color = White
Style = 136
BColor = Window
Visible = no
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 100
Y = 150
W = 1000
H = 400
Name = bt_step_pac
Title = Пациенты
UseLabel = no
UseProc = no
Link = mhist_bt_step_pac_link
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Выбрать нового пациента
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 2200
Y = 150
W = 1000
H = 400
Name = bt_hist_old
Title = История
UseLabel = no
UseProc = no
Link = mhist_bt_hist_old_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = White
Style = 0
Hint = Посмотреть медицинскую карту пациента
BColor = $DAD2CC
ExtColor = White
Visible = yes
Enabled = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 3250
Y = 150
W = 1000
H = 400
Name = bt_hist_new
Title = Документ
UseLabel = no
UseProc = no
Link = mhist_bt_hist_new_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = White
Style = 0
Hint = Сделать запись в медицинскую карту пациента
BColor = $DAD2CC
ExtColor = White
Visible = yes
Enabled = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 1150
Y = 150
W = 1000
H = 400
Name = bt_add_serv
Title = Услуги
UseLabel = no
UseProc = no
Link = mhist_bt_add_serv_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = White
Style = 0
Hint = Указать выполненные услуги
BColor = $DAD2CC
ExtColor = White
Visible = yes
Enabled = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 4300
Y = 150
W = 1000
H = 400
Name = bt_exit
Title = Выход
UseLabel = no
UseProc = no
Link = mhist_exit
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Завершить работу
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5400
Y = 350
W = 200
H = 250
Name = bt_pac_alert
UseLabel = no
File = appr16.bmp
UseProc = no
Link = mhist_pac_alert_link
Font = 5
FontSize = 5
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Показать события для данного пациента
BColor = $D5AD8C
ExtColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7720
Y = 350
W = 200
H = 250
Name = bt_vr_info
UseLabel = no
File = info16b.bmp
UseProc = no
Link = mhist_vr_label_link
Font = 5
FontSize = 5
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Изменить настройки пользователя
BColor = $D5AD8C
ExtColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = ETAB
X = 100
Y = 2050
W = 6400
H = 7800
Name = pfind
UseLabel = no
Default = № И.Б.:800;Фамилия:2000;Имя:1600;Отчество:1600;Срок:1000;Договор:2600
UseProc = no
Check = mhist_pfind_link
Link = mhist_pfind_link
Font = 6
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
Style = 2625538
BColor = $FFFBF0
ExtColor = $C78F63
Glypf = tabgrid.css
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = yes
XWrited = yes
KeyProc = mhist_pfind_key
CSS = ctab

[object]
Type = SHAPE
X = 6575
Y = 100
W = 50
H = 10000
Name = pac_btns_shape
Parent = pac_btns
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = $885B3D
ExtColor = Green
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 50
Y = 500
W = 4200
H = 4000
Name = pac_fndtxt
Parent = pac_btns
Title = Поиск в контингенте
UseLabel = yes
File = find.bmp
UseProc = yes
Font = 8
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
Style = 0
BColor = $FFFBF0
ExtColor = Text
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes
KeyProc = mhist_bt_pac_fndtxt_key
Lang = ru

[object]
Type = TE
X = 50
Y = 5250
W = 4200
H = 4000
Name = pac_fdog
Parent = pac_btns
Title = Компания
UseLabel = yes
Default = 
File = storage:dog
UseProc = yes
Font = 8
FontSize = 6
FontName = Arial
FontStyle = none
Color = Black
Style = 17
BColor = $FFFBF0
Visible = yes
XValue = no
XRequest = no
XWrited = yes

[object]
Type = D
X = 50
Y = 5250
W = 2400
H = 4000
Name = pac_fdate
Parent = pac_btns
Title = Дата расписания
UseLabel = yes
UseProc = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = none
Color = Black
Style = 1
BColor = $FFFBF0
ExtColor = Silver
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = D
X = 2950
Y = 5250
W = 1300
H = 4000
Name = pac_ftdate
Parent = pac_btns
Title = по
UseLabel = yes
UseProc = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = none
Color = Black
Style = 1
BColor = $FFFBF0
ExtColor = Silver
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CHK
X = 3050
Y = 5250
W = 1200
H = 4000
Name = pac_falpu
Parent = pac_btns
Title = Все пациенты
Link = mhist_bt_pac_fnd_link
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = none
Color = Black
Hint = Вывести всех пациентов по ЛПУ
Style = 1
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 4320
Y = 500
W = 890
H = 9000
Name = bt_pac_fnd
Parent = pac_btns
Title = Найти
UseLabel = no
File = search24.bmp
UseProc = no
Link = mhist_bt_pac_fnd_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Найти пациентов по шаблону
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no
PopupMenu = wfnd

[object]
Type = B
X = 5195
Y = 500
W = 275
H = 9000
Name = bt_cng_fnd
Parent = pac_btns
Title = \\\?
UseLabel = no
UseProc = no
Link = mhist_bt_cng_fnd_link
Font = 9
FontSize = 8 
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Изменить вид поиска
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5510
Y = 500
W = 1020
H = 9000
Name = bt_pac_sort
Parent = pac_btns
Title = Упорядочить
UseLabel = no
File = sortc24.bmp
UseProc = no
Link = mhist_bt_pac_sort_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Сортировать таблицу поиска по фамилии пациента
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6705
Y = 500
W = 1020
H = 9000
Name = bt_pac_create
Parent = pac_btns
Title = Подробно
UseLabel = no
File = piplcard.bmp
UseProc = no
Link = mhist_bt_pac_detail_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Показать подробную информацию о выбранном пациенте
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7800
Y = 500
W = 1020
H = 9000
Name = bt_pac_epi
Parent = pac_btns
Title = Эпикриз
UseLabel = no
File = img_alist4.bmp
UseProc = no
Link = mhist_bt_pac_epi_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Показать подробную информацию по услугам пациента
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 8900
Y = 500
W = 1020
H = 9000
Name = bt_pac_naz
Parent = pac_btns
Title = Назначения
UseLabel = no
File = vrasp24.bmp
UseProc = no
Link = mhist_bt_pac_naz_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Показать подробную информацию по назначениям пациента
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 100
Y = 1725
W = 200
H = 300
Name = bt_rec_mnu
UseLabel = no
File = infoc16.bmp
UseProc = no
Link = mhist_rec_mnu
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Действия над документом
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no
PopupMenu = docmnu

[object]
Type = B
X = 100
Y = 1725
W = 200
H = 300
Name = bt_serv_mnu
UseLabel = no
File = infoc16.bmp
UseProc = no
Link = mhist_serv_mnu
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Представление списка услуг
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no
PopupMenu = uslmnu

[object]
Type = L
X = 150
Y = 1725
W = 5500
H = 500
Name = l_doc_title
Title = Выбор пациента
UseLabel = no
UseProc = no
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = Black
Style = 9
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 6750
Y = 1725
W = 5000
H = 400
Name = r_doc_title
Title = Информация о пациенте
UseLabel = no
UseProc = no
Link = mhist_r_doc_title
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = Black
Style = 0
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 7850
Y = 1740
W = 1000
H = 300
Name = btn_prev_doc
Title = Назад
UseLabel = no
UseProc = no
Link = mhist_prev_vdoc
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = none
Hint = Вернуться к предыдущему документу
Color = Black
Style = 10
BColor = $D5AD8C
ExtColor = White
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 8900
Y = 1740
W = 1000
H = 300
Name = btn_next_doc
Title = Следующий
UseLabel = no
UseProc = no
Link = mhist_next_vdoc
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = none
Hint = Перейти к следующему документу
Color = Black
Style = 10
BColor = $D5AD8C
ExtColor = White
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 200
Y = 9400
W = 3500
H = 525
Name = bt_pac_mview
Parent = panel_pac
Title = Просмотр >>
UseLabel = no
UseProc = no
Link = mhist_bt_pac_mview_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Выбрать пациента для просмотра\r\nего истории болезни
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 3750
Y = 9400
W = 2500
H = 525
Name = bt_pac_date
Parent = panel_pac
UseLabel = no
UseProc = no
Link = mhist_bt_pac_date_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Выбрать дату приема пациента
BColor = $DAD2CC
ExtColor = White
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6300
Y = 9400
W = 3500
H = 525
Name = bt_pac_sel
Parent = panel_pac
Title = Выбрать >>
UseLabel = no
UseProc = no
Link = mhist_bt_pac_sel_stage1
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Выбрать пациента и начать прием
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = L
X = 5450
Y = 100
W = 2150
H = 500
Name = pac_label
Title = ---
UseLabel = no
UseProc = no
Link = mhist_pac_label_link
Font = 7
FontSize = 7
FontName = Arial
FontStyle = none
Color = $4E3423
Style = 154
Hint = Пациент
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 7750
Y = 100
W = 2100
H = 500
Name = vr_label
Title = ---
UseLabel = no
UseProc = no
Link = mhist_vr_label_link
Font = 7
FontSize = 7
FontName = Arial
FontStyle = none
Color = $4E3423
Style = 154
Hint = Врач
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes
PopupMenu = docmenu

[object]
Type = FLST
X = 125
Y = 0
W = 9850
H = 9350
Name = inf
Parent = panel_pac
UseLabel = no
UseProc = no
Link = mhist_inf_link
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 2
BColor = $D5AD8C
ExtColor = Black
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = I
X = 6570
Y = 200
W = 3330
H = 2620
Name = foto
Parent = panel_pac
Title = Image
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 10
Glyph = .jpg
BColor = Window
Visible = yes
XValue = no
XRequest = no
XWrited = yes

[object]
Type = OBJ
Name = pac_id
UseProc = no
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 50
Y = 1000
W = 2500
H = 3000
Name = hist_vtype_label
Parent = hist_btns
Title = Представление истории болезни
UseLabel = no
UseProc = no
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 9
Hint = Выберите, какое представление истории \r\nболезни Вам требуется.
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 2740
Y = 1000
W = 210
H = 3100
Name = hist_order
Parent = hist_btns
UseLabel = no
File = order16d.bmp
UseProc = no
Link = mhist_vorder_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Изменить порядок сортировки по датам
BColor = $D5AD8C
ExtColor = $D0A480
Visible = yes
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 2990
Y = 1000
W = 210
H = 3100
Name = hist_dates
Parent = hist_btns
UseLabel = no
File = tfilter16.bmp
UseProc = no
Link = mhist_vdates_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Показать документы за период
BColor = $D5AD8C
ExtColor = $D0A480
Visible = yes
XValue = no
XRequest = no
XWrited = no

[object]
Type = T
X = 50
Y = 5250
W = 3100
H = 4000
Name = hist_vtype
Parent = hist_btns
UseLabel = no
Default = 0
File = string:0|В хронологии\r\n1|По виду документов\r\n4|По разделам\r\n10|По случаям\r\n8|По специальности\r\n9|По автору\r\n7|Линейно\r\n5|По выполненным направлениям\r\n6|Персональные\r\n2|Избранное\r\n3|Неподписанные документы
UseProc = no
Check = mhist_hist_vtype_link
Font = 7
FontSize = 6
FontName = Arial
FontStyle = none
Color = Black
Style = 65
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 3250
Y = 500
W = 1020
H = 9000
Name = bt_hist_findt
Parent = hist_btns
Title = Найти по имени
UseLabel = no
File = search24.bmp
UseProc = no
Link = mhist_bt_hist_findt_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Найти документ в истории болезни по его имени
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 4320
Y = 500
W = 1020
H = 9000
Name = bt_hist_print
Parent = hist_btns
Title = Печать
UseLabel = no
File = img_print4.bmp
UseProc = no
Link = mhist_bt_hist_print_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Hint = Печать выбранного документа
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5390
Y = 500
W = 1020
H = 9000
Name = bt_hist_cng
Parent = hist_btns
Title = Изменить
UseLabel = no
File = resave24.bmp
UseProc = no
Link = mhist_bt_hist_cng_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Hint = Изменить выбранный документ
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6460
Y = 500
W = 1020
H = 9000
Name = bt_hist_mark
Parent = hist_btns
Title = В избранное
UseLabel = no
File = private24.bmp
UseProc = no
Link = mhist_bt_hist_mark_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Hint = Добавить выбранный документ в список избранных документов
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7530
Y = 500
W = 1020
H = 9000
Name = bt_hist_copy
Parent = hist_btns
Title = Копировать
UseLabel = no
File = copy24.bmp
UseProc = no
Link = mhist_bt_hist_copy_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Hint = Копировать содержимое в буфер документов
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 8600
Y = 500
W = 1020
H = 9000
Name = bt_hist_exp
Parent = hist_btns
Title = Выписка
UseLabel = no
File = rmail24.bmp
UseProc = no
Link = mhist_bt_hist_exp_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Hint = Печать выписки из представленного списка документов
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = TREE
X = 100
Y = 2050
W = 3200
H = 7800
Name = hist_view
Title = История болезни
UseLabel = no
UseProc = no
Check = mhist_hist_view_link
Font = 8
FontSize = 8
FontName = Arial
FontStyle = none
Color = Black
Style = 20
Glypf = mhtree.bmp
BColor = Window
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = TXT
X = 3450
Y = 2050
W = 6450
H = 7550
Name = vtext
Title = RichEdit
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontStyle = none
Color = Black
Style = 12
BColor = Window
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = ETAB
X = 3450
Y = 2050
W = 6450
H = 7550
Name = vtable
UseLabel = no
UseProc = no
Link = mhist_vtable_link
Font = 6
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
Style = 2625538
BColor = $FFFBF0
ExtColor = $C78F63
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = yes
XWrited = yes
CSS = ctab

[object]
Type = RPT
X = 3450
Y = 2050
W = 6450
H = 7550
Name = vrpt
UseLabel = no
UseProc = no
Font = 7
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
BColor = $FFFBF0
ExtColor = $885B3D
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = yes
XWrited = yes
PopupMenu = vrpt

[object]
Type = SIMG
X = 3450
Y = 2050
W = 6450
H = 7550
Name = vimage
Title = Image
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = Window
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = FLST
X = 3450
Y = 9650
W = 6400
H = 300
Name = vinfo
UseLabel = no
UseProc = no
Font = 6
FontSize = 6
FontName = Arial
FontStyle = bold
Color = black
Style = 4
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = PNL
X = 50
Y = 2050
W = 6500
H = 7800
Name = panel_etext
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = TXT
X = 100
Y = 0
W = 9800
H = 9500
Name = etext
Parent = panel_etext
Title = RichEdit
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 3
BColor = Window
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 100
Y = 9550
W = 400
H = 400
Name = btn_etext_bold
Parent = panel_etext
Title = Ж
UseLabel = no
UseProc = no
Link = mhist_btn_etext_bold_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Жирный шрифт
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 600
Y = 9550
W = 400
H = 400
Name = btn_etext_italic
Parent = panel_etext
Title = К
UseLabel = no
UseProc = no
Link = mhist_btn_etext_italic_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = italic
Color = Black
Style = 0
Hint = Наклонный шрифт
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 1100
Y = 9550
W = 400
H = 400
Name = btn_etext_under
Parent = panel_etext
Title = Ч
UseLabel = no
UseProc = no
Link = mhist_btn_etext_under_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = underline
Color = Black
Style = 0
Hint = Подчеркнутый шрифт
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = BVL
X = 1550
Y = 9500
W = 100
H = 500
Name = bvl_etext_1
Parent = panel_etext
Title = Bevel
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 4
BColor = Window
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 1700
Y = 9550
W = 1500
H = 400
Name = etext_fsize
Parent = panel_etext
Title = Шрифт
UseLabel = yes
Default = 8
File = string:8|8\r\n10|10\r\n12|12\r\n14|14\r\n16|16
UseProc = yes
Check = etext_fsize_check
Font = 7
FontSize = 6
FontName = Arial
FontStyle = bold
Color = $FFFBF0
Style = 1
Hint = Изменить размер шрифта
BColor = $FFFBF0
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = BVL
X = 3250
Y = 9500
W = 100
H = 500
Name = bvl_etext_2
Parent = panel_etext
Title = Bevel
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 4
BColor = Window
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 3400
Y = 9550
W = 400
H = 400
Name = btn_etext_black
Parent = panel_etext
UseLabel = no
UseProc = no
Link = mhist_btn_etext_black_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Черный цвет текста
BColor = Black
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 3900
Y = 9550
W = 400
H = 400
Name = btn_etext_blue
Parent = panel_etext
UseLabel = no
UseProc = no
Link = mhist_btn_etext_blue_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Синий цвет текста
BColor = Blue
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 4400
Y = 9550
W = 400
H = 400
Name = btn_etext_red
Parent = panel_etext
UseLabel = no
UseProc = no
Link = mhist_btn_etext_red_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Красный цвет текста
BColor = Red
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = BVL
X = 4850
Y = 9500
W = 100
H = 500
Name = bvl_etext_3
Parent = panel_etext
Title = Bevel
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 4
BColor = Window
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 5000
Y = 9550
W = 400
H = 400
Name = btn_etext_left
Parent = panel_etext
UseLabel = no
File = fleft.bmp
UseProc = no
Link = mhist_btn_etext_left_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Форматировать текст по левому краю
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5500
Y = 9550
W = 400
H = 400
Name = btn_etext_center
Parent = panel_etext
UseLabel = no
File = fcenter.bmp
UseProc = no
Link = mhist_btn_etext_center_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Центрировать текст
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6000
Y = 9550
W = 400
H = 400
Name = btn_etext_right
Parent = panel_etext
UseLabel = no
File = fright.bmp
UseProc = no
Link = mhist_btn_etext_right_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Форматировать текст по правому краю
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = BVL
X = 6450
Y = 9500
W = 100
H = 500
Name = bvl_etext_4
Parent = panel_etext
Title = Bevel
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 4
BColor = Window
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 6600
Y = 9550
W = 400
H = 400
Name = btn_etext_undo
Parent = panel_etext
UseLabel = no
File = undo.bmp
UseProc = no
Link = mhist_btn_etext_undo_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = Black
Style = 0
Hint = Отменить изменения текста
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = ETAB
X = 100
Y = 2050
W = 6400
H = 7800
Name = etable
UseLabel = no
UseProc = no
Font = 6
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
Style = 4099
BColor = $FFFBF0
ExtColor = $C78F63
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = yes
XWrited = yes
CSS = ctab

[object]
Type = RPT
X = 100
Y = 2050
W = 6400
H = 7800
Name = erpt
UseLabel = no
UseProc = no
Font = 7
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
BColor = $FFFBF0
ExtColor = $885B3D
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = yes
XWrited = yes

[object]
Type = I
X = 100
Y = 2050
W = 6400
H = 7800
Name = eimage
Title = Image
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 0
BColor = Window
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 5050
Y = 1725
W = 200
H = 300
Name = bt_rec_cng
UseLabel = no
File = puzzle16.bmp
UseProc = no
Link = mhist_rec_changedoc
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Изменить шаблон документа
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5300
Y = 1725
W = 200
H = 300
Name = bt_rec_inrtf
UseLabel = no
File = inopen16.bmp
UseProc = no
Link = mhist_rec_inrtf
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Вставить текст из файла
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5550
Y = 1725
W = 200
H = 300
Name = bt_rec_clipb
UseLabel = no
File = paste_add16.bmp
UseProc = no
Link = mhist_bt_rec_clipb_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Вставить из буфера документов
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5800
Y = 1725
W = 200
H = 300
Name = bt_rec_clcut
UseLabel = no
File = cut16.bmp
UseProc = no
Link = bt_rec_clcut_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Вырезать в буфер обмена
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6050
Y = 1725
W = 200
H = 300
Name = bt_rec_clcopy
UseLabel = no
File = copy16.bmp
UseProc = no
Link = bt_rec_clcopy_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Копировать в буфер обмена
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6300
Y = 1725
W = 200
H = 300
Name = bt_rec_clpaste
UseLabel = no
File = paste16.bmp
UseProc = no
Link = bt_rec_clpaste_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Вставить из буфера обмена
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6600
Y = 1725
W = 200
H = 300
Name = bt_coder_mnu
UseLabel = no
File = infoc16.bmp
UseProc = no
Link = mhist_rdoc_menu
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Действия над справочником
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no
PopupMenu = sptreetop

[object]
Type = B
X = 9450
Y = 1725
W = 200
H = 300
Name = bt_coder_expand
UseLabel = no
File = down16b.bmp
UseProc = no
Link = mhist_bt_coder_expand_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Развернуть справочник
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 9725
Y = 1725
W = 200
H = 300
Name = bt_coder_cfg
UseLabel = no
File = tools16.bmp
UseProc = no
Link = mhist_bt_coder_cfg_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = bold
Color = White
Style = 10
Hint = Изменить справочник
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = TREE
X = 100
Y = 0
W = 9800
H = 9950
Name = coder_tree
Parent = panel_coder
Title = История болезни
UseLabel = no
UseProc = no
Check = mhist_coder_help
Link = mhist_coder_tree_link
Font = 7
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
Style = 16
BColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes
PopupMenu = sptree
KeyProc = mhist_coder_tree_key

[object]
Type = B
X = 50
Y = 500
W = 1020
H = 9000
Name = bt_rec_create
Parent = rec_btns
Title = Создать
UseLabel = no
File = docadd24.bmp
UseProc = no
Link = mhist_bt_rec_create_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 1120
Y = 500
W = 1020
H = 9000
Name = bt_rec_fill
Parent = rec_btns
Title = Заполнить
UseLabel = no
File = fill24.bmp
UseProc = no
Link = mhist_bt_rec_fill_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Hint = Заполнить документ
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 2175
Y = 500
W = 1020
H = 9000
Name = bt_rec_save
Parent = rec_btns
Title = Сохранить
UseLabel = no
File = img_save4.bmp
UseProc = no
Link = mhist_bt_rec_save_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 3250
Y = 500
W = 1020
H = 9000
Name = bt_rec_subscr
Parent = rec_btns
Title = Подписать
UseLabel = no
File = subscr2.bmp
UseProc = no
Link = mhist_bt_rec_subscr_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 4320
Y = 500
W = 1020
H = 9000
Name = bt_rec_print
Parent = rec_btns
Title = Печать
UseLabel = no
File = img_print4.bmp
UseProc = no
Link = mhist_bt_rec_print_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5375
Y = 500
W = 1020
H = 9000
Name = bt_rec_delete
Parent = rec_btns
Title = Удалить
UseLabel = no
File = doctxtdel24.bmp
UseProc = no
Link = mhist_bt_rec_delete_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6430
Y = 500
W = 1020
H = 9000
Name = bt_rec_inform
Parent = rec_btns
Title = Информация
UseLabel = no
File = important24.bmp
UseProc = no
Link = mhist_bt_rec_inform_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no
PopupMenu = rec_inf

[object]
Type = L
X = 7500
Y = 1000
W = 2000
H = 3000
Name = rec_docs_label
Parent = rec_btns
Title = Открытые документы
UseLabel = no
UseProc = no
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 9
Hint = Перечень документов, с которыми идет работа.\r\nВыберите требуемый.
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 9300
Y = 1000
W = 400
H = 3000
Name = rec_docs_prev
Parent = rec_btns
Title = <<<
UseLabel = no
UseProc = no
Link = mhist_rec_prev_doc
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 9
Hint = Выбрать предыдущий документ
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 9700
Y = 1000
W = 400
H = 3000
Name = rec_docs_next
Parent = rec_btns
Title = >>>
UseLabel = no
UseProc = no
Link = mhist_rec_next_doc
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 9
Hint = Выбрать следующий документ
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = T
X = 7500
Y = 5250
W = 2450
H = 4000
Name = rec_docs
Parent = rec_btns
UseLabel = no
Default = 999
File = string:0|Нет
UseProc = no
Check = mhist_rec_docs_check
Font = 7
FontSize = 6
FontName = Arial
FontStyle = none
Color = Black
Style = 1
BColor = $FFFBF0
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = TREE
X = 100
Y = 2050
W = 5650
H = 5250
Name = left_tree
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = Arial
FontStyle = none
Color = Black
Style = 68
Glypf = mhtree.bmp
BColor = Window
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes
CSS = ctab

[object]
Type = FLST
X = 2000
Y = 1750
W = 3700
H = 300
Name = servinfo
UseLabel = no
UseProc = no
Font = 6
FontSize = 6
FontName = Arial
FontStyle = bold
Color = White
Style = 12
BColor = $D5AD8C
ExtColor = $D0A480
Visible = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = FLST
X = 2500
Y = 7375
W = 7400
H = 1000
Name = servmenu
UseLabel = no
UseProc = no
Link = mhist_servmenu
Font = 7
FontSize = 7
FontName = Arial
FontStyle = bold
Color = Black
Style = 12
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 5500
Y = 1750
W = 1000
H = 300
Name = btn_left
Title = Отмена
UseLabel = no
UseProc = no
Font = 7
FontSize = 7
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
BColor = $DAD2CC
ExtColor = White
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = OBJ
Name = rec_desc
UseProc = no
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = OBJ
Name = exchange
UseProc = no
XValue = no
XRequest = no
XWrited = no

[object]
Type = PNL
X = 5800
Y = 1700
W = 4050
H = 5600
Name = panel_usl
UseLabel = no
UseProc = no
Font = 8
FontSize = 8
FontName = MS Sans Serif
FontStyle = none
Color = Text
Style = 2
BColor = $D5AD8C
Visible = no
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 50
Y = 700
W = 4300
H = 650
Name = serv
Parent = panel_usl
Title = Код услуги 
UseLabel = yes
UseProc = yes
Check = mhist_u_serv_check
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 16
Hint = Код диагноза
BColor = White
ExtColor = Text
Visible = yes
XValue = no
XRequest = no
XWrited = yes

[object]
Type = DIG
X = 6500
Y = 700
W = 3500
H = 650
Name = serv_count
Parent = panel_usl
Title = Количество 
UseLabel = yes
UseProc = no
LabelLink = mhist_serv_count_onlabel
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 0
BColor = White
ExtColor = Text
Visible = yes
XValue = no
XRequest = no
XWrited = yes
ExitLink = mhist_serv_count_exit

[object]
Type = ES
X = 7050
Y = 700
W = 3000
H = 650
Name = serv_nz
Parent = panel_usl
Title = Зуб
UseLabel = yes
UseProc = no
Link = mhist_serv_nz_link
LabelLink = mhist_serv_nz_onlabel
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
File = tooth.bmp
Hint = Номер зуба
Color = White
BColor = White
ExtColor = Text
Visible = no
XValue = no
XRequest = no
XWrited = yes
PopupMenu = servnz

[object]
Type = L
X = 0
Y = 1500
W = 9950
H = 1000
Name = serv_name
Parent = panel_usl
UseLabel = no
UseProc = no
Font = 6
FontSize = 6
FontName = Arial
FontStyle = italic
Color = Black
Style = 9
BColor = Window
Visible = yes
XValue = no
XRequest = no
XWrited = yes

[object]
Type = S
X = 50
Y = 2100
W = 4300
H = 650
Name = serv_diag
Parent = panel_usl
Title = Код диагноза 
UseLabel = yes
UseProc = yes
Check = mhist_u_diag_check
LabelLink = mhist_serv_diag_onlabel
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 0
Hint = Код диагноза
BColor = White
ExtColor = Text
Visible = yes
XValue = no
XRequest = no
XWrited = yes
KeyProc = mhist_u_diag_key
Lang = en

[object]
Type = B
X = 4700
Y = 2100
W = 2000
H = 650
Name = serv_diagsel_bt
Parent = panel_usl
Title = Найти
UseLabel = no
UseProc = no
Link = mhist_serv_diagsel_bt_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Выбрать диагноз из списка
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7000
Y = 2100
W = 3000
H = 650
Name = serv_udiag_bt
Parent = panel_usl
Title = Лист диагнозов
UseLabel = no
UseProc = no
Link = mhist_serv_udiag_bt_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Выбрать из листа уточнынных диагнозоа пациента
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = L
X = 0
Y = 2900
W = 9950
H = 1000
Name = serv_ldiag
Parent = panel_usl
Title = 
UseLabel = no
UseProc = no
Font = 6
FontSize = 6
FontName = Arial
FontStyle = italic
Color = Black
Style = 9
BColor = Window
Visible = yes
XValue = no
XRequest = no
XWrited = yes

[object]
Type = CLST
X = 0
Y = 3500
W = 10000
H = 5500
Name = serv_flags
Parent = panel_usl
UseLabel = no
Default = 0
UseProc = no
Check = mhist_serv_flags_chk
Link = mhist_serv_flags_link
Font = 7
FontSize = 6
FontName = Arial
FontStyle = none
Color = Black
Style = 1
BColor = $D5AD8C
Visible = yes
XValue = no
XRequest = no
XWrited = yes
KeyProc = mhist_usl_flg_key
CSS = ctab

[object]
Type = S
X = 0
Y = 9200
W = 7700
H = 650
Name = serv_comm
Parent = panel_usl
Title = Примечание
UseLabel = yes
UseProc = no
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 0
Hint = Комментарий
BColor = White
ExtColor = Text
Visible = yes
XValue = no
XRequest = no
XWrited = yes

[object]
Type = B
X = 8000
Y = 9200
W = 2000
H = 650
Name = serv_add_bt
Parent = panel_usl
Title = Добавить
UseLabel = no
UseProc = no
Link = mhist_serv_add_bt_link
Font = 8
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 0
Hint = Добавить услугу
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = ETAB
X = 100
Y = 7700
W = 9800
H = 2200
Name = table_usl
UseLabel = no
Default = № И.Б.:750;Диагноз:2500;Статусы:1050;Услуга:2850;К-во:450;Цена:600;Примечание:1500
UseProc = no
Link = mhist_usl_table_link
Check = mhist_usl_table_help
Font = 7
FontSize = 7
FontName = Arial
FontStyle = none
Color = Black
Style = 548866
Glypf = inusl.css
BColor = $FFFBF0
ExtColor = $72ABCF
Visible = no
XValue = no
XRequest = yes
XWrited = yes
KeyProc = mhist_usl_tab_key
PopupMenu = servtab
CSS = ctab

[object]
Type = B
X = 50
Y = 500
W = 1020
H = 9000
Name = bt_serv_add
Parent = serv_btns
Title = Добавить
UseLabel = no
File = add3.bmp
UseProc = no
Link = mhist_usl_table_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Добавить выбранную услугу
BColor = $DAD2CC
ExtColor = White
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 1120
Y = 500
W = 1020
H = 9000
Name = bt_serv_deld
Parent = serv_btns
Title = Удалить
UseLabel = no
File = del2.bmp
UseProc = no
Link = mhist_u_delete
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Удалить выбранную в таблице услугу
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 2175
Y = 500
W = 1020
H = 9000
Name = bt_serv_cng
Parent = serv_btns
Title = Исправить
UseLabel = no
File = cng2.bmp
UseProc = no
Link = mhist_bt_serv_cng_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Исправить указанную услугу
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 3250
Y = 500
W = 1020
H = 9000
Name = bt_serv_subscr
Parent = serv_btns
Title = Подписать
UseLabel = no
File = subscr2.bmp
UseProc = no
Link = mhist_bt_serv_subscr_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Подписать пациенту выполненные услуги
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 4320
Y = 500
W = 1020
H = 9000
Name = bt_serv_kvit
Parent = serv_btns
Title = Квитанция
UseLabel = no
File = cash2.bmp
UseProc = no
Link = mhist_bt_serv_kvit_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Печать квитанции оказанных услуг
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 5390
Y = 500
W = 1020
H = 9000
Name = bt_serv_list
Parent = serv_btns
Title = Эпикриз
UseLabel = no
File = img_alist4.bmp
UseProc = no
Link = mhist_bt_serv_list_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Сводка по услугам пациента
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 6460
Y = 500
W = 1020
H = 9000
Name = bt_serv_calc
Parent = serv_btns
Title = Калькулятор
UseLabel = no
File = calc24.bmp
UseProc = no
Link = mhist_bt_serv_calc_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Калькулятор назначенных услуг
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = B
X = 7530
Y = 500
W = 1020
H = 9000
Name = bt_serv_infos
Parent = serv_btns
Title = Информация
UseLabel = no
File = important24.bmp
UseProc = no
Link = mhist_bt_serv_infos_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no
PopupMenu = rec_inf

[object]
Type = B
X = 8600
Y = 500
W = 1020
H = 9000
Name = bt_serv_find
Parent = serv_btns
Title = Учет работы
UseLabel = no
File = doc2.bmp
UseProc = no
Link = mhist_bt_serv_find_link
Font = 6
FontSize = 8
FontName = Times New Roman
FontStyle = none
Color = Black
Style = 32
Hint = Печать единого документа учета работы
BColor = $DAD2CC
ExtColor = $DAD2CC
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = no

[object]
Type = L
X = 50
Y = 0
W = 4000
H = 1000
Name = usl_deposit_label
Parent = panel_usl
Title = Состояние счета:
UseLabel = no
UseProc = no
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = White
Style = 9
Hint = Пациент
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[object]
Type = L
X = 3800
Y = 0
W = 3500
H = 1000
Name = usl_deposit
Parent = panel_usl
Title = не используется
UseLabel = no
UseProc = no
Font = 8
FontSize = 7
FontName = Arial
FontStyle = bold
Color = Black
Style = 9
BColor = $D5AD8C
Visible = yes
XPath = /nb_console/mhist/
XValue = no
XRequest = no
XWrited = yes

[request]
name = savetable
question = etable
question = pac_id
question = rec_desc
name = savetext
question = etext
question = pac_id
question = rec_desc

[group]
close_rec=rec_btns,panel_etext,etable,erpt,eimage,panel_coder,btn_left,bt_rec_clcut,bt_rec_clcopy,bt_rec_clpaste,bt_coder_cfg,bt_coder_mnu,bt_coder_expand,bt_rec_clipb,bt_rec_inrtf,bt_rec_cng,bt_rec_mnu
close_hist=hist_btns,hist_view,vtext,vtable,vrpt,vimage,vinfo,btn_next_doc,btn_prev_doc
rec_navigate=rec_docs,rec_docs_label,rec_docs_next,rec_docs_prev
rec_clipb=bt_rec_clcut,bt_rec_clcopy,bt_rec_clpaste
rec_clipba=bt_rec_clcut,bt_rec_clcopy,bt_rec_clpaste,bt_rec_clipb,bt_rec_inrtf,bt_rec_cng
rec_closedocs=panel_etext,etable,erpt,eimage
rec_opendocs=rec_btns,panel_coder,bt_coder_cfg,bt_coder_mnu
add_serv=serv_btns,left_tree,panel_usl,servmenu,table_usl,servinfo,bt_serv_mnu
hbtn=bt_hist_new,bt_add_serv,bt_hist_old
mbtn=bt_step_pac,bt_hist_new,bt_add_serv,bt_hist_old,bt_exit
doc_btns=bt_rec_fill,bt_rec_save,bt_rec_subscr,bt_rec_print,bt_rec_delete,bt_rec_inform,bt_rec_mnu,panel_coder,bt_coder_cfg,bt_coder_mnu,r_doc_title
doc_allbtns=bt_rec_create,bt_rec_fill,bt_rec_save,bt_rec_subscr,bt_rec_print,bt_rec_delete,bt_rec_inform,bt_rec_mnu

[script]
var pid, mhist_cur_format, mhist_cur_store, mhutil, mhdate;
var mhist_view_doc;
var mhist_mode; // 1 - patients, 2 - history, 3 - record, 4 - services
var mhist_coder_nrep; // имя выбранного элемента в rep
var mhist_serv_idx; // текущая услуга
var mhist_pac_fio;
var mhist_usl_flg;
var mhist_usl_sub;
var mhist_vm; // view mode

var mhist_tag; // поле при автозаполнении
var mhist_docs; // перечень редактируемых документов
var mhist_view; // документ на просмотре
var mhist_clbrd; // буфер обмена
var mhist_cfg; // конфигурация
var mhist_diag; // текущий диагноз
var mhist_diagt;
var mhist_vstk; // стек возврата при просмотре документов
var mhist_incopy; // буфер системного копирования между документами

var mhist_lang;

// constants
var mhist_const_wfnd_tab;

// document string: 	format~file name~additional data~type~system code~is subscribe~not null~pattern colection~read only
//			1	2		3	    4	5		6         7		8	     9

// template string:	<docname>~type id~format~file name~additional data~type~pattern collection~is profile

// pattern collection - набор шаблонов для правой части

// type in document - type of data process (sample, for table: AD/glucose)

event mhist_alert(a,b);

event mhist_rec_docs_clear(a,b);
event mhist_rec_docs_tsave(a,b);
event mhist_rec_docs_check(a,b);
event mhist_bt_rec_create_link(a,b);
event mhist_bt_rec_create_close(a,b);
event mhist_pfind_link(a,b);
event mhist_bt_step_pac_link(a,b);
event mhist_usl_chksub(a,b);
event mhclip_set_state(a,b);
event mhclip_all_add(a,b);
event mhist_hist_view_link(a,b);
event mhist_hist_vtype_chk(a,b);
event mhist_bt_serv_subscr_link(a,b);
event mhist_bt_rec_close(a,b);
event mhist_bt_rec_save_link(a,b);
event mhist_hist_vtype_link(a,b);
event mhist_wfnd_sel(a,b);
event mhist_wfnd_con(a,b);
event mhist_wfnd_clr(a,b);
event mhist_bt_pac_fnd_link(a,b);
event mhist_bt_pac_sel_stage1(a,b);
event mhist_bt_rec_create_select(a,b);

function mhist_load_in_edit(id,b);
function mhist_exe_menu_plg(plg,ext);

event mhist_after_start(a,b)
{
	stop_timer();

	var x;

	if( (mhist_cfg.chkms == 1)&&(ms_id == 0) ) { // проверка медсестры
		a = trim(main.NetFunc("MSLIST^NEDE",otd_id,vr_id,spec_id,"",1));
		if( a != "" ) {
			main.CreateHForm("sellstn.frm");
			b = main.sellstn;
			b.lst.style = 2;
			b.lst.Text = a;
			b.l_doc_title.data = "Медсестра, работающая с Вами";
			if( main.CreateForm("sellstn.frm",0-2,1) == 0 ) return;
			if( b.ModalResult == 1 ) {
				x = b.lst.data;
				if( x != "" ) {
					a = trim(main.NetFunc("MSSET^NEDE",otd_id,vr_id,spec_id,trim(mhist.inf.i("sdate")),x));
					if( (a != "")&&(a != "xml") ) {
						mhist_alert(a,0);
						return;
					}
				}
				ms_id = x;
			}
		}
	}
}

event mhist_exit(a,b)
{
	mhist_usl_sub = 0;
	if( mhist.panel_pac.visible == "no" )
		mhist_bt_step_pac_link(0,0);
	if( mhist_usl_sub == 99 ) return;
	mhist.Close();
}

event mhistClose(a,b)
{
	mifare_unregister("mhist_smartcard");
	main.NetProc("END^YIMHP");
}

event mhist_msg_vm_usl(a,b)
{
	message_alert("Регистрация услуг \r\nв режиме просмотра запрещена.",0);
}

event mhist_msg_vm_doc(a,b)
{
	message_alert("Создание новых документов\r\nв режиме просмотра запрещено.",0);
}

event mhist_msg_notsel_pac(a,b)
{
	message_alert("Пациент не выбран.",0);
}

event mhist_msg_notsel_doc(a,b)
{
	message_alert("Документ не выбран.",0);
}

event mhist_quest(a,b)
{
	a = mhutil.MessageBox(a,"Внимание","MB_YESNO,MB_ICONQUESTION");
	return a;
}

event mhist_apin(a,b)
{
	store.Set("env","title","Введите PIN-код");
	if( main.CreateForm("passwd.frm",0-2,1) == 0 ) return;
	b = main.passwd;
	if( b.ModalResult != 1 ) return;
	a = b.pass.data; 
	return a;
}

event mhist_error(a,b)
{
	if( mhist_cfg.speak > 1 ) speak_speech(a);
	mhutil.MessageBox(a,"Ошибка","MB_OK,MB_ICONWARNING");
}

event mhist_alert(a,b)
{
	mhutil.MessageBox(a,"Внимание","MB_OK,MB_ICONWARNING");
}

event mhist_info(a,b)
{
	if( b == "" ) b = "Внимание";
	mhutil.MessageBox(a,b,"MB_OK,MB_ICONINFORMATION");
}

event mhist_infostop(a,b)
{
	if( mhist_cfg.speak > 1 ) speak_speech(a);
	mhutil.MessageBox(a,"Внимание","MB_OK,MB_ICONSTOP");
}

event mhist_close_pac(a,b)
{
	if( mhist.pac_btns.visible == "no" ) return;
	mhist.bt_step_pac.FontStyle = "none";
	mhist.panel_pac.visible = "no";
	mhist.pac_btns.visible = "no";
	mhist.pfind.visible = "no";
	mhist.bt_pac_sort.visible = "no";
}

event mhist_close_rec(a,b)
{ // todo сохранение
	mhist_rec_docs_tsave(0,0);
	if( mhist.rec_btns.visible == "no" ) return;
	mhist_cur_format = "";
	mhist_cur_store = "";

	mhist.bt_hist_new.FontStyle = "none";
	mhist.SetGroupPrm("close_rec","visible","no");
	main.CloseForm("mhinrtf");
}

event mhist_close_hist(a,b)
{
	if( mhist.hist_btns.visible == "no" ) return;
	mhist.bt_hist_old.FontStyle = "none";
	mhist.SetGroupPrm("close_hist","visible","no");
}

event mhist_close_serv(a,b)
{
	if( mhist.serv_btns.visible == "no" ) return;
	mhist.r_doc_title.y = 1725;
	mhist.shape_right_hdr.visible = "yes";
	mhist.shape_right.visible = "yes";
	mhist.bt_add_serv.FontStyle = "none";
	mhist.SetGroupPrm("add_serv","visible","no");
}

event mhist_bt_step_pac_link(a,b)
{
	var t;
	t = b;
	mhist_usl_chksub(0,0);
	if( mhist_usl_sub == 0 ) {
		a = "MB_YESNO";
		if( t != 999 ) a = a+"CANCEL";
		a = mhutil.MessageBox("У пациента существуют неподписанные услуги.\r\nХотите подписать ?","Внимание",a+",MB_ICONWARNING");
		if( a == "CANCEL" ) {
			mhist_usl_sub = 99;
			return;
		}
		if( a == "YES" ) {
			mhist_bt_serv_subscr_link(0,0);
		}
	}
	b = 0;
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ) {
		b = mhist.etext.Modified;
	}
	if( mhist_cur_format == "rpt" ) {
		b = mhist.erpt.Modified;
	}
	if( b == 1 ) {
		a = "MB_YESNO";
		if( t != 999 ) a = a+"CANCEL";
		a = mhutil.MessageBox("У пациента существуют несохраненные документы.\r\nХотите сохранить ?","Внимание",a+",MB_ICONWARNING");
		if( a == "CANCEL" ) return;
		if( a == "YES" ) {
			mhist_bt_rec_save_link(0,0);
		}
		if( (a == "NO")&&(t != 999) ) {
			mhist_usl_sub = 99;
			a = mhutil.MessageBox("Данные будут утеряны.\r\nВы уверены ?","Внимание","MB_YESNO,MB_ICONWARNING");
			if( a == "NO" ) return;
		}
	}

	mhist.bt_step_pac.FontStyle = "bold";
	mhist.pac_label.data = "";
	mhist_mode = 1;

	mhist.pac_btns.visible = "yes";
	mhist.panel_pac.visible = "yes";
	mhist.pfind.visible = "yes";
	mhist.bt_pac_sort.visible = "yes";
	mhist.shape_left_hdr.w = 6500;
	mhist.shape_left.w = 6500;
	a = mhist.shape_right_hdr;
	a.x = 6600;
	a.w = 3350;
	a = mhist.shape_right;
	a.x = 6600;
	a.w = 3350;
	a = mhist.r_doc_title;
	a.x = 6750;
	a.w = 3000;
	a.title = "Информация о пациенте";
	a.link = "";
	a.PopupMenu = "";
	a = mhist.l_doc_title;
	a.title = "Выбор пациента";
	a.Hint = "";
	a.x = 150;
	mhist.left_tree.visible = "no";
	mhist.SetGroupPrm("hbtn","enabled","no");
	mhist.SetGroupPrm("hbtn","color","White");
	mhist.pac_fndtxt.SetFocus();
	mhist.bt_pac_alert.visible = "no";

// очистка документов
	main.CloseForm("mhclip");
	mhist_close_rec(0,0);
	mhist_close_hist(0,0);
	mhist_close_serv(0,0);

	// возврат в состояние поиска после запуска по истории
	if( mhist.bt_pac_fnd.UserData == 99 ) {
		mhist_wfnd_clr(0,0);
		mhist_wfnd_sel(0,0);
	}

	if( mhist_vm == 1 ) {
		pid = 0;
		return;
	}
	if( pid == 0 ) return;
	main.NetProc("USELNIB^YIMHP",pid,otd_id,vr_id,spec_id,trim(mhist.inf.i("sdate")));
	pid = 0;
}

event mhist_dates_header(a,b)
{
	a = mhist.hist_dates.userdata;
	b = mhist.l_doc_title;
	b.hint = "";
	b.x = 150;
	if( a == "" ) b.title = "Выбор документа";
	if( a != "" )
		{ b.title = "Документы c "+piece(a,"-",1)+" по "+piece(a,"-",2); }
}

event mhist_hist_seldoc(a,b)
{
	var t = mhist.hist_view, i = 0, c = t.count, x;
	for( i = 0 ; i < c ; i++ ) {
		x = piece(t.itemdata(i),"~",1);
		if( x == a ) {
			t.index = i;
			return;
		}
	}
}

event mhist_bt_hist_old_link(a,b)
{
	var c, n, h, mhv = mhist.hist_view;
	if( pid == 0 ) { mhist_msg_notsel_pac(0,0); return; }

	b = 0;
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ) {
		b = mhist.etext.Modified;
	}
	if( mhist_cur_format == "rpt" ) {
		b = mhist.erpt.Modified;
	}
	if( b == 1 ) {
		a = mhutil.MessageBox("У пациента существуют несохраненные документы.\r\nХотите сохранить ?","Внимание","MB_YESNOCANCEL,MB_ICONWARNING");
		if( a == "CANCEL" )
			return;
		if( a == "YES" ) {
			mhist_bt_rec_save_link(0,0);
		}
		if( a == "NO" ) {
			a = mhutil.MessageBox("Данные будут утеряны.\r\nВы уверены ?","Внимание","MB_YESNO,MB_ICONWARNING");
			if( a == "NO" ) 
				return;
		}
	}

	if( mhist.bt_hist_old.FontStyle != "bold" ) {
		mhist.bt_hist_old.FontStyle = "bold";
		mhist_mode = 2;

		mhist.hist_btns.visible = "yes";
		mhv.visible = "yes";
		mhist.shape_left_hdr.w = 3300;
		mhist.shape_left.w = 3300;
		a = mhist.shape_right_hdr;
		a.x = 3400;
		a.w = 6550;
		a = mhist.shape_right;
		a.x = 3400;
		a.w = 6550;
		a = mhist.r_doc_title;
		a.x = 3550;
		a.w = 5500;
		a.title = "Нет документа";
		a.link = "";
		a.PopupMenu = "";
		mhist_dates_header(0,0);
		mhist.left_tree.visible = "no";

		if( b != 990 ) {
			a = mhist.vtext;
			a.Style = 0;
			a.File = "";
			a.Text = "";
			a.visible = "yes";
		}
	}
	if( b == 999 ) {
		mhist.hist_view.text = "";
	}
	if( b < 990 ) {
		a = mhist.hist_vtype.data;
		mhv.text = main.NetFunc("LI^YIMH",pid,a,mhist.hist_dates.UserData);
	}
	mhist_hist_vtype_chk(0,0);
	mhist.vinfo.visible = "yes";

	if( b != 990 ) {
		mhist_view_doc = "";
		mhist_view.Clear();
		mhist_vstk.Clear();
		mhist.vinfo.Clear();
	}

	mhist_close_rec(0,0);
	mhist_close_pac(0,0);
	mhist_close_serv(0,0);

	a = trim(mhist.inf.i("defvdoc"));
	if( (a == "")&&(mhv.userdata!="") ) mhv.index = mhv.userdata;
	if( a != "" ) { mhist_hist_seldoc(a,0); mhist.inf.itemdata("defvdoc",""); }

	a = int(mhv.count);
	if( a < 22 ) mhv.ExpandAllNodes();
	c = "no";
	if( a != (int(mhv.index)+1) ) c = "yes";
	mhist.btn_next_doc.visible = c;

	if( main.ReportExists("mhclip") == 1 )
		{ mhclip_set_state(0,0); }
	a = mhist.bt_hist_print;
	if( a.File != "img_print4.bmp" ){
		a.Title = "Печать";
		a.Hint = "Печать выбранного документа";
		a.File = "img_print4.bmp";
	}

	if( mhist.rec_docs.data == "" ){
		n = "Создать";
		h = "Создать новый документ из существующего";
		c = "docadd24.bmp";
	}

	if( mhist.rec_docs.data != "" ){
		n = "Копировать";
		h = "Копировать содержимое в буфер документов";
		c = "copy24.bmp";
	}
	a = mhist.bt_hist_copy;
	if( a.File != c ){
		a.Title = n;
		a.Hint = h;
		a.File = c;
	}
}

// for events
event mhist_hist_work_old(a,b)
{
	mhist_bt_hist_old_link(0,999);
	mhist.hist_vtype.data = 3;
	mhist_hist_vtype_link(0,0);
}

event mhist_update_navigate(a,b){
	a = "no";
	if( mhist_docs.Count > 1 ) a = "yes";
	mhist.SetGroupPrm("rec_navigate","visible",a);
}

event mhist_bt_hist_new_step1(a,b)
{
	mhist.bt_hist_new.FontStyle = "bold";
	mhist_mode = 3;

	mhist.shape_left_hdr.w = 6500;
	mhist.shape_left.w = 6500;
	a = mhist.shape_right_hdr;
	a.x = 6600;
	a.w = 3350;
	a = mhist.shape_right;
	a.x = 6600;
	a.w = 3350;
	a = mhist.r_doc_title;
	a.x = 6800;
	a.w = 3000;
	a.title = "Справочник";
	a.link = "mhist_rdoc_menu";
	a.PopupMenu = "sptreetop";
	a = mhist.l_doc_title;
	a.title = "Нет документа";
	a.x = 150;
	a.Hint = "";
	mhist.left_tree.visible = "no";
	mhist.left_tree.h = 7850;

	mhist.SetGroupPrm("rec_closedocs","visible","no");
	mhist.SetGroupPrm("rec_opendocs","visible","yes");

	mhist_close_hist(0,0);
	mhist_close_pac(0,0);
	mhist_close_serv(0,0);

	if( main.ReportExists("mhclip") == 1 )
		{ mhclip_set_state(1,0); }

	mhist_update_navigate(0,0);
}

event mhist_bt_hist_new_link(a,b)
{
	if( pid == 0 ) { mhist_msg_notsel_pac(0,0); return; }

	if( mhist.rec_docs.data != "" ) b = 999; // если редактируем - не запрещать

	if( (mhist_vm == 1)&&(b != 999) ) {
		mhist_msg_vm_doc(0,0);
		return;
	}

	if( mhist.bt_hist_new.FontStyle == "bold" ) return;

	mhist_bt_hist_new_step1(0,0);

	a = trim(mhist.rec_docs.SelText);
	if( a == "Нет" ) {
		b = mhist_cfg.autodoc;
		if( b != "" ) {
			mhist_bt_rec_create_select(b,999);
			return;
		}
		mhist.coder_tree.clear();
		mhist.coder_tree.UserData = "";
		mhist_bt_rec_create_link(0,0);
		return;
	}
	if( a == "" ) return;
	mhist_rec_docs_check(0,0);
}

event mhist_upd_price(a,b)
{
	var k = mhist.servinfo.ItemVis("allow"), t,d,s;
	t = mhist.left_tree;
	a = trim(mhist.inf.i("napr"));
	b = trim(mhist.inf.i("pac_dog"));
	if( mhist.servinfo.ItemTag("kss") == 1 ) k = 9;
	t.text = "";
	d = trim(mhist.inf.i("sdate"));
	s = mhist_cfg.servsort;
	if( d == "" ) b = main.NetFunc("CEL^YNED",pid,vr_id,otd_id,spec_id,a,b,k,"",s);
	if( d != "" ) b = main.NetFunc("CEL^YNED",pid,vr_id,otd_id,spec_id,a,b,k,d,s);
	t.text = b;
	t.link = "mhist_u_save";
	if( int(t.count) > 32 ) return;
	t.ExpandAllNodes();
	t.index = 0;
}

event mhist_serv_set_flg(a,b)
{
	var str, tmp, i;
	str = "";
	for( i = 1 ; i < 99 ; i++ ) {
		tmp = piece(piece(piece(mhist_usl_flg,"\r\n",i),"~",1),"@",1);
		if( tmp == "" ) break;
		str = str + trim(tmp) + "\r\n";
	}
	mhist.serv_flags.text = trim(str);
}

event mhist_bt_add_serv_link(a,b)
{
	if( pid == 0 ) { mhist_msg_notsel_pac(0,0); return; }

	b = 0;
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ){
		b = mhist.etext.Modified;
	}
	if( mhist_cur_format == "rpt" ){
		b = mhist.erpt.Modified;
	}
	if( b == 1 ){
		a = mhutil.MessageBox("У пациента существуют несохраненные документы.\r\nХотите сохранить ?","Внимание","MB_YESNOCANCEL,MB_ICONWARNING");
		if( a == "CANCEL" ) { return; }
		if( a == "YES" ) { mhist_bt_rec_save_link(0,0); }
		if( a == "NO" ){
			a = mhutil.MessageBox("Данные будут утеряны.\r\nВы уверены ?","Внимание","MB_YESNO,MB_ICONWARNING");
			if( a == "NO" )
				return;
		}
	}


	mhist.bt_add_serv.FontStyle = "bold";
	mhist_mode = 4;

	mhist.shape_left_hdr.w = 9900;
	mhist.shape_left.w = 9900;
	mhist.shape_right_hdr.visible = "no";
	mhist.shape_right.visible = "no";

	a = mhist.r_doc_title;
	a.x = 200;
	a.y = 7375;
	a.title = "Выполненные услуги";
	a.link = "";
	a.PopupMenu = "";

	a = mhist.l_doc_title;
	a.x = 325;
	a.title = "Ввод услуг";
	a.Hint = "";

	a = mhist.left_tree;
	a.w = 5600;
	a.h = 5250;
	a.glypf = "tree_pay.bmp";
	a.check = "mhist_usllist_help";
	a.Font = 7;
	a.PopupMenu = "usltree";

	mhist.serv_flags.UnCheckAll();
	mhist.serv_count.data = 1;
	mhist.serv_comm.data = "";
	mhist.serv_comm.Title = "Примечание";

	mhist.SetGroupPrm("add_serv","visible","yes");

	if( mhist.serv_diag.data == "" ){ // диагнозы из истории
		mhist.serv_diag.data = mhist_diag;
		mhist.serv_ldiag.title = mhist_diagt;
	}

	mhist_serv_idx = "";
	//mhist.usl_deposit.data = mhist.pac_deposit.data;
	main.NetProc("RRH^YNED",pid,vr_id,otd_id,spec_id,trim(mhist.inf.i("sdate")));

	main.CloseForm("mhclip");
	mhist_close_rec(0,0);
	mhist_close_hist(0,0);
	mhist_close_pac(0,0);
	mhist_upd_price(0,0);
}

event mhist_pfind_color(a,b)
{
	var i , c , j, cj, s, t;
	t = mhist.pfind;
	c = t.Rows;
	cj = t.Cols;
	for( i = 1 ; i < c ; i++ ) {
		s = t.cell(0,i);
		if( s != "" ) s = 0;
		else s = 6;
		if( cj > 2 ) {
			if( (t.cell(1,i) == "")&&(t.cell(2,i) == "") ) s = 12;
		}
		for( j = 0 ; j < cj ; j++ ) {
			t.cellstyle(s,j,i);
		}
	}
}

event mhist_bt_pac_fnd_link(a,b)
{
	var t = mhist.bt_pac_fnd.UserData, ds, de;
	a = trim(mhist.pac_fndtxt.data);
	mhist.pac_fndtxt.data = a;
	b = mhist.pac_fdog.data;
	ds = trim(mhist.pac_fdate.data);
	de = trim(mhist.pac_ftdate.data);
	if( t == 99 ) t = 1;
	mhist.pfind.text = main.NetFunc("FND^YIMHP",t,a,b,vr_id,ds,trim(mhist.pac_falpu.data),de,otd_id);
	mhist_pfind_color(0,0);
	mhist.pfind.SetFocus();
	if( (mhist.pfind.rows == 2)&&( strlen(mhist.pfind.cell(0,1)) > 0 ) ) {
		mhist.pfind.row = 1;
		mhist_pfind_link(0,0);
	}
}

event mhist_bt_cng_fnd_link(a,b)
{
	mhist.bt_pac_fnd.PopupMenu(1);
}

event mhist_wfnd_sys(a,b)
{
	mhist.bt_pac_fnd.UserData = a;
	if( b != 999 ) mhist_cfg.findtypevar = a;
	if( mhist.pfind.visible == "no" ) return;
	if( a != 1 ) mhist.CheckedMenuItem("wfnd","v1",0);
	if( a != 2 ) mhist.CheckedMenuItem("wfnd","v2",0);
	if( a != 3 ) mhist.CheckedMenuItem("wfnd","v3",0);
	if( a != 4 ) mhist.CheckedMenuItem("wfnd","v4",0);
	if( a != 5 ) mhist.CheckedMenuItem("wfnd","v5",0);
	if( a != 9 ) mhist.CheckedMenuItem("wfnd","uf",0);
	mhist.CheckedMenuItem("wfnd","v"+string(a),1);
	mhist_bt_pac_fnd_link(0,0);
	mhist.pac_fndtxt.SetFocus();
}

event mhist_wfnd_con(a,b)
{
	mhist.pac_fndtxt.Title = "Поиск в контингенте";
	mhist.pac_fdog.visible = "yes";
	mhist.pac_fdate.visible = "no";
	mhist.pac_ftdate.visible = "no";
	mhist.pac_falpu.visible = "no";
	mhist.pfind.Default = "№ И.Б.:800;Фамилия:2000;Имя:1600;Отчество:1600;Срок:1000;Договор:2600";
	mhist.pac_fdog.data = "";
	mhist_wfnd_sys(1,b);
}

event mhist_wfnd_rasp(a,b)
{
	mhist.pac_fndtxt.Title = "Поиск в расписании";
	mhist.pac_fdate.Title = "Дата расписания";
	mhist.pac_fdog.visible = "no";
	mhist.pac_fdate.visible = "yes";
	mhist.pac_ftdate.visible = "no";
	mhist.pac_falpu.visible = "yes";
	mhist.pac_fdate.data = date();
	mhist.pfind.Default = "№ И.Б.:800;Фамилия:2000;Имя:1500;Отчество:1500;Время:950;Прием:800;Статус:950;Примечание:2600;";
	mhist.pac_falpu.data = 0;
	mhist_wfnd_sys(2,0);
}

event mhist_wfnd_common(a,b)
{
	mhist.pac_fdate.Title = "Дата приемов с";
	mhist.pac_fdog.visible = "no";
	mhist.pac_fdate.visible = "yes";
	mhist.pac_ftdate.visible = "yes";
	mhist.pac_falpu.visible = "no";
	mhist.pac_fdate.data = date();
	mhist.pac_ftdate.data = date();
	mhist.pfind.Default = mhist_const_wfnd_tab;
}

event mhist_wfnd_jrn(a,b)
{
	mhist.pac_fndtxt.Title = "Поиск в журнале посещений";
	mhist_wfnd_common(0,0);
	mhist_wfnd_sys(3,0);
}

event mhist_wfnd_unsbs(a,b)
{
	mhist.pac_fndtxt.Title = "Поиск в неподписанных документах";
	mhist_wfnd_common(0,0);
	mhist_wfnd_sys(4,0);
}

event mhist_wfnd_jrnot(a,b)
{
	mhist.pac_fndtxt.Title = "Поиск в журнале отделения";
	mhist_wfnd_common(0,0);
	mhist_wfnd_sys(5,0);
}

event mhist_wfnd_user(a,b)
{
	a = mhist.pac_fndtxt.userdata;
	if( a == "" ) a = "Строка запроса";
	mhist.pac_fndtxt.Title = a;
	mhist_wfnd_common(0,0);
	mhist_wfnd_sys(9,0);
}

event mhist_wfnd_sel(a,b)
{
	a = mhist.bt_pac_fnd.UserData;
	if( (a == 1)||(a == 99) ) mhist_wfnd_con(0,0);
	if( a == 2 ) mhist_wfnd_rasp(0,0);
	if( a == 3 ) mhist_wfnd_jrn(0,0);
	if( a == 4 ) mhist_wfnd_unsbs(0,0);
	if( a == 5 ) mhist_wfnd_jrnot(0,0);
	if( a == 9 ) mhist_wfnd_user(0,0);
}

event mhist_wfnd_clr(a,b)
{
	if( mhist.bt_pac_fnd.UserData != 99 ) return;
	mhist.bt_pac_fnd.UserData = mhist_cfg.findtypevar;
	mhist.pac_fndtxt.data = "";
}

event mhist_bt_pac_fndtxt_key(a,b)
{
	if( a==13 ) mhist_bt_pac_fnd_link(0,0);
}

event mhist_pfind_key(a,b)
{
	if( int(a) != 13 ) return;
	mhist.pfind.NoKeyHandle = "yes";
	mhist_pfind_link(0,0);
	if( mhist.bt_pac_sel.visible == "no" ) return;
	mhist.bt_pac_sel.SetFocus();
}

event mhist_bt_pac_sort_link(a,b)
{
	mhist.pfind.sort(1);
}

event mhist_pfind_clear(a,b)
{
	mhist.pac_id.data = "";
	mhist.inf.Clear();
	a = mhist.foto;
	if( int(a.BitmapHeight()) > 0 )
	{
		a.BitmapHeight(1);
		a.BitmapWidth(1);
	}
}

event mhist_pfind_upd(a,b)
{
	mhist.inf.Clear();
	main.NetProc("LPC^YIMHP",mhist.pac_id.data,otd_id,vr_id,spec_id,mhist.bt_pac_fnd.UserData);
}

event mhist_pfind_link(a,b)
{
	a = mhist.pfind.index();
	mhist_pfind_clear(0,0);
	b = mhist.pfind.cell(0,a);
	mhist.pac_id.data = b;
	if( b == "" ) return;
	mhist.pac_id.data = b;
	mhist_pfind_upd(0,0);
}

event mhist_serv_zero(a,b)
{
	mhist.serv.data = "";
	mhist.serv.UserData = "";
	mhist.serv_comm.data = "";
	mhist.serv_comm.Title = "Примечание";
	mhist.serv_diag.data = "";
	mhist.serv_count.data = 1;
	mhist.serv_nz.data = "";
	mhist.serv_ldiag.title = "";
	mhist.serv_name.data = "";
	mhist.serv_name.UserData = "";
	mhist.serv_flags.UnCheckAll();
}

event mhist_sel_pac_clr(a,b)
{
	mhist_pac_fio = trim(mhist.inf.i("pac_f"))+" "+trim(mhist.inf.i("pac_io"));
	mhist.pac_label.data = string(pid)+" "+mhist_pac_fio;

	mhist.serv_nz.Color = "white";
	mhist.serv_count.userdata = "";
	mhist.serv_count.Color = "white";
	mhist.serv_diag.userdata = "";
	mhist.serv_diag.Color = "white";

	mhist_serv_zero(0,0);
	mhist_serv_idx = "";
	store.SetData("patient",string(pid));
	mhist.hist_dates.UserData = "";
	mhist.hist_view.UserData = "";
	mhist.hist_vtype.data = 0;
	mhist_clbrd.Clear();
	mhist.vinfo.Clear();
	mhist.SetGroupPrm("hbtn","enabled","yes");
	mhist.SetGroupPrm("hbtn","color","black");
	if( mhist_cfg.clipbrd_pset == 1 ) SetClipboard(mhist_pac_fio);
}

event mhist_bt_pac_sel_link(a,b)
{
	var n, mi, pl, si;
	pid = trim(mhist.pac_id.data);
	if( strlen(pid) == 0 ) return;
	mi = mhist.inf;

	a = mi.i("apin");
	if( a != "" ){
		b = mhist_apin(0,0);
		if( a != b ){
			mhist_alert("Доступ запрещен.",0);
			return;
		}
	}

	if( mhist_cfg.splash == 1 ){
		main.CreateForm("mhsplash.frm",0-2,1);
		if( main.mhsplash.ModalResult == 0 ) return;
	}

	mhist_cfg.set("selnib",1);
	mhist_rec_docs_clear(0,0);
	mhist.serv_nz.userdata = "";
	mhist_cur_format = "";
	mhist_cur_store = "";
	mhist_vm = 0;
	n = trim(mi.i("naprlist"));
	mi.ItemData("quest","");
	mi.ItemData("msg","");
	mi.ItemData("diag","");
	mi.ItemData("diagt","");
	mi.ItemData("exec","");
	mi.ItemData("nokss","");
	mi.ItemData("napr",n);

	b = trim(mi.i("pac_dog"));
	main.NetProc("SELNIB^YIMHP",pid,otd_id,vr_id,spec_id,n,b,trim(mhist.inf.i("sdate")));
	a = mi.i("wrong");
	if( a != "" ){
		mhist_alert(a+"\r\nпродолжение невозможно.",0);
		return;
	}
	a = mi.i("quest");
	if( a != "" ){
		a = mhist_quest(a,0);
		if( a == "NO" ) return;
	}
	a = mi.i("msg");
	if( a != "" ) mhist_alert(a,0);
	a = mi.i("exec");
	if( a != "" ){
		main.CreateForm(a,0-2,1);
		if( main.report(piece(a,".",1)).ModalResult != 1 ) return;
	}

	a = 1;
	if( n == "" ) a = 0;
	if( n == "-" ) a = 0;
	si = mhist.servinfo;
	si.ItemVis("addnaz",a);

	// касса и разр./запрещ. услуги
	a = mi.i("nokss");
	b = int(mhist_cfg.servperm);
	if( a == 1 ){
		si.ItemVis("allow",b);
		si.ItemVis("nallow",b==0);
		si.ItemVis("kss",1);
		si.ItemColor("kss","white");
	}
	if( a != 1 ){
		si.ItemVis("allow",0);
		si.ItemVis("nallow",0);
		si.ItemVis("kss",0);
	}
	si.ItemTag("kss",0);

        mhist_diag = trim(mi.i("diag"));
        mhist_diagt = trim(mi.i("diagt"));

	mhist.pac_label.Hint = "Пациент по договору:\r\n"+trim(mi.ItemSelText("pac_dog"));

	mhist_sel_pac_clr(0,0);

	if( mhist_cfg.speak > 0 ) speak_speech(mhist_pac_fio);

	mhist_usl_flg = main.NetFunc("GETFLG^YIMHS",vr_id,otd_id,spec_id,pid);
	mhist_serv_set_flg(0,0); // reset flags data
	mhist_cfg.set("selnib",0);

	pl = mhist.serv_count;
	a = mhist.serv_nz.visible;
	b = pl.x;
	if( a == "yes" ){
		pl.x = 4450;
		pl.w = 2500;
		pl.Title = "Кол-во";
	}
	if( (a == "no")&&(b == 4450) ){
		pl.x = 6500;
		pl.w = 3500;
		pl.Title = "Количество";
	}

	a = trim(mi.i("inedit"));
	if( a != "" ){
		b = mhist_quest("Вернуться к незаконченному документу ?",0);
		if( b == "YES" ){
			mhist_load_in_edit(a,0);
			return;
		}
	}

	a = store.Get("env","docid");
	if( a != "" ) a = 2;
	if( a == "" ) a = int(mhist_cfg.fstate);
	if( mhist.bt_add_serv.visible == "no" ){
		a = 1;
		store.GetDel("env","docid");
	}
	if( a == 0 )
		mhist_bt_add_serv_link(0,0);
	if( a == 1 )
		mhist_bt_hist_old_link(0,0);
	if( a == 2 )
		mhist_bt_hist_new_link(0,0);
}

event mhist_bt_pac_sel_stage1(a,b)
{
	pid = trim(mhist.pac_id.data);
	if( strlen(pid) == 0 ) return;
	var mi;
	mi = mhist.inf;

	a = mi.i("alert");
	if( a != "" ){
		mhist_alert(a+"\r\nпродолжение невозможно !",0);
		return;
	}

	a = mi.i("warn");
	if( a != "" ){
		mhist_alert(a,0);
	}

	if( mi.ItemSelMode("pac_dog") == 1 ){
		if( mi.ItemSel("pac_dog") == "" ){
			mhist_alert("Перед началом работы, Вы должны выбрать\r\nдоговор, по которому обслуживается пациент !",0);
			return;
		}
	}
	if( mi.ItemSelMode("naprlist") == 1 ){
		if( mi.ItemSel("naprlist") == "" ){
			mhist.inf.ItemSel("naprlist","*"); // set if present
		}
		if( mi.ItemSel("naprlist") == "" ){
			mhist_alert("Перед началом работы, Вы должны выбрать\r\nнаправление, по которому проводится прием !",0);
			return;
		}
	}
	mhist_bt_pac_sel_link(0,0);
}

event mhist_hist_vtype_chk(a,b)
{
	a = mhist.hist_vtype.data;
	b = mhist.bt_hist_mark;
	if( (a == 2)&&(b.File=="private24.bmp") ){
		b.File = "privater24.bmp";
		b.Title = "Из избранного";
		b.Hint = "Удалить выбранный документ из списка избранных документов";
	}
	if( (a != 2)&&(b.File!="private24.bmp") ){
		b.File = "private24.bmp";
		b.Title = "В избранное";
		b.Hint = "Добавить выбранный документ в список избранных документов";
	}
}

event mhist_hist_view_upd(a,b)
{
	var mv = mhist.hist_view;
	mhist_vstk.Clear();
	mhist.btn_prev_doc.visible = "no";
	mhist_hist_vtype_chk(0,0);
	a = trim(mhist.inf.i("defvdoc"));
	if( (a == "")&&(mv.userdata!="") ) mv.index = mv.userdata;
	if( a !="" ) { mhist_hist_seldoc(a,0); mhist.inf.itemdata("defvdoc",""); }
	a = int(mv.count);
	if( a < 22 ) mv.ExpandAllNodes();
	b = "yes";
	if( a != (int(mv.index)+1) ) b = "no";
	if( mhist.btn_next_doc.visible != b ) mhist.btn_next_doc.visible = b;
	mhist.hist_vtype.check = "mhist_hist_vtype_link";
}

event mhist_hist_vtype_link(a,b)
{
	a = mhist.hist_vtype.data;
	b = mhist.hist_dates.UserData;
	mhist.hist_vtype.check = "";
	mhist.hist_view.text = main.NetFunc("LI^YIMH",pid,a,b,mhist.hist_order.UserData);
	mhist_hist_view_upd(0,0);
}

event mhist_bt_hist_findt_link(a,b)
{
	var str = trim(mhutil.InputBox("","Имя документа","",1));
	if( strsub(str,1,1) == "0" ) return;
	str = trim(strdel(str,1,1));
	if( str == "" ) { mhist_hist_vtype_link(0,0); return; }
	mhist.hist_vtype.check = "";
	mhist.hist_view.text = main.NetFunc("LT^YIMH",pid,mhist.hist_vtype.data,str,mhist.hist_dates.UserData);
	mhist_hist_view_upd(0,0);
}

event mhist_sst(a,b) {
	var cr, d, s, ok, id, crstr;

	if( main.UserConfigData("esign") != 1 ) { return; }

	s = trim(main.NetFunc("GSIGN^YIMH",pid,mhist_view.id,1));
	if( s == "" ) { return; }

	cr = Create("crypto");
	d = trim(main.NetFunc("LDVD^YIMH",pid,mhist_view.id,1));

	a = cr.Verify(d,s,2);

	ok = piece(a,"|",1);
	if( ok == "CE" ) {mhist_error("Криптопровайдер не найден.",0); ok="";}
	if( ok == "ER" ) {mhist_error("Ошибка верификации УКЭП.",0); ok="";}

	if( ok == "OK" ) {
		id = mhist_view.ehruid;
		crstr = piece(a,"|",2) + "|" + piece(a,"|",3) + "|" + id;
		mhist.vrpt.SetItem("esign",crstr);
	}	

	Delete(cr);
}

event mhist_bt_hist_print_link(a,b)
{
	var s,c,i,t,d;
	if( mhist_view_doc == "" ) { mhist_msg_notsel_doc(0,0); return; }
	if( int(mhist_view.subscr) == 0 ){
		a = mhist_quest("Удалить выбранный документ ?","");
		if( a == "NO" ) return;
		b = main.NetFunc("DELD^YIMH",pid,mhist_view_doc);
		if( b != "" ){
			mhist_infostop(b,0);
			return;
		}
		b = mhist.hist_view.index;
		mhist.hist_view.Delete(b);
		if( mhist.vrpt.visible == "yes" ) mhist.vrpt.Clear();
		mhist.vinfo.Clear();
		mhist.r_doc_title.data = "";
		mhist_hist_view_link(0,0);
		return;
	}
	a = mhist.hist_vtype.data;
	if( a == 3 ){
		mhist_infostop("Печать неподписанных документов запрещена!",0);
		return;
	}
	if( mhist.vtext.visible == "yes" ){
		mhist.vtext.print();
		return;
	}
	if( mhist.vtable.visible == "yes" ){
		b = mhist_view.printfn;
		if( b == "" ) b = "mhist-tab.xml";
		a = main.LoadFile(b);
		if( a == "" ){
			mhist.vtable.print();
			return;
		}
cout(mhist.vtable.forrep);
		rptgen.SourceProc = "mhist_rptgen_src";
		rptgen.Pattern = a;
		rptgen.SetItem("ehruid",mhist_view.ehruid);
		rptgen.Print();
		rptgen.SourceProc = "";
		return;
	}
	if( mhist.vimage.visible == "yes" ){
		mhist.vimage.print(2);
		return;
	}
	if( mhist.vrpt.visible == "yes" ){
		mhist.vrpt.PrintReset();
		s = "";
		c = 1;
		b = trim(mhist.vrpt.PrintList);
		if( strpos(b,"\r") == 0 ){ // 1 эл-т
			s = piece(b,"|",1);
			b = "";
		}
		if( b != "" ){
			main.CreateHForm("csellst.frm");
			d = main.csellst;
			d.lst.style = 1;
			d.lst.Text = b;
			d.l_doc_title.data = "Какой документ напечатать";
			if( mhist_cfg.prnnoall == 1 )
				d.clear_btn.visible = "no";
			main.CreateForm("csellst.frm",0-2,1);
			if( d.ModalResult != 1 ) return;
			c = d.lst.StateCount;
			s = d.lst.state;
			if( s == "" ){
				s = d.lst.data;
				if( strlen(s) > 0 ) c = 1;
			}
			if( c == 0 ){
				mhist_alert("Ничего не отмечено",0);
				return;
			}
		}

		mhist_sst(0,0);

		mhist.vrpt.PrintStart();
		for( i = 0 ; i < c ; i++ ){
			t = piece(s,"|",i+1);
			mhist.vrpt.xmldata = main.NetFunc("LDPRN^YIMH",pid,mhist_view_doc,t); // print pattern
			mhist.vrpt.PrintStep(1);
		}
		mhist.vrpt.PrintEndDialog(0,1);
		return;
	}
}

event mhist_bt_hist_adm_link(a,b)
{
	main.CreateForm("mhiadm.frm",0-2,1);
}

event mhist_bt_hist_html(a,b)
{
	b = main.NetFunc("VIEWDOC^YIMHH",pid,mhist_view_doc);
	if( strlen(b) == 0 ) return;
	main.CreateHForm("khtml.frm");
	a = main.khtml;
	a.label.data = "Экспорт документа в HTML";
	store.SetData("khtml",b);
	main.CreateForm("khtml.frm",0-2,1);
}

event mhist_view_subbtn(a,b)
{
	mhist.vinfo.Add("do","Действия","href",0,1,1);
	mhist.vinfo.ItemHref("do","mhist_hist_view_do");
}

event mhist_hist_view_link(a,b)
{
// id~type~ext~file~read only~hide
	var tp, fil, mv, str, t, id, ro, ext, c, mvi;
	mv = mhist.hist_view;
	str = trim(mv.selected);
	if( strlen(str) == 0 ) return;
	if( piece(str,"~",6) == 1 ){
		mhist_infostop("Просмотр данного документа запрещен.",0);
		return;
	}
	id = piece(str,"~",1);
	tp = piece(str,"~",2);
	ext = piece(str,"~",3);
	fil = piece(str,"~",4);
	ro = int(piece(str,"~",5));

	mhist_view.clear();
	mhist.vinfo.Clear();
        mhist.vimage.file = "";
        mhist.vtext.file = ""; // чтобы при применении стиля ещё раз файл не грузился
        mhist.vtable.text = "";

	if( ext == "evt" ){
		if( fil == "" ) return;
		mhist.r_doc_title.data = "";
		main.Execute(fil);
		return;
	}
	if( ext == "frm" ){
		if( fil == "" ) return;
		mhist.r_doc_title.data = "";
		main.CreateForm(fil,0-2,1);
		return;
	}

	c = mv.index;
	mv.userdata = c;
	if( trim(mhist_vstk.last) != trim(c) ) { mhist_vstk.Add(c); }
	if( int(mhist_vstk.Count) > 1 ) mhist.btn_prev_doc.visible = "yes";
	b = "yes"; // не показываем "следующий" если этот последний
	a = int(mv.count);
	if( a == int(c)+1 ) b = "no";
	if( mhist.btn_next_doc.visible != b ) mhist.btn_next_doc.visible = b;

	if( (ext == "txt")||(ext == "rtf") ){
                t = 10;
		if(ext == "rtf") { t = 11;}
                mhist.vtext.Style = t;
		mhist.vtable.visible = "no";
		mhist.vimage.visible = "no";
                mhist.vrpt.visible = "no";
		mhist.vtext.visible = "yes";
        }
	if( ext == "tab" ){
		mhist.vtext.visible = "no";
		mhist.vimage.visible = "no";
                mhist.vrpt.visible = "no";
                mhist.vtable.visible = "yes";
		mhist.vtable.Glypf = fil; // css
        }
	if( ext == "rpt" ){
		mhist.vtext.visible = "no";
		mhist.vtable.visible = "no";
		mhist.vimage.visible = "no";
		mhist.vrpt.visible = "yes";
	}
	if( (ext == "jpg")||(ext == "bmp")||(ext == "gif")||(ext == "png")||(ext == "tif")||(ext == "dcm") ){
		mhist.vtext.visible = "no";
		mhist.vtable.visible = "no";
                mhist.vrpt.visible = "no";
		mhist.vimage.visible = "yes";
        }

	mhist.vinfo.Clear();

        mhist_view.set("id",id);
	mhist_view.set("ext",ext);
	mhist_view.set("tp",tp);
	mhist_view.set("ro",ro);
        mhist_view.CatchXML("nb_console/mhist/viewer");
	a = id;
	if( mhist_lang != "" ) a = a+":"+mhist_lang;
        main.NetProc("LDV^YIMH",pid,a);
        mhist_view.DiscardXML();
        mhist_view_doc = id;

	a = mhist.r_doc_title;
        a.data = mhist_view.name;
	a.link = "";
	a.PopupMenu = "";

	t = mhist.bt_hist_print;
	a = "img_print4.bmp";
	b = "Печать";
	c = "Печать выбранного документа";
	if( int(mhist_view.subscr) == 0 ){
		a = "doctxtdel24.bmp";
		b = "Удалить";
		c = "Удалить выбранный документ";
	}
	if( t.File != a ){
		t.Title = b;
		t.File = a;
		t.Hint = c;
	}

	if( (ext == "txt")||(ext == "rtf") ){
		mhist.vtext.data = mhist_view.content;
		mhist_view_subbtn(0,0);
		return;
	}
	if( ext == "tab" ){
		mhist.vtable.title = mhist_view.name;
		return;
	}
	if( ext == "rpt" ){
		a = mhist.vrpt;
		a.GetGraphics("net:DISK/");
		a.ReportName = mhist_view.realname;;
		a.View();
		mhist_view_subbtn(0,0);
		return;
	}
	if( (ext == "jpg")||(ext == "bmp")||(ext == "gif")||(ext == "png")||(ext == "tif")||(ext == "dcm") ){
		mhist.vimage.Title = mhist_view.realname;
		mhist.vimage.Clear();
		if( mhist_view.dprofile == "rotate" ) mhist.vimage.flip = 1;
		mhist.vimage.data = mhist_view.content;
		mhist_view_subbtn(0,0);
		return;
	}
	if( (ext == "amr")||(ext == "mp3")||(ext == "wav") ){
		a = tpath + "tmp."+ext;
		if( fil == "" ) fil = "DISK";
		main.GetNetFileAs(fil+"/"+mhist_view.content,a);
		if( disk.FileExists(a) == 1 ) main.FilePlay(a);
		return;
	}
        mhist.vtext.visible = "no";
        mhist.vtable.visible = "no";
        mhist.vrpt.visible = "no";
        mhist.vimage.visible = "no";
	if( ext == "exe" ) // template - <programm name>:<extension>:<path>
	{
		t = piece(fil,":",2);
		b = piece(fil,":",3);
		fil = piece(fil,":",1);
		if( main.TestPlugin(fil) == 0 ){
			cout("Ошибка: не найден плагин ("+fil+").");
			return;
		}
		if( b == "" ) b = "DISK";
		b = b+"/"+mhist_view.content;
		a = tpath + "tmp."+t;
		main.GetNetFileAs(b,a);
		b = main.RunPluginAndWait(fil,"\""+a+"\"");
		return;
	}
	if( ext == "ext" ) {
		main.ShellExec("",mhist_view.content);
		return;
	}

	mhist_error("Просмотр документа невозможен - неизвестный формат !",0);
// todo - add viewers by extension (standalone or embedded in panel)
}

event mhist_bt_hist_cng_link(a,b)
{
	var str, nm, i, c, fil, ext, tp, d, rd, id, md, eid;
	d = 0;
        nm = mhist_view.name;
	if( nm == "" ) { mhist_msg_notsel_doc(0,0); return; }
	str = mhist_cfg.unsbs;
	id = mhist_view.id;

	if( mhist_view.ro == 1 ){
		mhist_infostop("Редактирование невозможно\r\nДокумент только для просмотра.",0);
		return;
	}

	c = mhist_docs.Count;
	str = id;
	eid = "";
	for( i = 0 ; i < c ; i++ )
	{
		if( mhist_docs.ByIndex(i).id == str ){
			a = int(mhist_docs.ByIndex(i).subscr);
			if( a != 0 ){
				eid = i;
				c = 0;
			}
			if( a == 0 ){
				mhist_bt_hist_new_link(0,0);
				mhist.rec_docs.index = a;
			        mhist_rec_docs_check(0,0);
				return;
				//mhist_infostop("Документ уже находится на редактировании",0);
			}
		}
	}

	if( int(mhist_view.subscr) != 0 ){
		a = main.NetFunc("CHKUSBS^YIMH",pid,id);
		if( strsub(a,1,1) == "!" ){
			mhist_infostop(strsub(a,2,999),0);
			return;
		}
		a = int(a);
		if( (a != 1)&&(strpos(str,"task") > 0) ){
			store.Set("env","pac",pid);
			store.Set("env","title","снятие подписи документа");
			store.Set("env","uid","med/epr-cng");
			store.Set("env","key",mhist_view.id);
			main.CreateForm("mkmtask.frm",0-2,1);
			return;
		}
		if( (a == 1)||(strpos(str,"allow") > 0) ){
			a = "";

			if( mhist_view.ext == "rpt" )
				{ a = main.NetFunc("SBSFLST^YIMH",pid,id); }
			if( a == "" ){
				b = mhist_quest("Вы пытаетесь изменить уже подписанный документ,\r\nубрать подпись ?","");
				if( b == "NO" ) return;
				// todo - сделать копию
				str = trim(main.NetFunc("UNSBSC^YIMH",pid,id));
			}
			if( a != "" ){
				main.CreateHForm("csellst.frm");
				b = main.csellst;
				b.lst.style = 1;
				b.lst.Text = a;
				b.l_doc_title.data = "Убрать подпись у разделов документа";
				main.CreateForm("csellst.frm",0-2,1);
				if( b.ModalResult != 1 ) return;
				a = b.lst.state;
				str = trim(main.NetFunc("UNSBSC^YIMH",pid,id,1,a));
			}
			if( str != "" ){
				mhist_infostop(str,0);
				return;
			}
			mhist_view.subscr = 0;
			d = 1;
		}
		else{
			mhist_infostop("Редактирование невозможно\r\nДокумент уже подписан.",0);
			return;
		}
	}

	if( eid != "" ) mhist_bt_rec_close(0,0);

        mhist_rec_docs_tsave(0,0);
        fil = mhist_view.fil;
        ext = mhist_view.ext;
        tp = mhist_view.tp;

	rd = mhist.rec_docs;
	mhist_cur_store = int(rd.Count)+1;
        if( rd.SelText == "Нет" ) mhist_cur_store = 1;
	if( mhist_docs.Create(mhist_cur_store,"values") == 0 ){
		cout("Ошибка создания документа");
		return;
	}
	md = mhist_docs.obj;
        md.assign(mhist_view);
	md.set("name",mhist_view.realname);
	md.set("modified",0);
	rd.Check = "";
	if( rd.SelText == "Нет" )
	 { rd.Clear(); }
	rd.Add(nm,mhist_cur_store);
	rd.Selected = int(rd.Count)-1;
	rd.Check = "mhist_rec_docs_check";

        if( ext == "rpt" ){
		md.set("pattern",main.NetFunc("LRPT^YIMH",tp,pid,md.dprofile));
		if( d == 1 ) a = main.NetFunc("LDVD^YIMH",pid,id);
		if( d != 1 ) a = mhist.vrpt.xmldata;
		md.set("content",a);
	}
        if( ext == "tab" )
                { md.set("content",mhist.vtable.xmldata); }
        mhist_cur_store = "";
        mhist_cur_format = "";
	mhist_bt_hist_new_link(0,999);
}

function mhist_load_in_edit(id,b)
{ // загрузка документа в редактор по ID
	var str, nm, rd, mo, ext;

	rd = mhist.rec_docs;
	mhist_cur_store = int(rd.Count)+1;
        if( rd.SelText == "Нет" ) mhist_cur_store = 1;
	if( mhist_docs.Create(mhist_cur_store,"values") == 0 ){
		cout("Ошибка создания документа");
		return;
	}

	mo = mhist_docs.obj;

	mo.CatchXML("nb_console/mhist/viewer");
	main.NetProc("LDV^YIMH",pid,id);
	mo.DiscardXML();

        nm = mo.realname;
        ext = mo.ext;
	mo.set("id",id);
	mo.set("name",nm);
	mo.set("modified",0);

	rd.Check = "";
	if( rd.SelText == "Нет" )
		{ rd.Clear(); }
	rd.Add(nm,mhist_cur_store);
	rd.Selected = int(rd.Count)-1;
	rd.Check = "mhist_rec_docs_check";

        if( ext == "rpt" ){
		mo.set("pattern",main.NetFunc("LRPT^YIMH",mo.tp,pid,mo.dprofile));
		str = main.NetFunc("LDVD^YIMH",pid,id);
		mo.set("content",str);
	}

        mhist_cur_store = "";
        mhist_cur_format = "";
	mhist_bt_hist_new_link(0,999);
}

event mhist_bt_hist_mark_link(a,b)
{
	if( mhist_view_doc == "" ) { mhist_msg_notsel_doc(0,0); return; }
	a = 0;
	if( mhist.bt_hist_mark.file == "private24.bmp" ) a = 1;
	if( a == 1 ){
		main.NetProc("ADDF^YIMH",pid,vr_id,mhist_view.id);
		mhist_info("Документ \r\n\""+trim(mhist.r_doc_title.data)+"\"\r\nуспешно добавлен в Избранное !","");
		return;
	}
	main.NetProc("DELF^YIMH",pid,vr_id,mhist_view.id);
	mhist_info("Документ \r\n\""+trim(mhist.r_doc_title.data)+"\"\r\nудален из Избранного !","");
	mhist_hist_vtype_link(0,0);
}

event mhist_btn_etext_bold_link(a,b)
{
	var str = mhist.etext.SelectFontStyle, t;
	t = strpos(str,"bold");
	if( t > 0 ) { str = strdel(str,t,4); }
	else { str += "|bold"; }
	mhist.etext.SelectFontStyle = str;
	mhist.etext.SetFocus();
}

event mhist_btn_etext_italic_link(a,b)
{
	var str = mhist.etext.SelectFontStyle, t;
	t = strpos(str,"italic");
	if( t > 0 ) { str = strdel(str,t,4); }
	else { str += "|italic"; 	}
	mhist.etext.SelectFontStyle = str;
	mhist.etext.SetFocus();
}

event mhist_btn_etext_under_link(a,b)
{
	var str = mhist.etext.SelectFontStyle, t;
	t = strpos(str,"underline");
	if( t > 0 ) { str = strdel(str,t,4); }
	else { str += "|underline"; }
	mhist.etext.SelectFontStyle = str;
	mhist.etext.SetFocus();
}

event etext_fsize_check(a,b)
{
	mhist.etext.SelectFontSize = int(mhist.etext_fsize.data);
	mhist.etext.SetFocus();
}

event mhist_btn_etext_black_link(a,b)
{
	mhist.etext.SelectTextColor = "Black";
	mhist.etext.SetFocus();
}

event mhist_btn_etext_blue_link(a,b)
{
	mhist.etext.SelectTextColor = "Blue";
	mhist.etext.SetFocus();
}

event mhist_btn_etext_red_link(a,b)
{
	mhist.etext.SelectTextColor = "Red";
	mhist.etext.SetFocus();
}

event mhist_btn_etext_left_link(a,b)
{
	mhist.etext.Justify = "left";
	mhist.etext.SetFocus();
}

event mhist_btn_etext_right_link(a,b)
{
	mhist.etext.Justify = "right";
	mhist.etext.SetFocus();
}

event mhist_btn_etext_center_link(a,b)
{
	mhist.etext.Justify = "center";
	mhist.etext.SetFocus();
}

event mhist_btn_etext_undo_link(a,b)
{
	mhist.etext.Undo();
	mhist.etext.SetFocus();
}

event mhist_rec_docs_clear(a,b)
{
	mhist_docs.Clear();
	mhist.rec_docs.Text = "|Нет";
}

event mhist_apply_tags(a,b)
{
	mhist_tag = strlower(mhist_tag);
	var mi = mhist.inf;
	var mo = mhist_view;
	if( mhist_mode == 3 ) mo = mhist_docs.obj; // edit

	if( (mhist_tag == "patient")||(mhist_tag=="pnum") )
		{ mhist_tag = pid; return; }
	if( mhist_tag == "pfio" )
		{ mhist_tag = mhist_pac_fio; return; }
	if( mhist_tag == "pborn" )
		{ mhist_tag = trim(mi.i("pac_born")); return; }
	if( mhist_tag == "pyear" )
		{ mhist_tag = mhdate.Year(mi.i("pac_born"),1); return; }
	if( mhist_tag == "p_age" )
		{ mhist_tag = mhdate.AgeM(mi.i("pac_born"),date(),1); return; }
	if( mhist_tag == "psex" )
		{ mhist_tag = mi.i("pac_pol")); return; }
	if( mhist_tag == "lpu" )
		{ mhist_tag = trim(store.GetData("orgname")); return; }
	if( mhist_tag == "lpuaddr" )
		{ mhist_tag = trim(store.GetData("iaddr")); return; }
	if( mhist_tag == "lpuphone" )
		{ mhist_tag = trim(store.GetData("orgphn")); return; }
	if( mhist_tag == "glvr" )
		{ mhist_tag = trim(store.GetData("iglvr")); return; }

	if( b != 777 ) // при просмотре
	{
		if( mhist_tag == "dfio" )
			{ mhist_tag = vr_fio; return; }
		if( mhist_tag == "dnum" )
			{ mhist_tag = vr_id; return; }
		if( mhist_tag == "otd" )
			{ mhist_tag = piece(mhutil.FindInCodify(store.GetData("otd"),otd_id),"|",2); return; }
		if( mhist_tag == "spec" )
			{ mhist_tag = piece(mhutil.FindInCodify(store.GetData("spec"),spec_id),"|",2); return; }
		if( mhist_tag == "date" ){
			mhist_tag = trim(mi.i("sdate"));
			if(mhist_tag == "") mhist_tag = date();
			return;
		}
		if( mhist_tag == "year" ){
			mhist_tag = trim(mi.i("sdate"));
			if(mhist_tag == "") mhist_tag = date();
			mhist_tag = year(mhist_tag);
			return;
		}
		if( mhist_tag == "month" ){
			mhist_tag = trim(mi.i("sdate"));
			if(mhist_tag == "") mhist_tag = date();
			dateutl.date = mhist_tag;
			mhist_tag = dateutl.FullMonth;
			return;
		}
		if( mhist_tag == "fulldate" ){
			mhist_tag = trim(mi.i("sdate"));
			if(mhist_tag == "") mhist_tag = date();
			return;
		}
		if( mhist_tag == "time" )
			{ mhist_tag = time(); return; }
		if( mhist_tag == "diag" )
			{ mhist_tag = mhist_diagt; return; }
		if( mhist_tag == "diagnm" )
			{ mhist_tag = mhist_diagt; return; }
	}
	if( b == 777 ) {
		if( mhist_tag == "otd" ) mhist_tag = "";
		if( mhist_tag == "spec" ) mhist_tag = "";
		if( mhist_tag == "diag" ) mhist_tag = "";
		if( mhist_tag == "diagnm" ) mhist_tag = "";
		if( mhist_tag == "" ) return;
	}

	if( mhist_tag == "title" ) {
		mhist_tag = "";
		if( int(mo) == 0 ) return;
		mhist_tag = mo.get("name");
		return;
	}
	if( mhist_tag == "dprofile" ) {
		mhist_tag = "";
		if( int(mo) == 0 ) return;
		mhist_tag = mo.get("dprofile");
		return;
	}
	if( store.Exists(mhist_tag) == 1 )
		{ mhist_tag = trim(store.GetData(mhist_tag)); return; }
	mhist_tag = "";
}

event mhist_apply_text_tags(a,b)
{
	mhist_tag = mhist.etext.FindString;
	if( mhist_tag == "CURSOR" ) {
		mhist.etext.UserData = mhist.etext.SelStart;
		mhist.etext.SelText = "";
		mhist_tag = "";
		return;
	}
	mhist_apply_tags(0,0);
	mhist.etext.SelText = mhist_tag;
}

event mhist_erpt_src(a,tag)
{
        if( strpos(tag,"int:") == 0 ) return;
	mhist_tag = strdel(tag,1,4);
	mhist_apply_tags(0,0);
	mhist.erpt.SourceData = mhist_tag;
}

event mhist_vrpt_src(a,tag)
{
        if( strpos(tag,"int:") == 0 ) return;
	mhist_tag = strdel(tag,1,4);
	mhist_apply_tags(0,777);
	mhist.vrpt.SourceData = mhist_tag;
}

event mhist_rptgen_src(a,tag)
{
        if( strpos(tag,"int:") == 0 ) return;
	mhist_tag = strdel(tag,1,4);
	mhist_apply_tags(0,777);
	rptgen.SourceData = mhist_tag;
}

event mhist_erpt_list(a,b)
{
	var c;
	mhist.coder_tree.UserData = "";
        mhist.coder_tree.Text = mhist.erpt.ListData;
	if( int(mhist.coder_tree.count) < 24 ){
		mhist.coder_tree.ExpandAllNodes();
		mhist.coder_tree.index = 0;
		mhist.bt_coder_expand.visible = "no";
	}else{
		mhist.bt_coder_expand.visible = "yes";
	}
	a = "no";
	c = "yes";
	b = mhist.erpt.FieldType();
	if( (b=="d")||(b=="tm")||(b=="i")||(b=="chk")||(b=="stof") ) c = "no";
	if( (b=="s")||(b=="m") ) a = "yes";
	mhist.SetGroupPrm("rec_clipb","visible",a);
	if( b=="stof" ) a = "yes";
	if( mhist_clbrd.Count() == 0 ) a = "no";
	mhist.bt_rec_clipb.visible = a;
	mhist.bt_rec_inrtf.visible = c;
	a = "Справочник";
	b = mhist.erpt.GetListTag();
	if( b == "prv" ) a = "Личный справочник";
	if( b == "pat" ) a = "Справочник шаблона";
	if( mhist.r_doc_title.data != a ) mhist.r_doc_title.data = a;
	a = 1;
	if( b == "ro" ) a = 0;
	mhist.bt_coder_cfg.visible = a;
}

event mhist_bt_coder_expand_link(a,b)
{
	if( mhist.bt_coder_expand.file == "down16b.bmp" ){
		mhist.bt_coder_expand.file = "up16b.bmp";
		mhist.coder_tree.ExpandAllNodes();
		mhist.coder_tree.index = 0;
		return;
	}
	mhist.bt_coder_expand.file = "down16b.bmp";
	mhist.coder_tree.CollapseAllNodes();
}

event mhist_rec_docs_tsave(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	if( mhist_docs.index(mhist_cur_store) < 0 ) {	// set index
		cout("ER-tsave");
		return;
	}
	var mo = mhist_docs.obj;
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ){
		mo.set("content",mhist.etext.data);
		mo.set("modified",mhist.etext.Modified);
		return;
	}
	if( mhist_cur_format == "tab" ){
		mo.set("content",mhist.etable.xmldata);
		return;
	}
	if( mhist_cur_format == "rpt" ){
		mo.set("content",mhist.erpt.xmldata);
		mo.set("modified",mhist.erpt.Modified);
		mhist.erpt.PostGraphics("file:"+tpath,1);
		return;
	}
	if( (mhist_cur_format == "jpg")||(mhist_cur_format == "bmp")||(mhist_cur_format == "gif")||(mhist_cur_format == "png") ){
		mo.set("content",mhist.eimage.data);
		return;
	}
}

event mhist_rec_docs_check(a,b)
{ 
	var str, ext, ct, mo, cl, sbsc;
	str = mhist.rec_docs.data;
	if( mhist_cur_store == str ) return;
	if( str == "0" ) return;

	mhist_rec_docs_tsave(0,0); // save previous document

	if( mhist_docs.index(str) < 0 ){
		cout("ER-chk");
		return;
	}
	mhist.coder_tree.Clear();
	mhist.coder_tree.UserData = "";
	mhist.bt_coder_expand.visible = "no";
	mo = mhist_docs.obj;
	a = mhist.l_doc_title;
	b = mo.name;
	sbsc = int(mo.subscr);
	a.x = 325;
	a.title = b;
	a.Hint = b;
	mhist_cur_store = str;
	ext = mo.ext;
	mhist_cur_format = ext;
	ct = mhist.coder_tree;
	a = "doctxtdel24.bmp";
	b = "Удалить";
	if( sbsc != 0 ) {
		a = "cdoc24.bmp";
		b = "Закрыть";
	}
	cl = mhist.bt_rec_delete;
	if( cl.file != a ) {
		cl.file = a;
		cl.title = b;
	}

	if( mhist.bt_rec_delete.visible == "no" )
		{ mhist.SetGroupPrm("doc_btns","visible","yes"); }

	cl = mhist.bt_rec_mnu;
	if( cl.visible == "no" ) cl.visible = "yes";

	cl = mhist.panel_etext;
	if( (ext == "txt")||(ext == "rtf") ) {
		a = mhist.etext;
		a.File = "";
                str = 2;
		if(ext == "rtf") {str = 3;}
		if( sbsc == 1 ) { str = str+8; }
                if( a.Style != str ) a.Style = str;
		cl.visible = "yes";
		mhist.etable.visible = "no";
		mhist.erpt.visible = "no";
		mhist.eimage.visible = "no";
		a.data = mo.content;
		a.Modified = mo.modified;
		ct.PopupMenu = "spltree";
                ct.Text = mo.list;
		a = "yes";
		mhist.SetGroupPrm("rec_clipb","visible",a);
		if( mhist_clbrd.Count() == 0 ) a = "no";
		mhist.bt_rec_clipb.visible = a;
		return;
	}

	mhist.SetGroupPrm("rec_clipba","visible","no"); // after 'txt'
	if( ext == "tab" ) {
		a = mhist.etable;
		cl.visible = "no";
		a.visible = "yes";
		mhist.erpt.visible = "no";
		mhist.eimage.visible = "no";
		str = 4099;
		if( sbsc == 1 ) str = str-1;
                if( a.Style != str ) a.Style = str;
                a.Glypf = mo.fil;
		main.Parse(mo.content);
		ct.PopupMenu = "spltree";
                ct.Text = mo.list;
		return;
	}
	if( ext == "rpt" ) {
		a = mhist.erpt;
		cl.visible = "no";
		mhist.etable.visible = "no";
		a.visible = "yes";
		mhist.eimage.visible = "no";
		a.pattern = mo.pattern;
		a.xmldata = mo.content;
		a.ReportName = mo.name;
                a.Edit();
		a.GetGraphics("file:"+tpath,"net:DISK/");
		a.Modified = mo.modified;
		str = "no";
		if( sbsc == 1 ) str = "yes";
		if( a.readonly != str ) a.readonly = str;
		a.PasteValues(mhist_incopy);
		mhist_incopy.Clear();

		str = mo.subscr_fl;
		if( str != "" ) a.Subscribe(str,1);
		ct.PopupMenu = "sptree";
		b = mhist_cfg.editdoc;
		mhist.bt_rec_cng.visible = b;
		return;
	}
	if( (ext == "jpg")||(ext == "bmp")||(ext == "gif")||(ext == "png") ) {
		cl.visible = "no";
		mhist.etable.visible = "no";
		mhist.erpt.visible = "no";
		mhist.eimage.visible = "yes";
		mhist.eimage.data = mo.content;
		ct.PopupMenu = "";
                ct.Text = mo.list;
		return;
	}
	mhist.SetGroupPrm("rec_closedocs","visible","no");
// todo - add plugins by extension (standalone or embedded in panel)
}

event mhist_bt_rec_create_link(a,b)
{
	if( mhist_vm == 1 ) {
		mhist_msg_vm_doc(0,0);
		return;
	}
	mhist.SetGroupPrm("rec_closedocs","visible","no");
	mhist.SetGroupPrm("rec_navigate","visible","no");
	a = mhist.l_doc_title;
	a.x = 150;
	a.title = "Выберите тип нового документа";
	a.Hint = "";
	a = mhist.left_tree;
	a.w = 6400;
	a.text = main.NetFunc("GDL^YIMH",otd_id,vr_id,spec_id); // GetDocList
	a.Font = 8;
	a.visible = "yes";
	a.glypf = "mhtree.bmp";
	a.link = "mhist_bt_rec_create_select";
	a.check = "";
	a.PopupMenu = "";
	if( mhist_docs.Count > 0 ) {
		mhist.btn_left.visible = "yes";
		mhist.btn_left.title = "Отмена";
		mhist.btn_left.Link = "mhist_bt_rec_create_close";
	}
	mhist.SetGroupPrm("rec_clipba","visible","no");
	if( int(mhist.left_tree.count) < 22 ) {
		mhist.left_tree.ExpandAllNodes();
		mhist.left_tree.index = 0;
	}
	mhist.coder_tree.Clear();
	mhist.bt_coder_expand.visible = "no";
	mhist.SetGroupPrm("doc_btns","visible","no");

	b = store.GetDel("env","docid");
	if( b == "" ) return;
	if( b == "*" ) return;
	var i, c, x;
	c = a.count;
	for( i = 0 ; i < c ; i++ ){
		if( piece(a.ItemData(i),"~",2)==b ){
			a.index = i;
			mhist_bt_rec_create_select(0,0);
			return;
		}
	}
}

event mhist_bt_rec_create_select(a,b)
{
	var str, nm , i, fil, ext, tp, tmp, ct, prf, rd, mo, f;

	if( b != 999 )
	{ // manual
		mhist.coder_tree.clear();

		nm = mhist.left_tree.data;
		str = mhist.left_tree.selected;
		if( str == "" ) return;
		i = piece(str,"~",1);
		if( i != "" ) nm = i;
	}
	if( b == 999 )
	{ // auto
		nm = piece(a,"|",1);
		str = piece(a,"|",2);
	}
	tp = piece(str,"~",2);
	ext = piece(str,"~",3);
	fil = piece(str,"~",4);
	prf = "";

	if( ext == "frm" ) { // открывается только как отдельная форма, форма сама устанавливает позицию
		mhist_bt_rec_create_close(0,"no");
		main.CreateForm(fil,0-2,1);
		b = mhist_docs.Count;
		if( b == 0 ) {
			mhist_bt_rec_create_link(0,0);
			return;
		}
		mhist_rec_docs_check(0,0); // load first
		return;
	}
	if( int(mhist.rec_docs.FindText(nm)) >= 0 ){
		for( i = 1 ; i < 99 ; i++ ) {
			if( mhist.rec_docs.FindText(nm+" "+string(i)) < 0 ) {
				nm = nm+" "+string(i);
                                i = 100;
				break;
			}
		}
	}

	if( piece(str,"~",6) == 1 ) { // профиль документа
		main.CreateHForm("mhprofil.frm");
		i = main.mhprofil;
		i.lst.UserData = tp;
		i.nm.data = nm;
		main.CreateForm("mhprofil.frm",0-2,1);
		if( i.ModalResult == 0 ) return;
		nm = i.nm.data;
		prf = i.id.data;
	} else {
		nm = trim(mhutil.InputBox("","Введите имя документа",nm,1));
		if( strsub(nm,1,1) == "0" ) return;
		nm = trim(strdel(nm,1,1));
	}
	if( nm == "" ){
		mhist_error("Недопустимо указывать \"пустую строку\" в имени документа !",0);
		return;
	}
	if( int(mhist.rec_docs.FindText(nm)) >= 0 ){
		mhist_error("Документ с таким именем уже существует !",0);
		return;
	}

	mhist_rec_docs_tsave(0,0);
	rd = mhist.rec_docs;
	mhist_cur_store = int(rd.Count)+1;
        if( rd.SelText == "Нет" ) mhist_cur_store = 1;

	if( mhist_docs.Create(mhist_cur_store,"values") == 0 ){
		cout("Ошибка создания документа");
		return;
	}
          
	mo = mhist_docs.obj;      
	mo.CatchXML("nb_console/mhist/init");
	a = main.NetFunc("LNEW^YIMH",pid,tp,prf);
	mo.DiscardXML();

	if( a != "xml" ){
		mhist_error(a,0);
		mhist_cur_store = int(rd.Count);
		mhist_docs.delete();
		return;	
	}

	mhist.SetGroupPrm("doc_btns","visible","yes");

        if( ext == "tab" )
        	{ mhist.etable.Glypf = fil; }

	mhdate.Now();
	str = string(mhutil.LeadChar(mhdate.day,"0",2,"r"))+string(mhutil.LeadChar(mhdate.month,"0",2,"r"))+string(mhutil.LeadChar(mhdate.shortyear,"0",2,"r"));
	tmp = "p"+string(pid)+"-"+ConvertTo(str,"tohex");
	str = mhutil.LeadChar(mhdate.hour,"0",2,"r")+mhutil.LeadChar(mhdate.minute,"0",2,"r")+mhutil.LeadChar(mhdate.second,"0",2,"r");
	tmp = tmp+"-"+ConvertTo(str,"tohex")+"-";
	tmp = strlower(tmp)+string(int(float(4095)*float(random()))); // same as symbian docs

	mo.set("unique",tmp);
	mo.set("ext",ext);
	mo.set("fil",fil);
	mo.set("tp",tp);
	mo.set("name",nm);

	if( ext == "exe" ){
		a = piece(fil,":",2);
		f = piece(fil,":",3);
		if( f == "" ) f = "DBDIR";
		if( a == "" ) a = "*";
		fil = disk.OpenDialog("*."+a);
		if( fil == "" ) return;
		a = strlower(disk.ExFileName(fil));
		ext = strsub(strlower(disk.exFileExt(fil)),2,9);
		f = f+"/"+a;
		b = trim(mhist.inf.i("sdate"));
		if( b != "" ) mo.set("sdt",b);
		mo.set("pid",pid);
		mo.set("spec",spec_id);
		mo.set("content",a);
		mo.set("f",a);
		mo.CatchXML("nb_console/mhist/init");
		a = mo.PostXML("S^YIMH()","pid,sdt,lang,id,tp,name,f,spec,srd,dprofile,content");
		mo.DiscardXML(); // fill 'id'
		if( (a!="")&&(a!="xml" ) ){
			mhist_error(a,"");
		}
		main.PutNetFileAs(fil,f);
		a = main.NetFunc("SBSC^YIMH",pid,mo.id));
		if( strsub(a,1,1) == "@" ) {
			mhist.exchange.data = piece(a,"@",3);
			a = piece(a,"@",2);
			main.CreateForm(a+".frm",0-2,1);
			return;
		}
		if( a != "" ){
			mhist_infostop(a,0);
			return;
		}
		mhist_docs.delete();
		mhist_info("Документ успешно добавлен.","");
		return;
	}

	rd.Check = "";
	if( rd.SelText == "Нет" ) rd.Clear();
	rd.Add(nm,mhist_cur_store);
	rd.Selected = int(rd.Count)-1;

	mhist.btn_left.visible = "no";
	mhist.left_tree.visible = "no";

	a = mhist.l_doc_title;
	a.x = 325;
	a.title = nm;
	a.Hint = nm;
	rd.Check = "mhist_rec_docs_check";
	mhist_cur_format = ext;

	mhist_update_navigate(0,0);
	a = "doctxtdel24.bmp";
	if( mhist.bt_rec_delete.file != a ){
		mhist.bt_rec_delete.file = a;
		mhist.bt_rec_delete.title = "Удалить";
	}
	ct = mhist.coder_tree;

	if( (ext == "txt")||(ext == "rtf") ){
		a = mhist.etext;
		a.File = "";
                i = 2;
		if(ext == "rtf") {i = 3;}
                a.Style = i;
		a.Clear();
		if( fil != "" ){
			a.File = fil;
			a.UserData = "";
			a.ReplaceIterator("!_","_!","mhist_apply_text_tags");
			if( a.UserData != "" ){
				a.SelStart = mhist.etext.UserData;
				a.SelLength = 0;
			}
		}
		mhist.panel_etext.visible = "yes";
		a.Modified = 0;
		a.SetFocus();
                ct.PopupMenu = "spltree";
                ct.Text = mo.list; // справочник по умолчанию
		a = "yes";
		mhist.SetGroupPrm("rec_clipb","visible",a);
		if( mhist_clbrd.Count() == 0 ) a = "no";
		mhist.bt_rec_clipb.visible = a;
		return;
	}
	mhist.SetGroupPrm("rec_clipba","visible","no");
	if( ext == "tab" ){
		a = mhist.etable;
		a.visible = "yes";
		a.text = ""; // ??
		a.visible = 4098;
		a.SetFocus();
                ct.PopupMenu = "spltree";
                ct.Text = mo.list;
		return;
	}
	if( ext == "rpt" ){
		a = mhist.erpt;
		a.readonly = "no";
		a.visible = "yes";
		a.ReportName = nm;
		b = main.NetFunc("LRPT^YIMH",tp,pid,prf); // повторный запрос "чистого" xml-а
                mo.set("pattern",b);
		a.Edit();
		a.subscribed = 0;
		a.Modified = 0;
                ct.PopupMenu = "sptree";
		mhist.bt_rec_cng.visible = mhist_cfg.editdoc;
		// todo - запрос полей для заполнения с сервера (скопом) ?? - сразу приходит !!
		return;
	}
	if( (ext == "jpg")||(ext == "bmp")||(ext == "gif")||(ext == "png") ){
		mhist.eimage.File = fil;
		mhist.eimage.visible = "yes";
                ct.PopupMenu = "";
                ct.Text = mo.list;
		return;
	}
}

event mhist_bt_rec_create_close(a,b)
{
	mhist.btn_left.visible = "no";
	mhist.left_tree.visible = "no";
	if( b != "no" ) mhist.SetGroupPrm("doc_btns","visible","yes");
	mhist_update_navigate(0,0);
        if( mhist_cur_format == "" ) return;

	a = mhist.l_doc_title;
	a.x = 325;
	a.title = mhist_docs.obj.name;
	a.Hint = mhist_docs.obj.name;
	mhist.bt_rec_mnu.visible = "yes";

	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") )
		{ mhist.panel_etext.visible = "yes"; return; }
	if( mhist_cur_format == "tab" )
		{ mhist.etable.visible = "yes"; return; }
	if( mhist_cur_format == "rpt" )
		{ mhist.erpt.visible = "yes"; return; }
	if( (mhist_cur_format == "jpg")||(mhist_cur_format == "bmp")||(mhist_cur_format == "gif")||(mhist_cur_format == "png") )
		{ mhist.eimage.visible = "yes"; return; }
}

event mhist_rec_new_fromthis(a,b)
{ // создать из документа на просмотре
	if( mhist_vm == 1 ){
		mhist_msg_vm_doc(0,0);
		return;
	}
	var id,tp;
	tp = mhist_view.tp;
	id = mhist_view.id;
	a = main.NetFunc("GDST^YIMH",tp,otd_id,vr_id,spec_id);
	if( a == "" ){
		mhist_alert("Вы не можете создавать документы этого типа !",0);
		return;
	}
        mhist_rec_docs_tsave(0,0);
	mhist_bt_hist_new_link(0,999);
	mhist_bt_rec_create_select(a,999);
	if( mhist.erpt.visible == "no" ){
		mhist_bt_hist_old_link(0,990);
		mhist.vrpt.visible = "yes";
		return;
	}
	mhist_docs.obj.set("srd",id);
	main.NetProc("FILL^NEPRPT",vr_id,tp,"id:"+string(id),pid,mhist_docs.obj.id,mhist_docs.obj.dprofile);
}

event mhist_bt_rec_save_link(a,b)
{
	if( pid == 0 ){
		mhist_alert("Пациент не выбран !\r\nДокумент не будет создан !",0);
		return;
	}
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;

        var str = "owner,pid,sdt,lang,id,tp,name,ext,fil,unique,spec,srd,dprofile,content", mo, id, tsb, dsb;
	if( mhist_docs.index(mhist_cur_store) < 0 ){
		cout("ER save");
		return;
	}
	if( int(mhist_docs.obj.subscr) != 0 ){
		mhist_infostop("Сохранение изменений невозможно\r\nДокумент уже подписан.",0);
		return;
	}

	if( trim(main.NetFunc("NUL^NISUTL")) != "OK" ){
		mhist_infostop("Ошибка сервера. Попробуйте еще раз.",0);
		return;
	}

        if( mhist_cur_format == "rpt" ){
                str = "owner,pid,sdt,lang,id,tp,name,ext,fil,unique,spec,srd,dprofile,!content";
        }
	mhist_rec_docs_tsave(0,0);

	mo = mhist_docs.obj;
	if( b != 999 ){
		id = mo.id;
		dsb = mo.altvsbs;
		tsb = mhist_cfg.selsbs;
		a = "";
		if( ((tsb == 1)&&(mo.owner != vr_id))||(tsb == 3)||(dsb == 1) )
		{ // owner and user
			main.CreateHForm("mhsbs2.frm");
			main.NetProc("LSBS^YIMH",pid,id,mo.tp);
			main.mhsbs2.sel.data = 2;
			main.CreateForm("mhsbs2.frm",0-2,1);
			a = main.mhsbs2.sel.data;
			if( a == "" ) return;
			b = 999;
		}
		if( tsb == 2 )
		{ // all
			main.CreateHForm("mhsbssel.frm");
			main.NetProc("LSBS^YIMH",pid,id,mo.tp);
			main.CreateForm("mhsbssel.frm",0-2,1);
			a = main.mhsbssel.sel.data;
			if( a == "" ) return;
			b = 999;
		}
	}

	mo.set("pid",pid);
	mo.set("spec",spec_id);
	if( b == 999 ) mo.set("owner",a);
	a = trim(mhist.inf.i("sdate"));
	if( a != "" ) mo.set("sdt",a);
	mo.CatchXML("nb_console/mhist/init");
	a = mo.PostXML("S^YIMH()",str);
	mo.DiscardXML(); // fill 'id', 'ehruid'
	if( b == 999 ) mo.delete("owner");
	mo.delete("sdt");

	if( (a!="")&&(a!="xml") ){
		mhist_error(a,"");
	}
	
	if( mo.id == "" ){
		mhist_error("Ошибка сохранения документа.",0);
		return;
	}

	mo.set("saved",1);

	if( mhist_cur_format == "rpt" ){
		mhist.erpt.SetItem("ehruid",mo.ehruid);
		mhist.erpt.PostGraphics("net:DISK/",1);
		a = mo.addcontent;
		if( strlen(a) > 0 )
			mhist.erpt.xmldata = a;
		mhist.erpt.Modified = 0;
	}
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ) {
		mhist.etext.Modified = 0;
	}
}

event mhist_bt_rec_subscr_link(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	if( mhist_docs.index(mhist_cur_store) < 0 ){
		cout("ER save");
		return;
	}
	if( int(mhist_docs.obj.subscr) != 0 ) {
		mhist_infostop("Документ уже подписан",0);
		return;
	}
	var mo, str, half = 0, fl = "", who = "", id, q = 1, tsb, dsb, esb, t, cr;

	mhist_bt_rec_save_link(b,a);

	if( trim(main.NetFunc("NUL^NISUTL")) != "OK" ) {
		mhist_infostop("Ошибка сервера. Попробуйте еще раз.",0);
		return;
	}

	mo = mhist_docs.obj;

	if( mo.saved != 1 ) return;

	id = mo.id;
	if( id == "" ) return;
	dsb = mo.altvsbs;
	tsb = mhist_cfg.selsbs;
	if( ((tsb == 1)&&(mo.owner != vr_id))||(tsb == 3)||(dsb == 1) )	{ // owner and user
		main.CreateHForm("mhsbs2.frm");
		main.NetProc("LSBS^YIMH",pid,id,mo.tp);
		main.mhsbs2.sel.data = 1;
		main.CreateForm("mhsbs2.frm",0-2,1);
		who = main.mhsbs2.sel.data;
		if( who == "" ) return;
		q = 0;
	}
	if( tsb == 2 ){ // all
		main.CreateHForm("mhsbssel.frm");
		main.NetProc("LSBS^YIMH",pid,id,mo.tp);
		main.CreateForm("mhsbssel.frm",0-2,1);
		who = main.mhsbssel.sel.data;
		if( who == "" ) return;
		q = 0;
	}

	esb = "";
	if( mhist_cur_format == "rpt" ){
		a = mhist.erpt.CheckNull();
		if( strlen(a) > 0 ){
			a = piece(a,"|",2);
			mhist_alert("Перед подписанием документа Вы должны\r\nзаполнить "+a,0);
			return;
		}
		a = 1;
		if( int(mo.sbstype) != 0 ){
			main.CreateHForm("mhsbsc.frm");
			main.mhsbsc.lst.text = mhist.erpt.FieldsList(1,0,1); // todo - not null с примечанием
			main.CreateForm("mhsbsc.frm",0-2,1);
			if( main.mhsbsc.ModalResult != 1 ) return;
			fl = main.mhsbsc.lst.state;
			a = main.mhsbsc.all.data;
		}
		if( (q==1)&&(int(mo.sbstype) == 0) ) {
			b = mhist_quest("После подписания Вы больше не сможете\r\nвносить изменения в документ,\r\nхотите продолжить ?","");
			if( b == "NO" ) return;
		}
		if( a == 1 ) {
			esb = 1;
			half = 0;
		}
		if( a != 1 ) {
			esb = 2;
			b = mhist.erpt.FieldsList(1,0,1,1);
			if( b != fl ) half = 1;
		}
	}
	if( (q==1)&&(mhist_cur_format != "rpt") ){
		b = mhist_quest("После подписания Вы больше не сможете\r\nвносить изменения в документ,\r\nхотите продолжить ?","");
		if( b == "NO" ) return;
	}

	//if( mhist_cfg.eds == 1 ){ main.CreateForm("mifeds.frm",0-2,1); }

	a = 0;
	if( strlen(who) > 0 ){
		a = 999;
		b = who;
	}
	
	str = trim(main.NetFunc("SBSC^YIMH",pid,id,half,fl,who));
	if( strsub(str,1,1) == "@" ){
		mhist.exchange.data = piece(str,"@",3);
		a = piece(str,"@",2);
		main.CreateForm(a+".frm",0-2,1);
		return;
	}
	if( str != "" ){
		mhist_infostop(str,0);
		return;
	}

	if( esb == 1 ){
		mhist.erpt.Subscribed = 1;
		
	}
	if( esb == 2 ){
		half = mhist.erpt.Subscribe(fl,1);
		t = mo.subscr_fl;
		if( t != "" ) t = t+"\r\n"+fl;
		mo.set("subscr_fl",t);
	}

	if( half == 1 ) return; // неполная подпись

	a = main.UserConfigData("esign");
	if( a == 1 ) {
		cr = Create("crypto");
		a = trim(main.NetFunc("LDVD^YIMH",pid,id,1));
		if( a != "" ) {
			a = cr.Sign(a);
			if( strlen(a) > 3 ) {
				a = trim(pid)+"|"+trim(id)+"|1|"+string(a);
				main.NetPostData("SEQES^YIMH",a);
			}
			if( a == "CE" ) {mhist_error("Криптопровайдер не найден.",0);}
			if( a == "NC" ) {mhist_info("Сертификат не выбран.",0);}
			if( a == "ER" ) {mhist_error("Ошибка подписи УКЭП.",0);}
			Delete(cr);
		}
	}

	mo.set("subscr",1);
	if( mhist_cur_format == "rpt" ){
		mhist.erpt.readonly = "yes";
		mhist.SetGroupPrm("rec_clipba","visible","no");
	}
	if( mhist_cur_format == "txt" ){
		mhist.etext.style = 10;
	}
	if( mhist_cur_format == "rtf" ){
		mhist.etext.style = 11;
	}
	if( mhist_cur_format == "tab" ){
		mhist.etable.style = 4098;
	}
	a = "cdoc24.bmp";
	if( mhist.bt_rec_delete.file != a ){
		mhist.bt_rec_delete.file = a;
		mhist.bt_rec_delete.title = "Закрыть";
	}
}

event mhist_sst_rec(a,b) {
	var cr, d, s, ok, id, crstr, docid, sb;

	if( main.UserConfigData("esign") != 1 ) { return; }

	docid = mhist_docs.obj.id;
	s = trim(main.NetFunc("GSIGN^YIMH",pid,docid,1));
	if( s == "" ) { return; }

	cr = Create("crypto");
	d = trim(main.NetFunc("LDVD^YIMH",pid,docid,1));

	a = cr.Verify(d,s,2);

	ok = piece(a,"|",1);
	if( ok == "CE" ) {mhist_error("Криптопровайдер не найден.",0); ok="";}
	if( ok == "ER" ) {mhist_error("Ошибка верификации УКЭП.",0); ok="";}

	if( ok == "OK" ) {
		id = mhist_docs.obj.ehruid;
		crstr = piece(a,"|",2) + "|" + piece(a,"|",3) + "|" + id;
		sb = mhist.erpt.readonly;
		mhist.erpt.readonly = "no";
		mhist.erpt.SetItem("esign",crstr);
		mhist.erpt.Modified = 0;
		mhist.erpt.readonly = sb;
	}

	if( (ok != "OK")&&(ok != "") ) {
		mhist_error("Ошибка, код "+ok,0);
	}

	Delete(cr);
}

event mhist_bt_rec_print_link(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	if( mhist_docs.index(mhist_cur_store) < 0 ){
		cout("ER-print");
		return;
	}
	var i, c, t, s, id, tp, pp, d, e, mo;
	mo = mhist_docs.obj;
	a = int(mo.subscr);
	if( (a == 0)&&(mhist_cur_format == "rpt") ){
		a = 1;	
		//a = mhist.erpt.Subscribed;
	}
	if( a == 0 ){
		mhist_infostop("Нельзя распечатать документ.\r\nВы должны его подписать.",0);
		return;
	}
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ){
		mhist.etext.Print();
		return;
	}
	if( mhist_cur_format == "tab" ){
		mhist.etable.Print();
		return;
	}
	if( mhist_cur_format == "rpt" ){
		pp = mhist_cfg.prnnosbs;
		e = mhist.erpt;
		e.PrintReset();
		s = "";
		b = trim(e.PrintList);
		c = 1;
		if( strpos(b,"\r") == 0 )
		{ // 1 эл-т
			s = piece(b,"|",1);
			b = "";
		}
		if( b != "" ){
			main.CreateHForm("csellst.frm");
			d = main.csellst;
			d.lst.style = 1;
			d.lst.Text = b;
			d.l_doc_title.data = "Какой документ напечатать";
			if( mhist_cfg.prnnoall == 1 )
				d.clear_btn.visible = "no";
			main.CreateForm("csellst.frm",0-2,1);
			if( d.ModalResult != 1 ) return;
			c = d.lst.StateCount;
			s = d.lst.state;
			if( s == "" ){
				s = d.lst.data;
				if( strlen(s) > 0 ) c = 1;
			}
			if( c == 0 ){
				mhist_alert("Ничего не отмечено",0);
				return;
			}
		}
		mhist_sst_rec(0,0);
		e.PrintStart();
		id = mo.id;
		tp = mo.tp;
		a = e.Subscribed;
		if( a == 0 ) b = 1;
		if( a == 1 ) b = 0;
		if( (pp == 1)&&(a == 0 ) ){
			e.PrintBkText = "ЧЕРНОВИК";
		}
		for( i = 0 ; i < c ; i++ ) {
			t = piece(s,"|",i+1);
			e.xmldata = main.NetFunc("LDPRN^YIMH",pid,id,t,tp); // print pattern
			e.PrintStep(1,b);
		}
		if( pp == 1 ) a = 1;
		if( a == 0 ){
			e.PrintEndPreview(1,1);
		}
		if( a != 0 ){
			if( mhist_cfg.prndlg == 1 )
				e.PrintEndDialog(0,1,1);
			else
				e.PrintEndPreview(0,1,1);
		}
		if( pp == 1 ){
			e.PrintBkText = "";
		}
		return;
	}
	if( (mhist_cur_format == "jpg")||(mhist_cur_format == "bmp")||(mhist_cur_format == "gif")||(mhist_cur_format == "png") )
	{
		mhist.eimage.Print();
		return;
	}
}

event mhist_reset_rec_docs(a,b)
{
	var str = mhist.rec_docs.data, i;
	i = mhist.rec_docs.selected;
	mhist.rec_docs.Check = ""; // чтоб не перескакивало
	mhist.rec_docs.Delete(i);
	if( int(mhist.rec_docs.Count) == 0 ){
		mhist.rec_docs.Text = "|Нет";
	}
	mhist.rec_docs.selected = 0;
	mhist.rec_docs.Check = "mhist_rec_docs_check";
	mhist_cur_format = "";
	mhist_cur_store = "";
	mhist_docs.delete();

	mhist_update_navigate(0,0);
	mhist.SetGroupPrm("rec_clipba","visible","no");
	mhist.coder_tree.Text = "";

	if( b == 0 ){
		if( mhist_vm == 1 ) mhist_bt_hist_old_link(0,0);
		if( mhist_vm != 1 ) mhist_bt_rec_create_link(0,0);
		return;
	}
	mhist_rec_docs_check(0,0); // load first
}

event mhist_bt_rec_close(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	mhist_reset_rec_docs(0,0);
}

event mhist_bt_rec_delete_link(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	if( mhist.bt_rec_delete.file != "cdoc24.bmp" ){
		if( mhist_cur_format == "rpt" ){
			if( mhist.erpt.Subscribed != 0 ){
				mhist_infostop("Документ частично подписан.\r\nУдаление невозможно.",0);
				return;
			}
		}
		if( int(mhist_docs.obj.subscr) != 0 ){
			mhist_infostop("Документ уже подписан.\r\nУдаление невозможно.",0);
			return;
		}
		if( mhist_quest("Удалить текущий документ ?","") == "NO" ) return;
		if( strlen(mhist_docs.obj.id) > 0 ){
			a = trim(main.NetFunc("DELD^YIMH",pid,mhist_docs.obj.id)); // system code
			if( strlen(a) > 0 ){
				mhist_infostop(a,0);
				return;
			}
		}
	}
	mhist_reset_rec_docs(0,0);
}

event mhist_rec_sclose(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	mhist_bt_rec_save_link(0,0);
	mhist_reset_rec_docs(0,0);
}

function mhist_coder_e_add(str,lst,id)
{
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ){
		mhist.etext.InsertText(mhist.etext.SelStart+1,str);
		mhist.etext.SetFocus();
		return;
	}
	if( mhist_cur_format == "tab" ){
		mhist.etable.cell(mhist.etable.col,mhist.etable.row,str);
		return;
	}
	var me;
	if( mhist_cur_format == "rpt" ){
		me = mhist.erpt;
		if( id != "" ){
			if( me.ReplaceSelected("(*"+id+"*)",str) == 1 ) return;
		}
		if( lst == 0 ){
			me.AddSelected(str);
			return;
		}
		if( lst == 2 ){
			me.InsertSelected(str);
			return;
		}
		if( lst == 3 ){
			me.AddSelected(str);
			me.NextItem();
			return;
		}
		me.SetSelected(str);
		if( lst == 1 ) me.NextItem(); // присвоить и перейти к следующему, ТОЛЬКО = 1
	}
}

event mhist_coder_e_add_sp(str,lst) // w. space
{
	if( mhist_cur_format == "rpt" ){
		if( mhist.erpt.FieldIsNull() != 1 )
			{ str = " "+str; }
	} else {
		if( strlen(mhist.coder_tree.UserData) > 0 ) str = " "+str;
	}
	mhist_coder_e_add(str,lst,"");
}

event mhist_coder_e_chk(a,b)
{
	a = 0;
	if( (mhist_cur_format == "txt")||(mhist_cur_format == "rtf") ){
		if( int(mhist.etext.CharCount) == 0 ) a = 1;
	}
	if( mhist_cur_format == "tab" ){
		return;
	}
	if( mhist_cur_format == "rpt" ){
		a = mhist.erpt.FieldIsNull();
	}
	if( a == 0 ) return;
	mhist.coder_tree.UserData = "";
}

event mhist_coder_help(a,b)
{
	var sub, str;
	b = mhist.coder_tree;
	a = b.Index;
        if( a < 0 ) return;
	sub = b.ItemData(a);
	str = b.ItemText(a);

	a = strpos(sub,"#t:");
	if( a > 0 ) // текст
	{
		str = strdel(sub,1,a+3);
	}

	b.help = str;
}

event mhist_coder_tree_link(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	var tree = mhist.coder_tree;
	var str, i , c, t, idx, tmp = "", sub, lst, prev, cur, p, pr=1, brk = 0, cr=1, it, id = "", clt = ", ";
	idx = tree.Index;
        if( idx < 0 ) return;
	sub = tree.ItemData(idx);
	lst = int(mhist_cfg.coder_ins_tp);
	if( a == 999 ) lst = 2;
	if( strpos(sub,"#id:") == 1 ){
		sub = strdel(sub,1,4);
		id = piece(sub,"#",1);
		sub = mhutil.SetPiece(sub,"#",1,"");
	}
	if( strpos(sub,"#x:") > 0 ){
		if( strpos(sub,"#n") > 0 ){
			sub = strdel(sub,1,2);
			mhist_coder_e_add("\r\n",lst,id);
		}
		if( strpos(sub,"#ts:") > 0 ){
			sub = strdel(sub,1,4);
			tmp = piece(sub,"#",1);
			sub = mhutil.SetPiece(sub,"#",1,"");
			mhist_coder_e_add(tmp,lst,id);
		}
		sub = strdel(sub,1,3);
		if( strpos(sub,"frm:") == 1 ){
			sub = strdel(sub,1,4);
			mhist.SetGroupPrm("doc_allbtns","visible","no");
			store.Set("env","pac",pid);	
			if( main.CreateForm(sub,0-2,1) == 0 ) return;
			mhist.SetGroupPrm("doc_allbtns","visible","yes");
			tmp = store.GetDel("env","result");
			if( tmp == "" ) return;
			mhist_coder_e_add(tmp,lst,id);
			return;
		}
		main.Execute(sub);
		return;
	}
	if( strpos(sub,"#exe:") > 0 ){
		p = piece(sub,":",2);
		str = piece(sub,":",3);
		mhist_exe_menu_plg(p,str);
		return;
	}
	if( (mhist_cur_format == "jpg")||(mhist_cur_format == "bmp")||(mhist_cur_format == "gif")||(mhist_cur_format == "png") )
	{
		return;
	}
	mhist_coder_e_chk(0,0);
	if( strpos(sub,"#reset") > 0 ) // присвоить шифратор по умолч.
	{
		if( mhist_cur_format != "rpt" ) return;
		a = mhist.erpt.FieldList();
		if( strpos(a,"fnc:") == 1 ) return; // todo
		tree.Text = mhist.erpt.GetList(a);
		return;
	}
	str = "";
	p = "";
	if( mhist_cur_format == "rpt" ){
		if( mhist.erpt.FieldIsNull() == 1 ){
			p = "";
			cr = 0;
		}
		else{
			p = " ";
		}
	}
	else{
		if( strlen(tree.UserData) > 0 ) p = " ";
	}
	if( strpos(sub,"#fc:") > 0 ) // шифратор
	{
		str = strdel(sub,1,4);
		if( piece(str,"@",1) == "" ) return;
		tree.Text = main.NetFunc(piece(str,"@",1),piece(str,"@",2),pid,vr_id,spec_id);
		return;
	}
	if( strpos(sub,"#fq:") > 0 ) // поиск шифратор
	{
		str = strdel(sub,1,4);
		a = trim(prompt("Найти",""));
		if( piece(str,"@",1) == "" ) return;
		tree.Text = main.NetFunc(piece(str,"@",1),piece(str,"@",2),pid,vr_id,spec_id,a);
		return;
	}
	prev = tree.UserData;
	cur = "";
	do{
		tmp = tree.ItemText(idx);
		it = tmp;
		sub = tree.ItemData(idx);
		if( mhist_cur_format == "rpt" ){
			if( strpos(sub,"%%") > 0 )
			{
				sub = mhutil.ReplaceIterator(sub,"%%","%%","mhist_coder_tree_ffields");
			}
		}
		if( strpos(sub,"#.") > 0 ){
			sub = strdel(sub,1,2);
			brk = 1;
		}
		if( strpos(sub,"#!") > 0 ){
			sub = strdel(sub,1,2);
			tree.UserData = "";
			lst = 1; // todo
			pr = 0;
		}
		if( strpos(sub,"#zt") > 0 ){ // без заголовка
			sub = strdel(sub,1,3);
			tmp = "";
		}
		if( strpos(sub,"#nf") > 0 ){
			sub = strdel(sub,1,3);
			lst = 3;
		}
		if( strpos(sub,"#n") > 0 ){
			sub = strdel(sub,1,2);
			tmp = "\r\n"+tmp;
		}
		if( strpos(sub,"#ts:") > 0 ){
			sub = strdel(sub,1,4);
			tmp = piece(sub,"#",1)+tmp;
			sub = mhutil.SetPiece(sub,"#",1,"");
		}
		if( strpos(sub,"#cln") > 0 ){
			sub = strdel(sub,1,4);
			clt = "\r\n";
		}
		if( strpos(sub,"#id:") == 1 ){
			sub = strdel(sub,1,4);
			id = piece(sub,"#",1);
			sub = mhutil.SetPiece(sub,"#",1,"");
		}
		if( strpos(sub,"#*:") > 0 ){
			sub = strdel(sub,1,3);
			sub = trim(mhutil.InputBox("Укажите",sub,"",1));
			if( strsub(sub,1,1) == "0" ) { return; }
			sub = strdel(sub,1,1);
			t = strpos(tmp,"*");
			if( t > 0 )
			{
				tmp = strdel(tmp,t,1);
				tmp = strins(tmp,sub,t);
			}
			sub = "";
		}
		if( strpos(sub,"#f:") > 0 ){
			sub = strdel(sub,1,3);
                       	mhist_tag = sub;
                       	mhist_apply_tags(0,0);
                       	tmp = mhist_tag;
			sub = "";
		}
		if( strpos(sub,"#t:") > 0 ){ // текст
			tmp = strdel(sub,1,3);
			sub = "";
		}
		if( strpos(sub,"#ft:") > 0 ){ // текст network
			tmp = strdel(sub,1,4);
			a = piece(tmp,"@",2);
			b = piece(tmp,"@",3);
			if( b != "" ) b = trim(prompt(b,""));
			if( b != "" ) a = a+"@"+b;
			tmp = main.NetFunc(piece(tmp,"@",1),a,pid,vr_id,spec_id);
			sub = "";
		}
		if( strpos(sub,"#l:") > 0 ){ // список
			sub = strdel(sub,1,3);
			sub = mhutil.ReplaceText(sub,"@","\r\n");
			main.CreateHForm("sellst.frm");
			a = main.sellst;
			a.lst.Style = 0;
			a.lst.Text = sub;
			a.l_doc_title.data = it; // item text
			main.CreateForm("sellst.frm",0-2,1);
			if( a.ModalResult == 1 )
				{ tmp = tmp + " " + string(a.lst.Text); }
			sub = "";
		}
		if( strpos(sub,"#cl:") > 0 ){ // список состояний
			sub = strdel(sub,1,4);
			sub = mhutil.ReplaceText(sub,"@","\r\n");
			main.CreateHForm("csellst.frm");
			a = main.csellst;
			a.lst.Style = 0;
			a.lst.Text = sub;
			a.l_doc_title.data = it;
			main.CreateForm("csellst.frm",0-2,1);
			if( a.ModalResult == 1 ){
				a = mhutil.ReplaceText(a.lst.StateText,"|",clt);
				tmp = trim(tmp + " ") + string(a);
			}
			sub = "";
		}
		if( brk == 1 ){
			idx = 0-1;
		}
		if( brk == 0 ){
			if( idx != tree.Index ) str = " "+str;
			str = tmp + str;
			cur = cur + "|" + idx;
			idx = tree.ItemParent(idx);
			if( strpos(prev,"|"+idx+"|") > 0 ){
				idx = 0-1;
				pr = 0;
			} // до предыдущего уровня
		}
	}while(idx>=0);
	str = p + str;
	if( pr != 0 ) tree.UserData = cur+"|";
	if( cr == 0 ) str = trim(str); // todo - trimleft
	mhist_coder_e_add(str,lst,id);
}

event mhist_coder_tree_ffields(a,b)
{ // get field text
	a = mhutil.data;
	b = strsub(a,3,strlen(a)-4);
	if( strlen(b) == 0 ) return;
	b = mhist.erpt.GetItemText(b);
	mhutil.data = b;
}

event mhist_coder_tree_key(a,b)
{
	if( (int(a) == 13)||(int(a) == 32) ){
		mhist.coder_tree.NoKeyHandle = "yes"; 
		mhist_coder_tree_link(0,0);
		return;
	}
	if( mhist_cur_format != "rpt" ) return;
	if( int(a) == 9 ){
		mhist.coder_tree.NoKeyHandle = "yes";
		if( b == 1 ) mhist.erpt.PrevItem();
		if( b != 1 ) mhist.erpt.NextItem();
		mhist.coder_tree.SetFocus();
	}
}

event mhist_field_sym(a,b)
{
	if( mhist_cur_format == "" ) return;
	if( mhist_cur_store == "" ) return;
	if( b == 1 ) // add
	{
		mhist_coder_tree_link(0,0);
		return;
	}
	if( b == 2 ) // clr
	{
		mhist.coder_tree.UserData = "";
		mhist_coder_e_add("",9,"");
		return;
	}
	if( b == 3 ) // ,
	{
		mhist_coder_e_add(", ",0,"");
		return;
	}
	if( b == 4 ) // -
	{
		mhist_coder_e_add("- ",0,"");
		return;
	}
	if( b == 5 ) // .
	{
		mhist_coder_e_add(". ",0,"");
		return;
	}
	if( b == 6 ) // rn
	{
		mhist_coder_e_add("\r\n",0,"");
		return;
	}
	if( b == 7 ) // insert
	{
		mhist_coder_tree_link(999,0);
		return;
	}
}

event mhist_field_next(a,b)
{
	mhist.erpt.NextItem();
}

event mhist_field_prev(a,b)
{
	mhist.erpt.PrevItem();
}

event mhist_u_diag_check(a,b)
{
	a = trim(mhist.serv_diag.data);
	a = ttrans(a," 	","");
	mhist.serv_diag.data = a;
	if( a == "" ){
		mhist.serv_ldiag.title = "";
		return;
	}
	a = main.NetFunc("VCDIA^YNED",a,pid,trim(mhist.inf.i("pac_dog")),mhist.serv_flags.state,mhist.inf.i("sdate"));
	if( strpos(a,"!") == 1 ){
		a = strdel(a,1,1);
		mhist_alert("Диагноз не проходит по программе обслуживания !",0);
	}
	mhist.serv_ldiag.title = a;
}

event mhist_u_diag_key(a,b)
{
	if( int(a) == 13 ){
		mhist.serv_diag.NoKeyHandle = "yes";
		mhist.serv_flags.SetFocus();
	}
}

event mhist_serv_count_exit(a,b)
{
	a = float(mhist.serv_count.data);
	if( a > 32 ){
		b = mhist_quest("Указанное число услуг ("+string(a)+") слишком большое,\r\n уменьшить до 1 ?","");
		if( b == "YES" ){
			a = 1;
			mhist.serv_count.data = 1;
			return;
		}
	}
	if( a > 0 ) return;
	if( trim(mhist.serv_count.data) == "" ){
		mhist.serv_count.data = 1;
		return;
	}
	mhist_alert("Недопустимое количество услуг",0);
	mhist.serv_count.SetFocus();
}

event mhist_u_serv_check2(a,b)
{
	var i, c = mhist.left_tree.count, s, p;
	if( mhist.serv.Modified == 0 ) return; // те же данные
	for( i = 0 ; i < c ; i++ )
	{
		p = mhist.left_tree.ItemData(i);
		s = piece(p,"@",1);
		if( s == a ){
			mhist.left_tree.index = i;
			mhist.serv.UserData = p;
			return;
		}
	}
	mhist.serv.Modified = 0;
	a = mhist.serv_name.UserData;
	b = "Услуга отсутствует в списке разрешенных,\r\n";
	if( a == 0 ){
		mhist_infostop(b+"ввод невозможен !","");

	}
	if( a != 0 ){
		b = mhist_quest(b+"продолжить ?","");
		if( b == "YES" ){
			mhist.serv.Next();
			return;
		}
	}
	mhist.serv.data = "";
	mhist.serv.UserData = "";
	mhist.serv_name.data = "";
	mhist.serv_name.UserData = "";
	mhist.serv.SetFocus();
}

event mhist_u_serv_check(a,b)
{
	var c, k = 0;
	a = trim(mhist.serv.data);
	mhist.serv.UserData = a;
	mhist.serv_name.UserData = "";
	if( a == "" ) {
		mhist.serv_name.data = "";
		return;
	}
	if( mhist.servinfo.ItemTag("kss") == 1 ) k = 1; 
	b = main.NetFunc("UNAME^YNPRICE",a,pid,trim(mhist.inf.i("pac_dog")),"","@",0,k,trim(mhist.inf.i("sdate")));
	if( b == "" ){
		b = "Неверный код услуги ("+string(a)+")";
		mhist.serv_name.data = b;
		a = mhist_quest(b+", очистить ?",0);
		if( a == "YES" ) {
			mhist.serv.data = "";
			mhist.serv_name.data = "";
			return;
		}
		mhist.serv.SetFocus();
		return;
	}
	if( strpos(b,"\r\n") > 0 ){
		main.PopupWindow("list",trim(b),"mhist_userv_list",mhist.serv,0,100);
		return;
	}
	a = piece(b,"|",1);
	b = piece(b,"|",2);
	mhist.serv.data = piece(a,"@",1);
	mhist.serv.UserData = piece(a,"@",1);
	mhist.serv_name.data = b;
	mhist.serv_name.UserData = int(piece(a,"@",2));
	mhist.serv.Modified = 1;
	mhist_u_serv_check2(piece(a,"@",1),b);
}

event mhist_userv_list(a,b)
{
	a = main.PopupResult("list",1);
	b = main.PopupResult("list",2);
	mhist.serv.data = piece(a,"@",1);
	mhist.serv.UserData = piece(a,"@",1);
	mhist.serv_name.data = b;
	mhist.serv_name.UserData = int(piece(a,"@",2));
	mhist_u_serv_check2(piece(a,"@",1),b);
}

event mhist_usl_chksub(a,b) // check if subscribe
{
	mhist_usl_sub = 1;
	if( pid == 0 ) return;
	a = mhist.table_usl.rows;
	if( a == 1 ){
		mhist_usl_sub = 9;
		return;
	}
	if( mhist.table_usl.Cell(0,1) == "" ){
		mhist_usl_sub = 9; // нет никаких услуг
		return;
	}
	for( b = 1 ; b < a ; b++ ){
		if( mhist.table_usl.CellStyle(0,b) < 4 ){
			mhist_usl_sub = 0;
			break;
		}
	}
}

function mhist_usl_present(a,b) // подобную услугу добавляли
{
	var t = mhist.table_usl, i , c = t.rows, str, cc, k = 0;
	for( i = 1 ; i < c ; i++ ) {
		str = piece(t.Cell(3,i)," ",1);
		cc = t.CellStyle(0,i);
		if( str == a ) { k = 1; }
		if( (str == a)&&(cc != 4) ){
			i = c+1;
			break;
		}
	}
	a = mhist_cfg.singleserv;
	if( (i == c)&&(k == 0) ) return 0;
	if( (i != c)&&(a == 1) ) {
		mhist_infostop("Услуга уже добавлена,\r\nесли требуется указать несколько услуг - измените количество.",0);
		return 1;
	}
	if( a == 2 ) return 0;
	b = mhist_quest("Услуга "+string(str)+" уже отмечена!\r\nХотите добавить ?","");
	if( b == "NO" ) return 1;
	return 0;
}

event mhist_serv_add(a,b)
{
	var str, d, i, f, x, k, sd, ee, su;
	if( mhist_vm == 1 ) {
		mhist_msg_vm_usl(0,0);
		return;
	}
	str = mhist.serv.UserData;
	a = mhist_usl_present(str,0);
	if( a == 1 ) return;
	a = ttrans(trim(mhist.serv_comm.data),"|","/");
	b = trim(mhist.inf.i("pac_dog"));
        d = trim(mhist.serv_diag.data);
	if( mhist.servinfo.ItemTag("kss") == 1 )
		mhist.serv_flags.SetCheckData("kss",1);
	f = trim(mhist.serv_flags.state);
	sd = trim(mhist.inf.i("sdate"));
	if( mhist_cfg.kssalert == 1 ) {
		if( strpos("|"+f+"|","|kss|") > 0 ) {
			if( mhist_quest("Услуга отмечена как кассовая, хотите продолжить ?","") == "NO" ) return;
		}
	}
        if( d != "" ) {
                mhist_diag = d;
                mhist_diagt = mhist.serv_ldiag.title;
        }
	if( trim(mhist.serv_nz.data) != "" ) {
		a = a+"|"+ttrans(trim(mhist.serv_nz.data),"|,; ","////");
	}
	i = trim(mhist.inf.i("napr"));
	if( i != "" ) {
		a = mhutil.SetPiece(a,"|",3,i);
	}
	mhist.exchange.data = "";
	f = main.NetFunc("SH^YNED",vr_id,otd_id,spec_id,sd,pid,str,trim(mhist.serv_count.data),d,f,a,b);
	while( f != "xml" ) {
		a = strsub(f,1,1);
		if( (a != "@")&&(a != "?") ) {
			mhist_error(f,0);
			return;
		}
		ee = 0;
		f = strdel(f,1,1);
		if( a == "?" ) {
			if( mhist_quest(f,"") == "NO" ) return;
		}
		if( a == "@" ) {
			store.Set("env","pac",pid);
			store.Set("env","data",piece(f,"@",2));
			f = piece(f,"@",1);
			if( main.CreateForm(f,0-2,1) == 0 ) return;
			if( main.report(piece(f,".",1)).ModalResult != 1 ) return;
			if( store.GetDel("env","resh") == "exit" ) ee = 1;
		}
		if( ee != 1 ) f = main.NetFunc("RESH^YNED");
		if( ee == 1 ) f = "xml";
	}
	a = mhist.exchange.data;
	su = mhist.serv.UserData;
	k = vr_id+"|"+otd_id+"|"+spec_id+"|"+sd+"|"+su;
	for( i = 1 ; i < 9 ; i++ ) {
		d = piece(a,"|",i);
		if( d == "" ) break;
		f = piece(d,"@",1);
		x = piece(d,"@",2);
		store.Set("env","pac",pid);
		store.Set("env","data",x);
		store.Set("env","key",k);

		store.Set("env","date",sd);
		store.Set("env","id",su);
		store.Set("env","vr",vr_id);
		store.Set("env","ot",otd_id);
		store.Set("env","sp",spec_id);
		store.Set("env","pid",pid);

		mhist.exchange.data = x;
		main.CreateForm(f+".frm",0-2,1);
	}
// todo
			mhist.serv.data = "";
			mhist.serv_name.data = "";

	mhist.serv.UserData = str; // set in SH^
	mhist.exchange.data = "";
	mhist.serv_flags.UnCheckAll();
	mhist.serv_comm.data = "";
	if( mhist.serv_count.userdata != 1 )
		{mhist.serv_count.data = 1;}
	if( mhist.serv_nz.userdata != 1 )
		{mhist.serv_nz.data = "";}
	if( (mhist_cfg.lastdiag==2)&&(mhist.serv_diag.userdata != 1) )
		{mhist.serv_diag.data = "";}
	mhist.serv_comm.Title = "Примечание";
	mhist_serv_set_flg(0,0); // reset flags data
	mhist_serv_idx = "";

	main.NetProc("RRH^YNED",pid,vr_id,otd_id,spec_id,sd);
}

event mhist_serv_add_bt_link(a,b)
{
	mhist_serv_add(0,0);
	mhist.serv.SetFocus();
}

event mhist_u_save(a,b)
{
	var str, ss;
	if( mhist_vm == 1 ){
		mhist_msg_vm_usl(0,0);
		return;
	}
	a = float(mhist.serv_count.data);
	if( (a < 0)||(a == 0) ){
		mhutil.MessageBox("Недопустимое количество услуг","Ошибка","MB_OK,MB_ICONSTOP");
		mhist.serv_count.SetFocus();
		return;
	}
	str = trim(mhist.left_tree.selected);
	if( (mhist_serv_idx != "")&&(mhist.serv.UserData != str) )
	{ // сброс флагов если щелкнули после загрузки другую услугу
		mhist.serv_flags.UnCheckAll();
	}
	ss = mhist.serv;
	ss.UserData = str;
	if( strlen(str) == 0 ) return;
//	if( strpos(piece(str,"@",6),"c") > 0 )
//	{
//		if( mhist_cfg.usecrm != 1 )
//		{
//			if( mhutil.MessageBox("Данная услуга подлежит согласованию.\r\nХотите продолжить ?","Внимание","MB_YESNO,MB_ICONWARNING") == "NO" ) return;
//		}
//	}
	str = piece(str,"@",1);
	ss.UseProc = "no";
	ss.data = str;
	ss.UseProc = "yes";
	a = mhist.table_usl.rows;
	mhist_serv_add(0,0);

	if( mhist.table_usl.key(1) == "" ) return;
	if( (a>2)&&(mhist.table_usl.rows == a) ) return;

	a = mhist.left_tree.imgindex;
	b = 0;
	if( a == 4 ) b = 10;
	if( a == 5 ) b = 11;
	if( b == 0 ) return;
	mhist.left_tree.imgindex = b; // отм. по назн.
}

event mhist_u_delete(a,b)
{
	b = mhist.table_usl.key;
	if( b == "" ){
		mhist_error("Вы должны выбрать услугу из таблицы",0);
		return;
	}
	var str = piece(mhist.table_usl.cell(3)," ",1);
	if( str != "" ) str = " ("+string(str)+")";
	if( mhutil.MessageBox("Вы уверены, что хотите удалить выбранную услугу"+str+" ?","Внимание","MB_YESNO,MB_ICONWARNING") == "NO" ) return;
	if( b == mhist_serv_idx ) mhist_serv_idx = "";
	a = main.NetFunc("DH^YNED",vr_id,otd_id,spec_id,trim(mhist.inf.i("sdate")),pid,b);
	mhist.table_usl.SetFocus();
	if( a == "xml" ) return;
	mhist_alert(a,0);
}

event mhist_usl_flg_key(a,b)
{
	var c = int(mhist.serv_flags.count);
	if( int(a) > 96 ) a = int(a) - 97;
	else if( c == 10 ) a = int(a)-48;
	else a = int(a)-49;
	if( (a >= c)||( a < 0 ) ) return;
	a = a+1;
	if( mhist.serv_flags.check(a) == "1" ) mhist.serv_flags.SetCheck(a,"0");
	else mhist.serv_flags.SetCheck(a,"1");
}

event mhist_usl_table_link(a,b)
{
	var str, k, c, dt, tab;
	tab = mhist.table_usl;
	a = tab.row;
	if( mhist_vm == 1 ){
		mhist_msg_vm_usl(0,0);
		return;
	}
	k = tab.key;
	if( k == "" ) return;
	c = int(tab.col);
	if( c == 4 ){
		if( tab.CellStyle(0,a) == 4 ){
			mhutil.MessageBox("Изменение невозможно - услуга уже подписана","Ошибка","MB_OK,MB_ICONSTOP");
			return;
		}
	}
	dt = trim(mhist.inf.i("sdate"));
	if( c == 1 ) // diag
	{
		main.CreateForm("fmkbmh.frm",0-2,1);
		a = main.fmkbmh;
		if( a.ModalResult != 1 ) return;
		a = a.tree.selected;
		b = main.NetFunc("SDIA^YNED",vr_id,otd_id,spec_id,dt,pid,k,a);
		if( strpos(b,"xml") == 0 ) mhist_error(b,0);
		return;
	}
	if( c == 2 ) // flg
	{
		a = main.NetFunc("GFLG^YNED",vr_id,otd_id,spec_id,dt,pid,k);
		store.Set("env","state",a);
		main.CreateHForm("csellst.frm");
		a = main.csellst;
		a.lst.Style = 1;
		a.lst.Text = mhist.serv_flags.text;
		a.l_doc_title.data = "Изменить состояние услуги";
		main.CreateForm("csellst.frm",0-2,1);
		if( a.ModalResult != 1 ) return;
		b = main.NetFunc("SFLG^YNED",vr_id,otd_id,spec_id,"",pid,k,a.lst.state);
		if( strpos(b,"xml") == 0 ) mhist_error(b,0);
		return;
	}
	if( c == 4 ) // count
	{
		b = trim(prompt("Количество",tab.cell(4)));
		if( b == "" ) return;
		b = main.NetFunc("SCNT^YNED",vr_id,otd_id,spec_id,dt,pid,k,b);
		if( strpos(b,"xml") == 0 ) mhist_error(b,0);
		return;
	}
	if( c == 5 ) // sum
	{
		if( mhist_cfg.setsumm != 1 ){
			mhutil.MessageBox("Изменение запрещено","","MB_OK,MB_ICONSTOP");
			return;
		}
		b = trim(prompt("Сумма",tab.cell(5)));
		if( b == "" ) return;
		b = main.NetFunc("SSUM^YNED",vr_id,otd_id,spec_id,dt,pid,k,b);
		if( strpos(b,"xml") == 0 ) mhist_error(b,0);
		return;
	}
	if( c == 6 ) // comment
	{
		b = trim(prompt("Комментарий",tab.cell(6)));
		if( b == "" ) return;
		b = main.NetFunc("SCOM^YNED",vr_id,otd_id,spec_id,dt,pid,k,b);
		if( strpos(b,"xml") == 0 )
			{ mhist_error(b,0); }
		return;
	}
	mhist_serv_zero(0,0);
	mhist_serv_idx = k;
	main.NetProc("RH^YNED",vr_id,otd_id,spec_id,dt,pid,mhist_serv_idx);
}

event mhist_usl_tab_key(a,b)
{
	if( (a==70)&&(b==3) ) //Ctrl+F
	{
		var x = mhist.table_usl.col;
		if( x == (int(mhist.table_usl.columns)-2) ){
			if( mhist.table_usl.FindDlg("Поиск кода услуги") < 0 ) mhist_info("Ничего не найдено","");
		}
		else{
			mhist.table_usl.col = 0;
			if( mhist.table.FindDlg("Поиск № истории") < 0 ) mhist_info("Ничего не найдено","");
		}
		return;
	}
	if( int(a) == 46 ){ // del.
		mhist_u_delete(0,0);
	}
}

event mhist_serv_clrd(a,b)
{
	var k;
	a = mhist.table_usl.row;
	if( mhist_vm == 1 ){
		mhist_msg_vm_usl(0,0);
		return;
	}
	k = mhist.table_usl.key;
	if( k == "" ) return;
	if( mhist.table_usl.CellStyle(0,a) == 4 ){
		mhutil.MessageBox("Изменение невозможно - услуга уже подписана","Ошибка","MB_OK,MB_ICONSTOP");
		return;
	}
	b = main.NetFunc("SDIA^YNED",vr_id,otd_id,spec_id,trim(mhist.inf.i("sdate")),pid,k,"");
	if( strpos(b,"xml") == 0 )
			{ mhist_error(b,0); }
}

event mhist_bt_serv_cng_link(a,b)
{
	var str;
	if( mhist_vm == 1 ){
		mhist_msg_vm_usl(0,0);
		return;
	}
	if( mhist_serv_idx == "" ){
		mhist_error("Вы должны выбрать услугу из таблицы",0);
		return;
	}
	str = trim(mhist.left_tree.selected);
	if( strlen(str) == 0 ) { return; }
	if( mhist_serv_idx == "" ) { return; }
	a = ttrans(trim(mhist.serv_comm.data),"|","/");
	if( trim(mhist.serv_nz.data) != "" ){
		a = a+"|"+ttrans(trim(mhist.serv_nz.data),"|,; ","////");
	}
	main.NetProc("WH^YNED",vr_id,otd_id,spec_id,trim(mhist.inf.i("sdate")),pid,mhist_serv_idx,str,trim(mhist.serv_diag.data),trim(mhist.serv_flags.state),a);
}

event mhist_bt_serv_kvit_link(a,b)
{
	if( mhist.table_usl.key == "" ){
		mhist_infostop("Нет услуг, доступных для печати квитанции",0);
		return;
	}
	a = mhist_cfg.kvprint;
	if( a == "" ){
		store.SetData("patient",pid);
		main.CreateForm("kkvprn.frm",0-2,1);
		return;
	}
	a = main.NetFunc(a,vr_id,otd_id,spec_id,pid,trim(mhist.inf.i("sdate")));
	if( a == "" ) return;
	rptgen.Pattern = a;
	rptgen.PrintDialog();
}

event mhist_bt_serv_find_link(a,b)
{
	main.CreateForm("edfprn.frm");
}

event mhist_bt_pac_detail_link(a,b)
{
	a = trim(mhist.pac_id.data);
	if( a == "" ) return;
	store.SetData("patient",a);
	main.CreateForm("xpatient.frm");
	main.report("xpatient").runproc.data = "mhist_pfind_upd(0,0);";
}

event mhist_smartcard(a,b)
{
	if( mhist.pac_btns.visible == "no" ) { return; }
	var tp, ret = main.NetFunc("CTP^YICARDS",mifare_id); // из CTP^YICARDS + отметка о приходе
	tp = piece(ret,"|",1);
	if( (tp == "P")||(tp == "O") ){
		mhist.pac_id.data = piece(ret,"|",2);
		mhist_pfind_upd(0,0);
		if( mhist.bt_pac_sel.visible == "no" ) return;
		mhist.bt_pac_sel.SetFocus();
	}
}

event mhist_bt_serv_subscr_link(a,b)
{
	var str, u, i, f;
	mhist_usl_chksub(0,0);
	if( mhist_usl_sub != 0 ){
		mhist_alert("Нет услуг, доступных для подписи",0);
		return;
	}
	if( mhutil.MessageBox("Вы хотите подписать оказанные пациенту услуги ?\r\nПосле этого вы не сможете изменить их.","Внимание","MB_YESNO,MB_ICONWARNING") == "NO" ) return;
	a = mhist.inf.i("pac_dog");
	str = trim(main.NetFunc("SBSUP^YNED",pid,vr_id,otd_id,trim(mhist.inf.i("sdate")),spec_id,a));
	if( str != "xml" ){
		if( str != "" ) mhist_error(str,0);
		return;
	}
	u = mhist.exchange.data;
	mhist.exchange.data = "";
	if( piece(u,"|",1) == "update" ){ // обновить, когда нужно
		mhist_upd_price(0,0);
	}
	for( i = 1 ; i < 5 ; i++ ){
		f = piece(u,"|",i);
		if( strpos(f,"@") > 0 ){
			f = piece(f,"@",1);
			main.CreateForm(f+".frm",0-2,1); 
		}
	}


	mhist_usl_flg = main.NetFunc("GETFLG^YIMHS",vr_id,otd_id,spec_id,pid);
	mhist_serv_set_flg(0,0);

	a = mhutil.findpiece(u,"|","print");
	if( a > 0 ){
		b = piece(u,"|",a+2);
		a = piece(u,"|",a+1);
		rptgen.LoadPattern(a);
		if( b !="" ){
			rptgen.XmlData = main.NetFunc(piece(b,":",1),pid,otd_id,vr_id,spec_id,piece(b,":",2));
		}
		rptgen.Print(); 
	}

	a = 1;
	if( mhist_cfg.autokv == "no" ) a = 0;
	if( main.UserConfigData("mhist.kvit") == "0" ) a = 0;
	if( a == 1 ){
		if( mhutil.MessageBox("Хотите отпечатать квитанцию ?","Внимание","MB_YESNO,MB_ICONWARNING") == "YES" )
			mhist_bt_serv_kvit_link(0,0);
	}
}

event mhist_serv_diagsel_bt_link(a,b)
{
	main.CreateForm("fmkbmh.frm",0-2,1);
	a = main.fmkbmh;
	if( a.ModalResult != 1 ) return;
	b = trim(a.tree.selected);
	mhist.serv_diag.data = b;
	b = trim(a.tree.data);
	mhist.serv_ldiag.title = b;
	mhist_u_diag_check(0,0);
}

event mhist_serv_udiag_bt_link(a,b)
{
	store.Set("env","pac",pid);
	main.CreateForm("pacdiag.frm",0-2,1);
	a = main.pacdiag;
	if( a.ModalResult != 1 ) return;
	mhist.serv_diag.data = a.selected.data;
	mhist.serv_ldiag.title = a.selname.data;
	mhist_u_diag_check(0,0);
}

event mhist_bt_serv_calc_link(a,b)
{
	store.Set("env","pac",pid);
	store.Set("env","pac-dgn",trim(mhist.inf.i("pac_dog")));
	main.CreateForm("unprice.frm",0-2,1);
}

event mhist_serv_calc_nks(a,b)
{
	store.Set("env","pac",pid);
	store.Set("env","pac-dgn",trim(mhist.inf.i("pac_dog")));
	store.Set("env","kss",0);
	main.CreateForm("unprice.frm",0-2,1);
}

event mhist_serv_flags_link(a,b)
{
	var sel, str, i, s;
	b = mhist.serv_flags;
	s = b.selected;
	str = trim(piece(mhist_usl_flg,"\r\n",s+1));
	if( strpos(str,"@") == 0 ) return;
	sel = "";
	for( i = 2 ; i < 99 ; i++ ){
		sel = sel + piece(piece(str,"@",i),"|",2)+"|"+piece(piece(str,"@",i),"|",1) + "\r\n";
		if( piece(str,"@",i) == "" ) break;
	}
	main.CreateHForm("sellst.frm");
	a = main.sellst;
	a.lst.Text = trim(sel);
	a.l_doc_title.data = "ВЫБОР СТАТУСА";
	main.CreateForm("sellst.frm",0-2,1);
	if( a.ModalResult != 1 ){
		b.SetCheck(s,0);
		return;
	}
	sel = mhist.serv_flags.selected;
	if( sel < 0 ) return;
	a = a.lst;
	b.ItemText(sel,trim(a.text));
	b.ItemData(sel,trim(a.data));
	b.SetCheck(sel,"1");
}

event mhist_serv_flags_chk(a,b)
{
	var str, sel, i, c, f;
	sel = mhist.serv_flags.selected;
	if( mhist.serv_flags.data == "" ){
		mhist_serv_flags_link(0,0);
		return;
	}
	str = "|"+piece(trim(piece(mhist_usl_flg,"\r\n",sel+1)),"~",2)+"|";
	c = mhist.serv_flags.count;
	for( i = 0 ; i < c ; i++ ){
		if( (sel!=i)&&(strpos(str,"|"+string(mhist.serv_flags.ItemData(i))+"|") > 0) ){
			mhist.serv_flags.SetCheck(i,0);
		}
	}
	a = "";
	b = "Примечание";
	if( mhist.serv_comm.title != b ) mhist.serv_comm.title = b;
	if( a != "" ) mhist.serv_comm.data = a;
}

event mhist_bt_pac_date_link(a,b)
{
	main.CreateForm("mhidate.frm",0-2,1);
}

event mhist_bt_pac_mview_link(a,b)
{
	pid = trim(mhist.pac_id.data);
	if( strlen(pid) == 0 ) return;
	mhist_rec_docs_clear(0,0);
	mhist_cur_format = "";
	mhist_cur_store = "";
	mhist_vm = 1;
	mhist_sel_pac_clr(0,0);
	var mi;
	mi = mhist.inf;

	a = mi.i("apin");
	if( a != "" ){
		b = mhist_apin(0,0);
		if( a != b ){
			mhist_alert("Доступ запрещен.",0);
			return;
		}
	}

	main.NetProc("SELVNIB^YIMHP",pid,otd_id,vr_id,spec_id);

	a = mi.i("alertv");
	if( a != "" ){
		mhist_alert(a+"\r\nпродолжение невозможно !",0);
		return;
	}
	a = mi.i("warn");
	if( a != "" ){
		mhist_alert(a,0);
	}

	mhist_serv_set_flg(0,0); // reset flags data
	mhist_bt_hist_old_link(0,0);

	a = trim(mi.i("inedit"));
	if( a != "" ){
		b = mhist_quest("Вернуться к незаконченному документу ?",0);
		if( b == "YES" ){
			mhist_load_in_edit(a,0);
			return;
		}
	}
}

event mhist_next_vdoc(a,b)
{
        b = int(mhist.hist_view.count);
        for( a = int(mhist.hist_view.index)+1 ; a < b ; a++ ){
                mhist.hist_view.index = a;
                if( strlen(mhist.hist_view.selected)>0 ){
                        // mhist_hist_view_link(0,0); autoselect
                        return;
                }
        }
        mhist_alert("Данный документ является последним",0);
}

event mhist_prev_vdoc(a,b)
{
	b = mhist_vstk.count-1;
	mhist_vstk.delete(b);
	if( int(mhist_vstk.Count) < 2 ){
		mhist.btn_prev_doc.visible = "no";
	}
	mhist.hist_view.index = mhist_vstk.last;
	if( b > 0 ) mhist_vstk.delete(b-1);
	if( strlen(mhist.hist_view.selected)>0 ){
		// mhist_hist_view_link(0,0); autoselect
	}
}

event mhist_bt_hist_exp_link(a,b)
{
	var i, c, str, idx, v, t, nm, f, flt;
	c = mhist.hist_view.count;
	if( c == 0 ){
		mhist_infostop("У пациента нет документов для печати",0);
		return;
	}
	a = mhutil.MessageBox("Создать выписку из истории ?","Внимание","MB_YESNO,MB_ICONWARNING");
	if( a == "NO" ) return;

	main.CreateHForm("csellst.frm");
	a = main.csellst;	
	a.lst.style = 1;
	a.lst.Text = main.NetFunc("TPLST^YIMH",pid,1);
	a.lst.CheckAll();
	a.l_doc_title.data = "Виды документов для выписки";
	main.CreateForm("csellst.frm",0-2,1);
	if( a.ModalResult != 1 ) return;
	flt = a.lst.state;
	if( flt == "" ) return;
	flt = "|"+flt+"|";

	idx = mhist.hist_view.index;
	v = mhist.vrpt;
	v.PrintReset();
	v.PrintStart();
	nm = v.ReportName;
	v.ReportName = "ЭМК";
	f = 0;
	for( i = 0 ; i < c ; i++ ){
		str = mhist.hist_view.ItemData(i);
		t = piece(str,"~",3);
		a = strpos(flt,"|"+piece(str,"~",2)+"|");
		if( (a>0)&&((t == "rpt")||(t == "tab")) ){
			if( f == 1 ){
				v.LoadPattern("nulline.rpt");
				v.PrintStep();
			}
			mhist.hist_view.index = i;
			mhist_vstk.last = i;
			mhist_hist_view_link(0,0);
			wait(300);
			if( mhist_view.ext == "rpt" ){
				b = trim(mhist.vrpt.PrintList);
				b = piece(b,"|",1);
				v.xmldata = main.NetFunc("LDPRN^YIMH",pid,mhist_view_doc,b);
				v.PrintStep();
			}
			if( mhist_view.ext == "tab" ){
				b = mhist_view.printfn;
				if( b == "" ) b = "mhist-tab.xml";
				a = main.LoadFile(b);
				if( a != "" ){
					v.SetItem("ehruid",mhist_view.ehruid);
					v.xmldata = a;
					v.PrintStep();
				}
			}
			f = 1;
		}
	}
	v.ReportName = "ЭМК";
	v.PrintEndDialog(0,1);
	v.ReportName = nm;
}

event mhist_bt_rec_fill_link(a,b)
{
	if( mhist.left_tree.visible == "yes" )
		{ return; }
        if( mhist_cur_format == "" ){
                mhist_infostop("Документ не выбран",0);
                return;
        }
	if( int(mhist_docs.obj.subscr) != 0 ){
		mhist_infostop("Документ уже подписан.\r\nИзменение невозможно.",0);
		return;
	}
        if( (mhist_cur_format == "tab")||(mhist_cur_format == "rep")||(mhist_cur_format == "frm")||(mhist_cur_format == "jpg")||(mhist_cur_format == "bmp")||(mhist_cur_format == "dcm") ) {
                mhist_alert("Для данного документа заполнение не поддерживается",0);
                return;
        }
        main.CreateForm("mhfill.frm",0-2,1);
}

event mhist_bt_hist_copy_link(a,b)
{
	if( mhist_view_doc == "" ) return;
	if( mhist_docs.Count == 0 ) {
		mhist_rec_new_fromthis(0,0);
		return;
	}

	b = mhist_view.ext;
	if( (b != "rpt")&&(b != "rtf")&&(b != "txt") ){
                mhist_alert("Для данного документа запрещено копирование данных",0);
                return;
	}
	if( (b == "rtf")||(b == "txt") ){
		if( mhist.vtext.SelLength == 0 ){
			mhist_alert("Вы должны выделить область текста!",0);
                	return;
		}
	}
        main.CreateForm("mhclip.frm",0-2);
	mhclip_set_state(0,0);
	if(b == "rpt"){
		main.CreateHForm("csellst.frm");
		a = main.csellst;
		a.lst.Style = 1;
		a.lst.Text = mhist.vrpt.FieldsList(1,1);
		a.l_doc_title.data = "ВЫБОР РАЗДЕЛОВ";
		a.proc.data = "mhclip_lst_add"; 
		main.CreateForm("csellst.frm",0-2,1);
		return;
	}
	mhist_clbrd.Set(mhist.r_doc_title.data,mhist.vtext.SelText);
	main.Execute("mhclip_lst_fill(0,0);");
}

event mhist_rec_copydoc(a,b)
{
	if( mhist_docs.Count == 0 ){
		mhist_error("Копирование невозможно - нет нового документа","");
		return;
	}
	var i, x, t, txt;
	txt = mhist.vrpt.FieldsList(1,1,0,1);
	if( txt == "" ){
		mhist_alert("Нет доступных полей для копирования","");
		return;
	}
	for( i = 1 ; i < 99 ; i++ ){
		x = piece(txt,"|",i);
		if( x == "" ){
			mhist_bt_hist_new_link(0,0);
			return;
		}
		t = mhist.vrpt.GetItem(x);
		mhist_incopy.Set(x,t);
	}
	mhist_error("Ни одно поле не скопировано","");
}

event mhist_rec_copyclip(a,b)
{
        main.CreateForm("mhclip.frm",0-2);
	mhclip_set_state(0,0);
	mhclip_all_add(0,0);
}

event mhist_bt_rec_clipb_link(a,b)
{
	if( mhist_cur_format == "" ) return;
        main.CreateForm("mhclip.frm",0-2);
	mhclip_set_state(1,0);
}

event mhist_rec_prev_doc(a,b)
{
        if( mhist.rec_docs.SelText == "Нет" ) return;
        a = mhist.rec_docs.index();
        b = mhist.rec_docs.count;
        if( b == 1 ) return;
        a = a-1;
        if( a < 0 ) a = b-1;
        mhist.rec_docs.index = a;
        mhist_rec_docs_check(0,0);
}

event mhist_rec_next_doc(a,b)
{
        if( mhist.rec_docs.SelText == "Нет" ) return;
        a = mhist.rec_docs.index();
        b = mhist.rec_docs.count;
        if( b == 1 ) return;
        a = a+1;
        if( a == b ) a = 0;
        mhist.rec_docs.index = a;
        mhist_rec_docs_check(0,0);
}

event mhist_import_img(a,b)
{
	a = disk.OpenDialog("*.jpg;*.bmp");
	if( strlen(a) > 0 ){
		b = string(mhist.erpt.GetItemPieces());
		b = string(mhist_docs.obj.unique)+"-"+b+".jpg";
                mhist.erpt.LoadGraphics("",a,"",b); // to current item
        }
}

event mhist_import_inimgs(a,b)
{
	main.CreateForm("mhaimg.frm",0-2,1);
}

event mhist_import_dicom(a,b)
{
	var d, plg = "dcmj2pnm";
	if( main.TestPlugin(plg) == 0 ){
		cout("Ошибка: не найден плагин");
		return;
	}
	a = disk.OpenDialog("*.dcm");
	if( strlen(a) > 0 ){
		d = tpath+"dicom.jpg";
		main.RunPluginAndWait(plg,"\""+a+"\" \""+d+"\" --write-jpeg"); // --change-polarity
		b = mhist_docs.obj.unique+"-"+string(mhist.erpt.GetItemPieces())+".jpg";
                mhist.erpt.LoadGraphics("",b,"",b); // load to current item
        }
}

function mhist_exe_menu_plg(plg,ext)
{
	if( main.TestPlugin(plg) == 0 ){
		cout("Ошибка: не найден плагин");
		return;
	}
	var a,t,lst,c,i,b,d;
	d = tpath+"in\\";
	disk.CreateDir(d);
	a = d+"data."+ext;
	main.RunPluginAndWait(plg,"\""+a+"\"");
	lst = Create("strings");
	t = disk.Files(d+"*."+ext); //*data
	lst.Text = t;
	c = lst.Count;
	for( i = 0 ; i < c ; i++ ){
		t = lst.string(i);
		t = d+t;
		b = mhist_docs.obj.unique+"-"+string(mhist.erpt.GetItemPieces())+"."+ext;
		mhist.erpt.LoadGraphics("",t,"",b);
		disk.DelFile(t);
	}
	Delete(lst);
}

event mhist_napr(a,b)
{
	if( mhist_docs.obj.Count() > 0 ){
		b = mhist_docs.obj.id;
		if( b == "" )
		{ // сохранить для получения ID
			mhist_bt_rec_save_link(0,0);
		}
	}
	mhist.SetGroupPrm("doc_allbtns","visible","no");
	store.Set("env","pac",pid);
	b = "";
        if( a == 1 ) b = "prplab";
        if( a == 2 ) b = "prpcon";
        if( a == 3 ) b = "prpcon"; //"prpdia.frm"
        if( a == 4 ) b = "prpprc";
        if( a == 5 ) b = "prplek";
        if( a == 7 ) b = "prphsp";
        if( a == 71 ) b = "prphsps1";
	if( b != "" ) { main.CreateForm(b+".frm",0-2,1); }
	mhist.SetGroupPrm("doc_allbtns","visible","yes");
}

event mhist_standart(a,b)
{
	a = "";
	if( mhist_cur_format == "rpt" ){
		a = piece(trim(mhist.erpt.GetItem("diag"))," ",1);
	}
	if( a == "" ){
		a = mhist_diag;
	}
	store.Set("env","diag",a);
	store.Set("env","pac",pid);
	main.CreateForm("spmes.frm",0-2,1);
}

event mhist_clirq(a,b)
{
	a = "";
	if( mhist_cur_format == "rpt" ){
		a = piece(trim(mhist.erpt.GetItem("diag"))," ",1);
	}
	if( a == "" ){
		a = mhist_diag;
	}
	store.Set("env","diag",a);
	store.Set("env","pac",pid);
	main.CreateForm("clirq.frm",0-2,1);
}

event mhist_diagnose(a,b)
{
	var f, t, x, ftp;
	if( a == 1 ){
		store.Set("env","pac",pid);
		main.CreateForm("pacdiag.frm",0-2,1);
		f = main.pacdiag;
		if( f.ModalResult != 1 ) return;
		a = f.selname.data;
		mhist_coder_e_add_sp(a,0);
		if( a != "" ){
			mhist_diag = piece(a," ",1);
			mhist_diagt = a;
		}
		return;
	}
	f = "fmkb";
	x = 0;
	ftp = "";
	if( a == 3 ){
		f = "fmkbsel";
		x = 1;
		b = mhist_diagt;
		if( mhist_cur_format == "rpt" ){
			b = mhist.erpt.GetItem();
		}
		a = 1;
		if( mhist.erpt.FieldType() == "cpl" ) {a = 0;}
		store.Set("env","diag",b);
		store.Set("env","ssel",a);
	}
	if( mhist_cur_format == "rpt" ){
		ftp = mhist.erpt.FieldType();
	}
	main.CreateForm(f+".frm",0-2,1);
	b = main.report(f);
	if( b.ModalResult != 1 ) return;
	t = trim(b.tree.UserData);
	if( ftp == "s" ) t = piece(piece(t,"\r\n",1),"|",2);
	if( ftp == "m" ){
		t = piece(t,"|",2);
		if( f == "fmkbsel" ) t = trim(b.diag.UserData); // text
	}
	a = trim(b.diag.data);
	mhist_coder_e_add_sp(t,x);

	mhist_diag = ttrans(piece(a," ",1),"?","");
	mhist_diagt = piece(a,"\r",1);
}

event mhist_vtable_link(a,b)
{
	a = mhist.vtable.key;
	if( a == "" ) return;
	var i,c,str;
	if( strsub(a,1,4) == "doc:" ){
		b = strdel(a,1,4);
		c = mhist.hist_view.count;
		for( i = 0 ; i < c ; i++ ){
			str = mhist.hist_view.ItemData(i);
			if( piece(str,"~",1) == b ){
				mhist.hist_view.index = i;
				mhist_hist_view_link(0,0);
				return;
			}
		}
		mhist_alert("Невозможно показать связанный документ -\r\nотстутвует в текущем представлении ЭИБ",0);
		return;
	}
	if( strsub(a,1,4) == "run:" ){
		b = strdel(a,1,4);
		str = piece(b,"@",1);
		b = piece(b,"@",2);
		main.NetProc(str,b);
	}
}

event mhist_bt_coder_cfg_link(a,b)
{
	if( int(mhist_docs.obj) == 0 ) return;
	if( mhist.left_tree.visible == "yes" ) return;
	if( mhist_cfg.codercfg == "no" ){
		mhist_infostop("Нет прав на изменение",0);
		return;
	}
	if( mhist_cur_format == "rpt" ){
		if( mhist.erpt.GetListTag() == "ro" ){
			mhist_infostop("Изменение динамического списка запрещено",0);
			return;
		}
		if( strpos(mhist.erpt.FieldList(),"fnc:") == 1 ){
			mhist_infostop("Изменение динамического списка запрещено",0);
			return;
		}
		if( strpos(mhist.erpt.FieldList(),"@") > 0 ){
			mhist_infostop("Изменение списка запрещено",0);
			return;
		}
		if( mhist.erpt.FieldName == "" ){
			mhist_infostop("Не выбрано ни одно поле",0);
			return;
		}
	}
	store.Set("env","format",mhist_cur_format);
	main.CreateForm("mhcoder.frm",0-2,1);
}

event bt_rec_clpaste_link(a,b)
{
	if( mhist_cur_format == "rpt" )
		mhist.erpt.PasteClipboard();
	if( (mhist_cur_format == "rtf")||(mhist_cur_format == "txt") )
		mhist.etext.Paste();
}

event bt_rec_clcopy_link(a,b)
{
	if( mhist_cur_format == "rpt" )
		mhist.erpt.CopyClipboard();
	if( (mhist_cur_format == "rtf")||(mhist_cur_format == "txt") )
		mhist.etext.CopySel();
}

event bt_rec_clcut_link(a,b)
{
	if( mhist_cur_format == "rpt" )
		mhist.erpt.CutClipboard();
	if( (mhist_cur_format == "rtf")||(mhist_cur_format == "txt") )
		mhist.etext.CutSel();
}

event mhist_vr_label_link(a,b)
{
	if( mhist.bt_step_pac.FontStyle != "bold" ){
		a = "Отделение: "+piece(mhutil.FindInCodify(store.GetData("otd"),otd_id),"|",2);
		a = a+"\r\nСпециальность: "+piece(mhutil.FindInCodify(store.GetData("spec"),spec_id),"|",2);
		a = a + "\r\n\r\nДля изменения перейдите в режим поиска пациентов.";
		mhist_info(a,"Информация о сотруднике");
		return;
	}
	a = "mhuinf.frm";
	if( mhist_cfg.selvr == 1 ) a = "mhinfsel.frm";
	main.CreateForm(a,0-2,1);
	mhist.vr_label.Hint = "Врач:\r\n"+piece(mhutil.FindInCodify(store.GetData("spec"),spec_id),"|",2);
}

event mhist_bt_serv_list_link(a,b)
{
	main.CreateHForm("tth.frm");
	store.Set("env","pac",pid);
	store.Set("env","pacfio",mhist_pac_fio);
	main.CreateForm("tth.frm",0-2,1);
}

event mhist_infos_link(a,b)
{
	a = mhist_cfg.uinfo_prg;
	b = trim(mhist.inf.i("pac_dog"));
	if( a == "" ) a = "DOGTXT^NFNPAC";
	main.NetProc(a,pid,"",b,trim(mhist.inf.i("selprog")),trim(mhist.inf.i("sdate")));
}

event mhist_infot_link(a,b)
{
	b = trim(mhist.inf.i("pac_dog"));
	main.NetProc("DOGTXT^NFNPAC",pid,"",b,trim(mhist.inf.i("selprog")),trim(mhist.inf.i("sdate")));
}

event mhist_serv_nz_open(a,b)
{
	var tt, st;
	tt = Create("tooth");
	st = trim(store.GetData("stof"));
	if( strlen(st) > 0 ) tt.states = st;
	tt.absent = main.NetFunc("DETOOTH^NSTOMEPR",pid);
	if( b == 1 ){ tt.child = 0; }
	if( b == 2 ){ tt.child = 1; }
	tt.half = ttrans(trim(mhist.serv_nz.data),"/;: ",",,,");
	if( tt.Exec(0) == 0 ){
		Delete(tt);
		return;
	}
	mhist.serv_nz.data = tt.half;
	Delete(tt);
}

event mhist_serv_nz_link(a,b)
{
	a = mhdate.Age(mhist.inf.i("pac_born"),date());
	if( a > 14 ) {
		mhist_serv_nz_open(0,1);
		return;
	}
	mhist.PopupMenu("servnz");
}

event mhist_serv_nz_adult(a,b)
{
	mhist_serv_nz_open(0,1);
}

event mhist_serv_nz_child(a,b)
{
	mhist_serv_nz_open(0,2);
}

event mhist_serv_nz_onlabel(a,b)
{
	var c = mhist.serv_nz;
	if( c.userdata == 2 ) return;
	a = "Yellow";
	b = 1;
	if( c.userdata == 1 ){
		a = "White";
		b = 0;
	}
	c.Color = a;
	c.UserData = b;
}

event mhist_serv_count_onlabel(a,b)
{
	var c = mhist.serv_count;
	a = "Yellow";
	b = 1;
	if( c.userdata == 1 ){
		a = "White";
		b = 0;
	}
	c.Color = a;
	c.UserData = b;
}

event mhist_serv_diag_onlabel(a,b)
{
	var c = mhist.serv_diag;
	a = "Yellow";
	b = 1;
	if( c.userdata == 1 ){
		a = "White";
		b = 0;
	}
	c.Color = a;
	c.UserData = b;
}

event mhist_insert_teeth(a,b)
{
	var tt,st;
	tt = Create("tooth");
	st = trim(store.GetData("stof"));
	if( strlen(st) > 0 ) tt.states = st;
	if( tt.Exec(1) == 0 ){
		Delete(tt);
		return;
	}
	a = tt.half;
	mhist.serv_nz.data = a;
	if( b != 9 ){
		mhist.erpt.PasteClipboard();
	}
	if( b == 9 ){
		mhist.erpt.InsertSelected(a);
	}
	Delete(tt);
}

event mhist_insert_serv(a,b)
{
	a = main.NetFunc("PKVT^YNED",pid,vr_id,otd_id,spec_id,trim(mhist.inf.i("sdate")),1);
	mhist_coder_e_add_sp(a,0);
}

event mhist_inf_link(a,b)
{
	var prg, nm, id, tp;
	nm = piece(b,"|",1);
	prg = piece(b,"|",2);
	if( nm == "pac_dog" ){
		main.NetProc("LDGNCNG^YIMHP",mhist.pac_id.data,mhist.inf.i("pac_dog"),trim(mhist.inf.i("sdate")));
		return;
	}
	if( prg == "" ) return;
	id = piece(b,"|",3);
	if( nm == "pac_prog" ){
		tp = mhist_cfg.prog_type;
		b = main.NetFunc(prg,mhist.inf.i("pac_dog"),id);
		if( b == "" ) return;
		if( tp == "htm" ){
			main.CreateHForm("kwhtml.frm");
			a = main.kwhtml;
			a.label.data = "Информация по программе";
			store.SetData("kwhtml",b);
			main.CreateForm("kwhtml.frm",0-2,1);
		}
		if( tp != "htm" ){	
			main.CreateHForm("ktext.frm");
			a = main.ktext;
			a.label.data = "Информация по программе";
			a.txt.text = b;
			main.CreateForm("ktext.frm",0-2,1);
		}
		return;
	}
	main.NetProc(prg,mhist.pac_id.data,id);
}

event mhist_inf_menu(a,b)
{
	var tp;
	tp = piece(b,"|",2);
	if( tp == "naz" ){
		a = trim(mhist.inf.i("naprlist"));
		if( a == "-" ) a = "";
		if( a == "*" ) a = "";
		if( a == "" ) return;
		store.Set("env","naz",a);
		store.Set("env","nib",trim(mhist.pac_id.data));
		b = trim(mhist.inf.i("pac_f"))+" "+trim(mhist.inf.i("pac_io"));
		store.Set("env","fio",b);
		main.CreateForm("nzitem.frm",0-2,1);
	}
}

event mhist_pac_alert_link(a,b)
{
	if( pid == 0 ) return;
	b = trim(mhist.inf.i("napr"));
	a = trim(main.NetFunc("LSTEV^YIMHP",pid,otd_id,vr_id,spec_id,b,date()));
	if( a == "" ){
		mhist.bt_pac_alert.visible = "no"; // изчезли
		return;
	}
	main.PopupWindow("advancedlist",a,"mhist_pac_alert_list",mhist.bt_pac_alert,0,50);
}

event mhist_pac_alert_list(a,b)
{
	a = main.PopupResult("advancedlist",1);
	b = piece(a,"@",1);
	a = piece(a,"@",2);
	if( b == "" ) return;
	store.SetData("patient",pid);
	store.Set("env","alerts",a);
	main.Execute(b);
}

event mhist_usl_table_help(a,b)
{
	b = mhist.table_usl;
	b.help = "";
	a = b.SelectedCell;
	b = piece(a,":",2);
	a = piece(a,":",1);
	if( (a == 0)||(a == 4)||(a == 5) ) return;
	if( b < 1 ) return;
	mhist.table_usl.help = mhist.table_usl.cell(a,b);
}

event mhist_usllist_help(a,b)
{
	b = mhist.left_tree;
	b.help = b.SelText;
}

event mhist_vdates_link(a,b) {
	var f;
	main.CreateHForm("kseldates.frm");
	f = main.kseldates;
	f.dates.data = mhist.hist_dates.userdata;
	main.CreateForm("kseldates.frm",0-2,1);
	b = f.ModalResult;
	a = f.dates.data;
	if( b != 1 ) a = "";
	if( mhist.hist_dates.userdata == a ) return;
	mhist.hist_dates.userdata = a;
	mhist_dates_header(0,0);
	mhist_hist_vtype_link(0,0);
}

event mhist_vorder_link(a,b) {
	var o;
	o = mhist.hist_order;
	a = o.userdata;
	if( a == 1 ){
		a = 0;
		b = "order16d.bmp";
	}else{
		a = 1;
		b = "order16t.bmp";
	}
	o.userdata = a;
	o.file = b;
	mhist_hist_vtype_link(0,0);
}

event mhist_rdoc_menu(a,b) {
	mhist.r_doc_title.PopupMenu(1);
}

event mhist_import_rtf(a,b) {
	a = disk.OpenDialog("*.rtf;*.txt");
	if( strlen(a) > 0 ){
		mhist.etext.LoadRTF(a);
	}
}

event mhist_cqs(a,b) {
	var cr, d, s;
	cr = Create("crypto");
	d = trim(main.NetFunc("LDVD^YIMH",pid,mhist_view.id,1));
	s = trim(main.NetFunc("GSIGN^YIMH",pid,mhist_view.id,1));
	a = cr.Verify(d,s,1);
	if( a == "CE" ) {mhist_error("Криптопровайдер не найден.",0); a="";}
	if( a == "ER" ) {mhist_error("Ошибка верификации УКЭП.",0); a="";}
	if( a != "OK" ) {mhist_info("Подпись НЕ прошла проверку.",0);}
	Delete(cr);
}

event mhist_vevens(a,b) {
	b = mhist.vinfo.ItemPtXY(piece(b,"|",1));
	a = main.NetFunc("EVLIST^YIMH",pid,mhist_view.id);
	main.PopupWindow("advancedlist",a,"mhist_vevens_proc",piece(b,"|",1),piece(b,"|",2),0,150);
}

event mhist_vevens_proc(a,b) {
	var t;
	a = main.PopupResult("advancedlist",1);
	b = piece(a,"@",1);
	if( b == "" ) return;
	t = main.PopupResult("advancedlist",2);
	t = piece(t,"\t",2);
	a = piece(b,",",3);
	if( a == "U" ){
		if( mhutil.MessageBox("Восстановить документ от "+t+" ?","Внимание","MB_YESNO,MB_ICONWARNING") == "NO" ) return;
		a = main.NetFunc("REDOC^YIMH",pid,mhist_view.id,b);
		if( a != "" ){
			mhist_error(a,"");
			return;
		}
		mhist_hist_view_link(0,0);
		return;
	}
}

event mhist_hist_view_do(a,b) {
	b = mhist.vinfo.ItemPtXY(piece(b,"|",1));
	mhist.PopupMenu("vrpt",piece(b,"|",1),piece(b,"|",2));
}

event mhist_vcomm(a,b) {
	b = mhist.vinfo.ItemPtXY(piece(b,"|",1));
	a = main.NetFunc("COMMLST^YIMH",pid,mhist_view.id);
	main.PopupWindow("advancedlist",a,"mhist_vcomm_set",piece(b,"|",1),piece(b,"|",2),0,150);
}

event mhist_vcomm_set(a,b) {
	a = main.PopupResult("advancedlist",1);
	b = piece(main.PopupResult("advancedlist",2),"\t",3);
	if( a == "" ) b = "";

	b = trim(mhutil.InputBox("","Комментарий к документу",b,1));
	if( strsub(b,1,1) == "0" ) return;
	b = trim(strdel(b,1,1));
	if( b == "" ) return;
	
	main.NetFunc("SETCOMM^YIMH",pid,mhist_view.id,a,b);
	mhist_hist_view_link(0,0);
}

event mhist_vestim(a,b) {
	b = mhist.vinfo.ItemPtXY(piece(b,"|",1));
	a = main.NetFunc("ESTIM^YIMHS");
	main.PopupWindow("list",a,"mhist_estim_set",piece(b,"|",1),piece(b,"|",2),0,150);
}

event mhist_estim_set(a,b) {
	a = main.PopupResult("list",2);
	main.NetFunc("SETEST^YIMH",pid,mhist_view.id,a);
	mhist_hist_view_link(0,0);
}

event mhist_rec_inrtf(a,b) {
	a = disk.OpenDialog("*.rtf;*.txt");
	if( strlen(a) == 0 ) return;

	main.CreateHForm("mhinrtf.frm");
	main.mhinrtf.text.LoadRTF(a);
	main.CreateForm("mhinrtf.frm",0-2);
}

event mhist_serv_fnd(a,b) {
	main.CreateForm("mhufnd.frm",0-2,1);
}

event mhist_serv_dlist(a,b) {
	mhist.servinfo.ItemVis("nallow",1);
	mhist.servinfo.ItemVis("allow",0);
	mhist_upd_price(0,0);
}

event mhist_serv_alist(a,b) {
	mhist.servinfo.ItemVis("nallow",0);
	mhist.servinfo.ItemVis("allow",1);
	mhist_upd_price(0,0);
}

event mhist_serv_sortc(a,b) {
	mhist_cfg.set("servsort",0);
	mhist_upd_price(0,0);
}

event mhist_serv_sortn(a,b) {
	mhist_cfg.set("servsort",1);
	mhist_upd_price(0,0);
}

event mhist_serv_mnu(a,b) {
	mhist.bt_serv_mnu.PopupMenu(1);
}

event mhist_serv_addnaz(a,b) {
	var i, c = mhist.left_tree.count, p;
	for( i = 0 ; i < c ; i++ ){
		p = mhist.left_tree.ItemImg(i);
		if( (p == 4)||(p == 5) ){
			mhist.left_tree.index = i;
			mhist_u_save(0,0);
		}
	}
}

event mhist_bt_pac_epi_link(a,b) {
	a = trim(mhist.pac_id.data);
	if( a == "" ) return;
	b = trim(mhist.inf.i("pac_f"))+" "+trim(mhist.inf.i("pac_io"));
	main.CreateHForm("tth.frm");
	store.Set("env","pac",a);
	store.Set("env","pacfio",b);
	main.CreateForm("tth.frm",0-2,1);
}

event mhist_bt_pac_naz_link(a,b) {
	a = trim(mhist.pac_id.data);
	if( a == "" ) return;
	store.Set("env","pac",a);
	main.CreateForm("nzlist.frm",0-2,1);
}

event mhist_serv_pkss(a,b) {
	b = mhist.servinfo;
	a = b.ItemColor("kss");
	if( a == "White" ){
		a = "yellow";
		b.ItemVis("allow",0);
		b.ItemVis("nallow",0);
		b.ItemTag("kss",1);
	}
	else{
		b.ItemVis("allow",0);
		b.ItemVis("nallow",1);
		b.ItemTag("kss",0);
		a = "white";
	}
	b.ItemColor("kss",a);
	mhist_upd_price(0,0);
}

event mhist_bt_serv_infos_link(a,b) {
	mhist.HideMenuItem("rec_inf","epi",1);
	mhist.bt_serv_infos.PopupMenu(1);
}

event mhist_bt_rec_inform_link(a,b) {
	mhist.HideMenuItem("rec_inf","epi",0);	
	mhist.bt_rec_inform.PopupMenu(1);
}

event mhist_rec_diaglst(a,b) {
	store.Set("env","pac",pid);
	main.CreateForm("pacdiag.frm",0-2,1);
}

event mhist_rec_nazlst(a,b) {
	store.Set("env","pac",pid);
	main.CreateForm("nzlist.frm",0-2,1);
}

event mhist_rec_nazstom(a,b) {
	store.Set("env","pac",pid);
	main.CreateForm("nzstom.frm",0-2,1);
}

event mhist_rec_viewepr(a,b) {
	store.Set("env","pac",string(pid));
	main.CreateForm("eprhtml.frm",0-2,1);
}

event mhist_rec_changedoc(a,b) {
	mhist.erpt.EditorProc = "mhist_rec_change_proc";
	mhist.erpt.RunEditor();
}

event mhist_rec_change_proc(a,b) {
	var lst, i, c, str, f, r;
	a = mhist_docs.obj.tp;
	if( a == "" ) return;
	lst = Create("strings");
	r = mhist.erpt;
	lst.Text = r.FieldsList(0,0,0);
	str = "<?xml version=\"1.0\" encoding=\"Windows-1251\"?><nb_console><mdfield><id>"+a+"</id><table>ID";
	c = lst.Count;
	for( i = 0 ; i < c ; i++ ){
		f = piece(lst.string(i),"|",1);
		str += "\r\n";
		str += string(i+1)+"|";
		str += r.FieldProp(f,"nm")+"|";
		str += r.FieldProp(f,"tit")+"|";
		str += r.FieldProp(f,"tp")+"|";
		str += r.FieldProp(f,"src")+"|";
		str += r.FieldProp(f,"lst")+"|";
		str += r.FieldProp(f,"br")+"|";
		str += r.FieldProp(f,"ro")+"|";
		str += r.FieldProp(f,"sw")+"|";
		str += r.FieldProp(f,"sv")+"|";
		str += r.FieldProp(f,"nn")+"|";
		str += r.FieldProp(f,"w")+"|";
		str += r.FieldProp(f,"h")+"|";
		str += r.FieldProp(f,"mode")+"|";
		str += r.FieldProp(f,"rows")+"|";
		str += ttrans(r.FieldProp(f,"cols"),"|","#");
	}
	Delete(lst);
	str += "</table></mdfield></nb_console>";
	main.NetPostData("SRPTGEN^YIMHS",str);
}

event mhist_sptree_popup(a,b) {
	a = mhist.bt_coder_cfg.visible;
	if( a == 1 ) a = 0;
	else a = 1;
	mhist.HideMenuItem("sptreetop","crd",a);
	mhist.HideMenuItem("sptreetop","crdln",a);
	a = 0;
	b = mhist_docs.obj;
	if( b == 0 ) return;
	if( b.Count() == 0 ) return;
	if( b.fill_id == "" ) a = 1;
	mhist.HideMenuItem("sptreetop","pat",a);
}

event mhist_coder_select(a,b) {
	b = mhist_docs.obj.tp;
	main.NetProc("LRPTLI^YIMH",b,a,vr_id,pid);
	mhist.erpt.RefreshFieldList();
	mhist_erpt_list(0,0);
}

event mhist_coder_common(a,b) {
	mhist_coder_select(0,0);
}

event mhist_coder_private(a,b) {
	mhist_coder_select(1,0);
	if( mhist.erpt.GetListTag() == "" ){
		message_alert("Личный справочник отсутствует.",0);
	}
}

event mhist_coder_pattern(a,b) {
	b = mhist_docs.obj.fill_id;
	mhist_coder_select("2@"+b,0);
}

event mhist_nazpatt(a,b) {
	store.Set("env","pac",pid);
	store.Set("env","cmd","nzlist_btn_add_link");
	main.CreateForm("nzlist.frm",0-2,1);
//	main.CreateForm("newnaz.frm",0-2,1);
	if( main.ReportExists("newnaz") == 1 ) {return;}
	if( mhist_cur_format == "rpt" ){
		a = main.report("newnaz").lst.data;
		if( a == "" ) {return;}
		str = "Назначен курс: "+trim(a);
		mhist.erpt.AddSelected(str);
	}
}

event mhist_vrpt_subscr(a,b) {
	if( a != "w" ){
		if( mhutil.MessageBox("Подписать документ ?","Внимание","MB_YESNO,MB_ICONWARNING") == "NO" ) return;
		b = "";
	}
	a = trim(main.NetFunc("SBSC^YIMH",pid,mhist_view.id,0,"",b));
	if( strsub(a,1,1) == "@" ) {
		mhist.exchange.data = piece(a,"@",3);
		a = piece(a,"@",2);
		main.CreateForm(a+".frm",0-2,1);
		return;
	}
	if( a != "" ){
		mhist_infostop(a,0);
		return;
	}
	mhist_hist_view_link(0,0);
	mhist_hist_vtype_link(0,0);
}

event mhist_vrpt_subscrw(a,b) {
	main.CreateHForm("vrfind.frm");
	a = main.report("vrfind");
	a.label.Title = "Выбор сотрудника, подписавшего документ";
	main.CreateForm("vrfind.frm",0-2,1);
	if( a.ModalResult != 1 ) return;
	b = cur_vr;
	mhist_vrpt_subscr("w",b);
}

event mhist_vrpt_unsubscr(a,b) {
	var id, str;
	id = mhist_view.id;
	str = mhist_cfg.unsbs;
	a = main.NetFunc("CHKUSBS^YIMH",pid,id);
	if( strsub(a,1,1) == "!" ){
		mhist_infostop(strsub(a,2,999),0);
		return;
	}
	a = int(a);
	if( (a != 1)&&(strpos(str,"task") > 0) ){
		store.Set("env","pac",pid);
		store.Set("env","title","снятие подписи документа");
		store.Set("env","uid","med/epr-cng");
		store.Set("env","key",id);
		main.CreateForm("mkmtask.frm",0-2,1);
		return;
	}
	if( (a != 1)&&(strpos(str,"allow") == 0) ){
		mhist_infostop("Невозможно убрать подпись. Нет прав.",0);
	}

	if( mhutil.MessageBox("Убрать подпись у документа ?","Внимание","MB_YESNO,MB_ICONWARNING") == "NO" ) return;
	a = trim(main.NetFunc("UNSBSC^YIMH",pid,id,0,""));
	if( a != "" ){
		mhist_infostop(a,0);
		return;
	}
	mhist_hist_view_link(0,0);
	mhist_hist_vtype_link(0,0);
}

event mhist_vrpt_popup(a,b) {
	a = 0;
	b = 1;
	if( int(mhist_view.subscr) != 0 ){
		a = 1;
		b = 0;
	}
	mhist.HideMenuItem("vrpt","sbs",a);
	mhist.HideMenuItem("vrpt","del",a);
	mhist.HideMenuItem("vrpt","usb",b);
	if( mhist_cfg.selsbs != 2 ) a = 1;
	mhist.HideMenuItem("vrpt","sbsw",a);
	a = 1;
	if( mhist_cfg.epradm > 0 ) a = 0;
	mhist.HideMenuItem("vrpt","adm",a);
	a = 1;
	if( mhist_cfg.dochtml == 1 ) a = 0;
	mhist.HideMenuItem("vrpt","htm",a);

	a = 1;
	if(mhist_view.ext == "rpt") a = 0;
	mhist.HideMenuItem("vrpt","htm",a);
	mhist.HideMenuItem("vrpt","cng",a);

	mhist.HideMenuItem("vrpt","cpyc",a);
	mhist.HideMenuItem("vrpt","mk",a);

	if( mhist.rec_docs.data == "" ) a = 1; // not created
	mhist.HideMenuItem("vrpt","cpy",a);
}

event mhist_normo_doc(a,b) {
	main.CreateForm("vdoclt.frm",0-2,1);
}

event mhist_servmenu(a,b) {
	var f,k,dt,tt,ff,st;
	k = mhist.table_usl.key;
	if( k == "" ){
		mhist_alert("Услуга не выбрана !",0);
		return;
	}
	dt = trim(mhist.inf.i("sdate"));
	if( b == "menu" ){
		f = main.NetFunc("GETINF^YNED",vr_id,otd_id,spec_id,dt,pid,k);
		if( f == "" ) return;
		main.CreateHForm("khtml.frm");
		a = main.khtml;
		a.label.data = "Подробная информация по услуге";
		store.SetData("khtml",f);
		main.CreateForm("khtml.frm",0-2,1);
		return;
	}
	if( b == "chku" ){
		main.NetProc("CHKED^NDMS",pid,vr_id,otd_id,spec_id,dt);
		main.NetProc("RRH^YNED",pid,vr_id,otd_id,spec_id,dt);
		return;
	}
	if( b == "czub" ){
		f = main.NetFunc("GNZUB^YNED",vr_id,otd_id,spec_id,dt,pid,k);
		if( f == "!" ) {
			mhist_error("Изменение № зуба невозможно.",0);
			return;
		}
		tt = Create("tooth");
		st = trim(store.GetData("stof"));
		if( strlen(st) > 0 ) tt.states = st;
		tt.half = ttrans(f,"/",",");
		if( tt.Exec(0) == 0 ) {
			Delete(tt);
			return;
		}
		f = ttrans(tt.half,",;\ ","///");
		Delete(tt);
		b = main.NetFunc("SNZUB^YNED",vr_id,otd_id,spec_id,dt,pid,k,f);
		if( strpos(b,"xml") == 0 )
			{ mhist_error(b,0); }
		return;
	}
	if( b == "skd" ){
		main.CreateForm("mhiskd.frm",0-2,1);
		return;
	}
	if( b == "lab" ){
		main.CreateForm("mhlabz.frm",0-2,1);
		return;
	}
	if( b != "matt" ) return;

	f = main.NetFunc("GMATT^YNED",vr_id,otd_id,spec_id,dt,pid,k);

	a = strsub(f,1,1);
	if( a == "@" ){
		store.Set("env","data",piece(f,"@",3));
		store.Set("env","date",dt);
		store.Set("env","id",k);
		store.Set("env","vr",vr_id);
		store.Set("env","ot",otd_id);
		store.Set("env","sp",spec_id);
		store.Set("env","pid",pid);
		f = piece(f,"@",2);
		main.CreateForm(f+".frm",0-2,1);
	}
}

event mhist_insert_teeth_plan(a,b) {
	main.CreateForm("stofcalc.frm",0-2,1);
}

event mhist_serv_info(a,b) {
	a = trim(mhist.left_tree.selected());
	b = trim(mhist.inf.i("sdate"));	
	b = trim(main.NetFunc("DUSLH^NFNPAC",pid,a,trim(mhist.inf.i("pac_dog")),b,trim(mhist.inf.i("selprog"))));
	if( b == "" ){
		mhist_alert("Особых условий не найдено.",0);
		return;
	}
	main.CreateHForm("ktable.frm");
	main.ktable.label.data = "Условия по услуге";
	main.ktable.table.text = b;
	main.CreateForm("ktable.frm",0-2,1);
}

event mhist_serv_dinf(a,b) {
	a = trim(mhist.left_tree.selected());
	b = trim(mhist.inf.i("sdate"));
	b = trim(main.NetFunc("SERVHTML^YNEDU",pid,piece(a,"@",1),a,trim(mhist.inf.i("pac_dog")),otd_id,vr_id,b,spec_id));
	if( b == "" ) return;
	main.CreateHForm("khtml.frm");
	a = main.khtml;
	a.label.data = "Информация по услуге";
	store.SetData("khtml",b);
	main.CreateForm("khtml.frm",0-2,1);
}

event mhist_serv_naz(a,b)
{
}

event mhist_vrpt_mouse(a,b) {
	var tp,nm,id,x,y;
	a = mhist.vrpt.vmousedata;
	b = piece(a,"|",5);
	if( b != "r" ) return; // прав. кн.
	nm = piece(a,"|",1);
	id = piece(a,"|",2);
	x = piece(a,"|",3);
	y = piece(a,"|",4);
	tp = int(mhist.vrpt.FieldIsGraphics(nm,id));
	a = 1;
	if( tp == 1 ) a = 0;
	mhist.HideMenuItem("vrptc","cpu",tp);
	mhist.HideMenuItem("vrptc","img",a);
	mhist.HideMenuItem("vrptc","imgp",a);
	if( mhist_cfg.docclipb != 1 ) tp = 1;
	mhist.HideMenuItem("vrptc","wcpu",tp);
	mhist.PopupMenu("vrptc",x,y);
}

event mhist_vrpt_tcpu(a,b) {
	var t;
        main.CreateForm("mhclip.frm",0-2);
	a = piece(mhist.vrpt.vmousedata,"|",1);
	b = mhist.r_doc_title.data+": "+mhist.vrpt.ItemTitle(a);
	t = mhist.vrpt.GetItem(a);
	mhist_clbrd.Set(b,t);
	main.Execute("mhclip_lst_fill(0,0);");
}

event mhist_vrpt_wcpu(a,b) {
	a = piece(mhist.vrpt.vmousedata,"|",1);
	b = trim(mhist.vrpt.GetItem(a));
	if( b == "" ) return;
	SetClipboard(b);
	mhist_info("Текст скопирован в буфер обмена системы.","");
}

event mhist_vrpt_cimg(a,b) {
	var tp,nm,id,x,y,f;
	a = mhist.vrpt.vmousedata;
	nm = piece(a,"|",1);
	id = piece(a,"|",2);
	a = "file:"+tpath + "tmp.bmp";
	mhist.vrpt.SaveGraphics(nm,a,id);
	b = mhist_view.name+", "+mhist_pac_fio;

	main.CreateHForm("mhimgcol.frm");
	f = main.report("mhimgcol");
	f.xfil.data = a;
	f.xname.data = b;
	main.CreateForm("mhimgcol.frm",0-2,1);
}

event mhist_vrpt_img_prn(a,b) {
	var tp,nm,id,x,y,f;
	a = mhist.vrpt.vmousedata;
	nm = piece(a,"|",1);
	id = piece(a,"|",2);
	a = "file:"+tpath + "tmp.bmp";
	mhist.vrpt.SaveGraphics(nm,a,id);

	rptgen.LoadPattern("rpt-img.xml");
	rptgen.LoadGraphics("img",a);
	rptgen.SetItem("title",mhist_view.realname);
	rptgen.SetItem("ehruid",mhist_view.ehruid);
	rptgen.PrintDialog(0,0,1);
}

event mhist_pac_label_link(a,b) {
	if( pid == 0 ) return;
	a = mhist.inf;
	b = main.NetFunc("PACHTML^YNEDU",pid,trim(a.i("pac_dog")),trim(a.i("sdate")),trim(a.i("selprg")));
	main.CreateHForm("khtml.frm");
	a = main.khtml;
	a.label.data = "Подробная информация по пациенту";
	store.SetData("khtml",b);
	main.CreateForm("khtml.frm",0-2,1);
}

event mhist_rinf_popup(a,b) {
	a = trim(mhist.inf.ItemData("pac_grnl"));
	b = 0;
	if( a == "" ) b = 1;
	mhist.HideMenuItem("rec_inf","grn",b);
	if(int(mhist_cfg.progdsc)==0) mhist.HideMenuItem("rec_inf","dsc",1);

	b = 1;
	if( mhist.inf.ItemData("nokss") == 1 ) b = 0;
	mhist.HideMenuItem("rec_inf","cnks",b);

	b = 1;
	if( mhist_cfg.stom == "1" ) b = 0;
	mhist.HideMenuItem("rec_inf","zlab",b);
	mhist.HideMenuItem("rec_inf","nzlist",b);
}

event mhist_grnl_link(a,b) {
	a = ttrans(trim(mhist.inf.ItemData("pac_grnl")),"\r\n","|");
	b = main.NetFunc("GETINF^NGRNL",a);
	if( b == "" ) return;
	main.CreateHForm("khtml.frm");
	a = main.khtml;
	a.label.data = "Информация по гарантийным письмам";
	store.SetData("khtml",b);
	main.CreateForm("khtml.frm",0-2,1);	
}

event mhist_stof_link(a,b) {
	if( store.Exists("toothdestr") == 0 ){
		store.New("toothdestr","plain","");
		store.SetData("toothdestr",main.NetFunc("NMLST^NSPRAV","toothdestr"));
	}
	b = trim(store.GetData("toothdestr"));
	mhist.erpt.SourceData = "";
	main.CreateHForm("sellst.frm");
	a = main.sellst;
	a.lst.Style = 2;
	a.lst.Text = b;
	a.l_doc_title.data = "Степень разрушения";
	main.CreateForm("sellst.frm",0-2,1);
	if( a.ModalResult != 1 ) return;
	mhist.erpt.SourceData = a.lst.data;
}

event mhist_rec_mnu(a,b) {
	mhist.bt_rec_mnu.PopupMenu(1);
}

event mhist_doc_m_cname(a,b) {
	var nm;
	a = mhist.l_doc_title;
	nm = trim(mhutil.InputBox("","Изменить имя документа",a.title,1));
	if( strsub(nm,1,1) == "0" ) return;
	nm = trim(strdel(nm,1,1));

	mhist_docs.obj.set("name",nm);
	a.title = nm;
	a.Hint = nm;

	if( mhist_cur_format != "rpt" ) return;
	mhist.erpt.ReportName = nm;
}

event mhist_doc_m_lru(a,b) {
	mhist_docs.obj.set("lang","ru");
	if( mhist_cur_format != "rpt" ) return;
	a =  mhist_docs.obj.get("name");
	a = a+" (ru)";
	mhist.l_doc_title.title = a;
}

event mhist_doc_m_len(a,b) {
	mhist_docs.obj.set("lang","en");
	if( mhist_cur_format != "rpt" ) return;
	a =  mhist_docs.obj.get("name");
	a = a+" (en)";
	mhist.l_doc_title.title = a;
}

event mhist_doc_m_sp(a,b) {
	mhist_bt_rec_subscr_link(0,0);
	mhist_bt_rec_print_link(0,0);
}

event mhist_img_dir_load(a,b) {
	b = string(mhist.erpt.GetItemPieces());
	b = string(mhist_docs.obj.unique)+"-"+b+".jpg";
	mhist.erpt.LoadGraphics("",a,"",b); // to current item
}

event mhist_img_dir(a,b) {
	var dir,i,c,lst,fil;
	if( b == 0 ) b = "bmp";
	dir = ttrans(a,"/","\\");
	lst = Create("strings");
	lst.Text = disk.Dirs(dir+"\\*."+b);
	c = lst.Count;
	for( i = 0 ; i < c ; i++ ){
		fil = lst.string(i);
		fil = dir+"\\"+fil;
		mhist_img_dir_load(fil,0);
		disk.DelFile(fil);
	}
	Delete(lst);
}

// ---- last section ----

event mhistCreate(a,b)
{
	mhist_const_wfnd_tab = "№ И.Б.:800;Фамилия:2000;Имя:1500;Отчество:1500;Договор:2300;Время,дата:1500";

	var i, erpt;
	pid = 0;
	mhist_lang="";
	mhist_pac_fio = "";
	mhist_mode = 1;
	mhist_vm = 0;
	mhist_cur_format = "";
	mhist_cur_store = "";
	mhist_diagt = "";
	mhutil = utility;
	mhdate = dateutl;
	mhist_docs = Create("objectlist");
        mhist_view = Create("values");
	mhist_clbrd = Create("values");
	mhist_cfg = Create("values");
	mhist_incopy = Create("values");
	mhist_vstk = Create("strings");
	mhist.vr_label.title = string(vr_id)+" "+string(vr_fio);
	mhist.vr_label.Hint = "Врач:\r\n"+piece(mhutil.FindInCodify(store.GetData("spec"),spec_id),"|",2);

	mhist.bt_pac_date.title = date();

        mhist_cfg.CatchXML("nb_console/mhist/cfg");
	main.NetProc("INIT^YIMH");
        mhist_cfg.DiscardXML();

	a = mhist_cfg.findtype;
	if( a == "" ) a = 1;
	mhist_cfg.set("findtypevar",a);
	mhist.bt_pac_fnd.UserData = a; // def. find type
	mhist.pac_label.data = "";
	mhist.pac_fndtxt.SetFocus();
	mhist.inf.SelColor = "Yellow";
	mhist.inf.ContextMenu = "mhist_inf_menu";

	erpt = mhist.erpt;
	erpt.UseXmlHeader = "no";
        erpt.SourceProc = "mhist_erpt_src";
	a = int(main.UserConfigData("mhist.erpt.font"));
	if( a > 0 ) erpt.ItemsFont = a;
        mhist.vrpt.SourceProc = "mhist_vrpt_src";
	mhist.vrpt.VMouseProc = "mhist_vrpt_mouse";
	mhist.vrpt.ManualName = 1;

        erpt.ListProc = "mhist_erpt_list";
	erpt.StofProc = "mhist_stof_link";
	erpt.UseSubscribe = "yes";
	erpt.PrintBkSize = 44;
	erpt.ManualName = 1;

	mhist.etext.PageBorderLeft = 10;
	mhist.etext.PageBorderTop = 10;
	mhist.vtext.PageBorderLeft = 10;
	mhist.vtext.PageBorderTop = 10;

	mhist.coder_tree.WantTab = "yes";
	mhist.vinfo.BorderColor = "White";

	if( int(mhist_cfg.findotd) != 1 )
		mhist.HideMenuItem("wfnd","v5",1);

	if( int(mhist_cfg.finduser) != 1 )
		mhist.HideMenuItem("wfnd","uf",1);

	a = int(mhist_cfg.viewsort);
	mhist.hist_order.userdata = a;
	if( a == 1 ) mhist.hist_order.file = "order16t.bmp";

	a = int(mhist_cfg.servperm);
	i = mhist.servinfo;
	i.BorderColor = "White";
	i.Add("addnaz","Добавить назначенные","href",0,0,2);
	i.Add("allow","Разрешенные услуги","href",0,a,2);
	if( a == 0 ) a = 1;
	else a = 0;
	i.Add("nallow","Все услуги","href",0,a,2);
	i.Add("kss","По кассе","href",0,0,2);
	i.Add("fnd","Найти","href",0,1,1);
	i.ItemHref("kss","mhist_serv_pkss");
	i.ItemHref("fnd","mhist_serv_fnd");
	i.ItemHref("nallow","mhist_serv_alist");
	i.ItemHref("allow","mhist_serv_dlist");
	i.ItemHref("addnaz","mhist_serv_addnaz");

	i = mhist.servmenu;
	i.BorderColor = "White";
	i.Add("summ","","",0,0,2);
	i.Add("skd","Скидка","href",0,0,2);
	i.Add("matt","Материалы","href",0,0,2);
	i.Add("czub","№ зуба","href",0,0,2);
	i.Add("lab","Лаборатория","href",0,0,2);
	i.Add("chku","Проверить","href",0,0,2);
	i.Add("menu","Подробно","href",0,0,2);

	if( mhist_cfg.speak > 0 ) open_speech();
}

event mhistDestroy(a,b)
{
	if( mhist_cfg.speak > 0 ) close_speech();
	Delete(mhist_docs);
        Delete(mhist_view);
	Delete(mhist_clbrd);
	Delete(mhist_incopy);
	Delete(mhist_vstk);
	Delete(mhist_cfg);
	main.CloseForm("mhclip");
}

event mhistOpen(a,b)
{
	if( pid != 0 )
		mhist_bt_step_pac_link(0,999);

	mifare_register("mhist_smartcard");
	mhist_pfind_clear(0,0);

	restart_timer(500,"mhist_after_start");

	a = store.GetDel("env","pac");
	if( a == "" ){
		mhist_wfnd_clr(0,0);
		mhist_wfnd_sel(0,0);
		return;
	}
	b = store.GetDel("env","mode");
	mhist.pac_fndtxt.data = a;
	mhist_wfnd_con(0,999); // не присв.
	mhist.bt_pac_fnd.UserData = 99;
	if( b == "v" )
		{ mhist_bt_pac_mview_link(0,0); }
	if( b == "s" )
		{ mhist_bt_pac_sel_stage1(0,0); }
}

event mhist_lek_list(a,b)
{
	a = mhist_cfg.medguide;
	if( a == "" ) {
		main.CreateForm("sdrug.frm",0-2);
		return;
	}
	main.shell(a);
}

event mhist_dsh_free_on(a,b) {
	main.NetProc("SETDSHF^YIMHP",otd_id,vr_id,spec_id,trim(mhist.inf.i("sdate")),1);
	mhist.shape_doc.BColor = "$8CD5AD";
}

event mhist_dsh_free_off(a,b) {
	main.NetProc("SETDSHF^YIMHP",otd_id,vr_id,spec_id,trim(mhist.inf.i("sdate")),0);
	mhist.shape_doc.BColor = "$D5AD8C";
}

event mhist_view_lru(a,b) {
	mhist_lang = "ru";
	mhist_hist_view_link(0,0);
}

event mhist_view_len(a,b) {
	mhist_lang = "en";
	mhist_hist_view_link(0,0);
}

event mhist_serv_sogl(a,b) {
	var c;
	a = trim(mhist.left_tree.selected());
	b = trim(mhist.inf.i("sdate"));
	c = trim(prompt("Количество услуг","1"));
	if( c == "" ) return;
	a = string(a)+"*"+string(c);
	b = trim(main.NetFunc("ADDAGR^NGRNL",pid,piece(a,"@",1),a,trim(mhist.inf.i("pac_dog")),otd_id,vr_id,b));
	if( strsub(b,1,1) == "=" ) {
		mhist.inf.itemdata("pac_grnl",strsub(b,2,99));
		b = "Добавлена для согласования со страховой компанией.";
	}
	cout(b);
}

event mhist_r_doc_title(a,b) {
	a = trim(trim(mhist.inf.i("pac_f"))+" "+trim(mhist.inf.i("pac_io")));
	if( a == "" ) return;
	SetClipboard(a);
}

event mhist_sel_edit(a,b) {
	mhist_close_rec(0,0);
	mhist_rec_docs_clear(0,0);
	mhist_cur_format = "";
	mhist_cur_store = "";
	mhist_vm = 0;

	pid = 0-1;
	mhist_bt_hist_new_link(0,0);
	pid = 0;
}

event mhist_zlab(a,b) {
	store.Set("env","pac",pid);
	main.CreateForm("ztvorder.frm",0-2,1);
}

event mhist_daycalc(a,b) {
	main.CreateForm("daycalc.frm",0-2,1);
}

event mhist_hosp(a,b) {
	store.Set("env","pac",pid);
	main.CreateForm("lhospin.frm",0-2,1);
}

event mhist_pac_reg_card(a,b){
	main.CreateHForm("mifwrite.frm");
	a = main.report("mifwrite");
	a.regproc.data = "mhist_smartcard"; // register and unregister procedure
	a.regdata.data = "P|"+trim(pid);
	main.CreateForm("mifwrite.frm",0-2,1);
}
