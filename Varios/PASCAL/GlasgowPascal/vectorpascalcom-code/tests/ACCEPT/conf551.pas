{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.6.2 FILE=CONF551,                                           }
{                                                                    }
{:tests vector product of  integer vectors                           }
program conf551;
const  
      a:array[0..3] of integer=(1,1,2,3);
      b:array[0..3] of integer=(1,2,3,4);
var i:integer;
begin
	i:=a.b;
    if i=21 then 
	writeln('PASS CONF551  integer vector product allowed')
    else 
	writeln('FAIL CONF551  integer vector product i=',i)
	 
end.
