program v8;
var r,s:array [1..9] of real;
begin
writeln(1.1);
r:=3;
 
s:=iota 0;
r:=r*s+1;
writeln(r);
r:=r-s;
writeln(r);
r:= if r< 7 then s else r;
writeln(r);
end.
