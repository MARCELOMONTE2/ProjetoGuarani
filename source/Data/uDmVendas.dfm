object DmVendas: TDmVendas
  OnCreate = DataModuleCreate
  Height = 466
  Width = 559
  object IBConectVendas: TIBDatabase
    DatabaseName = 
      'C:\Users\marce\OneDrive\Documentos\ProjetoGuarani\source\db\VEND' +
      'AS_DB.FDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 32
    Top = 8
  end
  object IBTransaction1: TIBTransaction
    DefaultDatabase = IBConectVendas
    Params.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 136
    Top = 8
  end
  object qryProduto: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT  first 20'
      'ID_PRODUTO, DESCRICAO, MARCA, PRECO'
      ' FROM PRODUTO'
      'order by id_produto desc')
    UpdateObject = IBUpdateSQLProduto
    PrecommittedReads = False
    Left = 296
    Top = 8
    object qryProdutoID_PRODUTO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PRODUTO'
      Origin = 'PRODUTO.ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryProdutoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Required = True
      Size = 50
    end
    object qryProdutoMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'PRODUTO.MARCA'
      Required = True
      Size = 50
    end
    object qryProdutoPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = 'PRODUTO.PRECO'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryCliente: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select FIRST 10 BAIRRO, CIDADE, CNPJ, COMPLEMENTO_END, '
      'ID_CLIENTE, LOGRADOURO, NOME_FANTASIA, '
      'NUMERO_END, RAZAO_SOCIAL, TELEFONE, UF'
      'from CLIENTES  order by ID_CLIENTE desc')
    UpdateObject = IBUpdateSQLCliente
    PrecommittedReads = False
    Left = 216
    Top = 8
    object qryClienteID_CLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CLIENTE'
      Origin = 'CLIENTES.ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryClienteCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CLIENTES.CNPJ'
      Size = 14
    end
    object qryClienteNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'CLIENTES.NOME_FANTASIA'
      Required = True
      Size = 50
    end
    object qryClienteRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'CLIENTES.RAZAO_SOCIAL'
      Required = True
      Size = 50
    end
    object qryClienteTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIENTES.TELEFONE'
      EditMask = '\(99\)00000-0000;0;_'
      Size = 15
    end
    object qryClienteLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Origin = 'CLIENTES.LOGRADOURO'
      Size = 50
    end
    object qryClienteNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'CLIENTES.NUMERO_END'
    end
    object qryClienteBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 50
    end
    object qryClienteCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTES.CIDADE'
      Size = 50
    end
    object qryClienteCOMPLEMENTO_END: TIBStringField
      FieldName = 'COMPLEMENTO_END'
      Origin = 'CLIENTES.COMPLEMENTO_END'
      Size = 50
    end
    object qryClienteUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTES.UF'
      FixedChar = True
      Size = 2
    end
  end
  object qryPedidos: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select DATA_PEDIDO, ID_CLIENTE,ID_PEDIDO, TOTAL_PEDIDO '
      ' from PEDIDO Where ID_PEDIDO = :ID_PEDIDO')
    UpdateObject = IBUpdateSQLPedidos
    PrecommittedReads = False
    Left = 328
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PEDIDO'
        ParamType = ptUnknown
      end>
    object qryPedidosID_PEDIDO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PEDIDO'
      Origin = 'PEDIDO.ID_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      DisplayFormat = '000'
    end
    object qryPedidosID_CLIENTE: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CLIENTE'
      Origin = 'PEDIDO.ID_CLIENTE'
      Required = True
    end
    object qryPedidosDATA_PEDIDO: TDateTimeField
      FieldName = 'DATA_PEDIDO'
      Origin = 'PEDIDO.DATA_PEDIDO'
      EditMask = '99/99/9999'
    end
    object qryPedidosTOTAL_PEDIDO: TIBBCDField
      FieldName = 'TOTAL_PEDIDO'
      Origin = 'PEDIDO.TOTAL_PEDIDO'
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBUpdateSQLProduto: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_PRODUTO,'
      '  DESCRICAO,'
      '  MARCA,'
      '  PRECO'
      'from PRODUTO '
      'where'
      '  ID_PRODUTO = :ID_PRODUTO')
    ModifySQL.Strings = (
      'update PRODUTO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  MARCA = :MARCA,'
      '  PRECO = :PRECO'
      'where'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    InsertSQL.Strings = (
      'insert into PRODUTO'
      '  (DESCRICAO, MARCA, PRECO)'
      'values'
      '  (:DESCRICAO, :MARCA, :PRECO)')
    DeleteSQL.Strings = (
      'delete from PRODUTO'
      'where'
      '  ID_PRODUTO = :OLD_ID_PRODUTO')
    Left = 192
    Top = 88
  end
  object IBUpdateSQLPedidos: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_PEDIDO,'
      '  ID_CLIENTE,'
      '  TOTAL_PEDIDO,'
      '  DATA_PEDIDO'
      'from PEDIDO '
      'where'
      '  ID_PEDIDO = :ID_PEDIDO')
    ModifySQL.Strings = (
      'update PEDIDO'
      'set'
      '  DATA_PEDIDO = :DATA_PEDIDO,'
      '  ID_CLIENTE = :ID_CLIENTE,'
      '  TOTAL_PEDIDO = :TOTAL_PEDIDO'
      'where'
      '  ID_PEDIDO = :OLD_ID_PEDIDO')
    InsertSQL.Strings = (
      'insert into PEDIDO'
      '  (DATA_PEDIDO, ID_CLIENTE, TOTAL_PEDIDO)'
      'values'
      '  (:DATA_PEDIDO, :ID_CLIENTE, :TOTAL_PEDIDO)')
    DeleteSQL.Strings = (
      'delete from PEDIDO'
      'where'
      '  ID_PEDIDO = :OLD_ID_PEDIDO')
    Left = 56
    Top = 152
  end
  object qryItensPedidos: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'Select'
      'i.ID_PEDIDO, i.ID_ITENS_PEDIDO, i.ID_PRODUTO, prd.descricao, '
      'prd.marca,  i.QUANTIDADE, i.VALOR_TOTAL, '
      'i.VALOR_UNITARIO'
      'from ITENS_PEDIDO i'
      'join PEDIDO p on p.id_pedido = i.id_pedido'
      'left join produto prd on prd.id_produto = i.id_produto'
      'join clientes c on c.id_cliente = p.id_cliente'
      'Where i.ID_PEDIDO = :ID_PEDIDO')
    UpdateObject = IBUpdateSQLItensPedido
    PrecommittedReads = False
    Left = 328
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_PEDIDO'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryItensPedidosID_PEDIDO: TIntegerField
      FieldName = 'ID_PEDIDO'
      Origin = 'ITENS_PEDIDO.ID_PEDIDO'
      Required = True
    end
    object qryItensPedidosID_ITENS_PEDIDO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_ITENS_PEDIDO'
      Origin = 'ITENS_PEDIDO.ID_ITENS_PEDIDO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryItensPedidosID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'ITENS_PEDIDO.ID_PRODUTO'
      Required = True
    end
    object qryItensPedidosDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Size = 50
    end
    object qryItensPedidosMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'PRODUTO.MARCA'
      Size = 50
    end
    object qryItensPedidosQUANTIDADE: TIBBCDField
      FieldName = 'QUANTIDADE'
      Origin = 'ITENS_PEDIDO.QUANTIDADE'
      Required = True
      Precision = 18
      Size = 2
    end
    object qryItensPedidosVALOR_TOTAL: TIBBCDField
      FieldName = 'VALOR_TOTAL'
      Origin = 'ITENS_PEDIDO.VALOR_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryItensPedidosVALOR_UNITARIO: TIBBCDField
      FieldName = 'VALOR_UNITARIO'
      Origin = 'ITENS_PEDIDO.VALOR_UNITARIO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object IBUpdateSQLItensPedido: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_ITENS_PEDIDO,'
      '  ID_PEDIDO,'
      '  ID_PRODUTO,'
      '  VALOR_UNITARIO,'
      '  VALOR_TOTAL,'
      '  QUANTIDADE'
      'from ITENS_PEDIDO '
      'where'
      '  ID_ITENS_PEDIDO = :ID_ITENS_PEDIDO')
    ModifySQL.Strings = (
      'update ITENS_PEDIDO'
      'set'
      '  ID_PEDIDO = :ID_PEDIDO,'
      '  ID_PRODUTO = :ID_PRODUTO,'
      '  QUANTIDADE = :QUANTIDADE,'
      '  VALOR_TOTAL = :VALOR_TOTAL,'
      '  VALOR_UNITARIO = :VALOR_UNITARIO'
      'where'
      '  ID_ITENS_PEDIDO = :OLD_ID_ITENS_PEDIDO')
    InsertSQL.Strings = (
      'insert into ITENS_PEDIDO'
      
        '  (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, VALOR_TOTAL, VALOR_UNITARI' +
        'O)'
      'values'
      
        '  (:ID_PEDIDO, :ID_PRODUTO, :QUANTIDADE, :VALOR_TOTAL, :VALOR_UN' +
        'ITARIO)')
    DeleteSQL.Strings = (
      'delete from ITENS_PEDIDO'
      'where'
      '  ID_ITENS_PEDIDO = :OLD_ID_ITENS_PEDIDO')
    Left = 40
    Top = 216
  end
  object qryCliPed: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    AutoCalcFields = False
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *'
      'from CLIENTES  '
      'where ID_CLIENTE = :ID_CLIENTE')
    PrecommittedReads = False
    Left = 120
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID_CLIENTE'
        ParamType = ptUnknown
        Value = 4
      end>
    object IntegerField1: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_CLIENTE'
      Origin = 'CLIENTES.ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
    end
    object IBStringField1: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CLIENTES.CNPJ'
      Size = 14
    end
    object IBStringField2: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'CLIENTES.NOME_FANTASIA'
      Required = True
      Size = 50
    end
    object IBStringField3: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'CLIENTES.RAZAO_SOCIAL'
      Required = True
      Size = 50
    end
    object IBStringField4: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIENTES.TELEFONE'
      Required = True
      EditMask = '\(99\)00000-0000;0;_'
      Size = 15
    end
    object IBStringField5: TIBStringField
      FieldName = 'LOGRADOURO'
      Origin = 'CLIENTES.LOGRADOURO'
      Size = 50
    end
    object IBStringField6: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'CLIENTES.NUMERO_END'
    end
    object IBStringField7: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 50
    end
    object IBStringField8: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTES.CIDADE'
      Size = 50
    end
    object IBStringField9: TIBStringField
      FieldName = 'COMPLEMENTO_END'
      Origin = 'CLIENTES.COMPLEMENTO_END'
      Size = 50
    end
    object IBStringField10: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTES.UF'
      FixedChar = True
      Size = 2
    end
  end
  object qryProdPed: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT '
      'ID_PRODUTO, DESCRICAO, MARCA, PRECO'
      ' FROM PRODUTO'
      'WHERE ID_PRODUTO = :ID_PRODUTO')
    PrecommittedReads = False
    Left = 48
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID_PRODUTO'
        ParamType = ptUnknown
      end>
    object IntegerField2: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID_PRODUTO'
      Origin = 'PRODUTO.ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object IBStringField11: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Required = True
      Size = 50
    end
    object IBStringField12: TIBStringField
      FieldName = 'MARCA'
      Origin = 'PRODUTO.MARCA'
      Required = True
      Size = 50
    end
    object IBBCDField1: TIBBCDField
      FieldName = 'PRECO'
      Origin = 'PRODUTO.PRECO'
      Required = True
      Precision = 18
      Size = 2
    end
  end
  object IBUpdateSQLCliente: TIBUpdateSQL
    RefreshSQL.Strings = (
      'Select '
      '  ID_CLIENTE,'
      '  NOME_FANTASIA,'
      '  RAZAO_SOCIAL,'
      '  CNPJ,'
      '  TELEFONE,'
      '  LOGRADOURO,'
      '  NUMERO_END,'
      '  BAIRRO,'
      '  CIDADE,'
      '  UF,'
      '  COMPLEMENTO_END'
      'from CLIENTES '
      'where'
      '  ID_CLIENTE = :ID_CLIENTE')
    ModifySQL.Strings = (
      'update CLIENTES'
      'set'
      '  BAIRRO = :BAIRRO,'
      '  CIDADE = :CIDADE,'
      '  CNPJ = :CNPJ,'
      '  COMPLEMENTO_END = :COMPLEMENTO_END,'
      '  LOGRADOURO = :LOGRADOURO,'
      '  NOME_FANTASIA = :NOME_FANTASIA,'
      '  NUMERO_END = :NUMERO_END,'
      '  RAZAO_SOCIAL = :RAZAO_SOCIAL,'
      '  TELEFONE = :TELEFONE,'
      '  UF = :UF'
      'where'
      '  ID_CLIENTE = :OLD_ID_CLIENTE')
    InsertSQL.Strings = (
      'insert into CLIENTES'
      
        '  (BAIRRO, CIDADE, CNPJ, COMPLEMENTO_END, LOGRADOURO, NOME_FANTA' +
        'SIA, NUMERO_END, '
      '   RAZAO_SOCIAL, TELEFONE, UF)'
      'values'
      
        '  (:BAIRRO, :CIDADE, :CNPJ, :COMPLEMENTO_END, :LOGRADOURO, :NOME' +
        '_FANTASIA, '
      '   :NUMERO_END, :RAZAO_SOCIAL, :TELEFONE, :UF)')
    DeleteSQL.Strings = (
      'delete from CLIENTES'
      'where'
      '  ID_CLIENTE = :OLD_ID_CLIENTE')
    Left = 56
    Top = 88
  end
  object qryProdPesq: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PRODUTO')
    PrecommittedReads = False
    Left = 432
    Top = 304
    object qryProdPesqID_PRODUTO: TIntegerField
      FieldName = 'ID_PRODUTO'
      Origin = 'PRODUTO.ID_PRODUTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdPesqDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Required = True
      Size = 50
    end
    object qryProdPesqMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = 'PRODUTO.MARCA'
      Required = True
      Size = 50
    end
    object qryProdPesqPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = 'PRODUTO.PRECO'
      Required = True
      EditFormat = '#,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object qryCliPesq: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTES')
    PrecommittedReads = False
    Left = 448
    Top = 232
    object qryCliPesqID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Origin = 'CLIENTES.ID_CLIENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCliPesqNOME_FANTASIA: TIBStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'CLIENTES.NOME_FANTASIA'
      Required = True
      Size = 50
    end
    object qryCliPesqRAZAO_SOCIAL: TIBStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'CLIENTES.RAZAO_SOCIAL'
      Size = 50
    end
    object qryCliPesqCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = 'CLIENTES.CNPJ'
      Size = 14
    end
    object qryCliPesqTELEFONE: TIBStringField
      FieldName = 'TELEFONE'
      Origin = 'CLIENTES.TELEFONE'
      Required = True
      Size = 15
    end
    object qryCliPesqLOGRADOURO: TIBStringField
      FieldName = 'LOGRADOURO'
      Origin = 'CLIENTES.LOGRADOURO'
      Size = 50
    end
    object qryCliPesqNUMERO_END: TIBStringField
      FieldName = 'NUMERO_END'
      Origin = 'CLIENTES.NUMERO_END'
    end
    object qryCliPesqBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = 'CLIENTES.BAIRRO'
      Size = 50
    end
    object qryCliPesqCIDADE: TIBStringField
      FieldName = 'CIDADE'
      Origin = 'CLIENTES.CIDADE'
      Size = 50
    end
    object qryCliPesqUF: TIBStringField
      FieldName = 'UF'
      Origin = 'CLIENTES.UF'
      FixedChar = True
      Size = 2
    end
    object qryCliPesqCOMPLEMENTO_END: TIBStringField
      FieldName = 'COMPLEMENTO_END'
      Origin = 'CLIENTES.COMPLEMENTO_END'
      Size = 50
    end
  end
  object qryRelatorio: TIBQuery
    Database = IBConectVendas
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '    select first 2'
      '        sum(i.quantidade) Quantidade_Vendida,'
      '        i.id_produto Id_produto,'
      '        pd.descricao'
      '    from itens_pedido i'
      '    join produto pd on pd.id_produto= i.id_produto'
      '    join pedido p on p.id_pedido = i.id_pedido'
      '    group by i.id_produto,pd.descricao'
      '    order by 1 desc')
    UniDirectional = True
    PrecommittedReads = False
    Left = 464
    Top = 56
    object qryRelatorioQUANTIDADE_VENDIDA: TIBBCDField
      DisplayLabel = 'Quant'
      DisplayWidth = 10
      FieldName = 'QUANTIDADE_VENDIDA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object qryRelatorioID_PRODUTO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_PRODUTO'
      Origin = 'ITENS_PEDIDO.ID_PRODUTO'
      Required = True
    end
    object qryRelatorioDESCRICAO: TIBStringField
      DisplayLabel = 'Produto'
      FieldName = 'DESCRICAO'
      Origin = 'PRODUTO.DESCRICAO'
      Required = True
      Size = 50
    end
  end
end
