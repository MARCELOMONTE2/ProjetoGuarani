unit uGeraRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frxClass, frxExportBaseDialog,
  frxExportPDF, frxDBSet, frCoreClasses, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, udmVendas, Vcl.ComCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids;

type
  TfrmGeraRelatorio = class(TForm)
    frxReport1: TfrxReport;
    frxDadosRel: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    edtDataIni: TDateTimePicker;
    Label3: TLabel;
    Label1: TLabel;
    edtDataFim: TDateTimePicker;
    btnGeraRel: TBitBtn;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    btnImprimir: TBitBtn;
    procedure btnGeraRelClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGeraRelatorio: TfrmGeraRelatorio;

implementation

{$R *.dfm}

procedure TfrmGeraRelatorio.btnImprimirClick(Sender: TObject);
begin
  frxReport1.ShowReport();

end;

procedure TfrmGeraRelatorio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  release;
  frmGeraRelatorio := nil;
end;

procedure TfrmGeraRelatorio.FormCreate(Sender: TObject);
begin
   btnImprimir.Enabled := false;

end;

procedure TfrmGeraRelatorio.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TfrmGeraRelatorio.btnGeraRelClick(Sender: TObject);
begin
  try
    DmVendas.qryRelatorio.close;
    DmVendas.qryRelatorio.SQL.Text := 'select first 2 '+
      ' sum(i.quantidade) Quantidade_Vendida, i.id_produto Id_produto, pd.descricao  '+
      ' from itens_pedido i '+
      'join produto pd on pd.id_produto= i.id_produto '+
      'join pedido p on p.id_pedido = i.id_pedido  '+
      'where p.data_pedido between  :DTINI  and :DTFIM '+
      'group by i.id_produto,pd.descricao  '+
      'order by 1 desc ';
    DmVendas.qryRelatorio.ParamByName('DTINI').AsDate := edtDataIni.Date;
    DmVendas.qryRelatorio.ParamByName('DTFIM').AsDatetime := edtDataFim.Datetime;
    DmVendas.qryRelatorio.Open;
    btnImprimir.Enabled := DmVendas.qryRelatorio.RecordCount > 0;

  Except
    on E: Exception do
      ShowMessage('Erro ao tentar gerar o relatório ' + E.Message );

  end;


end;

end.
