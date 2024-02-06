unit ealerta.providers.api.catapush;

interface

uses
  System.JSON,
  RESTRequest4D;

type
  TCatapushApi = class
  private
    type
    TCatapushParams = class
    const
      BASE_URL = 'https://api.catapush.com/1/messages';
      HEADER_ACCEPT = 'application/json';
      HEADER_AUTORIZATHION =
        'b466105554b690e13bb6f9d530fd520531aa6cc0';
      HEADER_CONTENTTYPE = 'application/json';
      APP_ID = '318';
    end;

  public
    class procedure SendMessage(AMessage, AIdentifier: string);
    class procedure SendLogMessage(AMessage: string);

  end;

implementation

{ TCatapushApi }

uses
  ealerta.helpers.registry;

class procedure TCatapushApi.SendLogMessage(AMessage: string);
begin
  var
  Identifier := TRegistryIni.GetValue('Logger\Catapush',
    'Celular', '5593984114750');
  var
  JsonRequest := TJSONObject.Create;
  JsonRequest.AddPair('mobileAppId', TCatapushParams.APP_ID);
  JsonRequest.AddPair('text', AMessage);
  // Recipients
  var
  RecipientsArray := TJSONArray.Create;
  var
  RecipientObject := TJSONObject.Create;
  RecipientObject.AddPair('identifier', Identifier);
  RecipientsArray.Add(RecipientObject);
  JsonRequest.AddPair('recipients', RecipientsArray);

  var
  LRequest := TRequest.New
    .BaseURL(TCatapushParams.BASE_URL)
    .Accept(TCatapushParams.HEADER_ACCEPT)
    .ContentType(TCatapushParams.HEADER_CONTENTTYPE)
    .TokenBearer(TCatapushParams.HEADER_AUTORIZATHION)
    .AddBody(JsonRequest)
    .Post;
  LRequest.Content
end;

class procedure TCatapushApi.SendMessage(AMessage, AIdentifier: string);
begin
  var
  JsonRequest := TJSONObject.Create;
  JsonRequest.AddPair('mobileAppId', TCatapushParams.APP_ID);
  JsonRequest.AddPair('text', AMessage);
  // Recipients
  var
  RecipientsArray := TJSONArray.Create;
  var
  RecipientObject := TJSONObject.Create;
  RecipientObject.AddPair('identifier', AIdentifier);
  RecipientsArray.Add(RecipientObject);
  JsonRequest.AddPair('recipients', RecipientsArray);

  var
  LRequest := TRequest.New
    .BaseURL(TCatapushParams.BASE_URL)
    .Accept(TCatapushParams.HEADER_ACCEPT)
    .ContentType(TCatapushParams.HEADER_CONTENTTYPE)
    .TokenBearer(TCatapushParams.HEADER_AUTORIZATHION)
    .AddBody(JsonRequest)
    .Post;
  LRequest.Content
end;

end.
