program sort;
uses intsort;
const a:array[1..5] of integer=(2,8,3,4,7);
var b:array[1..5] of integer;
begin
	b:=a;
	sort(b[1..4]);
	write(a,b);
end.
