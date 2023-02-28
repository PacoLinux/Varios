{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks   classes with  proc fields can use THIS       }
{:mem errors                                                         }
program conf573;
type  A= class
			f1:integer;
			function hello:boolean;
			end;
	 
var c1:a;
    i:integer;
 
function A.hello:boolean;
begin 
  hello:=THIS.f1=i;
end;
begin
	new(c1);
	c1.f1:=2; 
	i:=c1.f1;	 
	if  c1.hello then
    writeln('PASS CONF573 class with method using THIS')
    else
	writeln('FAIL CONF573 class with method using THIS')
end.
