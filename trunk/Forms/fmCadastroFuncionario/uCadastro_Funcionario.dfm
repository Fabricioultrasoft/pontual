inherited fm_Cadastro_Funcionario: Tfm_Cadastro_Funcionario
  Caption = 'Cadastro de Funcion'#225'rio'
  ClientHeight = 480
  ClientWidth = 640
  PopupMenu = pm_Lista_Func
  PrintScale = poProportional
  ExplicitWidth = 656
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 14
  object pc_principal: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    ActivePage = ts_ListaFuncionario
    Align = alClient
    Images = Banco_dm.img_List
    TabHeight = 16
    TabOrder = 0
    TabPosition = tpBottom
    object ts_ListaFuncionario: TTabSheet
      Caption = 'Consulta'
      Highlighted = True
      object gb_Ordenacao: TGroupBox
        Left = 0
        Top = 121
        Width = 632
        Height = 335
        Align = alClient
        Caption = 'Tabela: Funcionario'
        TabOrder = 1
        object dbg_ListaFuncionario: TDBGrid
          Left = 2
          Top = 16
          Width = 495
          Height = 295
          Align = alClient
          Ctl3D = True
          DataSource = ds_ListaFuncionario
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = dbg_ListaFuncionarioDblClick
          OnTitleClick = dbg_ListaFuncionarioTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'nr_sequencia'
              Title.Caption = 'C'#243'd.'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_funcionario'
              Title.Caption = 'Nome'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_criacao'
              Title.Caption = 'Usu'#225'rio Cria'#231#227'o'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_criacao'
              Title.Caption = 'Data Cria'#231#227'o'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dt_atualizacao'
              Title.Caption = 'Data Modifica'#231#227'o'
              Width = 108
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nm_usuario_atualizacao'
              Title.Caption = 'Usu'#225'rio Modifica'#231#227'o'
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_turno'
              Title.Caption = 'Turno'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_inativo'
              Title.Caption = 'Inativo'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_endereco'
              Title.Caption = 'Endere'#231'o'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_tel_residencial'
              Title.Caption = 'Tel.Residencial'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nr_tel_celular'
              Title.Caption = 'Tel.Celular'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ds_cidade'
              Title.Caption = 'Cidade'
              Width = 120
              Visible = True
            end>
        end
        object lv_ordenacao_setada: TListView
          Left = 497
          Top = 16
          Width = 133
          Height = 295
          Align = alRight
          Color = clBtnFace
          Columns = <
            item
              AutoSize = True
              Caption = 'Campo'
            end
            item
              AutoSize = True
              Caption = 'Asc/Dsc'
            end>
          DoubleBuffered = False
          IconOptions.AutoArrange = True
          ReadOnly = True
          ParentDoubleBuffered = False
          TabOrder = 1
          ViewStyle = vsReport
          Visible = False
        end
        object Panel1: TPanel
          Left = 2
          Top = 311
          Width = 628
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
          object bt_Visualizar: TButton
            Left = 104
            Top = 1
            Width = 97
            Height = 20
            Caption = 'Visualizar'
            ImageIndex = 1
            Images = Banco_dm.img_List
            TabOrder = 1
            OnClick = bt_VisualizarClick
          end
        end
      end
      object gb_Filtros: TGroupBox
        Left = 0
        Top = 0
        Width = 632
        Height = 121
        Align = alTop
        Caption = 'Filtros'
        TabOrder = 0
        object gb_Filtro_Criacao: TGroupBox
          Left = 3
          Top = 12
          Width = 365
          Height = 53
          Caption = 'Cria'#231#227'o'
          TabOrder = 0
          object Label11: TLabel
            Left = 145
            Top = 12
            Width = 17
            Height = 14
            Caption = 'At'#233
            Transparent = True
          end
          object Label12: TLabel
            Left = 6
            Top = 12
            Width = 16
            Height = 14
            Caption = 'De:'
            Transparent = True
          end
          object Label10: TLabel
            Left = 284
            Top = 12
            Width = 37
            Height = 14
            Caption = 'Usu'#225'rio'
            Transparent = True
          end
          object ed_hr_Criacao_ate: TFocusEdit
            Left = 242
            Top = 24
            Width = 38
            Height = 20
            AutoSelect = False
            AutoSize = False
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
            Left = 145
            Top = 24
            Width = 97
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
            Left = 103
            Top = 24
            Width = 38
            Height = 20
            AutoSelect = False
            AutoSize = False
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
            Left = 6
            Top = 24
            Width = 97
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
            Left = 284
            Top = 24
            Width = 60
            Height = 20
            AutoSelect = False
            AutoSize = False
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
          Left = 3
          Top = 65
          Width = 365
          Height = 52
          Caption = 'Modifica'#231#227'o'
          TabOrder = 2
          object Label14: TLabel
            Left = 6
            Top = 12
            Width = 16
            Height = 14
            Caption = 'De:'
            Transparent = True
          end
          object Label15: TLabel
            Left = 145
            Top = 12
            Width = 17
            Height = 14
            Caption = 'At'#233
            Transparent = True
          end
          object Label13: TLabel
            Left = 284
            Top = 12
            Width = 37
            Height = 14
            Caption = 'Usu'#225'rio'
            Transparent = True
          end
          object ed_dt_modificacao_de: TDateTimePicker
            Left = 6
            Top = 24
            Width = 97
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
            Left = 145
            Top = 24
            Width = 97
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
            Left = 103
            Top = 24
            Width = 38
            Height = 20
            AutoSelect = False
            AutoSize = False
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
            Left = 242
            Top = 24
            Width = 38
            Height = 20
            AutoSelect = False
            AutoSize = False
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
            Left = 284
            Top = 24
            Width = 60
            Height = 20
            AutoSelect = False
            AutoSize = False
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
          AlignWithMargins = True
          Left = 372
          Top = 12
          Width = 89
          Height = 52
          ParentCustomHint = False
          Caption = 'Funcion'#225'rio'
          DoubleBuffered = False
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          object Label8: TLabel
            Left = 6
            Top = 12
            Width = 33
            Height = 14
            Caption = 'C'#243'digo'
            Transparent = True
          end
          object ed_nr_seq_func_calc: TFocusButtonedEdit
            Left = 6
            Top = 24
            Width = 64
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            TabOrder = 0
            OnLeftButtonClick = ed_nr_seq_func_calcLeftButtonClick
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
      end
    end
    object ts_CadastroFuncionario: TTabSheet
      Caption = 'Cadastro'
      Highlighted = True
      ImageIndex = 28
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 632
        Height = 43
        Align = alTop
        Caption = 'C'#243'digo Sequencial / Nome / Status (Tabela funcionario)'
        TabOrder = 0
        DesignSize = (
          632
          43)
        object Label1: TLabel
          Left = 13
          Top = 19
          Width = 22
          Height = 14
          Caption = 'Seq.'
        end
        object Label2: TLabel
          Left = 111
          Top = 19
          Width = 30
          Height = 14
          Caption = 'Nome:'
          Transparent = True
        end
        object ed_Nr_Sequencia: TFocusButtonedEdit
          Left = 43
          Top = 15
          Width = 64
          Height = 22
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Images = Banco_dm.img_List
          LeftButton.HotImageIndex = 0
          LeftButton.ImageIndex = 0
          LeftButton.PressedImageIndex = 0
          LeftButton.Visible = True
          NumbersOnly = True
          ParentFont = False
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
          Nome_Campo_Banco = 'nm_funcionario'
        end
        object ed_nm_funcionario: TFocusEdit
          Left = 149
          Top = 15
          Width = 416
          Height = 22
          Anchors = [akLeft, akTop, akRight]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          MaxLength = 120
          ParentFont = False
          TabOrder = 1
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          Obrigatorio = True
          Nome = 'Nome do Funcion'#225'rio'
          AlertarCorrecao = True
        end
        object cx_Inativo: TCheckBox
          Left = 568
          Top = 18
          Width = 60
          Height = 17
          TabStop = False
          Anchors = [akTop, akRight]
          Caption = 'Inativo'
          TabOrder = 2
        end
      end
      object cpg_Funcionario_Cadastro: TCategoryPanelGroup
        Left = 0
        Top = 43
        Width = 632
        Height = 392
        VertScrollBar.Tracking = True
        Align = alClient
        ChevronColor = 26316
        Color = clBtnFace
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        TabOrder = 1
        object cp_Turno_Trabalho: TCategoryPanel
          Top = 361
          Height = 56
          Caption = 'Turno de trabalho'
          TabOrder = 2
          object Label3: TLabel
            Left = 9
            Top = 8
            Width = 31
            Height = 14
            Caption = 'Turno:'
          end
          object ed_nr_seq_turno: TFocusButtonedEdit
            Left = 49
            Top = 4
            Width = 64
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            TabOrder = 0
            OnChange = ed_nr_seq_turnoChange
            OnLeftButtonClick = ed_nr_seq_turnoLeftButtonClick
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = False
            TipoCampo = tcInt
            Nome = 'Turno'
            AlertarCorrecao = False
            Nome_Campo_Banco = 'ds_turno'
          end
          object ed_ds_turno: TEdit
            Left = 116
            Top = 4
            Width = 437
            Height = 22
            Enabled = False
            TabOrder = 1
          end
        end
        object cp_Identificacao_Digital: TCategoryPanel
          Top = 145
          Height = 216
          Caption = 'Identifica'#231#227'o digital'
          TabOrder = 1
          object Splitter1: TSplitter
            Left = 345
            Top = 0
            Width = 9
            Height = 190
            Beveled = True
            ResizeStyle = rsUpdate
            ExplicitLeft = 351
            ExplicitTop = -5
            ExplicitHeight = 130
          end
          object gb_Cad_Biometrico: TGroupBox
            Left = 0
            Top = 0
            Width = 345
            Height = 190
            Align = alLeft
            Caption = 'Tabela: funcionario_biometria - Cadastro Biom'#233'trico'
            TabOrder = 0
            object dbg_Digital_Cadastrada: TDBGrid
              Left = 2
              Top = 16
              Width = 341
              Height = 149
              TabStop = False
              Align = alClient
              Ctl3D = True
              DataSource = ds_Digital_Cadastrada
              DrawingStyle = gdsGradient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentCtl3D = False
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              Columns = <
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'nr_sequencia'
                  Title.Caption = 'C'#243'd.'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nm_usuario_criacao'
                  Title.Caption = 'Usu'#225'rio Cria'#231#227'o'
                  Width = 99
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dt_criacao'
                  Title.Caption = 'Data Cria'#231#227'o'
                  Width = 131
                  Visible = True
                end>
            end
            object Panel2: TPanel
              Left = 2
              Top = 165
              Width = 341
              Height = 23
              Align = alBottom
              TabOrder = 1
              object bt_Novo_Biometria: TButton
                Left = 9
                Top = 0
                Width = 76
                Height = 20
                Caption = 'Novo'
                Enabled = False
                ImageIndex = 2
                Images = Banco_dm.img_List
                TabOrder = 0
                OnClick = bt_Novo_BiometriaClick
              end
              object bt_Excluir_Biometria: TButton
                Left = 89
                Top = 0
                Width = 76
                Height = 20
                Caption = 'Excluir'
                Enabled = False
                ImageIndex = 5
                Images = Banco_dm.img_List
                TabOrder = 1
                OnClick = bt_Excluir_BiometriaClick
              end
            end
          end
          object GroupBox4: TGroupBox
            Left = 354
            Top = 0
            Width = 257
            Height = 190
            Align = alClient
            Caption = 'Tabela: funcionario_biometria_dedo'
            Enabled = False
            TabOrder = 1
            object dbg_Digital_Dedo: TDBGrid
              Left = 2
              Top = 16
              Width = 253
              Height = 172
              TabStop = False
              Align = alClient
              Ctl3D = True
              DataSource = ds_Digital_Dedo
              DrawingStyle = gdsGradient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Arial'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              ParentCtl3D = False
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'nr_sequencia'
                  Title.Caption = 'C'#243'd. Sequencial'
                  Width = 82
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_seq_dedo'
                  Title.Caption = 'Seq.Dedo'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ds_dedo'
                  Title.Caption = 'Desc. Dedo'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_sample'
                  Title.Caption = 'Nr. Sample'
                  Width = 74
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_seq_func_biometria'
                  Title.Caption = 'Nr.Seq.Func.Biom'
                  Visible = True
                end>
            end
          end
        end
        object cp_Dados_Pessoais: TCategoryPanel
          Top = 0
          Height = 145
          Caption = 'Dados pessoais'
          TabOrder = 0
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 611
            Height = 119
            Align = alClient
            BevelOuter = bvNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            object GroupBox3: TGroupBox
              Left = 0
              Top = 0
              Width = 611
              Height = 71
              Align = alTop
              Caption = 'Localiza'#231#227'o'
              TabOrder = 0
              DesignSize = (
                611
                71)
              object Label7: TLabel
                Left = 9
                Top = 22
                Width = 36
                Height = 14
                Caption = 'Cidade:'
                Transparent = True
              end
              object Label4: TLabel
                Left = 9
                Top = 47
                Width = 49
                Height = 14
                Caption = 'Endere'#231'o:'
                Transparent = True
              end
              object ed_ds_seq_cidade: TFocusEdit
                Left = 115
                Top = 18
                Width = 494
                Height = 22
                TabStop = False
                Anchors = [akLeft, akTop, akRight]
                Enabled = False
                TabOrder = 1
                NormalColor = clWindow
                FocusColor = 15590345
                ErrorColor = 13290239
                Nome = 'ed_nr_seq_cidade'
                AlertarCorrecao = False
              end
              object ed_nr_seq_cidade: TFocusButtonedEdit
                Left = 49
                Top = 18
                Width = 64
                Height = 22
                Images = Banco_dm.img_List
                LeftButton.HotImageIndex = 0
                LeftButton.ImageIndex = 0
                LeftButton.PressedImageIndex = 0
                LeftButton.Visible = True
                NumbersOnly = True
                TabOrder = 0
                OnChange = FocusButtonedEdit1Change
                OnLeftButtonClick = ed_nr_seq_cidadeLeftButtonClick
                NormalColor = clWindow
                FocusColor = 15590345
                ErrorColor = 13290239
                Obrigatorio = False
                TipoCampo = tcInt
                Nome = 'C'#243'd. Cidade'
                AlertarCorrecao = False
                Nome_Campo_Banco = 'ds_cidade'
              end
              object ed_ds_endereco: TFocusEdit
                Left = 63
                Top = 43
                Width = 546
                Height = 22
                Anchors = [akLeft, akTop, akRight]
                TabOrder = 2
                NormalColor = clWindow
                FocusColor = 15590345
                ErrorColor = 13290239
                Nome = 'Endere'#231'o'
                AlertarCorrecao = False
                Nome_Campo_Banco = 'ds_endereco'
              end
            end
            object GroupBox5: TGroupBox
              Left = 0
              Top = 71
              Width = 611
              Height = 45
              Align = alTop
              Caption = 'Telefones'
              TabOrder = 1
              object Label6: TLabel
                Left = 171
                Top = 19
                Width = 52
                Height = 14
                Caption = 'Tel.Celular:'
                Transparent = True
              end
              object Label5: TLabel
                Left = 9
                Top = 19
                Width = 74
                Height = 14
                Caption = 'Tel.Residencial:'
                Transparent = True
              end
              object ed_nr_tel_celular: TFocusEdit
                Left = 227
                Top = 15
                Width = 79
                Height = 22
                EditMask = '!\(99\)0000-0000;0;_'
                MaxLength = 13
                TabOrder = 1
                NormalColor = clWindow
                FocusColor = 15590345
                ErrorColor = 13290239
                TipoCampo = tcInt
                Nome = 'Telefone Celular'
                AlertarCorrecao = False
                Nome_Campo_Banco = 'nr_tel_celular'
              end
              object ed_nr_tel_residencial: TFocusEdit
                Left = 87
                Top = 15
                Width = 81
                Height = 22
                EditMask = '!\(99\)0000-0000;0;_'
                MaxLength = 13
                TabOrder = 0
                NormalColor = clWindow
                FocusColor = 15590345
                ErrorColor = 13290239
                TipoCampo = tcInt
                Nome = 'Telefone Residencial'
                AlertarCorrecao = False
                Nome_Campo_Banco = 'nr_tel_residencial'
              end
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 435
        Width = 632
        Height = 21
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          632
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
          Enabled = False
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
          Enabled = False
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
          Enabled = False
          ImageIndex = 5
          Images = Banco_dm.img_List
          TabOrder = 7
          OnClick = bt_ExcluirClick
        end
      end
    end
  end
  object pm_Lista_Func: TPopupMenu
    OnPopup = pm_Lista_FuncPopup
    Left = 480
    Top = 72
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
  end
  object qy_ListaFuncionario: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select  a.nr_sequencia,'
      #9'a.nm_funcionario::varchar(255)nm_funcionario,'
      '        a.nm_usuario_criacao::varchar(255)nm_usuario_criacao,'
      '        a.dt_criacao,'
      '        a.dt_atualizacao,'
      
        '        a.nm_usuario_atualizacao::varchar(255)nm_usuario_atualiz' +
        'acao,'
      '        a.ie_inativo,'
      '        a.ds_endereco::varchar(255)ds_endereco,'
      '        a.nr_tel_residencial::varchar(255)nr_tel_residencial,'
      '        a.nr_tel_celular::varchar(255)nr_tel_celular,        '
      '        c.ds_cidade::varchar(255) ds_cidade'
      'from    funcionario a'
      'left join turno b on (a.nr_seq_turno = b.nr_sequencia)'
      'left join cidade c on (a.nr_seq_cidade = c.nr_sequencia)'
      'where   1=1')
    Left = 327
    Top = 192
  end
  object qy_Digital_Cadastrada: TADOQuery
    AfterScroll = qy_Digital_CadastradaAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select a.nr_sequencia,'
      '       a.cd_biometria,'
      '       a.nm_usuario_criacao,'
      '       a.dt_criacao,'
      '       a.nm_usuario_atualizacao,'
      '       a.dt_atualizacao'
      'from'#9'  funcionario_biometria a')
    Left = 327
    Top = 246
  end
  object qy_Digital_Dedo: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select a.*,'
      '          b.ds_dedo'
      'from  funcionario_biometria_dedo a,'
      '         dedo b'
      'where a.nr_seq_dedo = b.nr_sequencia')
    Left = 327
    Top = 296
  end
  object ds_ListaFuncionario: TDataSource
    DataSet = qy_ListaFuncionario
    Left = 448
    Top = 192
  end
  object ds_Digital_Cadastrada: TDataSource
    DataSet = qy_Digital_Cadastrada
    Left = 448
    Top = 246
  end
  object ds_Digital_Dedo: TDataSource
    DataSet = qy_Digital_Dedo
    Left = 448
    Top = 296
  end
end
