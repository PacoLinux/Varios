program testvcompare;
{ designed to test vector comparison for MIC}
type v16 = array[1..16] of real;
var v1,v2,v3:v16;
    z:real;
begin
  v2:= iota[0];
  z:=5.178;}
  v3:=z;
  v1:= v2+v3;
  writeln(v1);
  v1:= if v2<v3 then v2 else v2+v3;
  writeln(v2,v3,v1);{}
end.