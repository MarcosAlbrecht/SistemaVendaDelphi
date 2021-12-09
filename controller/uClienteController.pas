unit uClienteController;

interface
uses
  uClienteModel, uDmCliente, System.SysUtils;

type
  TClienteController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure Pesquisar(sNome: String);
    procedure CarregarCliente(oCliente : TCliente; iCodigo : Integer);
    function Inserir(oCliente: TCliente; var sErro : String): Boolean;
    function Alterar(oCliente: TCliente; var sErro : String): Boolean;
    function Excluir(iCodigo : Integer; var sErro : String): Boolean;
  published
    { published declarations }
  end;
implementation

{ TClienteController }

function TClienteController.Alterar(oCliente: TCliente;
  var sErro: String): Boolean;
begin
  Result := DmCliente.Alterar(oCliente, sErro);
end;

procedure TClienteController.CarregarCliente(oCliente: TCliente;
  iCodigo: Integer);
begin
  DmCliente.CarregarCliente(oCliente, iCodigo);
end;

constructor TClienteController.Create;
begin
  //DmCliente := TDmCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  //FreeAndNil(DmCliente);
  inherited;
end;

function TClienteController.Excluir(iCodigo: Integer;
  var sErro: String): Boolean;
begin
  Result := DmCliente.Excluir(iCodigo, sErro);
end;

function TClienteController.Inserir(oCliente: TCliente;
  var sErro: String): Boolean;
begin
  Result := DmCliente.Inserir(oCliente, sErro);
end;

procedure TClienteController.Pesquisar(sNome: String);
begin
  DmCliente.Pesquisar(sNome);
end;

end.
