{  Vector Pascal Acceptance Test
 vec015 tests  ability to read  unicode characters in strings }
program vec015;

var 
        灛,s2 :string;
   f:text;
begin
	灛:='灛灰灢'+'₤₣₡€  ℝℙℕℕ ℤ ⅓⅔⅕⅖⅗⇖⇗'; 
        assign(f,'vec014out');
	 
	reset(f);
	readln(f,s2);
	if 灛=s2 then
	writeln('PASS VEC015 section 1.5.3')
	else writeln('FAIL VEC015 section 1.5.3');
end.

