object frmDatUserAccess: TfrmDatUserAccess
  Left = 218
  Top = 549
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1044#1086#1089#1090#1091#1087' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 187
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 452
    Height = 145
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 19
      Top = 17
      Width = 55
      Height = 14
      Caption = #1058#1072#1073#1083#1080#1094#1072
    end
    object edtTableName: TDBLookupComboboxEh
      Left = 85
      Top = 15
      Width = 348
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      KeyField = 'Name'
      ListField = 'Comment'
      ListSource = DMain.srSysTables
      TabOrder = 0
      Visible = True
    end
    object edtIsAccess: TDBCheckBoxEh
      Left = 88
      Top = 48
      Width = 109
      Height = 17
      Caption = #1048#1084#1077#1077#1090' '#1076#1086#1089#1090#1091#1087
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edtIsAdd: TDBCheckBoxEh
      Left = 88
      Top = 71
      Width = 84
      Height = 17
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edtIsEdit: TDBCheckBoxEh
      Left = 88
      Top = 94
      Width = 120
      Height = 17
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      TabOrder = 3
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object edtIsDelete: TDBCheckBoxEh
      Left = 88
      Top = 116
      Width = 73
      Height = 17
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 4
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 452
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnSave: TBitBtn
      Left = 94
      Top = 8
      Width = 130
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 238
      Top = 8
      Width = 130
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
