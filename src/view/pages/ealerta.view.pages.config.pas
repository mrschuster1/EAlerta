unit ealerta.view.pages.config;

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
  Vcl.Dialogs,
  ealerta.view.pages.base,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  Vcl.ButtonGroup,
  Vcl.Mask,
  Themes,
  StrUtils,
  Vcl.WinXCtrls,
  Vcl.Buttons, VirtualTrees;

type
  TPageConfig = class(TPageBase)
    pgcConfig: TPageControl;
    tabNotificacoes: TTabSheet;
    GroupButtons: TButtonGroup;
    tabConexao: TTabSheet;
    OpenDialog: TFileOpenDialog;
    btnSalvar: TButton;
    Cancelar: TButton;
    FlowPanelGeral: TFlowPanel;
    pnlArquivoSom: TPanel;
    btnAbrirArquivoSom: TSpeedButton;
    lblArquivoSom: TLabel;
    edtArquivoSom: TEdit;
    FlowPanelConexao: TFlowPanel;
    pnlBancoEco: TPanel;
    btnBancoEco: TSpeedButton;
    lblBancoEco: TLabel;
    edtBancoEco: TEdit;
    pnlUsuarioFirebird: TPanel;
    lblUsuarioFirebird: TLabel;
    edtUsuarioFirebird: TEdit;
    pnlSenhaFirebird: TPanel;
    lblSenhaFirebird: TLabel;
    edtSenhaFirebird: TEdit;
    pnlDriverFirebird: TPanel;
    btnDriverFirebird: TSpeedButton;
    lblDriverFirebird: TLabel;
    edtDriverFirebird: TEdit;
    checkReproduzirSom: TCheckBox;
    checkExibirNotificacoes: TCheckBox;
    checkEnviarCatapush: TCheckBox;
    checkEnviarCallmebot: TCheckBox;
    tabAparencia: TTabSheet;
    FlowPanel1: TFlowPanel;
    comboEstilo: TComboBox;
    tabUsuarios: TTabSheet;
    pnlUsuarios: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure GroupButtonsButtonClicked(Sender: TObject; Index: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAbrirArquivoSomClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure btnBancoEcoClick(Sender: TObject);
    procedure btnDriverFirebirdClick(Sender: TObject);
    procedure comboEstiloChange(Sender: TObject);
  private
    FTemaAtual: string;
    function GetFileName(Filter, FilterName, Default: string;
      ShowAll: boolean = false): string;
    procedure HidePageControlTabs;
    procedure CarregarPreferencias;
    procedure SalvarPreferencias;
    procedure CarregarConfiguracoes;
    procedure SalvarConfiguracoes;
    procedure LinkTabsWithButtons;
    procedure CarregarEstilos;

  public
    { Public declarations }
  end;

var
  PageConfig: TPageConfig;

implementation

{$R *.dfm}


uses
  ealerta.helpers.registry,
  ealerta.helpers.files,
  ealerta.helpers.styles, ealerta.helpers.dialogs;

procedure TPageConfig.btnAbrirArquivoSomClick(Sender: TObject);
begin
  inherited;
  edtArquivoSom.Text := GetFileName('*.wav', 'Arquivos de som',
    edtArquivoSom.Text)
end;

procedure TPageConfig.btnBancoEcoClick(Sender: TObject);
begin
  inherited;
  edtBancoEco.Text := GetFileName('*.eco; *.fdb', 'Banco de dados',
    edtBancoEco.Text)
end;

procedure TPageConfig.btnDriverFirebirdClick(Sender: TObject);
begin
  inherited;
  edtDriverFirebird.Text := GetFileName('*.dll', 'Arquivos DLL',
    edtDriverFirebird.Text)
end;

procedure TPageConfig.btnSalvarClick(Sender: TObject);
begin
  inherited;
  SalvarConfiguracoes;
  FTemaAtual := TStyleManager.ActiveStyle.Name;
end;

procedure TPageConfig.CancelarClick(Sender: TObject);
begin
  inherited;
  CarregarConfiguracoes;
  TStyleManager.TrySetStyle(FTemaAtual)
end;

procedure TPageConfig.CarregarConfiguracoes;
begin
  // Notificações
  edtArquivoSom.Text := TRegistryIni.GetValue('Configurações\Notificações',
    'Arquivo de som', ExtractFileDir(ParamStr(0)) + '\sons\bloqueio.wav');
  checkExibirNotificacoes.Checked := TRegistryIni.GetValue
    ('Configurações\Notificações', 'Exibir notificações', true);
  checkReproduzirSom.Checked := TRegistryIni.GetValue
    ('Configurações\Notificações', 'Reproduzir som', true);
  checkEnviarCatapush.Checked := TRegistryIni.GetValue
    ('Configurações\Notificações', 'Enviar Catapush', true);
  checkEnviarCallmebot.Checked := TRegistryIni.GetValue
    ('Configurações\Notificações', 'Enviar Callmebot', true);

  // Conexão
  edtBancoEco.Text := TRegistryIni.GetValue('Configurações\Conexão',
    'Banco de dados Eco', 'c:\ecosis\dados\ecodados.eco');
  edtUsuarioFirebird.Text := TRegistryIni.GetValue('Configurações\Conexão',
    'Usuário Firebird', 'sysdba');
  edtSenhaFirebird.Text := TRegistryIni.GetValue('Configurações\Conexão',
    'Senha Firebird', 'masterkey');
  edtDriverFirebird.Text := TRegistryIni.GetValue('Configurações\Conexão',
    'Driver Firebird', 'c:\ecosis\windows\fbclient.dll');
end;

procedure TPageConfig.CarregarEstilos;
begin
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

procedure TPageConfig.SalvarConfiguracoes;
begin
  // Notificações
  TRegistryIni.SetValue('Configurações\Notificações', 'Arquivo de som',
    edtArquivoSom.Text);
  TRegistryIni.SetValue('Configurações\Notificações', 'Exibir notificações',
    checkExibirNotificacoes.Checked);
  TRegistryIni.SetValue('Configurações\Notificações', 'Reproduzir som',
    checkReproduzirSom.Checked);
  TRegistryIni.SetValue('Configurações\Notificações', 'Enviar Catapush',
    checkEnviarCatapush.Checked);
  TRegistryIni.SetValue('Configurações\Notificações', 'Enviar Callmebot',
    checkEnviarCallmebot.Checked);

  // Conexão
  TRegistryIni.SetValue('Configurações\Conexão', 'Banco de dados Eco',
    edtBancoEco.Text);
  TRegistryIni.SetValue('Configurações\Conexão', 'Usuário Firebird',
    edtUsuarioFirebird.Text);
  TRegistryIni.SetValue('Configurações\Conexão', 'Senha Firebird',
    edtSenhaFirebird.Text);
  TRegistryIni.SetValue('Configurações\Conexão', 'Driver Firebird',
    edtDriverFirebird.Text);

  // Aparencia
  TRegistryIni.SetValue('Aparencia', 'Tema',
    comboEstilo.Items[comboEstilo.ItemIndex]);
end;

procedure TPageConfig.CarregarPreferencias;
begin
  pgcConfig.ActivePageIndex :=
    TRegistryIni.GetValue('Configurações\Menu', 'ActiveTabIndex', 0);
end;

procedure TPageConfig.comboEstiloChange(Sender: TObject);
begin
  inherited;
  var
  StylePath := Format('styles\%s.vsf',
    [comboEstilo.Items[comboEstilo.ItemIndex]]);

  TStyleHelper.LoadFromFile(StylePath);
end;

procedure TPageConfig.SalvarPreferencias;
begin
  TRegistryIni.SetValue('Configurações\Menu', 'ActiveTabIndex',
    pgcConfig.ActivePageIndex);
end;

procedure TPageConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SalvarPreferencias
end;

procedure TPageConfig.FormCreate(Sender: TObject);
begin
  inherited;
  HidePageControlTabs;
  CarregarPreferencias;
  LinkTabsWithButtons;
  CarregarConfiguracoes;
  CarregarEstilos;
end;

function TPageConfig.GetFileName(Filter, FilterName, Default: string;
  ShowAll: boolean = false): string;
begin
  OpenDialog.FileTypes.Clear;
  with OpenDialog.FileTypes.Add do
  begin
    DisplayName := FilterName;
    FileMask := Filter
  end;
  if ShowAll then
    with OpenDialog.FileTypes.Add do
    begin
      DisplayName := 'Todos os arquivos';
      FileMask := '*.*'
    end;
  OpenDialog.FileTypeIndex := 0;

  OpenDialog.FileName := Default;
  if OpenDialog.Execute then
    Result := OpenDialog.FileName
  else
    Result := Default;
end;

procedure TPageConfig.GroupButtonsButtonClicked(Sender: TObject;
  Index: Integer);
begin
  inherited;
  pgcConfig.ActivePageIndex := Index
end;

procedure TPageConfig.HidePageControlTabs;
begin
  for var i := 0 to pgcConfig.PageCount - 1 do
  begin
    pgcConfig.pages[i].TabVisible := false;
    pgcConfig.pages[i].Visible := true;
  end;
end;

procedure TPageConfig.LinkTabsWithButtons;
begin
  GroupButtons.ItemIndex := pgcConfig.ActivePageIndex
end;

end.
