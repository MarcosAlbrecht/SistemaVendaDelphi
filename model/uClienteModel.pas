unit uClienteModel;

interface
uses
  System.SysUtils;

type
  TCliente = class
  private
    FDocumento: String;
    FID: Integer;
    FNome: String;
    FTipo: String;
    FTelefone: String;
    FFK_ESTADO: Integer;
    procedure SetNome(const Value: String);
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    property ID : Integer read FID write FID;
    property Nome : String read FNome write SetNome;
    property Tipo : String read FTipo write FTipo;
    property Documento : String read FDocumento write FDocumento;
    property Telefone : String read FTelefone write FTelefone;
    property FK_Estado : Integer read FFK_ESTADO write FFK_ESTADO;

  published
    { published declarations }
  end;

implementation

{ TCliente }

procedure TCliente.SetNome(const Value: String);
begin
  if Value = EmptyStr then
    raise EArgumentException.Create('''Nome'' precisa ser preenchido');
  FNome := Value;
end;

end.
