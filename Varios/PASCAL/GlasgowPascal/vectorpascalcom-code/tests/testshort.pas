program testshort;
var i:integer;
a:array[1..2] of integer;
b:array[1..4,1..4] of integer;
begin
	i:=1;{$r-}
	a[i]:=2+i;
	b[a[i]]:=b[i];
end.
	
