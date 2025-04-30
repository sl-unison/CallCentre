unit DatRegion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrlsEh, Buttons, ExtCtrls, Mask;

type
  TfrmDatRegion = class(TForm)
    Panel2: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtName: TDBEditEh;
    edtCode: TDBNumberEditEh;
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
  frmDatRegion: TfrmDatRegion;

implementation

uses
  DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatRegion.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_Regions',
                    ['Code','Name'],
                    [VarToStr(edtCode.Value),
                     QuotedStr(Copy(VarToStr(edtName.Value),1,50))]);
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      Code := edtCode.Value;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.AdsCn.Rollback;
        ShowMessage(uf_ErrorToLog('Спр. регионов. Ввод новой записи', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_Regions',
                    ['Name'],
                    [QuotedStr(Copy(VarToStr(edtName.Value),1,50))],
                    'Code = '+IntToStr(Code));
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
        ShowMessage(uf_ErrorToLog('Спр. регионов. Редактирование записи', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatRegion.btnCancelClick(Sender: TObject);
begin
  Close;
end;

end.
