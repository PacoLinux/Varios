{  Vector Pascal Acceptance Test
 vec013 tests  ability to hold unicode characters in strings }
program vec013;

var 
        灛 :string;

begin
	灛:='灛灰灢瀹'+'ઈગಘИ‱⁇₤₣₡€  ℝℙℕℕ ℤ ⅓⅔⅕⅖⅗⇖⇗'; 
        
	writeln('PASS VEC013 section 1.5.3');
end.
