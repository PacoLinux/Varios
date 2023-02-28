{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.5.3, FILE=CONF531, CLASS=CONFORMANCE, LEVEL=0               }
{                                                                    }
{:Tests the passing of subranges as parameters                       }
{:Also tests that schematic arrays can be passed as actual parameters}
{:where the formal parameter is a corresponding delphi dynamic       }
{:array                                                              }
program conf531;
type 
	z(b:integer)=array[0 ..b ] of real;
	vec = array of real;
 
const    R:array[1..4] of real =(3.3,2.2,1.1,0);
         start=2;
Function outer(var P:z; i:integer):boolean;
  Function inner(var Q:vec):boolean;
  begin
	if (q[i]=p[i]) and(q[i]=r[i+start]) then
		inner:=outer(p,i-1)
        else outer:=false
  end;
begin
	if i<0 then outer:=true
	else outer:=inner(p)
end;
		
begin
	if outer(r[2..4],2)  
	then writeln('PASS CONF530 section 2.5.3 use of subrange parameters')
	else writeln('FAIL CONF530 section 2.5.3 use of subrange parameters')
end.
