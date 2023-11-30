unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,uDmVendas, Vcl.StdCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,uPesquisa;

type
  TfrmCadProduto = class(TForm)
    dsProduto: TDataSource;
    Panel1: TPanel;
    btnNovo: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    Panel2: TPanel;
    Label1: TLabel;
    edtID: TDBEdit;
    Label2: TLabel;
    edtDesc: TDBEdit;
    Label3: TLabel;
    edtMarca: TDBEdit;
    Label4: TLabel;
    edtPreco: TDBEdit;
    btnPesquisar: TBitBtn;
    DBGrid1: TDBGrid;
    btnSalvar: TBitBtn;
    procedure BitBtn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
    Procedure ExcluirProduto;
    procedure SalvarDados;
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  if not DmVendas.qryProduto.Active then
    DmVendas.qryProduto.open;
  DmVendas.qryProduto.Append;
  edtDesc.SetFocus;

end;

procedure TfrmCadProduto.btnPesquisarClick(Sender: TObject);
begin
  try
    FrmPesquisa := TFrmPesquisa.Create(self,'PRODUTO');
    FrmPesquisa.ShowModal;

  finally
    FrmPesquisa.Free;
  end;

end;

procedure TfrmCadProduto.BitBtn2Click(Sender: TObject);
begin
  if not DmVendas.qryProduto.Active then
    DmVendas.qryProduto.open;

  DmVendas.qryProduto.Edit;

end;

procedure TfrmCadProduto.BitBtn3Click(Sender: TObject);
begin
  ExcluirProduto;
end;

procedure TfrmCadProduto.BitBtn5Click(Sender: TObject);
begin
  close;
end;

procedure TfrmCadProduto.btnSalvarClick(Sender: TObject);
begin
  if DmVendas.qryProduto.State in [dsInsert,dsedit] then
  begin
    SalvarDados;
  end;
end;

procedure TfrmCadProduto.ExcluirProduto;
begin
var
  msg: String;

begin
  msg :=  'Deseja excluir o Produto: '+ dmvendas.qryProduto.fieldByName('DESCRICAO').asstring+ '?' ;

  If  MessageDlg(msg,mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    if not DmVendas.qryProduto.Active then
      DmVendas.qryProduto.open;
    try
      DmVendas.qryProduto.delete;
      DmVendas.IBTransaction1.Commit;
      ShowMessage('Produto exclu�do com sucesso.');
      DmVendas.qryProduto.open;

     Except
    on E: Exception do
      ShowMessage('Erro ao tentar excluir o produto: ' + E.Message );
    end;
  end;
end;

end;

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmVendas.qryProduto.Close;
  action := cafree;
  Release;
  frmCadProduto := nil;
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  dsProduto.DataSet.Open;
end;

procedure TfrmCadProduto.SalvarDados;
begin
  try
    DmVendas.qryProduto.Post;
    DmVendas.IBTransaction1.Commit;
    ShowMessage('As informa��es foram gravadas com sucesso.');
    DmVendas.qryProduto.open;

  Except
  on E: Exception do
    ShowMessage('Erro ao tentar salvar os dados do produto: ' + E.Message );
  end;

end;

end.
