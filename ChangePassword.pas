unit ChangePassword;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Mask, DBCtrlsEh, Globals;

type
  TfrmChangePassword = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    lblOldPassword: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    edtOldPassword: TDBEditEh;
    edtNewPassword: TDBEditEh;
    edtCfmPassword: TDBEditEh;
    Panel3: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Login: String;
  end;

var
  frmChangePassword: TfrmChangePassword;

implementation

uses DBDatas;

{$R *.dfm}

procedure TfrmChangePassword.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmChangePassword.btnSaveClick(Sender: TObject);
begin
  if edtOldPassword.Enabled then
  begin
    if (edtOldPassword.Value = Null) then
    begin
      ShowMessage('Введите старый пароль');
      Exit;
    end;
    if (edtOldPassword.Value <> DMain.AdsCn.Password) then
    begin
      ShowMessage('Неправильный старый пароль');
      Exit;
    end;
  end;
  if (edtNewPassword.Value = Null) then
  begin
    ShowMessage('Введите новый пароль');
    Exit;
  end;
  if (edtCfmPassword.Value = Null) then
  begin
    ShowMessage('Введите подтверждение нового пароля');
    Exit;
  end;
  if (edtNewPassword.Value <> edtCfmPassword.Value) then
  begin
    ShowMessage('Пароли должны быть одинаковыми');
    Exit;
  end;
  DMain.AdsCn.Execute('EXECUTE PROCEDURE sp_ModifyUserProperty('+
                       QuotedStr(Login)+','+
                       QuotedStr('USER_PASSWORD')+','+
                       QuotedStr(Trim(edtNewPassword.Text))+')');
  Close;
end;

procedure TfrmChangePassword.FormShow(Sender: TObject);
begin
  if (not edtOldPassword.Enabled) then
  begin
    lblOldPassword.Visible := False;
    edtOldPassword.Visible := False;
  end;
end;

end.
