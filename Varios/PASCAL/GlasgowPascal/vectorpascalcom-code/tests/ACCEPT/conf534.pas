{                Vector Pascal Acceptance Suite                      }
{                                                                    }
{                                                                    }
{                                                                    }
{ TEST 3.1.3 FILE=CONF534, CLASS=CONFORMANCE, LEVEL=0                }
{                                                                    }
{:unary use of+, -, *, /, div, mod, and, or, not,                    }
{:round, sqrt, sin, cos, tan, abs, ln, ord, chr, byte2pixel,         }
{: pixel2byte, succ, pred, iota, trans, addr and @, sizeof, perm     }
{: this is an APL style extension to pascal                          }
{: also test unicode equivalents of the above where they exist       }
program conf534;
type side=array[1..2] of integer;
     square=array[1..2,1..3] of integer;
const m:square=((1,2,3),(4,5,6));
var s:string[12];
    ss:set of 1..4;
    b:0..255;p:pixel;
    i:pointer;
    ok, first ,second,third:boolean;
    v,w:side;
    m2:array[1..2,1..2] of integer;
    m3:array[1..3,1..2] of integer;
    j,k,count :integer;
    theta,tant,sint,cost:real;
begin
 
 b:=255;
 p:= byte2pixel (b);b:=pixel2byte( p);s:='ab'; ss:=[1,4];
  
 i := addr s;
 
 first:= (1= +1) and (s = +s) and (ss = +ss) and
    (2 = - -2) and
    (3  = *3) and
    (1.0 = 4.0 * / 4) and   
    (0= (div 4))  ;
 second:=  (1.0 = 4.0 ×  /4) and
   (0=( ÷4) )and {unicode ver}
   (1 = ( mod 5)) ;
 third:=     (false = and false) and ( true = and true) and
    (false = or false) and (true = or true) and
    (true = not false) and (false = ¬ true)   and
    (1= round(1.0)) and (2 = round(2.0)) and

    (4 = sqrt 16) and 
    (2 = sqrt √ 16) and 
    (2 = abs( -2))  and
    (i = @ s) and
    (50 = ord chr 50)  and
    (p = byte2pixel( b)) and
    (b = pixel2byte( p)) and
    (1 = succ (0)) and (0 = pred (1)) (* *);
 if first and second  and third
 then writeln('PASS CONF534 section 3.1.3 unary scalar operators')
 else writeln('FAIL CONF534 section 3.1.3 unary scalar operators',first,second,third );
 v:= iota 0;
 w:= ⍳ 0;
 
 m3:= trans m;
 m2:= perm[0,0] m;count:=0;
 for j:=1 to 2 do for k:=1 to 2 do if m2[j,k]= m[j,j] then count:=count +1;  
 m2:= perm[1,1] m;
 for j:=1 to 2 do for k:=1 to 2 do if m2[j,k]= m[k,k] then count:=count +1; 
 m2:= perm[1,0] m;
 for j:=1 to 2 do for k:=1 to 2 do if m2[j,k]= m[k,j] then count:=count +1; 
 m2:= perm[0,1] m;
 for j:=1 to 2 do for k:=1 to 2 do if m2[j,k]= m[j,k] then count:=count +1; 
 m2 := trans m;
 for j:=1 to 2 do for k:=1 to 2 do if m2[j,k]= m[k,j] then count:=count +1;
 theta:=0.25; 
 tant:=tan(theta);
 sint:=sin(theta);
 cost:=cos(theta);
 if (v[1]=w[1]) and (v[2]=2) and (w[2]=m3[2,1]) and (m[2,3]=m3[3,2])
 and (sizeof(side) = 2* sizeof(integer)) and (count=20)
 and (tan(theta)= sin(theta)/cos(thetA))
 then writeln('PASS CONF534 section 3.1.3 iota,  trans, perm, sizeof,SIN,TAN,COS ')
 else writeln('FAIL CONF534 section 3.1.3 iota,  trans, perm, sizeof,SIN,TAN,COS  ' );
 
 
end.
