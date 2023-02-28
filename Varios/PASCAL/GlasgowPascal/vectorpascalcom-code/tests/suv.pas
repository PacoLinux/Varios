program sumv;

type intarray = array[0..1000] of integer;

function myfunc(var v:intarray; len:integer):integer;
begin
	myfunc:= \+ v[0..len];
end;
var v:intarray;
begin
	v:=iota 0;
	write(myfunc(v,5));
end.