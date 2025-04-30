unit DatCallTemplate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, DBGridEh, DBCtrlsEh, DBLookupEh, Mask;

type
  TfrmDatCallTemplate = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCode: TDBNumberEditEh;
    edtCallType: TDBLookupComboboxEh;
    edtCallNote: TDBEditEh;
    edtCallAnswer: TDBEditEh;
    Label4: TLabel;
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
  frmDatCallTemplate: TfrmDatCallTemplate;

implementation

uses Globals, DBDatas;

{$R *.dfm}

procedure TfrmDatCallTemplate.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatCallTemplate.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_CallTemplates',
                    ['Code','CallType','CallAnswer','CallNote'],
                    [VarToStr(edtCode.Value),
                     VarToStr(edtCallType.KeyValue),
                     QuotedStr(Copy(VarToStr(edtCallAnswer.Value),1,120)),
                     QuotedStr(Copy(VarToStr(edtCallNote.Value),1,160))]);
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
        ShowMessage(uf_ErrorToLog('Справочник шаблонов. Ввод новой записи', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_CallTemplates',
                    ['CallType','CallAnswer','CallNote'],
                    [VarToStr(edtCallType.KeyValue),
                     QuotedStr(Copy(VarToStr(edtCallAnswer.Value),1,120)),
                     QuotedStr(Copy(VarToStr(edtCallNote.Value),1,160))],
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
        ShowMessage(uf_ErrorToLog('Справочник шаблонов. Редактирование записи', E, Cmd));
      end;
    end;
  end;
end;

end.
