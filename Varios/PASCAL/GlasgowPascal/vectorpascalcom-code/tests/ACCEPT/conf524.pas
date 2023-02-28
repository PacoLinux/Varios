{  Vector Pascal Acceptance Test }
{ file  conf524 }
{:tests  that Turbo style string types are allowed }
program conf524;
 
var  s1:string[80];
     s2:string;
begin
	s1:='seq of char';
	s2:=s1;
        if s1=s2 then
        writeln('PASS CONF524 section 2.3.2 string types')
	else writeln('FAIL CONF524 section 2.3.2 string types');
end.
