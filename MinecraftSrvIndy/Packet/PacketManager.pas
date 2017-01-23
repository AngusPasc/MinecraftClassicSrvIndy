unit PacketManager;

interface

uses
  SysUtils,
  IdComponent,
  IdIOHandler,
  IdSSLOpenSSL,
  IdHTTP,
  IdContext,
  IdIOHandlerStack,
  IdSSL,
  IdGlobal,
  Classes,
  Packet_0;
Type
  Manager = class(TObject)
    procedure Input(AContext: TIdContext);
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
           Packet_0.TPacket.Read(AContext);
           Packet_0.TPacket.Write(AContext);
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

procedure Manager.OnJoin(AContext: TIdContext);
var
  UserName, MD5: String;

begin


  With AContext.Connection do
  begin
    While Socket.InputBuffer.Size >= 130 do
    begin
    end;

    WriteLn('Ðàçìåð áóôåðà â onjoin: ' + IntToStr(IOHandler.InputBuffer.Size));
    UserName := IOHandler.ReadString(64, nil);
    WriteLn('Ðàçìåð áóôåðà ïîñëå íèêà: ' +IntToStr(IOHandler.InputBuffer.Size));
    MD5 := (IOHandler.ReadString(64, nil));
    WriteLn('Ðàçìåð áóôåðà ïîñëå md5: ' + IntToStr(IOHandler.InputBuffer.Size));
    IOHandler.InputBuffer.Clear;

  end;
end;

end.
