program subexptest;
const top=5;
var i:integer;
    k:array[1..top] of integer;
    k2:array[1..top,1..top] of integer;
    ktop:array[1..top,1..top,1..top] of integer;
begin
	i:=2;
	k:=iota 0;
	k2:= iota 0 * iota 1;
	ktop:= iota 0 * iota 1 * iota 2;
	writeln(k,k2,ktop);
{	k[i]:=k[i]+1;}
        
        k2[][1..2]:=k2[][2..3]*10;
	k2[][2]:=99;
        ktop:=k2*100;

	writeln(k,k2,ktop);
end.
