unit DlgDateRanges;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrlsEh, Buttons;

type
  TfrmDlgDateRanges = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    dtSDate: TDBDateTimeEditEh;
    dtEDate: TDBDateTimeEditEh;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlgDateRanges: TfrmDlgDateRanges;

implementation

{$R *.dfm}

procedure TfrmDlgDateRanges.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmDlgDateRanges.btnSaveClick(Sender: TObject);
begin
   ModalResult := mrOk;
end;

procedure TfrmDlgDateRanges.btnCancelClick(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

end.
