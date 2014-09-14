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
  Config in 'Tools\Config.pas';

type
  TServer = class(TObject)
    IdTCPServer1: TIdTCPServer;
    procedure IdTCPServer1Execute(AContext: TIdContext);
    procedure IdTCPServer1Connect(AContext: TIdContext);
  private
    { Private declarations }
    constructor Create;
  public
    { Public declarations }
  end;

procedure TServer.IdTCPServer1Execute(AContext: TIdContext);
var
  Buffer: TMemoryStream;
begin
  Buffer := TMemoryStream.Create;

  with AContext.Connection do
  begin
    if IOHandler.CheckForDataOnSource(1000) then
      Socket.InputBuffer.SaveToStream(Buffer);
    if (Buffer.Size > 0) then
    begin
      Buffer.SaveToFile('azaza.txt');
      PrintMessage(Buffer.Size.ToString + ' butes receive');
      Buffer.Clear;
      Buffer.LoadFromFile('lol.txt');
      Socket.Write(Buffer);

      PrintMessage(Buffer.Size.ToString + ' butes send');
      Socket.InputBuffer.Clear;
      Buffer.Free;
      // Disconnect;
      // Socket.Close;
    end;

  end;
end;

procedure TServer.IdTCPServer1Connect(AContext: TIdContext);
var
  Buffer: TMemoryStream;
begin
  Buffer := TMemoryStream.Create;

  with AContext.Connection do
  begin

  end;

end;

constructor TServer.Create;
begin
  inherited Create;
  IdTCPServer1 := TIdTCPServer.Create(nil);
  IdTCPServer1.Bindings.Clear;
  IdTCPServer1.DefaultPort := 7777;
  IdTCPServer1.Bindings.Add.Port := 7777;
  IdTCPServer1.Bindings.Add.IP := '127.0.0.1';
  IdTCPServer1.Tag := 0;
  IdTCPServer1.TerminateWaitTime := 5000;
  IdTCPServer1.OnConnect := IdTCPServer1Connect;
  IdTCPServer1.OnExecute := IdTCPServer1Execute;
end;

var
  Server: TServer;

begin

  ReportMemoryLeaksOnShutdown := True;
  LoadCgf;
  Server := TServer.Create;
  Server.IdTCPServer1.Active := True;
  While True do
    sleep(60);

end.
