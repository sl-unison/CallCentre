unit DatCall;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Mask, DB, DBCtrlsEh,
  DBGridEh, DBLookupEh, adsdata;

type
  TfrmDatCall = class(TForm)
    Panel1: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    Panel2: TPanel;
    edtSysTime: TDBDateTimeEditEh;
    edtCallTime: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    edtCallType: TDBLookupComboboxEh;
    edtCallRegion: TDBLookupComboboxEh;
    edtCallPhone: TDBEditEh;
    edtCallAnswer: TDBEditEh;
    Panel3: TPanel;
    edtCallNote: TMemo;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    RRowID: Integer;
  end;

var
  frmDatCall: TfrmDatCall;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatCall.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus <> RS_INSERT) and (RecStatus <> RS_EDIT) then Exit;

  if (Trim(edtCallType.Text) = '') then
      raise Exception.Create('Не указан тип события');
  if (Trim(edtCallAnswer.Text) = '') then
      raise Exception.Create('Не введен ответ оператора');

  if (RecStatus = RS_INSERT) then
  begin
    RRowID := uf_GetRRowID('S_Calles');
    Cmd := SQLInsert('S_Calles',
                    ['RRowID','SysTime','SysUser',
                     'CallTime','CallType','CallRegion',
                     'CallPhone','CallNote','CallAnswer'],
                    [IntToStr(RRowID),
                     uf_DateToStr(now(), 'YYYY-MM-DD hh:mm:ss'),
                     QuotedStr(Copy(DMain.AdsCn.Username, 1, 20)),
                     uf_DateToStr(edtCallTime.Value, 'YYYY-MM-DD hh:mm:ss'),
                     VarToStr(edtCallType.KeyValue),
                     VarToStr(edtCallRegion.KeyValue),
                     QuotedStr(Copy(VarToStr(edtCallPhone.Text), 1, 20)),
                     QuotedStr(VarToStr(edtCallNote.Lines.Text)),
                     QuotedStr(Copy(VarToStr(edtCallAnswer.Text), 1, 120))]);
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
        ShowMessage(uf_ErrorToLog('Регистр. Ввод новой записи', E, Cmd));
      end;
    end;
  end;
  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('S_Calles',
                    ['SysTime','SysUser',
                     'CallTime','CallType','CallRegion',
                     'CallPhone','CallNote','CallAnswer'],
                    [uf_DateToStr(now(), 'YYYY-MM-DD hh:mm:ss'),
                     QuotedStr(Copy(DMain.AdsCn.Username, 1, 20)),
                     uf_DateToStr(edtCallTime.Value, 'YYYY-MM-DD hh:mm:ss'),
                     VarToStr(edtCallType.KeyValue),
                     VarToStr(edtCallRegion.KeyValue),
                     QuotedStr(Copy(VarToStr(edtCallPhone.Text), 1, 20)),
                     QuotedStr(VarToStr(edtCallNote.Lines.Text)),
                     QuotedStr(Copy(VarToStr(edtCallAnswer.Text), 1, 120))],
                     'RRowID = '+IntToStr(RRowID));
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
        ShowMessage(uf_ErrorToLog('Регистр. Редактирование записи', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatCall.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
