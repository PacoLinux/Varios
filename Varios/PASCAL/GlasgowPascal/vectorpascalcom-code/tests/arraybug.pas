program arraybug;
TYPE myarray(n:integer) = array[0..N,0..N] of integer;
  PROCEDURE test(var a : myarray);
	begin
		write(a);
	end;
var x:array[0..3,0..3] of integer;
begin
	test(x);
end.