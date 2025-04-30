unit DatUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DBCtrlsEh, ComCtrls,
  GridsEh, DBGridEh, DB, DBLookupEh, adsdata, adsfunc, adstable,
  DBGridEhGrouping;

type
  TfrmDatUser = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    btnSave: TBitBtn;
    btnCancel: TBitBtn;
    PageCtrl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtIsBlocked: TDBCheckBoxEh;
    TSheetGroups: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBGridEh1: TDBGridEh;
    btnAddToGroup: TBitBtn;
    btnDelFromGroup: TBitBtn;
    dbeSGroups: TDBLookupComboboxEh;
    tbSGroups: TAdsQuery;
    srSGroups: TDataSource;
    edtLogin: TDBEditEh;
    edtUserName: TDBEditEh;
    edtRemark: TDBEditEh;
    ScrollBox1: TScrollBox;
    edtIsCallAdd: TDBCheckBoxEh;
    edtIsCallEdit: TDBCheckBoxEh;
    edtIsCallDelete: TDBCheckBoxEh;
    edtIsCallExcel: TDBCheckBoxEh;
    edtIsReports: TDBCheckBoxEh;
    tbSGroupsName: TWideStringField;
    tbSGroupsDescription: TWideStringField;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnDelFromGroupClick(Sender: TObject);
    procedure btnAddToGroupClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RecStatus: Integer;
    Login: String;
  end;

var
  frmDatUser: TfrmDatUser;

implementation

uses DBDatas, Globals;

{$R *.dfm}

procedure TfrmDatUser.btnSaveClick(Sender: TObject);
var Cmd: String;
begin
  if (RecStatus <> RS_INSERT) and (RecStatus <> RS_EDIT) then Exit;

  if (Trim(edtLogin.Text) = '') then
      raise Exception.Create('Не введен логин пользователя');
  if (Trim(edtUserName.Text) = '') then
      raise Exception.Create('Не введен Ф.И.О. пользователя');

  if (RecStatus = RS_INSERT) then
  begin
    Cmd := SQLInsert('R_Users',
                    ['Login','UserName','IsBlocked',
                     'IsCallAdd','IsCallEdit','IsCallDelete',
                     'IsCallExcel','IsReports',
                     'Remark'],
                    [QuotedStr(Copy(VarToStr(edtLogin.Value), 1, 20)),
                     QuotedStr(Copy(VarToStr(edtUserName.Value), 1, 50)),
                     BoolToStr(edtIsBlocked.Checked, True),
                     BoolToStr(edtIsCallAdd.Checked, True),
                     BoolToStr(edtIsCallEdit.Checked, True),
                     BoolToStr(edtIsCallDelete.Checked, True),
                     BoolToStr(edtIsCallExcel.Checked, True),
                     BoolToStr(edtIsReports.Checked, True),
                     QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 100))]);
    try
      if DMain.AdsCn.TransactionActive then DMain.AdsCn.Rollback;
      DMain.AdsCn.BeginTransaction;
      DMain.AdsCn.Execute(Cmd);
      DMain.AdsCn.Commit;
      Login := edtLogin.Text;
      ModalResult := mrOk;
    except
      on E: Exception do
      begin
        DMain.AdsCn.Rollback;
        ShowMessage(uf_ErrorToLog('Новый пользователь', E, Cmd));
      end;
    end;
  end;

  if (RecStatus = RS_EDIT) then
  begin
    Cmd := SqlUpdate('R_Users',
                    ['UserName','IsBlocked',
                     'IsCallAdd','IsCallEdit','IsCallDelete',
                     'IsCallExcel','IsReports',
                     'Remark'],
                    [QuotedStr(Copy(VarToStr(edtUserName.Value), 1, 50)),
                     BoolToStr(edtIsBlocked.Checked, True),
                     BoolToStr(edtIsCallAdd.Checked, True),
                     BoolToStr(edtIsCallEdit.Checked, True),
                     BoolToStr(edtIsCallDelete.Checked, True),
                     BoolToStr(edtIsCallExcel.Checked, True),
                     BoolToStr(edtIsReports.Checked, True),
                     QuotedStr(Copy(VarToStr(edtRemark.Value), 1, 100))],
                    'Login = '+QuotedStr(Login));
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
        ShowMessage(uf_ErrorToLog('Редактирование пользователя', E, Cmd));
      end;
    end;
  end;
end;

procedure TfrmDatUser.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDatUser.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tbSGroups.Active then tbSGroups.Close;
end;

procedure TfrmDatUser.FormShow(Sender: TObject);
begin
  PageCtrl.ActivePageIndex := 0;

  if RecStatus = RS_INSERT then
     TSheetGroups.TabVisible := False;

  if tbSGroups.Active then tbSGroups.Close;
  tbSGroups.Open;
end;

procedure TfrmDatUser.btnDelFromGroupClick(Sender: TObject);
var R: String;
begin
  if DMain.tbUGroups.IsEmpty then Exit;

  R := 'Execute Procedure sp_RemoveUserFromGroup('+
  QuotedStr(Login)+','+
  QuotedStr(DMain.tbUGroups['RGroup'])+')';
  DMain.AdsCn.Execute(R);

  if DMain.tbUGroups.Active then DMain.tbUGroups.Close;
  DMain.tbUGroups.Open;
end;

procedure TfrmDatUser.btnAddToGroupClick(Sender: TObject);
var R: String;
begin
  if (dbeSGroups.KeyValue = null) then
  begin
    ShowMessage('Выберите группу');
    Exit;
  end;

  R := 'Execute procedure sp_AddUserToGroup('+
  QuotedStr(Login)+','+
  QuotedStr(dbeSGroups.KeyValue)+')';
  DMain.AdsCn.Execute(R);

  if DMain.tbUGroups.Active then DMain.tbUGroups.Close;
  DMain.tbUGroups.Open;
end;

end.
