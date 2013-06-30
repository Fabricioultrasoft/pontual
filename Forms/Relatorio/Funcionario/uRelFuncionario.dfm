inherited fm_Rel_Funcionario: Tfm_Rel_Funcionario
  ClientHeight = 554
  ClientWidth = 772
  ExplicitWidth = 788
  ExplicitHeight = 592
  PixelsPerInch = 96
  TextHeight = 12
  inherited Qr_Report: TQuickRep
    Left = 2
    DataSet = fm_Cadastro_Funcionario.qy_ListaFuncionario
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      127.000000000000000000
      2970.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    PrintIfEmpty = False
    PreviewInitialState = wsMaximized
    ExplicitLeft = 2
    inherited QRDBText1: TQRDBText
      Width = 74
      Size.Values = (
        44.979166666666670000
        148.166666666666700000
        137.583333333333300000
        195.791666666666700000)
      Font.Height = -13
      ParentFont = False
      FontSize = 10
      ExplicitWidth = 74
    end
    inherited bnd_Title: TQRBand
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      inherited bnd_Title_Titulo: TQRLabel
        Left = 266
        Width = 165
        Size.Values = (
          44.979166666666670000
          703.791666666666700000
          2.645833333333333000
          436.562500000000000000)
        AutoSize = True
        Caption = 'Relat'#243'rio de Funcion'#225'rios'
        FontSize = 10
        ExplicitLeft = 266
        ExplicitWidth = 165
      end
    end
    inherited bnd_Caption: TQRChildBand
      Frame.DrawBottom = True
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      object QRLabel1: TQRLabel
        Left = 18
        Top = 0
        Width = 45
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          0.000000000000000000
          119.062500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
      object QRLabel3: TQRLabel
        Left = 72
        Top = 0
        Width = 38
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          0.000000000000000000
          100.541666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Nome'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 8
      end
    end
    object bnd_Detalhe: TQRBand [3]
      Left = 48
      Top = 89
      Width = 698
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object nr_sequencia: TQRDBText
        Left = 18
        Top = 1
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          47.625000000000000000
          2.645833333333333000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fm_Cadastro_Funcionario.qy_ListaFuncionario
        DataField = 'nr_sequencia'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object nm_funcionario: TQRDBText
        Left = 72
        Top = 1
        Width = 609
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          190.500000000000000000
          2.645833333333333000
          1611.312500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = fm_Cadastro_Funcionario.qy_ListaFuncionario
        DataField = 'nm_funcionario'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    inherited QRBand1: TQRBand
      Top = 106
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      ExplicitTop = 106
      inherited bnd_Footer_Lb_Data: TQRLabel
        Size.Values = (
          34.395833333333330000
          0.000000000000000000
          0.000000000000000000
          277.812500000000000000)
        FontSize = 7
      end
    end
  end
end
