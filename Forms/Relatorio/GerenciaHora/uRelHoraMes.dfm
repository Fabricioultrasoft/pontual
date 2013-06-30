inherited fm_Rel_Hora_Mes: Tfm_Rel_Hora_Mes
  ClientHeight = 470
  ClientWidth = 757
  ExplicitWidth = 773
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 12
  inherited Qr_Report: TQuickRep
    Top = 0
    DataSet = qy_funcionario
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
    ExplicitTop = 0
    inherited QRDBText1: TQRDBText
      Size.Values = (
        44.979166666666670000
        148.166666666666700000
        137.583333333333300000
        164.041666666666700000)
      FontSize = 7
    end
    inherited bnd_Title: TQRBand
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      inherited bnd_Title_Titulo: TQRLabel
        Size.Values = (
          44.979166666666670000
          -269.875000000000000000
          2.645833333333333000
          2386.541666666667000000)
        Caption = 'Relat'#243'rio Sint'#233'tico de Horas por M'#234's'
        FontSize = 10
      end
    end
    inherited bnd_Caption: TQRChildBand
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      object QRLabel1: TQRLabel
        Left = 73
        Top = 0
        Width = 59
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          193.145833333333300000
          0.000000000000000000
          156.104166666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Funcion'#225'rio'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel4: TQRLabel
        Left = 4
        Top = 0
        Width = 36
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          10.583333333333330000
          0.000000000000000000
          95.250000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'C'#243'digo'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    inherited QRBand1: TQRBand
      Top = 140
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      ExplicitTop = 140
      inherited bnd_Footer_Lb_Data: TQRLabel
        Size.Values = (
          34.395833333333330000
          0.000000000000000000
          0.000000000000000000
          277.812500000000000000)
        FontSize = 7
      end
    end
    object bnd_Detalhe: TQRBand
      Left = 48
      Top = 106
      Width = 698
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AfterPrint = bnd_DetalheAfterPrint
      AlignToBottom = False
      Color = clWhite
      TransparentBand = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Verdana'
      Font.Style = []
      Font.Quality = fqClearType
      ForceNewColumn = False
      ForceNewPage = False
      ParentFont = False
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      BandType = rbDetail
      object nm_funcionario: TQRDBText
        Left = 73
        Top = 0
        Width = 103
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          193.145833333333300000
          0.000000000000000000
          272.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_funcionario
        DataField = 'nm_funcionario'
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
      object nr_seq_funcionario: TQRDBText
        Left = 8
        Top = 0
        Width = 42
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          21.166666666666670000
          0.000000000000000000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qy_funcionario
        DataField = 'nr_seq_funcionario'
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
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 8
      end
    end
    object ChildBand1: TQRChildBand
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
      Color = 15658734
      TransparentBand = False
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      ParentBand = bnd_Caption
      PrintOrder = cboAfterParent
      object QRLabel2: TQRLabel
        Left = 106
        Top = 0
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          280.458333333333300000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'M'#234's/Ano'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel5: TQRLabel
        Left = 245
        Top = 0
        Width = 123
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          648.229166666666700000
          0.000000000000000000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tempo previsto trabalho'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 396
        Top = 0
        Width = 91
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1047.750000000000000000
          0.000000000000000000
          240.770833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Tempo trabalhado'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel3: TQRLabel
        Left = 529
        Top = 0
        Width = 55
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1399.645833333333000000
          0.000000000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Total'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    object QRSubDetail1: TQRSubDetail
      Left = 48
      Top = 123
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
      LinkBand = bnd_Detalhe
      Size.Values = (
        44.979166666666670000
        1846.791666666667000000)
      PreCaluculateBandHeight = False
      KeepOnOnePage = False
      Master = Qr_Report
      PrintBefore = False
      PrintIfEmpty = True
      object QRDBText2: TQRDBText
        Left = 106
        Top = 0
        Width = 46
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          280.458333333333300000
          0.000000000000000000
          121.708333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'mes_ano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object dt_saida: TQRDBText
        Left = 245
        Top = 0
        Width = 123
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          648.229166666666700000
          0.000000000000000000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'qt_tempo_previsto'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object ds_dia_semana: TQRDBText
        Left = 396
        Top = 0
        Width = 123
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666660000
          1047.750000000000000000
          0.000000000000000000
          325.437500000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'qt_tempo_trabalho'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
      object qt_tempo: TQRDBText
        Left = 529
        Top = 0
        Width = 24
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1399.645833333333000000
          0.000000000000000000
          63.500000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'total'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = []
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = False
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FullJustify = False
        MaxBreakChars = 0
        FontSize = 7
      end
    end
  end
  object qy_funcionario: TADOQuery
    Parameters = <
      item
        Name = 'nm_usuario'
        DataType = ftString
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select   a.nr_seq_funcionario,'
      '             a.nm_funcionario'
      'from      vw_total_hora_mes a'
      'where   1=1'
      'and       a.nm_usuario_criacao = :nm_usuario'
      'group by a.nr_seq_funcionario,'
      #9'a.nm_funcionario'
      'order by a.nm_funcionario')
    Left = 192
    Top = 248
  end
  object ds_funcionario: TDataSource
    DataSet = qy_funcionario
    Left = 192
    Top = 312
  end
  object qy_horario: TADOQuery
    Parameters = <
      item
        Name = 'nm_usuario'
        DataType = ftString
        Size = -1
        Value = Null
      end
      item
        Name = 'nr_seq_funcionario'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select   a.*'
      'from      vw_total_hora_mes a'
      'where   1=1'
      'and       a.nm_usuario_criacao = :nm_usuario'
      'and      a.nr_seq_funcionario = :nr_seq_funcionario')
    Left = 296
    Top = 248
  end
  object ds_horario: TDataSource
    DataSet = qy_horario
    Left = 296
    Top = 312
  end
end
