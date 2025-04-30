object frmRegions: TfrmRegions
  Left = 224
  Top = 122
  BorderWidth = 5
  Caption = #1056#1077#1075#1080#1086#1085#1099
  ClientHeight = 495
  ClientWidth = 574
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 437
    Width = 574
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      574
      58)
    object BitBtn1: TBitBtn
      Left = 6
      Top = 15
      Width = 110
      Height = 30
      Action = acAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 116
      Top = 15
      Width = 110
      Height = 30
      Action = acEdit
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 226
      Top = 15
      Width = 110
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 456
      Top = 15
      Width = 110
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 574
    Height = 437
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 497
    ExplicitHeight = 495
    object dbGridFinProf: TDBGridEh
      Left = 5
      Top = 5
      Width = 564
      Height = 427
      Align = alClient
      BorderStyle = bsNone
      Ctl3D = False
      DataGrouping.GroupLevels = <>
      DataSource = DMain.srRegions
      EditActions = [geaCopyEh, geaSelectAllEh]
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
      FrozenCols = 1
      ImeName = #1056#1091#1089#1089#1082#1072#1103
      OddRowColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
      ParentCtl3D = False
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      RowSizingAllowed = True
      SortLocal = True
      SumList.Active = True
      SumList.VirtualRecords = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Verdana'
      TitleFont.Style = []
      UseMultiTitle = True
      VertScrollBar.VisibleMode = sbAlwaysShowEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'Code'
          Footer.Alignment = taCenter
          Footer.FieldName = 'Code'
          Footer.ValueType = fvtCount
          Footers = <>
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 429
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object ActionList1: TActionList
    Left = 232
    Top = 188
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnExecute = acDeleteExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
  end
end
