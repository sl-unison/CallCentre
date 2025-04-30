object frmUsers: TfrmUsers
  Left = 306
  Top = 137
  BorderWidth = 5
  Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
  ClientHeight = 459
  ClientWidth = 677
  Color = clBtnFace
  Constraints.MinHeight = 400
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
    Top = 0
    Width = 677
    Height = 400
    Align = alClient
    BevelInner = bvLowered
    BorderWidth = 1
    ParentBackground = False
    TabOrder = 0
    object DBGridEh1: TDBGridEh
      Left = 3
      Top = 3
      Width = 671
      Height = 394
      Align = alClient
      BorderStyle = bsNone
      DataGrouping.GroupLevels = <>
      DataSource = srUsers
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
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
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
          FieldName = 'Login'
          Footer.Alignment = taCenter
          Footer.FieldName = 'Login'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 155
        end
        item
          EditButtons = <>
          FieldName = 'UserName'
          Footers = <>
          Width = 237
        end
        item
          EditButtons = <>
          FieldName = 'IsBlocked'
          Footers = <>
          Width = 49
        end
        item
          EditButtons = <>
          FieldName = 'IsCallAdd'
          Footers = <>
          Width = 72
        end
        item
          EditButtons = <>
          FieldName = 'IsCallEdit'
          Footers = <>
          Width = 70
        end
        item
          EditButtons = <>
          FieldName = 'IsCallDelete'
          Footers = <>
          Width = 62
        end
        item
          EditButtons = <>
          FieldName = 'IsCallExcel'
          Footers = <>
          Width = 43
        end
        item
          EditButtons = <>
          FieldName = 'IsReports'
          Footers = <>
          Width = 58
        end
        item
          EditButtons = <>
          FieldName = 'Remark'
          Footers = <>
          Width = 417
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 400
    Width = 677
    Height = 59
    Align = alBottom
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      677
      59)
    object BitBtn1: TBitBtn
      Left = 8
      Top = 18
      Width = 110
      Height = 30
      Action = acAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 118
      Top = 18
      Width = 110
      Height = 30
      Action = acEdit
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 228
      Top = 18
      Width = 110
      Height = 30
      Action = acDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 2
    end
    object BitBtn4: TBitBtn
      Left = 338
      Top = 18
      Width = 110
      Height = 30
      Action = acPassword
      Caption = #1055#1072#1088#1086#1083#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 3
    end
    object BitBtn6: TBitBtn
      Left = 448
      Top = 18
      Width = 110
      Height = 30
      Action = acAccess
      Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 4
    end
    object BitBtn8: TBitBtn
      Left = 564
      Top = 18
      Width = 110
      Height = 30
      Action = acClose
      Anchors = [akRight, akBottom]
      Caption = #1047#1072#1082#1088#1099#1090#1100
      DoubleBuffered = True
      ParentDoubleBuffered = False
      TabOrder = 5
    end
  end
  object ActionList1: TActionList
    Left = 200
    Top = 136
    object acAdd: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      ImageIndex = 0
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      ImageIndex = 1
      OnExecute = acEditExecute
    end
    object acDelete: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100
      ImageIndex = 2
      OnExecute = acDeleteExecute
    end
    object acPassword: TAction
      Caption = #1055#1072#1088#1086#1083#1100
      ImageIndex = 3
      OnExecute = acPasswordExecute
    end
    object acClose: TAction
      Caption = #1047#1072#1082#1088#1099#1090#1100
      OnExecute = acCloseExecute
    end
    object acSelect: TAction
      Caption = #1042#1099#1073#1088#1072#1090#1100
    end
    object acAccess: TAction
      Caption = #1056#1072#1079#1088#1077#1096#1077#1085#1080#1103
      OnExecute = acAccessExecute
    end
  end
  object tbUsers: TAdsQuery
    DatabaseName = 'DMain.AdsCn'
    StoreActive = False
    SQL.Strings = (
      'Select * from V_Users Order by Login')
    AdsConnection = DMain.AdsCn
    Left = 64
    Top = 136
    ParamData = <>
    object tbUsersLogin: TWideStringField
      DisplayLabel = #1051#1086#1075#1080#1085
      FieldName = 'Login'
    end
    object tbUsersUserName: TWideStringField
      DisplayLabel = #1060'.'#1048'.'#1054'. '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      FieldName = 'UserName'
      Size = 50
    end
    object tbUsersIsBlocked: TBooleanField
      DisplayLabel = #1041#1083#1086#1082
      FieldName = 'IsBlocked'
    end
    object tbUsersIsCallAdd: TBooleanField
      DisplayLabel = #1044#1086#1073#1072#1074#1080#1090#1100
      FieldName = 'IsCallAdd'
    end
    object tbUsersIsCallEdit: TBooleanField
      DisplayLabel = #1048#1079#1084#1077#1085#1080#1090#1100
      FieldName = 'IsCallEdit'
    end
    object tbUsersIsCallDelete: TBooleanField
      DisplayLabel = #1059#1076#1072#1083#1080#1090#1100
      FieldName = 'IsCallDelete'
    end
    object tbUsersIsCallExcel: TBooleanField
      DisplayLabel = 'Excel'
      FieldName = 'IsCallExcel'
    end
    object tbUsersIsReports: TBooleanField
      DisplayLabel = #1054#1090#1095#1077#1090#1099
      FieldName = 'IsReports'
    end
    object tbUsersRemark: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'Remark'
      Size = 80
    end
  end
  object srUsers: TDataSource
    DataSet = tbUsers
    Left = 128
    Top = 136
  end
end
