unit ealerta.helpers.exe;

interface

uses
  SysUtils,
  ShlObj,
  ComObj,
  ActiveX,
  ShellAPI,
  Windows;

type
  TExeHelper = class
  private
    const
    SETTINGS_SHORTCUT_NAME = 'Configurações';
    SETTINGS_PARAM = '/config';
  public
    class function GetExeVersion(const ExePath: string): string;
    class procedure CreateSettingsShortcut(ExecutablePath: string);
  end;

implementation

{ TExeUtil }

class procedure TExeHelper.CreateSettingsShortcut(ExecutablePath: string);
begin
  // Cria uma instância do objeto ShellLink
  var
  ShellLink := CreateComObject(CLSID_ShellLink) as IShellLink;

  // Define o caminho do executável
  ShellLink.SetPath(PChar(ExecutablePath));

  // Adiciona o parâmetro "/config"
  ShellLink.SetArguments(SETTINGS_PARAM);

  // Obtém o diretório do programa
  var
  ShortcutPath := ExtractFilePath(ExecutablePath);

  // Adiciona o nome do atalho ao diretório do programa
  ShortcutPath := IncludeTrailingPathDelimiter(ShortcutPath) +
    SETTINGS_SHORTCUT_NAME + '.lnk';

  // Cria uma instância do objeto PersistFile
  var
  PersistFile := ShellLink as IPersistFile;

  // Salva o atalho no caminho especificado
  PersistFile.Save(PWideChar(ShortcutPath), False);
end;

class function TExeHelper.GetExeVersion(const ExePath: string): string;
var
  Size, Handle: DWORD;
  Buffer: TBytes;
  FixedPtr: PVSFixedFileInfo;
begin
  Size := GetFileVersionInfoSize(PChar(ExePath), Handle);
  if Size = 0 then
    RaiseLastOSError;
  SetLength(Buffer, Size);
  if not GetFileVersionInfo(PChar(ExePath), Handle, Size, Buffer) then
    RaiseLastOSError;
  if not VerQueryValue(Buffer, '\', Pointer(FixedPtr), Size) then
    RaiseLastOSError;
  Result := Format('%d.%d.%d.%d',
    [LongRec(FixedPtr.dwFileVersionMS).Hi, // major
    LongRec(FixedPtr.dwFileVersionMS).Lo, // minor
    LongRec(FixedPtr.dwFileVersionLS).Hi, // release
    LongRec(FixedPtr.dwFileVersionLS).Lo]) // build

end;

initialization

TExeHelper.CreateSettingsShortcut((ParamStr(0)))

end.
