{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF536,                                           }
{                                                                    }
{:tests reduction by an operator      byte                           }
program conf535;
const top=17;
type 	t=byte;
	vec=array[1..top] of t;
     

var a:vec;
    i,count:integer;
    t1,t2:t;
    
begin
    count:=0;
    a:=  (top+1)-iota 0;
    t1:=\+ a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]+t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \+');

    t1:=\- a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]-t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \-');

    t1:=\* a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]*t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \*');

    t1:=\ div a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]div t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \div');

     t1:=\min a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]min t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \min');

     t1:=\max a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]max t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \max');

     t1:=\and a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]and t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \and');

     t1:=\or a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]or t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \or');

      
     t1:=\ mod a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]mod t2;
    if t1=t2 then count:= count + 1 else writeln('FAIL on \mod');{ }
    if count=9 then writeln('PASS CONF536 section 3.1.4 byte reduction')
    else writeln('FAIL CONF536 section 3.1.4 byte reduction',count)
end.
