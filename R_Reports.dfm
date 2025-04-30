object frmReports: TfrmReports
  Left = 272
  Top = 325
  BorderWidth = 5
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1090#1095#1077#1090#1086#1074
  ClientHeight = 466
  ClientWidth = 743
  Color = clBtnFace
  UseDockManager = True
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 743
    Height = 408
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 2
      Top = 2
      Width = 739
      Height = 404
      Align = alClient
      BorderStyle = bsNone
      DataGrouping.GroupLevels = <>
      DataSource = srReports
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
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
      VertScrollBar.VisibleMode = sbAlwaysShowEh
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
          FieldName = 'Name'
          Footers = <>
          Width = 413
        end
        item
          EditButtons = <>
          FieldName = 'IsSystem'
          Footers = <>
          Width = 80
        end
        item
          EditButtons = <>
          FieldName = 'IsPeriod'
          Footers = <>
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'IsHide'
          Footers = <>
          Width = 71
        end
        item
          EditButtons = <>
          FieldName = 'Remark'
          Footers = <>
          Width = 469
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 408
    Width = 743
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      743
      58)
    object BitBtn1: TBitBtn
      Left = 3
      Top = 17
      Width = 130
      Height = 30
      Action = acAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 133
      Top = 17
      Width = 130
      Height = 30
      Action = acEdit
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 263
      Top = 17
      Width = 130
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 393
      Top = 17
      Width = 130
      Height = 30
      Action = acExecute
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object BitBtn5: TBitBtn
      Left = 611
      Top = 17
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
    Left = 312
    Top = 120
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
    object acExecute: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      OnExecute = acExecuteExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acGridBestFit: TAction
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
    end
    object acUserReport: TAction
      Caption = 'acUserReport'
      OnExecute = acUserReportExecute
    end
  end
  object tbReports: TAdsQuery
    DatabaseName = 'DMain.AdsCn'
    StoreActive = False
    AdsTableOptions.AdsRecordLockingMode = lmOptimistic
    SQL.Strings = (
      'Select * from V_Reports Order by Code')
    AdsConnection = DMain.AdsCn
    Left = 180
    Top = 120
    ParamData = <>
    object tbReportsCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
    end
    object tbReportsName: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 80
    end
    object tbReportsIsSystem: TBooleanField
      DisplayLabel = #1057#1080#1089#1090#1077#1084#1085#1072#1103
      FieldName = 'IsSystem'
    end
    object tbReportsIsHide: TBooleanField
      DisplayLabel = #1057#1082#1088#1099#1074#1072#1090#1100
      FieldName = 'IsHide'
    end
    object tbReportsIsPeriod: TBooleanField
      DisplayLabel = #1055#1077#1088#1080#1086#1076
      FieldName = 'IsPeriod'
    end
    object tbReportsRemark: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'Remark'
      Size = 120
    end
    object tbReportsSQLText: TWideMemoField
      FieldName = 'SQLText'
      BlobType = ftWideMemo
      Size = 1
    end
  end
  object srReports: TDataSource
    DataSet = tbReports
    Left = 249
    Top = 120
  end
end
