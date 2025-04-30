object frmDlgReport: TfrmDlgReport
  Left = 316
  Top = 223
  BorderWidth = 3
  Caption = #1054#1090#1095#1077#1090
  ClientHeight = 500
  ClientWidth = 769
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
    Width = 769
    Height = 458
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 1
    Caption = 'Panel3'
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 5
      Top = 5
      Width = 759
      Height = 448
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 2
      ParentBackground = False
      TabOrder = 0
      object LineInfo: TMemo
        Left = 4
        Top = 4
        Width = 751
        Height = 440
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Fixedsys'
        Font.Style = []
        ImeName = #1056#1091#1089#1089#1082#1072#1103
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 458
    Width = 769
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      769
      42)
    object btnSave: TBitBtn
      Left = 12
      Top = 8
      Width = 130
      Height = 30
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = btnSaveClick
    end
    object btnClose: TBitBtn
      Left = 624
      Top = 8
      Width = 130
      Height = 30
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnCloseClick
    end
    object btnPrint: TBitBtn
      Left = 144
      Top = 8
      Width = 130
      Height = 30
      Caption = #1055#1077#1095#1072#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
end
