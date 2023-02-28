program simplefor;
{$r- this is a test to see if simple for loops parallelise }
var a,b,c:array[1..100] of real;
    d:array[1..100,1..100] of real
var i,j: integer;t:real;time:double;
begin
    time:=secs;
    for j:=1 to 1000000 do begin
	    b:= iota 0;
	    c:= 7;
		for i:= 1 to 100 do
		  a[i]:=b[i]+c[i];
		t:=0;
		for i:= 1 to 100 do
		  t:= t+ a[i];
		for i:= 1 to 100 do
		 d[1,i]:= a[i];
		for i:= 1 to 100 do
		 d[i,1]:= a[i];
	end;
	writeln(secs-time);
end.
