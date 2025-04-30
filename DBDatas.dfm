object DMain: TDMain
  OldCreateOrder = False
  Height = 218
  Width = 348
  object AdsCn: TAdsConnection
    ConnectPath = 'D:\CONSTRUC\Delphi2010\CallCentre\DBase\CallCentre.add'
    AdsServerTypes = [stADS_REMOTE, stADS_LOCAL]
    LoginPrompt = False
    Username = 'adssys'
    StoreConnected = False
    AdsCollation = 'RUSSIAN_VFP_CI_AS_1251'
    AfterConnect = AdsCnAfterConnect
    BeforeConnect = AdsCnBeforeConnect
    Left = 23
    Top = 8
  end
  object tbAccess: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    SQL.Strings = (
      
        'Select * from D_UserRights Where (Grantee = :Grantee) and (Table' +
        'Name = :TableName)')
    AdsConnection = AdsCn
    Left = 178
    Top = 106
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Grantee'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TableName'
        ParamType = ptUnknown
      end>
    object tbAccessGrantee: TAdsStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'Grantee'
    end
    object tbAccessFldName2: TAdsStringField
      DisplayLabel = #1055#1086#1083#1077
      FieldName = 'FldName'
    end
    object tbAccessComment: TMemoField
      DisplayLabel = #1054#1087#1080#1089#1072#1085#1080#1077' '#1087#1086#1083#1103
      FieldName = 'Comment'
      BlobType = ftMemo
      Size = 1
    end
    object tbAccessSelectName: TAdsStringField
      DisplayLabel = #1042#1099#1073#1086#1088#1082#1072
      FieldName = 'SelectName'
      Size = 10
    end
    object tbAccessUpdateName: TAdsStringField
      DisplayLabel = #1052#1086#1076#1080#1092#1080#1082#1072#1094#1080#1103
      FieldName = 'UpdateName'
      Size = 10
    end
    object tbAccessInsertName: TAdsStringField
      DisplayLabel = #1042#1089#1090#1072#1074#1082#1072
      FieldName = 'InsertName'
      Size = 10
    end
    object tbAccessDeleteName: TAdsStringField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1080#1077
      FieldName = 'DeleteName'
      Size = 10
    end
  end
  object srAccess: TDataSource
    DataSet = tbAccess
    Left = 266
    Top = 107
  end
  object tbUGroups: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    SQL.Strings = (
      'Select * from D_UserGroups Where RUser = :RUser')
    AdsConnection = AdsCn
    Left = 178
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'RUser'
        ParamType = ptUnknown
      end>
    object tbUGroupsRUser: TWideStringField
      DisplayLabel = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      FieldName = 'RUser'
      Size = 50
    end
    object tbUGroupsRGroup: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      FieldName = 'RGroup'
      Size = 100
    end
    object tbUGroupsRGroupName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077' '#1075#1088#1091#1087#1087#1099
      FieldName = 'RGroupName'
      Size = 100
    end
  end
  object srUGroups: TDataSource
    DataSet = tbUGroups
    Left = 267
    Top = 11
  end
  object tbSysTables: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    SQL.Strings = (
      'Select * from D_SysTables')
    AdsConnection = AdsCn
    Left = 178
    Top = 57
    ParamData = <>
    object tbSysTablesName: TWideStringField
      FieldName = 'Name'
    end
    object tbSysTablesComment: TWideStringField
      FieldName = 'Comment'
      Size = 1024
    end
  end
  object srSysTables: TDataSource
    DataSet = tbSysTables
    Left = 268
    Top = 58
  end
  object srRegions: TDataSource
    DataSet = tbRegions
    Left = 103
    Top = 57
  end
  object tbRegions: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    RequestLive = True
    SQL.Strings = (
      'Select {Static} * from R_Regions Order by Code')
    AdsConnection = AdsCn
    Left = 23
    Top = 57
    ParamData = <>
    object tbRegionsCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
    end
    object tbRegionsName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 50
    end
  end
  object tbCallTypes: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    RequestLive = True
    SQL.Strings = (
      'Select * from V_CallTypes Order by Code')
    AdsConnection = AdsCn
    Left = 23
    Top = 105
    ParamData = <>
    object tbCallTypesCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
    end
    object tbCallTypesName: TWideStringField
      DisplayLabel = #1053#1072#1079#1074#1072#1085#1080#1077
      FieldName = 'Name'
      Size = 50
    end
    object tbCallTypesIsEMailSend: TBooleanField
      DisplayLabel = 'EMail'
      FieldName = 'IsEMailSend'
    end
    object tbCallTypesEMailTo: TWideMemoField
      FieldName = 'EMailTo'
      BlobType = ftWideMemo
      Size = 1
    end
    object tbCallTypesEMailCopy: TWideMemoField
      FieldName = 'EMailCopy'
      BlobType = ftWideMemo
      Size = 1
    end
  end
  object srCallTypes: TDataSource
    DataSet = tbCallTypes
    Left = 103
    Top = 105
  end
  object tbCallTemplates: TAdsQuery
    DatabaseName = 'AdsCn'
    StoreActive = False
    SQL.Strings = (
      'Select * from V_CallTemplates Order by Code')
    AdsConnection = AdsCn
    Left = 178
    Top = 154
    ParamData = <>
    object tbCallTemplatesCode: TIntegerField
      DisplayLabel = #1050#1086#1076
      FieldName = 'Code'
    end
    object tbCallTemplatesCallType: TIntegerField
      DisplayLabel = #1050#1086#1076' '#1090#1080#1087#1072
      FieldName = 'CallType'
    end
    object tbCallTemplatesCallTypeName: TWideStringField
      DisplayLabel = #1058#1080#1087' '#1074#1099#1079#1086#1074#1072
      FieldName = 'CallTypeName'
      Size = 50
    end
    object tbCallTemplatesCallAnswer: TWideStringField
      DisplayLabel = #1054#1090#1074#1077#1090' '#1086#1087#1077#1088#1072#1090#1086#1088#1072
      FieldName = 'CallAnswer'
      Size = 120
    end
    object tbCallTemplatesCallNote: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      FieldName = 'CallNote'
      Size = 160
    end
  end
  object srCallTemplates: TDataSource
    DataSet = tbCallTemplates
    Left = 266
    Top = 154
  end
end
