{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF540,                                           }
{                                                                    }
{:tests reduction by an operator     real     arrays                 }
program conf540;
const top=12;
type 	t=real;
	vec=array[1..top] of t;
     

var a:vec;
    i,count:integer;
    t1,t2:t;
    
begin
    count:=0;
    a:=  (top+1)-iota 0;
    t1:=\+ a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]+t2;
    if t1=t2 then count:= count + 1;
    t1:=\- a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]-t2;
    if t1=t2 then count:= count + 1;
    t1:=\* a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]*t2;
    if t1=t2 then count:= count + 1;

    t1:=\ / a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]/ t2;
    if t1=t2 then count:= count + 1;

     t1:=\min a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]min t2;
    if t1=t2 then count:= count + 1;

     t1:=\max a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]max t2;
    if t1=t2 then count:= count + 1;

 

       {}
    if count=6 then writeln('PASS CONF40 section 3.1.4 real reduction')
    else writeln('FAIL CONF540 section 3.1.4 real reduction',count)
end.
