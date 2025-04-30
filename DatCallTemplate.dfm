object frmDatCallTemplate: TfrmDatCallTemplate
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1044#1072#1085#1085#1099#1077' '#1087#1086' '#1096#1072#1073#1083#1086#1085#1091' '#1086#1073#1088#1072#1097#1077#1085#1080#1103
  ClientHeight = 146
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 105
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 33
      Top = 19
      Width = 24
      Height = 14
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 205
      Top = 19
      Width = 72
      Height = 14
      Caption = #1058#1080#1087' '#1074#1099#1079#1086#1074#1072
    end
    object Label3: TLabel
      Left = 22
      Top = 69
      Width = 35
      Height = 14
      Caption = #1058#1077#1082#1089#1090
    end
    object Label4: TLabel
      Left = 18
      Top = 44
      Width = 39
      Height = 14
      Caption = #1054#1090#1074#1077#1090
    end
    object edtCode: TDBNumberEditEh
      Left = 65
      Top = 16
      Width = 121
      Height = 22
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object edtCallType: TDBLookupComboboxEh
      Left = 286
      Top = 16
      Width = 335
      Height = 22
      EditButtons = <>
      KeyField = 'Code'
      ListField = 'Name'
      ListSource = DMain.srCallTypes
      TabOrder = 1
      Visible = True
    end
    object edtCallNote: TDBEditEh
      Left = 65
      Top = 66
      Width = 556
      Height = 22
      EditButtons = <>
      MaxLength = 160
      TabOrder = 3
      Visible = True
    end
    object edtCallAnswer: TDBEditEh
      Left = 65
      Top = 41
      Width = 556
      Height = 22
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 105
    Width = 640
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      640
      41)
    object btnSave: TBitBtn
      Left = 366
      Top = 7
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 501
      Top = 7
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
