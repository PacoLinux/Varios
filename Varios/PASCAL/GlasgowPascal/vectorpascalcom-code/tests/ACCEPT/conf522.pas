 {  Vector Pascal Acceptance Test
 vec022 tests  predefined types added by Vector Pascal
 
double   These are a subset of the real numbers constrained by the IEEE 64 bit ﬂoating point format.
pixel    These are represented as ﬁxed point binary fractions in the range -1.0 to 1.0.


pchar    Deﬁned as ^char .

byte     These take on the positive integers between 0 and 255.

shortint These take on the signed values between -128 and 127.

word     These take on the positive integers from 0 to 65535.

cardinal These take on the positive integers form 0 to 4292967295, i.e., the most that
         can be represented in a 32 bit unsigned number.
longint   A 32 bit integer, retained for compatibility with Turbo Pascal.

int64     A 64 bit integer.

complex   A complex number with the real and imaginary parts held to 32 bit precision.}
program vec022;
var p:pixel;
    d:double;
    pc:pchar;
    b:byte;
    s:shortint;
    w:word;
    c:cardinal;
    l:longint;
    i:int64; 
begin
	p:= 0.25;
        d:= 1e50;
        new(pc);
	pc^:='p';
	b:=255;
        s:=-128;
        w:=$ffff;
        c:=$80000001;
        l:=maxint;
        i:=$100000000;
        
	writeln('PASS VEC022 section 2.3.1')
         
	
end.

