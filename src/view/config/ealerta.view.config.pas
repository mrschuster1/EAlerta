unit ealerta.view.config;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  Math,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  ealerta.view.default,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  StrUtils,
  Vcl.Mask,
  Vcl.WinXCtrls,
  Themes,
  Vcl.ComCtrls;

type
  TFormConfig = class(TFormDefault)
    edtBancoFirebirdEco: TLabeledEdit;
    edtArquivoSom: TLabeledEdit;
    edtCelularCallmebot: TLabeledEdit;
    edtChaveApiCallmebot: TLabeledEdit;
    edtCelularCatapush: TLabeledEdit;
    switchNotificacoes: TToggleSwitch;
    lblExibirNotificacoes: TLabel;
    swtichCallmebot: TToggleSwitch;
    lblEnviarMensagemCallmebot: TLabel;
    lblReproduzirSom: TLabel;
    switchSom: TToggleSwitch;
    lblEnviarMensagemCatapush: TLabel;
    switchCatapush: TToggleSwitch;
    ScrollBox: TScrollBox;
    comboEstilo: TComboBox;
    lblEstilo: TLabel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    PageControl1: TPageControl;
    tabConexao: TTabSheet;
    TabSheet2: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure comboEstiloChange(Sender: TObject);
    procedure ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
  private
    FTemaAtual: string;

  public

  end;

var
  FormConfig: TFormConfig;

implementation

{$R *.dfm}


uses
  ealerta.helpers.files,
  ealerta.helpers.registry,
  ealerta.helpers.styles;

procedure TFormConfig.btnCancelarClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel  ;
  TStyleManager.TrySetStyle(FTemaAtual)
end;

procedure TFormConfig.btnSalvarClick(Sender: TObject);
begin
  inherited;
  TRegistryIni.SetValue('Aparencia', 'Tema',
    comboEstilo.Items[comboEstilo.ItemIndex]);
  ModalResult := mrOk
end;

procedure TFormConfig.comboEstiloChange(Sender: TObject);
begin
  inherited;
  var
  StylePath := Format('styles\%s.vsf',
    [comboEstilo.Items[comboEstilo.ItemIndex]]);

  TStyleHelper.LoadFromFile(StylePath);
end;

procedure TFormConfig.FormCreate(Sender: TObject);
begin
  inherited;
  FTemaAtual := TStyleManager.ActiveStyle.Name;
  TFileHelper.ListFilesInDirectory('styles', 'vsf', comboEstilo.Items);

  for var i := 0 to comboEstilo.Items.Count - 1 do
  begin
    comboEstilo.Items[i] := ReplaceStr(comboEstilo.Items[i], 'styles\', '');
    comboEstilo.Items[i] := ReplaceStr(comboEstilo.Items[i], '.vsf', '');
  end;

  var
  ThemeIndex := comboEstilo.Items.IndexOf
    (TRegistryIni.GetValue('Aparencia', 'Tema', 'Windows10'));

  if ThemeIndex <> -1 then
    comboEstilo.ItemIndex := ThemeIndex
end;

procedure TFormConfig.ScrollBoxMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
var
  ScrollBox: TScrollBox;
  NewPos: Integer;
begin
  inherited;
  ScrollBox := TScrollBox(Sender);

  NewPos := ScrollBox.VertScrollBar.Position - WheelDelta div 5; // sensitivity
  NewPos := Max(NewPos, 0);
  NewPos := Min(NewPos, ScrollBox.VertScrollBar.Range);

  ScrollBox.VertScrollBar.Position := NewPos;
  Handled := True;
end;

end.
