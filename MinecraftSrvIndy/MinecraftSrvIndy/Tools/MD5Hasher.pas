unit MD5Hasher;

interface
Uses SysUtils, IdGlobal, IdHashMessageDigest;
Function MD5Hash(S:String):String;
implementation


function MD5Hash(S: String): String;
begin
with TIdHashMessageDigest5.Create do
begin
Result := HashStringAsHex(S);
end;
end;

end.
