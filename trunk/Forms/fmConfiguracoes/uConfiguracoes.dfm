inherited fm_Configuracoes: Tfm_Configuracoes
  Caption = 'Administra'#231#227'o do Sistema'
  ClientHeight = 440
  ClientWidth = 624
  PopupMenu = pm_Config
  Visible = False
  ExplicitWidth = 640
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 14
  object pc_Principal: TPageControl
    Left = 0
    Top = 28
    Width = 624
    Height = 412
    ActivePage = ts_Manutencao
    Align = alClient
    TabOrder = 1
    TabPosition = tpBottom
    OnChange = pc_PrincipalChange
    object ts_Conexao_Bd: TTabSheet
      Caption = 'Conex'#227'o '
      DesignSize = (
        616
        385)
      object lblConexao_lb: TLabel
        Left = 2
        Top = 439
        Width = 168
        Height = 14
        Anchors = [akLeft, akBottom]
        Caption = 'Dados de conex'#227'o do componente'
        Transparent = False
        ExplicitTop = 384
      end
      object gb_Grid_Conexao: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 56
        Width = 358
        Height = 326
        Align = alLeft
        Caption = 'Par'#226'metros de Conex'#227'o'
        TabOrder = 1
        object Label9: TLabel
          Left = 17
          Top = 25
          Width = 38
          Height = 14
          Caption = 'User ID:'
        end
        object Label11: TLabel
          Left = 5
          Top = 47
          Width = 50
          Height = 14
          Caption = 'Password'
        end
        object Label14: TLabel
          Left = 6
          Top = 92
          Width = 49
          Height = 14
          Caption = 'Database:'
        end
        object Label15: TLabel
          Left = 19
          Top = 70
          Width = 36
          Height = 14
          Caption = 'Server:'
        end
        object Label16: TLabel
          Left = 33
          Top = 114
          Width = 22
          Height = 14
          Caption = 'Port:'
        end
        object lb_Driver: TLabel
          Left = 26
          Top = 138
          Width = 32
          Height = 14
          Caption = 'Driver:'
        end
        object ed_user_admin: TFocusEdit
          Left = 63
          Top = 21
          Width = 289
          Height = 22
          TabOrder = 0
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          AlertarCorrecao = False
        end
        object ed_pass_admin: TFocusEdit
          Left = 63
          Top = 43
          Width = 289
          Height = 22
          TabOrder = 1
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          AlertarCorrecao = False
        end
        object ed_server: TFocusEdit
          Left = 63
          Top = 66
          Width = 289
          Height = 22
          TabOrder = 2
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          AlertarCorrecao = False
        end
        object ed_database: TFocusEdit
          Left = 63
          Top = 88
          Width = 289
          Height = 22
          TabOrder = 3
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          AlertarCorrecao = False
        end
        object ed_port: TFocusEdit
          Left = 63
          Top = 110
          Width = 289
          Height = 22
          TabOrder = 4
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
          AlertarCorrecao = False
        end
        object bt_Testar_conexao: TButton
          Left = 63
          Top = 186
          Width = 122
          Height = 18
          Cursor = crHandPoint
          Caption = 'Testar Conex'#227'o'
          ImageIndex = 3
          Images = img_list
          TabOrder = 5
          OnClick = bt_Testar_conexaoClick
        end
        object cb_Driver: TFocusCombobox
          Left = 63
          Top = 135
          Width = 289
          Height = 22
          TabOrder = 6
          NormalColor = clWindow
          FocusColor = 15590345
          ErrorColor = 13290239
        end
      end
      object GroupBox2: TGroupBox
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 610
        Height = 47
        Align = alTop
        Caption = 'Modo de opera'#231#227'o'
        TabOrder = 0
        DesignSize = (
          610
          47)
        object lbl4: TLabel
          Left = 11
          Top = 22
          Width = 78
          Height = 14
          Caption = 'Tipo de Usu'#225'rio:'
        end
        object rg_Tipo_Usuario: TRadioGroup
          Left = 126
          Top = 7
          Width = 179
          Height = 33
          Anchors = [akLeft, akTop, akRight]
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Funcion'#225'rio'
            'Ger'#234'ncia')
          TabOrder = 0
        end
      end
    end
    object ts_Manutencao: TTabSheet
      Caption = 'Manuten'#231#227'o e Seguran'#231'a'
      ImageIndex = 1
      object pc_Manutencao: TPageControl
        Left = 0
        Top = 0
        Width = 616
        Height = 385
        ActivePage = ts_Backup
        Align = alClient
        TabOrder = 0
        TabPosition = tpBottom
        object ts_Arquivos_Banco: TTabSheet
          Caption = 'Arquivos do Banco'
          ImageIndex = 1
          object grp_Arquivos: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 602
            Height = 206
            Align = alTop
            Caption = 'Diret'#243'rios e Programas'
            TabOrder = 0
            DesignSize = (
              602
              206)
            object Label1: TLabel
              Left = 11
              Top = 21
              Width = 104
              Height = 14
              Caption = 'Diret'#243'rio PostgreSQL:'
            end
            object Label6: TLabel
              Left = 11
              Top = 99
              Width = 65
              Height = 14
              Caption = 'pg_dump.exe'
            end
            object Label8: TLabel
              Left = 11
              Top = 125
              Width = 74
              Height = 14
              Caption = 'pg_restore.exe'
            end
            object Label5: TLabel
              Left = 11
              Top = 151
              Width = 64
              Height = 14
              Caption = 'createdb.exe'
            end
            object Label10: TLabel
              Left = 11
              Top = 177
              Width = 55
              Height = 14
              Caption = 'dropdb.exe'
            end
            object lbl3: TLabel
              Left = 11
              Top = 73
              Width = 87
              Height = 14
              Caption = 'PostgreSQL.Conf:'
            end
            object lbl2: TLabel
              Left = 11
              Top = 47
              Width = 66
              Height = 14
              Caption = 'Pg_Hba.Conf:'
            end
            object ed_Caminho_Dir_PostgresSQL: TFocusEdit
              Left = 120
              Top = 17
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              OnExit = ed_Caminho_Dir_PostgresSQLExit
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcDiretorio
              AlertarCorrecao = False
            end
            object ed_Caminho_pg_dump_exe: TFocusEdit
              Left = 120
              Top = 95
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ReadOnly = True
              TabOrder = 3
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcArquivo
              AlertarCorrecao = False
            end
            object ed_Caminho_pg_restore_exe: TFocusEdit
              Left = 120
              Top = 121
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcArquivo
              AlertarCorrecao = False
            end
            object ed_Caminho_createdb_exe: TFocusEdit
              Left = 120
              Top = 147
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ReadOnly = True
              TabOrder = 5
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcArquivo
              AlertarCorrecao = False
            end
            object ed_Caminho_dropdb_exe: TFocusEdit
              Left = 120
              Top = 173
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ReadOnly = True
              TabOrder = 6
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcArquivo
              AlertarCorrecao = False
            end
            object ed_Caminho_arquivo_pg_hba_conf: TFocusEdit
              Left = 120
              Top = 43
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcArquivo
              AlertarCorrecao = False
            end
            object ed_Caminho_arquivo_PostgresSQL_conf: TFocusEdit
              Left = 120
              Top = 69
              Width = 411
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcArquivo
              AlertarCorrecao = False
            end
            object bt_procurar_Arq_Postgres: TButton
              Left = 532
              Top = 19
              Width = 65
              Height = 18
              Cursor = crHandPoint
              Anchors = [akTop, akRight]
              Caption = 'Procurar'
              ImageIndex = 5
              Images = img_list
              TabOrder = 7
              OnClick = bt_procurar_Arq_PostgresClick
            end
            object bt_Abrir_Pg_Hba_Conf: TButton
              Left = 532
              Top = 45
              Width = 65
              Height = 18
              Cursor = crHandPoint
              Anchors = [akTop, akRight]
              Caption = 'Abrir'
              ImageIndex = 6
              Images = img_list
              TabOrder = 8
              OnClick = bt_Abrir_Pg_Hba_ConfClick
            end
            object bt_Abrir_PostgreSQL_Conf: TButton
              Left = 532
              Top = 71
              Width = 65
              Height = 18
              Cursor = crHandPoint
              Anchors = [akTop, akRight]
              Caption = 'Abrir'
              ImageIndex = 6
              Images = img_list
              TabOrder = 9
              OnClick = bt_Abrir_PostgreSQL_ConfClick
            end
          end
        end
        object ts_Backup: TTabSheet
          Caption = 'Backup/Atualiza'#231#227'o'
          object GroupBox8: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 602
            Height = 43
            Align = alTop
            Caption = 'Backup'
            TabOrder = 0
            DesignSize = (
              602
              43)
            object Label4: TLabel
              Left = 1
              Top = 17
              Width = 110
              Height = 14
              Caption = 'Diret'#243'rio Base/Destino:'
            end
            object ed_Caminho_Backup: TFocusEdit
              Left = 117
              Top = 13
              Width = 482
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              Obrigatorio = True
              TipoCampo = tcDiretorio
              AlertarCorrecao = True
            end
          end
          object GroupBox7: TGroupBox
            AlignWithMargins = True
            Left = 3
            Top = 97
            Width = 602
            Height = 258
            Align = alClient
            Caption = 'Restaura'#231#227'o'
            TabOrder = 2
            object lbx_Backups: TListBox
              Left = 2
              Top = 16
              Width = 598
              Height = 218
              Align = alClient
              ItemHeight = 14
              TabOrder = 0
            end
            object Panel2: TPanel
              Left = 2
              Top = 234
              Width = 598
              Height = 22
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
              object bt_Gerar_Backup: TButton
                Left = 336
                Top = 1
                Width = 107
                Height = 20
                Cursor = crHandPoint
                Caption = 'Gerar Backup'
                ImageIndex = 7
                Images = img_list
                TabOrder = 0
                OnClick = bt_Gerar_BackupClick
              end
              object bt_Recriar_Banco: TButton
                Left = 114
                Top = 1
                Width = 107
                Height = 20
                Cursor = crHandPoint
                Caption = 'Recriar Banco'
                ImageIndex = 9
                Images = img_list
                TabOrder = 1
                OnClick = bt_Recriar_BancoClick
              end
              object bt_Restaurar_Backup: TButton
                Left = 225
                Top = 1
                Width = 107
                Height = 20
                Cursor = crHandPoint
                Caption = 'Restaurar Backup'
                ImageIndex = 8
                Images = img_list
                TabOrder = 2
                OnClick = bt_Restaurar_BackupClick
              end
              object bt_Listar_Backups: TButton
                Left = 3
                Top = 1
                Width = 107
                Height = 20
                Cursor = crHandPoint
                Caption = 'Listar Backups'
                ImageIndex = 0
                Images = img_list
                TabOrder = 3
                OnClick = bt_Listar_BackupsClick
              end
            end
          end
          object rg_Tipo_Exportacao: TRadioGroup
            AlignWithMargins = True
            Left = 3
            Top = 52
            Width = 602
            Height = 39
            Align = alTop
            BiDiMode = bdLeftToRight
            Caption = 'Modo de Importa'#231#227'o/Exporta'#231#227'o'
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'Completo'
              'Somente Dados'
              'Somente Estrutura')
            ParentBiDiMode = False
            TabOrder = 1
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Manuten'#231#227'o'
          ImageIndex = 2
          object clbx_Comandos: TFocusCheckListBox
            Left = 7
            Top = 3
            Width = 226
            Height = 63
            OnClickCheck = clbx_ComandosClickCheck
            ItemHeight = 14
            Items.Strings = (
              'Sincronizar Sequences'
              'Reindexar Database'
              'Vacuum Simples'
              'Vacuum Analyze')
            TabOrder = 0
            NormalColor = clWindow
            FocusColor = 15590345
            ErrorColor = 13290239
          end
          object bt_executar_cmd_banco: TButton
            Left = 3
            Top = 70
            Width = 230
            Height = 25
            Cursor = crHandPoint
            Caption = 'Executar procedimentos selecionados'
            Enabled = False
            ImageIndex = 2
            Images = img_list
            TabOrder = 1
            OnClick = bt_executar_cmd_bancoClick
          end
        end
      end
    end
    object ts_Automatizacao: TTabSheet
      Caption = 'Automatiza'#231#227'o'
      ImageIndex = 2
      object pc_Automatizacao: TPageControl
        Left = 0
        Top = 0
        Width = 616
        Height = 385
        ActivePage = ts_Email
        Align = alClient
        TabOrder = 0
        TabPosition = tpBottom
        object ts_Email: TTabSheet
          Caption = 'Par'#226'metros Envio E-Mail'
          object GroupBox4: TGroupBox
            Left = 0
            Top = 0
            Width = 608
            Height = 358
            Align = alClient
            Caption = 
              'E-mails (Para mais de um endere'#231'o, separe por ";" Ex: voce@hotma' +
              'il.com;ele@gmail.com'
            TabOrder = 0
            DesignSize = (
              608
              358)
            object Label12: TLabel
              Left = 7
              Top = 24
              Width = 88
              Height = 14
              Caption = 'Receber backups:'
            end
            object Label2: TLabel
              Left = 5
              Top = 51
              Width = 90
              Height = 14
              Caption = 'Nome da empresa:'
            end
            object ed_email_backups: TFocusEdit
              Left = 99
              Top = 20
              Width = 504
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 0
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              AlertarCorrecao = False
            end
            object ed_nm_empresa: TFocusEdit
              Left = 99
              Top = 47
              Width = 504
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              TabOrder = 1
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              AlertarCorrecao = False
            end
          end
        end
        object ts_Agendamento: TTabSheet
          Caption = 'Agendamento'
          ImageIndex = 1
          object GroupBox5: TGroupBox
            Left = 0
            Top = 0
            Width = 608
            Height = 125
            Align = alTop
            Caption = 'Frequ'#234'ncia de envio de backup autom'#225'tico '
            TabOrder = 0
            object Label17: TLabel
              Left = 138
              Top = 59
              Width = 12
              Height = 14
              Caption = #224's'
            end
            object ed_hora_envio_backup: TFocusEdit
              Left = 156
              Top = 56
              Width = 33
              Height = 22
              EditMask = '!99:99;1;_'
              MaxLength = 5
              TabOrder = 1
              Text = '  :  '
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
              TipoCampo = tcHora
              AlertarCorrecao = False
            end
            object clbx_dias_envio_backup: TFocusCheckListBox
              Left = 7
              Top = 16
              Width = 121
              Height = 105
              ItemHeight = 14
              Items.Strings = (
                'Domingos'
                'Segundas'
                'Ter'#231'as'
                'Quartas'
                'Quintas'
                'Sextas'
                'S'#225'bados')
              TabOrder = 0
              NormalColor = clWindow
              FocusColor = 15590345
              ErrorColor = 13290239
            end
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      624
      28)
    object lbl1: TLabel
      Left = 15
      Top = 6
      Width = 120
      Height = 14
      AutoSize = False
      Caption = 'Path Def. Sistema:'
    end
    object ed_Caminho_arquivo_config: TFocusEdit
      Left = 106
      Top = 2
      Width = 418
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      ReadOnly = True
      TabOrder = 0
      NormalColor = clWindow
      FocusColor = 15590345
      ErrorColor = 13290239
      TipoCampo = tcArquivo
      AlertarCorrecao = False
    end
    object bt_Salvar: TButton
      Left = 530
      Top = 2
      Width = 87
      Height = 22
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Salvar'
      ImageIndex = 2
      Images = img_list
      TabOrder = 1
      OnClick = bt_SalvarClick
    end
  end
  object img_list: TPngImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    PngImages = <
      item
        Background = clWindow
        Name = '0'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE9000000097048597300000EC300000EC301C7
          6FA864000001F64944415478DA6364A01030C21819B92BC57815A5EB05E52582
          F8F9D82498FFFE7AF2FACEB3354F6F3E6B9E3139E21D5E03D273572AA8D8EA1F
          36B4529361666164F8CBCCC0C0C9CEC0C0C1FC8FE1E2FEEB774EEDB86A3F634A
          F8339C0634CD3DB73F36D4D0E1F73F06865F40FE7FA0017F598006B04214ED58
          766A4B419CB92F5603804ED7F24D72BE6AA221CCF0F12703C34F9020D00006A0
          01CC5003EE5C7BC9B075F641C91993C35F601800747E50565DC85A091E26860F
          40DDDF81AEF8CF0471050883C0FBF73F18D6B46F72047AE3001617ACF04AAA08
          DC2A2FC40636E0D36F06062062F8CD08A141E0C3DBAF0C7BA66CB506BAE01836
          2F08580558BE74B792650319F00118081F7F43F01FA8A2E7571F7CBAB5E314C8
          0BDFB0066251FBBEF6D018EB0A215E36B0012F80CA1E7D8128F8FDE915C38783
          EBB669DFAECD0E9FF7E601560380AE60E295979AAA62A59DC12E2C08F606087C
          7FF99641F2CDA15F1A9F37B2897F58F1EDFC6D6EEF8099EF0E601880484C2B4C
          7815658359B939F97E7FF9FAE1D38367AB1D999BC2037C252BD83F5C6678FEF8
          FDB753D779500C6164200056240A0B699AA9EFD5D5E535607C7901C3108206E0
          31C41368C821A20C4037E4CBBD0B0C5B6EEA6D886ADD1D48B4013043D40C9537
          BFE5B431B9FA557E5941417E224906C0405E5E9E1690BA3169D2A47F0037D9E0
          11777AC5200000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '2'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000BE4944415478DACDD1310A83301406E0178907E8E2153C47A7108F90
          357710728348EE912DAB5EA3AB9B78828E92A0D10EB65249130A85FEF09607FF
          37BC87604BDBB61EE2B96F73ADAAEA765CA21DA094069B5DD7415996D0F7FD09
          49060821300CC3094902B4D6C0188365599EC8065C9281A669C0FBD7998AA200
          CE394A06DEA39482BAAEBF07A4942084F847E078A850104261E0F1A658F92330
          CF7314C8B22C0C38E7A200C6380C586BA3409EE73FF88231C68FE308D3342523
          3BB002FD8F9B113BD2B5530000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '4'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000021A4944415478DA6364201730316430B0332B3192A19599918B698259
          8B44F6CB756F1F926A000F9704CB0ADFA9A2DEAFAEFFFCB7BFE69D072906C8C8
          EA336F0E9E2E66F0EE330FC3F2E03B537F7FF99F43AC0186E6BE4C9B3D3AA4A4
          3FFC156758997CF5D68BD33F0C81E2DF8831C037A4806999618E3CCFFB1F120C
          0717DCFD73BAE7950D50FC24489291539C65B58024A3E2F30BBFAB81FC9D2801
          CDCC9097D8CDD627EFA7CCFCF9A710C39D1BAF193645DD6EF9FBF37F2D4C0DA3
          7B0CE3BBA219D282A7B63DFD3FAD8261D7F37BFF4B81E2D758B9192724CCE0CD
          96325762FCF69B9BE1CDD76F0C1BE2AF9D7B7FFDA70550FE37DC00661686B279
          C76D3B65D485181E7D39C9306FE2F7BF2757FFBA113D814F5B4E439EE1DB6F56
          860FBF7E311C997AFFC7F5396F4C807AAE22BB1214066CDAF6AC97BBD787AAFD
          F8CBC0F0FCC76D863B9FDE33F0B38A337C05DA03D27CF7FC5B86FDA9F74AFEFF
          65E8450F2058207A65CC51DC62E965C8F8E9D777868FBF7F307C046A04697EF3
          E907C3AEB89B07BF3EFCE50454F70F97010C02324C9BCB7699FBFC63E5806BFE
          F0F30FC3A99E079F1EAE79AF0F54F2005B142147A38A658EF015EB4C75F68FBF
          7E030DF9C370EFD87B8633450F9219FE33CCC315C728E9809983B13D608D5A05
          B32817C39BB73F198E26DCDAF4F3D51F7F7C89043D21F1483AF2DCD06D5094BE
          D0FAE8F5AB5D1F7581622F49310004EC39A4D94A7E3CFDD503641F24944C01A0
          EEDD2EBE3D72B50000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '25'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001C84944415478DA639C71E6FF7F0624C0C4C8C070E1D451866999368C
          0C4400C6C89675FFB979F8E0028141CE0CDBB61D65989A41A401A91376FD0FD7
          BFCE7087370F6CFB95B32718FEFCF9C5F0F2FE75867BB2EE60457F7FFF62F8FB
          9FE13B3327F76D2616D68517D2C5FB500CF8207D9FC157238D81879381E1C357
          0606016E0686A5336732DC91F7FA0A52F4EDEDF3873FDF3E1162E4E4E3611714
          E7E0E0E1BFC2C4CA9E70215DE22263E6A45DFFED5E5E6210C92E66E0E36260E8
          6A9D0977DEDAEE0CB837A48AB74AFF7B76D59B994BC08B5D42CD975354FE320B
          07A70F6370E90C94406C6C4E6798BDE418C3C4146B9C6120993CB3968D4FAC9E
          57C5740663FDAA4B60034071C1C4C4C0C0C2CCC0F0E2D50786291976B80D88ED
          E7FEFFFEF12A6EC30043A2421A1B1077CBAC6093506B21DB0009BFB20A166EE1
          164672129274F662EEBFCFEFAC62973334242B2149254DAD6578FFBC9ECB2C74
          06DE84841C8D1A539F49FF7AF7D2FBD7B36B5EFFBFBDF36597D3BDCC2228E783
          3721DD53F00127A41F5F3E3EFCF6EAAED09F4FAF791899583938A4B5AEB0F20A
          255C2F54C29F90EECAB881E95FDFBF32FCFCF2EEFB3F26B6DB2CDC820B6F976B
          20923239090919909590900100E688D940269494310000000049454E44AE4260
          82}
      end
      item
        Background = clWindow
        Name = '24'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002D94944415478DA8D934D4C134114C7FFDB6DC100A52510211AF9108B
          C8374121F140C4604CFC48D078938384AB4648309AA8078DE182261AA327F938
          8970315263A209421103C40825E53354A4E54B04DAED9642BBCBCE3A9D162CF1
          E24B5E66E6CD7BBFF9BF995D6EA8B37A04409196D740ABA5CE73E0380E91A6D1
          B0B5A0286A7DEE8596B6C83D8E02D4D2F305585D7041F825C2BD2222E1602692
          D272D8B8637E710DF6BE0E21FF626BC23F80E3E7F2013514D89615081432675B
          40E989429A11CE34A4C36C69C76D5F1FB6FDE4E94CADAB7E175072368FE5A80C
          12220D7F1A4751D67E045B0BB78077537634782DD822DBE045AED759E7A96080
          E2CA5C5AA6EEAA089AB57B02798793C053407414CF6223D32BB8F2DB5CB1A991
          7B24AA54E7E61F304061C5B1F0E92101C1A9CD3289A36989D0693938552F6E39
          06C16D01E6EA712EE559DC5B8F3E50B5CFC90B0C905F9E4D012A22458CF74F23
          E380110E22A2616500374F3FC22BCB4B7CB86CE1921B637BC414E914EFE04277
          907332EB6FB1CA9AC1D4E00C360D0A5E280BB85A7603BDF3EFD1F5B50B9BEEED
          3625965CF3196470F6F025669799980295847A088AE9FE6EC51BBD0BD7CBEFA3
          63F239465746B03CBB0159A3408A57B021CB20936A08602AC9A4C5E116A807B6
          02A8757CC49D334DE89C7802BB7B065E29800D49DA75DF860C6598F432406661
          063B3DA8E2E7D81C83DCD3D870E4500A56034E5A2CED017837A98F4A822292D0
          3366E4A5831095A9704E39B1EE217028225E131B62D2B55075600041F4637D7E
          0BA22330A7F8C925B999581920353B951507218BF6052CAFC9F04B2A628C3A34
          09FD2069742F8A6066C885FA8412DCADFFC2457ECAEEF8448331CEA06790E5B9
          454CFE5887D72721393116D17A1E0F9706A09800A7CD834ED3C5E2CA9A4E6B24
          C048C7565D94AE4A9F6084E812D06E1EAB7BDCF2CD4CE3B3C1A4B8BA28A32291
          5625A00A52B352B3E767DA995050551044DD38605D2AA86BFC6CC37FD81F4193
          982CEF21DA230000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '0'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000017352474200AECE1CE9000000097048597300000EC300000EC301C7
          6FA864000001F64944415478DA6364A01030C21819B92BC57815A5EB05E52582
          F8F9D82498FFFE7AF2FACEB3354F6F3E6B9E3139E21D5E03D273572AA8D8EA1F
          36B4529361666164F8CBCCC0C0C9CEC0C0C1FC8FE1E2FEEB774EEDB86A3F634A
          F8339C0634CD3DB73F36D4D0E1F73F06865F40FE7FA0017F598006B04214ED58
          766A4B419CB92F5603804ED7F24D72BE6AA221CCF0F12703C34F9020D00006A0
          01CC5003EE5C7BC9B075F641C91993C35F601800747E50565DC85A091E26860F
          40DDDF81AEF8CF0471050883C0FBF73F18D6B46F72047AE3001617ACF04AAA08
          DC2A2FC40636E0D36F06062062F8CD08A141E0C3DBAF0C7BA66CB506BAE01836
          2F08580558BE74B792650319F00118081F7F43F01FA8A2E7571F7CBAB5E314C8
          0BDFB0066251FBBEF6D018EB0A215E36B0012F80CA1E7D8128F8FDE915C38783
          EBB669DFAECD0E9FF7E601560380AE60E295979AAA62A59DC12E2C08F606087C
          7FF99641F2CDA15F1A9F37B2897F58F1EDFC6D6EEF8099EF0E601880484C2B4C
          7815658359B939F97E7FF9FAE1D38367AB1D999BC2037C252BD83F5C6678FEF8
          FDB753D779500C6164200056240A0B699AA9EFD5D5E535607C7901C3108206E0
          31C41368C821A20C4037E4CBBD0B0C5B6EEA6D886ADD1D48B4013043D40C9537
          BFE5B431B9FA557E5941417E224906C0405E5E9E1690BA3169D2A47F0037D9E0
          11777AC5200000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '23'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000022E4944415478DA95534D681341147E6F3666B749532D51445B4B8245
          8B8201457A112FE24D41D022A22204A5E04F2BA242890751F0E7A2E05FA1452F
          B61445AF22F4E4412958BC88A068A3496D8B3615BB3669379979EBCC26DD246B
          50FC6066DF9BD9F77DDF9BD94528430F06832B5002FE025B229BCD4ECBD05279
          E5CB6B4DD3FC808C694C7260C500F52C1308C330D6CB70CC2538743B75FADD70
          6FF4C540E2A4A631E6143206AC64A6D29422D075BD4D869F5C828B4FA6A89E8F
          63E7AE0DE0D3B42A756F474436B5EF4DDCD9B8F3F8E46077F4BAB3DB333441BA
          95C6731D31900E804975ACA1AE624104570647C1D25BE0EA81A6E2EE99875F89
          65BFE0A5235B5C078B055E2221087AEE8F00052370E3707371F5C4833409F333
          DEEC6C771CD46A41F6EE0CD90274DD7B055A4314EEC65B10379F7F9D08878CCB
          566E06F76D8B14ED1725DD9327A7984A24004F5FA6400F84E1C7AF850B78B42F
          9989451BEB89841E347C80507D68B2444D8B91839C25E40D3191FA3EF7133B6E
          A5DF372D5FB686040F3486FC9E4FC3AEB2AEF2022758E0CE35F3C9CCEC18C6FB
          A7465A9B976E129CD72902CF9DBB43C917B8805C9E64B14FE988E484398AA706
          32CF63ADA1ED5C12841B748F3E94D409F2050EF379B9A28A8B3EE96D726E18CF
          3E9E1DDADA16D823098CBA2558EEC02E9F81B29FE732619ADBA29CED371FE71F
          E1B56766EFAA95FEB810B6DFADAA893FFE317B7A86F7E18EDDFB0FAE8EAC3B26
          7306FF07FA369EECC712B55E4BE21F5076ADDFDD5CF8B51C048FC90000000049
          454E44AE426082}
      end
      item
        Background = clWindow
        Name = '32'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002FE4944415478DA6D535F485A7118FD5D75FE4B4DC97C989A0CA47226
          8C460F5B3065C5D8A0096DAC68B435E8615BD88B3162F9B0DA460C967B580446
          052B0613367BD09721056B8CB1EAA10C1469C2528B52ACD4326FA2B6EFBBB411
          6D170E72AFE73BBF73CF772E45FEBDF880F300354071FC2C0E88020200FA2499
          3A357C412E979BAC566B83C160D0ABD56A0D9FCF27BBBBBBE16030E8EFEBEB9B
          DDDCDCFC02BCE5FF095C696A6ABAD9DEDEFE40ABD5CA4B4B4B098BC522474747
          84CD6613814040B2D96C627070F0DDD8D89807F85F4F0A5C6A6D6DBDDBD5D565
          512A95CC83BDBD3DC2E170083A40F0783CE697CBE5129BCDF6D66EB77F00DA0F
          141029148A47131313CFF57ABD209D4E13B0C99045221103B1584C4A4A4A1817
          287A787878505D5DFD2C1A8D3A50E032285A6FC385C450284472B95C01AC6752
          A9540EEE691039D3D9D929974AA56C7C1DBCA6A6A65C1D1D1D6F50E0BECBE5EA
          AFADAD3D178FC749269321E02249D3F40664F00D8428BFDF5F23140A2B7A7B7B
          55C56291E4F3793CE81738EE47819E9595955732998C036913182C4622915879
          79B9D36834BEC7D3E6E6E6EE8D8C8C5C1D1F1F37A060A150C08CB21A8DE62923
          002B7A01F604601DED17BD5EEF4FB3D9EC56A9544E0C1A04DB0606068CE0E022
          64C0040F39D03A9DCE86370FE7E7E76D5555556A8AA298954D4F4FAF4A249255
          E8820FC94B4B4B357048657D7DBD0EC3C520D7D7D7A3CDCDCD2F51E0C6D0D050
          8FC56269C061DC3DB8C88348301008A4B00710A20C0A5609DDE04016CC4A3D1E
          CFECF0F0B01D05CE9695953D595B5B7B0C441E9E8821EDEFEF93582C46C2E130
          D9DADAC26CFEF6024469E88C03C27E8D025C80B9A5A5A5CDE974DEC280908C7D
          482412CCF0F6F636B31DDC008A8C8E8E7E5A5858C07C3CD4711BC5803B2693E9
          BAC3E1680447526CE2CECE0E339C4C26190170949C9C9C9C813C3E03FF2316F6
          4F95B11D12C035788DC6EEEE6E7D5D5D5D05D45A89C33E9F6F63717131E276BB
          FD90FE0CF0BC8034A070F263620184800A6C27407BEA730E01BE032280034011
          FFF80DA7B7627541C127B10000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '33'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000002A24944415478DA95535F48535118FF9D6D774333137266
          59CE6CFD51A24443B01E56A44E577388B988909E841E7A48E821749150D29096
          9665A55811566416948AA506BD849156A49020F93734A9E64D4ABBE3EEDED339
          9B4A06597D9773BEEF9CEFEFF9BEDF25B575D7A1282A341A0246D460306031F2
          F97C9C1155A5D06A35203C802CFB41A94AED7BF760786474D10071A6583435B7
          80100D11041DC8D5DA3AFC907C342FD781A1E1A033210B9D280DECE08CABD6C6
          9970FFC14384841808A9BE52D370C0999F2FFBFD73960B9DF9A7D2A034AB272C
          83A0D7E36E43E33D72E16235CDB1DBD1FAB86DDE657E670E3AAD16F1A618C4B3
          AC06BD2EA0917C7E444645E1DACD5B2015E7ABA8CD968DCE172F91BE6B67B00A
          12641A66BC327A393ADF4FC2DDD28F8F5FA580CEB84487627B02C2A57190B3E7
          2A6996D58A777D7D484D4941D7EB37811279B971ABA331A12CC3C9E621E859C7
          E75EC87BE46772C96E2388BBDC43B3B3AC1819FD80D8D81888E254B0025545EA
          D644E45DEE81382323DE18024FFE46F60C0147EA7B31E895B0224C00293B534E
          6DD95998144578BDDE40764EAAAA20D392068BA787F581A0B17013C68707A050
          052673226C55BD10740C07A7CADCD4E1C88124490BBAAF2A7EA46E494052E973
          303BB41625E39B7702A79F7C822B231226930963E36320C78B4F3C63E8B3D05F
          46C865858DB5C0E9C0D1261193330A62C2B528CD8CC0C13B5F906E0E45E13601
          376E373EE5F5AE632BE24FC85B633B96BC2A39B386CF55E193611E2A25989E12
          1FF55D7216F11E80FE06207EF6CB320AF6D961DE9CB4747D6EC92163A2C5C3BA
          AB0F409199CB3EA90D8630EB5F03E4D57FC65B774638BB36F309A695B477CBD3
          624777A5F3F07657C7C03F0508D57150B1AC0CED8AEF7BD7AB8ADCFD3B5CED83
          98FD37FE9736B0D53F77F8092DF92A6BBF98B2BB0000000049454E44AE426082}
      end
      item
        Background = clWindow
        Name = '34'
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002B84944415478DA6364C002D65D7DEAF0E02F57E0E5E7DF553EBEFBFE
          FFDD9B2F3724B87EAF5D916C721C5D2D2332C7BA7583B8B983F52229015EB70F
          BF51A41858FFFFFDCFF2FBFBD69DDB8F241CAAF77F8B618066D63C612317E7A3
          42427CEA40EE7F2686FF179919FF9F04A9F9FB9FC1F21F03932E48DDE3476FAE
          5C3E74D8E6EE9CA48F2806384CBAB04C525A301228F08EE5F797B84511DA5B91
          5D10B7E24AE01F569EF9FF1918F99F3D7A3BEF60A15132DC00958CC54A723ADA
          B799981919D819FF396CCD303E8C2D6C3C271C70FDCD2EB0F3EFDF7F7F1F9F3B
          AD70675EFA5346ADC846394645EB0B4C2C0C828C8C8C5F7839D9E28E56D8AE67
          C0010CEA77EFF8FB9FD1FDCFCFBFC9D73BDDE7815D2093BE7CD79FFF8CAE407F
          BFE6FAFA48FBCED2F2D7B80CD0CC59E02626FCD9FDF55BCE35D7A6A41C071B20
          E2DFE6F09D916F3F27CBBFF0376BF25631E001E5934D85AD9CA4362F9AB9DF6E
          EDA44F7FE0812813925DF264CDD41E060260D5698F652AEA5291FB0E1D8E2DF1
          B9BD046CC0CC7D16E9BFFF7EAFFAF797A12FCFE3E2445C9AFBD6EB07E81A28AF
          636161627CF9FAF5B5F9134FEB800D5878C023865BE0CFE20F9F3E5CD8B6EAB6
          D1BA291FFF633360C951674B36CE7FFB9898983918FEB32CDAB1FE7629D880B4
          2A1D7E437B8E470C0CFFF8D8D9389B921C8FD66335E098F1F4CF5F183218FE33
          3E3BBBFFBBC29C8EAB88F4DAB258BBE8EFFF6FBD1CEC3CFF156555575DB876B2
          B92DE5E9D5B86279A698E850336E6EBEFA43E79679FCFAFDF33F3303776C4DDC
          95A52829D1C65394D1C49565FA9F7F3FD340E2CC2C0C0CEC9C4C5F79B8389918
          FEF071BE7AFB1CA4EC3F332347F3C4E267701732A23B33AE4228F6CFBF1F8D0C
          4C7F1491C5BFBC677C74E5E8BFC637CFFE2DFCF4EEEF5F9C0680D385142B333B
          E77F130E9EFF6A7F7EFF67FAF8FAFFA30FAFFF5F034A8132D00F64B500CC1F1C
          ECD30705D80000000049454E44AE426082}
      end>
    PngOptions = [pngBlendOnDisabled, pngGrayscaleOnDisabled]
    Left = 432
    Top = 288
    Bitmap = {}
  end
  object pm_Config: TPopupMenu
    OnPopup = pm_ConfigPopup
    Left = 424
    Top = 112
    object mi_Abrir_Local: TMenuItem
      Caption = 'Abrir pasta'
      OnClick = mi_Abrir_LocalClick
    end
  end
  object pm_Fonte_Dados_32_64: TPopupMenu
    Left = 424
    Top = 184
    object mi_32_bits: TMenuItem
      Caption = '32 bits'
      OnClick = mi_32_bitsClick
    end
    object mi_64_bits: TMenuItem
      Caption = '64 bits'
      OnClick = mi_64_bitsClick
    end
  end
end
