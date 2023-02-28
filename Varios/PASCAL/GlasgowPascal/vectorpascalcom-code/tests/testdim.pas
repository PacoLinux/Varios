program testdim;
type basis=(time,space);
const meter: real of space=1;
      sec:real of time=1;
var t : real of time;
    speed: real of space * time pow -1;
    distance: real of space;
    rate:real of time pow -1;
begin
	rate:= 1.0/sec;
end.
