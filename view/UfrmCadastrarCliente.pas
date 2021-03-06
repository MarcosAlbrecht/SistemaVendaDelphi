unit UfrmCadastrarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, uClienteController, uClienteModel, uDmCliente,
  uEstadoController, uEstadoModel, uDmEstado;

type
  TOperacao = (opNovo, opAlterar, opNavegar);
  TFrmCadastrarCliente = class(TForm)
    pnlRodape: TPanel;
    btnFechar: TButton;
    pgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    pnlFiltro: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnlBtnsPesq: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    dsPesq: TDataSource;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    cbxTipo: TComboBox;
    edtDocumento: TLabeledEdit;
    edtTelefone: TLabeledEdit;
    Label1: TLabel;
    pnlBtnsCad: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    cbxEstado: TComboBox;
    Estado: TLabel;
    DsEstados: TDataSource;
    ComboBox1: TComboBox;
    Label2: TLabel;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FOperacao : TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracoes;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    Procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);
    procedure LimparCampos;
    procedure CarregarEstados;
  public
    { Public declarations }

  end;

var
  FrmCadastrarCliente: TFrmCadastrarCliente;

implementation

{$R *.dfm}

procedure TFrmCadastrarCliente.Alterar;
var
  oCliente : TCliente;
  oClienteController : TClienteController;
  sErro: String;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
    with oCliente do
    begin
      ID := StrToIntDef(edtCodigo.Text, 0);
      Nome := edtNome.Text;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else
      if cbxTipo.ItemIndex = 1 then
        Tipo := 'J'
      else
        Tipo := EmptyStr;
      Documento := edtDocumento.Text;
      Telefone := edtTelefone.Text;
      FK_Estado := Integer(cbxEstado.Items.Objects[cbxEstado.ItemIndex]);
    end; 
    if oClienteController.Alterar(oCliente, sErro) = False then
      raise Exception.Create(sErro);
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;
end;

procedure TFrmCadastrarCliente.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TFrmCadastrarCliente.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastrarCliente.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmCadastrarCliente.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFrmCadastrarCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastrarCliente.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TFrmCadastrarCliente.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TFrmCadastrarCliente.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
  CarregarEstados;
  LimparCampos;
end;

procedure TFrmCadastrarCliente.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;  
end;

procedure TFrmCadastrarCliente.CarregarCliente;
var
  oCliente : TCliente;
  oClienteController : TClienteController;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
    oClienteController.CarregarCliente(oCliente, dsPesq.DataSet.FieldByName('ID').AsInteger);
    with oCliente do
    begin
      edtCodigo.Text    := IntToStr(ID);
      edtNome.Text      := Nome;
      if Tipo = 'F' then
        cbxTipo.ItemIndex := 0
      else
      if Tipo = 'J' then
        cbxTipo.ItemIndex := 1
      else
        cbxTipo.ItemIndex := -1;
      edtDocumento.Text := Documento;
      edtTelefone.Text  := Telefone;
      if FK_Estado <= 0 then
        cbxEstado.ItemIndex := -1
      else
        cbxEstado.ItemIndex := FK_Estado-1;
    end;
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;
end;

procedure TFrmCadastrarCliente.CarregarEstados;
var
  oEstadoController : TEstadoController;

begin
  oEstadoController := TEstadoController.Create;
  cbxEstado.Items.Clear;
  try
    oEstadoController.CarregarEstados;
    DsEstados.DataSet.RecordCount;
    while not DsEstados.DataSet.Eof do
    begin
      cbxEstado.Items.AddObject(DsEstados.DataSet.FieldByName('DESCRICAO').AsString,
      TObject(DsEstados.DataSet.FieldByName('ID_ESTADO').AsInteger) );
      cbxEstado.ItemIndex := cbxEstado.Items.IndexOfObject(TObject(DsEstados.DataSet.FieldByName('ID_ESTADO').AsInteger));
      DsEstados.DataSet.Next;
    end;

  finally
    FreeAndNil(oEstadoController);

  end;
end;

procedure TFrmCadastrarCliente.Configuracoes;
begin
  tbPesq.TabVisible := False;
  tbDados.TabVisible := False;
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TFrmCadastrarCliente.DBGrid1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TFrmCadastrarCliente.Detalhar;
begin
  CarregarEstados;
  CarregarCliente;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;

end;

procedure TFrmCadastrarCliente.Excluir;
var
  oClienteController : TClienteController;
  sErro: String;
begin
  if (DmCliente.sqlExcluir.Active) and (DmCliente.sqlPesquisar.RecordCount > 0) then
  begin
    if MessageDlg('Deseja realmente excluir este cliente', mtConfirmation, [mbYes, mbNo], 0) = ID_YES then
    begin
      if oClienteController.Excluir(DmCliente.sqlPesquisarID.AsInteger, sErro) = False then
        raise Exception.Create(sErro);
      oClienteController.Pesquisar(edtPesquisar.Text);
    end;  
  end
  else
    raise Exception.Create('N?o h? registro para ser exclu?do');
end;

procedure TFrmCadastrarCliente.FormCreate(Sender: TObject);
begin
  DmCliente := TDmCliente.Create(nil);
end;

procedure TFrmCadastrarCliente.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmCliente);
end;

procedure TFrmCadastrarCliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0)
  end;
end;

procedure TFrmCadastrarCliente.FormShow(Sender: TObject);
begin
  Configuracoes;
end;

procedure TFrmCadastrarCliente.Gravar;
var
  oClienteController : TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    oClienteController.Pesquisar(edtPesquisar.Text);
  finally
    FreeAndNil(oClienteController);
  end; 
end;

procedure TFrmCadastrarCliente.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo, opAlterar:
    begin 
      edtNome.Enabled := True;
      edtDocumento.Enabled := True;
      cbxTipo.Enabled := True;
      edtTelefone.Enabled := True;
      cbxEstado.Enabled := True;
      btnListar.Enabled := False;
      btnFechar.Enabled := False;
      btnAlterar.Enabled := False;
      btnGravar.Enabled := True;
      btnCancelar.Enabled := True;
    end;
  
    opNavegar: 
    begin
      edtNome.Enabled := False;
      edtDocumento.Enabled := False;
      cbxTipo.Enabled := False;
      edtTelefone.Enabled := False;
      cbxEstado.Enabled := False;
      btnListar.Enabled := True;
      btnFechar.Enabled := True;
      btnAlterar.Enabled := True;
      btnGravar.Enabled := False;
      btnCancelar.Enabled := False;
    end;
  end;
end;

procedure TFrmCadastrarCliente.Inserir;
var
  oCliente : TCliente;
  oClienteController : TClienteController;
  sErro: String;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
    with oCliente do
    begin
      Nome := edtNome.Text;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else
      if cbxTipo.ItemIndex = 1 then
        Tipo := 'J'
      else
        Tipo := EmptyStr;
      Documento := edtDocumento.Text;
      Telefone  := edtTelefone.Text;
      FK_Estado := Integer(cbxEstado.Items.Objects[cbxEstado.ItemIndex]);
    end;
    if oClienteController.Inserir(oCliente, sErro) = False then
      raise Exception.Create(sErro);
    
  finally
    FreeAndNil(oClienteController);
    FreeAndNil(oCliente);
  end;
  
end;

procedure TFrmCadastrarCliente.LimparCampos;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtDocumento.Clear;
  edtTelefone.Clear;
  cbxTipo.ItemIndex := -1;
  cbxEstado.ItemIndex := -1;
end;

procedure TFrmCadastrarCliente.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TFrmCadastrarCliente.Novo;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TFrmCadastrarCliente.Pesquisar;
var oClienteController: TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    oClienteController.Pesquisar(edtPesquisar.Text);
  finally
    FreeAndNil(oClienteController);
  end;
end;

end.
