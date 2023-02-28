{  Vector Pascal Acceptance Test    }
{ file  conf559 }
{:tests  that PURE functions can be called in array expressions }
program conf559;{$r-}
const rows=8;
      cols=256;
var a:array[1..rows,1..cols] of integer;
    i,j,e:integer;
 PURE function next(i:integer):integer;
 begin
	next := i+1;
 end;
begin
 a:=iota[1]*iota[0];
 a:= next (a);
 e:=0;
 for i:=1 to rows do
   for j:= 1 to cols do
    if a[i,j] <> (i*j+1) then e := e+1;
 
 if e = 0 then writeln(' PASS...PURE function calls (CONF559)')
 else writeln(' FAIL...PURE function calls (CONF559)')
end.
