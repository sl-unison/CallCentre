object frmSQL: TfrmSQL
  Left = 221
  Top = 152
  BorderWidth = 3
  Caption = 'SQL '#1059#1090#1080#1083#1080#1090#1072
  ClientHeight = 522
  ClientWidth = 877
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PageCtrlMain: TPageControl
    Left = 0
    Top = 0
    Width = 877
    Height = 481
    ActivePage = TSheetQuery
    Align = alClient
    TabOrder = 0
    object TSheetQuery: TTabSheet
      BorderWidth = 3
      Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1087#1086' '#1079#1072#1087#1088#1086#1089#1091
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 716
        Height = 446
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 678
        object Splitter1: TSplitter
          Left = 0
          Top = 201
          Width = 716
          Height = 3
          Cursor = crVSplit
          Align = alTop
          ExplicitWidth = 692
        end
        object Panel2: TPanel
          Left = 0
          Top = 204
          Width = 716
          Height = 242
          Align = alClient
          BevelInner = bvLowered
          BorderWidth = 1
          ParentBackground = False
          TabOrder = 0
          ExplicitWidth = 678
          object cxGridSqlQuery: TcxGrid
            Left = 3
            Top = 3
            Width = 710
            Height = 236
            Align = alClient
            BorderStyle = cxcbsNone
            TabOrder = 0
            LookAndFeel.Kind = lfOffice11
            ExplicitWidth = 672
            object btvSqlQuery: TcxGridDBTableView
              NavigatorButtons.ConfirmDelete = False
              DataController.DataSource = srSqlQuery
              DataController.Summary.DefaultGroupSummaryItems = <>
              DataController.Summary.FooterSummaryItems = <>
              DataController.Summary.SummaryGroups = <>
              FilterRow.Visible = True
              OptionsCustomize.ColumnsQuickCustomization = True
              OptionsData.Deleting = False
              OptionsData.Editing = False
              OptionsData.Inserting = False
              OptionsSelection.CellMultiSelect = True
              OptionsView.Footer = True
              OptionsView.Indicator = True
            end
            object cxGridSqlQueryLevel1: TcxGridLevel
              GridView = btvSqlQuery
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 716
          Height = 201
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 1
          ParentBackground = False
          TabOrder = 1
          ExplicitWidth = 678
          object SqlMemo: TMemo
            Left = 1
            Top = 1
            Width = 714
            Height = 199
            Align = alClient
            ImeName = #1056#1091#1089#1089#1082#1072#1103
            TabOrder = 0
            ExplicitWidth = 676
          end
        end
      end
      object Panel3: TPanel
        Left = 716
        Top = 0
        Width = 147
        Height = 446
        Align = alRight
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 715
        object BitBtn1: TBitBtn
          Left = 9
          Top = 16
          Width = 130
          Height = 30
          Action = acExecute
          Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 0
        end
        object BitBtn3: TBitBtn
          Left = 9
          Top = 55
          Width = 130
          Height = 30
          Action = acExport
          Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 1
        end
        object BitBtn4: TBitBtn
          Left = 9
          Top = 86
          Width = 130
          Height = 30
          Action = acExcel
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
        end
        object BitBtn6: TBitBtn
          Left = 9
          Top = 148
          Width = 130
          Height = 30
          Action = acBestFit
          Caption = #1054#1087#1090#1080#1084'. '#1087#1086#1076#1075#1086#1085#1082#1072
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 3
        end
        object chkIsNewRecord: TDBCheckBoxEh
          Left = 9
          Top = 246
          Width = 120
          Height = 17
          Caption = #1042#1089#1090#1072#1074#1082#1072' '#1085#1086#1074#1086#1075#1086
          TabOrder = 4
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = chkIsNewRecordClick
        end
        object chkIsEditRecord: TDBCheckBoxEh
          Left = 9
          Top = 266
          Width = 129
          Height = 17
          Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1085#1080#1077
          TabOrder = 5
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = chkIsEditRecordClick
        end
        object chkIsDelRecord: TDBCheckBoxEh
          Left = 9
          Top = 287
          Width = 83
          Height = 17
          Caption = #1059#1076#1072#1083#1077#1085#1080#1077
          TabOrder = 6
          ValueChecked = 'True'
          ValueUnchecked = 'False'
          OnClick = chkIsDelRecordClick
        end
        object BitBtn5: TBitBtn
          Left = 9
          Top = 117
          Width = 130
          Height = 30
          Action = acImport
          Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 7
        end
      end
    end
    object TSheetLog: TTabSheet
      BorderWidth = 3
      Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1088#1072#1094#1080#1081
      ImageIndex = 1
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 863
        Height = 446
        Align = alClient
        BevelInner = bvLowered
        ParentBackground = False
        TabOrder = 0
        object lsbLog: TMemo
          Left = 2
          Top = 2
          Width = 859
          Height = 442
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          ScrollBars = ssBoth
          TabOrder = 0
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 481
    Width = 877
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      877
      41)
    object BitBtn2: TBitBtn
      Left = 732
      Top = 7
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
  end
  object ActionList1: TActionList
    Left = 48
    Top = 85
    object acExecute: TAction
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      ImageIndex = 0
      OnExecute = acExecuteExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acExport: TAction
      Caption = #1069#1082#1089#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      OnExecute = acExportExecute
    end
    object acExcel: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1074' Excel'
      OnExecute = acExcelExecute
    end
    object acBestFit: TAction
      Caption = #1054#1087#1090#1080#1084'. '#1087#1086#1076#1075#1086#1085#1082#1072
      OnExecute = acBestFitExecute
    end
    object acImport: TAction
      Caption = #1048#1084#1087#1086#1088#1090' '#1076#1072#1085#1085#1099#1093
      OnExecute = acImportExecute
    end
  end
  object dsSqlQuery: TAdsQuery
    DatabaseName = 'DMain.AdsCn'
    StoreActive = False
    RequestLive = True
    AdsConnection = DMain.AdsCn
    Left = 112
    Top = 86
    ParamData = <>
  end
  object srSqlQuery: TDataSource
    DataSet = dsSqlQuery
    Left = 176
    Top = 86
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridSqlQuery
    PopupMenus = <>
    Left = 256
    Top = 86
  end
  object SMExportDlg: TSMEWizardDlg
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
    Columns = <>
    Bands = <>
    DataSet = dsSqlQuery
    ColumnSource = csDataSet
    Formats = [teParadox, teDBase, teText, teHTML, teXLS, teExcel, teWord, teSYLK, teDIF, teWKS, teQuattro, teSQL, teXML, teAccess, teClipboard, teRTF, teSPSS, tePDF, teLDIF, teADO]
    Categories.TextFont.Charset = DEFAULT_CHARSET
    Categories.TextFont.Color = clHighlightText
    Categories.TextFont.Height = -11
    Categories.TextFont.Name = 'Tahoma'
    Categories.TextFont.Style = [fsBold]
    RecordSeparator = #13#10
    Fixed = False
    TableType = teText
    FileName = 'D:\Software\Delphi7\Bin\SMExport.TXT'
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
    Left = 343
    Top = 87
  end
  object DlgSMIWizard: TSMIWizardDlg
    AbortOnProblem = True
    AnimatedStatus = True
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
    DataSet = dsSqlQuery
    SQLOptions.SQLTerm = ';'
    Options = [soShowMessage, soExtendedStatistic, soSkipEmptyRow, soUseAnimatedControl, soWaitCursor]
    Parameters = <>
    TitleStatus = 'Importing...'
    Statistic.TotalCount = 0
    Statistic.Result = irUnknown
    UseDisplayNames = False
    TrimSpaces = tsTrimLeftRight
    OnErrorEvent = DlgSMIWizardErrorEvent
    OnGetCellParams = DlgSMIWizardGetCellParams
    OnBeforeExecute = DlgSMIWizardBeforeExecute
    Categories.TextFont.Charset = DEFAULT_CHARSET
    Categories.TextFont.Color = clHighlightText
    Categories.TextFont.Height = -11
    Categories.TextFont.Name = 'MS Sans Serif'
    Categories.TextFont.Style = [fsBold]
    Fixed = False
    Formats = [teParadox, teDBase, teText, teHTML, teXLS, teWKS, teQuattro, teXML, teAccess, teWord, teADO, teSPSS, teADT, teDBISAM, teClarion, teClipboard, teWAB, teVCalendar, teODS, teOutlook]
    SourceFileName = 'SMImport.SMI'
    UserAccess.Specification = True
    UserAccess.SpecificationSave = True
    UserAccess.SpecificationLoad = True
    UserAccess.SpecificationDelete = True
    PreviewRowCount = 100
    FieldDelimiter = fdSpace
    FieldDelimiterCustom = ' '
    RecordSeparatorCustom = #13#10
    XMLTags.RecordsTag = 'RECORDS'
    XMLTags.RecordTag = 'RECORD'
    XMLTags.RowTag = 'ROW'
    Left = 418
    Top = 88
  end
end
