object fm_Principal: Tfm_Principal
  Left = 0
  Top = 0
  Align = alTop
  BorderStyle = bsSingle
  Caption = 'Pontual - Controle de Registro de Ponto Digital'
  ClientHeight = 432
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = men_Padrao
  OldCreateOrder = True
  PopupMenu = pm_Principal
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object img_Principal: TImage
    Left = 216
    Top = 0
    Width = 418
    Height = 413
    Align = alClient
    AutoSize = True
    Center = True
    Stretch = True
    Transparent = True
    ExplicitLeft = 224
    ExplicitTop = 144
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object sb_Padrao: TStatusBar
    Left = 0
    Top = 413
    Width = 634
    Height = 19
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Panels = <
      item
        Alignment = taCenter
        Bevel = pbNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Style = psOwnerDraw
        Text = 'IconUser'
        Width = 20
      end
      item
        Bevel = pbNone
        Text = 'Usuario'
        Width = 50
      end
      item
        Alignment = taCenter
        Bevel = pbNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Style = psOwnerDraw
        Text = 'Icon IP Local'
        Width = 25
      end
      item
        Bevel = pbNone
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Text = 'Ip Local'
        Width = 50
      end
      item
        Bevel = pbNone
        Style = psOwnerDraw
        Text = 'Icon IP Server'
        Width = 25
      end
      item
        Bevel = pbNone
        Text = 'IP Server'
        Width = 50
      end
      item
        Alignment = taRightJustify
        Bevel = pbNone
        Text = 'Vers'#227'o'
        Width = 50
      end>
    ParentColor = True
    UseSystemFont = False
    OnDrawPanel = sb_PadraoDrawPanel
  end
  object mc_Calendario: TMonthCalendar
    Left = 0
    Top = 0
    Width = 216
    Height = 413
    Align = alLeft
    BiDiMode = bdLeftToRight
    CalColors.BackColor = clTeal
    Date = 40803.014228240740000000
    DoubleBuffered = True
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ShowToday = False
    TabOrder = 0
    WeekNumbers = True
  end
  object pm_Principal: TPopupMenu
    Left = 552
    Top = 32
    object mi_Plano: TMenuItem
      Caption = 'Plano de Fundo'
      object mi_Alterar_Plano_Fundo: TMenuItem
        Caption = 'Alterar plano de fundo'
        OnClick = mi_Alterar_Plano_FundoClick
      end
      object mi_Nao_utilizar_imagem: TMenuItem
        Caption = 'N'#227'o utilizar nenhuma imagem'
        OnClick = mi_Nao_utilizar_imagemClick
      end
      object mi_Cor_Fonte: TMenuItem
        Caption = 'Cor da Fonte'
        OnClick = mi_Cor_FonteClick
      end
    end
  end
  object cd_Dialog: TColorDialog
    Left = 328
    Top = 32
  end
  object fo_Dialog: TOpenPictureDialog
    Left = 472
    Top = 32
  end
  object men_Padrao: TMainMenu
    Images = Banco_dm.img_List
    Left = 400
    Top = 32
    object mi_Arquivo: TMenuItem
      Caption = 'Arquivo'
      object mi_Cadastro_e_Consulta: TMenuItem
        Caption = 'Cadastro e Consulta'
        ImageIndex = 18
        object mi_Cadastro_Funcionario: TMenuItem
          Caption = 'Funcion'#225'rio'
          ImageIndex = 19
          OnClick = mi_Cadastro_FuncionarioClick
        end
        object mi_Cadastro_Horario: TMenuItem
          Caption = 'Hor'#225'rio'
          ImageIndex = 20
          OnClick = mi_Cadastro_HorarioClick
        end
        object mi_Cadastro_Turno: TMenuItem
          Caption = 'Turno'
          ImageIndex = 25
          OnClick = mi_Cadastro_TurnoClick
        end
        object mi_Cadastro_Feriado: TMenuItem
          Caption = 'Feriado'
          ImageIndex = 26
          OnClick = mi_Cadastro_FeriadoClick
        end
      end
    end
    object mi_Sistema: TMenuItem
      Caption = 'Sistema'
      object mi_Gerenciamento: TMenuItem
        Caption = 'Gerenciamento'
        ImageIndex = 16
        object mi_Cadastro_Usuario: TMenuItem
          Caption = 'Usu'#225'rio'
          ImageIndex = 14
          OnClick = mi_Cadastro_UsuarioClick
        end
        object mi_Manutencao: TMenuItem
          Caption = 'Manuten'#231#227'o'
          ImageIndex = 11
          OnClick = mi_ManutencaoClick
        end
      end
      object mi_Alterar_Senha: TMenuItem
        Caption = 'Alterar sua senha'
        ImageIndex = 12
        OnClick = mi_Alterar_SenhaClick
      end
    end
    object mi_Ajuda: TMenuItem
      Caption = 'Sobre'
      object Atalhos1: TMenuItem
        Caption = 'Atalhos'
        object CTRLSHIFTUMostraaultimaedioocorridanoregistro1: TMenuItem
          Caption = 
            'CTRL + SHIFT + U -> Mostra data/hora e usuario que alterou regis' +
            'tro pela ultima vez'
          ImageIndex = 10
        end
        object CTRLSSalvaumRegistro1: TMenuItem
          Caption = 'CTRL + S (Salva um Registro)'
          ImageIndex = 4
        end
        object CTRLNNovoRegistro1: TMenuItem
          Caption = 'CTRL + N (Novo Registro)'
          ImageIndex = 2
        end
        object AtualizaumaConsulta1: TMenuItem
          Caption = 'F5 (Atualiza uma Consulta)'
          ImageIndex = 0
        end
      end
    end
    object mi_Janelas: TMenuItem
      Caption = 'Janelas'
    end
  end
  object XPManifest1: TXPManifest
    Left = 272
    Top = 32
  end
end
