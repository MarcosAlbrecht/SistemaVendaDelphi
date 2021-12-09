unit uEstadoController;

interface

uses uEstadoModel, uDmEstado;

type
  TEstadoController = class
  private
    { private declarations }
  protected
    { protected declarations }
  public
    { public declarations }
    constructor Create;
    destructor Destroy; override;
    procedure CarregarEstados;

  published
    { published declarations }
  end;

implementation

{ TEstadoController }

procedure TEstadoController.CarregarEstados;
begin
  DmEstado.CarregarEstados;
end;

constructor TEstadoController.Create;
begin
//
end;

destructor TEstadoController.Destroy;
begin
  //
  inherited;
end;

end.
