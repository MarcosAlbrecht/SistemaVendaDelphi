unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDmConexao,
  UfrmCadastrarCliente, System.ImageList, Vcl.ImgList, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    btnCliente: TButton;
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Clientes1: TMenuItem;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClienteClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirCliente;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.AbrirCliente;
begin
  FrmCadastrarCliente := TFrmCadastrarCliente.Create(nil);
  try
    FrmCadastrarCliente.ShowModal;
  finally
    FreeAndNil(FrmCadastrarCliente);
  end;
end;

procedure TFrmPrincipal.btnClienteClick(Sender: TObject);
begin
  AbrirCliente;
end;

procedure TFrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DmConexao.FDConnection1.Connected := False;
end;

end.
