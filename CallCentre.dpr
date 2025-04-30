program CallCentre;

uses
  Forms,
  SysUtils,
  Controls,
  IniFiles,
  Main in 'Main.pas' {frmMain},
  Login in 'Login.pas' {frmLogin},
  ChangePassword in 'ChangePassword.pas' {frmChangePassword},
  DBDatas in 'DBDatas.pas' {DMain: TDataModule},
  R_CallTypes in 'R_CallTypes.pas' {frmCallTypes},
  Globals in 'Globals.pas',
  DlgDateRanges in 'DlgDateRanges.pas' {frmDlgDateRanges},
  DatUser in 'DatUser.pas' {frmDatUser},
  Users in 'Users.pas' {frmUsers},
  ProgressBar in 'ProgressBar.pas' {frmProgressBar},
  DatCallType in 'DatCallType.pas' {frmDatCallType},
  S_Calles in 'S_Calles.pas' {frmCalles},
  DatCall in 'DatCall.pas' {frmDatCall},
  R_Regions in 'R_Regions.pas' {frmRegions},
  DatRegion in 'DatRegion.pas' {frmDatRegion},
  R_Reports in 'R_Reports.pas' {frmReports},
  RepGrid in 'RepGrid.pas' {frmRepGrid},
  ULogToFile in 'ULogToFile.pas',
  DlgPeriod in 'DlgPeriod.pas' {frmDlgPeriod},
  DatReport in 'DatReport.pas' {frmDatReport},
  DlgReport in 'DlgReport.pas' {frmDlgReport},
  Setups in 'Setups.pas' {frmSetups},
  DatSetup in 'DatSetup.pas' {frmDatSetup},
  R_CallTemplates in 'R_CallTemplates.pas' {frmCallTemplates},
  DatCallTemplate in 'DatCallTemplate.pas' {frmDatCallTemplate},
  UserAccesses in 'UserAccesses.pas' {frmUserAccesses},
  DatUserAccess in 'DatUserAccess.pas' {frmDatUserAccess},
  SQL in 'SQL.pas' {frmSQL},
  DlgSendEmail in 'DlgSendEmail.pas' {frmDlgSendEmail};

{$R *.res}

procedure InitApplication;
var Ini: TIniFile;
var S: String;
begin
   glSetup.AppPath := ExtractFilePath(Application.ExeName);
   Ini := TIniFile.Create( glSetup.AppPath + C_PRGINI );
   try
      glSetup.DbfPath := Ini.ReadString( 'PATHES', C_DBFPATH, '');
      glSetup.DbbPath := Ini.ReadString( 'PATHES', C_DBBPATH, '');
      glSetup.ArcPath := Ini.ReadString( 'PATHES', C_ARCPATH, '');
      glSetup.RepPath := Ini.ReadString( 'PATHES', C_REPPATH, '');
      if glSetup.DbfPath = '' then
         glSetup.DbfPath := glSetup.AppPath + DEF_DBF_PATH;
      if glSetup.DbbPath = '' then
         glSetup.DbbPath := glSetup.AppPath + DEF_DBB_PATH;
      if glSetup.ArcPath = '' then
         glSetup.ArcPath := glSetup.AppPath + DEF_ARC_PATH;
      if glSetup.RepPath = '' then
         glSetup.RepPath := glSetup.AppPath + DEF_REP_PATH;

      glSetup.RemoteAccess := False;
      S := AnsiUpperCase(Trim(Ini.ReadString( 'SETTINGS', C_REMACCESS, 'N')));
      if (S = 'Y') then glSetup.RemoteAccess := True;
   finally
      Ini.Free;
   end;
end;

begin
  Application.Initialize;
  PInteger(@Screen.DefaultKbLayout)^:=-1;
  InitApplication;
  Application.HelpFile := 'CallCentre.chm';
  Application.Title := 'CallCentre';

  glFmt := TFormatSettings.Create();
  glFmt.DecimalSeparator := '.';
  glFmt.CurrencyString   := '';
  glFmt.CurrencyDecimals := 2;
  glFmt.ShortDateFormat  := 'DD.MM.YYYY';

  LogToFile.LogFileName := glSetup.AppPath + SFT_LOGFILE;
  LogToFile.IncDateTime := True;
  LogToFile.DateTimeFormatStr := 'YYYY-MM-DD HH:MM:SS';
  LogToFile.IncSeparator := True;
  LogToFile.Separator := ' ';

  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmDlgSendEmail, frmDlgSendEmail);
  frmMain.Caption := SFT_NAME;
  if FileExists( glSetup.AppPath + C_LOCAL ) then
  begin
     frmMain.Localizer.FileName := glSetup.AppPath + C_LOCAL;
     frmMain.Localizer.Active := True;
     frmMain.Localizer.Locale := 1049;
  end;
  Application.CreateForm(TDMain, DMain);
  frmLogin := TfrmLogin.Create(Application);
  try
    frmLogin.Caption := SFT_NAME;
    frmLogin.pnlTitle.Caption := SFT_NAME;
    if (frmLogin.ShowModal <> mrOk) then
    begin
      DMain.Free;
      frmMain.Free;
      Application.Terminate;
    end;
  finally
    frmLogin.Free;
  end;
  frmMain.Visible := True;
  Application.Run;
end.
