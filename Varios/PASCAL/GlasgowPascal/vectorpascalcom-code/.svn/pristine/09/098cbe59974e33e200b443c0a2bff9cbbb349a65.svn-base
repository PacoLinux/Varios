{  Vector Pascal Acceptance Test
 vec014 tests  ability to write unicode characters in strings }
program vec014;

var 
        灛,s2 :string;
   f:text;
begin
	灛:='灛灰灢'+'₤₣₡€  ℝℙℕℕ ℤ ⅓⅔⅕⅖⅗⇖⇗'; 
        assign(f,'vec014out');
	rewrite(f);
	writeln(f,灛);
	writeln('PASS VEC014 section 1.5.3');
end.
