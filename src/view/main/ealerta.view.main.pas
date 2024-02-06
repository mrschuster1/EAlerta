unit ealerta.view.main;

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
  ealerta.view.default,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Styles,
  Themes,
  Router4D,
  Vcl.Menus,
  Vcl.CategoryButtons,
  Vcl.WinXCtrls,
  Vcl.ButtonGroup;

type
  TFormMain = class(TFormDefault)
    btnConfig: TSpeedButton;
    pnlClient: TPanel;
    svMenu: TSplitView;
    GroupButtons: TButtonGroup;
    pnlMenuRightMargin: TPanel;
    btnMenu: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure btnMenuClick(Sender: TObject);
    procedure GroupButtonsButtonClicked(Sender: TObject; Index: Integer);
    procedure svMenuClosed(Sender: TObject);
    procedure svMenuOpened(Sender: TObject);
    procedure btnConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure svMenuExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnHelpClick(Sender: TObject);
  private
    procedure SwitchMenuState;
    procedure SwitchMenuIcon;
    procedure LinkToRouteByName(Name: string);
    procedure CarregarPreferencias;
    procedure SalvarPreferencias;

  public

  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}


uses
  ealerta.helpers.Forms,
  ealerta.consts.ui,
  ealerta.view.pages.inicio,
  ealerta.helpers.registry,
  ealerta.helpers.Dialogs;

procedure TFormMain.LinkToRouteByName(Name: string);
begin
  for var i := 0 to GroupButtons.Items.Count - 1 do
    if GroupButtons.Items[i].Hint = Name then
    begin
      GroupButtons.Items[i].ScrollIntoView;
      GroupButtons.ItemIndex := GroupButtons.Items[i].Index
    end;

  TRouter4D.Link.&To(Name);
  svMenu.Close;
end;

procedure TFormMain.SalvarPreferencias;
begin
  TRegistryIni.SetValue('Início\Menu', 'Index', GroupButtons.ItemIndex);
  TRegistryIni.SetValue('Início\Menu', 'Opened', svMenu.Opened)
end;

procedure TFormMain.SwitchMenuIcon;
begin
  if svMenu.Opened then
    btnMenu.Caption := TSegoeIcons.ICON_CHEVRON_LEFT
  else
    btnMenu.Caption := TSegoeIcons.ICON_CHEVRON_RIGHT;

  pnlMenuRightMargin.Visible := svMenu.Opened;
end;

procedure TFormMain.SwitchMenuState;
begin
  svMenu.Opened := not svMenu.Opened;
end;

procedure TFormMain.btnConfigClick(Sender: TObject);
begin
  inherited;
  LinkToRouteByName('Configurações');
end;

procedure TFormMain.btnHelpClick(Sender: TObject);
begin
  inherited;
   LinkToRouteByName('Cadastro base')
end;

procedure TFormMain.btnMenuClick(Sender: TObject);
begin
  inherited;
  SwitchMenuState
end;

procedure TFormMain.CarregarPreferencias;
begin
  GroupButtons.ItemIndex := TRegistryIni.GetValue('Início\Menu', 'Index', 0);
  LinkToRouteByName(GroupButtons.Items.Items[GroupButtons.ItemIndex].Hint);
  svMenu.Opened := TRegistryIni.GetValue('Início\Menu', 'Opened', True);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SalvarPreferencias;

  for var i := 0 to Screen.FormCount - 1 do
    if Screen.Forms[i] <> Self then
      Screen.Forms[i].Close
end;

procedure TFormMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if TDialog.ShowDialog(tmQuestao, 'Deseja fechar a aplicação?',
    'Lembre-se de salvar seu trabalho antes de prosseguir.',
    'Sim', 'Não').Bool = True then
    CanClose := True
  else
    CanClose := false
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  inherited;
  TRouter4D.Render<TPageInicio>.SetElement(pnlClient, pnlBackground);

  CarregarPreferencias
end;

procedure TFormMain.GroupButtonsButtonClicked(Sender: TObject; Index: Integer);
begin
  inherited;
  LinkToRouteByName(GroupButtons.Items.Items[Index].Hint)
end;

procedure TFormMain.svMenuClosed(Sender: TObject);
begin
  inherited;
  SwitchMenuIcon;
end;

procedure TFormMain.svMenuExit(Sender: TObject);
begin
  inherited;
  svMenu.Opened := false
end;

procedure TFormMain.svMenuOpened(Sender: TObject);
begin
  inherited;
  SwitchMenuIcon;
  svMenu.SetFocus
end;

end.
