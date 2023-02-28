PROGRAM numio (output );
var x:real;
    i,j,k:integer;
BEGIN
   ;

   x:=1.234567e3;
   for k:=1 to 3 do
    begin
     for i:=0 to 5 do begin
      for j:= 8 downto i+1 do
      write('(',x:j:i,')');
      writeln;
     end;
	x:=x*x;
    end;
END.


