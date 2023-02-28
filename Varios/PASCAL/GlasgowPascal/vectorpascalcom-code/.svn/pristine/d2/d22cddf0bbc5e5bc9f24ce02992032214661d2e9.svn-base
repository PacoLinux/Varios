{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that classes with   proc fields work            }
{:mem errors                                                         }
program conf570;
type  A= class
			f1:integer;
			function hello:boolean;
			end;
	    
var c1:a;
function A.hello:boolean;
begin 
writeln('PASS CONF570 class with method');
hello:=true;
end;
begin
	new(c1);
	c1.f1:=2;	 
	if not c1.hello then
	writeln('FAIL CONF570 class with method test')
 
end.
