program parsel;
var a,b:array[0..7 ] of real;
    c:array[0..7] of integer;

begin
	a:= iota 0;
	b:= 4;c:=0;
	c:= if a +0.01< b then 1 else c;
	writeln(c);
end.
