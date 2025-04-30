unit SQL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ActnList, DB, adsdata, adstable, Buttons,
  cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxGridPopupMenu, SMEWiz, cxGridExportLink, ComObj,
  DBCtrlsEh, SMIWiz, ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, SMIBase, ExportDS, cxGridCustomPopupMenu,
  adsfunc, cxClasses, cxGridCustomView;

type
  TfrmSQL = class(TForm)
    ActionList1: TActionList;
    acExecute: TAction;
    acClose: TAction;
    dsSqlQuery: TAdsQuery;
    srSqlQuery: TDataSource;
    acExport: TAction;
    acExcel: TAction;
    acBestFit: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    SMExportDlg: TSMEWizardDlg;
    DlgSMIWizard: TSMIWizardDlg;
    PageCtrlMain: TPageControl;
    TSheetQuery: TTabSheet;
    TSheetLog: TTabSheet;
    Panel5: TPanel;
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    cxGridSqlQuery: TcxGrid;
    btvSqlQuery: TcxGridDBTableView;
    cxGridSqlQueryLevel1: TcxGridLevel;
    Panel4: TPanel;
    SqlMemo: TMemo;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn6: TBitBtn;
    chkIsNewRecord: TDBCheckBoxEh;
    chkIsEditRecord: TDBCheckBoxEh;
    chkIsDelRecord: TDBCheckBoxEh;
    BitBtn2: TBitBtn;
    Panel6: TPanel;
    lsbLog: TMemo;
    acImport: TAction;
    BitBtn5: TBitBtn;
    procedure acExecuteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
    procedure acExcelExecute(Sender: TObject);
    procedure acBestFitExecute(Sender: TObject);
    procedure chkIsNewRecordClick(Sender: TObject);
    procedure chkIsEditRecordClick(Sender: TObject);
    procedure chkIsDelRecordClick(Sender: TObject);
    procedure DlgSMIWizardBeforeExecute(Sender: TObject);
    procedure DlgSMIWizardErrorEvent(Sender: TObject; Error: Exception;
      var Abort: Boolean);
    procedure DlgSMIWizardGetCellParams(Sender: TObject; Field: TField;
      var Value: Variant);
    procedure acImportExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQL: TfrmSQL;

implementation


{$R *.dfm}

procedure TfrmSQL.acExecuteExecute(Sender: TObject);
var S: String;
begin
   if dsSqlQuery.Active then dsSqlQuery.Close;
   dsSqlQuery.SQL.Clear;
   dsSqlQuery.SQL.Add(SqlMemo.Text);
   dsSqlQuery.ExecSQL;
   S := UpperCase(Copy(Trim(SqlMemo.Text), 1, 6));
   if S = 'SELECT' then
   begin
      dsSqlQuery.Open;
      btvSqlQuery.DataController.CreateAllItems();
   end;
end;

procedure TfrmSQL.acCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmSQL.acExportExecute(Sender: TObject);
begin
  SMExportDlg.Execute;
end;

procedure TfrmSQL.acImportExecute(Sender: TObject);
begin
  DlgSMIWizard.Execute;
end;

procedure TfrmSQL.acExcelExecute(Sender: TObject);
var ODlg: TSaveDialog;
var obXL: Variant;
var Wb: Variant;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then
    begin
       ExportGridToExcel(ODlg.FileName, cxGridSqlQuery);
       obXL := CreateOleObject('Excel.Application');
       obXL.Visible := True;
       Wb := obXL.WorkBooks.Open(ODlg.FileName);
    end;
  finally
    ODlg.Free;
  end;
end;

procedure TfrmSQL.acBestFitExecute(Sender: TObject);
begin
  btvSqlQuery.ApplyBestFit();
end;

procedure TfrmSQL.chkIsNewRecordClick(Sender: TObject);
begin
  if chkIsNewRecord.Checked then
  begin
     btvSqlQuery.OptionsData.Inserting := True;
     btvSqlQuery.NewItemRow.Visible := True;
  end
  else
  begin
     btvSqlQuery.OptionsData.Inserting := False;
     btvSqlQuery.NewItemRow.Visible := False;
  end;
end;

procedure TfrmSQL.DlgSMIWizardBeforeExecute(Sender: TObject);
begin
  lsbLog.Clear;
end;

procedure TfrmSQL.DlgSMIWizardErrorEvent(Sender: TObject; Error: Exception;
  var Abort: Boolean);
begin
  if lsbLog.Lines.Count < 30000 then
     lsbLog.Lines.Add(Error.Message);
end;

procedure TfrmSQL.DlgSMIWizardGetCellParams(Sender: TObject; Field: TField;
  var Value: Variant);
begin
  if lsbLog.Lines.Count < 30000 then
     lsbLog.Lines.Add(Field.FieldName + ' = ' + VarToStr(Value));
end;

procedure TfrmSQL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dsSqlQuery.Active then dsSqlQuery.Close;
end;

procedure TfrmSQL.FormShow(Sender: TObject);
begin
  PageCtrlMain.ActivePageIndex := 0;
  if dsSqlQuery.Active then dsSqlQuery.Close;
end;

procedure TfrmSQL.chkIsEditRecordClick(Sender: TObject);
begin
  if chkIsEditRecord.Checked then
     btvSqlQuery.OptionsData.Editing := True
  else
     btvSqlQuery.OptionsData.Editing := False;
end;

procedure TfrmSQL.chkIsDelRecordClick(Sender: TObject);
begin
  if chkIsDelRecord.Checked then
     btvSqlQuery.OptionsData.Deleting := True
  else
     btvSqlQuery.OptionsData.Deleting := False;
end;

end.
