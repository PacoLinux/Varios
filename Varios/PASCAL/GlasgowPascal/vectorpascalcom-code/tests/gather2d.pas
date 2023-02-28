program gather2d;{$r-}
type mat =array[1..32,1..32] of real;
     vec = array[1..32] of real;
     iv=array[1..32] of integer;
var a,b:mat;v,h:iv;vr,hr:vec;
begin
 B  := 
   A[ v [iota[0]], h [iota[1]]]  *(1-hr[iota[1]]);
 b:=  A[ v [iota[0]], h [iota[1]]+1]  ;
end.