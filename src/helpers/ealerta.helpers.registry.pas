unit ealerta.helpers.registry;

interface

uses
  registry,
  Forms,
  Windows;

type
  /// <summary>
  /// Classe para manipula��o de configura��es em um arquivo INI
  /// no registro do Windows.
  /// </summary>
  TRegistryIni = class
  private
    class var
      FRegistry: TRegistry;

    class function RegistryRoot: string;

    /// <summary>
    /// Cria a inst�ncia da classe de armazenamento no registro.
    /// </summary>
    class procedure Create;

    /// <summary>
    /// Libera a inst�ncia da classe de armazenamento no registro.
    /// </summary>
    class procedure Free;

    /// <summary>
    /// Define a se��o para a manipula��o correta no registro.
    /// </summary>
    class procedure SetSection(Section: string);

  public
    /// <summary>
    /// Define um valor de string em um arquivo INI no registro do Windows.
    /// </summary>
    class procedure SetValue(Section, Field, Value: string); overload;

    /// <summary>
    /// Define um valor inteiro em um arquivo INI no registro do Windows.
    /// </summary>
    class procedure SetValue(Section, Field: string; Value: Integer); overload;

    /// <summary>
    /// Define um valor booleano em um arquivo INI no registro do Windows.
    /// </summary>
    class procedure SetValue(Section, Field: string; Value: Boolean); overload;

    /// <summary>
    /// Obt�m um valor de string de um arquivo INI no registro do Windows.
    /// </summary>
    class function GetValue(Section, Field, DefaultValue: string)
      : string; overload;

    /// <summary>
    /// Obt�m um valor inteiro de um arquivo INI no registro do Windows.
    /// </summary>
    class function GetValue(Section, Field: string; DefaultValue: Integer)
      : Integer; overload;

    /// <summary>
    /// Obt�m um valor booleano de um arquivo INI no registro do Windows.
    /// </summary>
    class function GetValue(Section, Field: string; DefaultValue: Boolean)
      : Boolean; overload;

    /// <summary>
    /// Remove um valor de um arquivo INI no registro do Windows.
    /// </summary>
    class procedure RemoveValue(Section, Field: string);
  end;

implementation

{ TRegistryIni }

class procedure TRegistryIni.Create;
begin
  FRegistry := TRegistry.Create;
  FRegistry.RootKey := HKEY_CURRENT_USER;
end;

class procedure TRegistryIni.Free;
begin
  FRegistry.Free;
end;

class function TRegistryIni.GetValue(Section, Field, DefaultValue
  : string): string;
begin
  SetSection(Section);
  if FRegistry.ValueExists(Field) then
    Result := FRegistry.ReadString(Field)
  else
  begin
    Result := DefaultValue;
    SetValue(Section, Field, DefaultValue)
  end;
end;

class function TRegistryIni.GetValue(Section, Field: string;
  DefaultValue: Integer): Integer;
begin
  SetSection(Section);
  if FRegistry.ValueExists(Field) then
    Result := FRegistry.ReadInteger(Field)
  else
  begin
    Result := DefaultValue;
    SetValue(Section, Field, DefaultValue)
  end;
end;

class function TRegistryIni.GetValue(Section, Field: string;
  DefaultValue: Boolean): Boolean;
begin
  SetSection(Section);
  if FRegistry.ValueExists(Field) then
    Result := FRegistry.ReadBool(Field)
  else
  begin
    Result := DefaultValue;
    SetValue(Section, Field, DefaultValue)
  end;
end;

class function TRegistryIni.RegistryRoot: string;
begin
  Result := 'Software\' + Application.Title + '\'
end;

class procedure TRegistryIni.RemoveValue(Section, Field: string);
begin
  SetSection(Section);
  FRegistry.DeleteValue(Field);
end;

class procedure TRegistryIni.SetSection(Section: string);
begin
  FRegistry.CloseKey;
  if not FRegistry.KeyExists(RegistryRoot + Section) then
    FRegistry.CreateKey(RegistryRoot + Section);
  FRegistry.OpenKey(RegistryRoot + Section, True);
end;

class procedure TRegistryIni.SetValue(Section, Field, Value: string);
begin
  SetSection(Section);
  FRegistry.WriteString(Field, Value);
end;

class procedure TRegistryIni.SetValue(Section, Field: string; Value: Integer);
begin
  SetSection(Section);
  FRegistry.WriteInteger(Field, Value);
end;

class procedure TRegistryIni.SetValue(Section, Field: string; Value: Boolean);
begin
  SetSection(Section);
  FRegistry.WriteBool(Field, Value);
end;

initialization

TRegistryIni.Create;

finalization

TRegistryIni.Free;

end.
