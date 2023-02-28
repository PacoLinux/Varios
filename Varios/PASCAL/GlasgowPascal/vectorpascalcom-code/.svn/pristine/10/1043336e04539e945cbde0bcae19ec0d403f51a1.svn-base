{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that real_2_string works                          }
{:mem errors                                                         }
program conf577;
var s:string;ok:boolean;r:real;i:integer;
begin
   for i:=0 to 11 do begin
      r:= i*1.003;
      s:=real_2_string(r);
      writeln(r,' ',s);
   end;
   s:=real_2_string(10.0);
   ok:= s='10';
   writeln(s);  
   s:=real_2_string(820.1);
   ok:=ok and( s='820.1');
   writeln(s); 
    if not ok then
	writeln('FAIL CONF577 real_2_string')
    else
    writeln('PASS CONF577 real_2_string');

end.
