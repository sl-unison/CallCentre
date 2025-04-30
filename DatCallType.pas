unit DatCallType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrlsEh, Buttons, ExtCtrls, ComCtrls;

type
  TfrmDatCallType = class(TForm)
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TDBEditEh;
    edtCode: TDBNumberEditEh;
    PageControl1: TPageControl;
    TSheetEmailTo: TTabSheet;
    TSheetEmailCopy: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    edtEmailTo: TMemo;
    edtEmailCopy: TMemo;
    edtIsEmailSend: TDBCheckBoxEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    Code: Integer;
  end;

var
  frmDatCallType: TfrmDatCallType;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatCallType.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_CallTypes',
                    ['Code','Name','IsEmailSend','EmailTo','EmailCopy'],
                    [VarToStr(edtCode.Value),
                     QuotedStr(Copy(VarToStr(edtName.Value),1,50)),
                     BoolToStr(edtIsEmailSend.Checked, True),
                     QuotedStr(edtEmailTo.Text),
                     QuotedStr(edtEmailCopy.Text)]);
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      Code := edtCode.Value;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.AdsCn.Rollback;
        ShowMessage(uf_ErrorToLog('Спр. видов обращений. Ввод новой записи', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_CallTypes',
                    ['Name','IsEmailSend','EmailTo','EmailCopy'],
                    [QuotedStr(Copy(VarToStr(edtName.Value),1,50)),
                     BoolToStr(edtIsEmailSend.Checked, True),
                     QuotedStr(edtEmailTo.Text),
                     QuotedStr(edtEmailCopy.Text)],
                    'Code = '+IntToStr(Code));
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.AdsCn.Rollback;
        ShowMessage(uf_ErrorToLog('Спр. видов обращений. Редактирование записи', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatCallType.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
