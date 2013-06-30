object fm_Gerencia_Horario: Tfm_Gerencia_Horario
  Left = 0
  Top = 0
  Caption = 'Ger'#234'ncia de Hor'#225'rio'
  ClientHeight = 480
  ClientWidth = 942
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = pm_Horario
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object pc_Principal: TPageControl
    Left = 0
    Top = 0
    Width = 942
    Height = 480
    ActivePage = ts_Calculo_Hora
    Align = alClient
    Images = Banco_dm.img_List
    TabOrder = 0
    TabPosition = tpBottom
    object ts_Consulta: TTabSheet
      Caption = 'Consulta'
      DoubleBuffered = True
      Highlighted = True
      ParentDoubleBuffered = False
      object gb_Grid: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 150
        Width = 928
        Height = 278
        Align = alClient
        Caption = 'Tabela: funcionario_ponto'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        object lv_ordenacao_setada: TListView
          AlignWithMargins = True
          Left = 738
          Top = 19
          Width = 185
          Height = 254
          Align = alRight
          Columns = <
            item
              AutoSize = True
              Caption = 'Campo'
            end
            item
              AutoSize = True
              Caption = 'Asc/Dsc'
            end>
          DoubleBuffered = True
          DragMode = dmAutomatic
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          IconOptions.AutoArrange = True
          ReadOnly = True
          ParentColor = True
          ParentDoubleBuffered = False
          ParentFont = False
          TabOrder = 0
          ViewStyle = vsReport
          Visible = False
        end
        object dbg_Consulta: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 19
          Width = 727
          Height = 254
          TabStop = False
          Align = alClient
          Ctl3D = True
          DataSource = ds_Consulta
          DrawingStyle = gdsGradient
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = dbg_ConsultaDblClick
          OnTitleClick = dbg_ConsultaTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nr_sequencia'
              Title.Caption = 'Seq.'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_seq_funcionario'
              Title.Caption = 'Seq.Func.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_batida'
              Title.Caption = 'Data Batida'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_criacao'
              Title.Caption = 'Usu'#225'rio Cria'#231#227'o'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_criacao'
              Title.Caption = 'Data Cria'#231#227'o'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_atualizacao'
              Title.Caption = 'Usu'#225'rio Modifica'#231#227'o'
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_atualizacao'
              Title.Caption = 'Data Modifica'#231#227'o'
              Width = 130
              Visible = True
            end>
        end
      end
      object gb_Filtros: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 928
        Height = 141
        Align = alTop
        Caption = 'Filtros'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object gb_Filtro_Criacao: TGroupBox
          Left = 3
          Top = 14
          Width = 453
          Height = 62
          Caption = 'Cria'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object Label11: TLabel
            Left = 167
            Top = 15
            Width = 17
            Height = 14
            Caption = 'At'#233
          end
          object Label12: TLabel
            Left = 17
            Top = 15
            Width = 16
            Height = 14
            Caption = 'De:'
          end
          object Label10: TLabel
            Left = 317
            Top = 15
            Width = 37
            Height = 14
            Caption = 'Usu'#225'rio'
          end
          object ed_hr_Criacao_ate: TFocusEdit
            Left = 272
            Top = 34
            Width = 41
            Height = 22
            Enabled = False
            EditMask = '!99:99;1;_'
            MaxLength = 5
            TabOrder = 3
            Text = '23:59'
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcHora
            AlertarCorrecao = True
            CodigoGrupoTela = 1
          end
          object ed_dt_Criacao_ate: TDateTimePicker
            Left = 167
            Top = 34
            Width = 105
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            ShowCheckbox = True
            Checked = False
            DateFormat = dfLong
            TabOrder = 2
            OnClick = ed_dt_Criacao_ateClick
          end
          object ed_hr_Criacao_de: TFocusEdit
            Left = 122
            Top = 34
            Width = 41
            Height = 22
            Enabled = False
            EditMask = '!99:99;1;_'
            MaxLength = 5
            TabOrder = 1
            Text = '00:00'
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcHora
            AlertarCorrecao = True
            CodigoGrupoTela = 1
          end
          object ed_dt_Criacao_de: TDateTimePicker
            Left = 17
            Top = 34
            Width = 105
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            ShowCheckbox = True
            Checked = False
            DateFormat = dfLong
            TabOrder = 0
            OnClick = ed_dt_Criacao_deClick
          end
          object ed_nm_usuario_criacao_filtro: TFocusEdit
            Left = 317
            Top = 34
            Width = 130
            Height = 22
            CharCase = ecLowerCase
            TabOrder = 4
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            AlertarCorrecao = False
            CodigoGrupoTela = 1
          end
        end
        object gb_Filtro_Modificacao: TGroupBox
          Left = 456
          Top = 14
          Width = 453
          Height = 62
          Caption = 'Modifica'#231#227'o'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object Label14: TLabel
            Left = 17
            Top = 15
            Width = 16
            Height = 14
            Caption = 'De:'
          end
          object Label15: TLabel
            Left = 167
            Top = 15
            Width = 17
            Height = 14
            Caption = 'At'#233
          end
          object Label13: TLabel
            Left = 317
            Top = 15
            Width = 37
            Height = 14
            Caption = 'Usu'#225'rio'
          end
          object ed_dt_modificacao_de: TDateTimePicker
            Left = 17
            Top = 33
            Width = 105
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            ShowCheckbox = True
            Checked = False
            DateFormat = dfLong
            TabOrder = 0
            OnClick = ed_dt_modificacao_deClick
          end
          object ed_dt_modificacao_ate: TDateTimePicker
            Left = 167
            Top = 33
            Width = 105
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            ShowCheckbox = True
            Checked = False
            DateFormat = dfLong
            TabOrder = 2
            OnClick = ed_dt_modificacao_ateClick
          end
          object ed_hr_Modificacao_de: TFocusEdit
            Left = 122
            Top = 33
            Width = 41
            Height = 22
            Enabled = False
            EditMask = '!99:99;1;_'
            MaxLength = 5
            TabOrder = 1
            Text = '00:00'
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcHora
            AlertarCorrecao = True
            CodigoGrupoTela = 1
          end
          object ed_hr_Modificacao_ate: TFocusEdit
            Left = 272
            Top = 33
            Width = 41
            Height = 22
            Enabled = False
            EditMask = '!99:99;1;_'
            MaxLength = 5
            TabOrder = 3
            Text = '23:59'
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcHora
            AlertarCorrecao = True
            CodigoGrupoTela = 1
          end
          object ed_nm_usuario_atualizacao_filtro: TFocusEdit
            Left = 317
            Top = 33
            Width = 130
            Height = 22
            CharCase = ecLowerCase
            TabOrder = 4
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            AlertarCorrecao = False
            CodigoGrupoTela = 1
          end
        end
        object gb_Filtro_Funcionario: TGroupBox
          Left = 320
          Top = 75
          Width = 86
          Height = 62
          Caption = 'Funcion'#225'rio'
          DoubleBuffered = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          object Label8: TLabel
            Left = 17
            Top = 14
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
          end
          object ed_Cd_Func: TFocusButtonedEdit
            Left = 17
            Top = 33
            Width = 54
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            TabOrder = 0
            OnLeftButtonClick = ed_Cd_FuncLeftButtonClick
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = False
            TipoCampo = tcInt
            Nome = 'C'#243'd. Funcion'#225'rio'
            AlertarCorrecao = False
            CodigoGrupoTela = 1
            Nome_Campo_Banco = 'nm_funcionario'
          end
        end
        object gb_Data_Batida: TGroupBox
          Left = 3
          Top = 76
          Width = 317
          Height = 62
          Caption = 'Batida do Ponto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object Label1: TLabel
            Left = 17
            Top = 15
            Width = 16
            Height = 14
            Caption = 'De:'
          end
          object Label2: TLabel
            Left = 167
            Top = 15
            Width = 17
            Height = 14
            Caption = 'At'#233
          end
          object ed_dt_Batida_De: TDateTimePicker
            Left = 17
            Top = 34
            Width = 105
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            ShowCheckbox = True
            DateFormat = dfLong
            TabOrder = 0
            OnClick = ed_dt_Batida_DeClick
          end
          object ed_dt_Batida_Ate: TDateTimePicker
            Left = 167
            Top = 34
            Width = 105
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            ShowCheckbox = True
            DateFormat = dfLong
            TabOrder = 2
            OnClick = ed_dt_Batida_AteClick
          end
          object ed_Hr_Batida_De: TFocusEdit
            Left = 122
            Top = 34
            Width = 41
            Height = 22
            EditMask = '!99:99;1;_'
            MaxLength = 5
            TabOrder = 1
            Text = '00:00'
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcHora
            AlertarCorrecao = True
            CodigoGrupoTela = 1
          end
          object ed_Hr_Batida_Ate: TFocusEdit
            Left = 272
            Top = 34
            Width = 41
            Height = 20
            EditMask = '!99:99;1;_'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Verdana'
            Font.Style = []
            MaxLength = 5
            ParentFont = False
            TabOrder = 3
            Text = '23:59'
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcHora
            AlertarCorrecao = True
            CodigoGrupoTela = 1
          end
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 431
        Width = 934
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 2
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
    end
    object ts_Cadastro: TTabSheet
      Caption = 'Cadastro'
      DoubleBuffered = True
      ImageIndex = 28
      ParentDoubleBuffered = False
      object gb_Manip_Client: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 928
        Height = 426
        Align = alClient
        TabOrder = 0
        object gb_dados_registro: TGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 67
          Width = 918
          Height = 70
          Align = alTop
          Caption = 'Dados do Registro'
          TabOrder = 1
          DesignSize = (
            918
            70)
          object Label16: TLabel
            Left = 15
            Top = 19
            Width = 59
            Height = 14
            Caption = 'Funcion'#225'rio:'
          end
          object Label17: TLabel
            Left = 15
            Top = 46
            Width = 55
            Height = 14
            Caption = 'Data Ponto:'
          end
          object ed_nm_funcionario: TFocusEdit
            Left = 143
            Top = 15
            Width = 476
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            Enabled = False
            TabOrder = 1
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            TipoCampo = tcInt
            AlertarCorrecao = False
          end
          object ed_dt_batida: TFocusEdit
            Left = 87
            Top = 43
            Width = 125
            Height = 21
            AutoSize = False
            EditMask = '!99/99/9999 99:99:99;1;_'
            MaxLength = 19
            TabOrder = 2
            Text = '  /  /       :  :  '
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcDataHora
            Nome = 'Data/Hora de Batida'
            AlertarCorrecao = False
          end
          object ed_nr_seq_funcionario: TFocusButtonedEdit
            Left = 87
            Top = 15
            Width = 54
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            TabOrder = 0
            OnChange = ed_nr_seq_funcionarioChange
            OnLeftButtonClick = ed_nr_seq_funcionarioLeftButtonClick
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            TipoCampo = tcInt
            Nome = 'Funcion'#225'rio'
            AlertarCorrecao = False
            Nome_Campo_Banco = 'nm_funcionario'
          end
          object cx_desconsiderar_forcar_ent_turno: TCheckBox
            Left = 224
            Top = 45
            Width = 209
            Height = 17
            Hint = 
              'Se checado, ir'#225' considerar efetivamente a hora registrada, desco' +
              'nsiderando a op'#231#227'o "For'#231'ar entrada turno" no relat'#243'rio de horas.'
            Caption = 'Desconsiderar "For'#231'ar entrada turno"'
            TabOrder = 3
          end
        end
        object gb_Codigo_Sequencial: TGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 19
          Width = 918
          Height = 42
          Align = alTop
          Caption = 'C'#243'digo Sequencial (Tabela funcionario_ponto)'
          Ctl3D = True
          ParentCtl3D = False
          TabOrder = 0
          TabStop = True
          object Label7: TLabel
            Left = 15
            Top = 18
            Width = 22
            Height = 14
            Caption = 'Seq.'
          end
          object ed_Nr_Sequencia: TFocusButtonedEdit
            Left = 87
            Top = 15
            Width = 103
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            TabOrder = 0
            OnChange = ed_Nr_SequenciaChange
            OnLeftButtonClick = ed_Nr_SequenciaLeftButtonClick
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = False
            TipoCampo = tcInt
            Nome = 'C'#243'd. Sequencial'
            AlertarCorrecao = False
            Nome_Campo_Banco = 'nr_sequencia'
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 432
        Width = 934
        Height = 21
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          934
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
          OnClick = bt_UltimoClick
        end
        object bt_Novo: TButton
          Left = 639
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
          Left = 713
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
          Left = 787
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
          Left = 861
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
    object ts_Calculo_Hora: TTabSheet
      Caption = 'C'#225'lculo de Horas'
      ImageIndex = 24
      object pc_Calculo_Hora: TPageControl
        Left = 0
        Top = 108
        Width = 934
        Height = 320
        Align = alClient
        Images = Banco_dm.img_List
        TabOrder = 2
        TabPosition = tpBottom
      end
      object gb_Parametros_Calculo: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 928
        Height = 102
        Align = alTop
        Caption = 'Par'#226'metros'
        TabOrder = 0
        object GroupBox4: TGroupBox
          Left = 541
          Top = 16
          Width = 75
          Height = 79
          ParentCustomHint = False
          Caption = 'Funcion'#225'rio'
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 3
          object Label19: TLabel
            Left = 12
            Top = 14
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
          end
          object ed_nr_seq_func_calc: TFocusButtonedEdit
            Left = 12
            Top = 34
            Width = 54
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            TabOrder = 0
            OnChange = ed_nr_seq_func_calcChange
            OnLeftButtonClick = ed_nr_seq_func_calcLeftButtonClick
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = False
            TipoCampo = tcInt
            Nome = 'C'#243'd. Funcion'#225'rio'
            AlertarCorrecao = False
            CodigoGrupoTela = 2
            Nome_Campo_Banco = 'nm_funcionario'
          end
        end
        object GroupBox5: TGroupBox
          Left = 13
          Top = 16
          Width = 151
          Height = 56
          Caption = 'Per'#237'odo'
          TabOrder = 0
          object Label3: TLabel
            Left = 11
            Top = 12
            Width = 54
            Height = 14
            Caption = 'Data Inicial:'
          end
          object Label4: TLabel
            Left = 15
            Top = 33
            Width = 50
            Height = 14
            Caption = 'Data Final:'
          end
          object dt_Inicial: TDateTimePicker
            Left = 67
            Top = 8
            Width = 80
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            DateFormat = dfLong
            TabOrder = 0
            OnClick = ed_dt_Criacao_deClick
            OnChange = dt_InicialChange
          end
          object dt_Final: TDateTimePicker
            Left = 67
            Top = 31
            Width = 80
            Height = 22
            Date = 0.000011574074074074
            Format = 'dd/MM/yyyy'
            Time = 0.000011574074074074
            DateFormat = dfLong
            TabOrder = 1
            OnClick = ed_dt_Criacao_ateClick
            OnChange = dt_FinalChange
          end
        end
        object rg_Modo_Calculo: TRadioGroup
          Left = 168
          Top = 16
          Width = 154
          Height = 79
          Caption = 'Modo de C'#225'lculo'
          ItemIndex = 1
          Items.Strings = (
            'Sem Restri'#231#227'o'
            'Somente Horas Normais'
            'Somente Horas Extras')
          TabOrder = 1
          Visible = False
          OnClick = rg_Modo_CalculoClick
        end
        object gb_Turno_Restr: TGroupBox
          Left = 326
          Top = 16
          Width = 211
          Height = 79
          Caption = 'Turno'
          TabOrder = 2
          object cx_Calcular_Entrada_Turno: TCheckBox
            Left = 8
            Top = 14
            Width = 199
            Height = 17
            Hint = 
              'Calcula as horas do funcion'#225'rio com base na entrada de turno, ca' +
              'so a hora de entrada seja menor que a definida no inicio do turn' +
              'o.'
            TabStop = False
            Caption = 'For'#231'ar entrada com base no turno'
            TabOrder = 0
            OnClick = cx_Calcular_Entrada_TurnoClick
          end
          object cx_Descontar_Minuto_Turno: TCheckBox
            Left = 8
            Top = 57
            Width = 163
            Height = 17
            Hint = 
              'Desconta os minutos informados no cadastro de turno para o funci' +
              'on'#225'rio vinculado'
            TabStop = False
            Caption = 'Descontar minutos do turno'
            TabOrder = 2
            OnClick = cx_Descontar_Minuto_TurnoClick
          end
          object cx_Calcular_Saida_Turno: TCheckBox
            Left = 8
            Top = 35
            Width = 199
            Height = 17
            Hint = 
              'Calcula as horas do funcion'#225'rio com base na sa'#237'da de turno, caso' +
              ' a hora de sa'#237'da seja menor que a definida no fim do turno.'
            TabStop = False
            Caption = 'For'#231'ar sa'#237'da com base no turno'
            TabOrder = 1
            OnClick = cx_Calcular_Entrada_TurnoClick
          end
        end
        object GroupBox2: TGroupBox
          Left = 620
          Top = 16
          Width = 210
          Height = 79
          Caption = 'Filtros gerais'
          TabOrder = 4
          object cx_Exibir_Inativos: TCheckBox
            Left = 13
            Top = 12
            Width = 188
            Height = 17
            Hint = 
              'Calcula e exibe as horas do funcion'#225'rio que estiver marcado como' +
              ' inativo no Cadastro de Funcion'#225'rio'
            TabStop = False
            Caption = 'Exibir Somente Funcion'#225'rios Ativos'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = cx_Exibir_InativosClick
          end
          object cx_avisar_func_sem_turno: TCheckBox
            Left = 13
            Top = 33
            Width = 188
            Height = 17
            Caption = 'Alertar funcion'#225'rios sem turno'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 428
        Width = 934
        Height = 25
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        object bt_Consultar_Horas: TButton
          Left = 4
          Top = 4
          Width = 97
          Height = 20
          Caption = 'Consultar (F5)'
          ImageIndex = 0
          Images = Banco_dm.img_List
          TabOrder = 0
          OnClick = bt_Consultar_HorasClick
        end
        object bt_Visualizar: TButton
          Left = 105
          Top = 4
          Width = 97
          Height = 20
          Caption = 'Visualizar'
          HotImageIndex = 0
          ImageIndex = 1
          Images = Banco_dm.img_List
          TabOrder = 1
          OnClick = bt_VisualizarClick
        end
      end
      object pc_Tipo_Consulta: TPageControl
        Left = 0
        Top = 108
        Width = 934
        Height = 320
        ActivePage = ts_Consulta_Detalhe
        Align = alClient
        Images = Banco_dm.img_List
        MultiLine = True
        TabOrder = 1
        TabPosition = tpBottom
        object ts_Consulta_Detalhe: TTabSheet
          Caption = 'Detalhado'
          ImageIndex = 26
          object dbg_Consulta_hr_detalhado: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 729
            Height = 246
            TabStop = False
            Align = alClient
            Color = clWhite
            DataSource = ds_Consulta_Horario_Batida
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnDrawColumnCell = dbg_Consulta_hr_detalhadoDrawColumnCell
            OnDblClick = dbg_Consulta_hr_detalhadoDblClick
            OnTitleClick = dbg_Consulta_hr_detalhadoTitleClick
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'nr_seq_funcionario'
                Title.Alignment = taRightJustify
                Title.Caption = 'C'#243'd.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_funcionario'
                Title.Caption = 'Funcion'#225'rio'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dt_entrada'
                Title.Caption = 'Entrada'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'dt_saida'
                Title.Caption = 'Sa'#237'da'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_dia_semana'
                Title.Caption = 'Dia da Semana'
                Width = 97
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qt_tempo_desconto'
                Title.Caption = 'Desconto turno'
                Width = 80
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'qt_tempo'
                Title.Caption = 'Tempo'
                Width = 60
                Visible = True
              end>
          end
          object gb_legenda: TGroupBox
            Left = 0
            Top = 252
            Width = 926
            Height = 41
            Align = alBottom
            Caption = 'Legendas'
            Enabled = False
            TabOrder = 2
            object Edit2: TEdit
              Left = 118
              Top = 15
              Width = 110
              Height = 22
              TabStop = False
              Color = 13303807
              TabOrder = 1
              Text = 'Faltou entrada/sa'#237'da'
            end
            object Edit1: TEdit
              Left = 6
              Top = 15
              Width = 110
              Height = 22
              TabStop = False
              Color = 12303359
              TabOrder = 0
              Text = 'Devendo hora no dia'
            end
          end
          object lv_ordenacao_hr_detalhado: TListView
            AlignWithMargins = True
            Left = 738
            Top = 3
            Width = 185
            Height = 246
            Align = alRight
            Columns = <
              item
                AutoSize = True
                Caption = 'Campo'
              end
              item
                AutoSize = True
                Caption = 'Asc/Dsc'
              end>
            DoubleBuffered = True
            DragMode = dmAutomatic
            IconOptions.AutoArrange = True
            ReadOnly = True
            ParentColor = True
            ParentDoubleBuffered = False
            TabOrder = 1
            ViewStyle = vsReport
            Visible = False
          end
        end
        object ts_Consulta_Mes: TTabSheet
          Caption = 'M'#234's'
          ImageIndex = 27
          object dbg_Consulta_hr_mes: TDBGrid
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 729
            Height = 246
            TabStop = False
            Align = alClient
            Color = clWhite
            DataSource = ds_Consulta_Horario_Mes
            DrawingStyle = gdsGradient
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnDrawColumnCell = dbg_Consulta_hr_mesDrawColumnCell
            OnTitleClick = dbg_Consulta_hr_mesTitleClick
            Columns = <
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'nr_seq_funcionario'
                Title.Alignment = taRightJustify
                Title.Caption = 'C'#243'd.'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'nm_funcionario'
                Title.Caption = 'Funcion'#225'rio'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'mes_ano'
                Title.Caption = 'M'#234's/Ano'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qt_tempo_previsto'
                Title.Caption = 'Tempo previsto trabalho'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'qt_tempo_trabalho'
                Title.Caption = 'Tempo trabalhado'
                Width = 97
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'total'
                Title.Alignment = taRightJustify
                Title.Caption = 'Total'
                Width = 60
                Visible = True
              end>
          end
          object lv_ordenacao_hr_mes: TListView
            AlignWithMargins = True
            Left = 738
            Top = 3
            Width = 185
            Height = 246
            Align = alRight
            Columns = <
              item
                AutoSize = True
                Caption = 'Campo'
              end
              item
                AutoSize = True
                Caption = 'Asc/Dsc'
              end>
            DoubleBuffered = True
            DragMode = dmAutomatic
            IconOptions.AutoArrange = True
            ReadOnly = True
            ParentColor = True
            ParentDoubleBuffered = False
            TabOrder = 1
            ViewStyle = vsReport
            Visible = False
          end
          object GroupBox1: TGroupBox
            Left = 0
            Top = 252
            Width = 926
            Height = 41
            Align = alBottom
            Caption = 'Legendas'
            Enabled = False
            TabOrder = 2
            object Edit4: TEdit
              Left = 6
              Top = 15
              Width = 114
              Height = 22
              TabStop = False
              Color = 12303359
              TabOrder = 0
              Text = 'Devendo hora no m'#234's'
            end
          end
        end
      end
    end
  end
  object pm_Horario: TPopupMenu
    OnPopup = pm_HorarioPopup
    Left = 457
    Top = 242
    object mi_Consultar: TMenuItem
      Caption = 'Consultar'
      ShortCut = 116
      OnClick = mi_ConsultarClick
    end
    object mi_Ocultar_Filtros: TMenuItem
      Caption = 'Ocultar Filtros'
      ShortCut = 122
      OnClick = mi_Ocultar_FiltrosClick
    end
    object mi_Abrir: TMenuItem
      Caption = 'Abrir'
      object mi_Cad_Funcionario: TMenuItem
        Caption = 'Cadastro de Funcion'#225'rio'
        OnClick = mi_Cad_FuncionarioClick
      end
    end
    object mi_Gerador_Entrada: TMenuItem
      Caption = 'Gerador de Entrada'
      OnClick = mi_Gerador_EntradaClick
    end
  end
  object qy_Consulta_Horario_Mes: TADOQuery
    Parameters = <>
    Left = 457
    Top = 210
  end
  object qy_Consulta_Horario_Batida: TADOQuery
    Parameters = <>
    Left = 393
    Top = 210
  end
  object qy_Consulta: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select * from funcionario_ponto')
    Left = 425
    Top = 210
  end
  object ds_Consulta_Horario_Mes: TDataSource
    DataSet = qy_Consulta_Horario_Mes
    Left = 425
    Top = 242
  end
  object ds_Consulta_Horario_Batida: TDataSource
    DataSet = qy_Consulta_Horario_Batida
    Left = 393
    Top = 242
  end
  object ds_Consulta: TDataSource
    DataSet = qy_Consulta
    Left = 521
    Top = 210
  end
  object sp_gerar_consulta_horario: TADOStoredProc
    Connection = Banco_dm.Conexao_banco_aco
    CursorLocation = clUseServer
    ProcedureName = 'gerar_consulta_horario'
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
        Name = 'p_ie_somente_ativo'
        DataType = ftBoolean
        Size = 5
        Value = Null
      end
      item
        Name = 'p_nr_seq_funcionario'
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'p_forcar_entrada_turno'
        DataType = ftBoolean
        Size = 5
        Value = Null
      end
      item
        Name = 'p_forcar_saida_turno'
        DataType = ftBoolean
        Size = 5
        Value = Null
      end
      item
        Name = 'p_modocalculo'
        DataType = ftInteger
        Precision = 10
        Value = Null
      end
      item
        Name = 'p_nm_usuario'
        DataType = ftWideString
        Size = 255
        Value = Null
      end
      item
        Name = 'p_descontar_minuto_turno'
        DataType = ftBoolean
        Size = 5
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
        Name = 'p_avisar_func_sem_turno'
        DataType = ftBoolean
        Size = 5
        Value = Null
      end>
    Left = 489
    Top = 210
  end
end
