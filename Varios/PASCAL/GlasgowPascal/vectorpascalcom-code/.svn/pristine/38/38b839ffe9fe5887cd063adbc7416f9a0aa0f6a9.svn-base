{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that classes with   proc fields can call each other }
{:mem errors                                                         }
program conf576;
type  A= class
			f1:integer;
			procedure hello;
			virtual;
			procedure again(z:integer);
			end;
	    
var c1:a;ok:boolean;
procedure A.again(z:integer);
begin
   if(z=1) then hello;
end;
procedure A.hello;
begin 
	ok:=true;
end;
begin
    ok:=false;
	new(c1); 
	c1.again(1); 
	if not ok then
	writeln('FAIL CONF576 class with inter method call')
    else
    writeln('PASS CONF576 class with inter method call');

end.
