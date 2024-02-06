unit ealerta.helpers.styles;

interface

uses
  Themes,
  StrUtils,
  Vcl.styles,
  SysUtils;

type
  TStyleHelper = class
  private
    class function VCLStyleLoaded(StyleName: string): Boolean;

  public
    class procedure LoadFromFile(Filename: string);

  end;

implementation

{ TStyleHelper }
//
// class procedure TStyleHelper.LoadFromFile(Filename: string);
// begin
// inherited;
//
// var
// StyleName := ReplaceStr(Filename, 'styles\', '');
// StyleName := ReplaceStr(StyleName, '.vsf', '');
//
// if MatchStr(StyleName, TStyleManager.StyleNames) then
// TStyleManager.SetStyle(StyleName)
// else
// begin
// if (FileExists(Filename)) and ((TStyleManager.IsValidStyle(Filename))) then
// try
// TStyleManager.SetStyle(TStyleManager.LoadFromFile(Filename));
// except
// end;
// end;
//
// end;

class function TStyleHelper.VCLStyleLoaded(StyleName: string): Boolean;
begin
  Result := TStyleManager.Style[StyleName] <> nil;
end;

{ TStyleHelper }

class procedure TStyleHelper.LoadFromFile(Filename: string);
var
  StyleInfo: TStyleInfo;
begin
  if TStyleManager.IsValidStyle(Filename, StyleInfo) and
    not VCLStyleLoaded(StyleInfo.Name) then
  begin
    TStyleManager.LoadFromFile(Filename);
    TStyleManager.SetStyle(StyleInfo.Name);
  end
  else if TStyleManager.IsValidStyle(Filename, StyleInfo) and
    VCLStyleLoaded(StyleInfo.Name) then
    TStyleManager.SetStyle(StyleInfo.Name);

end;

end.
