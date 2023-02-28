program nestpar;
type t = array[1..3,1..2] of real;
     coef=array[0..5] of real;
     { tabulate inverse factorials }
const expc:coef=(1,1,1/2,1/6,1/24,1/(5*24));
var scale:real;B:t;
procedure emap(var a:t);
  { for each a[i,j] replace with a[i,j]+exp(scale*a[i,j]) }
  var coefs:coef;
  pure function Taylor( x:real):real;
  begin
    Taylor:=   \+ (coefs * x pow iota[0]);
  end;
begin
   coefs:= expc;
   a := Taylor(a*scale);
end;
begin
     scale:=0.1;
     B:= iota[0]*iota[1];
     write(B);
     emap(B);
     write(B);
end.