object frmCallTemplates: TfrmCallTemplates
  Left = 0
  Top = 0
  BorderWidth = 3
  Caption = #1064#1072#1073#1083#1086#1085#1099' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
  ClientHeight = 423
  ClientWidth = 785
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
    Width = 785
    Height = 369
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 781
      Height = 365
      Align = alClient
      BorderStyle = bsNone
      DataGrouping.GroupLevels = <>
      DataSource = DMain.srCallTemplates
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = 'Verdana'
      FooterFont.Style = [fsBold]
      FooterRowCount = 1
      OddRowColor = clSkyBlue
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      UseMultiTitle = True
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Code'
          Footer.Alignment = taCenter
          Footer.FieldName = 'Code'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 59
        end
        item
          EditButtons = <>
          FieldName = 'CallTypeName'
          Footers = <>
          Width = 236
        end
        item
          EditButtons = <>
          FieldName = 'CallAnswer'
          Footers = <>
          Width = 392
        end
        item
          EditButtons = <>
          FieldName = 'CallNote'
          Footers = <>
          Width = 422
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 369
    Width = 785
    Height = 54
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      785
      54)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 14
      Width = 130
      Height = 30
      Action = acAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 138
      Top = 14
      Width = 130
      Height = 30
      Action = acEdit
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 268
      Top = 14
      Width = 130
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 398
      Top = 14
      Width = 130
      Height = 30
      Action = acSelect
      Caption = #1042#1099#1073#1088#1072#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 645
      Top = 14
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
    end
  end
  object ActionList1: TActionList
    Left = 160
    Top = 144
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDeleteExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
      OnExecute = acSelectExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
  end
end
