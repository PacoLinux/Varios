program pmul;
var a,b,c:array[1..8] of pixel;
begin
	a:=0.25;
        b:= 0.1 *iota 0;
        c:= a*b;
	writeln(a,b,c);
end.

