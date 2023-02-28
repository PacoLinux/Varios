{                Pascal Validation Suite  Version 5.7                }
{                                                                    }
{          (C) Copyright 1982, British Standards Institution         }
{                                                                    }
{ TEST 6.9.1-1, FILE=CONFv194, CLASS=CONFORMANCE, LEVEL=0             }
{                                                                    }
{:This test checks that a single read statement with many variables  }
{:is equivalent to many read statements containing one variable      }
{:each.                                                              }
{                                                                    }
{                                                                    }
{ Modification History :                                             }
{   V3.1: Program parameter removed.                                 }
{   V5.2: File header comments reformatted and file name added to    }
{         TEST line and output lines.                                }
{    modified to assign an external file to the file var             }

program CONFv194(output);
var
   f:text;
   a,b,c,d,e:integer;
   a1,b1,c1,d1,e1:integer;
begin
   assign(f,'out194');
   rewrite(f);
   writeln(f,' 1 2 3 4 5 ');
   reset(f);
   read(f,a,b,c,d,e);
   reset(f);
   read(f,a1);
   read(f,b1);
   read(f,c1);
   read(f,d1);
   read(f,e1);
   if(a=a1) and (b=b1) and (c=c1) and (d=d1) and (e=e1) then
      writeln(' PASS...6.9.1-1 (CONFv194)')
   else
      writeln(' FAIL...6.9.1-1 (CONFv194)')
end.
