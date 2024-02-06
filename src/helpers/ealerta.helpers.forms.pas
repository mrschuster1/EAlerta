unit ealerta.helpers.forms;

interface

uses
  Vcl.forms,
  System.SysUtils,
  Vcl.Controls;

/// <summary>
/// Classe auxiliar para manipula��o de formul�rios em aplica��es Delphi.
/// </summary>
/// <remarks>
/// Esta classe fornece m�todos �teis para criar formul�rios modais, exibir
/// formul�rios em modo de guias (MDI), mostrar e ocultar efeitos de desfoque
/// em formul�rios.
/// </remarks>
type
  TFormHelper = class
  public
    /// <summary>
    /// Cria um formul�rio modal e o exibe.
    /// </summary>
    /// <typeparam name="Form">
    /// Tipo de formul�rio a ser criado.
    /// </typeparam>
    /// <returns>
    /// Resultado do m�todo ShowModal do formul�rio criado.
    /// </returns>
    class function CreateModalForm<Form: TForm>: TModalResult;

    /// <summary>
    /// Cria um formul�rio em modo de guias (MDI) e o exibe.
    /// </summary>
    /// <typeparam name="FormClass">
    /// Tipo de formul�rio a ser criado.
    /// </typeparam>
    /// <param name="MDIParent">
    /// Formul�rio principal em modo de guias (MDI).
    /// </param>
    /// <param name="CheckIsOpened">
    /// Indica se deve verificar se o formul�rio j� est� aberto.
    /// </param>
    class procedure CreateTabForm<FormClass: TForm>(MDIParent: TForm;
      CheckIsOpened: Boolean);

  end;

implementation

{ TFormHelper }

uses
  ealerta.view.main;

class function TFormHelper.CreateModalForm<Form>: TModalResult;
var
  LForm: Form;
begin
  Application.CreateForm(Form, LForm);

  try
    if LForm.FormStyle = fsMDIChild then
      LForm.FormStyle := fsNormal
    else
      LForm.ShowModal;
    result := LForm.ModalResult;
  finally
    LForm.Free;
  end;
end;

class procedure TFormHelper.CreateTabForm<FormClass>(MDIParent: TForm;
  CheckIsOpened: Boolean);
begin

  var
  FormCount := 0;
  if CheckIsOpened then
  begin
    for VAR i := 0 to MDIParent.MDIChildCount - 1 do
      if (MDIParent.MDIChildren[i] is FormClass) then
      begin
        MDIParent.MDIChildren[i].BringToFront;
        Exit;
      end;
  end
  else
    for VAR i := 0 to MDIParent.MDIChildCount - 1 do
      if (MDIParent.MDIChildren[i] is FormClass) then
        Inc(FormCount);

  var
  LForm := FormClass.Create(Application);

  if FormCount > 0 then
    LForm.Caption := Format(LForm.Caption + ' (%s)', [FormCount.tostring]);
end;

end.
