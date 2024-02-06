unit ealerta.helpers.dialogs;

interface

uses
  Controls;

type
  TTipoMensagem = (tmAviso, tmErro, tmQuestao, tmInput);

type
  TTipoInput = (itNormal, itSenha);

type
  TRetornoDialog = record
    Modal: TModalResult;
    Bool: Boolean;
    Input: string;
  end;

type
  TDialog = class
  public
    class function ShowDialog(TipoMensagem: TTipoMensagem;
      Titulo: string; const Mensagem: string = ''; const Primario: string = 'Ok';
      Secundario: string = ''; TipoInput: TTipoInput = itNormal)
      : TRetornoDialog;
  end;

implementation

{ TDialog }

uses
  ealerta.view.dialog;

class function TDialog.ShowDialog(TipoMensagem: TTipoMensagem;
      Titulo: string; const Mensagem: string = ''; const Primario: string = 'Ok';
      Secundario: string = ''; TipoInput: TTipoInput = itNormal)
      : TRetornoDialog;
begin
  var
  LFormDialog := TFormDialog.Create(Titulo, Mensagem, Primario, Secundario,
    TipoMensagem, TipoInput);
  try
    result.Bool := LFormDialog.ShowModal = mrOk;
    result.Modal := LFormDialog.ModalResult;
    result.Input := LFormDialog.TextInput;
  finally
    LFormDialog.Free;
  end;
end;

end.
