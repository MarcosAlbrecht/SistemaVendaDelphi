unit uEstadoModel;

interface

type
  TEstado = class
  private
    FID_ESTADO: Integer;
    FDESCRICAO: String;
    FUF: String;
  public
    property ID_ESTADO : Integer read FID_ESTADO write FID_ESTADO;
    property DESCRICAO : String read FDESCRICAO write FDESCRICAO;
    property UF        : String read FUF write FUF;

end;

implementation

end.
