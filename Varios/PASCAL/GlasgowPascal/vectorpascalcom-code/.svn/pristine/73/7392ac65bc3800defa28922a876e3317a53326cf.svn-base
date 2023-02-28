
{  Vector Pascal Acceptance Test    }
{ file  conf565 }
{:tests the assignment of reals under a mask }
program conf564;
const len=17;
var a,b,c,d:array[1..len] of real;
    ok,i:integer; 
begin
    a:=iota[0];
    b:=2;c:=3;
    
    d[1]:= if a[1]>b[1]+c[1] then b[1] else c[1];
    d:= if a>b+c then b else c;
    d[1]:= if a[1]>b[1]+c[1] then b[1] else c[1];
    ok:=0;
    for i:=1 to len do
    if a[i]>b[i]+c[i] then begin
      if d[i]=b[i] then ok:=ok+1;
    end else begin
      if d[i]=c[i] then ok:=ok+1;
    end;
	if ok=len then
	 writeln(' PASS...  real conditional array expressions(CONF565)')
	else writeln(' FAIL...  real conditional array expressions(CONF565)' );
end.
