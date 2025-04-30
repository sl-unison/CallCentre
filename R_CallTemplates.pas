unit R_CallTemplates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEhGrouping, ActnList, GridsEh, DBGridEh, StdCtrls,
  Buttons;

type
  TfrmCallTemplates = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    ActionList1: TActionList;
    acAdd: TAction;
    acEdit: TAction;
    acDelete: TAction;
    acSelect: TAction;
    acClose: TAction;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure acSelectExecute(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    SelCallType: Integer;
    SelCallNote: String;
    SelCallAnswer: String;
  end;

var
  frmCallTemplates: TfrmCallTemplates;

implementation

uses DBDatas, DatCallTemplate, Globals;

{$R *.dfm}

procedure TfrmCallTemplates.acAddExecute(Sender: TObject);
var R: Integer;
begin
  frmDatCallTemplate := TfrmDatCallTemplate.Create(Owner);
  try
    frmDatCallTemplate.RecStatus := RS_INSERT;
    if (frmDatCallTemplate.ShowModal <> mrOk) then Exit;

    R := frmDatCallTemplate.Code;
    DMain.tbCallTemplates.Close;
    DMain.tbCallTemplates.Open;
    DMain.tbCallTemplates.Locate('Code', R, []);
  finally
    frmDatCallTemplate.Free;
  end;
end;

procedure TfrmCallTemplates.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmCallTemplates.acDeleteExecute(Sender: TObject);
var Cmd: String;
var R: Integer;
begin
  if DMain.tbCallTemplates.IsEmpty then Exit;

  if MessageDlg('Вы уверены что хотите удалить выбранный запис?',
     mtWarning,[mbYes,mbNo],0) = mrNo then
     Exit;

  try
    R := DMain.tbCallTemplates.FieldByName('Code').AsInteger;
    if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
    DMain.AdsCn.BeginTransaction;
    Cmd := 'Delete from R_CallTemplates Where Code = '+IntToStr(R);
    DMain.AdsCn.Execute(Cmd);
    DMain.AdsCn.Commit;
    if (not DMain.tbCallTemplates.Bof) then
        R := DMain.tbCallTemplates.FieldByName('Code').AsInteger;
    DMain.tbCallTemplates.Close;
    DMain.tbCallTemplates.Open;
    DMain.tbCallTemplates.Locate('Code', R, []);
  except
    on E: Exception do
    begin
      DMain.AdsCn.Rollback;
      ShowMessage(uf_ErrorToLog('Спр. шаблонов. Удаление записи', E, Cmd));
    end;
  end;
end;

procedure TfrmCallTemplates.acEditExecute(Sender: TObject);
var R: Integer;
begin
  if DMain.tbCallTemplates.IsEmpty then Exit;

  R := DMain.tbCallTemplates.FieldByName('Code').AsInteger;
  frmDatCallTemplate := TfrmDatCallTemplate.Create(Owner);
  try
    frmDatCallTemplate.RecStatus := RS_EDIT;
    frmDatCallTemplate.Code := R;
    frmDatCallTemplate.edtCode.Enabled := False;
    frmDatCallTemplate.edtCode.Value        := DMain.tbCallTemplates['Code'];
    frmDatCallTemplate.edtCallType.KeyValue := DMain.tbCallTemplates['CallType'];
    frmDatCallTemplate.edtCallAnswer.Value  := DMain.tbCallTemplates['CallAnswer'];
    frmDatCallTemplate.edtCallNote.Value    := DMain.tbCallTemplates['CallNote'];
    if (frmDatCallTemplate.ShowModal <> mrOk) then Exit;

    R := frmDatCallTemplate.Code;
    DMain.tbCallTemplates.Close;
    DMain.tbCallTemplates.Open;
    DMain.tbCallTemplates.Locate('Code', R, []);
  finally
    frmDatCallTemplate.Free;
  end;
end;

procedure TfrmCallTemplates.acSelectExecute(Sender: TObject);
begin
  if DMain.tbCallTemplates.IsEmpty then Exit;

  SelCallType := DMain.tbCallTemplates.FieldByName('CallType').AsInteger;
  SelCallNote := DMain.tbCallTemplates.FieldByName('CallNote').AsString;
  SelCallAnswer := DMain.tbCallTemplates.FieldByName('CallAnswer').AsString;
  ModalResult := mrOk;
end;

end.
