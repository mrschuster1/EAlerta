unit ealerta.view.default;

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
  Styles,
  Themes,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.StdCtrls;

type
  TFormDefault = class(TForm)
    pnlBackground: TPanel;
    pnlCaptionBar: TPanel;
    btnClose: TSpeedButton;
    btnWindow: TSpeedButton;
    btnMinimize: TSpeedButton;
    lblFormCaption: TLabel;
    btnHelp: TSpeedButton;
    procedure pnlCaptionBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure pnlCaptionBarDblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnWindowClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnMinimizeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  protected
    procedure Paint; override;
    procedure Resize; override;

  private
    function IsBorderless: Boolean;
    function GetBorderSpace: Integer;
    procedure WMNCCalcSize(var Msg: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WM_NCHitTest(var Msg: TWMNCHitTest); message WM_NCHitTest;
    procedure SwitchWindowState;
    procedure ShowSystemMenu;
    procedure SaveFormPositions;
    procedure LoadFormPositions;
    procedure LoadTheme;
  public

  end;

var
  FormDefault: TFormDefault;

implementation

{$R *.dfm}


uses
  ealerta.consts.ui,
  ealerta.helpers.ini,
  ealerta.helpers.registry,
  ealerta.helpers.Styles;

{ TFormDefault }

procedure TFormDefault.btnMinimizeClick(Sender: TObject);
begin
  Application.Minimize
end;

procedure TFormDefault.btnWindowClick(Sender: TObject);
begin
  SwitchWindowState;
end;

procedure TFormDefault.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SaveFormPositions;
end;

procedure TFormDefault.FormCreate(Sender: TObject);
begin
  lblFormCaption.Caption := Self.Caption;
  LoadFormPositions;
  LoadTheme;
  StyleElements := [seFont, seClient]
end;

procedure TFormDefault.FormResize(Sender: TObject);
begin
  if WindowState = wsNormal then
  begin
    btnWindow.Caption := TSegoeIcons.ICON_MAXIMIZE;
    btnWindow.Hint := 'Maximizar'
  end
  else
  begin
    btnWindow.Caption := TSegoeIcons.ICON_RESTORE;
    btnWindow.Hint := 'Rest. tamanho'
  end;
end;

procedure TFormDefault.FormShow(Sender: TObject);
begin
  btnMinimize.Visible := not((FormStyle = fsMdiChild) or
    (fsModal in FormState) or not(biMinimize in BorderIcons));

  btnWindow.Visible := biMaximize in BorderIcons;
  btnClose.Visible := biSystemMenu in BorderIcons;
  btnHelp.Visible := biHelp in BorderIcons;
end;

function TFormDefault.GetBorderSpace: Integer;
begin
  case BorderStyle of
    bsSingle:
        Result :=
        GetSystemMetrics(SM_CYFIXEDFRAME);
    bsDialog, bsToolWindow:
        Result :=
        GetSystemMetrics(SM_CYDLGFRAME);
    bsSizeable, bsSizeToolWin:
        Result :=
        GetSystemMetrics(SM_CYSIZEFRAME) +
        GetSystemMetrics(SM_CXPADDEDBORDER);
  else
      Result := 0;
  end;
end;

function TFormDefault.IsBorderless: Boolean;
begin
  Result := BorderStyle in [bsNone, bsToolWindow, bsSizeToolWin];
end;

procedure TFormDefault.LoadFormPositions;
begin
  WindowState := TWindowState(TRegistryIni.GetValue('Aparencia\' + Self.Name,
    'WindowState', 0));

  if WindowState = wsNormal then
  begin
    Self.Left := TRegistryIni.GetValue('Aparencia\' + Self.Name,
      'Left', Self.Left);
    Self.Top := TRegistryIni.GetValue('Aparencia\' + Self.Name,
      'Top', Self.Top);
    Self.Height := TRegistryIni.GetValue('Aparencia\' + Self.Name,
      'Height', Self.Height);
    Self.Width := TRegistryIni.GetValue('Aparencia\' + Self.Name,
      'Width', Self.Width);
  end;
end;

procedure TFormDefault.LoadTheme;
begin
  var
  Style := TRegistryIni.GetValue('Aparencia', 'Tema',
    'Windows11_Dark');

  var
  StylePath := Format('styles\%s.vsf', [Style]);

  TStyleHelper.LoadFromFile(StylePath);
end;

procedure TFormDefault.Paint;
begin
  inherited;
  if (WindowState = wsNormal) and (not IsBorderless) then
  begin
    Canvas.Pen.Color := clBlack;
    Canvas.MoveTo(0, 0);
    Canvas.LineTo(Width, 0);
  end;
end;

procedure TFormDefault.pnlCaptionBarDblClick(Sender: TObject);
begin
  if biMaximize in BorderIcons then
    SwitchWindowState;
end;

procedure TFormDefault.pnlCaptionBarMouseDown(Sender: TObject;
  Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, $F012, 0);

  if (Button = mbRight) and (biSystemMenu in BorderIcons) then
    ShowSystemMenu
end;

procedure TFormDefault.Resize;
begin
  inherited;
  if (WindowState = wsNormal) and (not IsBorderless) then
    Padding.Top := 2
  else
    Padding.Top := 0;
end;

procedure TFormDefault.WMNCCalcSize(var Msg: TWMNCCalcSize);
var
  CaptionBarHeight: Integer;
begin
  inherited;
  if BorderStyle = bsNone then
    exit;

  CaptionBarHeight := GetSystemMetrics(SM_CYCAPTION);
  if WindowState = wsNormal then
    Inc(CaptionBarHeight, GetBorderSpace);

  Dec(Msg.CalcSize_Params.rgrc[0].Top, CaptionBarHeight);
end;

procedure TFormDefault.WM_NCHitTest(var Msg: TWMNCHitTest);
var
  ResizeSpace: Integer;
begin
  inherited;
  ResizeSpace := GetBorderSpace;

  if
    (WindowState = wsNormal) and
    (BorderStyle in [bsSizeable, bsSizeToolWin])
  then
  begin
    if (Msg.YPos - BoundsRect.Top <= ResizeSpace) then
    begin
      if (Msg.XPos - BoundsRect.Left <= 2 * ResizeSpace) then
        Msg.Result := HTTOPLEFT
      else if (BoundsRect.Right - Msg.XPos <= 2 * ResizeSpace) then
        Msg.Result := HTTOPRIGHT
      else
        Msg.Result := HTTOP;
    end
    else
      if (Msg.YPos >= BoundsRect.Bottom - ResizeSpace) then
    begin
      if (Msg.XPos - BoundsRect.Left <= 2 * ResizeSpace) then
        Msg.Result := HTBOTTOMLEFT
      else if (BoundsRect.Right - Msg.XPos <= 2 * ResizeSpace) then
        Msg.Result := HTBOTTOMRIGHT
      else
        Msg.Result := HTBOTTOM;
    end
    else
      if (Msg.XPos >= BoundsRect.Right - ResizeSpace) then
    begin
      if (BoundsRect.Right - Msg.XPos <= 2 * ResizeSpace) then
        Msg.Result := HTRIGHT;
    end
    else
      if (Msg.XPos - BoundsRect.Left <= ResizeSpace) then
    begin
      if (Msg.XPos - BoundsRect.Left <= 2 * ResizeSpace) then
        Msg.Result := HTLEFT;
    end;
  end;
end;

procedure TFormDefault.SaveFormPositions;
begin
  if WindowState <> wsMinimized then
    TRegistryIni.SetValue('Aparencia\' + Self.Name,
      'WindowState', ord(WindowState));

  if WindowState = wsNormal then
  begin
    TRegistryIni.SetValue('Aparencia\' + Self.Name, 'Left', Self.Left);
    TRegistryIni.SetValue('Aparencia\' + Self.Name, 'Top', Self.Top);
    TRegistryIni.SetValue('Aparencia\' + Self.Name, 'Height', Self.Height);
    TRegistryIni.SetValue('Aparencia\' + Self.Name, 'Width', Self.Width);
  end;
end;

procedure TFormDefault.ShowSystemMenu;
begin
  var
  hMenuHandle := GetSystemMenu(Handle, False);
  var
  hMenuItem := LongWord(TrackPopupMenu(hMenuHandle, TPM_LEFTBUTTON or
    TPM_RIGHTBUTTON or TPM_RETURNCMD,
    Mouse.CursorPos.X, Mouse.CursorPos.Y, 0, Handle, nil));
  if hMenuItem > 0 then
    SendMessage(Handle, WM_SYSCOMMAND, hMenuItem, 0);
end;

procedure TFormDefault.btnCloseClick(Sender: TObject);
begin
  Close
end;

procedure TFormDefault.SwitchWindowState;
begin
  case WindowState of
    wsNormal:
        WindowState := wsMaximized;
    wsMaximized:
        WindowState := wsNormal;
  end;
end;

end.
