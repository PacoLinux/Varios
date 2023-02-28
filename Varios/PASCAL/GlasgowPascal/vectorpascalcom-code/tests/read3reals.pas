program read3reals;
var a:array[1..3] of real;
    b: record
       a:array[1..3] of real;
       end;
    f:text;
begin

	readln(b.a);
	writeln(b.a);
	readln(f,a);
	writeln(a);
end.
