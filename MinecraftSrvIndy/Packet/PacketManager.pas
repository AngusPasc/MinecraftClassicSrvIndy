unit PacketManager;

interface

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
  ConsoleMsg;

Type
  Manager = class(TObject)
    procedure Input(AContext: TIdContext);
    procedure Connected(AContext: TIdContext);
    procedure OnJoin(AContext: TIdContext);
  private
    // procedure BroadCastOutput(AContext:TIdContext);
  public
  end;

implementation

procedure Manager.Input(AContext: TIdContext);
var
  PacketIDByte: Byte;
begin
  With AContext.Connection do
  begin
    PacketIDByte := IOHandler.ReadByte;

    case PacketIDByte of
      0:
        Begin
          if (IOHandler.ReadByte) = 7 then
          begin
            Manager.Create.OnJoin(AContext);
          end
          else
            Disconnect;
        End;
      1:
        Begin
        End;
      2:
        Begin
        End;
    end;
  end;
end;

procedure Manager.Connected(AContext: TIdContext);
begin

end;

procedure Manager.OnJoin(AContext: TIdContext);
var
  PacketID: Byte;
  Size: Integer;
  UserName, MD5: String;
begin
  With AContext.Connection do
  begin

    While Socket.InputBuffer.Size >= 130 do
    begin

    end;
    WriteLn('Размер буфера в onjoin: ' +IntToStr(IOHandler.InputBuffer.Size));
    UserName := IOHandler.ReadString(64, nil);
    WriteLn('Размер буфера после ника: ' +IntToStr(IOHandler.InputBuffer.Size));
    MD5 := (IOHandler.ReadString(64, nil));
    WriteLn('Размер буфера после md5: ' + IntToStr(IOHandler.InputBuffer.Size));
  end;

end;

end.
