unit ealerta.view.pages.cadastro.base;

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
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.BaseImageCollection, Vcl.ImageCollection,
  System.ImageList, Vcl.ImgList, Vcl.VirtualImageList, Vcl.WinXCtrls,
  Vcl.ComCtrls, AdvMetroButton, AdvMetroScrollBox;

type
  TPageCadastroBase = class(TPageBase)
    ButtonImageList: TVirtualImageList;
    ButtonImageCollection: TImageCollection;
    SearchBox1: TSearchBox;
    pgcCadastro: TPageControl;
    tabLista: TTabSheet;
    tabDados: TTabSheet;
  private

  public

  end;

var
  PageCadastroBase: TPageCadastroBase;

implementation

{$R *.dfm}

end.
