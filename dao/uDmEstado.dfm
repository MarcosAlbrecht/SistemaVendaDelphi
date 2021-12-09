object DmEstado: TDmEstado
  OldCreateOrder = False
  Height = 254
  Width = 498
  object sqlPesquisar: TFDQuery
    Connection = DmConexao.FDConnection1
    SQL.Strings = (
      'select id_estado, descricao, uf from estado')
    Left = 128
    Top = 56
    object sqlPesquisarID_ESTADO: TIntegerField
      FieldName = 'ID_ESTADO'
      Origin = 'ID_ESTADO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlPesquisarDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object sqlPesquisarUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = sqlPesquisar
    Left = 128
    Top = 128
  end
end
