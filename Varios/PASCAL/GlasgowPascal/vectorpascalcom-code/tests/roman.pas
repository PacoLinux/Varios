program roman;
const rom:array[0..4] of string[1]=('C','L','X','V','I');
      numb:array[0..4] of integer=(2,1,1,0,3);
var s:string;
begin
	s:= numb . rom;
	writeln(s);
end.
