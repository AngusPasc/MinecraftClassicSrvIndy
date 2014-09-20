unit HeartBeat;

interface

uses SysUtils, Classes, Config, ConsoleMsg,IdSSLOpenSSL,
  IdIOHandler, IdComponent, IdHTTP;

Procedure Create();

Type
  HeartBeatThread = class(TThread)
    IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  private
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

Procedure Create();
var
  MyThread: HeartBeatThread;
begin
  MyThread := HeartBeatThread.Create(False);
  MyThread.Priority := tpNormal;
end;

procedure HeartBeatThread.Execute;
var
  HeartBeatHTTP: TIdHTTP;
  Argv: String;
begin
  HeartBeatHTTP := TIdHTTP.Create;
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  Argv := ('port=25565&') + ('max=' + IntToStr(Cgf.Max_Players) + '&') +
    ('name=' + Cgf.ServerName + '&') + ('public=True&') + ('version=7&') +
    ('salt=' + Cgf.ServerSalt + '&') + ('users=0');
  HeartBeatHTTP.IOHandler := IdSSLIOHandlerSocket;
  HeartBeatHTTP.HandleRedirects := True;
  while True do
  begin
    PrintInfo(HeartBeatHTTP.Get('https://minecraft.net/heartbeat.jsp?' + Argv));
    Sleep(25000);
  end;
end;

end.
