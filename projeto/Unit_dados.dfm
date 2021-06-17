object dm_dados: Tdm_dados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 267
  Width = 479
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=funcionario'
      'User_Name=root'
      'Password=#Adiv!ncul@93M@r'
      'CharacterSet=latin1'
      'DriverID=MySQL')
    Left = 136
    Top = 64
  end
  object qSQL: TFDQuery
    Connection = fdConexao
    Left = 64
    Top = 168
  end
  object qSELECT: TFDCommand
    Connection = fdConexao
    CommandText.Strings = (
      '')
    Left = 336
    Top = 200
  end
  object FDConsulta: TFDQuery
    Connection = fdConexao
    Left = 184
    Top = 184
  end
  object fdTrFuncionario: TFDTransaction
    Connection = fdConexao
    Left = 328
    Top = 56
  end
end
