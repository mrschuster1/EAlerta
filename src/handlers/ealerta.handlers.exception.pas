unit ealerta.handlers.exception;

interface

uses
  System.SysUtils;

type
  TException = class
  private

  public
    class procedure DoHandlerException(Sender: TObject; E: exception);

  end;

implementation

uses
  Vcl.Dialogs,
  Quick.Logger,
  System.UITypes,
  Forms,
  ealerta.helpers.Dialogs;

class procedure TException.DoHandlerException(Sender: TObject;
  E: exception);
begin
  TDialog.ShowDialog(tmErro, 'Erro', E.Message);
end;

initialization

Application.OnException := TException.DoHandlerException

end.
