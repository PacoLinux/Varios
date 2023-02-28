{                Pascal Validation Suite  Version 5.7                }
{                                                                    }
{          (C) Copyright 1982, British Standards Institution         }
{                                                                    }
{ TEST 6.4.3.4-11, FILE=CONF065, CLASS=CONFORMANCE, LEVEL=0          }
{                                                                    }
{:This test checks that packing applies to one level only using a    }
{:set in a record.                                                   }
{                                                                    }
{                                                                    }
{ Modification History :                                             }
{   V4.3: New test                                                   }
{   V5.2: File header comments reformatted and file name added to    }
{         TEST line and output lines.                                }
{                                                                    }

program CONF065(output);
label 99;
type
   digit = 0..9;
   sdigit = set of 0..9;
   psdigit = packed set of 0..9;
var
   d: digit;
   vudigit: sdigit;
   vpdigit: psdigit;
   recpp: packed record
          x: psdigit;
          end;
   recpu: packed record
          x: sdigit;
          end;
   recup: record
          x: psdigit;
          end;
   recuu: record
          x: sdigit;
          end;
   fail: boolean;
   failpoint:integer;
begin
fail := false;
recpp.x := []; recpu.x := [];
recup.x := []; recuu.x := [];
vudigit := []; vpdigit := [];
for d := 0 to 9 do
   begin
   vudigit := vudigit + [d];
   vpdigit := vpdigit + [d];
   if vudigit <> recpu.x + [d] then
   begin   
   fail := true; 
   failpoint:=1 
   end;
   if not fail then   
   if vudigit <> recuu.x + [d] then
   begin   fail := true; failpoint:=2 end;
   if not fail then
   if vpdigit <> recpp.x + [d] then
   begin   fail := true; failpoint:=3 end;
   if not fail then
   if vpdigit <> recup.x + [d] then
   begin   fail := true; failpoint:=4 end;
   
   if fail then goto 99;
   recpu.x := vudigit;
   recuu.x := recpu.x;
   recpp.x := vpdigit;
   recup.x := recpp.x;
   end;
   99:
if fail then begin
   writeln(' FAIL...6.4.3.4-11 (CONF065)',failpoint,d);
   write('vudigit =[');
   for d:= 0 to 9 do if d in vudigit then write(d:3);
   writeln(']');
    write('recpu.x =[');
   for d:= 0 to 9 do if d in recpu.x then write(d:3);
   writeln(']');
    write('recpu.x +[d]=[');
    recpu.x:=recpu.x+[d];
   for d:= 0 to 9 do if d in recpu.x then write(d:3);
   writeln(']');
   end
else
   writeln(' PASS...6.4.3.4-11 (CONF065)')
end.
