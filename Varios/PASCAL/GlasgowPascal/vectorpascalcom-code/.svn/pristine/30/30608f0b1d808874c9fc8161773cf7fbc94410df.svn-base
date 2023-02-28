{ FILE=VEC004, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks division on arrays   }


program vec004(output);

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

	vResInt :=  v2Int div v1Int  ;
	 
        if (vResInt[1] = 4) and (vResInt[2] = 2) and (vResInt[3] = 2) then
	begin
		
		count := count +1;
	end
	else
	begin
		writeln('FAIL - INT - array var-var')
	end;
	
	vResInt := v1Int div c1Int;
	 
	if (vResInt[1] = 10) and (vResInt[2] = 10) and (vResInt[3] = 10) then
	begin
		count := count +1;	
		
	end
	else
	begin
		writeln('FAIL - INT - array var-const')
	end;
	
	vResInt := c2Int div c1Int;
	 
        if (vResInt[1] = 4) and (vResInt[2] = 2) and (vResInt[3] = 2) then
	begin
		count := count +1;
		
	end
	else
	begin
		writeln('FAIL - INT - array const-const')
	end;
	
	
	if (count <> 3) then 
			write('FAIL CONF504')
	else
			write('PASS CONF504')
end;

begin
	testInt;
	writeln;
	
end.
