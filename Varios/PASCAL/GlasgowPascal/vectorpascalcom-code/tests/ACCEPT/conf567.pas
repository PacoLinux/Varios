{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{                                                                    }
{:This test checks that aliasing of arrays is supported              }
{:mem errors                                                         }
program conf567;
type vector(a:integer)=array[1..a] of integer;
 
     pv=^vector;
    
    procedure remap(var p:pv; var v:vector);
    begin
		alias(p,v);		 
	end;
var vp,p:pv;   i:integer;

begin
      
	new (vp,6);
    vp^:=iota[0];
	remap (p,vp^[3..5]); 
	alias(p,vp^[3..5]);
	 
	if vp^[3]<> p^[1] then
	writeln('FAIL CONF567 aliasing arrays ')
	else
	writeln('PASS CONF567 array aliasing')


end.
