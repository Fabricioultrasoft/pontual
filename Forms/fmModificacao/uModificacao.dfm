object fmModificacao: TfmModificacao
  Left = 0
  Top = 0
  ClientHeight = 51
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 211
    Top = 31
    Width = 83
    Height = 14
    Alignment = taRightJustify
    Caption = 'Data Modifica'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 31
    Width = 98
    Height = 14
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio Modifica'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 211
    Top = 8
    Width = 62
    Height = 14
    Alignment = taRightJustify
    Caption = 'Data Cria'#231#227'o'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 75
    Height = 13
    Alignment = taRightJustify
    Caption = 'Usu'#225'rio Cria'#231#227'o'
  end
  object ed_dt_data_atualizacao: TFocusEdit
    Left = 296
    Top = 27
    Width = 108
    Height = 22
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    NormalColor = clWindow
    FocusColor = 15590345
    ErrorColor = 13290239
    AlertarCorrecao = False
  end
  object ed_nm_usuario_atualizacao: TFocusEdit
    Left = 109
    Top = 27
    Width = 98
    Height = 22
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    NormalColor = clWindow
    FocusColor = 15590345
    ErrorColor = 13290239
    AlertarCorrecao = False
  end
  object ed_dt_data_criacao: TFocusEdit
    Left = 296
    Top = 4
    Width = 108
    Height = 22
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    NormalColor = clWindow
    FocusColor = 15590345
    ErrorColor = 13290239
    AlertarCorrecao = False
  end
  object ed_nm_usuario_criacao: TFocusEdit
    Left = 109
    Top = 4
    Width = 99
    Height = 22
    TabStop = False
    Alignment = taRightJustify
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
    NormalColor = clWindow
    FocusColor = 15590345
    ErrorColor = 13290239
    AlertarCorrecao = False
  end
end
