unit DlgSendEmail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, ExtCtrls;

type
  TfrmDlgSendEmail = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtEmailNotes: TMemo;
    edtEmailFile: TDBEditEh;
    Label1: TLabel;
    btnFile: TBitBtn;
    edtEmailTo: TDBEditEh;
    edtEmailCopy: TDBEditEh;
    edtEmailSubj: TDBEditEh;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnFileClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsService: Boolean;
  end;

var
  frmDlgSendEmail: TfrmDlgSendEmail;

implementation

{$R *.dfm}

procedure TfrmDlgSendEmail.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDlgSendEmail.btnFileClick(Sender: TObject);
var ODlg: TOpenDialog;
begin
  ODlg := TOpenDialog.Create(Owner);
  try
    ODlg.Filter := 'Отчет о дежурстве';
    if ODlg.Execute then
       edtEmailFile.Value := ODlg.FileName;
  finally
    ODlg.Free;
  end;
end;

procedure TfrmDlgSendEmail.btnSaveClick(Sender: TObject);
begin
  if IsService then
  begin
    ModalResult := mrOk;
    Exit;
  end;
  if (Trim(edtEmailTo.Text) = '') then
      raise Exception.Create('Не введен адрес получателя');
  if (Trim(edtEmailNotes.Text) = '') then
      raise Exception.Create('Не введена текст письма');

  ModalResult := mrOk;
end;

end.
