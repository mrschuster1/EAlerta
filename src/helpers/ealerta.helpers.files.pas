unit ealerta.helpers.files;

interface

uses
  SysUtils,
  Classes;

type
  TFileHelper = class
  public
    class procedure ListFilesInDirectory(Directory, Extension: string;
      List: TStrings);

  end;

implementation

{ TFileHelper }

class procedure TFileHelper.ListFilesInDirectory(Directory, Extension: string;
  List: TStrings);
var
  SearchRec: TSearchRec;
begin
  if FindFirst(IncludeTrailingPathDelimiter(Directory) + '*.*' ,
    faAnyFile,
    SearchRec) = 0 then
  begin
    try
      repeat
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
        begin
          if (SearchRec.Attr and faDirectory) = 0 then
            List.Add(IncludeTrailingPathDelimiter(Directory) + SearchRec.Name)
          else if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
            ListFilesInDirectory(IncludeTrailingPathDelimiter(Directory) +
              SearchRec.Name, Extension, List);
        end;
      until FindNext(SearchRec) <> 0;
    finally
      FindClose(SearchRec);
    end;
  end;
end;

end.
