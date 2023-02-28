{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.3 FILE=CONF548  ,                                           }
{                                                                    }
{:tests printing of string                                           }
program conf548;
const o1='12345678901234567890';
 
var o2,i1,i2,i3:string[80];
    t:text;
    i:integer;
begin
	 o2:=o1;
	 assign(t,'conf548.txt');
	 rewrite(t);
	 writeln(t,o1,' ',o2);
     writeln(t,o1:1,' ',o2:1);
     writeln(t,o1:25,' ',o2:25);
	 close(t);
	 assign(t,'conf548.txt');reset(t);
	 readln(t,i1);
	 readln(t,i2);
	 readln(t,i3);
	 i:=0;
	 if length(i1)= (1+length(o1)+length(o2)) then i:=i+1;
	 if length(i2)= (3) then i:=i+1;
     if length(i3)= 51 then i:=i+1;
	 if i1=(o1+' '+o2) then i:=i+1;
	 
	 if i=4 then writeln('PASS CONF548 sec 3.3 string i/o')
	 else writeln('FAIL CONF548 string i/o ',i);
end.
