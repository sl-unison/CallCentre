object frmRepGrid: TfrmRepGrid
  Left = 237
  Top = 175
  BorderWidth = 5
  Caption = 'frmRepGrid'
  ClientHeight = 521
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 476
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 0
    object cxGridUni: TcxGrid
      Left = 2
      Top = 2
      Width = 837
      Height = 472
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      LookAndFeel.NativeStyle = False
      object btvUniTable: TcxGridDBTableView
        DataController.DataModeController.SmartRefresh = True
        DataController.DataSource = srQryReport
        DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.InfoText = #1053#1072#1078#1084#1080#1090#1077' '#1074' '#1101#1090#1091' '#1089#1090#1088#1086#1082#1091' '#1076#1083#1103' '#1092#1080#1083#1100#1090#1088#1072#1094#1080#1080' '#1076#1072#1085#1085#1099#1093
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.InvertSelect = False
        OptionsSelection.MultiSelect = True
        OptionsSelection.CellMultiSelect = True
        OptionsView.NoDataToDisplayInfoText = #1053#1077#1090' '#1076#1072#1085#1085#1099#1093
        OptionsView.Footer = True
        OptionsView.GroupFooters = gfVisibleWhenExpanded
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
      end
      object cxGridUniLevel1: TcxGridLevel
        GridView = btvUniTable
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 476
    Width = 841
    Height = 45
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      841
      45)
    object BitBtn1: TBitBtn
      Left = 12
      Top = 10
      Width = 130
      Height = 30
      Action = acExcel
      Caption = 'Excel'
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 141
      Top = 10
      Width = 130
      Height = 30
      Action = acPrint
      Caption = #1055#1077#1095#1072#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 701
      Top = 10
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object BitBtn4: TBitBtn
      Left = 270
      Top = 10
      Width = 130
      Height = 30
      Action = acExport
      Caption = #1069#1082#1089#1087#1086#1088#1090
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
  end
  object ActionList1: TActionList
    Left = 131
    Top = 160
    object acExcel: TAction
      Caption = 'Excel'
      OnExecute = acExcelExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acPrint: TAction
      Caption = #1055#1077#1095#1072#1090#1100
      OnExecute = acPrintExecute
    end
    object acExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090
      OnExecute = acExportExecute
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridUni
    PopupMenus = <>
    Left = 48
    Top = 160
  end
  object dxPrintGrid: TdxComponentPrinter
    CurrentLink = dxPrintGridLink1
    Version = 0
    Left = 188
    Top = 159
    object dxPrintGridLink1: TdxGridReportLink
      Component = cxGridUni
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      BuiltInReportLink = True
    end
  end
  object SMEWizardDlgRep: TSMEWizardDlg
    DataFormats.DateOrder = doDMY
    DataFormats.DateSeparator = '.'
    DataFormats.TimeSeparator = ':'
    DataFormats.FourDigitYear = True
    DataFormats.LeadingZerosInDate = True
    DataFormats.ThousandSeparator = #160
    DataFormats.DecimalSeparator = ','
    DataFormats.CurrencyString = #1088'.'
    DataFormats.BooleanTrue = 'True'
    DataFormats.BooleanFalse = 'False'
    DataFormats.UseRegionalSettings = False
    KeyGenerator = 'SMExport 4.77'
    TitleStatus = 'Exporting...'
    ExportIfEmpty = False
    Columns = <>
    Bands = <>
    DataSet = QryReport
    ColumnSource = csDataSet
    Formats = [teParadox, teDBase, teText, teHTML, teXLS, teExcel, teWord, teSYLK, teDIF, teWKS, teQuattro, teSQL, teXML, teAccess, teClipboard, teRTF, teSPSS, tePDF, teLDIF, teADO]
    Categories.TextFont.Charset = DEFAULT_CHARSET
    Categories.TextFont.Color = clHighlightText
    Categories.TextFont.Height = -11
    Categories.TextFont.Name = 'Tahoma'
    Categories.TextFont.Style = [fsBold]
    ConfirmFileOverwrite = True
    RecordSeparator = #13#10
    Fixed = False
    TableType = teText
    ActionAfterExport = aeOpenView
    FileName = 'E:\SOFTWARE\Delphi7\Bin\SMExport.TXT'
    AddTitle = False
    CharacterSet = csANSI_WINDOWS
    ExportStyle.Style = esNormal
    ExportStyle.OddColor = clBlack
    ExportStyle.EvenColor = clBlack
    UserAccess.Specification = True
    SQLOptions.AddCreateTable = False
    SQLOptions.CommitTerm = 'COMMIT;'
    SQLOptions.SQLQuote = '"'
    SQLOptions.SQLTerm = ';'
    SQLOptions.SQLTypes.ftString = 'CHAR(%d)'
    SQLOptions.SQLTypes.ftSmallint = 'INTEGER'
    SQLOptions.SQLTypes.ftInteger = 'INTEGER'
    SQLOptions.SQLTypes.ftWord = 'INTEGER'
    SQLOptions.SQLTypes.ftBoolean = 'INTEGER'
    SQLOptions.SQLTypes.ftFloat = 'DECIMAL'
    SQLOptions.SQLTypes.ftCurrency = 'MONEY'
    SQLOptions.SQLTypes.ftBCD = 'DECIMAL'
    SQLOptions.SQLTypes.ftDate = 'DATETIME'
    SQLOptions.SQLTypes.ftTime = 'DATETIME'
    SQLOptions.SQLTypes.ftDateTime = 'DATETIME'
    SQLOptions.SQLTypes.ftAutoInc = 'IDENTITY'
    SQLOptions.SQLTypes.ftBlob = 'BLOB'
    SQLOptions.SQLTypes.ftMemo = 'BLOB'
    SQLOptions.SQLTypes.ftGraphic = 'IMAGE'
    SQLOptions.SQLTypes.ftLargeint = 'INTEGER'
    SQLOptions.SQLNULL = 'NULL'
    FilterName = 'MS Word 97'
    Left = 268
    Top = 159
  end
  object QryReport: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    RequestLive = True
    AdsConnection = DMain.AdsCn
    Left = 349
    Top = 160
    ParamData = <>
  end
  object srQryReport: TDataSource
    DataSet = QryReport
    Left = 418
    Top = 160
  end
end
