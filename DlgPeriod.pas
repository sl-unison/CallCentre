unit DlgPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrlsEh, Buttons, Mask;

type
  TfrmDlgPeriod = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    dtSDate: TDBDateTimeEditEh;
    dtEDate: TDBDateTimeEditEh;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IsSingleDate: Boolean;
  end;

var
  frmDlgPeriod: TfrmDlgPeriod;

implementation

{$R *.dfm}

procedure TfrmDlgPeriod.btnSaveClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmDlgPeriod.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmDlgPeriod.FormShow(Sender: TObject);
begin
  if IsSingleDate then
     Self.dtSDate.Enabled := False;
end;

end.
