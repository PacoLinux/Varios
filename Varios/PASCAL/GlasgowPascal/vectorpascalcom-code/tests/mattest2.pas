program mattest2;
const n=2048;r=1;
type t = real;
     m = array[1..n,1..n] of t;
    p=^m;
var a,b,c:p;I:integer;
procedure f;
begin
	a^:= b^  .c^;
end;
procedure ffast;
type mat (l1,h1,l2,h2:integer)=array[l1..h1,l2..h2] of real;
     pm=^mat;
var bb:pm;
begin
new(a);new(b );new(c);
	  f;
	end.
