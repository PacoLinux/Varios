program invalidarrayio;
type t(i,j:integer)=array[1..i,1..j] of integer;
var a:array[1..10,1..4] of integer;
  
    i,j:integer;
    procedure b(var a:t);
    begin
		writeln(a[1..i]);
	end;
begin
  i:=2;j:=3;a:=5;
  writeln(a[1..i]);
  b(a[1..i,1..j]);
end.
