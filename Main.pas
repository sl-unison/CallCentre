unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxClasses, dxBar, cxControls, dxStatusBar, ActnList,
  cxLocalization, ShellApi, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, XPMan;

type
  TfrmMain = class(TForm)
    dxBarManager1: TdxBarManager;
    dxBarButton1: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    dxBarManager1Bar1: TdxBar;
    dxBarButton2: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton3: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton4: TdxBarButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    dxBarSubItem6: TdxBarSubItem;
    mnuServ_Users: TdxBarButton;
    dxBarSubItem7: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    dxBarLargeButton1: TdxBarLargeButton;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarLargeButton3: TdxBarLargeButton;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    MainStatusBar: TdxStatusBar;
    ActionList1: TActionList;
    acQuit: TAction;
    acHelp: TAction;
    dxBarSubItem8: TdxBarSubItem;
    dxBarButton10: TdxBarButton;
    dxBarButton12: TdxBarButton;
    dxBarButton14: TdxBarButton;
    mnuServ_Options: TdxBarButton;
    dxBarButton7: TdxBarButton;
    acChangePassword: TAction;
    acRef_Regions: TAction;
    acReports: TAction;
    acSetups: TAction;
    Localizer: TcxLocalizer;
    acUsers: TAction;
    XPManifest1: TXPManifest;
    acCalles: TAction;
    acRef_CallTypes: TAction;
    dxBarButton5: TdxBarButton;
    acCreateDBBackup: TAction;
    dxBarButton11: TdxBarButton;
    acRef_Templates: TAction;
    dxBarButton13: TdxBarButton;
    acSQL: TAction;
    dxBarButton15: TdxBarButton;
    procedure acHelpExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acQuitExecute(Sender: TObject);
    procedure acChangePasswordExecute(Sender: TObject);
    procedure acRef_RegionsExecute(Sender: TObject);
    procedure acReportsExecute(Sender: TObject);
    procedure acSetupsExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acUsersExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure acCallesExecute(Sender: TObject);
    procedure acRef_CallTypesExecute(Sender: TObject);
    procedure acCreateDBBackupExecute(Sender: TObject);
    procedure acRef_TemplatesExecute(Sender: TObject);
    procedure acSQLExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DBDatas, Users,
  ChangePassword, Setups, R_Reports, Globals, R_Regions, S_Calles, R_CallTypes,
  R_CallTemplates, SQL;

{$R *.dfm}

procedure TfrmMain.acHelpExecute(Sender: TObject);
var SFile: String;
begin
  SFile := glSetup.AppPath + Application.HelpFile;
  if FileExists( SFile ) then
     ShellExecute(HANDLE,Nil,PChar( SFile ),Nil,Nil, SW_SHOWNORMAL)
  else
     ShowMessage('Файл помощи ' + SFile + ' не найден')
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  MainStatusBar.Panels.Items[3].Text := 'Пользователь: '+DMain.AdsCn.Username;
  if not glSetup.IsAdmin then
  begin
    Self.acUsers.Visible         := False;
    Self.acSetups.Visible        := False;
    Self.acRef_Regions.Visible   := False;
    Self.acRef_CallTypes.Visible := False;
    Self.acSQL.Visible           := False;
  end;
end;

procedure TfrmMain.acQuitExecute(Sender: TObject);
begin
  if ActiveMDIChild <> Nil then
  begin
    ActiveMDIChild.Close;
    Exit;
  end;
  Close;
end;

procedure TfrmMain.acChangePasswordExecute(Sender: TObject);
begin
  frmChangePassword := TFrmChangePassword.Create(Owner);
  try
    frmChangePassword.Login := DMain.AdsCn.Username;
    frmChangePassword.ShowModal;
  finally
    frmChangePassword.Free;
  end;
end;

procedure TfrmMain.acCreateDBBackupExecute(Sender: TObject);
begin
  uf_CreateBackup;
  ShowMessage('Бэкап Базы Данных успешно создан');
end;

procedure TfrmMain.acRef_RegionsExecute(Sender: TObject);
var UA: TUAccess;
begin
  uf_GetAccessTypes(TBR_REGIONS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmRegions := TFrmRegions.Create(Owner);
  try
    frmRegions.acAdd.Enabled    := UA.IsAdd;
    frmRegions.acEdit.Enabled   := UA.IsEdit;
    frmRegions.acDelete.Enabled := UA.IsDelete;
    frmRegions.ShowModal;
  finally
    frmRegions.Free;
  end;
end;

procedure TfrmMain.acRef_TemplatesExecute(Sender: TObject);
var UA: TUAccess;
begin
  uf_GetAccessTypes(TBR_CALLTEMPLATES, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmCallTemplates := TfrmCallTemplates.Create(Owner);
  try
    frmCallTemplates.acAdd.Enabled    := UA.IsAdd;
    frmCallTemplates.acEdit.Enabled   := UA.IsEdit;
    frmCallTemplates.acDelete.Enabled := UA.IsDelete;
    frmCallTemplates.acSelect.Enabled := False;
    frmCallTemplates.ShowModal;
  finally
    frmCallTemplates.Free;
  end;
end;

procedure TfrmMain.acReportsExecute(Sender: TObject);
var UA: TUAccess;
begin
  uf_GetAccessTypes(TBR_REPORTS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmReports := TFrmReports.Create(Owner);
  try
    frmReports.acAdd.Enabled    := UA.IsAdd;
    frmReports.acEdit.Enabled   := UA.IsEdit;
    frmReports.acDelete.Enabled := UA.IsDelete;
    frmReports.ShowModal;
  finally
    frmReports.Free;
  end;
end;

procedure TfrmMain.acSetupsExecute(Sender: TObject);
var UA: TUAccess;
begin
  uf_GetAccessTypes(TBR_SETUPS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmSetups := TFrmSetups.Create(Owner);
  try
    frmSetups.acEdit.Enabled := UA.IsEdit;
    frmSetups.ShowModal;
  finally
    frmSetups.Free;
  end;
end;

procedure TfrmMain.acSQLExecute(Sender: TObject);
begin
  frmSQL := TFrmSQL.Create(Owner);
  try
    frmSQL.ShowModal;
  finally
    frmSQL.Free;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ActiveMDIChild <> Nil Then
     ActiveMDIChild.Close;

  DMain.LogOut;
  Action := caFree;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Вы действительно хотите выйти из программы?',mtWarning,[mbYes,mbNo],0) = mrNo then
       CanClose := False
  else CanClose := True;
end;

procedure TfrmMain.acUsersExecute(Sender: TObject);
var UA: TUAccess;
begin
  uf_GetAccessTypes(TBR_USERS, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmUsers := TFrmUsers.Create(Owner);
  try
    frmUsers.acAdd.Enabled    := UA.IsAdd;
    frmUsers.acEdit.Enabled   := UA.IsEdit;
    frmUsers.acDelete.Enabled := UA.IsDelete;
    frmUsers.acSelect.Visible := False;
    frmUsers.ShowModal;
  finally
    frmUsers.Free;
  end;
end;

procedure TfrmMain.acCallesExecute(Sender: TObject);
var UA: TUAccess;
var frm: TfrmCalles;
begin
  uf_GetAccessTypes(TBS_CALLES, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frm := TfrmCalles.Create(Owner);
  frm.FormStyle := fsMDIChild;
  frm.Visible   := True;
  frm.acCallAdd.Enabled    := UA.IsAdd;
  frm.acCallEdit.Enabled   := UA.IsEdit;
  frm.acCallDelete.Enabled := UA.IsDelete;
  frm.Show;
end;

procedure TfrmMain.acRef_CallTypesExecute(Sender: TObject);
var UA: TUAccess;
begin
  uf_GetAccessTypes(TBR_CALLTYPES, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmCallTypes := TFrmCallTypes.Create(Owner);
  try
    frmCallTypes.acAdd.Enabled    := UA.IsAdd;
    frmCallTypes.acEdit.Enabled   := UA.IsEdit;
    frmCallTypes.acDelete.Enabled := UA.IsDelete;
    frmCallTypes.ShowModal;
  finally
    frmCallTypes.Free;
  end;
end;

end.

