unit uDmCliente;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uClienteModel;

type
  TDmCliente = class(TDataModule)
    sqlPesquisar: TFDQuery;
    sqlInserir: TFDQuery;
    sqlAlterar: TFDQuery;
    sqlExcluir: TFDQuery;
    sqlPesquisarID: TIntegerField;
    sqlPesquisarNOME: TStringField;
    sqlPesquisarTELEFONE: TStringField;
    dsPesquisar: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Pesquisar(sNome :String);
    procedure CarregarCliente(oCliente : TCliente; iCodigo : Integer);
    function Inserir(Ocliente: TCliente; out sErro: string): Boolean;
    function Alterar(oCliente: TCliente; out sErro: string): Boolean;
    function Excluir(iCodigo: Integer; out sErro: string): Boolean;
  end;

var
  DmCliente: TDmCliente;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uDmConexao;

{$R *.dfm}

{ TDmCliente }

function TDmCliente.Alterar(oCliente: TCliente; out sErro: string): Boolean;
begin
    with sqlAlterar, oCliente do
    begin
      Close;
      ParamByName('NOME').AsString       := Nome;
      ParamByName('TIPO').AsString       := Tipo;
      ParamByName('DOCUMENTO').AsString  := Documento;
      ParamByName('TELEFONE').AsString   := Telefone;
      ParamByName('ID').AsInteger        := ID;
      ParamByName('FK_ESTADO').AsInteger := FK_Estado;
      try
        ExecSQL;
        Result := True;
      except on E: Exception do
        begin
          sErro := 'Ocorreu um erro ao editar o cliente: '+sLineBreak + e.Message;
          Result := False;
        end;
      end;
    end;
end;

procedure TDmCliente.CarregarCliente(oCliente: TCliente; iCodigo: Integer);
var
 sqlCliente : TFDQuery;
begin
  sqlCliente := TFDQuery.Create(nil);

  try

    with sqlCliente do
    begin
      Connection := DmConexao.FDConnection1;
      SQL.Text := 'select * from cliente where (id = '+ IntToStr(iCodigo)+')';
      Open;
      with oCliente do
      begin
        ID := FieldByName('ID').AsInteger;
        Nome := FieldByName('NOME').AsString;
        Tipo := FieldByName('TIPO').AsString;
        Documento := FieldByName('DOCUMENTO').AsString;
        Telefone := FieldByName('TELEFONE').AsString;
        FK_Estado := FieldByName('FK_ESTADO').AsInteger;
      end;
    end;

  finally
    FreeAndNil(sqlCliente);
  end;
end;

function TDmCliente.Excluir(iCodigo: Integer; out sErro: string): Boolean;
begin
  with sqlExcluir do
  begin
    close;
    ParamByName('ID').AsInteger := iCodigo;
    try
      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir o cliente: '+sLineBreak + e.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDmCliente.Inserir(oCliente: TCliente; out sErro: string): Boolean;
begin
  with sqlInserir, Ocliente do
  begin
    close;
    ParamByName('NOME').AsString       := Nome;
    ParamByName('TIPO').AsString       := Tipo;
    ParamByName('DOCUMENTO').AsString  := Documento;
    ParamByName('TELEFONE').AsString   := Telefone;
    ParamByName('FK_ESTADO').AsInteger := FK_Estado;
    try
      ExecSQL;
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir o cliente: '+sLineBreak + e.Message;
        Result := False;
      end;
    end;

   end;
end;

procedure TDmCliente.Pesquisar(sNome: String);
begin
  if sqlPesquisar.Active then
    sqlPesquisar.Close;

  sqlPesquisar.ParamByName('NOME').AsString := '%' + sNome + '%';
  sqlPesquisar.Open;

end;

end.


