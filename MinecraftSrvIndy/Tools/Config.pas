unit Config;

interface
uses Classes,SysUtils,IniFiles,ConsoleMsg;

Procedure LoadCgf();

type
  ServerConfig = record
    ServerName: String;
    ServerIP: String;
    ServerPort: String;
    Level_Seed: String;
    Max_Players: String;
    ServerSalt: String;
  end;

implementation



Procedure LoadCgf();
var
Cgf:ServerConfig;
Resp:String;
IniFile: TIniFile;
begin
if FileExists('config.ini')= True then
begin
IniFile:=TIniFile.Create(ExtractFilePath(ParamStr(0))+'config.ini');
Cgf.ServerName:= IniFile.ReadString('Server Configuration','ServerName','');
Cgf.ServerIP:= IniFile.ReadString('Server Configuration','ServerIP','');
Cgf.ServerPort:= IniFile.ReadString('Server Configuration','ServerPort','');
Cgf.Level_Seed:= IniFile.ReadString('Server Configuration','Level_Seed','');
Cgf.Max_Players:= IniFile.ReadString('Server Configuration','Max_Players','');
Cgf.ServerSalt:= IniFile.ReadString('Server Configuration','ServerSalt','');
end
else
begin

end;






end;

end.
