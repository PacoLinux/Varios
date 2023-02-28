{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that classes with non proc fields work            }
{:mem errors                                                         }
program conf571;
type  A= class
			f1:integer;
			function hello:boolean;
			end;
	    
var c1:a;
    i:integer;
function A.hello:boolean;
begin 
hello:=f1=i;
end;
begin
	new(c1);
	c1.f1:=2; 
	i:=c1.f1;	 
	if  c1.hello then
	
    writeln('PASS CONF571 class with method using instance var')
    else
	writeln('FAIL CONF571 class with method using instance var')
 
end.
