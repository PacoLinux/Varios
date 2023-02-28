{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF542,                                           }
{                                                                    }
{:tests reduction by an operator     boolean arrays                 }
program conf542;
const top=17;
type 	t=boolean;
	vec=array[1..top] of t;
     

var a:vec;
    i,count:integer;
    t1,t2:t;
    
begin
    count:=0;
    a:=  iota 0 < top;
       t1:=\min a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]min t2;
    if t1=t2 then count:= count + 1;

     t1:=\max a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]max t2;
    if t1=t2 then count:= count + 1;

     t1:=\and a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]and t2;
    if t1=t2 then count:= count + 1;

     t1:=\or a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]or t2;
    if t1=t2 then count:= count + 1;

      
  
    if count=4 then writeln('PASS CONF542 section 3.1.4 boolean reduction')
    else writeln('FAIL CONF542 section 3.1.4 boolean reduction',count)
end.
