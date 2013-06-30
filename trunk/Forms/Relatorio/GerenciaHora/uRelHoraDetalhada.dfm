inherited fm_Rel_Hora_Detalhada: Tfm_Rel_Hora_Detalhada
  ClientHeight = 467
  ClientWidth = 761
  ExplicitWidth = 777
  ExplicitHeight = 505
  PixelsPerInch = 96
  TextHeight = 12
  inherited Qr_Report: TQuickRep
    Left = 0
    Height = 1247
    DataSet = qy_funcionario
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Page.Values = (
      127.000000000000000000
      3300.000000000000000000
      127.000000000000000000
      2100.000000000000000000
      127.000000000000000000
      127.000000000000000000
      0.000000000000000000)
    ExplicitLeft = 0
    ExplicitHeight = 1247
    inherited QRDBText1: TQRDBText
      Width = 74
      Size.Values = (
        44.979166666666670000
        148.166666666666700000
        137.583333333333300000
        195.791666666666700000)
      Font.Height = -13
      Font.Quality = fqDefault
      ParentFont = False
      FontSize = 10
      ExplicitWidth = 74
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
        Caption = 'Relat'#243'rio de Registro de Ponto no per'#237'odo:'
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
      ForceNewPage = True
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
          52.916666666666660000
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
    object ChildBand1: TQRChildBand [4]
      Left = 48
      Top = 106
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
      ParentBand = bnd_Detalhe
      PrintOrder = cboAfterParent
      object QRLabel2: TQRLabel
        Left = 106
        Top = 0
        Width = 40
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
          105.833333333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Entrada'
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
        Width = 29
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
          76.729166666666670000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Sa'#237'da'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel6: TQRLabel
        Left = 372
        Top = 0
        Width = 61
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          984.250000000000000000
          0.000000000000000000
          161.395833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Dia Semana'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
      object QRLabel3: TQRLabel
        Left = 517
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
          1367.895833333333000000
          0.000000000000000000
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Tempo'
        Color = clWhite
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    object QRSubDetail1: TQRSubDetail [5]
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
      BeforePrint = QRSubDetail1BeforePrint
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
      DataSet = qy_horario
      PrintBefore = False
      PrintIfEmpty = True
      object dt_entrada: TQRDBText
        Left = 106
        Top = 0
        Width = 55
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
          145.520833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'dt_entrada'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
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
        FontSize = 7
      end
      object dt_saida: TQRDBText
        Left = 245
        Top = 0
        Width = 44
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          648.229166666666700000
          0.000000000000000000
          116.416666666666700000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'dt_saida'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
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
        FontSize = 7
      end
      object ds_dia_semana: TQRDBText
        Left = 372
        Top = 0
        Width = 79
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          984.250000000000000000
          0.000000000000000000
          209.020833333333300000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'ds_dia_semana'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
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
        FontSize = 7
      end
      object qt_tempo: TQRDBText
        Left = 517
        Top = 0
        Width = 48
        Height = 20
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          52.916666666666670000
          1367.895833333333000000
          0.000000000000000000
          127.000000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = qy_horario
        DataField = 'qt_tempo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
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
        FontSize = 7
      end
    end
    object QRSubDetail2: TQRSubDetail [6]
      Left = 48
      Top = 140
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
      DataSet = qy_total
      PrintBefore = False
      PrintIfEmpty = True
      object lb_Total: TQRLabel
        Left = 517
        Top = 0
        Width = 42
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1367.895833333333000000
          0.000000000000000000
          111.125000000000000000)
        XLColumn = 0
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'lb_Total'
        Color = clWhite
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Verdana'
        Font.Style = [fsBold]
        Font.Quality = fqClearType
        ParentFont = False
        Transparent = True
        WordWrap = True
        ExportAs = exptText
        WrapStyle = BreakOnSpaces
        FontSize = 7
      end
    end
    inherited QRBand1: TQRBand
      Top = 157
      Size.Values = (
        63.500000000000000000
        1846.791666666667000000)
      ExplicitTop = 157
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
  object qy_funcionario: TADOQuery
    Parameters = <
      item
        Name = 'nm_usuario'
        DataType = ftString
        Value = Null
      end>
    SQL.Strings = (
      'select      a.nr_seq_funcionario,'
      #9'a.nm_funcionario'
      'from'#9'vw_total_hora_detalhada a'
      'where'#9'1=1'
      'and'#9'a.nm_usuario_criacao   = :nm_usuario'
      'and         a.dt_saida is not null'
      'group by  a.nr_seq_funcionario,a.nm_funcionario'#9#9#9'  '
      'order by   a.nm_funcionario')
    Left = 384
    Top = 224
  end
  object qy_horario: TADOQuery
    Parameters = <
      item
        Name = 'nm_usuario'
        DataType = ftString
        Value = Null
      end
      item
        Name = 'nr_seq_funcionario'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select '#9'a.*'
      'from'#9'vw_total_hora_detalhada a'
      'where'#9'a.nm_usuario_criacao  = :nm_usuario'
      'and          a.nr_seq_funcionario = :nr_seq_funcionario'
      'and         a.dt_saida is not null'
      'order by a.nm_funcionario, a.dt_entrada')
    Left = 384
    Top = 288
  end
  object qy_total: TADOQuery
    Parameters = <
      item
        Name = 'nr_seq_funcionario'
        DataType = ftInteger
        Value = Null
      end
      item
        Name = 'nm_usuario'
        DataType = ftString
        Value = Null
      end>
    SQL.Strings = (
      'select sum(a.qt_tempo) qt_total'
      'from'#9'  (                                           '
      '        select'#9'a.nr_seq_funcionario,              '
      '        '#9'date(a.dt_entrada) dt_entrada,     '
      
        '                a.dt_saida - a.dt_entrada - a.qt_tempo_desconto ' +
        'qt_tempo'
      '        from'#9'(                                     '
      '                select  a.nr_seq_funcionario,      '
      '                        a.dt_batida dt_entrada,    '
      '                        (select  w.dt_batida       '
      '                         from'#9'  tmp_func_horario w'
      
        '                         where'#9'  w.nr_seq_dia               = a.' +
        'nr_seq_dia+1       '
      
        '                         and'#9'    date(w.dt_batida)              ' +
        '       = date(a.dt_batida)    '
      
        '                         and'#9#9'  mod(w.nr_seq_dia,2)  = 0        ' +
        '            '
      
        '                         and'#9#9'  w.nr_seq_funcionario = a.nr_seq_' +
        'funcionario '
      
        '                         and'#9#9'  w.nm_usuario_criacao = a.nm_usua' +
        'rio_criacao   '
      '                        ) dt_saida,'
      
        '                           a.qt_tempo_desconto                  ' +
        '                      '
      '                from'#9'   tmp_func_horario  a'
      
        '                where'#9' 1=1                                      ' +
        '            '
      '                and'#9'a.nr_seq_funcionario  '#9'= :nr_seq_funcionario'
      '                and'#9'mod(a.nr_seq_dia,2) '#9'<> 0'
      '                and'#9'a.nm_usuario_criacao'#9'= :nm_usuario'
      '                and         a.dt_batida is not null'
      '          )a                                                    '
      '    )a')
    Left = 384
    Top = 352
  end
end
