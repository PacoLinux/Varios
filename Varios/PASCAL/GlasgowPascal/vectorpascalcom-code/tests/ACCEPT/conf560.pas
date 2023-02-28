{  Vector Pascal Acceptance Test    }
{ file  conf560 }
{:tests  that PURE functions can be called in parallel }
{to work this should be compiled with the -cores2 option }
{it will fail unless at least a 5% speedup is found }
program conf560;{$r-}
const rows=800;
      cols=900  ;
type buffer = array[1..rows,1..cols] of integer;
 
var a: ^buffer;
    i:integer;
    t1,t2,t3:double;
 function follow(i:integer):integer;
 begin
	follow := i+1;
 end;
 PURE function next(i:integer):integer;
 begin
	next := i+1;
 end;
 procedure par; begin 
 a^:=next(a^);
 end;
 procedure ser; begin a^:=follow(a^);end;
begin
 new(a);
 a^:=iota[1]*iota[0];
 t1:=secs;
 for i:=1 to 200 do
  par; { this line should be in parallel }
 t2:=secs;
 for i:=1 to 200 do
  ser;{ this line should not be }
 t3:=secs;
 if 1.02*(t2-t1)<(t3-t2) then writeln(' PASS...  parallel function calls (CONF560)')
 else writeln(' FAIL...  parallel function calls (CONF560) par version took',t2-t1, 'ser took',t3-t2);
  
end.
