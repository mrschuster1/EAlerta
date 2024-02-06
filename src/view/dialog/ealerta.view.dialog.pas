unit ealerta.view.dialog;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  StrUtils,
  Vcl.Dialogs,
  Clipbrd,
  ealerta.view.default,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  ealerta.helpers.Dialogs;

type
  TFormDialog = class(TFormDefault)
    lblTitle: TLabel;
    lblBody: TLabel;
    pnlBottom: TPanel;
    btnPrimary: TButton;
    btnSecondary: TButton;
    pnlInput: TPanel;
    edtInput: TEdit;
    btnSenha: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure btnSecondaryClick(Sender: TObject);
    procedure btnPrimaryClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSenhaMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSenhaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    FPrimario, FSecundario: string;
    FTipoMensagem: TTipoMensagem;
    procedure CopiarErro;

  public
    TextInput: string;
    constructor Create(Titulo, Mensagem, Primario, Secundario: string;
      TipoMensagem: TTipoMensagem; TipoInput: TTipoInput);
      reintroduce;

  end;

var
  FormDialog: TFormDialog;

implementation

{$R *.dfm}

{ TFormDialog }

procedure TFormDialog.btnPrimaryClick(Sender: TObject);
begin
  inherited;
  TextInput := edtInput.Text;
  ModalResult := mrOk
end;

procedure TFormDialog.btnSecondaryClick(Sender: TObject);
begin
  inherited;
  if FTipoMensagem = tmErro then
    CopiarErro
  else
    ModalResult := mrCancel
end;

procedure TFormDialog.btnSenhaMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  edtInput.PasswordChar := #0
end;

procedure TFormDialog.btnSenhaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  edtInput.PasswordChar := #9679
end;

procedure TFormDialog.CopiarErro;
begin
  Clipboard.AsText := lblBody.Caption
end;

constructor TFormDialog.Create(Titulo, Mensagem, Primario, Secundario: string;
  TipoMensagem: TTipoMensagem; TipoInput: TTipoInput);
begin
  inherited Create(Nil);
  FPrimario := Primario;
  FSecundario := Secundario;
  FTipoMensagem := TipoMensagem;

  lblTitle.Caption := Titulo;
  lblBody.Caption := Mensagem;

  if Primario <> '' then
    btnPrimary.Caption := '&' + Primario;

  if Secundario <> '' then
    btnSecondary.Caption := '&' + Secundario;

  btnSecondary.Visible := (Secundario <> '') and
    (TipoMensagem in [tmQuestao, tmErro, tmInput]);

  if TipoMensagem = tmErro then
  begin
    FSecundario := 'Copiar mensagem';
    btnSecondary.Caption := '&Copiar mensagem';
  end;

  pnlInput.Visible := TipoMensagem = tmInput;

  if TipoInput = itSenha then
  begin
    btnSenha.Visible := true;
    edtInput.PasswordChar := #9679;
  end;

  if (lblBody.Caption = '') and not(pnlInput.Visible) then
  begin
    Self.Height := 200;
    lblBody.Hide
  end;

  lblBody.Top := 0;
  lblTitle.Top := 0;
end;

procedure TFormDialog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (not edtInput.Focused) and (CharInSet(Char(Key), ['A' .. 'Z'])) then
  begin
    if (FPrimario <> '') and (Char(Key) = LeftStr(FPrimario, 1)[1]) then
      btnPrimaryClick(nil);
    if (FSecundario <> '') and (Char(Key) = LeftStr(FSecundario, 1)[1]) then
      btnSecondaryClick(nil)
  end;
end;

procedure TFormDialog.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(ActiveControl, true, true);
  end;
end;

procedure TFormDialog.FormShow(Sender: TObject);
begin
  inherited;
  if pnlInput.Visible then
    edtInput.SetFocus
end;

end.
