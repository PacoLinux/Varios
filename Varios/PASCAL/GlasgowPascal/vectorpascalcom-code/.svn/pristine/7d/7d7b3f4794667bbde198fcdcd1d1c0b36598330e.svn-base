{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.6.2 FILE=CONF547,                                           }
{                                                                    }
{:tests procedure types                                              }
program conf547;

type t=procedure (x:integer);
var v:t;
    procedure f(a:integer);begin writeln('PASS CONF547 sec 2.6.2 procedure types',a);end;
begin
	v:= @f;
	v(3);
end.
