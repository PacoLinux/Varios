
{  Vector Pascal Acceptance Test    }
{ file  conf563 }
{:tests the input output of enumerated types }
program conf563;
type colour=(red,green,blue,violet);
var f:text; c,d:colour;
begin
    assign(f,'tmp.txt');
    rewrite(f);
	writeln(f,violet,green);
	close(f);
	assign(f,'tmp.txt');
	reset(f);

	read(f, c);readln(f,d);

	if (c=violet) and (d=green) then
	  writeln(' PASS...  enumerated type io(CONF563)')
	else writeln(' FAIL...  enumerated type io(CONF563)' );
end.
