unit ealerta.controller.routers;

interface

uses
  Router4D;

type
  TRouterController = class
  public
    class procedure RegisterRouters;

  end;

implementation

{ TRouterController }

uses
  ealerta.view.pages.inicio,
  ealerta.view.pages.config,
  ealerta.view.pages.cadastro.base;

class procedure TRouterController.RegisterRouters;
begin
  TRouter4D.Switch.Router('In�cio', TPageInicio);
  TRouter4D.Switch.Router('Configura��es', TPageConfig);
  TRouter4D.Switch.Router('Cadastro base', TPageCadastroBase);
end;

initialization

TRouterController.RegisterRouters;

end.
