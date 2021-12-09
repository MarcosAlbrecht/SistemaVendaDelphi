program EmploMVC;

uses
  Vcl.Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {FrmPrincipal},
  UfrmCadastrarCliente in 'view\UfrmCadastrarCliente.pas' {FrmCadastrarCliente},
  uClienteModel in 'model\uClienteModel.pas',
  uClienteController in 'controller\uClienteController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmCliente in 'dao\uDmCliente.pas' {DmCliente: TDataModule},
  uEstadoModel in 'model\uEstadoModel.pas',
  uDmEstado in 'dao\uDmEstado.pas' {DmEstado: TDataModule},
  uEstadoController in 'controller\uEstadoController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmEstado, DmEstado);
  Application.Run;
end.
