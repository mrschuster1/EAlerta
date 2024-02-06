unit ealerta.helpers.logs;

interface

uses
  SysUtils,
  Forms,
  Quick.Logger,
  Quick.Logger.ExceptionHook,
  Quick.Logger.RuntimeErrorHook,
  Quick.Logger.UnhandledExceptionHook,
  Quick.Logger.Provider.Events,
  Quick.Logger.Provider.Files;

type
  TLoggerHelper = class
  private
    class procedure Initialize;

  public
    class procedure DoLog(LogLevel: TEventType; AMessage: string);

  end;

implementation

{ TLoggerHelper }

uses
  ealerta.providers.api.catapush;

class procedure TLoggerHelper.Initialize;
begin
  Logger.providers.Add(GlobalLogEventsProvider);
  Logger.providers.Add(GlobalLogFileProvider);

  with GlobalLogEventsProvider do
  begin
    LogLevel := LOG_ALL;

    EventTypeName[etError] := 'Erro';
    EventTypeName[etInfo] := 'Informa��o';
    EventTypeName[etSuccess] := 'Sucesso';
    EventTypeName[etWarning] := 'Aviso';
    EventTypeName[etCritical] := 'Erro cr�tico';
    EventTypeName[etException] := 'Exce��o';
    CustomMsgOutput := False;
    IncludedInfo := [iiAppName, iiHost, iiEnvironment, iiPlatform];

    OnAny := procedure(LogItem: TLogItem)
      begin
        var
        LMessage := 'Data: ' + DateToStr(LogItem.EventDate);
        LMessage := LMessage + #13 + AppName;
        LMessage := LMessage + #13 + LogItem.EventTypeName;
        LMessage := LMessage + #13 + LogItem.Msg;
        TCatapushApi.SendLogMessage(LMessage)
      end;

    Enabled := True;
  end;

  with GlobalLogFileProvider do
  begin
    FileName := Format('.\%s.log', [AppName]);
    CompressRotatedFiles := True;
    DailyRotate := True;
    MaxFileSizeInMB := 20;
    LogLevel := LOG_ALL;

    EventTypeName[etError] := 'Erro';
    EventTypeName[etInfo] := 'Informa��o';
    EventTypeName[etSuccess] := 'Sucesso';
    EventTypeName[etWarning] := 'Aviso';
    EventTypeName[etCritical] := 'Erro cr�tico';
    EventTypeName[etException] := 'Exce��o';

    Enabled := True;
  end;
end;

class procedure TLoggerHelper.DoLog(LogLevel: TEventType; AMessage: string);
begin
  Log(AMessage, LogLevel)
end;

initialization

TLoggerHelper.Initialize

end.
