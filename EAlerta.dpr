program EAlerta;

{$R *.dres}


uses
  Vcl.Forms,
  ealerta.view.default in 'src\view\default\ealerta.view.default.pas' {FormDefault},
  ealerta.helpers.forms in 'src\helpers\ealerta.helpers.forms.pas',
  ealerta.helpers.ini in 'src\helpers\ealerta.helpers.ini.pas',
  ealerta.helpers.ui in 'src\helpers\ealerta.helpers.ui.pas',
  ealerta.consts.ui in 'src\consts\ealerta.consts.ui.pas',
  ealerta.helpers.exe in 'src\helpers\ealerta.helpers.exe.pas',
  ealerta.helpers.registry in 'src\helpers\ealerta.helpers.registry.pas',
  ealerta.view.main in 'src\view\main\ealerta.view.main.pas' {FormMain},
  ealerta.helpers.files in 'src\helpers\ealerta.helpers.files.pas',
  ealerta.helpers.styles in 'src\helpers\ealerta.helpers.styles.pas',
  ealerta.controller.routers in 'src\controllers\ealerta.controller.routers.pas',
  ealerta.view.pages.base in 'src\view\pages\ealerta.view.pages.base.pas' {PageBase},
  ealerta.view.pages.inicio in 'src\view\pages\ealerta.view.pages.inicio.pas' {PageInicio},
  ealerta.view.pages.config in 'src\view\pages\ealerta.view.pages.config.pas' {PageConfig},
  ealerta.view.dialog in 'src\view\dialog\ealerta.view.dialog.pas' {FormDialog},
  ealerta.helpers.dialogs in 'src\helpers\ealerta.helpers.dialogs.pas',
  ealerta.handlers.exception in 'src\handlers\ealerta.handlers.exception.pas',
  Vcl.Themes,
  Vcl.Styles,
  ealerta.helpers.logs in 'src\helpers\ealerta.helpers.logs.pas',
  ealerta.providers.api.catapush in 'src\providers\ealerta.providers.api.catapush.pas',
  ealerta.view.pages.cadastro.base in 'src\view\pages\ealerta.view.pages.cadastro.base.pas' {PageCadastroBase};

{$R *.res}


begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.MainFormOnTaskbar := true;
  Application.Title := 'EAlerta';
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;

end.
