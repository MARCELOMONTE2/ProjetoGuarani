unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDmVendas, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  uPesquisa;

type
  TfrmCadCliente = class(TForm)
    Label1: TLabel;
    dsCliente: TDataSource;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    edtNome: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    brnSair: TBitBtn;
    btnPesquisar: TBitBtn;
    btnSalvar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure brnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}


procedure TfrmCadCliente.btnPesquisarClick(Sender: TObject);
begin
  try
    FrmPesquisa := TFrmPesquisa.Create(self,'CLIENTE');
    FrmPesquisa.ShowModal;

  finally
    FrmPesquisa.Free;
  end;


end;

procedure TfrmCadCliente.brnSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  if not DmVendas.qryCliente.Active then
    DmVendas.qryCliente.open;

  DmVendas.qryCliente.Edit;
end;

procedure TfrmCadCliente.btnExcluirClick(Sender: TObject);
var
  msg: String;

begin
  msg :=  'Deseja excluir o cliente: '+ dmvendas.qryCliente.fieldByName('NOME_FANTASIA').asstring+ '?' ;

  If  MessageDlg(msg,mtConfirmation,[mbyes,mbno],0)=mryes then
  begin
    if not DmVendas.qryCliente.Active then
      DmVendas.qryCliente.open;
    try
      DmVendas.qryCliente.delete;
      DmVendas.IBTransaction1.Commit;
      ShowMessage('Cliente exclu�do com sucesso.');
      DmVendas.qryCliente.open;

     Except
    on E: Exception do
      ShowMessage('Erro ao tentar excluir o cliente: ' + E.Message );
    end;
  end;

end;

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  if not DmVendas.qryCliente.Active then
    DmVendas.qryCliente.open;
  DmVendas.qryCliente.Append;
  edtNome.SetFocus;

end;

procedure TfrmCadCliente.btnSalvarClick(Sender: TObject);
begin
  if DmVendas.qryCliente.State in [dsInsert,dsedit] then
  begin
    try
      DmVendas.qryCliente.Post;
      DmVendas.IBTransaction1.Commit;
      ShowMessage('As informa��es foram gravadas com sucesso.');
      DmVendas.qryCliente.open;

    Except
    on E: Exception do
      ShowMessage('Erro ao tentar salvar os dados do cliente: ' + E.Message );
    end;

  end;

end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmVendas.qryCliente.Close;
  Action := cafree;
  Release;
  frmCadCliente := nil;
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  dsCliente.DataSet.open;
end;

end.
