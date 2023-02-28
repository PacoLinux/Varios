{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that matrix mult gives right answer               }
{:mem errors                                                         }
program conf578;
const n=50;r=1;
type t = real;
     m = array[1..n,1..n] of t;
     p=^m;
var a,b,c:p;I,j:integer;ok:boolean;
procedure f( var ma,mb,mc:m);
begin
	ma:= mb.mc;
end;
begin
    new (a);new(b);new(c);
    for i:= 1 to n do b^[i,i]:=1.0;{identity matrix}
    c^:=iota[1]+iota[0];
	for i:= 1 to r do f(a^,b^,c^);
	ok:= \and \and (c^=a^);
	if not ok then
	writeln('FAIL CONF578 mult by identity matrix')
    else
    writeln('PASS CONF578 mult by identity matrix');
end.
