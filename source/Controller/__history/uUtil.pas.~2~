unit uUtil;

interface

uses
   System.SysUtils, Math;
type
  TUtil = class(TObject)
  private
    { Private declarations }
  public
    { Public declarations }

    class function NumberFloatOnly(Key: Char; texto: String): char;
    class function NumberIntegerOnly(Key: Char; texto: String): char;

end;


implementation

{ TUtil }

class function TUtil.NumberFloatOnly(Key: Char; texto: String): char;
begin
 Result := key;
   if (not (Key in ['0'..'9', ',', #8, #9])) OR ( (Key = ',') and (pos(',',Texto)>0) ) then Result := #0;
end;

class function TUtil.NumberIntegerOnly(Key: Char; texto: String): char;
begin
Result := key;
   if (not (Key in ['0'..'9', #8, #9])) then Result := #0;
end;

end.
