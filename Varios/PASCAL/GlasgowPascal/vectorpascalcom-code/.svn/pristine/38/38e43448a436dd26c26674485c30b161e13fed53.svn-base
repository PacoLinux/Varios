program tables;
var alpha,b,c,d:array[1..5] of integer;
    t:array[1..5]of array [1..5] of integer;
begin
	alpha:= iota 0;
	t:= alpha*trans alpha;
        write(t);{times tables}
	b:=\+ trans t;
        writeln(b);{ sum cols}
        c:= 2 pow iota 0; { powers 2}
        d:= diag t;    { squares }
        t:= c * trans d;
	writeln(c,d); 
        write(t);   (*! output table  of $i^2*2^i$ *)      
end.	
