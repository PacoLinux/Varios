program cmpxchg;
const init:array[1..3] of integer=(1,2,2);
var a:array[1..3] of integer;
begin
	a[1]:=init[1] max init[2];
	if a[1]=2 then a[1]:=init[1];
	writeln(a[1]);
	a:=init;	
	if a[1]<a[2] then a[1]:=a[3];
	write (a);
	a:=init;
	if a[2]=a[3] then a[2]:=a[1];
	write(a);
	a:=init;
	if a[2]=2 then a[2]:=9;
	write(a);
	writeln (a[1] max a[2]);
	a:=init;
	writeln( a[1] min a[2]);

end.
