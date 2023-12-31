unit uPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  UdmVendas, uUtil;

type
  TFrmPesquisa = class(TForm)
    dsPesquisa: TDataSource;
    qryPesquisa: TIBQuery;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    rgFiltro: TRadioGroup;
    BitBtn1: TBitBtn;
    edtValor: TEdit;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    TipoPesquisa : String;
    procedure PesquisaCliente;
    procedure PesquisaProduto;
    procedure PesquisaPedido;
    procedure Carregacliente;
    procedure CarregaProduto;
    procedure CarregaPedido;
    procedure CarregaclientePedido;
    procedure CarregaProdutoPedido;
  public
    { Public declarations }
    constructor Create(AOwner : TComponent; pTipoPesq :string);
  end;

var
  FrmPesquisa: TFrmPesquisa;

implementation

{$R *.dfm}

procedure TFrmPesquisa.BitBtn1Click(Sender: TObject);
begin
  if edtValor.Text = '' then
  begin
    ShowMessage('Informe o valor campo de pesquisa.');
    edtValor.SetFocus;
    exit;
  end;
  if (UpperCase(TipoPesquisa) = 'PRODUTO') or
    (UpperCase(TipoPesquisa) = 'PRODUTO_PEDIDO') then
    PesquisaProduto
  else
   if (UpperCase(TipoPesquisa) = 'PEDIDO') then
    PesquisaPedido
  else
    PesquisaCliente;


end;

procedure TFrmPesquisa.BitBtn2Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPesquisa.BitBtn4Click(Sender: TObject);
begin
  if UpperCase(TipoPesquisa) = 'PRODUTO'  then
    CarregaProduto
  else
  if UpperCase(TipoPesquisa) = 'PRODUTO_PEDIDO'  then
    CarregaProdutoPedido
  else
  if UpperCase(TipoPesquisa) = 'CLIENTE'  then
    Carregacliente
  else
  if UpperCase(TipoPesquisa) = 'CLIENTE_PEDIDO'  then
    CarregaclientePedido
  else
  if UpperCase(TipoPesquisa) = 'PEDIDO'  then
    CarregaPedido;
end;

procedure TFrmPesquisa.CarregaPedido;
var
  pedidos : String;
begin
  qryPesquisa.First;
  while not qryPesquisa.Eof do
  begin
    if pedidos <> '' then
      pedidos := pedidos + ',';

    pedidos := pedidos + qryPesquisa.FieldByName('ID_PEDIDO').AsString;
    qryPesquisa.Next;
  end;
  DmVendas.qryPedidos.Close;
  DmVendas.qryPedidos.sql.Text := 'select * FROM Pedido where id_pedido in ('+ pedidos+')';
  DmVendas.qryPedidos.Open;
  close;

end;

procedure TFrmPesquisa.CarregaProduto;
begin
  DmVendas.qryProduto.Close;
  DmVendas.qryProduto.SQL.Text := 'Select * from produto where id_produto = '+ qryPesquisa.FieldByName('ID_PRODUTO').AsString;
  DmVendas.qryProduto.Open;
  close;
end;

procedure TFrmPesquisa.CarregaProdutoPedido;
begin
  DmVendas.qryProdPesq.Close;
  DmVendas.qryProdPesq.SQL.Text := 'Select * from produto where id_produto = '+ qryPesquisa.FieldByName('ID_PRODUTO').AsString;
  DmVendas.qryProdPesq.Open;
  close;
end;

procedure TFrmPesquisa.Carregacliente;
begin
  DmVendas.qryCliente.Close;
  DmVendas.qryCliente.SQL.Text := 'Select * from clientes where id_cliente = '+ qryPesquisa.FieldByName('ID_CLIENTE').AsString;
  DmVendas.qryCliente.Open;
  close;
end;

procedure TFrmPesquisa.CarregaclientePedido;
begin
  DmVendas.qryCliPesq.Close;
  DmVendas.qryCliPesq.SQL.Text := 'Select * from clientes where id_cliente = '+ qryPesquisa.FieldByName('ID_CLIENTE').AsString;
  DmVendas.qryCliPesq.Open;
  close;
end;

constructor TFrmPesquisa.Create(AOwner: TComponent; pTipoPesq: string);
begin
   inherited Create(AOwner);
   TipoPesquisa := pTipoPesq;
end;

procedure TFrmPesquisa.FormShow(Sender: TObject);
begin
  if (UpperCase(TipoPesquisa) = 'PEDIDO')  then
  begin
    rgFiltro.Items.Clear;
    rgFiltro.Items.Add('C�digo');
    rgFiltro.Items.Add('Cliente');
    rgFiltro.ItemIndex := 0;
    Self.Caption := 'Pesquisa de Pedidos' ;
  end
  else
  if (UpperCase(TipoPesquisa) = 'PRODUTO') or
    (UpperCase(TipoPesquisa) = 'PRODUTO_PEDIDO') then
  begin
    rgFiltro.Items.Clear;
    rgFiltro.Items.Add('C�digo');
    rgFiltro.Items.Add('Descri��o');
    rgFiltro.Items.Add('Marca');
    rgFiltro.ItemIndex := 0;
    Self.Caption := 'Pesquisa de Produtos' ;
  end
  else
  begin
    rgFiltro.Items.Clear;
    rgFiltro.Items.Add('C�digo');
    rgFiltro.Items.Add('Nome_Fantasia');
    rgFiltro.Items.Add('CNPJ');
    rgFiltro.ItemIndex := 0;
    Self.Caption := 'Pesquisa de Clientes' ;
  end;

end;

procedure TFrmPesquisa.PesquisaCliente;
begin

  case rgFiltro.ItemIndex of
    0:
    Begin
      //pesquisa por codigo
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from clientes where id_cliente = '+ edtValor.text;
      qryPesquisa.Open;
    End;
    1:
    Begin
       //pesquisa por Nome
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from clientes where Nome_Fantasia like '+ QuotedStr('%'+edtValor.text+'%');
      qryPesquisa.Open;

    End;
    2:
    Begin
       //pesquisa por CNPJ
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from clientes where CNPJ = '+ QuotedStr(edtValor.text);
      qryPesquisa.Open;
    End;

   end;

end;

procedure TFrmPesquisa.PesquisaPedido;
begin
  case rgFiltro.ItemIndex of
    0:
    Begin
      //pesquisa por codigo
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from pedido where id_pedido = '+ edtValor.text;
      qryPesquisa.Open;
    End;
    1:
    Begin
       //pesquisa por descricao
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from pedido where id_cliente like '+edtValor.text;
      qryPesquisa.Open;

    End;

   end;

end;

procedure TFrmPesquisa.PesquisaProduto;
begin

  case rgFiltro.ItemIndex of
    0:
    Begin
      //pesquisa por codigo
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from produto where id_produto = '+ edtValor.text;
      qryPesquisa.Open;
    End;
    1:
    Begin
       //pesquisa por descricao
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from produto where descricao like '+ QuotedStr('%'+edtValor.text+'%');
      qryPesquisa.Open;

    End;
    2:
    Begin
       //pesquisa por marca
      qryPesquisa.Close;
      qryPesquisa.SQL.Text:= 'Select * from produto where marca like '+ QuotedStr('%'+edtValor.text+'%');
      qryPesquisa.Open;
    End;

   end;
end;

procedure TFrmPesquisa.rgFiltroClick(Sender: TObject);
begin
  edtValor.Text := '';
  if (UpperCase(TipoPesquisa) = 'PRODUTO') or (UpperCase(TipoPesquisa) = 'PRODUTO_PEDIDO') then
    edtValor.NumbersOnly := rgFiltro.ItemIndex = 0
  else
  if (UpperCase(TipoPesquisa) = 'PEDIDO') then
    edtValor.NumbersOnly := true
  else
    edtValor.NumbersOnly := rgFiltro.ItemIndex <> 1;

end;

end.
