unit S_Calles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ActnList, adsdata, adstable, cxGridLevel,
  cxGridCustomTableView, cxGridDBTableView, cxGrid, DBCtrlsEh, StdCtrls, ComCtrls, Buttons,
  cxGridExportLink, ComObj, ExtCtrls, DBLookupEh, DBGridEh, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, adsfunc, cxGridTableView,
  cxClasses, cxGridCustomView, Mask, cxGridCustomPopupMenu, cxGridPopupMenu,
  Menus, cxNavigator;

type
  TfrmCalles = class(TForm)
    pnlSearch: TPanel;
    Panel4: TPanel;
    BitBtn4: TBitBtn;
    PageCtrl: TPageControl;
    TSheetMain: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    edtDateStart: TDBDateTimeEditEh;
    edtDateEnd: TDBDateTimeEditEh;
    edtSysUser: TDBEditEh;
    TSheetAddon: TTabSheet;
    Panel7: TPanel;
    Panel2: TPanel;
    cxGridCalles: TcxGrid;
    btvCalles: TcxGridDBTableView;
    cxGridCallesLevel1: TcxGridLevel;
    pnlActions: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn1: TBitBtn;
    btvCallesRRowID: TcxGridDBColumn;
    btvCallesSysTime: TcxGridDBColumn;
    btvCallesSysUser: TcxGridDBColumn;
    btvCallesCallTime: TcxGridDBColumn;
    btvCallesCallType: TcxGridDBColumn;
    btvCallesCallTypeName: TcxGridDBColumn;
    btvCallesCallRegion: TcxGridDBColumn;
    btvCallesCallRegionName: TcxGridDBColumn;
    btvCallesCallPhone: TcxGridDBColumn;
    btvCallesCallNote: TcxGridDBColumn;
    btvCallesCallAnswer: TcxGridDBColumn;
    edtCallType: TDBLookupComboboxEh;
    edtCallRegion: TDBLookupComboboxEh;
    ActionList1: TActionList;
    acCallAdd: TAction;
    acCallDelete: TAction;
    acClose: TAction;
    BitBtn7: TBitBtn;
    acExcel: TAction;
    Panel8: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edtRegStart: TDBDateTimeEditEh;
    edtRegEnd: TDBDateTimeEditEh;
    edtCallPhone: TDBEditEh;
    edtCallAnswer: TDBEditEh;
    edtCallID: TDBNumberEditEh;
    Label10: TLabel;
    acSearch: TAction;
    acGridBestFit: TAction;
    srCalles: TDataSource;
    tbCalles: TAdsQuery;
    tbCallesRRowID: TIntegerField;
    tbCallesSysTime: TDateTimeField;
    tbCallesCallTime: TDateTimeField;
    tbCallesCallType: TIntegerField;
    tbCallesCallRegion: TIntegerField;
    acCallAddByTemplate: TAction;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    acSearchClear: TAction;
    btvCallesUserName: TcxGridDBColumn;
    tbCallesSysUser: TWideStringField;
    tbCallesUserName: TWideStringField;
    tbCallesCallTypeName: TWideStringField;
    tbCallesCallRegionName: TWideStringField;
    tbCallesCallPhone: TWideStringField;
    tbCallesCallNote: TWideMemoField;
    tbCallesCallAnswer: TWideStringField;
    cxGridPopupMenu1: TcxGridPopupMenu;
    Panel9: TPanel;
    BitBtn5: TBitBtn;
    BitBtn8: TBitBtn;
    acSrvActions: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    MSExcel1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    BitBtn9: TBitBtn;
    acCallDutyReport: TAction;
    acSrvSearch: TAction;
    BitBtn12: TBitBtn;
    N5: TMenuItem;
    N8: TMenuItem;
    BitBtn13: TBitBtn;
    acCallSendAgain: TAction;
    acCallEdit: TAction;
    procedure NullifySearchParams();
    procedure acCallAddExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acCloseExecute(Sender: TObject);
    procedure acCallEditExecute(Sender: TObject);
    procedure acCallDeleteExecute(Sender: TObject);
    procedure acGridBestFitExecute(Sender: TObject);
    procedure acSearchExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acExcelExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acCallAddByTemplateExecute(Sender: TObject);
    procedure acSearchClearExecute(Sender: TObject);
    procedure acSrvActionsExecute(Sender: TObject);
    procedure acCallDutyReportExecute(Sender: TObject);
    procedure acSrvSearchExecute(Sender: TObject);
    procedure acCallSendAgainExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalles: TfrmCalles;

implementation

uses
  DBDatas, DatCall, Globals, R_CallTemplates;

{$R *.dfm}

procedure TfrmCalles.NullifySearchParams();
begin
  edtCallID.Value := null;
  edtDateStart.Value := null;
  edtDateEnd.Value := null;
end;

procedure TfrmCalles.acSearchClearExecute(Sender: TObject);
begin
  edtCallID.Value        := null;
  edtDateStart.Value     := null;
  edtDateEnd.Value       := null;
  edtCallType.KeyValue   := null;
  edtRegStart.Value      := null;
  edtRegEnd.Value        := null;
  edtCallType.KeyValue   := null;
  edtCallAnswer.Value    := null;
  edtSysUser.Value       := null;
  edtCallRegion.KeyValue := null;
  edtCallPhone.Value     := null;
end;

procedure TfrmCalles.acSearchExecute(Sender: TObject);
var Cmd, W: String;
begin
  Cmd := 'Select top '+IntToStr(glSetup.RecAmount)+' * from V_Calles ';
  W := '';
  try
    if (VarIsNull(edtDateStart.Value)) and (not VarIsNull(edtDateEnd.Value)) then
        edtDateStart.Value := edtDateEnd.Value - 1;
    if (not VarIsNull(edtDateStart.Value)) and (VarIsNull(edtDateEnd.Value)) then
        edtDateEnd.Value := edtDateStart.Value + 1;

    if (edtDateStart.Value <> null) and (edtDateEnd.Value <> null) then
       W := W + ' and (CallTime between '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd 00:00:00', edtDateStart.Value))+' and '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd 23:59:59', edtDateEnd.Value))+')';
    if (Trim(edtSysUser.Text) <> '') then
       W := W + ' and (SysUser like '+QuotedStr(Trim(edtSysUser.Text)+'%')+')';
    if (edtCallType.KeyValue <> null) then
       W := W + ' and (CallType = '+VarToStr(edtCallType.KeyValue)+')';
    if (edtCallRegion.KeyValue <> null) then
       W := W + ' and (CallRegion = '+VarToStr(edtCallRegion.KeyValue)+')';

    if (VarIsNull(edtRegStart.Value)) and (not VarIsNull(edtRegEnd.Value)) then
        edtRegStart.Value := edtRegEnd.Value - 1;
    if (not VarIsNull(edtRegStart.Value)) and (VarIsNull(edtRegEnd.Value)) then
        edtRegEnd.Value := edtRegStart.Value + 1;

    if ((edtRegStart.Value) <> null) and ((edtRegEnd.Value) <> null) then
       W := W + ' and (SysTime between '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd 00:00:00', edtRegStart.Value))+' and '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd 23:59:59', edtRegEnd.Value))+')';
    if (Trim(edtCallPhone.Text) <> '') then
       W := W + ' and (CallPhone like '+QuotedStr(Trim(edtCallPhone.Text)+'%')+')';
    if (Trim(edtCallID.Text) <> '') then
       W := W + ' and (RRowID = '+VarToStr(edtCallID.Value)+')';
    if (Trim(edtCallAnswer.Text) <> '') then
       W := W + ' and (CallAnswer like '+QuotedStr(Trim(edtCallAnswer.Text)+'%')+')';

    if W <> '' then W := ' Where ' + Copy(W, 6, Length(W));
    tbCalles.SQL.Text := Cmd + W + ' Order by SysTime Desc';
    if tbCalles.Active then tbCalles.Close;
    tbCalles.Open;
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Список обращений. Поиск данных', E, Cmd));
  end;
end;

procedure TfrmCalles.acCallAddByTemplateExecute(Sender: TObject);
var UA: TUAccess;
var R: Integer;
begin
  uf_GetAccessTypes(TBR_CALLTEMPLATES, UA);
  if not UA.IsAccess then
  begin
    ShowMessage('У вас нет доступа к этой функциональности');
    Exit;
  end;
  frmCallTemplates := TfrmCallTemplates.Create(Owner);
  try
    frmCallTemplates.acAdd.Enabled    := UA.IsAdd;
    frmCallTemplates.acEdit.Enabled   := UA.IsEdit;
    frmCallTemplates.acDelete.Enabled := UA.IsDelete;
    if (frmCallTemplates.ShowModal <> mrOk) then Exit;

    frmDatCall := TfrmDatCall.Create(Owner);
    try
      frmDatCall.RecStatus := RS_INSERT;
      frmDatCall.edtSysTime.Value := Now();
      frmDatCall.edtCallTime.Value := Now();
      frmDatCall.edtCallType.KeyValue:= frmCallTemplates.SelCallType;
      frmDatCall.edtCallNote.Text    := frmCallTemplates.SelCallNote;
      frmDatCall.edtCallAnswer.Value := frmCallTemplates.SelCallAnswer;
      if (frmDatCall.ShowModal <> mrOk) then Exit;

      R := frmDatCall.RRowID;
      uf_SendInfoByEMail(R);
      NullifySearchParams;
      edtCallID.Value := R;
      acSearch.Execute;
    finally
      frmDatCall.Free;
    end;
  finally
    frmCallTemplates.Free;
  end;
end;

procedure TfrmCalles.acCallAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatCall := TfrmDatCall.Create(Owner);
  try
    frmDatCall.edtSysTime.Value := Now();
    frmDatCall.edtCallTime.Value := Now();
    frmDatCall.RecStatus := RS_INSERT;
    if (frmDatCall.ShowModal <> mrOk) then Exit;

    R := frmDatCall.RRowID;
    uf_SendInfoByEMail(R);
    NullifySearchParams;
    edtCallID.Value := R;
    acSearch.Execute;
  finally
    frmDatCall.Free;
  end;
end;

procedure TfrmCalles.acCallEditExecute(Sender: TObject);
var R: Integer;
begin
  if tbCalles.IsEmpty then Exit;

  R := tbCalles.FieldByName('RRowID').AsInteger;
  frmDatCall := TfrmDatCall.Create(Owner);
  try
    frmDatCall.RRowID := R;
    frmDatCall.edtSysTime.Value       := tbCalles['SysTime'];
    frmDatCall.edtCallTime.Value      := tbCalles['CallTime'];
    frmDatCall.edtCallPhone.Value     := tbCalles['CallPhone'];
    frmDatCall.edtCallType.Value      := tbCalles['CallType'];
    frmDatCall.edtCallRegion.Value    := tbCalles['CallRegion'];
    frmDatCall.edtCallAnswer.Value    := tbCalles['CallAnswer'];
    frmDatCall.edtCallNote.Lines.Text := tbCalles['CallNote'];
    frmDatCall.RecStatus := RS_EDIT;
    if (frmDatCall.ShowModal <> mrOk) then Exit;

    tbCalles.Close;
    tbCalles.Open;
    tbCalles.Locate('RRowID',R, []);
  finally
    frmDatCall.Free;
  end;
end;

procedure TfrmCalles.acCallSendAgainExecute(Sender: TObject);
var R: Integer;
begin
  if MessageDlg('Вы уверены что хотите заново отправить сообщение адресатам?',
                mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  if tbCalles.IsEmpty then Exit;

  R := tbCalles.FieldByName('RRowID').AsInteger;
  if uf_SendInfoByEMail(R) then
     ShowMessage('Сообщение повторно отправлено');
end;

procedure TfrmCalles.acCallDeleteExecute(Sender: TObject);
var R: Integer;
var Cmd: String;
begin
  if tbCalles.IsEmpty then Exit;
  if MessageDlg('Вы уверены что хотите удалить выбранный запись?',mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbCalles.FieldByName('RRowID').AsInteger;
    Cmd := 'Delete from S_Calles Where RRowID = '+IntTostr(R);
    DMain.AdsCn.Execute(Cmd);
    tbCalles.Prior;
    if (not tbCalles.Bof) then
        R := tbCalles.FieldByName('RRowID').AsInteger;
    tbCalles.Close;
    tbCalles.Open;
    tbCalles.Locate('RRowID', R, []);
  except
    on E: Exception do
    begin
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Реестр обращений. Удаление записи реестра', E, Cmd));
    end;
  end;
end;

procedure TfrmCalles.acCallDutyReportExecute(Sender: TObject);
var Cmd, User, FName : String;
var i, R: Integer;
begin
  if MessageDlg('Вы уверены что хотите отправить отчет о дежурстве?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  if tbCalles.Active then tbCalles.Close;
  try
    User := DMain.AdsCn.Username;
    Cmd := 'Select * from V_Calles Where (SysUser Like '+QuotedStr(User+'%')+') and '+
                    '(SysTime between '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd 00:00:00', Now()-1))+' and '+
                      QuotedStr(FormatDateTime('yyyy-mm-dd hh:mm:ss', Now()))+')';
    tbCalles.SQL.Text := Cmd;
    if (tbCalles.FindField('CallType') <> nil) then
        tbCalles.FieldByName('CallType').Visible := False;
    if (tbCalles.FindField('CallRegion') <> nil) then
        tbCalles.FieldByName('CallRegion').Visible := False;
    if (tbCalles.FindField('CallRegionName') <> nil) then
        tbCalles.FieldByName('CallRegionName').Visible := False;

    tbCalles.Open;
    btvCalles.ClearItems;
    btvCalles.DataController.CreateAllItems();
    btvCalles.DataController.Refresh;
    for i := 0 to btvCalles.ColumnCount - 1 do
    begin
      btvCalles.Columns[i].HeaderAlignmentHorz := taCenter;
      btvCalles.Columns[i].HeaderAlignmentVert := vaCenter;
    end;
    btvCalles.ApplyBestFit();

    FName := glSetup.RepPath+'Call_'+FormatDateTime('yyyymmdd_hhmmss', Now())+'.xls';
    ExportGridToExcel(FName, cxGridCalles);

    R := uf_GetRRowID('S_Calles');
    Cmd := SQLInsert('S_Calles',
                    ['RRowID','SysTime','SysUser',
                     'CallTime','CallType',
                     'CallPhone','CallNote','CallAnswer','CallFile'],
                    [IntToStr(R),
                     uf_DateToStr(now(), 'YYYY-MM-DD hh:mm:ss'),
                     QuotedStr(Copy(DMain.AdsCn.Username, 1, 20)),
                     uf_DateToStr(Now(), 'YYYY-MM-DD hh:mm:ss'),
                     IntToStr(glSetup.DutyRepTaskNo),
                     QuotedStr(Copy(glSetup.Phones, 1, 20)),
                     QuotedStr('Отчет о дежурстве'),
                     QuotedStr('Отчет о дежурстве'),
                     QuotedStr(ExtractFileName(FName))]);
    DMain.AdsCn.Execute(Cmd);
    uf_SendInfoByEMail(R);
  except
    on E: Exception do
       ShowMessage(uf_ErrorToLog('Отчет о дежурстве', E, Cmd));
  end;
end;

procedure TfrmCalles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbCalles.Active then tbCalles.Close;
  Action := caFree;
end;

procedure TfrmCalles.FormCreate(Sender: TObject);
begin
  WindowState := wsMaximized;
end;

procedure TfrmCalles.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalles.acGridBestFitExecute(Sender: TObject);
begin
  btvCalles.ApplyBestFit();
end;

procedure TfrmCalles.acSrvActionsExecute(Sender: TObject);
begin
  if pnlActions.Visible then
     pnlActions.Visible := False
  else
     pnlActions.Visible := True;
end;

procedure TfrmCalles.acSrvSearchExecute(Sender: TObject);
begin
  if pnlSearch.Visible then
     pnlSearch.Visible := False
  else
     pnlSearch.Visible := True;
end;

procedure TfrmCalles.FormShow(Sender: TObject);
begin
  PageCtrl.ActivePageIndex := 0;

  if (not glSetup.IsAdmin) and (not glSetup.IsCallAdd) then
     acCallAdd.Enabled := False;
  if (not glSetup.IsAdmin) and (not glSetup.IsCallEdit) then
     acCallEdit.Enabled := False;
  if (not glSetup.IsAdmin) and (not glSetup.IsCallDelete) then
     acCallDelete.Enabled := False;
  if (not glSetup.IsAdmin) and (not glSetup.IsCallExcel) then
     acExcel.Enabled := False;

  if tbCalles.Active then tbCalles.Close;
end;

procedure TfrmCalles.acExcelExecute(Sender: TObject);
var ODlg: TSaveDialog;
var obXL: Variant;
var Wb: Variant;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then
    begin
      ExportGridToExcel(ODlg.FileName, cxGridCalles);
      obXL := CreateOleObject('Excel.Application');
      obXL.Visible := True;
      Wb := obXL.WorkBooks.Open(ODlg.FileName);
    end;
  finally
    ODlg.Free;
  end;
end;

end.
