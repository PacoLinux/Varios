{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.5.3, FILE=CONF532, CLASS=CONFORMANCE, LEVEL=0               }
{                                                                    }
{:If an array variable occurs on the right hand side of an assignment} {:statement, there is a further form of indexing possible. An array  }
{:may be indexed by another array. If x:array[t0] of t1 and y:array  } 
{:{[t1]       of t2 , then y[x] denotes the virtual array of type    }
{:array[t0] of t2 such that y[x][i]=y[x[i]]                          }
                                                              
program conf532;

const perms:array[0..3]        of integer=(3,1,2,0);
var ma,m0:array[0..3]        of integer;
    j,count:integer;
begin
  m0:= (iota 0)+1;
  ma:=m0[perms];
  
  count:=0;
  for       j:=0 to 3 do 
   if ma[j]=m0[perms[j]] then count:=count+1;
  if count=4 then
  writeln('PASS CONF532 2.5.3 arrays index arrays')
  else
   writeln('FAIL CONF532 2.5.3 arrays index arrays')
end.
