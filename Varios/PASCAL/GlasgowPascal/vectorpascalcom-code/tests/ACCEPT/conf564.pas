
{  Vector Pascal Acceptance Test    }
{ file  conf564 }
{:tests the consistent input output of array of real types }
program conf564;
var a:array[1..3] of real;
    b: record
       a:array[1..3] of real;
       end;
    f:text;
begin
    assign(f, 'tmp.txt');rewrite(f);
	b.a:=1+iota [0];
	writeln(f, b.a);reset(f);
	readln(f,a);
	if (a[1]=b.a[1]) and (a[2]=b.a[2]) and(a[3]=b.a[3])then
	 writeln(' PASS...  real array type io(CONF564)')
	else writeln(' FAIL...  real array type io(CONF564)' );
end.
