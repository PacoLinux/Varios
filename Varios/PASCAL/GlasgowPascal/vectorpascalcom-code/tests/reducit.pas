program reduceit;
procedure z;
const n=99;
var r:array[1..n] of real;T:REAL;
 s:^vector;
 
 function  vecprod(var a,b: vector):real;
    begin
	 vecprod:= \+ (a  * b );
    end;
begin
	r:=2.0;
    new(s,n);
    s^:=r;
 	T:=\+ ( R*R);
 	writeln(T);
 	
 	T:= \+( s^ *s^);
 	writeln(T);
end;
begin
 	z
END.
