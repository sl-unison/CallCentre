unit R_Reports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ExtCtrls, ActnList, Buttons, adstable,
  DBGridEh, DBGridEhGrouping, StdCtrls, GridsEh, adsdata, adsfunc;

type
  TfrmReports = class(TForm)
    Panel1: TPanel;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acExecute: TAction;
    acClose: TAction;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    acGridBestFit: TAction;
    DBGridEh1: TDBGridEh;
    acUserReport: TAction;
    tbReports: TAdsQuery;
    tbReportsCode: TIntegerField;
    tbReportsIsSystem: TBooleanField;
    srReports: TDataSource;
    tbReportsIsPeriod: TBooleanField;
    tbReportsIsHide: TBooleanField;
    tbReportsName: TWideStringField;
    tbReportsRemark: TWideStringField;
    tbReportsSQLText: TWideMemoField;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acExecuteExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btvReportsKeyPress(Sender: TObject; var Key: Char);
    procedure acUserReportExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReports: TfrmReports;

implementation

uses DBDatas, DatReport, RepGrid, Globals, DlgPeriod, DlgReport;

{$R *.dfm}

procedure TfrmReports.acAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatReport := TFrmDatReport.Create(Owner);
  try
    frmDatReport.RecStatus := RS_INSERT;
    if (frmDatReport.ShowModal <> mrOk) then Exit;

    R := frmDatReport.Code;
    tbReports.Close;
    tbReports.Open;
    tbReports.Locate('Code', R, []);
  finally
    frmDatReport.Free;
  end;
end;

procedure TfrmReports.acEditExecute(Sender: TObject);
var R: Integer;
begin
  if tbReports.IsEmpty then Exit;

  if (tbReports.FieldByName('IsSystem').AsBoolean) and
     (not glSetup.IsSysAdmin) then
  begin
    ShowMessage('Запрещено редактировать системный отчет');
    Exit;
  end;

  R := tbReports.FieldByName('Code').AsInteger;
  frmDatReport := TFrmDatReport.Create(Owner);
  try
    frmDatReport.RecStatus := RS_EDIT;
    frmDatReport.Code := R;
    frmDatReport.edtCode.Value           := tbReports['Code'];
    frmDatReport.edtName.Value           := tbReports['Name'];
    frmDatReport.edtIsSystem.Checked     := tbReports.FieldByName('IsSystem').AsBoolean;
    frmDatReport.edtIsHide.Checked       := tbReports.FieldByName('IsHide').AsBoolean;
    frmDatReport.edtIsPeriod.Checked     := tbReports.FieldByName('IsPeriod').AsBoolean;
    frmDatReport.edtRemark.Value         := tbReports['Remark'];
    frmDatReport.edtSQLText.Text         := VarToStr(tbReports['SQLText']);
    frmDatReport.edtCode.Enabled := False;
    if (frmDatReport.ShowModal <> mrOk) then Exit;

    tbReports.Close;
    tbReports.Open;
    tbReports.Locate('Code', R, []);
  finally
    frmDatReport.Free;
  end;
end;

procedure TfrmReports.acDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbReports.IsEmpty then Exit;

  if (tbReports.FieldByName('Code').AsInteger < 100) and
     (not glSetup.IsSysAdmin) then
  begin
    ShowMessage('Запрещено удалить системный отчет');
    Exit;
  end;

  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbReports.FieldByName('Code').AsInteger;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    Cmd := 'Delete from R_Reports Where Code = '+IntToStr(R);
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    tbReports.Prior;
    if (not tbReports.Bof) then
        R := tbReports.FieldByName('Code').AsInteger;
    tbReports.Close;
    tbReports.Open;
    tbReports.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Отчеты. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmReports.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmReports.acUserReportExecute(Sender: TObject);
var S: String;
var IsDate: Boolean;
var DateBeg, DateEnd: TDateTime;
begin
  S := Trim(tbReports.FieldByName('SQLText').AsString);

  if S = '' then
  begin
    Application.MessageBox('Строка запроса пуста','Ошибка',MB_OK);
    Exit;
  end;

  IsDate := tbReports.FieldByName('IsPeriod').AsBoolean;
  if IsDate then
  begin
    frmDlgPeriod := TFrmDlgPeriod.Create(Owner);
    try
      if frmDlgPeriod.ShowModal <> mrOk then Exit;
      DateEnd := frmDlgPeriod.dtEDate.Value;
      DateBeg := frmDlgPeriod.dtSDate.Value;
    finally
      frmDlgPeriod.Free;
    end;
  end;

  frmRepGrid := TFrmRepGrid.Create(Owner);
  try
    frmRepGrid.QryReport.SQL.Text := S;
    if frmRepGrid.QryReport.ParamCount = 1 then
    begin
      frmRepGrid.QryReport.Params[0].Value := DateEnd;
    end;
    if frmRepGrid.QryReport.ParamCount > 1 then
    begin
      frmRepGrid.QryReport.Params[0].Value := DateBeg;
      frmRepGrid.QryReport.Params[1].Value := DateEnd;
    end;
    frmRepGrid.Caption := tbReports.FieldByName('Name').AsString;
    frmRepGrid.ShowModal;
  finally
    frmRepGrid.Free;
  end;
end;

procedure TfrmReports.acExecuteExecute(Sender: TObject);
begin
  if tbReports.IsEmpty then Exit;

  acUserReport.Execute;
end;

procedure TfrmReports.FormShow(Sender: TObject);
begin
  if (not glSetup.IsSysAdmin) and
     (not glSetup.IsProAdmin) then
  begin
    acAdd.Visible    := False;
    acEdit.Visible   := False;
    acDelete.Visible := False;

    acAdd.Enabled    := False;
    acEdit.Enabled   := False;
    acDelete.Enabled := False;
  end;
  if tbReports.Active then tbReports.Close;
  if glSetup.IsSysAdmin then
     tbReports.SQL.Text := 'Select * from V_Reports Order by Code'
  else
     tbReports.SQL.Text := 'Select * from V_Reports Where (IsHide = False) or (IsHide is null) Order by Code';
  tbReports.Open;
end;

procedure TfrmReports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbReports.Close;
end;

procedure TfrmReports.btvReportsKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = VK_RETURN then acExecute.Execute;
end;

end.
