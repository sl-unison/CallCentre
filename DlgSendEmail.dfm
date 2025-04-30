object frmDlgSendEmail: TfrmDlgSendEmail
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1089#1086#1086#1073#1097#1077#1085#1080#1077
  ClientHeight = 310
  ClientWidth = 660
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 660
    Height = 267
    Align = alClient
    BevelInner = bvLowered
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    TabOrder = 0
    ExplicitTop = 1
    ExplicitHeight = 158
    object Label1: TLabel
      Left = 23
      Top = 88
      Width = 34
      Height = 14
      Caption = #1060#1072#1081#1083
    end
    object Label2: TLabel
      Left = 26
      Top = 14
      Width = 31
      Height = 14
      Caption = #1050#1086#1084#1091
    end
    object Label3: TLabel
      Left = 18
      Top = 39
      Width = 39
      Height = 14
      Caption = #1050#1086#1087#1080#1103
    end
    object Label4: TLabel
      Left = 26
      Top = 63
      Width = 31
      Height = 14
      Caption = #1058#1077#1084#1072
    end
    object edtEmailNotes: TMemo
      Left = 5
      Top = 121
      Width = 650
      Height = 141
      Align = alBottom
      TabOrder = 5
      ExplicitTop = 149
    end
    object edtEmailFile: TDBEditEh
      Left = 64
      Top = 85
      Width = 510
      Height = 22
      EditButtons = <>
      TabOrder = 4
      Visible = True
    end
    object btnFile: TBitBtn
      Left = 580
      Top = 88
      Width = 75
      Height = 24
      Caption = #1042#1099#1073#1088#1072#1090#1100'...'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
      OnClick = btnFileClick
    end
    object edtEmailTo: TDBEditEh
      Left = 64
      Top = 11
      Width = 510
      Height = 22
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object edtEmailCopy: TDBEditEh
      Left = 64
      Top = 36
      Width = 510
      Height = 22
      EditButtons = <>
      TabOrder = 1
      Visible = True
    end
    object edtEmailSubj: TDBEditEh
      Left = 64
      Top = 60
      Width = 510
      Height = 22
      EditButtons = <>
      TabOrder = 2
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 267
    Width = 660
    Height = 43
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 266
    object btnSave: TBitBtn
      Left = 206
      Top = 9
      Width = 130
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 342
      Top = 9
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
