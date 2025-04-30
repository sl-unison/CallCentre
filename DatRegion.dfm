object frmDatRegion: TfrmDatRegion
  Left = 262
  Top = 608
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1044#1072#1085#1085#1099#1077' '#1088#1077#1075#1080#1086#1085#1072
  ClientHeight = 117
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel2: TPanel
    Left = 0
    Top = 80
    Width = 514
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 78
    ExplicitWidth = 512
    object btnCancel: TBitBtn
      Left = 384
      Top = 5
      Width = 120
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 262
      Top = 5
      Width = 120
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Default = True
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 514
    Height = 80
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 512
    ExplicitHeight = 78
    object Label1: TLabel
      Left = 57
      Top = 19
      Width = 24
      Height = 14
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 19
      Top = 44
      Width = 62
      Height = 14
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object edtName: TDBEditEh
      Left = 89
      Top = 41
      Width = 408
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 1
      Visible = True
    end
    object edtCode: TDBNumberEditEh
      Left = 89
      Top = 16
      Width = 121
      Height = 22
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
  end
end
