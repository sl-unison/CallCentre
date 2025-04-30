unit Setups;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrlsEh, 
  ComCtrls, Mask, DBGridEh, DBLookupEh, DBGridEhGrouping, GridsEh, ActnList, DB,
  adsdata, adsfunc, adstable;

type
  TfrmSetups = class(TForm)
    Panel2: TPanel;
    btnEdit: TBitBtn;
    btnClose: TBitBtn;
    pnl1: TPanel;
    actlst1: TActionList;
    acEdit: TAction;
    acClose: TAction;
    DBGridEh1: TDBGridEh;
    tbSetups: TAdsQuery;
    tbSetupsCode: TIntegerField;
    tbSetupsValType: TIntegerField;
    tbSetupsValInteger: TIntegerField;
    tbSetupsValNumeric: TFMTBCDField;
    tbSetupsValDate: TDateField;
    tbSetupsValTime: TTimeField;
    tbSetupsValDateTime: TDateTimeField;
    tbSetupsValLogical: TBooleanField;
    srSetups: TDataSource;
    tbSetupsName: TWideStringField;
    tbSetupsValString: TWideStringField;
    tbSetupsValItem: TWideStringField;
    tbSetupsValTypeName: TWideStringField;
    BitBtn1: TBitBtn;
    acApply: TAction;
    procedure acCloseExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acApplyExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSetups: TfrmSetups;

implementation

uses DBDatas, Globals, DatSetup;

{$R *.dfm}

procedure TfrmSetups.acApplyExecute(Sender: TObject);
begin
  uf_GetSetups;
end;

procedure TfrmSetups.acCloseExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmSetups.acEditExecute(Sender: TObject);
var R, V: Integer;
begin
  if tbSetups.IsEmpty then Exit;

  R := tbSetups.FieldByName('Code').AsInteger;
  V := tbSetups.FieldByName('ValType').AsInteger;
  frmDatSetup := TfrmDatSetup.Create(Owner);
  try
    case V of
      VT_STRING  : frmDatSetup.edtValString.Enabled := True;
      VT_INTEGER : frmDatSetup.edtValInteger.Enabled := True;
      VT_NUMERIC : frmDatSetup.edtValNumeric.Enabled := True;
      VT_DATE    : frmDatSetup.edtValDate.Enabled := True;
      VT_TIME    : frmDatSetup.edtValTime.Enabled := True;
      VT_DATETIME: frmDatSetup.edtValDateTime.Enabled := True;
      VT_LOGICAL : frmDatSetup.edtValLogical.Enabled := True;
    end;
    frmDatSetup.RecStatus := RS_EDIT;
    frmDatSetup.Code      := R;
    frmDatSetup.ValType   := V;
    frmDatSetup.edtCode.Value := tbSetups['Code'];
    frmDatSetup.edtName.Value := tbSetups['Name'];
    frmDatSetup.edtValString.Value    := tbSetups['ValString'];
    frmDatSetup.edtValInteger.Value   := tbSetups['ValInteger'];
    frmDatSetup.edtValNumeric.Value   := tbSetups['ValNumeric'];
    frmDatSetup.edtValDate.Value      := tbSetups['ValDate'];
    frmDatSetup.edtValTime.Value      := tbSetups['ValTime'];
    frmDatSetup.edtValDateTime.Value  := tbSetups['ValDateTime'];
    frmDatSetup.edtValLogical.Checked := tbSetups.FieldByName('ValLogical').AsBoolean;
    if (frmDatSetup.ShowModal <> mrOk) then Exit;

    tbSetups.Close;
    tbSetups.Open;
    tbSetups.Locate('Code', R, [])
  finally
    frmDatSetup.Free;
  end;
end;

procedure TfrmSetups.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tbSetups.Close;
end;

procedure TfrmSetups.FormShow(Sender: TObject);
begin
  if tbSetups.Active then tbSetups.Close;
  tbSetups.Open;
end;

end.
