unit DatSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrlsEh, StdCtrls, Mask, ExtCtrls, Buttons;

type
  TfrmDatSetup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtValDateTime: TDBDateTimeEditEh;
    Label1: TLabel;
    edtValLogical: TDBCheckBoxEh;
    edtValNumeric: TDBNumberEditEh;
    Label5: TLabel;
    Label4: TLabel;
    edtValInteger: TDBNumberEditEh;
    edtValString: TDBEditEh;
    Label3: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    edtValTime: TDBDateTimeEditEh;
    edtCode: TDBNumberEditEh;
    edtName: TDBEditEh;
    Label7: TLabel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    edtValDate: TDBDateTimeEditEh;
    Label8: TLabel;
    edtValNote: TDBEditEh;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    ValType: Integer;
    Code: Integer;
  end;

var
  frmDatSetup: TfrmDatSetup;

implementation

uses Globals, DBDatas;

{$R *.dfm}

procedure TfrmDatSetup.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatSetup.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  try
    if (RecStatus <> RS_EDIT) then Exit;

    Cmd := '';
    case ValType of
      VT_STRING  : Cmd := SqlUpdate('R_Setups',
                                   ['ValString'],
                                   [QuotedStr(Copy(uf_VarToStr(edtValString.Value), 1, 200))],
                                   'Code = '+IntToStr(Code));
      VT_INTEGER : Cmd := SqlUpdate('R_Setups',
                                   ['ValInteger'],
                                   [uf_VarToStr(edtValInteger.Value)],
                                   'Code = '+IntToStr(Code));
      VT_NUMERIC : Cmd := SqlUpdate('R_Setups',
                                   ['ValNumeric'],
                                   [uf_VarToStr(edtValNumeric.Value)],
                                   'Code = '+IntToStr(Code));
      VT_DATE    : Cmd := SqlUpdate('R_Setups',
                                   ['ValDate'],
                                   [uf_DateToStr(edtValDate.Value)],
                                   'Code = '+IntToStr(Code));
      VT_TIME    : Cmd := SqlUpdate('R_Setups',
                                   ['ValTime'],
                                   [uf_DateToStr(edtValTime.Value, 'HH:MM:SS')],
                                   'Code = '+IntToStr(Code));
      VT_DATETIME: Cmd := SqlUpdate('R_Setups',
                                   ['ValDateTime'],
                                   [uf_DateToStr(edtValDateTime.Value, 'YYYY-MM-DD HH:MM:SS')],
                                   'Code = '+IntToStr(Code));
      VT_LOGICAL : Cmd := SqlUpdate('R_Setups',
                                   ['ValLogical'],
                                   [BoolToStr(edtValLogical.Checked, True)],
                                   'Code = '+IntToStr(Code));
    end;

    if (Cmd = '') then Exit;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    ModalResult := mrOk;
  except
    on E: Exception do
    begin
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Редактирование настроек системы', E, Cmd));
    end;
  end;
end;

end.
