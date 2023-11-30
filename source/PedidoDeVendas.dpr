program PedidoDeVendas;

uses
  Vcl.Forms,
  uPrincipal in 'view\uPrincipal.pas' {frmPrincipal},
  uDmVendas in 'Data\uDmVendas.pas' {DmVendas: TDataModule},
  uCadCliente in 'view\uCadCliente.pas' {frmCadCliente},
  uCadProduto in 'view\uCadProduto.pas' {frmCadProduto},
  uPesquisa in 'view\uPesquisa.pas' {FrmPesquisa},
  uUtil in 'Controller\uUtil.pas',
  uPedidos in 'view\uPedidos.pas' {frmPedidos},
  uGeraRelatorio in 'view\uGeraRelatorio.pas' {frmGeraRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmVendas, DmVendas);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
