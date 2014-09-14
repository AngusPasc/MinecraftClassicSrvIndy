unit HeartBeat;

interface

uses IdHTTP, Classes,Config;

Procedure Create();

Type
  HeartBeatThread = class(TThread)
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
  HttpRequest: TIdHTTP;
  Responce: String;
  Argv:TStringList;
begin
  HttpRequest := TIdHTTP.Create();
end;

end.
