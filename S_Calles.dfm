object frmCalles: TfrmCalles
  Left = 202
  Top = 185
  Caption = #1057#1087#1080#1089#1086#1082' '#1086#1073#1088#1072#1097#1077#1085#1080#1081
  ClientHeight = 578
  ClientWidth = 881
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnlSearch: TPanel
    Left = 0
    Top = 0
    Width = 881
    Height = 120
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object Panel4: TPanel
      Left = 700
      Top = 0
      Width = 181
      Height = 120
      Align = alRight
      BevelOuter = bvNone
      ParentBackground = False
      TabOrder = 1
      object BitBtn4: TBitBtn
        Left = 7
        Top = 38
        Width = 165
        Height = 30
        Action = acSearch
        Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093
        Default = True
        TabOrder = 0
      end
      object BitBtn11: TBitBtn
        Left = 7
        Top = 73
        Width = 165
        Height = 30
        Action = acSearchClear
        Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
        TabOrder = 1
      end
    end
    object PageCtrl: TPageControl
      Left = 0
      Top = 0
      Width = 700
      Height = 120
      ActivePage = TSheetMain
      Align = alClient
      TabOrder = 0
      object TSheetMain: TTabSheet
        BorderWidth = 3
        Caption = #1054#1089#1085#1086#1074#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel5: TPanel
          Left = 0
          Top = 0
          Width = 686
          Height = 85
          Align = alClient
          BevelInner = bvLowered
          BorderWidth = 2
          ParentBackground = False
          TabOrder = 0
          object Panel6: TPanel
            Left = 4
            Top = 4
            Width = 678
            Height = 77
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            ParentBackground = False
            TabOrder = 0
            object Label5: TLabel
              Left = 272
              Top = 8
              Width = 89
              Height = 14
              Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            end
            object Label6: TLabel
              Left = 288
              Top = 32
              Width = 73
              Height = 14
              Caption = #1042#1080#1076' '#1074#1099#1079#1086#1074#1072
            end
            object Label7: TLabel
              Left = 312
              Top = 53
              Width = 46
              Height = 14
              Caption = #1056#1077#1075#1080#1086#1085
            end
            object GroupBox1: TGroupBox
              Left = 3
              Top = 3
              Width = 257
              Height = 71
              Align = alLeft
              Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1074#1099#1079#1086#1074#1072
              TabOrder = 0
              object Label1: TLabel
                Left = 18
                Top = 21
                Width = 64
                Height = 14
                Caption = #1053#1072#1095'. '#1076#1072#1090#1072
              end
              object Label4: TLabel
                Left = 21
                Top = 45
                Width = 63
                Height = 14
                Caption = #1050#1086#1085'. '#1076#1072#1090#1072
              end
              object edtDateStart: TDBDateTimeEditEh
                Left = 90
                Top = 18
                Width = 121
                Height = 22
                DynProps = <>
                EditButtons = <>
                ImeName = #1056#1091#1089#1089#1082#1072#1103
                Kind = dtkDateEh
                TabOrder = 0
                Visible = True
              end
              object edtDateEnd: TDBDateTimeEditEh
                Left = 90
                Top = 43
                Width = 121
                Height = 22
                DynProps = <>
                EditButtons = <>
                ImeName = #1056#1091#1089#1089#1082#1072#1103
                Kind = dtkDateEh
                TabOrder = 1
                Visible = True
              end
            end
            object edtSysUser: TDBEditEh
              Left = 368
              Top = 4
              Width = 177
              Height = 22
              DynProps = <>
              EditButtons = <>
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              TabOrder = 1
              Visible = True
            end
            object edtCallType: TDBLookupComboboxEh
              Left = 368
              Top = 28
              Width = 290
              Height = 22
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              DynProps = <>
              EditButtons = <>
              KeyField = 'Code'
              ListField = 'Name'
              ListSource = DMain.srCallTypes
              TabOrder = 2
              Visible = True
            end
            object edtCallRegion: TDBLookupComboboxEh
              Left = 368
              Top = 52
              Width = 290
              Height = 22
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              DynProps = <>
              EditButtons = <>
              KeyField = 'Code'
              ListField = 'Name'
              ListSource = DMain.srRegions
              TabOrder = 3
              Visible = True
            end
          end
        end
      end
      object TSheetAddon: TTabSheet
        BorderWidth = 3
        Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1087#1086#1080#1089#1082#1072
        ImageIndex = 1
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 686
          Height = 85
          Align = alClient
          BevelInner = bvLowered
          BorderWidth = 2
          ParentBackground = False
          TabOrder = 0
          object Panel8: TPanel
            Left = 4
            Top = 4
            Width = 678
            Height = 77
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            ParentBackground = False
            TabOrder = 0
            object Label3: TLabel
              Left = 476
              Top = 18
              Width = 14
              Height = 14
              Caption = 'ID'
            end
            object Label2: TLabel
              Left = 249
              Top = 19
              Width = 57
              Height = 14
              Caption = #1058#1077#1083#1077#1092#1086#1085
            end
            object Label10: TLabel
              Left = 266
              Top = 43
              Width = 39
              Height = 14
              Caption = #1054#1090#1074#1077#1090
            end
            object GroupBox2: TGroupBox
              Left = 3
              Top = 3
              Width = 230
              Height = 71
              Align = alLeft
              Caption = #1044#1080#1072#1087#1072#1079#1086#1085' '#1074#1088#1077#1084#1077#1085#1080' '#1088#1077#1075#1080#1089#1090#1088#1072#1094#1080#1080
              TabOrder = 0
              object Label8: TLabel
                Left = 18
                Top = 22
                Width = 64
                Height = 14
                Caption = #1053#1072#1095'. '#1076#1072#1090#1072
              end
              object Label9: TLabel
                Left = 21
                Top = 46
                Width = 63
                Height = 14
                Caption = #1050#1086#1085'. '#1076#1072#1090#1072
              end
              object edtRegStart: TDBDateTimeEditEh
                Left = 90
                Top = 19
                Width = 121
                Height = 22
                DynProps = <>
                EditButtons = <>
                ImeName = #1056#1091#1089#1089#1082#1072#1103
                Kind = dtkDateEh
                TabOrder = 0
                Visible = True
              end
              object edtRegEnd: TDBDateTimeEditEh
                Left = 90
                Top = 44
                Width = 121
                Height = 22
                DynProps = <>
                EditButtons = <>
                ImeName = #1056#1091#1089#1089#1082#1072#1103
                Kind = dtkDateEh
                TabOrder = 1
                Visible = True
              end
            end
            object edtCallPhone: TDBEditEh
              Left = 314
              Top = 16
              Width = 150
              Height = 22
              DynProps = <>
              EditButtons = <>
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              TabOrder = 1
              Visible = True
            end
            object edtCallAnswer: TDBEditEh
              Left = 314
              Top = 41
              Width = 334
              Height = 22
              DynProps = <>
              EditButtons = <>
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              TabOrder = 3
              Visible = True
            end
            object edtCallID: TDBNumberEditEh
              Left = 498
              Top = 16
              Width = 150
              Height = 22
              DynProps = <>
              EditButtons = <>
              ImeName = #1056#1091#1089#1089#1082#1072#1103
              TabOrder = 2
              Visible = True
            end
          end
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 120
    Width = 699
    Height = 416
    Align = alClient
    BevelInner = bvLowered
    ParentBackground = False
    TabOrder = 1
    object cxGridCalles: TcxGrid
      Left = 2
      Top = 2
      Width = 695
      Height = 412
      Align = alClient
      BorderStyle = cxcbsNone
      PopupMenu = PopupMenu1
      TabOrder = 0
      LookAndFeel.Kind = lfOffice11
      object btvCalles: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = srCalles
        DataController.Filter.Options = [fcoCaseInsensitive]
        DataController.Options = [dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding]
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <
          item
            Kind = skCount
            FieldName = 'RRowID'
            Column = btvCallesRRowID
          end>
        DataController.Summary.SummaryGroups = <>
        FilterRow.Visible = True
        FilterRow.ApplyChanges = fracImmediately
        OptionsBehavior.CellHints = True
        OptionsBehavior.IncSearch = True
        OptionsCustomize.ColumnsQuickCustomization = True
        OptionsData.Deleting = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.MultiSelect = True
        OptionsView.Footer = True
        OptionsView.GroupFooterMultiSummaries = True
        OptionsView.Indicator = True
        object btvCallesRRowID: TcxGridDBColumn
          DataBinding.FieldName = 'RRowID'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 81
        end
        object btvCallesSysTime: TcxGridDBColumn
          DataBinding.FieldName = 'SysTime'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 146
        end
        object btvCallesCallTime: TcxGridDBColumn
          DataBinding.FieldName = 'CallTime'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 149
        end
        object btvCallesSysUser: TcxGridDBColumn
          DataBinding.FieldName = 'SysUser'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 135
        end
        object btvCallesUserName: TcxGridDBColumn
          DataBinding.FieldName = 'UserName'
          HeaderAlignmentHorz = taCenter
          Width = 269
        end
        object btvCallesCallType: TcxGridDBColumn
          DataBinding.FieldName = 'CallType'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
        end
        object btvCallesCallTypeName: TcxGridDBColumn
          DataBinding.FieldName = 'CallTypeName'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
        end
        object btvCallesCallRegion: TcxGridDBColumn
          DataBinding.FieldName = 'CallRegion'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 101
        end
        object btvCallesCallRegionName: TcxGridDBColumn
          DataBinding.FieldName = 'CallRegionName'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 256
        end
        object btvCallesCallPhone: TcxGridDBColumn
          DataBinding.FieldName = 'CallPhone'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
        end
        object btvCallesCallNote: TcxGridDBColumn
          DataBinding.FieldName = 'CallNote'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 143
        end
        object btvCallesCallAnswer: TcxGridDBColumn
          DataBinding.FieldName = 'CallAnswer'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Width = 554
        end
      end
      object cxGridCallesLevel1: TcxGridLevel
        GridView = btvCalles
      end
    end
  end
  object pnlActions: TPanel
    Left = 699
    Top = 120
    Width = 182
    Height = 416
    Align = alRight
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 2
    object BitBtn2: TBitBtn
      Left = 8
      Top = 96
      Width = 165
      Height = 30
      Action = acCallEdit
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 2
    end
    object BitBtn3: TBitBtn
      Left = 8
      Top = 156
      Width = 165
      Height = 30
      Action = acCallDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 4
    end
    object BitBtn6: TBitBtn
      Left = 7
      Top = 186
      Width = 166
      Height = 30
      Action = acExcel
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' MS Excel'
      TabOrder = 5
    end
    object BitBtn1: TBitBtn
      Left = 8
      Top = 246
      Width = 165
      Height = 30
      Action = acGridBestFit
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
      TabOrder = 7
    end
    object BitBtn7: TBitBtn
      Left = 8
      Top = 36
      Width = 165
      Height = 30
      Action = acCallAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      TabOrder = 0
    end
    object BitBtn10: TBitBtn
      Left = 8
      Top = 66
      Width = 165
      Height = 30
      Action = acCallAddByTemplate
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#1096#1072#1073#1083#1086#1085#1091
      TabOrder = 1
    end
    object BitBtn9: TBitBtn
      Left = 8
      Top = 216
      Width = 165
      Height = 30
      Action = acCallDutyReport
      Caption = #1054#1090#1095#1077#1090' '#1086' '#1076#1077#1078#1091#1088#1089#1090#1074#1077
      TabOrder = 6
    end
    object BitBtn13: TBitBtn
      Left = 8
      Top = 126
      Width = 165
      Height = 30
      Action = acCallSendAgain
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1079#1072#1085#1086#1074#1086
      TabOrder = 3
    end
  end
  object Panel9: TPanel
    Left = 0
    Top = 536
    Width = 881
    Height = 42
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    DesignSize = (
      881
      42)
    object BitBtn5: TBitBtn
      Left = 741
      Top = 6
      Width = 130
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      TabOrder = 2
    end
    object BitBtn8: TBitBtn
      Left = 11
      Top = 6
      Width = 130
      Height = 30
      Action = acSrvActions
      Caption = #1055#1072#1085#1077#1083#1100' '#1076#1077#1081#1089#1090#1074#1080#1081
      TabOrder = 0
    end
    object BitBtn12: TBitBtn
      Left = 141
      Top = 6
      Width = 130
      Height = 30
      Action = acSrvSearch
      Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 200
    Top = 288
    object acCallAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = acCallAddExecute
    end
    object acCallAddByTemplate: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086' '#1096#1072#1073#1083#1086#1085#1091
      OnExecute = acCallAddByTemplateExecute
    end
    object acCallEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = acCallEditExecute
    end
    object acCallDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnExecute = acCallDeleteExecute
    end
    object acCallSendAgain: TAction
      Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1100' '#1079#1072#1085#1086#1074#1086
      OnExecute = acCallSendAgainExecute
    end
    object acCallDutyReport: TAction
      Caption = #1054#1090#1095#1077#1090' '#1086' '#1076#1077#1078#1091#1088#1089#1090#1074#1077
      OnExecute = acCallDutyReportExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acExcel: TAction
      Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' MS Excel'
      OnExecute = acExcelExecute
    end
    object acSearch: TAction
      Caption = #1055#1086#1080#1089#1082' '#1076#1072#1085#1085#1099#1093
      OnExecute = acSearchExecute
    end
    object acSearchClear: TAction
      Caption = #1054#1095#1080#1089#1090#1080#1090#1100' '#1087#1072#1088#1072#1084#1077#1090#1088#1099
      OnExecute = acSearchClearExecute
    end
    object acGridBestFit: TAction
      Caption = #1054#1087#1090#1080#1084#1072#1083#1100'. '#1087#1086#1076#1075#1086#1085#1082#1072
      OnExecute = acGridBestFitExecute
    end
    object acSrvActions: TAction
      Caption = #1055#1072#1085#1077#1083#1100' '#1076#1077#1081#1089#1090#1074#1080#1081
      OnExecute = acSrvActionsExecute
    end
    object acSrvSearch: TAction
      Caption = #1055#1072#1085#1077#1083#1100' '#1087#1086#1080#1089#1082#1072
      OnExecute = acSrvSearchExecute
    end
  end
  object srCalles: TDataSource
    DataSet = tbCalles
    Left = 112
    Top = 288
  end
  object tbCalles: TAdsQuery
    DatabaseName = 'DMain.AdsCn'
    StoreActive = False
    SQL.Strings = (
      'Select * from V_Calles')
    AdsConnection = DMain.AdsCn
    Left = 40
    Top = 288
    ParamData = <>
    object tbCallesRRowID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'RRowID'
    end
    object tbCallesSysTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1088#1077#1075'.'
      FieldName = 'SysTime'
    end
    object tbCallesSysUser: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'SysUser'
    end
    object tbCallesUserName: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'. '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      FieldName = 'UserName'
      Size = 50
    end
    object tbCallesCallTime: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1074#1099#1079#1086#1074#1072
      FieldName = 'CallTime'
    end
    object tbCallesCallType: TIntegerField
      DisplayLabel = #1042#1080#1076
      FieldName = 'CallType'
    end
    object tbCallesCallRegion: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1088#1077#1075#1080#1086#1085#1072
      FieldName = 'CallRegion'
    end
    object tbCallesCallTypeName: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1074#1099#1079#1086#1074#1072
      FieldName = 'CallTypeName'
      Size = 50
    end
    object tbCallesCallRegionName: TWideStringField
      DisplayLabel = #1056#1077#1075#1080#1086#1085
      FieldName = 'CallRegionName'
      Size = 50
    end
    object tbCallesCallPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      FieldName = 'CallPhone'
    end
    object tbCallesCallNote: TWideMemoField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'CallNote'
      BlobType = ftWideMemo
      Size = 1
    end
    object tbCallesCallAnswer: TWideStringField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
      FieldName = 'CallAnswer'
      Size = 120
    end
  end
  object cxGridPopupMenu1: TcxGridPopupMenu
    Grid = cxGridCalles
    PopupMenus = <>
    Left = 296
    Top = 288
  end
  object PopupMenu1: TPopupMenu
    Left = 408
    Top = 288
    object N1: TMenuItem
      Action = acCallAdd
    end
    object N2: TMenuItem
      Action = acCallAddByTemplate
    end
    object N3: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1087#1080#1089#1100
      OnClick = acCallEditExecute
    end
    object N4: TMenuItem
      Action = acCallDelete
    end
    object MSExcel1: TMenuItem
      Action = acExcel
    end
    object N6: TMenuItem
      Action = acGridBestFit
    end
    object N8: TMenuItem
      Action = acCallDutyReport
    end
    object N7: TMenuItem
      Action = acSrvActions
    end
    object N5: TMenuItem
      Action = acSrvSearch
    end
  end
end
