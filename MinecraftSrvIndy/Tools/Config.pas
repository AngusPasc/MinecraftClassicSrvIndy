unit Config;

interface

uses Classes, SysUtils, IniFiles, ConsoleMsg;

Procedure LoadCgf();

type
  ServerConfig = record
    ServerName: String;
    ServerIP: String;
    ServerPort: Integer;
    Level_Seed: Integer;
    Max_Players: Integer;
    ServerSalt: String;
  end;

var
  Cgf: ServerConfig;

implementation

Procedure LoadCgf();
var
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');
  if FileExists('config.ini') = True then
  begin
    Cgf.ServerName := IniFile.ReadString('Server Configuration', 'ServerName',
      'A MCDelphi Server');
    Cgf.ServerIP := IniFile.ReadString('Server Configuration', 'ServerIP',
      '127.0.0.1');
    Cgf.ServerPort := StrToInt(IniFile.ReadString('Server Configuration',
      'ServerPort', '7777'));
    Cgf.Level_Seed := StrToInt(IniFile.ReadString('Server Configuration',
      'Level_Seed', '476'));
    Cgf.Max_Players := StrToInt(IniFile.ReadString('Server Configuration',
      'Max_Players', '1000'));
    Cgf.ServerSalt := IniFile.ReadString('Server Configuration', 'ServerSalt',
      'dtryb5rty6vst');
  end
  else
  begin
    IniFile.WriteString('Server Configuration', 'ServerName,',
      'A MCDelphi Server');
    IniFile.WriteString('Server Configuration', 'ServerIP', '127.0.0.1');
    IniFile.WriteString('Server Configuration', 'ServerPort', '7777');
    IniFile.WriteString('Server Configuration', 'Level_Seed', '4574');
    IniFile.WriteString('Server Configuration', 'Max_Players', '1000');
    IniFile.WriteString('Server Configuration', 'ServerSalt', 'dtryb5rty6vst');
    IniFile.UpdateFile;
  end;

end;

end.
