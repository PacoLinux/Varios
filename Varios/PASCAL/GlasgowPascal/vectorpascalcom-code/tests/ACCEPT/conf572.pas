{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks   classes with  proc fields and inheritance       }
{:mem errors                                                         }
program conf572;
type  A= class
   		f1:integer;
			function hello:boolean;
			end;
	  B= class (A)
	      f2:integer;
	      function hello:boolean;
	      end;
var c1:b;c2,c3:a;
    i:integer;
function A.hello:boolean;
begin 
  writeln('Wrong hello method called ');
  hello:=false;
end;
function B.hello:boolean;
begin 
   hello:=f1=i;
end;
procedure tryA(x:A);
begin
 
end;
begin
	new(c1);new(c2);
	c3:=c1;
	tryA(c1);
	c1.f1:=2; 
	i:=c1.f1;	 
	if  c1.hello and ( c1 is A)and (c1 is B) and (c2 is A) and not  (c2 is B)
	and (c3 is B) then	
    writeln('PASS CONF572 class with method using instance var and inheritance')
    else
    begin
	  writeln('FAIL CONF572 class with method using instance var and inheritance');
	  writeln('c1. hello ,( c1 is A), (c1 is B) , (c2 is A) , (c2 is B)');
	  writeln(c1.hello ,( c1 is A), (c1 is B) , (c2 is A) , (c2 is B));
    end;
end.
