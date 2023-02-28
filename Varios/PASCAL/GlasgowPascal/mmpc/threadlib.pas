unit threadlib;
interface
type cpointer = ^char;
function getframepointer:cpointer; external;
procedure post_job( { PROCEDURE CallBackProc(i:integer)}   CallBackProc :pointer;     frame_pointer:cpointer;  servernumber:integer); external;
procedure wait_on_done(  servernumber:integer);external;
implementation
begin
end.
