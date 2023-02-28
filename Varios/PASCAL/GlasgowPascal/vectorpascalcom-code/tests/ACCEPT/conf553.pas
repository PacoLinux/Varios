{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{            FILE=CONF553,                                           }
{                                                                    }
{:tests that schema type variables must be given parameters          }
program conf553;
type
	s(a:integer)=array[1..a] of real;
    
var
     p:^s;
     q:s; { this line should generate a warning }
begin
	 new(p,2);
	writeln('PASS CONF553');
end.
