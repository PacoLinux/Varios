{ FILE=conf508, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks shr on arrays   }
 

program conf508(output);

procedure testInt;
const
	c1Int : array [1..3] of integer = (2,8,32);
	c2Int : array [1..3] of integer = (1,2,3);
var
	v1Int : array [1..3] of integer;
	v2Int : array [1..3] of integer;
	vResInt : array [1..3] of integer;
	
	count : integer;
begin
	count := 0;
	
	v1Int[1] := 2;
	v1Int[2] := 8;
	v1Int[3] := 32;


	v2Int[1] := 1;
	v2Int[2] := 2;
	v2Int[3] := 3;

	vResInt :=  v1Int shr v2Int  ;
	
	if (vResInt[1] = 1) and (vResInt[2] = 2) and (vResInt[3] = 4) then
	begin
		
		count := count +1;
	end
	else
	begin
		writeln('FAIL - INT - array var-var');
		writeln(vResInt);
	end;
	 
	vResInt := v1Int shr c2Int;
	if (vResInt[1] = 1) and (vResInt[2] = 2) and (vResInt[3] = 4) then
	begin
		count := count +1;	
		
	end
	else
	begin
		writeln('FAIL - INT - array var-const');
		writeln(vResInt);
	end;
	
	vResInt := c1Int  shr c2Int;
	if (vResInt[1] = 1) and (vResInt[2] = 2) and (vResInt[3] = 4) then
	begin
		count := count +1;
		
	end
	else
	begin
		writeln('FAIL - INT - array const-const');
		writeln(vResInt);
	end;
	
	
	if (count <> 3) then 
			write('FAIL CONF508')
	else
			write('PASS CONF508')
end;

begin
	testInt;
	writeln;
	
end.
