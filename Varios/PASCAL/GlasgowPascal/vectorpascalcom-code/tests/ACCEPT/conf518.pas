{  Vector Pascal Acceptance Test
 conf518 tests  ability to have fixed point pixel numbers 
 * note the approximate rounding condition}
program conf518;
var p,p2:pixel;
 
begin
	p:= 0.25; 
    p2:=0.5;
    if (0.24<(p2-p))and (0.26>(p2-p)) then
	writeln('PASS conf518 section 1.5.2')
    else
	writeln('FAIL conf18 section 1.5.2')
end.
