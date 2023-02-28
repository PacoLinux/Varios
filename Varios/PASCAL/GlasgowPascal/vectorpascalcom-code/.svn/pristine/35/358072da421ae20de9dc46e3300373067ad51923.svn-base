program callconv;
{$r-}
type t2= record a,b:integer end;
     t1= array[0..10] of byte;
procedure foo(var a:t1; b:t1; c:integer);
begin
end;
var x,y:t1;
function bar( i:integer):t1;begin bar:=y;end;

begin
	x:=bar(1);
	x:=bar;
	foo(x,y,3);
end.
