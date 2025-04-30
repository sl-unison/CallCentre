unit DBDatas;

interface

uses
  SysUtils, Classes, DB, adsdata, adsfunc, adstable, adscnnct, Dialogs, Globals,
  Forms, Variants, Math, AbZipper, IdSMTP, IdMessage, IdAttachmentFile, adsset;

type
  TDMain = class(TDataModule)
    AdsCn: TAdsConnection;
    tbAccess: TAdsQuery;
    tbAccessGrantee: TAdsStringField;
    tbAccessFldName2: TAdsStringField;
    tbAccessComment: TMemoField;
    tbAccessSelectName: TAdsStringField;
    tbAccessUpdateName: TAdsStringField;
    tbAccessInsertName: TAdsStringField;
    tbAccessDeleteName: TAdsStringField;
    srAccess: TDataSource;
    tbUGroups: TAdsQuery;
    srUGroups: TDataSource;
    tbSysTables: TAdsQuery;
    srSysTables: TDataSource;
    srRegions: TDataSource;
    tbRegions: TAdsQuery;
    tbRegionsCode: TIntegerField;
    tbCallTypes: TAdsQuery;
    srCallTypes: TDataSource;
    tbCallTypesCode: TIntegerField;
    tbCallTemplates: TAdsQuery;
    srCallTemplates: TDataSource;
    tbCallTemplatesCode: TIntegerField;
    tbCallTemplatesCallType: TIntegerField;
    tbRegionsName: TWideStringField;
    tbCallTypesName: TWideStringField;
    tbCallTemplatesCallTypeName: TWideStringField;
    tbCallTemplatesCallAnswer: TWideStringField;
    tbCallTemplatesCallNote: TWideStringField;
    tbUGroupsRUser: TWideStringField;
    tbUGroupsRGroup: TWideStringField;
    tbUGroupsRGroupName: TWideStringField;
    tbSysTablesName: TWideStringField;
    tbSysTablesComment: TWideStringField;
    tbCallTypesEMailTo: TWideMemoField;
    tbCallTypesEMailCopy: TWideMemoField;
    tbCallTypesIsEMailSend: TBooleanField;
    procedure LogOut;
    procedure AdsCnAfterConnect(Sender: TObject);
    procedure AdsCnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function uf_LPad(S: String; Len: Integer; Ch: String = ' '): String;
function uf_RPad(S: String; Len: Integer; Ch: String = ' '): String;
function SqlInsert(TableName : string;
                   ColNames : array of string;
                   Values : array of string): string;
function SqlUpdate(TableName : string;
                   ColNames : array of string;
                   Values : array of string;
                   WhereClause : string) : string;
function uf_VarToStr(AVar: Variant; IsEmptyNull: Boolean = False): String;
function uf_DateToStr(V: Variant; Fmt: String = 'YYYY-MM-DD'; IsQuoted: Boolean = True): String;
function uf_GetRRowID(tbName: String): Integer;
function WriteToLog(ProcName, Desc: String; SErr: String = ''; SCmd: String = ''): Boolean;
function uf_ErrorToLog(ALogNote: String; E: Exception; ACmd: String = ''): String;
function uf_WriteToLog(ALogNote: String; AErr: array of String): String;

function uf_GetAccessTypes(TblName: String; var R: TUAccess): Boolean;
function uf_ArcDBBackup(): String;
function uf_PackDatas(): Variant;
function uf_SendInfoByEMail(ARegNo: Integer): Boolean;
procedure uf_CreateBackup();
procedure uf_GetSetups();

var
  DMain: TDMain;

implementation

uses ULogToFile;

{$R *.dfm}

function uf_LPad( S: String; Len: Integer; Ch: String = ' '): String;
begin
  S := Trim(S);
  While (Length( S ) < Len) do
     S := Ch + S;
  Result := S;
end;

function uf_RPad( S: String; Len: Integer; Ch: String = ' ' ): String;
begin
  S := Trim(S);
  While ( Length( S ) < Len ) do
     S := S + Ch;
  Result := S;
end;

function SqlInsert(TableName : string;
                   ColNames : array of string;
                   Values : array of string): string;
var RetVar, V : string;
   i : integer;
begin
   RetVar := 'Insert into ' + TableName +
              '(' + ColNames[0];
   for i := 1 to High(ColNames) do
       RetVar := RetVar + ',' + ColNames[i];

   RetVar := RetVar + ')';
   V := Values[0];
   if (Trim(V) = QuotedStr('')) or (Trim(V) = '') then V := 'Null';
   RetVar := RetVar + ' Values ('+V;
   for i := 1 to High(Values) do begin
       V := Values[i];
       if (Trim(V) = QuotedStr('')) or (Trim(V) = '') then V := 'Null';
       RetVar := RetVar + ',' + V;
   end;
   RetVar := RetVar + ')';
   if High(Values) < High(ColNames) then
      ShowMessage('SQL Insert - Not enough values.');
   if High(Values) > High(ColNames) then
      ShowMessage('SQL Insert - Too many values.');
   Result := RetVar;
end;

function SqlUpdate(TableName : string;
                   ColNames : array of string;
                   Values : array of string;
                   WhereClause : string) : string;
var RetVar, V: String;
   i : integer;
begin
   RetVar := 'Update ' + TableName + ' Set ';
   for i := 0 to Min(High(Values),High(ColNames)) do
   begin
      V := Values[i];
      if (Trim(V) = QuotedStr('')) or (Trim(V) = '') then V := 'Null';
      RetVar := RetVar + ColNames[i] + '=' + V + ',';
   end;
   Delete(RetVar,Length(RetVar),1);
   RetVar := RetVar + ' Where ' + WhereClause;
   if High(Values) < High(ColNames) then
       ShowMessage('SQL Update - Not enough values.');
   if High(Values) > High(ColNames) then
       ShowMessage('SQL Update - Too many values.');
   Result := RetVar;
end;

function uf_VarToStr(AVar: Variant; IsEmptyNull: Boolean = False): String;
var S: String;
begin
  case VarType(AVar) of
    varString    : S := VarToStr(AVar);
    varInteger,
    varSmallint,
    varShortInt,
    varByte,
    varWord,
    varLongWord,
    varUInt64,
    varInt64     : S := VarToStr(AVar);
    varSingle,
    varDouble    : S := FloatToStr(AVar, glFmt);
    varCurrency  : S := CurrToStr(AVar, glFmt);
  else
    S := VarToStr(AVar);
  end;
  if (IsEmptyNull) and (Trim(S) = '') then S := 'NULL';
  Result := S;
end;

function uf_DateToStr(V: Variant; Fmt: String = 'YYYY-MM-DD'; IsQuoted: Boolean = True): String;
var R: String;
begin
  if V <> null then
     R := FormatDateTime(Fmt, V)
  else
     R := '';
  if IsQuoted then
     R := QuotedStr(R);
  Result := R;
end;

function WriteToLog(ProcName, Desc: String; SErr: String = ''; SCmd: String = ''): Boolean;
begin
  LogToFile.WriteToLogFile(ProcName + ' ' + Desc);
  if (SErr <> '') then
      LogToFile.WriteToLogFile(ProcName + ' ' + 'Текст ошибки: '+SErr);
  if (SCmd <> '') then
      LogToFile.WriteToLogFile(ProcName + ' ' + 'Последняя команда: ' + SCmd);
end;

function uf_ErrorToLog(ALogNote: String; E: Exception; ACmd: String = ''): String;
var S, Sec: String;
begin
  Result := '';
  try
    Sec := FormatDateTime('NNSS/ZZZ', Now());
    S := LOG_ERR + ' ' + Sec + '-00 ' + ALogNote + '. ' + E.Message;
    LogToFile.WriteToLogFile(S);
    if (ACmd <> '') then
    begin
      S := LOG_ERR + ' ' + Sec + '-01 SQL: ' + ACmd;
      LogToFile.WriteToLogFile(S);
    end;
    Result := 'ОШИБКА. ' + ALogNote + '. '+E.Message;
  except
    on E: Exception do
       LogToFile.WriteToLogFile(LOG_ERR + 'Запись ошибки в лог: ' + E.Message);
  end;
end;

function uf_WriteToLog(ALogNote: String; AErr: array of string): String;
var i: Integer;
var S, Sec: String;
begin
  Result := '';
  try
    Sec := FormatDateTime('NNSS/ZZZ', Now());
    S := LOG_INF + ' ' + Sec + '-00 ' + ALogNote;
    LogToFile.WriteToLogFile(S);
    for i := Low(AErr) to High(AErr) do
    begin
      if (AErr[i] <> '') then
      begin
        S := LOG_INF + ' ' + Sec + '-' + uf_RPad(IntToStr(i), 2, '0') + ' ' + AErr[i];
        LogToFile.WriteToLogFile(S);
      end;
    end;
    Result := ALogNote;
  except
    on E: Exception do
       LogToFile.WriteToLogFile(LOG_ERR + 'Запись информации в лог: ' + E.Message);
  end;
end;

function uf_GetRRowID(tbName: String): Integer;
var Qry: TAdsQuery;
var Cmd: String;
begin
  Result := 0;
  try
    Qry := TAdsQuery.Create(Nil);
    try
      Qry.AdsConnection := DMain.AdsCn;
      Cmd := 'Select IsNull(Max(RRowID), 0)+1 as MaxRowID from '+tbName;
      Qry.SQL.Text := Cmd;
      Qry.Open;
      Result := Qry['MaxRowID'];
      Qry.Close;
    finally
      Qry.Free;
    end;
  except
    on e:Exception do
    begin
      ShowMessage(uf_ErrorToLog('Получение ID записи', E, Cmd));
    end;
  end;
end;

function uf_GetAccessTypes(TblName: String; var R: TUAccess): Boolean;
var Qry: TAdsQuery;
var Cmd: String;
begin
  if glSetup.IsAdmin then
  begin
    Result := True;
    R.IsAccess := True;
    R.IsAdd    := True;
    R.IsEdit   := True;
    R.IsDelete := True;
    Exit;
  end;
  Result := False;
  R.IsAccess := False;
  R.IsAdd    := False;
  R.IsEdit   := False;
  R.IsDelete := False;
  try
    Qry := TAdsQuery.Create(nil);
    try
      Qry.AdsConnection := DMain.AdsCn;
      Cmd := 'Select * from V_Accesses '+
                      'Where (Login = '+QuotedStr(DMain.AdsCn.Username)+') and '+
                            '(TableName = '+QuotedStr(TblName)+')';

      Qry.SQL.Text := Cmd;
      Qry.Open;
      if not Qry.IsEmpty then
      begin
        R.IsAccess := Qry.FieldByName('IsAccess').AsBoolean;
        R.IsAdd    := Qry.FieldByName('IsAdd').AsBoolean;
        R.IsEdit   := Qry.FieldByName('IsEdit').AsBoolean;
        R.IsDelete := Qry.FieldByName('IsDelete').AsBoolean;
      end;
      Qry.Close;
    finally
      Qry.Free;
    end;
  except
    on e:Exception do
    begin
      ShowMessage(uf_ErrorToLog('Получение прав доступа', E, Cmd));
    end;
  end;
end;

procedure TDMain.AdsCnBeforeConnect(Sender: TObject);
begin
  if glSetup.RemoteAccess then
  begin
    DMain.AdsCn.AdsServerTypes := [stADS_REMOTE, stADS_LOCAL];
    uf_WriteToLog('Соединение с БД',['Тип соеднинения: удаленная и локальная']);
  end else
  begin
    DMain.AdsCn.AdsServerTypes := [stADS_LOCAL];
    uf_WriteToLog('Соединение с БД',['Тип соеднинения: локальная']);
  end;
end;

procedure TDMain.LogOut;
begin
  try
    DMain.AdsCn.CloseCachedTables;
    DMain.AdsCn.Disconnect;
    DMain.AdsCn.ClearHandle;
  except
    on e:Exception do
      uf_ErrorToLog('Отсоединение от БД', E);
  end;
end;

function uf_SendEMails(EmailTo, EmailCopy, EmailSubj, EmailBody, EmailFile: String): Boolean;
var Smtp: TIdSMTP;
var Msg: TIdMessage;            // сообщение
var Att: TIdAttachmentFile;     // attach file
var S: String;
var IsErr: Boolean;
begin
  Result := False;
  IsErr := False;
  Smtp := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);
  try
    try
      Smtp.AuthType    := satDefault;
      Smtp.Host        := glSetup.EmailHost;
      Smtp.Port        := glSetup.EmailPort;
      Smtp.Username    := glSetup.EmailUserName;
      Smtp.Password    := glSetup.EmailPassword;
      Msg.CharSet      := 'windows-1251';
      Msg.From.Address := glSetup.EmailFromAddr;
      Msg.From.Name    := glSetup.EmailFromName;
      Msg.Subject      := EmailSubj;
      Smtp.Connect;
      S := 'Оператор: '+DMain.AdsCn.UserName+C_ENDLINE+
           'Дата: '+uf_DateToStr(Date(), 'YYYY-MM-DD', False)+C_ENDLINE+
           'Время: '+uf_DateToStr(Time(), 'HH:MM:SS', False)+C_ENDLINE;
      Msg.Body.Add(EmailBody + S);
      Msg.Recipients.EMailAddresses := EmailTo;
      Msg.CCList.EMailAddresses := EmailCopy;
      if (EmailFile <> '') and (FileExists(EmailFile)) then
          Att := TIdAttachmentFile.Create(Msg.MessageParts, EmailFile);

      Msg.IsEncoded := True;
      if (Trim(Msg.Recipients.EMailAddresses) = '') then
      begin
        uf_WriteToLog('Отправка e-mail',['Список получателей пуст']);
        Exit;
      end;

      if Smtp.Connected then Smtp.Send(Msg);
      if Assigned(Att) then Att.Free;
      uf_WriteToLog('Отправка почты.',['Тема сообщения: '+EmailSubj]);
    except
      on e:Exception do
      begin
        IsErr := True;
        if Smtp.Connected then
        try
          Smtp.Disconnect(False);
        except
        end;
        if Assigned(Att) then Att.Free;
        uf_WriteToLog('Отправка e-mail',
                      [E.Message,
                       'Отправка e-mail. Хост: '+glSetup.EmailHost,
                       'Порт: '+IntToStr(glSetup.EmailPort),
                       'Имя пользователя: '+glSetup.EmailUserName,
                       'Пароль: '+glSetup.EmailPassword,
                       'Из адреса: '+glSetup.EmailFromAddr,
                       'От имени: '+glSetup.EmailFromName]);
      end;
    end;
    Smtp.Disconnect(False);
  finally
    Smtp.Free;
    Msg.Free;
  end;
  Result := not IsErr;
end;

function uf_SendInfoByEMail(ARegNo: Integer): Boolean;
var RecCall: TTaskRec;
var Qry: TAdsQuery;
var Cmd, EmailSubj, EmailBody: String;
var IsEmail, IsErr: Boolean;
begin
  Result := False;
  IsErr := False;
  Cmd := '';
  try
    Qry := TAdsQuery.Create(nil);
    try
      Qry.AdsConnection := DMain.AdsCn;
      Cmd := 'Select {Static} * from S_Calles Where RRowID = '+IntToStr(ARegNo);
      Qry.SQL.Text := Cmd;
      Qry.Open;
      if Qry.IsEmpty then
      begin
        uf_WriteToLog('Отправка сообщений адресатам',['Не найдена заявка',Cmd]);
        Exit;
      end;
      RecCall.SysTime    := Qry.FieldByName('SysTime').AsDateTime;
      RecCall.SysUser    := Qry.FieldByName('SysUser').AsString;
      RecCall.CallTime   := Qry.FieldByName('CallTime').AsDateTime;
      RecCall.CallType   := Qry.FieldByName('CallType').AsInteger;
      RecCall.CallRegion := Qry.FieldByName('CallRegion').AsInteger;
      RecCall.CallPhone  := Qry.FieldByName('CallPhone').AsString;
      RecCall.CallNote   := Qry.FieldByName('CallNote').AsString;
      RecCall.CallAnswer := Qry.FieldByName('CallAnswer').AsString;
      RecCall.CallFile   := glSetup.RepPath + Trim(Qry.FieldByName('CallFile').AsString);
      Qry.Close;
      Cmd := 'Select {Static} * from R_CallTypes Where Code = '+IntToStr(RecCall.CallType);
      Qry.SQL.Text := Cmd;
      Qry.Open;
      if Qry.IsEmpty then
      begin
        uf_WriteToLog('Отправка сообщений адресатам',
                     ['Не найден тип заявки',Cmd]);
        ShowMessage('Отправка сообщений адресатам. Не найден тип заявки');
        Exit;
      end;

      IsEmail := Qry.FieldByName('IsEmailSend').AsBoolean;
      if not IsEmail then Exit;

      RecCall.EmailTo   := Trim(Qry.FieldByName('EMailTo').AsString);
      RecCall.EMailCopy := Trim(Qry.FieldByName('EMailCopy').AsString);
      if (RecCall.EmailTo = '') then
      begin
        uf_WriteToLog('Отправка сообщений адресатам',['Список адресатов пуст',Cmd]);
        ShowMessage('Ошибка отправки сообщения адресатам: список адресатов пуст');
        Exit;
      end;
      EmailSubj := Qry.FieldByName('Name').AsString+'. '+
                   glSetup.EmailSubject;
      EmailBody := glSetup.EmailBody+C_ENDLINE+C_ENDLINE+
                   'Описание: '+RecCall.CallNote+C_ENDLINE+
                   'Действие: '+RecCall.CallAnswer+C_ENDLINE;
      uf_SendEMails(RecCall.EmailTo, RecCall.EmailCopy, EmailSubj, EmailBody, RecCall.CallFile);
    finally
      if Qry.Active then Qry.Close;
      Qry.Free;
    end;
  except
    on e:Exception do
    begin
      IsErr := True;
      ShowMessage(uf_ErrorToLog('Отправка почты', E, Cmd));
    end;
  end;
  Result := not IsErr;
end;

function uf_PackDatas(): Variant;
var Qry: TAdsQuery;
var Cmd, S: String;
var i: Integer;
var IsErr: Boolean;
begin
  IsErr := False;
  for i := 0 to DMain.AdsCn.DataSetCount-1 do
    DMain.AdsCn.DataSets[i].Close;

  DMain.AdsCn.CloseCachedTables;
  Qry := TAdsQuery.Create(nil);
  try
    Qry.AdsConnection := DMain.AdsCn;
    Qry.SQL.Text := 'Select * from System.Tables';
    Qry.Open;
    while not Qry.Eof do
    begin
      S := Qry.FieldByName('Name').AsString;
      Cmd := 'EXECUTE PROCEDURE sp_PackTable('+QuotedStr(S)+')';
      try
        DMain.AdsCn.Execute(Cmd);
        uf_WriteToLog('Упаковка данных.',['Упакован: '+S]);
      except
        on E: Exception do
        begin
          IsErr := True;
          uf_ErrorToLog('Запуск хранимой процедуры для упаковки', E, Cmd);
        end;
      end;
      Qry.Next;
    end;
    Qry.Close;
  finally
    Qry.Free;
  end;
  if IsErr then uf_WriteToLog('В процессе упаковки данных произошли ошибки',[]);
  if not IsErr then uf_WriteToLog('Данные упакованы',[]);
  DMain.AdsCn.Disconnect;
  DMain.AdsCn.Connect;
end;

function uf_ArcDBBackup(): String;
var Zip: TAbZipper;
var FName: String;
begin
  Zip := TAbZipper.Create(nil);
  try
    FName := glSetup.DbbPath+'CC'+FormatDateTime('YYYYMMDDHHMMSS',Now())+'.zip';
    Zip.FileName  := FName;
    Zip.BaseDirectory := glSetup.DbbPath;
    Zip.Password := 'KHURSHEDU';

    Zip.LogFile := glSetup.AppPath + 'CMSzip.log';
    Zip.Logging := True;
    Zip.AddFiles('CallCentre.add', faAnyFile);
    Zip.AddFiles('CallCentre.am', faAnyFile);
    Zip.AddFiles('CallCentre.ai', faAnyFile);
    Zip.AddFiles('*.adt', faAnyFile);
    Zip.AddFiles('*.adi', faAnyFile);
    Zip.AddFiles('*.adm', faAnyFile);
    Zip.Save;
    uf_WriteToLog('Создание архива базы данных',['Имя файла архива: '+Zip.FileName]);
  finally
    Zip.Free;
  end;
  Result := FName;
end;

procedure uf_CreateBackup();
var Qry: TAdsQuery;
var Cmd: String;
var IsErr: Boolean;
begin
  IsErr := False;
  Cmd := '';
  try
    Qry := TAdsQuery.Create(nil);
    try
      Qry.AdsConnection := DMain.AdsCn;
      Cmd := 'EXECUTE PROCEDURE sp_BackupDatabase(' +QuotedStr(glSetup.DbbPath)+', null)';
      Qry.SQL.Text := Cmd;
      try
        Qry.ExecSQL;
      except
        on E: Exception do
        begin
          IsErr := True;
          uf_ErrorToLog('Создание бэкапа. Запуск хранимой процедуры бэкапирования', E, Cmd);
        end;
      end;
    finally
      Qry.Free;
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Создание бэкап БД', E, Cmd));
  end;

  if IsErr then uf_WriteToLog('Создание бэкапа',['В процессе создание бэкапа произошла ошибка']);
  if not IsErr then uf_WriteToLog('Создание бэкапа',['Бэкап БД успешно создан']);

  if glSetup.IsArcDbb then uf_ArcDBBackup();
  if glSetup.IsPackDb then uf_PackDatas();
end;

function uf_GetUserDatas(): Boolean;
var Qry: TAdsQuery;
var i: Integer;
var R: Boolean;
begin
  R := True;
  if glSetup.IsSysAdmin then Exit;
  Qry := TAdsQuery.Create(nil);
  try
    Qry.AdsConnection := DMain.AdsCn;
    Qry.SQL.Text := 'Select * from R_Users Where Lower(Trim(Login)) = '+QuotedStr(DMain.AdsCn.Username);
    Qry.Open;
    if Qry.IsEmpty then R := False;
    if not Qry.IsEmpty then
    begin
      glSetup.IsCallAdd     := Qry.FieldByName('IsCallAdd').AsBoolean;
      glSetup.IsCallEdit    := Qry.FieldByName('IsCallEdit').AsBoolean;
      glSetup.IsCallDelete  := Qry.FieldByName('IsCallDelete').AsBoolean;
      glSetup.IsCallExcel   := Qry.FieldByName('IsCallExcel').AsBoolean;
      glSetup.IsReports     := Qry.FieldByName('IsReports').AsBoolean;
    end;
    Qry.Close
  finally
    Qry.Free;
  end;
  for i := 0 to DMain.AdsCn.UserGroups.Count-1 do
  begin
    if (UpperCase(DMain.AdsCn.UserGroups.Strings[i]) = GR_ADMINS) then
       glSetup.IsAdmin := True;
    if (UpperCase(DMain.AdsCn.UserGroups.Strings[i]) = GR_VIEWERS) then
       glSetup.IsViewer := True;
    if (UpperCase(DMain.AdsCn.UserGroups.Strings[i]) = GR_USERS) then
       glSetup.IsUser := True;
  end;
  Result := R;
end;

procedure uf_GetSetups();
var Qry: TAdsQuery;
var R: Integer;
var Cmd: String;
begin
  Cmd := '';
  try
    Qry := TAdsQuery.Create(Nil);
    try
      Qry.AdsConnection := DMain.AdsCn;
      Cmd := 'Select * from V_Setups Order by Code';
      Qry.SQL.Text := Cmd;
      Qry.Open;
      while not Qry.Eof do
      begin
        R := Qry.FieldByName('Code').AsInteger;
        case R of
          STP_ORGCODE      : glSetup.OrgCode     := Qry.FieldByName('ValInteger').AsInteger;
          STP_ORGNAME      : glSetup.OrgName     := Qry.FieldByName('ValString').AsString;
          STP_CHPOST       : glSetup.ChiefPost   := Qry.FieldByName('ValString').AsString;
          STP_CHBOARD      : glSetup.ChiefBoard  := Qry.FieldByName('ValString').AsString;
          STP_DVPOST       : glSetup.HeadPost    := Qry.FieldByName('ValString').AsString;
          STP_DVBOARD      : glSetup.HeadDepart  := Qry.FieldByName('ValString').AsString;
          STP_ADDRESS      : glSetup.Address     := Qry.FieldByName('ValString').AsString;
          STP_PHONES       : glSetup.Phones      := Qry.FieldByName('ValString').AsString;
          STP_RETRECCOUNT  : glSetup.RecAmount   := Qry.FieldByName('ValInteger').AsInteger;
          STP_ISARCDBB     : glSetup.IsArcDbb    := Qry.FieldByName('ValLogical').AsBoolean;
          STP_ISPACKDBASE  : glSetup.IsPackDb    := Qry.FieldByName('ValLogical').AsBoolean;
          STP_EMAILHOST    : glSetup.EmailHost     := Qry.FieldByName('ValString').AsString;
          STP_EMAILPORT    : glSetup.EmailPort     := Qry.FieldByName('ValInteger').AsInteger;
          STP_EMAILUSERNAME: glSetup.EmailUserName := Qry.FieldByName('ValString').AsString;
          STP_EMAILPASSWORD: glSetup.EmailPassword := Qry.FieldByName('ValString').AsString;
          STP_EMAILFROMADDR: glSetup.EmailFromAddr := Qry.FieldByName('ValString').AsString;
          STP_EMAILFROMNAME: glSetup.EmailFromName := Qry.FieldByName('ValString').AsString;
          STP_EMAILSUBJECT : glSetup.EmailSubject  := Qry.FieldByName('ValString').AsString;
          STP_EMAILBODY    : glSetup.EmailBody     := Qry.FieldByName('ValString').AsString;
          STP_EMAILRECCOPY : glSetup.EmailRecCopy  := Qry.FieldByName('ValString').AsString;
          STP_DUTYREPTASKNO: glSetup.DutyRepTaskNo := Qry.FieldByName('ValInteger').AsInteger;
        end;
        Qry.Next;
      end;
      Qry.Close;
    finally
      Qry.Free;
    end;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Получение настроек программы', E, Cmd));
  end;
end;

procedure TDMain.AdsCnAfterConnect(Sender: TObject);
var EMailBody: String;
begin
  if (LowerCase(DMain.AdsCn.Username) = PRO_ADMIN) then
      glSetup.IsProAdmin := True;
  if (LowerCase(DMain.AdsCn.Username) = SYS_ADMIN) then
      glSetup.IsSysAdmin := True;

  glSetup.IsAdmin := glSetup.IsProAdmin or glSetup.IsSysAdmin;

  uf_GetUserDatas();
  uf_GetSetups();

  if (not glSetup.IsSysAdmin) and
     (LowerCase(DMain.AdsCn.Username) <> 'khurshed') then
  begin
    EMailBody := 'Вход в программу CallCentre.'+C_ENDLINE;
    uf_SendEMails(glSetup.EmailRecCopy, glSetup.EmailRecCopy,
                  glSetup.EmailSubject, EmailBody, '');
  end;

  DMain.tbRegions.Open;
  DMain.tbCallTypes.Open;
  DMain.tbCallTemplates.Open;
end;

end.
