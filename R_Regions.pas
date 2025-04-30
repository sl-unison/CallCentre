unit R_Regions;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEh, ActnList,
  ExtCtrls, Buttons, DBGridEhGrouping, GridsEh, StdCtrls;

type
  TfrmRegions = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Panel2: TPanel;
    dbGridFinProf: TDBGridEh;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acClose: TAction;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegions: TfrmRegions;

implementation

uses
  DBDatas, DatRegion, Globals;

{$R *.dfm}

procedure TfrmRegions.acAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatRegion := TfrmDatRegion.Create(Owner);
  try
    frmDatRegion.RecStatus := RS_INSERT;
    if (frmDatRegion.ShowModal <> mrOk) then Exit;

    R := frmDatRegion.Code;
    DMain.tbRegions.Close;
    DMain.tbRegions.Open;
    DMain.tbRegions.Locate('Code', R, []);
  finally
    frmDatRegion.Free;
  end;
end;

procedure TfrmRegions.acEditExecute(Sender: TObject);
var R: Integer;
begin
  if DMain.tbRegions.IsEmpty then Exit;

  R := DMain.tbRegions.FieldByName('Code').AsInteger;
  frmDatRegion := TfrmDatRegion.Create(Owner);
  try
    frmDatRegion.RecStatus := RS_EDIT;
    frmDatRegion.Code := R;
    frmDatRegion.edtCode.Enabled := False;
    frmDatRegion.edtCode.Value := DMain.tbRegions['Code'];
    frmDatRegion.edtName.Value := DMain.tbRegions['Name'];
    if (frmDatRegion.ShowModal <> mrOk) then Exit;

    DMain.tbRegions.Close;
    DMain.tbRegions.Open;
    DMain.tbRegions.Locate('Code', R, []);
  finally
    frmDatRegion.Free;
  end;
end;

procedure TfrmRegions.acDeleteExecute(Sender: TObject);
var Cmd: String;
var R: Integer;
begin
  if DMain.tbRegions.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный запис?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := DMain.tbRegions.FieldByName('Code').AsInteger;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    Cmd := 'Delete from R_Regions Where Code = '+IntToStr(R);
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    if (not DMain.tbRegions.Bof) then
        R := DMain.tbRegions.FieldByName('Code').AsInteger;
    DMain.tbRegions.Close;
    DMain.tbRegions.Open;
    DMain.tbRegions.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Спр. регионов. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmRegions.acCloseExecute(Sender: TObject);
begin
  Close;
end;

end.
