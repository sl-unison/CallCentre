object frmDatSetup: TfrmDatSetup
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1085#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 283
  ClientWidth = 598
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 598
    Height = 242
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object Label1: TLabel
      Left = 68
      Top = 161
      Width = 86
      Height = 14
      Caption = #1044#1072#1090#1072' '#1080' '#1074#1088#1077#1084#1103
    end
    object Label5: TLabel
      Left = 27
      Top = 89
      Width = 127
      Height = 14
      Alignment = taRightJustify
      Caption = #1063#1080#1089#1083#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object Label4: TLabel
      Left = 48
      Top = 65
      Width = 106
      Height = 14
      Alignment = taRightJustify
      Caption = #1062#1077#1083#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object Label3: TLabel
      Left = 18
      Top = 42
      Width = 136
      Height = 14
      Alignment = taRightJustify
      Caption = #1057#1090#1088#1086#1082#1086#1074#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
    end
    object Label2: TLabel
      Left = 122
      Top = 113
      Width = 32
      Height = 14
      Caption = #1044#1072#1090#1072
    end
    object Label6: TLabel
      Left = 115
      Top = 137
      Width = 39
      Height = 14
      Caption = #1042#1088#1077#1084#1103
    end
    object Label7: TLabel
      Left = 85
      Top = 18
      Width = 69
      Height = 14
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072
    end
    object Label8: TLabel
      Left = 73
      Top = 210
      Width = 81
      Height = 14
      Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
    end
    object edtValDateTime: TDBDateTimeEditEh
      Left = 160
      Top = 158
      Width = 121
      Height = 22
      DynProps = <>
      Enabled = False
      EditButtons = <>
      Kind = dtkDateTimeEh
      TabOrder = 7
      Visible = True
    end
    object edtValLogical: TDBCheckBoxEh
      Left = 119
      Top = 184
      Width = 162
      Height = 17
      Alignment = taLeftJustify
      Caption = #1051#1086#1075#1080#1095#1077#1089#1082#1086#1077' '#1079#1085#1072#1095#1077#1085#1080#1077
      DynProps = <>
      Enabled = False
      TabOrder = 8
    end
    object edtValNumeric: TDBNumberEditEh
      Left = 160
      Top = 86
      Width = 160
      Height = 22
      DisplayFormat = '### ### ### ### ##0.00'
      DynProps = <>
      Enabled = False
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 4
      Visible = True
    end
    object edtValInteger: TDBNumberEditEh
      Left = 160
      Top = 62
      Width = 160
      Height = 22
      DynProps = <>
      Enabled = False
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 3
      Visible = True
    end
    object edtValString: TDBEditEh
      Left = 160
      Top = 38
      Width = 419
      Height = 22
      DynProps = <>
      EditButtons = <>
      Enabled = False
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 2
      Visible = True
    end
    object edtValTime: TDBDateTimeEditEh
      Left = 160
      Top = 134
      Width = 121
      Height = 22
      DynProps = <>
      Enabled = False
      EditButtons = <>
      Kind = dtkTimeEh
      TabOrder = 6
      Visible = True
    end
    object edtCode: TDBNumberEditEh
      Left = 160
      Top = 14
      Width = 73
      Height = 22
      DynProps = <>
      Enabled = False
      EditButtons = <>
      ReadOnly = True
      TabOrder = 0
      Visible = True
    end
    object edtName: TDBEditEh
      Left = 235
      Top = 14
      Width = 344
      Height = 22
      DynProps = <>
      EditButtons = <>
      Enabled = False
      ReadOnly = True
      TabOrder = 1
      Visible = True
    end
    object edtValDate: TDBDateTimeEditEh
      Left = 160
      Top = 110
      Width = 121
      Height = 22
      DynProps = <>
      Enabled = False
      EditButtons = <>
      Kind = dtkDateEh
      TabOrder = 5
      Visible = True
    end
    object edtValNote: TDBEditEh
      Left = 160
      Top = 207
      Width = 419
      Height = 22
      DynProps = <>
      EditButtons = <>
      TabOrder = 9
      Visible = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 242
    Width = 598
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      598
      41)
    object btnSave: TBitBtn
      Left = 325
      Top = 8
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnCancel: TBitBtn
      Left = 459
      Top = 8
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
end
