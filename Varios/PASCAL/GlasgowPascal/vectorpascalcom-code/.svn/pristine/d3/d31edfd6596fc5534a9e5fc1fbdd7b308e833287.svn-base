{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.3.3, FILE=CONF529, CLASS=CONFORMANCE, LEVEL=0               }
{                                                                    }
{:Vector Pascal also allows the use of Delphi style declarations for }
{:dynamic arrays.                                                    }
{ The size of such arrays has to be explicitly initialised at runtime}
{ by a call to the library procedure setlength                       }
program conf529;
type vector = array of real;
     matrix = array of array of real;

var len,i,j:integer;t:real;
v:vector;m: matrix;ok:boolean;
begin
	len:=3; 
	setlength(v,len);
        v:=iota 0;
	ok:= ((v[0]=0) and (v[1]=1) and (v[2]=2));
        setlength(m,len,len);
	m:=iota 0* v;
        for i:=0 to len-1 do
        for j:=0 to len-1 do ok:=ok and (m[i,j]=v[j]*i);
	if ok then
	writeln('PASS CONF529 section 2.3.3 Delphi Arrays')
	else 
	writeln('FAIL CONF529 section 2.3.3 Delphi Arrays');
end.
