object Form_resultados: TForm_resultados
  Left = 0
  Top = 0
  Caption = 'Form_resultados'
  ClientHeight = 612
  ClientWidth = 924
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 924
    Height = 296
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 1
      Width = 922
      Height = 56
      Align = alTop
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 161
        Top = 21
        Width = 73
        Height = 29
        Caption = 'Consultar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        OnClick = SpeedButton1Click
      end
      object Ed_nome: TEdit
        Left = 24
        Top = 22
        Width = 121
        Height = 28
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'Digite o nome'
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 57
      Width = 922
      Height = 238
      Align = alClient
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'situacao'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_hora'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'observacao'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'horas'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'periodo'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'total'
          Width = 60
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 296
    Width = 924
    Height = 316
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 25
      Top = 16
      Width = 198
      Height = 23
      Caption = 'Digite um intervalo de tempo '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 162
      Top = 46
      Width = 10
      Height = 23
      Caption = 'A'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 25
      Top = 96
      Width = 96
      Height = 22
      Caption = 'Calcular'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Label3: TLabel
      Left = 25
      Top = 136
      Width = 254
      Height = 23
      Caption = 'Valor gasto no periodo com salarios:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial Narrow'
      Font.Style = []
      ParentFont = False
    end
    object Ed_periodo1: TEdit
      Left = 25
      Top = 45
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object Ed_periodo2: TEdit
      Left = 190
      Top = 45
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object Ed_totalGasto: TEdit
      Left = 25
      Top = 173
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 2
    end
  end
  object FuncionarioConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=funcionario')
    Connected = True
    LoginPrompt = False
    Left = 661
    Top = 525
  end
  object CadfuncionarioTable: TFDQuery
    Active = True
    Connection = FuncionarioConnection
    SQL.Strings = (
      'SELECT * FROM funcionario.cadfuncionario')
    Left = 764
    Top = 528
  end
  object DataSource1: TDataSource
    DataSet = CadfuncionarioTable
    Left = 840
    Top = 528
  end
end
