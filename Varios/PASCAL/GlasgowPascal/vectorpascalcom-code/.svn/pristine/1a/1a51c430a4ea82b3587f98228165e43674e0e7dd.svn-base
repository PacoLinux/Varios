{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 2.6.2 FILE=CONF550,                                           }
{                                                                    }
{:tests vector product of string and integer                         }
program conf550;

 
const roman:array[0..4] of string[3]=('C','L','X','V','I');
      num:array[0..4] of integer=(1,1,2,0,3);
var s:string[80];
    
begin
	s:=num.roman;
    if s='CLXXIII' then writeln('PASS CONF550 string integer vector product allowed')
    else writeln('FAIL CONF550 string integer vector product s=',s)
	 
end.
