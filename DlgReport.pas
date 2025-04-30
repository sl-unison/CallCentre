unit DlgReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ShellAPI;

type
  TfrmDlgReport = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    LineInfo: TMemo;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    btnPrint: TBitBtn;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDlgReport: TfrmDlgReport;

implementation

uses
  Globals, DBDatas;

{$R *.dfm}

procedure TfrmDlgReport.btnSaveClick(Sender: TObject);
var ODlg: TSaveDialog;
begin
  ODlg := TSaveDialog.Create(Owner);
  try
    if ODlg.Execute then LineInfo.Lines.SaveToFile(ODlg.FileName);
  finally
    ODlg.Free;
  end;
end;

procedure TfrmDlgReport.btnCloseClick(Sender: TObject);
begin
  Close;
end;

end.
