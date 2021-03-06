program MinecraftClassic;

{$APPTYPE CONSOLE}

uses
  SysUtils,
  IdBaseComponent,
  IdComponent,
  IdTCPServer,
  IdIOHandler,
  IdIOHandlerSocket,
  IdSSLOpenSSL,
  IdTCPConnection,
  IdTCPClient,
  IdHTTP,
  IdCustomTCPServer,
  IdContext,
  IdIOHandlerStack,
  IdSSL,
  IdGlobal,
  Classes,
  ConsoleMsg in 'Tools\ConsoleMsg.pas',
  HeartBeat in 'Tools\HeartBeat.pas',
  Config in 'Tools\Config.pas',
  PacketManager in 'Packet\PacketManager.pas',
  MD5Hasher in 'Tools\MD5Hasher.pas',
  Player in 'Packet\Player.pas';

type
  TServer = class(TObject)
    IdTCPServer1: TIdTCPServer;
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure IdTCPServer1Connect(AContext: TIdContext);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create;
  end;

procedure TServer.IdTCPServer1Execute(AContext: TIdContext);
begin
  PacketManager.Manager.Create.Input(AContext);
end;

procedure TServer.IdTCPServer1Connect(AContext: TIdContext);
begin

end;

constructor TServer.Create;
begin
  inherited Create;
  IdTCPServer1 := TIdTCPServer.Create(nil);
  IdTCPServer1.Bindings.Clear;
  IdTCPServer1.DefaultPort := Config.Cgf.ServerPort;
  IdTCPServer1.Bindings.Add.Port := Config.Cgf.ServerPort;
  IdTCPServer1.Bindings.Add.IP := Config.Cgf.ServerIP;
  IdTCPServer1.Tag := 0;
  IdTCPServer1.TerminateWaitTime := 5000;
  IdTCPServer1.OnConnect := IdTCPServer1Connect;
  IdTCPServer1.OnExecute := IdTCPServer1Execute;
end;

var
  Server: TServer;

begin
 // ReportMemoryLeaksOnShutdown := True;
  LoadCgf;
  HeartBeat.Create;
  Server := TServer.Create;
  Server.IdTCPServer1.Active := True;
  While True do
    sleep(1);

end.
