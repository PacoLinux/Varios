{ FILE=conf510.pas, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks array slicing  }
 

program vec010(output);

procedure testInt;
const
	c1Int : array [1..3] of integer = (1,2,4);
	c2Int : array [1..3] of integer = (1,2,3);
var
	
	v1Int,v2Int : array [1..5] of integer;
	vResInt : array [1..3] of double;
	
	count : integer;
begin
	count := 0;
	
	v1Int[1] := 1;
	v1Int[2] := 2;
	v1Int[3] := 4;


	v2Int[1] := 1;
	v2Int[2] := 2;
	v2Int[3] := 3;


	vResInt :=  v1Int shl v2Int  ;


	if (vResInt[1] = 2) and (vResInt[2] = 8) and (vResInt[3] = 32) then
	begin
		
		count := count +1;
	end
	else
	begin
		writeln('FAIL - INT - array var-var')
	end;
	
	vResInt := v1Int shl c1Int;

	if (vResInt[1] = 2) and (vResInt[2] = 8) and (vResInt[3] = 64) then
	begin
		count := count +1;	
		
	end
	else
	begin
		writeln('FAIL - INT - array var-const')
	end;
	
	vResInt := c1Int  shl c2Int;
		writeln(vResInt[1]);
writeln(vResInt[2]);
writeln(vResInt[3]);
	if (vResInt[1] = 2) and (vResInt[2] = 8) and (vResInt[3] = 32) then
	begin
		count := count +1;
		
	end
	else
	begin
		writeln('FAIL - INT - array const-const')
	end;
	
	
	if (count <> 3) then 
			write('FAIL CONF510')
	else
			write('PASS CONF510')
end;

begin
	testInt;
    writeln;
	
	
end.
