program Av(input,output);
const arraylen=4096;
type vector=array[1..arraylen] of real;
var a,b,average:vector;
begin
	readln(a);readln(b);
	average:= (a+b)/2;
	writeln(average);
end.
