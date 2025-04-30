unit R_CallTypes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DBGridEh, ExtCtrls,
  Buttons, DBGridEhGrouping, StdCtrls, GridsEh;

type
  TfrmCallTypes = class(TForm)
    Panel2: TPanel;
    dbgRefer: TDBGridEh;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
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
  frmCallTypes: TfrmCallTypes;

implementation

uses DBDatas, DatCallType, Globals;

{$R *.dfm}

procedure TfrmCallTypes.acAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatCallType := TFrmDatCallType.Create(Owner);
  try
    frmDatCallType.RecStatus := RS_INSERT;
    if (frmDatCallType.ShowModal <> mrOk) then Exit;

    R := frmDatCallType.Code;
    DMain.tbCallTypes.Close;
    DMain.tbCallTypes.Open;
    DMain.tbCallTypes.Locate('Code', R, []);
  finally
    frmDatCallType.Free;
  end;
end;

procedure TfrmCallTypes.acEditExecute(Sender: TObject);
var R: Integer;
begin
  if DMain.tbCallTypes.IsEmpty then Exit;

  R := DMain.tbCallTypes.FieldByName('Code').AsInteger;
  frmDatCallType := TFrmDatCallType.Create(Owner);
  try
    frmDatCallType.RecStatus := RS_EDIT;
    frmDatCallType.Code := R;
    frmDatCallType.edtCode.Enabled := False;
    frmDatCallType.edtCode.Value := DMain.tbCallTypes['Code'];
    frmDatCallType.edtName.Value := DMain.tbCallTypes['Name'];
    frmDatCallType.edtIsEmailSend.Checked := DMain.tbCallTypes.FieldByName('IsEmailSend').AsBoolean;
    frmDatCallType.edtEmailTo.Text        := DMain.tbCallTypes['EMailTo'];
    frmDatCallType.edtEmailCopy.Text      := DMain.tbCallTypes['EMailCopy'];
    if (frmDatCallType.ShowModal <> mrOk) then Exit;

    DMain.tbCallTypes.Close;
    DMain.tbCallTypes.Open;
    DMain.tbCallTypes.Locate('Code', R, []);
  finally
    frmDatCallType.Free;
  end;
end;

procedure TfrmCallTypes.acDeleteExecute(Sender: TObject);
var Cmd: String;
var R: Integer;
begin
  if DMain.tbCallTypes.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный запис?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := DMain.tbCallTypes.FieldByName('Code').AsInteger;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    Cmd := 'Delete from R_CallTypes Where Code = '+IntToStr(R);
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    DMain.tbCallTypes.Prior;
    if (not DMain.tbCallTypes.Bof) then
        R := DMain.tbCallTypes.FieldByName('Code').AsInteger;
    DMain.tbCallTypes.Close;
    DMain.tbCallTypes.Open;
    DMain.tbCallTypes.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Спр. видов обращений. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmCallTypes.acCloseExecute(Sender: TObject);
begin
  Close;
end;

end.
