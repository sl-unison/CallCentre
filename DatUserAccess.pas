unit DatUserAccess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBGridEh, StdCtrls, Buttons, DBCtrlsEh, Mask,
  DBLookupEh;

type
  TfrmDatUserAccess = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtTableName: TDBLookupComboboxEh;
    edtIsAccess: TDBCheckBoxEh;
    edtIsAdd: TDBCheckBoxEh;
    edtIsEdit: TDBCheckBoxEh;
    edtIsDelete: TDBCheckBoxEh;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    RRowID: Integer;
    UserLogin: String;
  end;

var
  frmDatUserAccess: TfrmDatUserAccess;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatUserAccess.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SqlInsert('R_Accesses',
                  ['Login',
                   'TableName','IsAccess','IsAdd','IsEdit','IsDelete'],
                  [QuotedStr(UserLogin),
                   QuotedStr(Copy(VarToStr(edtTableName.KeyValue),1,35)),
                   BoolToStr(edtIsAccess.Checked, True),
                   BoolToStr(edtIsAdd.Checked, True),
                   BoolToStr(edtIsEdit.Checked, True),
                   BoolToStr(edtIsDelete.Checked, True)]);
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.AdsCn.Rollback;
        ShowMessage('Ошибка вставки новой записи: '+E.Message);
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_Accesses',
                  ['IsAccess','IsAdd','IsEdit','IsDelete'],
                  [BoolToStr(edtIsAccess.Checked, True),
                   BoolToStr(edtIsAdd.Checked, True),
                   BoolToStr(edtIsEdit.Checked, True),
                   BoolToStr(edtIsDelete.Checked, True)],
                  'RRowID = '+IntToStr(RRowID));
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.AdsCn.Rollback;
        ShowMessage('Ошибка вставки новой записи: '+E.Message);
      end;
    end;
  end;
end;

procedure TfrmDatUserAccess.FormShow(Sender: TObject);
begin
  if not DMain.tbSysTables.Active then DMain.tbSysTables.Open;
end;

procedure TfrmDatUserAccess.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DMain.tbSysTables.Active then DMain.tbSysTables.Close;
end;

procedure TfrmDatUserAccess.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
