inherited fm_Gerador_Entrada_Lote: Tfm_Gerador_Entrada_Lote
  BorderStyle = bsDialog
  Caption = 'Gerador de Entradas em Lote'
  ClientHeight = 106
  ClientWidth = 582
  FormStyle = fsStayOnTop
  Position = poDesktopCenter
  PrintScale = poProportional
  ScreenSnap = False
  ShowHint = False
  Visible = False
  WindowState = wsNormal
  ExplicitWidth = 588
  ExplicitHeight = 134
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 73
    Width = 582
    Height = 33
    Align = alClient
    TabOrder = 1
    TabStop = True
    DesignSize = (
      582
      33)
    object bt_Gerar: TButton
      Left = 502
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Gerar'
      ImageIndex = 4
      Images = Banco_dm.img_List
      TabOrder = 0
      OnClick = bt_GerarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 582
    Height = 73
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 45
      Top = 19
      Width = 13
      Height = 14
      Caption = 'De'
    end
    object Label2: TLabel
      Left = 175
      Top = 19
      Width = 17
      Height = 14
      Caption = 'At'#233
    end
    object Label3: TLabel
      Left = 5
      Top = 43
      Width = 73
      Height = 14
      Caption = 'Funcion'#225'rio(s):'
    end
    object Label4: TLabel
      Left = 284
      Top = 19
      Width = 12
      Height = 14
      Caption = #224's'
    end
    object dt_Inicial: TDateTimePicker
      Left = 80
      Top = 15
      Width = 89
      Height = 22
      Date = 41033.066076932870000000
      Time = 41033.066076932870000000
      TabOrder = 0
    end
    object dt_final: TDateTimePicker
      Left = 198
      Top = 15
      Width = 82
      Height = 22
      Date = 41033.066076932870000000
      Time = 41033.066076932870000000
      TabOrder = 1
    end
    object ed_hora: TFocusEdit
      Left = 304
      Top = 15
      Width = 42
      Height = 22
      Alignment = taRightJustify
      EditMask = '!99:99;1;_'
      MaxLength = 5
      TabOrder = 2
      Text = '  :  '
      NormalColor = clWindow
      FocusColor = 15590345
      ErrorColor = 13290239
      Obrigatorio = True
      TipoCampo = tcHora
      Nome = 'Hora'
      AlertarCorrecao = False
    end
    object ed_nr_seq_funcionario: TFocusButtonedEdit
      Left = 80
      Top = 39
      Width = 369
      Height = 22
      Images = Banco_dm.img_List
      LeftButton.HotImageIndex = 0
      LeftButton.ImageIndex = 0
      LeftButton.PressedImageIndex = 0
      LeftButton.Visible = True
      NumbersOnly = True
      ReadOnly = True
      RightButton.HotImageIndex = 5
      RightButton.ImageIndex = 5
      RightButton.PressedImageIndex = 5
      RightButton.Visible = True
      TabOrder = 3
      OnLeftButtonClick = ed_nr_seq_funcionarioLeftButtonClick
      OnRightButtonClick = ed_nr_seq_funcionarioRightButtonClick
      NormalColor = clWindow
      FocusColor = 15590345
      ErrorColor = 13290239
      Obrigatorio = False
      TipoCampo = tcInt
      Nome = 'Funcion'#225'rio'
      AlertarCorrecao = False
      Nome_Campo_Banco = 'nm_funcionario'
    end
  end
  object sp_gerar_horario_lote: TADOStoredProc
    ProcedureName = 'gerar_horario_lote'
    Parameters = <
      item
        Name = 'p_dt_inicial'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'p_dt_final'
        DataType = ftDateTime
        Value = Null
      end
      item
        Name = 'p_hora'
        DataType = ftString
        Value = Null
      end
      item
        Name = 'p_nr_seq_funcionario'
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = 'p_nm_usuario'
        DataType = ftString
        Size = 255
        Value = Null
      end
      item
        Name = 'p_rowsaffected'
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end>
    Left = 504
    Top = 16
  end
end
