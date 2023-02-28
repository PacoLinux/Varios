program cmplxtst;
const roman:array[0..4] of string[3]=('C','L','X','V','I');
      num:array[0..4] of integer=(1,1,2,0,3);
var c:complex;s:string[80];
    v1:array[0..1] of complex;
    s2:array[0..4] of string;
    ch:char;
begin
	ch:='c';
	s:='I'; 
	s:=num.roman;
	writeln(s);
end.
