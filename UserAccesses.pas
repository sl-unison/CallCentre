unit UserAccesses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, GridsEh, DBGridEh, ExtCtrls, StdCtrls,
  Buttons, DB, adsdata, adsfunc, adstable, ActnList;

type
  TfrmUserAccesses = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    tbAccesses: TAdsQuery;
    srAccesses: TDataSource;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acClose: TAction;
    tbAccessesIsAccess: TBooleanField;
    tbAccessesIsAdd: TBooleanField;
    tbAccessesIsEdit: TBooleanField;
    tbAccessesIsDelete: TBooleanField;
    tbAccessesRRowID: TIntegerField;
    tbAccessesLogin: TWideStringField;
    tbAccessesTableName: TWideStringField;
    tbAccessesTableDesc: TWideStringField;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    UserLogin: String;
  end;

var
  frmUserAccesses: TfrmUserAccesses;

implementation

uses
  DatUserAccess, Globals, DBDatas;

{$R *.dfm}

procedure TfrmUserAccesses.acAddExecute(Sender: TObject);
var S: String;
begin
  frmDatUserAccess := TfrmDatUserAccess.Create(Owner);
  try
    frmDatUserAccess.RecStatus := RS_INSERT;
    frmDatUserAccess.UserLogin := UserLogin;
    if (frmDatUserAccess.ShowModal <> mrOk) then Exit;

    S := VarToStr(frmDatUserAccess.edtTableName.KeyValue);
    tbAccesses.Close;
    tbAccesses.Open;
    tbAccesses.Locate('TableName', S, []);
  finally
    frmDatUserAccess.Free;
  end;
end;

procedure TfrmUserAccesses.acEditExecute(Sender: TObject);
var S: String;
var R: Integer;
begin
  if tbAccesses.IsEmpty then Exit;

  R := tbAccesses.FieldByName('RRowID').AsInteger;
  S := tbAccesses.FieldByName('TableName').AsString;
  frmDatUserAccess := TfrmDatUserAccess.Create(Owner);
  try
    frmDatUserAccess.RecStatus := RS_EDIT;
    frmDatUserAccess.UserLogin := UserLogin;
    frmDatUserAccess.RRowID := R;
    frmDatUserAccess.edtTableName.KeyValue := S;
    frmDatUserAccess.edtTableName.Enabled  := False;
    frmDatUserAccess.edtIsAccess.Checked := tbAccesses.FieldByName('IsAccess').AsBoolean;
    frmDatUserAccess.edtIsAdd.Checked    := tbAccesses.FieldByName('IsAdd').AsBoolean;
    frmDatUserAccess.edtIsEdit.Checked   := tbAccesses.FieldByName('IsEdit').AsBoolean;
    frmDatUserAccess.edtIsDelete.Checked := tbAccesses.FieldByName('IsDelete').AsBoolean;
    if (frmDatUserAccess.ShowModal <> mrOk) then Exit;

    tbAccesses.Close;
    tbAccesses.Open;
    tbAccesses.Locate('TableName', S, []);
  finally
    frmDatUserAccess.Free;
  end;
end;

procedure TfrmUserAccesses.acDeleteExecute(Sender: TObject);
var Cmd: String;
var R: Integer;
begin
  if tbAccesses.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный запис?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := tbAccesses.FieldByName('RRowID').AsInteger;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    Cmd := 'Delete from R_Accesses Where RRowID = '+IntToStr(R);
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    if (not tbAccesses.Bof) then
        R := tbAccesses.FieldByName('Code').AsInteger;
    tbAccesses.Close;
    tbAccesses.Open;
    tbAccesses.Locate('RRowID', R, []);
  except
    on E: Exception do
    begin
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Таблица доступов. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmUserAccesses.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmUserAccesses.FormShow(Sender: TObject);
begin
  if tbAccesses.Active then tbAccesses.Close;
  tbAccesses.SQL.Text := 'Select * from V_Accesses Where Login = '+
                         QuotedStr(UserLogin)+' Order by TableName';
  tbAccesses.Open;
end;

procedure TfrmUserAccesses.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tbAccesses.Active then tbAccesses.Close;
end;

end.
