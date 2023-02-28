{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF539,                                           }
{                                                                    }
{:tests reduction by an operator     int64    arrays                 }
program conf539;
const top=3;
type 	t=int64;
	vec=array[1..top] of t;
     

var a:vec;
    i,count:integer;
    t1,t2:t;
    
begin
    count:=0;
    a:=  (top+1)-iota 0;
    
    t1:=\+ a;
    t2:=a[top]; 
    if top>1 then for i:= top -1 downto 1 do t2:= a[i]+t2;
    if t1=t2 then count:= count + 1;
     
    t1:=\- a;
    t2:=a[top]; if top>1 then for i:= top -1 downto 1 do t2:= a[i]-t2;
    if t1=t2 then count:= count + 1;
    t1:=\* a;
    t2:=a[top];if top>1 then  for i:= top -1 downto 1 do t2:= a[i]*t2;
    if t1=t2 then count:= count + 1;
  
    t1:=\ div a;
    t2:=a[top];if top>1 then  for i:= top -1 downto 1 do t2:= a[i]div t2;
    if t1=t2 then count:= count + 1;
  
   

     
   
    { }
    if count=4 then writeln('PASS CONF539 section 3.1.4 int64 reduction')
    else writeln('FAIL CONF539 section 3.1.4 int64 reduction',count)
end.
