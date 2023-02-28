{ Vector Pascal Acceptance Test
  vec012 tests conformance with the requirment that vector pascal
  allows variables in greek, cyrillic, japanese and chinese characters }
program vec012;
const ε=0.0001;
var Δε,БЖ,ィサ,き:real;
        灛灰 :integer;
begin
	Δε:=1.0;
        { test that greek variables are not case sensitive}
	while Δε>ε do Δε:=δε*0.5;
        
	writeln('PASS VEC012 section 1.4');
end.
