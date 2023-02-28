unit alib;
interface
const len=4;
var a,b,c,d: array[1..len] of real;
    m,n: array[1..2,1..len] of real;
implementation
begin
	a:=iota (0);
	b:= a*a; 
	b:=( b-1)/a; 
	{
	c:= b min a; 
	d:= b max a;
	writeln(a,b,c,d);
	c:= round(b);
	d:=trunc (b);
	writeln(b,c,d);
	c:= sin(b);
	d:=cos(b);
	writeln(b,c,d);
	c:= ln(b);
	writeln(c);}
	m:= b*iota(0)+0.1;
	n:= a;
	writeln(a,b,m,n);
	 
end.
	
