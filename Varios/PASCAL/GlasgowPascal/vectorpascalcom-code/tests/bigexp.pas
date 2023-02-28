program bigexp;
var i,j,k,l,m,n,o,p:integer;
begin
  i:=1;
  j:=2;
  k:=3;
  l:=5;
  m:=7;
  n:=11;
  o:=13;
  p:=17;
  i:= i+(j*(j+k*(4+l*(l+m*(m+n*(3+o*p))))));{}
  write(i);
end.
