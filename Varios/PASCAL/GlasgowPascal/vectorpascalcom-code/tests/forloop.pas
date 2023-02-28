program forloop;{$r-}
var a,b:array[1..2,1..32 ] of real;i,k:integer;
    j:array[1..32] of integer;
    r:real;
begin
	b:=1.0;
	for i:=1 to 32 do
	a[i]:=b[1,j[i]] ;{+r;{}
	b:= b+a;
end.
