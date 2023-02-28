program transpose;
type t=array[1..2,1..2] of integer;
const m:t=((1,2),(3,4));
var v:t;
begin
	write(m);
	v:= trans m;
	write(v);
	v:= v+1;
	write(v);
	 
end.
