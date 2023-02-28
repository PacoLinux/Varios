{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF537,                                           }
{                                                                    }
{:tests reduction by an operator      word arrays                    }
program conf537;
const top=17;
type 	t=word;
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
 
    t1:=\ div a;
 
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]div t2;
    if t1=t2 then count:= count + 1;
 
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

      
     t1:=\ mod a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]mod t2;
    if t1=t2 then count:= count + 1;{ }
    if count=9 then writeln('PASS CONF537 section 3.1.4 word reduction')
    else writeln('FAIL CONF537 section 3.1.4 word reduction',count)
end.
