
program norm;
type vec=array[0..3] of real;
function n(var v:vec):real;
begin
  n:= sqrt(\+ (v*v));
end;
var v:vec;    r:real;
begin
  v:=iota 0;
  r:=n(v);
  writeln(v,r);
end.
