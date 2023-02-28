program arraytwice( output);
const arraylen=8;
type vector=array[1..arraylen] of real;
var a,b :vector;
begin
	a:=1;
	a[2]:=2;
	b:=a+7;
	writeln(a);
	writeln(b);
end.
