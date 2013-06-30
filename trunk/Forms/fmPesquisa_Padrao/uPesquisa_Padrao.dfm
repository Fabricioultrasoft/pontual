object fm_Pesquisa_Padrao: Tfm_Pesquisa_Padrao
  Left = 0
  Top = 0
  Caption = 'Pesquisa Padr'#227'o'
  ClientHeight = 442
  ClientWidth = 624
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 624
    Height = 55
    Align = alTop
    Caption = 'Filtros'
    TabOrder = 0
    object lb_Nome_Campo: TLabel
      Left = 19
      Top = 33
      Width = 26
      Height = 14
      Caption = 'Filtro:'
    end
    object Label1: TLabel
      Left = 11
      Top = 13
      Width = 36
      Height = 14
      Caption = 'Campo:'
    end
    object cb_campo: TFocusCombobox
      Left = 48
      Top = 10
      Width = 268
      Height = 22
      Style = csOwnerDrawFixed
      TabOrder = 0
      TabStop = False
      OnClick = cb_campoClick
      NormalColor = clWindow
      FocusColor = 15590345
      ErrorColor = 13290239
    end
    object ed_Campo_Pesquisa: TFocusButtonedEdit
      Left = 48
      Top = 31
      Width = 268
      Height = 22
      LeftButton.HotImageIndex = 0
      LeftButton.ImageIndex = 0
      LeftButton.PressedImageIndex = 0
      LeftButton.Visible = True
      TabOrder = 1
      OnChange = ed_Campo_PesquisaChange
      NormalColor = clWindow
      FocusColor = 15590345
      ErrorColor = 13290239
      Obrigatorio = False
      AlertarCorrecao = False
    end
  end
  object gb_Grid: TGroupBox
    Left = 0
    Top = 55
    Width = 624
    Height = 356
    Align = alClient
    Caption = 'Resultado'
    TabOrder = 1
    object dbg_Pesquisa: TDBGrid
      AlignWithMargins = True
      Left = 5
      Top = 19
      Width = 614
      Height = 332
      Align = alClient
      DataSource = ds_padrao
      DrawingStyle = gdsGradient
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
      ParentColor = True
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Arial'
      TitleFont.Style = []
      OnDblClick = dbg_PesquisaDblClick
      OnKeyDown = dbg_PesquisaKeyDown
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 411
    Width = 624
    Height = 31
    Align = alBottom
    TabOrder = 2
    object bt_Cancelar: TButton
      Left = 415
      Top = 8
      Width = 102
      Height = 20
      Caption = 'Cancelar (Esc)'
      HotImageIndex = 5
      ImageIndex = 5
      Images = Banco_dm.img_List
      TabOrder = 0
      OnClick = bt_CancelarClick
    end
    object bt_Confirmar: TButton
      Left = 519
      Top = 8
      Width = 102
      Height = 20
      Caption = 'Confirmar (Enter)'
      HotImageIndex = 4
      ImageIndex = 4
      Images = Banco_dm.img_List
      TabOrder = 1
      OnClick = bt_ConfirmarClick
    end
  end
  object qy_padrao: TADOQuery
    Parameters = <>
    Left = 224
    Top = 136
  end
  object ds_padrao: TDataSource
    DataSet = qy_padrao
    Left = 328
    Top = 136
  end
end
