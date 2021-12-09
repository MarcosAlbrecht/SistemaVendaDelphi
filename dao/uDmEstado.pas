unit uDmEstado;

interface

uses
  System.SysUtils, System.Classes, uDmConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, uEstadoModel;

type
  TDmEstado = class(TDataModule)
    sqlPesquisar: TFDQuery;
    DataSource1: TDataSource;
    sqlPesquisarID_ESTADO: TIntegerField;
    sqlPesquisarDESCRICAO: TStringField;
    sqlPesquisarUF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarEstado(sEstado: String);
    procedure CarregarEstados;
  end;

var
  DmEstado: TDmEstado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule1 }

procedure TDmEstado.CarregarEstados;
begin
  if sqlPesquisar.Active then
    sqlPesquisar.Close;

    sqlPesquisar.Open;

//  with oEstado do
//  begin
//    ID_ESTADO := sqlPesquisarID_ESTADO.AsInteger;
//    DESCRICAO := sqlPesquisarDESCRICAO.AsString;
//    UF        := sqlPesquisarUF.AsString;
//  end;

end;

procedure TDmEstado.PesquisarEstado(sEstado: String);
begin

end;

end.
