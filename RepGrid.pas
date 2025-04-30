unit RepGrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, cxGridLevel, cxClasses, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ActnList, ComObj, cxGridExportLink,
  cxGridPopupMenu, Buttons, dxPSCore, SMEWiz, adstable, adsdata,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev,
  dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore,
  dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, adsfunc, ExportDS, dxPScxCommon,
  cxGridCustomPopupMenu, StdCtrls, cxGridCustomView, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk;

type
  TfrmRepGrid = class(TForm)
    Panel1: TPanel;
    cxGridUni: TcxGrid;
    btvUniTable: TcxGridDBTableView;
    cxGridUniLevel1: TcxGridLevel;
    ActionList1: TActionList;
    acExcel: TAction;
    acClose: TAction;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    acPrint: TAction;
    dxPrintGrid: TdxComponentPrinter;
    dxPrintGridLink1: TdxGridReportLink;
    acExport: TAction;
    BitBtn4: TBitBtn;
    SMEWizardDlgRep: TSMEWizardDlg;
    QryReport: TAdsQuery;
    srQryReport: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acExcelExecute(Sender: TObject);
    procedure acPrintExecute(Sender: TObject);
    procedure acExportExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRepGrid: TfrmRepGrid;

implementation


{$R *.dfm}

procedure TfrmRepGrid.FormShow(Sender: TObject);
var i: Integer;
begin
   if QryReport.Active then QryReport.Close;
   QryReport.Open;
   btvUniTable.DataController.CreateAllItems();
   for i := 0 to btvUniTable.ColumnCount - 1 do
   begin
      btvUniTable.Columns[i].HeaderAlignmentHorz := taCenter;
      btvUniTable.Columns[i].HeaderAlignmentVert := vaCenter;
      if btvUniTable.Columns[i].DataBinding.Field.DataType = ftCurrency then
      begin
//         btvUniTable.DataController.Summary.FooterSummaryItems.Items[i].Kind := skSum;
//         btvUniTable.DataController.Summary.FooterSummaryItems.Items[i].Field.Index := i;
//         btvUniTable.DataController.Summary.col
//         btvUniTable.Columns[i].Summary.FooterKind := skSum;
//         btvUniTable.Columns[i].Summary.GroupFooterKind := skSum;
      end;
   end;
   btvUniTable.ApplyBestFit();
end;

procedure TfrmRepGrid.acCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmRepGrid.acExcelExecute(Sender: TObject);
var ODlg: TSaveDialog;
var obXL: Variant;
var Wb: Variant;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then
    begin
       ExportGridToExcel(ODlg.FileName, cxGridUni );
       obXL := CreateOleObject('Excel.Application');
       obXL.Visible := True;
       Wb := obXL.WorkBooks.Open(ODlg.FileName);
    end;
  finally
    ODlg.Free;
  end;
end;

procedure TfrmRepGrid.acPrintExecute(Sender: TObject);
begin
   dxPrintGrid.Preview();
end;

procedure TfrmRepGrid.acExportExecute(Sender: TObject);
begin
   SMEWizardDlgRep.Execute;
end;

end.
