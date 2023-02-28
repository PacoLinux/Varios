{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.3.3, FILE=CONF528, CLASS=CONFORMANCE, LEVEL=0               }
{                                                                    }
{:This test checks that  extended pascal style schematic arrays      }
{:are allowed                                                        }
{:it also tests iota and operator reduction                          }
program conf528;
type vector(a:integer)=array[1..a] of real;
     yearseq(start,finish:integer)=array[start..finish] of integer;
     matrix(rows,cols:integer)=array[1..rows,1..cols] of real;
     pv=^vector;
     py=^yearseq;
     pm=^matrix;
var vp:pv;yp:py;mp:pm; a,b,c,d:boolean;i:integer;t:real;
begin{$r-}
	new (vp,3);
	i:=2001;
        d:=vp^.a =3;
	new (yp,i,i+2);
	d:=d and (yp^.start=i);
	new (mp,3,3);
	d:= d and (mp^.cols=3);
	vp^:= iota 0;
	yp^:= 1+ iota 0;
	mp^:= vp^ * iota 0;
        
	a:= 6=\+ vp^ ;
   
        b:= ((i+1+i+2+i+3)= \+ yp^) ;
	t:= \+ \+ mp^;
	c:= 18+12+6.0 =t;
	vp^:= \+ mp^;

	if a and b and c and d then
	writeln('PASS CONF528 2.3.3 schematic arrays') 
	else
	writeln('FAIL CONF528 2.3.3 schematic arrays',a,b,c,t)
	 	
end.
