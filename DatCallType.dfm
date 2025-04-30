object frmDatCallType: TfrmDatCallType
  Left = 183
  Top = 516
  BorderStyle = bsDialog
  BorderWidth = 5
  Caption = #1044#1072#1085#1085#1099#1077' '#1086' '#1074#1080#1076#1077' '#1074#1099#1079#1086#1074#1072
  ClientHeight = 311
  ClientWidth = 513
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
    Top = 274
    Width = 513
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    object btnCancel: TBitBtn
      Left = 390
      Top = 6
      Width = 120
      Height = 30
      Caption = #1054#1090#1084#1077#1085#1072
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCancelClick
    end
    object btnSave: TBitBtn
      Left = 268
      Top = 6
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
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 513
    Height = 274
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    Padding.Left = 3
    Padding.Top = 3
    Padding.Right = 3
    Padding.Bottom = 3
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 57
      Top = 21
      Width = 24
      Height = 14
      Caption = #1050#1086#1076
    end
    object Label2: TLabel
      Left = 19
      Top = 45
      Width = 62
      Height = 14
      Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    end
    object edtName: TDBEditEh
      Left = 89
      Top = 42
      Width = 408
      Height = 22
      EditButtons = <>
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      TabOrder = 2
      Visible = True
    end
    object edtCode: TDBNumberEditEh
      Left = 89
      Top = 18
      Width = 121
      Height = 22
      EditButtons = <>
      TabOrder = 0
      Visible = True
    end
    object PageControl1: TPageControl
      Left = 6
      Top = 75
      Width = 501
      Height = 193
      ActivePage = TSheetEmailTo
      Align = alBottom
      TabOrder = 3
      object TSheetEmailTo: TTabSheet
        BorderWidth = 3
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1074' '#1072#1076#1088#1077#1089#1072
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 487
          Height = 158
          Align = alClient
          BevelInner = bvLowered
          ParentBackground = False
          TabOrder = 0
          object edtEmailTo: TMemo
            Left = 2
            Top = 2
            Width = 483
            Height = 154
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
          end
        end
      end
      object TSheetEmailCopy: TTabSheet
        BorderWidth = 3
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1082#1086#1087#1080#1080
        ImageIndex = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 487
          Height = 158
          Align = alClient
          BevelInner = bvLowered
          ParentBackground = False
          TabOrder = 0
          object edtEmailCopy: TMemo
            Left = 2
            Top = 2
            Width = 483
            Height = 154
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
          end
        end
      end
    end
    object edtIsEmailSend: TDBCheckBoxEh
      Left = 280
      Top = 21
      Width = 177
      Height = 17
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1087#1086' '#1101#1083'. '#1087#1086#1095#1090#1077
      TabOrder = 1
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
  end
end
