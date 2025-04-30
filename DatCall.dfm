object frmDatCall: TfrmDatCall
  Left = 191
  Top = 155
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1044#1072#1085#1085#1099#1077' '#1086#1073' '#1086#1073#1088#1072#1097#1077#1085#1080#1080' '#1082#1083#1080#1077#1085#1090#1072
  ClientHeight = 418
  ClientWidth = 590
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
    Top = 377
    Width = 590
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 342
    ExplicitWidth = 573
    DesignSize = (
      590
      41)
    object btnSave: TBitBtn
      Left = 316
      Top = 8
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
      ExplicitLeft = 301
    end
    object btnCancel: TBitBtn
      Left = 452
      Top = 8
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
      ExplicitLeft = 437
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 590
    Height = 377
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 573
    ExplicitHeight = 342
    object Label1: TLabel
      Left = 51
      Top = 18
      Width = 98
      Height = 14
      Caption = #1042#1088#1077#1084#1103' '#1088#1077#1075#1080#1089#1090#1088'.'
    end
    object Label2: TLabel
      Left = 53
      Top = 43
      Width = 96
      Height = 14
      Caption = #1042#1088#1077#1084#1103' '#1089#1086#1073#1099#1090#1080#1103
    end
    object Label3: TLabel
      Left = 346
      Top = 42
      Width = 57
      Height = 14
      Caption = #1058#1077#1083#1077#1092#1086#1085
    end
    object Label4: TLabel
      Left = 69
      Top = 66
      Width = 80
      Height = 14
      Caption = #1058#1080#1087' '#1089#1086#1073#1099#1090#1080#1103
    end
    object Label5: TLabel
      Left = 46
      Top = 90
      Width = 103
      Height = 14
      Caption = #1056#1077#1075#1080#1086#1085' '#1089#1086#1073#1099#1090#1080#1103
    end
    object Label6: TLabel
      Left = 35
      Top = 114
      Width = 114
      Height = 14
      Caption = #1054#1090#1074#1077#1090' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
    end
    object Label7: TLabel
      Left = 20
      Top = 147
      Width = 121
      Height = 14
      Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1089#1086#1073#1099#1090#1080#1103
    end
    object edtSysTime: TDBDateTimeEditEh
      Left = 158
      Top = 16
      Width = 160
      Height = 22
      Enabled = False
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      Kind = dtkDateTimeEh
      TabOrder = 0
      Visible = True
    end
    object edtCallTime: TDBDateTimeEditEh
      Left = 158
      Top = 40
      Width = 160
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      Kind = dtkDateTimeEh
      TabOrder = 1
      Visible = True
    end
    object edtCallType: TDBLookupComboboxEh
      Left = 158
      Top = 64
      Width = 409
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      KeyField = 'Code'
      ListField = 'Name'
      ListSource = DMain.srCallTypes
      TabOrder = 3
      Visible = True
    end
    object edtCallRegion: TDBLookupComboboxEh
      Left = 158
      Top = 88
      Width = 409
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      KeyField = 'Code'
      ListField = 'Name'
      ListSource = DMain.srRegions
      TabOrder = 4
      Visible = True
    end
    object edtCallPhone: TDBEditEh
      Left = 414
      Top = 40
      Width = 153
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 2
      Visible = True
    end
    object edtCallAnswer: TDBEditEh
      Left = 158
      Top = 112
      Width = 409
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 5
      Visible = True
    end
    object Panel3: TPanel
      Left = 3
      Top = 165
      Width = 584
      Height = 209
      Align = alBottom
      BevelOuter = bvNone
      BorderWidth = 3
      ParentBackground = False
      TabOrder = 6
      ExplicitWidth = 567
      object edtCallNote: TMemo
        Left = 3
        Top = 3
        Width = 578
        Height = 203
        Align = alClient
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        TabOrder = 0
        ExplicitWidth = 561
        ExplicitHeight = 165
      end
    end
  end
end
