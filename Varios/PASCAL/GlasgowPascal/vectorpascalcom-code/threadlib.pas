unit threadlib;
interface
type cpointer = ^char;
     Mutex  = array[1..50] of integer;{just allow plenty of space}
var runningparallel :integer;
function getframepointer:cpointer; external;
procedure post_job( { PROCEDURE CallBackProc(i:integer)}   CallBackProc :pointer;     frame_pointer: pointer;  servernumber:integer); external;
procedure wait_on_done(  servernumber:integer);external;
 
function   mutex_init(var m:Mutex  ):integer;
function   mutex_lock(var m:Mutex):integer; external name 'pthread_mutex_lock';
function mutex_trylock(var m :Mutex):integer;external name 'pthread_mutex_trylock';
function mutex_unlock(var m:Mutex ):integer;external name 'pthread_mutex_unlock'; 
function mutex_destroy(m:Mutex ):integer;external name 'pthread_mutex_destroy';
implementation
{function pthread_mutex_init(var m:Mutex ;p:cpointer ):integer;external ;}
function mutex_init(var m:Mutex  ):integer;
  
begin
       mutex_init:=0;{ pas_mutex_init(m,nil);} { think this work is done in threadlib.c}
end;
 
    
   
begin
runningparallel:=0;
end.
