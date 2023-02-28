{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.3.3, FILE=CONF530, CLASS=CONFORMANCE, LEVEL=0               }
{                                                                    }
{:Low and High                                                       }
{:The build in functions low and high return the lower and upper     }
{:bounds of an array respectively. They work with both static and    }
{:dynamic arrays.                                                    }
program conf530;
type 
	z(a,b:integer)=array[a ..b ] of real;
	vec = array of real;
	line= array [1..80] of char;
	matrix = array of array of real;

var i:^z; v:vec; l:line; m:matrix;
begin
	setlength(v,10);setlength(m ,5, 4);
	new(i,11,13);
	if (low(v)=0) and ( high(v)=9) and
	   (low(m)=0) and ( high(m)=4) and
	   (low(m[0])=0)and (high(m [0] )=3) and
	   (low(l)=1)and (high(l )=80) and
	   (low(i^)=11)and(high( i^) =13)
	then writeln('PASS CONF530 section 2.3.3 Low and High')
	else writeln('FAIL CONF530 section 2.3.3 Low and High')
end.
