unit DatReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, DBCtrlsEh, Buttons, ExtCtrls, Mask;

type
  TfrmDatReport = class(TForm)
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    edtRemark: TDBEditEh;
    edtName: TDBEditEh;
    Label2: TLabel;
    Label1: TLabel;
    edtIsPeriod: TDBCheckBoxEh;
    edtIsSystem: TDBCheckBoxEh;
    edtCode: TDBNumberEditEh;
    edtSQLText: TMemo;
    edtIsHide: TDBCheckBoxEh;
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
  frmDatReport: TfrmDatReport;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatReport.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SqlInsert('R_Reports',
                    ['Code','Name','IsSystem','IsHide','IsPeriod','Remark','SQLText'],
                    [VarToStr(edtCode.Value),
                     QuotedStr(Copy(VarToStr(edtName.Value), 1, 80)),
                     BoolToStr(edtIsSystem.Checked),
                     BoolToStr(edtIsHide.Checked),
                     BoolToStr(edtIsPeriod.Checked),
                     QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 120)),
                     QuotedStr(edtSQLText.Text)]);
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      Code := edtCode.Value;
      DMain.AdsCn.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        ShowMessage(uf_ErrorToLog('Отчеты. Вставка новой записи', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_Reports',
                    ['Name','IsSystem','IsHide','IsPeriod','Remark','SQLText'],
                    [QuotedStr(Copy(VarToStr(edtName.Value), 1, 80)),
                     BoolToStr(edtIsSystem.Checked),
                     BoolToStr(edtIsHide.Checked),
                     BoolToStr(edtIsPeriod.Checked),
                     QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 120)),
                     QuotedStr(edtSQLText.Text)],
                    'Code = ' + IntToStr(Code));
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        ShowMessage(uf_ErrorToLog('Отчеты. Редактирование записи', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatReport.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
