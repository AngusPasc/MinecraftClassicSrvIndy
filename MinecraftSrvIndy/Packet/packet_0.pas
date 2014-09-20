unit Packet_0;

{$mode delphi}

interface

uses
  SysUtils,
  IdComponent,
  IdIOHandler,
  IdContext,
  IdIOHandlerStack,
  IdGlobal,
  Classes;
type
  TPacket = class(TObject)
    procedure Read(AContext: TIdContext);
    procedure Write(AContext: TIdContext);
  end;
implementation

 procedure TPacket.Read(AContext:TIdContext);
 begin

 end;

 procedure TPacket.Write(AContext:TIdContext);
 begin

 end;
end.

