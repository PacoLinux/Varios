{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF538,                                           }
{                                                                    }
{:tests reduction by an operator     shortint arrays                 }
program conf538;
const top=17;
type 	t=shortint;
	vec=array[1..top] of t;
     

var a:vec;
    i,count:integer;
    t1,t2:t;
    
begin
    count:=0;
    {a:=  (top+1)-iota 0;}
     for i:= top downto 1 do
     a[i]:=i;
    t1:=\+ a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]+t2;
    if t1=t2 then count:= count + 1;
    writeln(count);
	
	t1:=\ +: a;
	t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]+:t2;
    if t1=t2 then count:= count + 1;
    writeln(count);

    t1:=\-: a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]-:t2;
    if t1=t2 then count:= count + 1;
	writeln(count);

    t1:=\- a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]-t2;
    if t1=t2 then count:= count + 1;
	writeln(count);
    t1:=\* a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]*t2;
    if t1=t2 then count:= count + 1;
 writeln(count);

    

     t1:=\min a;
     writeln('mint t1',t1);
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]min t2;
    writeln(' t2',t2);
    if t1=t2 then count:= count + 1;
 writeln(count);

     t1:=\max a;
     writeln('max t1',t1);
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]max t2;
    writeln(' t2',t2);
    if t1=t2 then count:= count + 1;
 writeln(count);

     t1:=\and a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]and t2;
    if t1=t2 then count:= count + 1;
 writeln(count);

     t1:=\or a;
    t2:=a[top]; for i:= top -1 downto 1 do t2:= a[i]or t2;
    if t1=t2 then count:= count + 1;
 writeln(count);

      
     

    if count=9 then writeln('PASS CONF538 section 3.1.4 shortint reduction')
    else writeln('FAIL CONF538 section 3.1.4 shortint reduction',count)
end.
