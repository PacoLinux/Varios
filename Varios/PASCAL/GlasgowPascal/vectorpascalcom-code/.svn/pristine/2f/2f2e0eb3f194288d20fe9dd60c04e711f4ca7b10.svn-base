program vecadd;
type cpointer = ^char;
function getframepointer:cpointer; external;
procedure post_job(  PROCEDURE CallBackProc(i:integer) ;     frame_pointer:cpointer;  servernumber:integer); external;
procedure wait_on_done(  servernumber:integer);external;
procedure t;
var v1,v2,v3:array[1..100]of integer;
    i:integer;
    procedure inner(task:integer);
    var bottom,top,i:integer;
    begin
	if task =0 then 
	begin bottom :=1; top:=49; end
        else
        begin bottom :=50; top := 100 end;
        for i:= bottom to top do
        v3[i]:=v1[i] + v2[i];
    end;
begin
	v1:=1;v3:=0;
	v2:= iota 0;
	post_job(  inner , getframepointer,0);
	 post_job(  inner , getframepointer,1); 
	wait_on_done(0);
	 wait_on_done(1); 
	writeln(v1,v2,v3);
end;
begin t;
end.
