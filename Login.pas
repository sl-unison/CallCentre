unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, AdsData, Globals;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel5: TPanel;
    Image2: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    btnAccept: TBitBtn;
    btnCansel: TBitBtn;
    Panel4: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPassword: TEdit;
    edtUser: TEdit;
    pnlTitle: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnCanselClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses DBDatas;

{$R *.dfm}

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmLogin.btnAcceptClick(Sender: TObject);
var isConn: Boolean;
begin
   isConn := True;
   DMain.AdsCn.Username := edtUser.Text;
   DMain.AdsCn.Password := edtPassword.Text;
   DMain.AdsCn.ConnectPath := glSetup.DbfPath+C_DATADIC;
   try
     DMain.AdsCn.IsConnected:=True;
     except on E: EADSDatabaseError do
     begin
       isConn := False;
       case E.ACEErrorCode of
       5004: ShowMessage('5004: БД не найдена в сервере: '+DMain.AdsCn.ConnectPath);
       7077: ShowMessage('7077: Словарь БД не может быть открыта: '+DMain.AdsCn.ConnectPath);
       7078: ShowMessage('7078: Неправильный пароль или имя пользователя');
       7113: ShowMessage('7113: Доступ к БД заблокировано для данного пользователя');
       else
         ShowMessage(E.Message);
       end;
     end;
   end;
   if isConn then ModalResult := mrOk;
end;

procedure TfrmLogin.btnCanselClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

end.
