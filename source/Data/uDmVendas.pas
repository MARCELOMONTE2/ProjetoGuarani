unit uDmVendas;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IBX.IBDatabase, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBTable, IBX.IBUpdateSQL, Datasnap.Provider,
  Datasnap.DBClient, Vcl.Forms, Vcl.Dialogs;

type
  TDmVendas = class(TDataModule)
    IBConectVendas: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qryProduto: TIBQuery;
    qryProdutoID_PRODUTO: TIntegerField;
    qryProdutoDESCRICAO: TIBStringField;
    qryProdutoMARCA: TIBStringField;
    qryProdutoPRECO: TIBBCDField;
    qryCliente: TIBQuery;
    qryClienteBAIRRO: TIBStringField;
    qryClienteCIDADE: TIBStringField;
    qryClienteCNPJ: TIBStringField;
    qryClienteCOMPLEMENTO_END: TIBStringField;
    qryClienteID_CLIENTE: TIntegerField;
    qryClienteLOGRADOURO: TIBStringField;
    qryClienteNOME_FANTASIA: TIBStringField;
    qryClienteNUMERO_END: TIBStringField;
    qryClienteRAZAO_SOCIAL: TIBStringField;
    qryClienteTELEFONE: TIBStringField;
    qryClienteUF: TIBStringField;
    qryPedidos: TIBQuery;
    IBUpdateSQLProduto: TIBUpdateSQL;
    IBUpdateSQLPedidos: TIBUpdateSQL;
    qryPedidosDATA_PEDIDO: TDateTimeField;
    qryPedidosID_CLIENTE: TIntegerField;
    qryPedidosID_PEDIDO: TIntegerField;
    qryPedidosTOTAL_PEDIDO: TIBBCDField;
    qryItensPedidos: TIBQuery;
    IBUpdateSQLItensPedido: TIBUpdateSQL;
    qryCliPed: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    qryProdPed: TIBQuery;
    IntegerField2: TIntegerField;
    IBStringField11: TIBStringField;
    IBStringField12: TIBStringField;
    IBBCDField1: TIBBCDField;
    IBUpdateSQLCliente: TIBUpdateSQL;
    qryProdPesq: TIBQuery;
    qryCliPesq: TIBQuery;
    qryProdPesqID_PRODUTO: TIntegerField;
    qryProdPesqDESCRICAO: TIBStringField;
    qryProdPesqMARCA: TIBStringField;
    qryProdPesqPRECO: TIBBCDField;
    qryCliPesqID_CLIENTE: TIntegerField;
    qryCliPesqNOME_FANTASIA: TIBStringField;
    qryCliPesqRAZAO_SOCIAL: TIBStringField;
    qryCliPesqCNPJ: TIBStringField;
    qryCliPesqTELEFONE: TIBStringField;
    qryCliPesqLOGRADOURO: TIBStringField;
    qryCliPesqNUMERO_END: TIBStringField;
    qryCliPesqBAIRRO: TIBStringField;
    qryCliPesqCIDADE: TIBStringField;
    qryCliPesqUF: TIBStringField;
    qryCliPesqCOMPLEMENTO_END: TIBStringField;
    qryItensPedidosID_PEDIDO: TIntegerField;
    qryItensPedidosID_ITENS_PEDIDO: TIntegerField;
    qryItensPedidosID_PRODUTO: TIntegerField;
    qryItensPedidosDESCRICAO: TIBStringField;
    qryItensPedidosMARCA: TIBStringField;
    qryItensPedidosQUANTIDADE: TIBBCDField;
    qryItensPedidosVALOR_TOTAL: TIBBCDField;
    qryItensPedidosVALOR_UNITARIO: TIBBCDField;
    qryRelatorio: TIBQuery;
    qryRelatorioQUANTIDADE_VENDIDA: TIBBCDField;
    qryRelatorioID_PRODUTO: TIntegerField;
    qryRelatorioDESCRICAO: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmVendas: TDmVendas;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDmVendas.DataModuleCreate(Sender: TObject);
var
  vName : String;
begin

  try
    IBConectVendas.Connected := False;
    vName := ExtractFilePath(Application.ExeName) + '..\..\DB\VENDAS_DB.FDB';
    IBConectVendas.DatabaseName := vName;
    IBConectVendas.Connected := true;
  Except
    on E: Exception do
      ShowMessage('Erro ao tentar abrir a c�nex�o: ' + E.Message )
  end;
end;

end.
