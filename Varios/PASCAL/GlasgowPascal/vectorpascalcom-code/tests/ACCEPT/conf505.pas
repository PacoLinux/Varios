{ FILE=VEC001, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks mod on arrays   }


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
	
	v1Int[1] := 10;
	v1Int[2] := 20;
	v1Int[3] := 30;


	v2Int[1] := 40;
	v2Int[2] := 50;
	v2Int[3] := 60;

	vResInt :=  v2Int mod v1Int  ;
	 
	if (vResInt[1] = 0) and (vResInt[2] = 10) and (vResInt[3] = 0) then
	begin
		
		count := count +1;
	end
	else
	begin
		writeln('FAIL - INT - array var-var')
	end;
	
	vResInt := v1Int mod c1Int;
	if (vResInt[1] = 0) and (vResInt[2] = 0) and (vResInt[3] = 0) then
	begin
		count := count +1;	
		
	end
	else
	begin
		writeln('FAIL - INT - array var-const')
	end;
	
	vResInt := c2Int mod c1Int;
	if (vResInt[1] = 0) and (vResInt[2] = 1) and (vResInt[3] = 0) then
	begin
		count := count +1;
		
	end
	else
	begin
		writeln('FAIL - INT - array const-const')
	end;
	
	
	if (count <> 3) then 
			write('FAIL CONF505')
	else
			write('PASS CONF505')
end;

begin
	testInt;
	writeln;
	
end.
