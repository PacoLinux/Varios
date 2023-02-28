{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.4 FILE=CONF546,                                           }
{$r-                                                                   }
{:tests reduction by an operator     dynamic arrays                  }
program conf546;
const top=3;
type 	t=integer;
	vec(r,l,c:integer)=array[1..r,l..c] of t;
        vec1(l,c:integer)=array[l..c] of t;

var a:^vec;
    b:^vec1;
    i,count,tot:integer;
    t1,t2:t;
    function sumrow(var v:vec;i:integer):integer;
    begin
	sumrow:=\+ v[i]
    end;
    
begin
    count:=0;
    new(a,2,1,top);
    
    a^:=iota 1 * iota 0;
    
    for i:= 1 to 2 do begin
	t1:=\+ a^[i];
	t2:=sumrow(a^,i);
  
	if t1=6*i then count:=count+1;
	if t2=6*i then count:=count+1;
    end;
    
    if count=4 then writeln('PASS CONF546 section 3.1.4 dynamic array reduction')
    else writeln('FAIL CONF546 section 3.1.4 dynamic array reduction',count)
end.
