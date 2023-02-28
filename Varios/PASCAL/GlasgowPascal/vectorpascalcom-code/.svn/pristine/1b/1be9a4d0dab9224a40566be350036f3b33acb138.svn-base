{ FILE=VEC001, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks pow on arrays   }


program vec001(output);

procedure testInt;
const
	c1Int : array [1..3] of integer = (1,2,3);
	c2Int : array [1..3] of integer = (4,5,6);
var
	v1Int : array [1..3] of integer;
	v2Int : array [1..3] of integer;
	vResInt : array [1..3] of integer;
	
	count : integer;
begin
	count := 0;
	
	v1Int[1] := 1;
	v1Int[2] := 2;
	v1Int[3] := 3;


	v2Int[1] := 7;
	v2Int[2] := 8;
	v2Int[3] := 9;

	vResInt :=  v1Int pow  v2Int  ;
	if (vResInt[1] = 1) and (vResInt[2] = 256) and (vResInt[3] = 19683) then
	begin
		
		count := count +1;
	end
	else
	begin
		writeln('FAIL - INT - array var-var')
	end;
	
	vResInt := v1Int pow c1Int;
	if (vResInt[1] = 1) and (vResInt[2] = 4) and (vResInt[3] = 27) then
	begin
		count := count +1;	
		
	end
	else
	begin
		writeln('FAIL - INT - array var-const')
	end;
	
	vResInt := c1Int  pow c2Int;
	if (vResInt[1] = 1) and (vResInt[2] = 32) and (vResInt[3] = 729) then
	begin
		count := count +1;
		
	end
	else
	begin
		writeln('FAIL - INT - array const-const')
	end;
	
	
	if (count <> 3) then 
			write('FAIL CONF506')
	else
			write('PASS CONF506')
end;

begin
	testInt;
	writeln;
	
end.
