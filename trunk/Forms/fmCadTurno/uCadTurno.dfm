inherited fm_Cad_Turno: Tfm_Cad_Turno
  Caption = 'Cadastro de Turno'
  ClientHeight = 480
  ClientWidth = 640
  PopupMenu = pm_Turno
  ExplicitWidth = 656
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 14
  object pc_Principal: TPageControl
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    ActivePage = ts_Consulta
    Align = alClient
    Images = Banco_dm.img_List
    TabOrder = 0
    TabPosition = tpBottom
    object ts_Consulta: TTabSheet
      Caption = 'Consulta'
      object Panel3: TPanel
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
      object GroupBox3: TGroupBox
        Left = 0
        Top = 0
        Width = 632
        Height = 431
        Align = alClient
        Caption = 'Tabela: Turno'
        TabOrder = 1
        object dbg_Turno: TDBGrid
          AlignWithMargins = True
          Left = 5
          Top = 19
          Width = 622
          Height = 407
          Align = alClient
          DataSource = ds_Lista_Turno
          DrawingStyle = gdsGradient
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          OnDblClick = dbg_TurnoDblClick
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
              FieldName = 'ds_turno'
              Title.Caption = 'Turno'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qt_tempo_desconto_dia'
              Title.Caption = 'Desconto di'#225'rio'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'qt_tempo_desconto_intervalo'
              Title.Caption = 'Intervalo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_seg'
              Title.Caption = 'Seg'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_ter'
              Title.Caption = 'Ter'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_qua'
              Title.Caption = 'Qua'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_qui'
              Title.Caption = 'Qui'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_sex'
              Title.Caption = 'Sex'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_sab'
              Title.Caption = 'S'#225'b'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ie_dom'
              Title.Caption = 'Dom'
              Visible = True
            end>
        end
      end
    end
    object ts_Cadastro: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 28
      object gb_Codigo_Sequencial: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 626
        Height = 48
        Align = alTop
        Caption = 'C'#243'digo Sequencial (Tabela Turno)'
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
          Left = 44
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
      object pc_Dados: TPageControl
        Left = 0
        Top = 54
        Width = 632
        Height = 378
        ActivePage = ts_Restricoes
        Align = alClient
        TabOrder = 1
        TabPosition = tpBottom
        object ts_Parâmetros_Turno: TTabSheet
          Caption = 'Par'#226'metros Principais'
          object gb_Dados: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 618
            Height = 345
            Align = alClient
            Caption = 'Dados'
            TabOrder = 0
            DesignSize = (
              618
              345)
            object Label1: TLabel
              Left = 34
              Top = 22
              Width = 52
              Height = 14
              Caption = 'Descri'#231#227'o:'
            end
            object Label2: TLabel
              Left = 137
              Top = 70
              Width = 144
              Height = 14
              Caption = 'Tempo Desc. Dia (Fech. M'#234's):'
            end
            object Label4: TLabel
              Left = 136
              Top = 46
              Width = 63
              Height = 14
              Caption = 'Hor'#225'rio Final:'
            end
            object Label6: TLabel
              Left = 42
              Top = 70
              Width = 44
              Height = 14
              Caption = 'Intervalo:'
            end
            object Label3: TLabel
              Left = 19
              Top = 46
              Width = 67
              Height = 14
              Caption = 'Hor'#225'rio Inicial:'
            end
            object Label5: TLabel
              Left = 41
              Top = 92
              Width = 45
              Height = 14
              Caption = 'Vig'#234'ncia:'
            end
            object ed_ds_turno: TFocusButtonedEdit
              Left = 91
              Top = 18
              Width = 510
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              LeftButton.HotImageIndex = 0
              LeftButton.ImageIndex = 0
              LeftButton.PressedImageIndex = 0
              LeftButton.Visible = True
              TabOrder = 0
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              Nome = 'Descri'#231#227'o do Turno'
              AlertarCorrecao = False
              Nome_Campo_Banco = 'nm_usuario'
            end
            object ed_hr_Final: TFocusEdit
              Left = 203
              Top = 43
              Width = 41
              Height = 20
              AutoSelect = False
              AutoSize = False
              EditMask = '!99:99;1;_'
              MaxLength = 5
              TabOrder = 2
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcHora
              Nome = 'Hor'#225'rio final do turno'
              AlertarCorrecao = False
            end
            object ed_Qt_tempo_desconto_dia: TFocusEdit
              Left = 282
              Top = 66
              Width = 41
              Height = 22
              Hint = 
                'Desconto referente ao intervalo feito entre a sa'#237'da da empresa p' +
                'ara o almo'#231'o e o retorno, geralmente de 1h.'
              AutoSelect = False
              AutoSize = False
              EditMask = '!99:99;1;_'
              MaxLength = 5
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcHora
              Nome = 'Desconto di'#225'rio'
              AlertarCorrecao = False
            end
            object ed_Qt_tempo_desconto_intervalo: TFocusEdit
              Left = 91
              Top = 66
              Width = 41
              Height = 22
              Hint = 
                'Desconto referente ao intervalo para caf'#233' da manh'#227' e/ou caf'#233' da ' +
                'tarde, geralmente 15 minutos em cada per'#237'odo'
              AutoSelect = False
              AutoSize = False
              EditMask = '!99:99;1;_'
              MaxLength = 5
              TabOrder = 3
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcHora
              Nome = 'Desconto Intervalo'
              AlertarCorrecao = False
            end
            object ed_hr_Inicial: TFocusEdit
              Left = 91
              Top = 43
              Width = 41
              Height = 20
              AutoSelect = False
              AutoSize = False
              EditMask = '!99:99;1;_'
              MaxLength = 5
              TabOrder = 1
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcHora
              Nome = 'Hor'#225'rio inicial do turno'
              AlertarCorrecao = False
            end
            object clb_Vigencia: TFocusCheckListBox
              Left = 91
              Top = 92
              Width = 129
              Height = 106
              ItemHeight = 14
              Items.Strings = (
                'Domingo'
                'Segunda-Feira'
                'Ter'#231'a-Feira'
                'Quarta-Feira'
                'Quinta-Feira'
                'Sexta-Feira'
                'S'#225'bado')
              TabOrder = 5
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              Nome = 'Dias de vig'#234'ncia do turno (Pelo menos um dia '#233' obrigat'#243'rio)'
            end
          end
        end
        object ts_Restricoes: TTabSheet
          Caption = 'Restri'#231#245'es'
          ImageIndex = 1
          object GroupBox1: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 618
            Height = 49
            Hint = 
              'O funcion'#225'rio n'#227'o conseguir'#225' bater o ponto (ENTRADA) se a hora e' +
              'stiver dentro do per'#237'odo aqui informado'
            Align = alTop
            Caption = 'Per'#237'odo de Impedimento de Registro de Ponto'
            TabOrder = 0
            DesignSize = (
              618
              49)
            object Label7: TLabel
              Left = 7
              Top = 27
              Width = 67
              Height = 14
              Caption = 'Hor'#225'rio Inicial:'
            end
            object Label8: TLabel
              Left = 122
              Top = 27
              Width = 63
              Height = 14
              Caption = 'Hor'#225'rio Final:'
            end
            object Label9: TLabel
              Left = 234
              Top = 27
              Width = 34
              Height = 14
              Caption = 'Motivo:'
            end
            object ed_Hr_Inicial_Impedimento: TFocusEdit
              Left = 78
              Top = 24
              Width = 40
              Height = 20
              AutoSelect = False
              AutoSize = False
              EditMask = '!99:99;1;_'
              MaxLength = 5
              TabOrder = 0
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcHora
              Nome = 'Hor'#225'rio inicial em que o impedimento ter'#225' vig'#234'ncia'
              AlertarCorrecao = False
              CodigoGrupoTela = 1
            end
            object ed_Hr_Final_Impedimento: TFocusEdit
              Left = 189
              Top = 24
              Width = 41
              Height = 20
              AutoSelect = False
              AutoSize = False
              EditMask = '!99:99;1;_'
              MaxLength = 5
              TabOrder = 1
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcHora
              Nome = 'Hor'#225'rio final em que o impedimento ter'#225' vig'#234'ncia'
              AlertarCorrecao = False
              CodigoGrupoTela = 1
            end
            object ed_ds_motivo: TFocusEdit
              Left = 272
              Top = 23
              Width = 341
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 2
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              Nome = 'Motivo do impedimento'
              AlertarCorrecao = False
              CodigoGrupoTela = 1
            end
          end
          object Panel2: TPanel
            Left = 0
            Top = 330
            Width = 624
            Height = 21
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              624
              21)
            object bt_Novo_Restricao: TButton
              Left = 407
              Top = 0
              Width = 70
              Height = 20
              Anchors = [akTop, akRight]
              Caption = 'Novo'
              Enabled = False
              ImageIndex = 2
              Images = Banco_dm.img_List
              TabOrder = 0
              OnClick = bt_Novo_RestricaoClick
            end
            object bt_Salvar_Restricao: TButton
              Left = 481
              Top = 0
              Width = 70
              Height = 20
              Anchors = [akTop, akRight]
              Caption = 'Salvar'
              Enabled = False
              ImageIndex = 4
              Images = Banco_dm.img_List
              TabOrder = 1
              OnClick = bt_Salvar_RestricaoClick
            end
            object bt_Excluir_Restricao: TButton
              Left = 555
              Top = 0
              Width = 70
              Height = 20
              Anchors = [akTop, akRight]
              Caption = 'Excluir'
              Enabled = False
              ImageIndex = 5
              Images = Banco_dm.img_List
              TabOrder = 2
              OnClick = bt_Excluir_RestricaoClick
            end
          end
          object GroupBox2: TGroupBox
            Left = 0
            Top = 55
            Width = 624
            Height = 275
            Align = alClient
            Caption = 'Tabela: turno_restricao'
            TabOrder = 2
            ExplicitTop = 58
            object dbg_Impedimento: TDBGrid
              AlignWithMargins = True
              Left = 5
              Top = 19
              Width = 614
              Height = 251
              Align = alClient
              DataSource = ds_Impedimento
              DrawingStyle = gdsGradient
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 0
              TitleFont.Charset = ANSI_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Arial'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'nr_sequencia'
                  Title.Alignment = taRightJustify
                  Title.Caption = 'C'#243'd.'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'hr_inicial'
                  Title.Caption = 'Hora Inicial'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'hr_final'
                  Title.Caption = 'Hora Final'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nm_usuario_criacao'
                  Title.Caption = 'Usu'#225'rio Cria'#231#227'o'
                  Width = 120
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'dt_criacao'
                  Title.Caption = 'Data Cria'#231#227'o'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'nr_seq_turno'
                  Title.Caption = 'Turno'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ds_motivo'
                  Title.Caption = 'Motivo'
                  Width = 500
                  Visible = True
                end>
            end
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 432
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
  object pm_Turno: TPopupMenu
    OnPopup = pm_TurnoPopup
    Left = 312
    Top = 232
    object mi_Consultar: TMenuItem
      Caption = 'Consultar'
      ShortCut = 116
      OnClick = mi_ConsultarClick
    end
  end
  object qy_Lista_Turno: TADOQuery
    CursorLocation = clUseServer
    Parameters = <>
    SQL.Strings = (
      'select '#9'a.nr_sequencia,'
      '        a.ds_turno,'
      '        a.qt_tempo_desconto_dia,'
      
        '        cast(case when a.ie_segunda_feira then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_seg,'
      
        '        cast(case when a.ie_terca_feira   then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_ter,'
      
        '        cast(case when a.ie_quarta_feira  then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_qua,'
      
        '        cast(case when a.ie_quinta_feira  then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_qui,'
      
        '        cast(case when a.ie_sexta_feira   then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_sex,'
      
        '        cast(case when a.ie_sabado        then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_sab,'
      
        '        cast(case when a.ie_domingo       then '#39'S'#39' else '#39'N'#39' end ' +
        'as varchar(1)) as ie_dom '
      'from '#9'  turno a'
      '')
    Left = 136
    Top = 232
  end
  object qy_Impedimento: TADOQuery
    CursorLocation = clUseServer
    Parameters = <
      item
        Name = 'nr_seq_turno'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select * from turno_restricao where nr_seq_turno = :nr_seq_turno')
    Left = 136
    Top = 288
  end
  object ds_Lista_Turno: TDataSource
    DataSet = qy_Lista_Turno
    Left = 240
    Top = 232
  end
  object ds_Impedimento: TDataSource
    DataSet = qy_Impedimento
    Left = 240
    Top = 288
  end
end
