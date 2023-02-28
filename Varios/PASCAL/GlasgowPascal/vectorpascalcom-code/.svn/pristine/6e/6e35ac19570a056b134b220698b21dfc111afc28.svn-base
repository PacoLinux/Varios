{  Vector Pascal Acceptance Test
 vec019 tests  that array constants are allowed }
program vec020;
const
tr:array[1..3]          of real = (1.0,1.0,2.0);
t2:array[1..2,1..3]     of real =((1.0,2.0,4.0),(1.0,3.0,9.0));
begin
  if (tr[1]+1.0=tr[3]) and
     (t2[2,3]=9) 
  then 
	writeln('PASS VEC020 section 2.1.1')
        else
	writeln('FAIL VEC020 section 2.1.1');
end.
