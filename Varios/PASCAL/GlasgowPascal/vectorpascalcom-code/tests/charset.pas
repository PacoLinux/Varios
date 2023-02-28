Program charset;
VAR i:integer;
begin
	for i:= 16 to 255 do
	begin
		if i mod 16=0 then writeln;
		write(chr(i),' ');
	end;
end.
