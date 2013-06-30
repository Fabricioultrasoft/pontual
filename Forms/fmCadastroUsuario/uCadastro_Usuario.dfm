inherited fm_Cadastro_Usuario: Tfm_Cadastro_Usuario
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 480
  ClientWidth = 846
  PopupMenu = pm_Lista_Usuario
  OnResize = FormResize
  ExplicitWidth = 862
  ExplicitHeight = 518
  PixelsPerInch = 96
  TextHeight = 14
  object pc_Principal: TPageControl
    Left = 0
    Top = 0
    Width = 846
    Height = 480
    ActivePage = ts_Cadastro_Usuario
    Align = alClient
    Images = Banco_dm.img_List
    TabOrder = 0
    TabPosition = tpBottom
    object ts_Lista_Usuario: TTabSheet
      Caption = 'Consulta'
      object dbg_Usuario: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 832
        Height = 425
        Align = alClient
        DataSource = ds_lista_usuario
        DrawingStyle = gdsGradient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = dbg_UsuarioDblClick
        Columns = <
          item
            Alignment = taRightJustify
            Expanded = False
            FieldName = 'nr_sequencia'
            Title.Alignment = taRightJustify
            Title.Caption = 'Seq.'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_usuario'
            Title.Caption = 'Usu'#225'rio'
            Width = 178
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ie_permite_criar_usuario'
            Title.Caption = 'Permite Manipular Usu'#225'rio'
            Width = 143
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 431
        Width = 838
        Height = 22
        Align = alBottom
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 1
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
    object ts_Cadastro_Usuario: TTabSheet
      Caption = 'Cadastro'
      ImageIndex = 28
      object gb_Principal: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 832
        Height = 426
        Align = alClient
        TabOrder = 0
        object gb_Dados: TGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 73
          Width = 822
          Height = 50
          Align = alTop
          Caption = 'Dados'
          TabOrder = 1
          object Label13: TLabel
            Left = 16
            Top = 22
            Width = 40
            Height = 14
            Caption = 'Usu'#225'rio:'
          end
          object ed_nm_usuario: TFocusEdit
            Left = 66
            Top = 18
            Width = 130
            Height = 22
            TabOrder = 0
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
            Obrigatorio = True
            Nome = 'Usu'#225'rio'
            AlertarCorrecao = False
          end
          object bt_Redefinir_Senha: TButton
            Left = 202
            Top = 19
            Width = 127
            Height = 20
            Caption = 'Redefinir Senha'
            ImageIndex = 21
            Images = Banco_dm.img_List
            TabOrder = 1
            OnClick = bt_Redefinir_SenhaClick
          end
        end
        object gb_Codigo_Sequencial: TGroupBox
          AlignWithMargins = True
          Left = 5
          Top = 19
          Width = 822
          Height = 48
          Align = alTop
          Caption = 'C'#243'digo Sequencial'
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
            Left = 66
            Top = 22
            Width = 82
            Height = 22
            Images = Banco_dm.img_List
            LeftButton.HotImageIndex = 0
            LeftButton.ImageIndex = 0
            LeftButton.PressedImageIndex = 0
            LeftButton.Visible = True
            NumbersOnly = True
            ReadOnly = True
            TabOrder = 0
            OnChange = ed_nr_sequenciaChange
            OnLeftButtonClick = ed_nr_sequenciaLeftButtonClick
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
        object cpg_Principal: TCategoryPanelGroup
          Left = 2
          Top = 126
          Width = 828
          Height = 298
          VertScrollBar.Position = 162
          VertScrollBar.Tracking = True
          Align = alClient
          ChevronColor = 26316
          HeaderFont.Charset = DEFAULT_CHARSET
          HeaderFont.Color = clWindowText
          HeaderFont.Height = -11
          HeaderFont.Name = 'Tahoma'
          HeaderFont.Style = []
          ParentColor = True
          TabOrder = 2
          object cp_Perm_Detal: TCategoryPanel
            Top = -36
            Height = 332
            Caption = 'Permiss'#245'es Detalhadas'
            TabOrder = 1
            OnCollapse = cp_Perm_DetalCollapse
            OnExpand = cp_Perm_DetalExpand
            object GroupBox1: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 801
              Height = 225
              Align = alClient
              Caption = 'Tabelas'
              TabOrder = 0
              object dbg_Permissao: TDBGrid
                AlignWithMargins = True
                Left = 5
                Top = 19
                Width = 783
                Height = 201
                Margins.Right = 11
                Align = alClient
                DataSource = ds_permissao
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
                    Alignment = taRightJustify
                    Expanded = False
                    FieldName = 'nr_seq_tabela'
                    ReadOnly = True
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Seq.'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'nm_tabela'
                    ReadOnly = True
                    Title.Caption = 'Nome '
                    Width = 203
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_comentario'
                    ReadOnly = True
                    Title.Caption = 'Descri'#231#227'o'
                    Width = 430
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ds_sequence'
                    Title.Caption = 'Sequence'
                    Width = 194
                    Visible = True
                  end>
              end
            end
            object GroupBox2: TGroupBox
              AlignWithMargins = True
              Left = 3
              Top = 234
              Width = 801
              Height = 69
              Align = alBottom
              Caption = 'Permiss'#245'es'
              TabOrder = 1
              object dbg_Permissao_Status: TDBGrid
                AlignWithMargins = True
                Left = 5
                Top = 19
                Width = 783
                Height = 45
                Margins.Right = 11
                Align = alClient
                DataSource = ds_permissao_status
                DrawingStyle = gdsGradient
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = ANSI_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Arial'
                TitleFont.Style = []
                OnDblClick = dbg_Permissao_StatusDblClick
                Columns = <
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'ver'
                    Title.Alignment = taCenter
                    Title.Caption = 'Ver'
                    Width = 50
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'inserir'
                    Title.Alignment = taCenter
                    Title.Caption = 'Inserir'
                    Width = 50
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'excluir'
                    Title.Alignment = taCenter
                    Title.Caption = 'Excluir'
                    Width = 50
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'modificar'
                    Title.Alignment = taCenter
                    Title.Caption = 'Modificar'
                    Width = 50
                    Visible = True
                  end>
              end
            end
          end
          object cp_Perm_Global: TCategoryPanel
            Top = -162
            Height = 126
            Caption = 'Permiss'#245'es Globais'
            TabOrder = 0
            OnCollapse = cp_Perm_GlobalCollapse
            OnExpand = cp_Perm_GlobalExpand
            object cx_Permite_Manipular_Usuario: TCheckBox
              Left = 6
              Top = 3
              Width = 235
              Height = 19
              Hint = 
                'Indica se o usu'#225'rio logado tem permiss'#227'o para alterar, criar ou ' +
                'remover usu'#225'rios do sistema.'
              Caption = 'Conceder permiss'#227'o de administrador'
              TabOrder = 0
            end
            object rg_Permite_Select: TRadioGroup
              Left = 6
              Top = 28
              Width = 467
              Height = 31
              Hint = 
                'Permite/Nega que o usu'#225'rio logado visualize os registros de qual' +
                'quer tabela'
              Caption = 'Visualizar'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                'Permitir em qualquer tabela'
                'Negar em todas as tabelas'
                'Manter como est'#225)
              TabOrder = 1
            end
            object rg_Permite_Delete: TRadioGroup
              Left = 474
              Top = 28
              Width = 467
              Height = 31
              Hint = 
                'Permite/Nega que o usu'#225'rio logado exclua registros de qualquer t' +
                'abela'
              Align = alCustom
              Caption = 'Excluir'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                'Permitir em qualquer tabela'
                'Negar em todas as tabelas'
                'Manter como est'#225)
              TabOrder = 2
            end
            object rg_Permite_Insert: TRadioGroup
              Left = 6
              Top = 63
              Width = 467
              Height = 31
              Hint = 
                'Permite/Nega que o usu'#225'rio logado insira novos registros em qual' +
                'quer tabela'
              Caption = 'Inserir'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                'Permitir em qualquer tabela'
                'Negar em todas as tabelas'
                'Manter como est'#225)
              TabOrder = 3
            end
            object rg_Permite_Update: TRadioGroup
              Left = 474
              Top = 63
              Width = 467
              Height = 31
              Hint = 
                'Permite/Nega que o usu'#225'rio logado modifique os registros de qual' +
                'quer tabela'
              Caption = 'Modificar'
              Columns = 3
              ItemIndex = 2
              Items.Strings = (
                'Permitir em qualquer tabela'
                'Negar em todas as tabelas'
                'Manter como est'#225)
              TabOrder = 4
            end
          end
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 432
        Width = 838
        Height = 21
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          838
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
          Left = 620
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
          Left = 694
          Top = 0
          Width = 70
          Height = 20
          Anchors = [akTop, akRight]
          Caption = 'Salvar'
          ImageIndex = 4
          Images = Banco_dm.img_List
          TabOrder = 5
          OnClick = bt_salvarClick
        end
        object bt_Excluir: TButton
          Left = 768
          Top = 0
          Width = 70
          Height = 20
          Anchors = [akTop, akRight]
          Caption = 'Excluir'
          ImageIndex = 5
          Images = Banco_dm.img_List
          TabOrder = 6
          OnClick = bt_ExcluirClick
        end
      end
    end
  end
  object pm_Lista_Usuario: TPopupMenu
    OnPopup = pm_Lista_UsuarioPopup
    Left = 504
    Top = 105
    object mi_Consultar: TMenuItem
      Caption = 'Consultar'
      ShortCut = 116
      OnClick = mi_ConsultarClick
    end
  end
  object qy_permissao: TADOQuery
    AfterScroll = qy_permissaoAfterScroll
    Parameters = <>
    SQL.Strings = (
      'select'#9'a.*,'
      #9#9'case '
      '        when a.relid is not null then '
      
        '        '#9'pg_get_serial_sequence(a.nm_tabela,'#39'nr_sequencia'#39') end ' +
        'ds_sequence'
      'from'#9'('
      'select  (select max(c.conrelid)'
      #9#9' from '#9'pg_constraint c '
      '         where '#9'c.conrelid = a.oid'
      '         and'#9'a.relkind = '#39'r'#39
      '         and'#9'c.contype = '#39'p'#39
      '         )relid,'
      #9#9'a.relfilenode nr_seq_tabela,'
      '        a.relname nm_tabela,'
      '        b.description ds_comentario'
      'from    pg_class a'
      'left  '#9'join pg_description b on (b.objoid '#9'= a.oid)'
      'where'#9'1=1'
      'and'#9'a.relkind in ('#39'r'#39','#39'v'#39')'
      'and'#9'pg_table_is_visible(a.oid)'
      'and'#9'a.relname not like ('#39'pg_%'#39')'
      'and'#9'((b.objsubid = 0) or (b.objsubid is null))'
      'order by relid,a.relname)a')
    Left = 120
    Top = 208
  end
  object ds_permissao: TDataSource
    DataSet = qy_permissao
    Left = 120
    Top = 256
  end
  object ds_lista_usuario: TDataSource
    DataSet = qy_lista_usuario
    Left = 312
    Top = 256
  end
  object ds_permissao_status: TDataSource
    DataSet = qy_permissao_status
    Left = 216
    Top = 256
  end
  object qy_permissao_status: TADOQuery
    Parameters = <
      item
        Name = 'usuario'
        DataType = ftString
        Value = Null
      end
      item
        Name = 'tabela'
        DataType = ftString
        Value = Null
      end>
    SQL.Strings = (
      'select  a.tabela,'
      '           a.usuario,'
      
        '           case when has_table_privilege(a.usuario,a.tabela,'#39'sel' +
        'ect'#39') then '#39'Sim'#39'   else '#39'N'#227'o'#39' end ver,'
      
        '           case when has_table_privilege(a.usuario,a.tabela,'#39'ins' +
        'ert'#39') then '#39'Sim'#39'    else '#39'N'#227'o'#39' end inserir,'
      
        '           case when has_table_privilege(a.usuario,a.tabela,'#39'del' +
        'ete'#39') then '#39'Sim'#39'   else '#39'N'#227'o'#39' end excluir,'
      
        '           case when has_table_privilege(a.usuario,a.tabela,'#39'upd' +
        'ate'#39') then  '#39'Sim'#39' else '#39'N'#227'o'#39' end modificar'
      'from'#9'('
      '        SELECT  b.rolname usuario,'
      '                      a.tablename tabela'
      '        FROM    pg_tables a,'
      '                      pg_roles b'
      
        '        where    a.schemaname NOT IN ('#39'pg_catalog'#39','#39'information_' +
        'schema'#39')'
      '        union'
      '        select     b.rolname usuario,'
      '                      c.viewname tabela'
      '        from'#9'      pg_views c,'
      '        '#9'      pg_roles b'
      
        '        where    c.schemaname NOT IN ('#39'pg_catalog'#39','#39'information_' +
        'schema'#39')     '
      '        )a'
      'where a.usuario = :usuario        '
      'and     a.tabela   = :tabela')
    Left = 216
    Top = 208
  end
  object qy_lista_usuario: TADOQuery
    Parameters = <>
    SQL.Strings = (
      'select'#9'a.*,'
      #9#9'case '
      '        when a.relid is not null then '
      
        '        '#9'pg_get_serial_sequence(a.nm_tabela,'#39'nr_sequencia'#39') end ' +
        'ds_sequence'
      'from'#9'('
      'select  (select max(c.conrelid)'
      #9#9' from '#9'pg_constraint c '
      '         where '#9'c.conrelid = a.oid'
      '         and'#9'a.relkind = '#39'r'#39
      '         and'#9'c.contype = '#39'p'#39
      '         )relid,'
      #9#9'a.relfilenode nr_seq_tabela,'
      '        a.relname nm_tabela,'
      '        b.description ds_comentario'
      'from    pg_class a'
      'left  '#9'join pg_description b on (b.objoid '#9'= a.oid)'
      'where'#9'1=1'
      'and'#9'a.relkind in ('#39'r'#39','#39'v'#39')'
      'and'#9'pg_table_is_visible(a.oid)'
      'and'#9'a.relname not like ('#39'pg_%'#39')'
      'and'#9'((b.objsubid = 0) or (b.objsubid is null))'
      'order by relid,a.relname)a')
    Left = 312
    Top = 208
  end
end
