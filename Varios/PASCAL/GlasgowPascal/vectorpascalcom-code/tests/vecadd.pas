program vecadd;uses  arraydecls;
 
 const a:array[1..2] of integer=(0,1);
 var   i:integer;
       r:real;
begin
	v1:=1;
	v3:=3;
	r:=v3.v2;
	v2:= iota 0;
	for i:= 1 to 10000 do
	v1:=v2+v3*5;  
	for i:=1 to 4 do writeln(v1[1,i],v1[2,i],v1[last,i]);
 
end.
