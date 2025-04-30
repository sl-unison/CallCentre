unit Users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ActnList, Globals, DB,
  DBGridEh, DBGridEhGrouping, GridsEh, StdCtrls, adsdata, adsfunc, adstable;

type
  TfrmUsers = class(TForm)
    Panel2: TPanel;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acPassword: TAction;
    acClose: TAction;
    acSelect: TAction;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    acAccess: TAction;
    DBGridEh1: TDBGridEh;
    tbUsers: TAdsQuery;
    srUsers: TDataSource;
    tbUsersIsBlocked: TBooleanField;
    tbUsersIsCallAdd: TBooleanField;
    tbUsersIsCallEdit: TBooleanField;
    tbUsersIsCallDelete: TBooleanField;
    tbUsersIsCallExcel: TBooleanField;
    tbUsersIsReports: TBooleanField;
    tbUsersLogin: TWideStringField;
    tbUsersUserName: TWideStringField;
    tbUsersRemark: TWideStringField;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acPasswordExecute(Sender: TObject);
    procedure acAccessExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsers: TfrmUsers;

implementation

uses DBDatas, DatUser, ChangePassword, UserAccesses;

{$R *.dfm}

procedure TfrmUsers.acAddExecute(Sender: TObject);
var R: String;
begin
  frmDatUser := TFrmDatUser.Create(Owner);
  try
    frmDatUser.RecStatus := RS_INSERT;
    if (frmDatUser.ShowModal <> mrOk) then Exit;

    R := frmDatUser.Login;
    tbUsers.Close;
    tbUsers.Open;
    tbUsers.Locate('Login', R, []);
  finally
    frmDatUser.Free;
  end;
end;

procedure TfrmUsers.acEditExecute(Sender: TObject);
var R: String;
begin
  if tbUsers.IsEmpty then Exit;

  R := tbUsers.FieldByName('Login').AsString;

  if DMain.tbUGroups.Active then DMain.tbUGroups.Close;
  DMain.tbUGroups.ParamByName('RUser').Value := R;
  DMain.tbUGroups.Open;

  frmDatUser := TFrmDatUser.Create(Owner);
  try
    frmDatUser.RecStatus := RS_EDIT;
    frmDatUser.Login     := R;
    frmDatUser.edtLogin.Value          := tbUsers['Login'];
    frmDatUser.edtUserName.Value       := tbUsers['UserName'];
    frmDatUser.edtIsBlocked.Checked    := tbUsers.FieldByName('IsBlocked').AsBoolean;
    frmDatUser.edtIsCallAdd.Checked    := tbUsers.FieldByName('IsCallAdd').AsBoolean;
    frmDatUser.edtIsCallEdit.Checked   := tbUsers.FieldByName('IsCallEdit').AsBoolean;
    frmDatUser.edtIsCallDelete.Checked := tbUsers.FieldByName('IsCallDelete').AsBoolean;
    frmDatUser.edtIsCallExcel.Checked  := tbUsers.FieldByName('IsCallExcel').AsBoolean;
    frmDatUser.edtIsReports.Checked    := tbUsers.FieldByName('IsReports').AsBoolean;
    frmDatUser.edtRemark.Value         := tbUsers['Remark'];
    frmDatUser.edtLogin.Enabled := False;
    if (frmDatUser.ShowModal <> mrOk) then Exit;

    tbUsers.Close;
    tbUsers.Open;
    tbUsers.Locate('Login', R, []);
  finally
    frmDatUser.Free;
  end;
end;

procedure TfrmUsers.acDeleteExecute(Sender: TObject);
var R, Cmd: String;
begin
  if tbUsers.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbUsers.FieldByName('Login').AsString;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    Cmd := 'Delete from R_Users Where Login = '+QuotedStr(R);
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    tbUsers.Prior;
    if (not tbUsers.Bof) then
        R := tbUsers.FieldByName('Login').AsString;
    tbUsers.Close;
    tbUsers.Open;
    tbUsers.Locate('Login', R, []);
  except
    on E: Exception do
    begin
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Спр. пользователей. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmUsers.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmUsers.acPasswordExecute(Sender: TObject);
var R: String;
begin
  if tbUsers.IsEmpty then Exit;

  R := tbUsers.FieldByName('Login').AsString;

  frmChangePassword := TFrmChangePassword.Create(Owner);
  try
    frmChangePassword.edtOldPassword.Enabled := False;
    frmChangePassword.Login := R;
    frmChangePassword.ShowModal;
  finally
    frmChangePassword.Free;
  end;
end;

procedure TfrmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbUsers.Active then tbUsers.Close;
end;

procedure TfrmUsers.FormShow(Sender: TObject);
begin
  if tbUsers.Active then tbUsers.Close;
  tbUsers.Open;
end;

procedure TfrmUsers.acAccessExecute(Sender: TObject);
var R: String;
begin
  if tbUsers.IsEmpty then Exit;

  R := tbUsers.FieldByName('Login').AsString;
  frmUserAccesses := TfrmUserAccesses.Create(Owner);
  try
    frmUserAccesses.UserLogin := R;
    frmUserAccesses.Caption := 'Доступы пользователя '+R;
    frmUserAccesses.ShowModal;
  finally
    frmUserAccesses.Free;
  end;
end;

end.
