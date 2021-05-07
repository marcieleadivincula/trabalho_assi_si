object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 267
  Width = 479
  object fdConexao: TFDConnection
    Params.Strings = (
      'Database=funcionario'
      'User_Name=root'
      'Password=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 136
    Top = 64
  end
  object qSQL: TFDQuery
    Connection = fdConexao
    Left = 240
    Top = 72
  end
  object qSELECT: TFDCommand
    Connection = fdConexao
    CommandText.Strings = (
      '')
    Left = 312
    Top = 120
  end
  object FDConsulta: TFDQuery
    Connection = fdConexao
    Left = 184
    Top = 144
  end
end
