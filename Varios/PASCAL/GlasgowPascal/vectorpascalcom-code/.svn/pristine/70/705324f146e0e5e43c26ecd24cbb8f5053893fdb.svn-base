{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.6 FILE=CONF533, CLASS=CONFORMANCE, LEVEL=0                  }
{                                                                    }
{: test array returns from cunftions                                 }                                                              
program conf533;
type quad= array [0..3] of integer;
const perms:quad=(3,1,2,0);
var m0 :quad;count,j:integer;
   function getq:quad;
   begin
	getq:=perms;
   end;
begin
  m0:= getq;
  
  count:=0;
  for       j:=0 to 3 do 
   if m0[j]=perms[j] then count:=count+1;
  if count=4 then
  writeln('PASS CONF533 2.6 arrays can be returned by functions')
  else
   writeln('FAIL CONF533 2.6 arrays can be returned by functions')
end.
