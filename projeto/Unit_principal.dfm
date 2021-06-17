object Form_principalmenu: TForm_principalmenu
  Left = 0
  Top = 0
  Caption = 'Menu principal'
  ClientHeight = 279
  ClientWidth = 635
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menu
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object menu: TMainMenu
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 264
    Top = 80
    object Cadastrohoras1: TMenuItem
      Caption = 'Cadastro'
      object Lancamentohoras1: TMenuItem
        Caption = 'Funcion'#225'rio'
        OnClick = Lancamentohoras1Click
      end
    end
    object Consultatotaldemodeobra1: TMenuItem
      Caption = 'Consulta'
      object Consulta1: TMenuItem
        Caption = 'Funcion'#225'rio'
        OnClick = Consulta1Click
      end
    end
  end
end
