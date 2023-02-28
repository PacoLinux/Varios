program tround;
var v37:real;
begin
	v37:=3.7;
	writeln('round ',3.7,round(3.7),-3.7,round(-3.7));
	writeln('trunc ',3.7,trunc(3.7),-3.7,round(-3.7));
	writeln('round ',v37,round(v37),-v37,round(-v37));
	writeln('trunc ',v37,trunc(v37),-v37,round(-v37));
end.
