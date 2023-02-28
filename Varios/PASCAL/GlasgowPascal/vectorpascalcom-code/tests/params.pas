program params;
type line=string[80];
 function foo:line;begin foo:='barzot' end;
 var v:array[1..2]of line;
begin
writeln(foo);
v[1]:='foo';v[2]:=foo;
writeln(v);
end.
