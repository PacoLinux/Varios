{  Vector Pascal Acceptance Test    }
{ file  conf558 }
{:tests  that the word PURE is accepted in function definitions }
program conf558;{$r-}
 PURE function next(i:integer):integer;
 begin
	next := i+1;
 end;
begin
 writeln(' PASS...PURE as function qualifier (CONF558)')
end.
