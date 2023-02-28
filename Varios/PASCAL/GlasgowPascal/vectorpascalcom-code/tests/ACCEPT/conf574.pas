{  Vector Pascal Acceptance Test    }
{ file  conf574 }
{:tests  that val works  }
program conf574;uses system;
 var    i,ok,dok,rok:integer;
        d :double;
        r :real;


begin
 val('12',i,ok);
 val('13.25',d,dok);
 val('1.25',r,rok);(*! note that we chose .25 to ensure that the 32 and
                     64 bit code gives the same answer, this will not
                      work for arbitrary decimal fractions only
                      those that convert to simple binary fractions *)
 if (ok+dok+rok+i+r -d)=0 then writeln(' PASS... val works (CONF574)')
 else writeln(' FAIL...  val does not work(CONF574)',i, ok,d,dok,r ,rok );

end.
