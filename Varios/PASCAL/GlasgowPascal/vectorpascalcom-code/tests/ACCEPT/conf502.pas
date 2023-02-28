{ FILE=CONF502, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks subtraction on arrays   }


program conf502(output);

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
	
	v1Int[1] := 10;
	v1Int[2] := 20;
	v1Int[3] := 30;


	v2Int[1] := 40;
	v2Int[2] := 50;
	v2Int[3] := 60;

	vResInt := v1Int - v2Int;
	if (vResInt[1] = -30) and (vResInt[2] = -30) and (vResInt[3] = -30) then
	begin
		
		count := count +1;
	end
	else
	begin
		writeln('FAIL - INT - array var-var')
	end;
	
	vResInt := v1Int - c2Int;
	if (vResInt[1] = 6) and (vResInt[2] = 15) and (vResInt[3] = 24) then
	begin
		count := count +1;	
		
	end
	else
	begin
		writeln('FAIL - INT - array var-const')
	end;
	
	vResInt := c1Int - c2Int;
	if (vResInt[1] = -3) and (vResInt[2] = -3) and (vResInt[3] = -3) then
	begin
		count := count +1;
		
	end
	else
	begin
		writeln('FAIL - INT - array const-const')
	end;
	
	
	if (count <> 3) then 
			write('FAIL CONF502')
	else
			write('PASS CONF502')
end;

begin
	testInt;
	writeln;
	
end.
