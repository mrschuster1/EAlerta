unit ealerta.view.pages.base;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Router4D,
  Router4D.Interfaces;

type
  TPageBase = class(TForm, iRouter4DComponent)
    pnlClient: TPanel;
    pnlTop: TPanel;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    btnVoltar: TButton;
    btnFechar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    function Render: TForm;
    procedure UnRender;

  public

  end;

var
  PageBase: TPageBase;

implementation

{$R *.dfm}


uses
  ealerta.view.main;

{ TPageBase }

procedure TPageBase.btnFecharClick(Sender: TObject);
begin
  Close
end;

procedure TPageBase.btnVoltarClick(Sender: TObject);
begin
  TRouter4D.Link.&To('Início');
  FormMain.GroupButtons.ItemIndex := 0;
end;

procedure TPageBase.FormCreate(Sender: TObject);
begin
  lblTitle.Caption := self.Caption
end;

function TPageBase.Render: TForm;
begin
  Result := self;
end;

procedure TPageBase.UnRender;
begin

end;

end.
