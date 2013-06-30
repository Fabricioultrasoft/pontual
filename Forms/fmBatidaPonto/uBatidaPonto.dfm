object fm_Batida_Ponto: Tfm_Batida_Ponto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  ClientHeight = 480
  ClientWidth = 640
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = True
  PopupMenu = pm_Comando
  Position = poScreenCenter
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object pn_Principal: TPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    TabOrder = 0
    object cpg_GroupInferior: TCategoryPanelGroup
      Left = 1
      Top = 381
      Width = 638
      Height = 98
      VertScrollBar.Smooth = True
      VertScrollBar.Style = ssFlat
      VertScrollBar.Tracking = True
      VertScrollBar.Visible = False
      Align = alBottom
      BiDiMode = bdLeftToRight
      ChevronAlignment = taRightJustify
      ChevronColor = clGray
      Enabled = False
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 16745090
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientBaseColor = clGray
      GradientColor = clBlack
      HeaderAlignment = taCenter
      HeaderFont.Charset = ANSI_CHARSET
      HeaderFont.Color = clWhite
      HeaderFont.Height = -11
      HeaderFont.Name = 'Verdana'
      HeaderFont.Style = [fsBold]
      HeaderHeight = 17
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 1
      object cp_Hora: TCategoryPanel
        Top = 0
        Height = 95
        Caption = 'Data e Hora Atual'
        Color = clBlack
        Enabled = False
        TabOrder = 0
        object ed_Hora: TLabel
          Left = 409
          Top = 0
          Width = 86
          Height = 86
          Align = alRight
          Caption = '00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -87
          Font.Name = 'DS-Digital'
          Font.Style = []
          ParentFont = False
        end
        object ed_Data: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 378
          Height = 79
          Align = alLeft
          Caption = '00-00-0000'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -80
          Font.Name = 'DS-Digital'
          Font.Style = []
          ParentFont = False
        end
        object Panel1: TPanel
          Left = 498
          Top = 0
          Width = 136
          Height = 76
          Align = alRight
          BevelOuter = bvNone
          Color = clBlack
          ParentBackground = False
          TabOrder = 0
          object ed_Minuto: TLabel
            Left = 12
            Top = 0
            Width = 86
            Height = 86
            Align = alRight
            Caption = '00'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -87
            Font.Name = 'DS-Digital'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            Transparent = True
          end
          object ed_dois_pontos: TLabel
            Left = 0
            Top = 0
            Width = 19
            Height = 86
            Align = alLeft
            Caption = ':'
            Color = clBlack
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -87
            Font.Name = 'DS-Digital'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object Panel2: TPanel
            Left = 101
            Top = 0
            Width = 35
            Height = 76
            Align = alRight
            BevelOuter = bvNone
            Color = clBlack
            ParentBackground = False
            TabOrder = 0
            object ed_segundo: TLabel
              Left = -3
              Top = 0
              Width = 36
              Height = 36
              Align = alRight
              Alignment = taCenter
              Caption = '00'
              Color = clBlack
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -37
              Font.Name = 'DS-Digital'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              Transparent = True
            end
          end
        end
      end
    end
    object cpg_GroupMeio: TCategoryPanelGroup
      Left = 1
      Top = 1
      Width = 638
      Height = 380
      VertScrollBar.Smooth = True
      VertScrollBar.Style = ssFlat
      VertScrollBar.Tracking = True
      VertScrollBar.Visible = False
      Align = alClient
      BiDiMode = bdLeftToRight
      ChevronAlignment = taRightJustify
      ChevronColor = clGray
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      GradientBaseColor = clGray
      GradientColor = clBlack
      HeaderAlignment = taCenter
      HeaderFont.Charset = ANSI_CHARSET
      HeaderFont.Color = clWhite
      HeaderFont.Height = -11
      HeaderFont.Name = 'Verdana'
      HeaderFont.Style = [fsBold]
      HeaderHeight = 17
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      object cp_grid_Horario_Dia: TCategoryPanel
        Top = 0
        Height = 377
        Caption = 'Registros do dia'
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 16745090
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object dbg_Batida: TDBGrid
          Left = 0
          Top = 0
          Width = 634
          Height = 290
          Align = alClient
          Color = clBlack
          DataSource = ds_Batida_Dia_Func
          DrawingStyle = gdsGradient
          GradientEndColor = clBlack
          GradientStartColor = clGray
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlack
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnKeyDown = dbg_BatidaKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'nr_seq_funcionario'
              Title.Alignment = taRightJustify
              Title.Caption = 'C'#243'd.'
              Title.Color = clWhite
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_funcionario'
              Title.Caption = 'Funcion'#225'rio'
              Title.Color = clBlack
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 190
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'hr_batida'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Verdana'
              Font.Style = [fsBold]
              Title.Caption = 'Hora'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ent_Sai'
              Title.Caption = 'Entrada/Sa'#237'da'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWhite
              Title.Font.Height = -11
              Title.Font.Name = 'Verdana'
              Title.Font.Style = [fsBold]
              Width = 99
              Visible = True
            end>
        end
        object mm_historico_oper: TMemo
          Left = 0
          Top = 290
          Width = 634
          Height = 68
          Align = alBottom
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = 16745090
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  object pm_Comando: TPopupMenu
    Left = 544
    Top = 240
    object mi_Encerrar: TMenuItem
      Caption = 'Encerrar'
      OnClick = mi_EncerrarClick
    end
  end
  object sp_consistir_batida_ponto: TADOStoredProc
    Connection = Banco_dm.Conexao_banco_aco
    ProcedureName = 'consistir_batida_ponto'
    Parameters = <
      item
        Name = 'p_nr_seq_funcionario'
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'p_erro'
        DataType = ftWideString
        Direction = pdOutput
        Size = 8190
        Value = Null
      end
      item
        Name = 'p_cod_erro'
        DataType = ftInteger
        Direction = pdOutput
        Precision = 10
        Value = Null
      end>
    Left = 208
    Top = 168
  end
  object ds_Batida_Dia_Func: TDataSource
    DataSet = qy_Batida_Dia_Func
    Left = 208
    Top = 240
  end
  object qy_Batida_Dia_Func: TADOQuery
    Parameters = <>
    Left = 344
    Top = 240
  end
end
