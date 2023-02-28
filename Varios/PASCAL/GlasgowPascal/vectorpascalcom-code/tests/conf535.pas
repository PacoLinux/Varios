{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF535,                                           }
{                                                                    }
{:tests reduction by an operator                                     }
program conf535;
const top=3;
type 	t=integer;
vec=array[1..top] of t;


var a:
vec;
i,count:
integer;
t1,t2:
t;

begin
count:
    =0;
a:
    =  (top+1)-iota 0;
writeln(a,count);

i:
    = a[1] mod 2;

t1:
    =\ mod a;
t2:
    =maxint;
for i:
    = top   downto 1 do t2:
          = a[i]mod t2;
if t1=t2 then count:
      = count + 1;
{ }

writeln(count);

t1:
    =\+ a;

t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]+t2;
if t1=t2 then count:
      = count + 1;
writeln(count);
t1:
    =\- a;
t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]-t2;
if t1=t2 then count:
      = count + 1;
writeln(count);

t1:
    =\* a;
t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]*t2;
if t1=t2 then count:
      = count + 1;
writeln(count );

t1:
    =\ div a;
t2:
    =1;
for i:
    = top   downto 1 do t2:
          = a[i]div t2;
if t1=t2 then count:
      = count + 1;
writeln(count,t1,t2);

t1:
    =\min a;
t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]min t2;
if t1=t2 then count:
      = count + 1;
writeln(count);

t1:
    =\max a;
t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]max t2;
if t1=t2 then count:
      = count + 1;
writeln(count);
i:
    = -1;

t1:
    =\and a;
t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]and t2;
if t1=t2 then count:
      = count + 1;
writeln(count);

t1:
    =\or a;
t2:
    =a[top];
for i:
    = top -1 downto 1 do t2:
          = a[i]or t2;
if t1=t2 then count:
      = count + 1;
writeln(count);


if count=9 then writeln('PASS CONF535 section 3.1.4 integer reduction')
             else writeln('FAIL CONF535 section 3.1.4 integer reduction',count)
                 end.
