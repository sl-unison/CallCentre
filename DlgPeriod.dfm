object frmDlgPeriod: TfrmDlgPeriod
  Left = 189
  Top = 422
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1055#1077#1088#1080#1086#1076
  ClientHeight = 148
  ClientWidth = 304
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 109
    Width = 304
    Height = 39
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnSave: TBitBtn
      Left = 19
      Top = 6
      Width = 130
      Height = 30
      Caption = #1055#1088#1080#1085#1103#1090#1100
      Default = True
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 155
      Top = 6
      Width = 130
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 109
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 2
    ParentBackground = False
    TabOrder = 0
    object StaticText1: TStaticText
      Left = 23
      Top = 21
      Width = 109
      Height = 18
      Alignment = taCenter
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = #1053#1072#1095#1072#1083#1100#1085#1072#1103' '#1076#1072#1090#1072
      Color = clBtnFace
      ParentColor = False
      TabOrder = 0
    end
    object StaticText2: TStaticText
      Left = 23
      Top = 61
      Width = 102
      Height = 18
      Alignment = taCenter
      BevelInner = bvLowered
      BevelOuter = bvRaised
      BorderStyle = sbsSunken
      Caption = #1050#1086#1085#1077#1095#1085#1072#1103' '#1076#1072#1090#1072
      Color = clBtnFace
      ParentColor = False
      TabOrder = 2
    end
    object dtSDate: TDBDateTimeEditEh
      Left = 160
      Top = 21
      Width = 121
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      Kind = dtkDateEh
      TabOrder = 1
      Visible = True
    end
    object dtEDate: TDBDateTimeEditEh
      Left = 160
      Top = 61
      Width = 121
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      Kind = dtkDateEh
      TabOrder = 3
      Visible = True
    end
  end
end
