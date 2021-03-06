object DmCliente: TDmCliente
  OldCreateOrder = False
  Height = 291
  Width = 561
  object sqlPesquisar: TFDQuery
    Connection = DmConexao.FDConnection1
    SQL.Strings = (
      'select id, nome, telefone from cliente where (nome like :nome)')
    Left = 96
    Top = 80
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 80
        Value = Null
      end>
    object sqlPesquisarID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object sqlPesquisarNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 80
    end
    object sqlPesquisarTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 10
    end
  end
  object sqlInserir: TFDQuery
    Connection = DmConexao.FDConnection1
    SQL.Strings = (
      'insert into CLIENTE (NOME, TIPO, DOCUMENTO, TELEFONE, FK_ESTADO)'
      'values (:NOME, :TIPO, :DOCUMENTO, :TELEFONE, :FK_ESTADO)')
    Left = 176
    Top = 80
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 80
        Value = Null
      end
      item
        Name = 'TIPO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'FK_ESTADO'
        ParamType = ptInput
      end>
  end
  object sqlAlterar: TFDQuery
    Connection = DmConexao.FDConnection1
    SQL.Strings = (
      'update CLIENTE'
      'set NOME = :NOME,'
      '    TIPO = :TIPO,'
      '    DOCUMENTO = :DOCUMENTO,'
      '    TELEFONE = :TELEFONE,'
      '    FK_ESTADO = :FK_ESTADO'
      'WHERE(ID = :ID)')
    Left = 248
    Top = 80
    ParamData = <
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 80
      end
      item
        Name = 'TIPO'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'DOCUMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end
      item
        Name = 'TELEFONE'
        DataType = ftString
        ParamType = ptInput
        Size = 10
      end
      item
        Name = 'FK_ESTADO'
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object sqlExcluir: TFDQuery
    Connection = DmConexao.FDConnection1
    SQL.Strings = (
      'delete from CLIENTE where (id = :id)')
    Left = 328
    Top = 80
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
  end
  object dsPesquisar: TDataSource
    DataSet = sqlPesquisar
    Left = 96
    Top = 144
  end
end
