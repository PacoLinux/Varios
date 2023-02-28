{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that classes with   proc fields work            }
{:mem errors                                                         }
program conf575;
type  A= class
                 f1:integer;
procedure hello;
end;

var c1:
a;
ok:
boolean;
procedure A.hello;
begin
writeln('PASS CONF575 class with procedure method');
ok:=true;
end;
begin
new(c1);
c1.hello;
if not ok then
writeln('FAIL CONF575 class with procedure method test')
end.
