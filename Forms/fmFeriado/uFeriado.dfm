inherited fm_Cadastro_Feriado: Tfm_Cadastro_Feriado
  Caption = 'Cadastro de Feriado'
  ClientHeight = 480
  ClientWidth = 640
  PopupMenu = pm_Feriado
  ExplicitWidth = 656
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 14
  object pc_Principal: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    ActivePage = ts_Cadastro
    Align = alClient
    Images = Banco_dm.img_List
    TabOrder = 0
    TabPosition = tpBottom
    object ts_Consulta: TTabSheet
      Caption = 'Consulta'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel1: TPanel
        Left = 0
        Top = 431
        Width = 632
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object bt_Consultar: TButton
          Left = 3
          Top = 1
          Width = 97
          Height = 20
          Caption = 'Consultar (F5)'
          ImageIndex = 0
          Images = Banco_dm.img_List
          TabOrder = 0
          OnClick = bt_ConsultarClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 632
        Height = 431
        Align = alClient
        Caption = 'Tabela Feriado'
        TabOrder = 1
        ExplicitLeft = 240
        ExplicitTop = 120
        ExplicitWidth = 185
        ExplicitHeight = 105
        object dbg_Feriado: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 19
          Width = 622
          Height = 407
          Align = alClient
          DataSource = ds_Lista_Feriado
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = dbg_FeriadoDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nr_sequencia'
              Title.Alignment = taRightJustify
              Title.Caption = 'Seq.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_feriado'
              Title.Caption = 'Descri'#231#227'o'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dia_mes'
              Title.Caption = 'Dia/M'#234's'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_ano'
              Title.Caption = 'Ano'
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_criacao'
              Title.Caption = 'Usu'#225'rio cria'#231'ao'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_atualizacao'
              Title.Caption = 'Usu'#225'rio Modifica'#231#227'o'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_criacao'
              Title.Caption = 'Data Cria'#231#227'o'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_atualizacao'
              Title.Caption = 'Data Modifica'#231#227'o'
              Width = 120
              Visible = True
            end>
        end
      end
    end
    object ts_Cadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 28
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object gb_Codigo_Sequencial: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 626
        Height = 48
        Align = alTop
        Caption = 'C'#243'digo Sequencial (Tabela Feriado)'
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 0
        object Label11: TLabel
          Left = 16
          Top = 22
          Width = 22
          Height = 14
          Caption = 'Seq.'
        end
        object ed_nr_sequencia: TFocusButtonedEdit
          Left = 91
          Top = 23
          Width = 82
          Height = 22
          Images = Banco_dm.img_List
          LeftButton.HotImageIndex = 0
          LeftButton.ImageIndex = 0
          LeftButton.PressedImageIndex = 0
          LeftButton.Visible = True
          NumbersOnly = True
          TabOrder = 0
          OnChange = ed_nr_sequenciaChange
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          Obrigatorio = False
          TipoCampo = tcInt
          Nome = 'C'#243'd. Sequencial'
          AlertarCorrecao = False
          Nome_Campo_Banco = 'nm_usuario'
        end
      end
      object gb_Dados: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 57
        Width = 626
        Height = 393
        Align = alClient
        Caption = 'Dados'
        TabOrder = 1
        TabStop = True
        object Label1: TLabel
          Left = 16
          Top = 40
          Width = 25
          Height = 14
          Caption = 'Data:'
        end
        object Label2: TLabel
          Left = 16
          Top = 67
          Width = 52
          Height = 14
          Caption = 'Descri'#231#227'o:'
        end
        object Label3: TLabel
          Left = 91
          Top = 16
          Width = 20
          Height = 14
          Caption = 'M'#234's'
        end
        object Label4: TLabel
          Left = 239
          Top = 16
          Width = 15
          Height = 14
          Caption = 'Dia'
        end
        object Label5: TLabel
          Left = 317
          Top = 16
          Width = 20
          Height = 14
          Caption = 'Ano'
        end
        object ed_ds_feriado: TFocusEdit
          Left = 88
          Top = 64
          Width = 451
          Height = 22
          TabOrder = 3
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          Obrigatorio = True
          Nome = 'Descri'#231#227'o do Feriado'
          AlertarCorrecao = False
        end
        object cb_Nr_dia_feriado: TFocusCombobox
          Left = 236
          Top = 36
          Width = 75
          Height = 22
          Style = csOwnerDrawVariable
          DropDownCount = 12
          TabOrder = 1
          Items.Strings = (
            '01'
            '02'
            '03'
            '04'
            '05'
            '06'
            '07'
            '08'
            '09'
            '10'
            '11'
            '12'
            '13'
            '14'
            '15'
            '16'
            '17'
            '18'
            '19'
            '20'
            '21'
            '22'
            '23'
            '24'
            '25'
            '26'
            '27'
            '28'
            '29'
            '30'
            '31')
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          Obrigatorio = True
          Nome = 'Dia do Feriado'
        end
        object ed_Nr_ano_feriado: TFocusButtonedEdit
          Left = 317
          Top = 36
          Width = 44
          Height = 22
          Hint = 
            'Para que uma data seja considerada para todos os anos, basta cad' +
            'astrar uma data informando mes e dia, deixando este campo (Ano) ' +
            'em branco.'
          Alignment = taRightJustify
          NumbersOnly = True
          TabOrder = 2
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          Obrigatorio = False
          Nome = 'Ano do feriado'
          AlertarCorrecao = False
        end
        object cb_Nr_mes_feriado: TFocusCombobox
          Left = 89
          Top = 36
          Width = 145
          Height = 22
          Style = csOwnerDrawVariable
          DropDownCount = 12
          TabOrder = 0
          OnClick = cb_Nr_mes_feriadoClick
          Items.Strings = (
            '01 - Janeiro'
            '02 - Fevereiro'
            '03 - Mar'#231'o'
            '04 - Abril'
            '05 - Maio'
            '06 - Junho'
            '07 - Julho'
            '08 - Agosto'
            '09 - Setembro'
            '10 - Outubro'
            '11 - Novembro'
            '12 - Dezembro')
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          Obrigatorio = True
          Nome = 'M'#234's do feriado'
        end
        object Panel3: TPanel
          Left = 2
          Top = 370
          Width = 622
          Height = 21
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 4
          DesignSize = (
            622
            21)
          object bt_Primeiro: TButton
            Left = 1
            Top = 0
            Width = 70
            Height = 20
            Caption = 'Primeiro'
            ImageIndex = 6
            Images = Banco_dm.img_List
            TabOrder = 0
            OnClick = bt_PrimeiroClick
          end
          object bt_Anterior: TButton
            Left = 75
            Top = 0
            Width = 70
            Height = 20
            Caption = 'Anterior'
            ImageIndex = 8
            Images = Banco_dm.img_List
            TabOrder = 1
            OnClick = bt_AnteriorClick
          end
          object bt_Proximo: TButton
            Left = 149
            Top = 0
            Width = 70
            Height = 20
            Caption = 'Pr'#243'ximo'
            ImageIndex = 7
            Images = Banco_dm.img_List
            TabOrder = 2
            OnClick = bt_ProximoClick
          end
          object bt_Ultimo: TButton
            Left = 223
            Top = 0
            Width = 70
            Height = 20
            Caption = #218'ltimo'
            ImageIndex = 9
            Images = Banco_dm.img_List
            TabOrder = 3
          end
          object bt_Novo: TButton
            Left = 340
            Top = 0
            Width = 70
            Height = 20
            Anchors = [akTop, akRight]
            Caption = 'Novo'
            ImageIndex = 2
            Images = Banco_dm.img_List
            TabOrder = 4
            OnClick = bt_NovoClick
          end
          object bt_Salvar: TButton
            Left = 414
            Top = 0
            Width = 70
            Height = 20
            Anchors = [akTop, akRight]
            Caption = 'Salvar'
            ImageIndex = 4
            Images = Banco_dm.img_List
            TabOrder = 5
            OnClick = bt_SalvarClick
          end
          object bt_Cancelar: TButton
            Left = 488
            Top = 0
            Width = 70
            Height = 20
            Anchors = [akTop, akRight]
            Caption = 'Cancelar'
            ImageIndex = 3
            Images = Banco_dm.img_List
            TabOrder = 6
            OnClick = bt_CancelarClick
          end
          object bt_Excluir: TButton
            Left = 562
            Top = 0
            Width = 70
            Height = 20
            Anchors = [akTop, akRight]
            Caption = 'Excluir'
            ImageIndex = 5
            Images = Banco_dm.img_List
            TabOrder = 7
            OnClick = bt_ExcluirClick
          end
        end
      end
    end
  end
  object pm_Feriado: TPopupMenu
    Left = 360
    Top = 232
    object mi_Consultar: TMenuItem
      Caption = 'Consultar'
      ShortCut = 116
      OnClick = mi_ConsultarClick
    end
  end
  object qy_Lista_Feriado: TADOQuery
    Parameters = <>
    Left = 240
    Top = 192
  end
  object ds_Lista_Feriado: TDataSource
    DataSet = qy_Lista_Feriado
    Left = 240
    Top = 248
  end
end
