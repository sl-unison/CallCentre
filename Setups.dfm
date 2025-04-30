object frmSetups: TfrmSetups
  Left = 285
  Top = 432
  BorderStyle = bsDialog
  BorderWidth = 3
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 360
  ClientWidth = 652
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
  object Panel2: TPanel
    Left = 0
    Top = 320
    Width = 652
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      652
      40)
    object btnEdit: TBitBtn
      Left = 10
      Top = 6
      Width = 130
      Height = 30
      Action = acEdit
      Anchors = [akRight, akBottom]
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      NumGlyphs = 2
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
    end
    object btnClose: TBitBtn
      Left = 513
      Top = 6
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = []
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
    end
    object BitBtn1: TBitBtn
      Left = 140
      Top = 6
      Width = 130
      Height = 30
      Action = acApply
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 652
    Height = 320
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 3
      Top = 3
      Width = 646
      Height = 314
      Align = alClient
      BorderStyle = bsNone
      DataGrouping.GroupLevels = <>
      DataSource = srSetups
      EditActions = [geaCopyEh, geaSelectAllEh]
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = 'Verdana'
      FooterFont.Style = []
      OddRowColor = clSkyBlue
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghIncSearch, dghPreferIncSearch, dghDialogFind, dghColumnResize, dghColumnMove]
      ReadOnly = True
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
          Footers = <>
          Width = 44
        end
        item
          EditButtons = <>
          FieldName = 'Name'
          Footers = <>
          Width = 336
        end
        item
          EditButtons = <>
          FieldName = 'ValItem'
          Footers = <>
          Width = 237
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object actlst1: TActionList
    Left = 272
    Top = 112
    object acEdit: TAction
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnExecute = acEditExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acApply: TAction
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
      OnExecute = acApplyExecute
    end
  end
  object tbSetups: TAdsQuery
    DatabaseName = 'DMain.AdsCn'
    StoreActive = False
    AdsTableOptions.AdsRecordLockingMode = lmOptimistic
    SQL.Strings = (
      'Select * from V_Setups Order by Code')
    AdsConnection = DMain.AdsCn
    Left = 123
    Top = 113
    ParamData = <>
    object tbSetupsCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
    end
    object tbSetupsName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 50
    end
    object tbSetupsValItem: TWideStringField
      DisplayLabel = #1047#1085#1072#1095#1077#1085#1080#1077
      FieldName = 'ValItem'
      Size = 120
    end
    object tbSetupsValType: TIntegerField
      FieldName = 'ValType'
    end
    object tbSetupsValTypeName: TWideStringField
      FieldName = 'ValTypeName'
      Size = 12
    end
    object tbSetupsValString: TWideStringField
      FieldName = 'ValString'
      Size = 120
    end
    object tbSetupsValInteger: TIntegerField
      FieldName = 'ValInteger'
    end
    object tbSetupsValNumeric: TFMTBCDField
      FieldName = 'ValNumeric'
      Precision = 18
      Size = 3
    end
    object tbSetupsValDate: TDateField
      FieldName = 'ValDate'
    end
    object tbSetupsValTime: TTimeField
      FieldName = 'ValTime'
    end
    object tbSetupsValDateTime: TDateTimeField
      FieldName = 'ValDateTime'
    end
    object tbSetupsValLogical: TBooleanField
      FieldName = 'ValLogical'
    end
  end
  object srSetups: TDataSource
    DataSet = tbSetups
    Left = 203
    Top = 113
  end
end
