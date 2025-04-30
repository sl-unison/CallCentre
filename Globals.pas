unit Globals;

interface
 uses SysUtils, Variants;

 Const SFT_NAME     = 'Call Centre v3.0.1';
 Const SFT_LOGFILE  = 'CallCentre.Log';

 Const SEC_PATHES   = 'PATHES';
 Const SEC_SETTINGS = 'SETTINGS';

 Const DEF_DBF_PATH = 'DBase\';
 Const DEF_DBB_PATH = 'DBBackup\';
 Const DEF_ARC_PATH = 'Archive\';
 Const DEF_REP_PATH = 'Reports\';

 Const C_DATADIC = 'CallCentre.add';
 Const C_PRGINI  = 'CallCentre.ini';
 Const C_LOCAL   = 'CallCentreL.ini';

 Const C_DBFPATH   = 'DBF_PATH';
 Const C_DBBPATH   = 'DBB_PATH';
 Const C_ARCPATH   = 'ARC_PATH';
 Const C_REPPATH   = 'REP_PATH';
 Const C_REMACCESS = 'REMOTE';

 Const PRO_ADMIN   = 'admin';
 Const SYS_ADMIN   = 'adssys';
 Const USR_CHG_PSW = 100;

 Const GR_ADMINS   = 'ADMINS';
 Const GR_VIEWERS  = 'VIEWERS';
 Const GR_USERS    = 'USERS';

 Const GRANT_SELECT = 1;
 Const GRANT_UPDATE = 2;
 Const GRANT_INSERT = 3;
 Const GRANT_DELETE = 4;

 Const SYS_ADM = 1;
 Const USR_ADM = 2;

 Const RS_INSERT = 1;
 Const RS_EDIT   = 2;

 Const SLOG_ERROR   = 4;
 Const C_ENDLINE = #13#10;

 Const LOG_ERR = 'ERR:';
 Const LOG_INF = 'INF:';

 Const STP_ORGCODE       = 1;  // Код организации
 Const STP_ORGNAME       = 2;  // Название организации
 Const STP_ORGSHNAME     = 3;  // Короткое название организации
 Const STP_CHPOST        = 4;  // Должность председателя организации
 Const STP_CHSURNAME     = 5;  // Председатель: Фамилия
 Const STP_CHFIRSTNAME   = 6;  // Председатель: Имя
 Const STP_CHPATRONYMIC  = 7;  // Председатель: Отчество
 Const STP_CHBOARD       = 8;  // ФИО Председателя коротко
 Const STP_DVPOST        = 9;  // Должность начальника департамента
 Const STP_DVSURNAME     = 10; // Начальник департамента: Фамилия
 Const STP_DVFIRSTNAME   = 11; // Начальник департамента: Имя
 Const STP_DVPATRONYMIC  = 12; // Начальник департамента: Отчество
 Const STP_DVBOARD       = 13; // Ф.И.О. Рук. департамента - коротко
 Const STP_CHACCOUNTANT  = 14; // Главный бухгалтер
 Const STP_ADDRESS       = 15; // Адрес организации
 Const STP_PHONES        = 16; // Телефоны организации
 Const STP_INN           = 17; // ИНН организации
 Const STP_RETRECCOUNT   = 18; // Количество возвращаемых записей
 Const STP_ISARCDBB      = 19; // Архивировать ли бэкап БД?
 Const STP_ISPACKDBASE   = 20; // Упаковать ли БД после закрытия опер. дня?
 Const STP_EMAILHOST     = 21; // Email хост
 Const STP_EMAILPORT     = 22; // Email порт
 Const STP_EMAILUSERNAME = 23; // Email имя пользователя
 Const STP_EMAILPASSWORD = 24; // Email пароль
 Const STP_EMAILFROMADDR = 25; // Email от адреса
 Const STP_EMAILFROMNAME = 26; // Email от имени
 Const STP_EMAILSUBJECT  = 27; // Email тема
 Const STP_EMAILBODY     = 28; // Email тело сообщения по ПИН
 Const STP_EMAILRECCOPY  = 29; // Email адреса для копии
 Const STP_DUTYREPTASKNO = 30; // Номер сообщения по отчету о дежурстве

 Const VT_STRING   = 1; // Информация по клиенту: строковая
 Const VT_INTEGER  = 2; // Информация по клиенту: числовая
 Const VT_NUMERIC  = 3; // Информация по клиенту: числовая
 Const VT_DATE     = 4; // Информация по клиенту: дата и время
 Const VT_TIME     = 5; // Информация по клиенту: дата и время
 Const VT_DATETIME = 6; // Информация по клиенту: дата и время
 Const VT_LOGICAL  = 7; // Информация по клиенту: логическая

 Const TBR_REGIONS      = 'R_REGIONS';
 Const TBR_CALLTEMPLATES= 'R_CALLTEMPLATES';
 Const TBR_REPORTS      = 'R_REPORTS';
 Const TBR_USERS        = 'R_USERS';
 Const TBR_SETUPS       = 'R_SETUPS';
 Const TBR_CALLTYPES    = 'R_CALLTYPES';
 Const TBS_CALLES       = 'S_CALLES';

 Type 
     TSetup = Record
        IsAdmin    : Boolean;
        IsViewer   : Boolean;
        IsUser     : Boolean;

        IsProAdmin   : Boolean; // Администратор программы
        IsSysAdmin   : Boolean; // Администратор системы

        RecAmount  : Integer;

        AppPath    : String;
        DbfPath    : String;
        DbbPath    : String;
        ArcPath    : String;
        RepPath    : String;

        OrgCode    : Integer;
        OrgName    : String;
        Address    : String;
        Phones     : String;
        ChiefPost  : String;
        ChiefBoard : String;     // ФИО Председателя: коротко
        HeadPost   : String;
        HeadDepart : String;     // ФИО Начальника управления: коротко
        DutyRepTaskNo : Integer;

        IsCallAdd     : Boolean;
        IsCallEdit    : Boolean;
        IsCallDelete  : Boolean;
        IsCallExcel   : Boolean;
        IsReports     : Boolean;

        IsArcDbb      : Boolean;
        IsPackDb      : Boolean;
        RemoteAccess  : Boolean;

        EmailHost     : String;
        EmailPort     : Integer;
        EmailUserName : String;
        EmailPassword : String;
        EmailFromAddr : String;
        EmailFromName : String;
        EmailSubject  : String;
        EmailBody     : String;
        EmailRecCopy  : String;
     end;

     TUAccess = Record
       IsAccess : Boolean;
       IsAdd    : Boolean;
       IsEdit   : Boolean;
       IsDelete : Boolean;
     end;

     TTaskRec = Record
       SysTime : TDateTime;
       SysUser : String;
       CallTime: TDateTime;
       CallType: Integer;
       CallRegion: Integer;
       CallPhone : String;
       CallNote  : String;
       CallAnswer: String;
       CallFile  : String;
       EmailTo   : String;
       EMailCopy : String;
     end;

 var glSetup : TSetup;
     glFmt: TFormatSettings;

implementation

end.
