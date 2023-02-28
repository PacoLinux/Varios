unit system;  
{$R-}     
 {  
-----------------------------------------------------------------
Module      : system.pas
Used in     : ILCG Compiler toolbox
Author      : W P Cockshott
Date        : March 2001

	function    :  Global declarations for Pascal Runtime

Copyright (C) WP Cockshott
----------------------------------------------------------------

updates 

11.03.02  Minchar
}
interface
type
      Complex = record data: array[0..1] of real;end;
  
{*
 * Complex math
 *}
var complexzero,complexone:complex;

const 
        BLANK           =' ';
	maxint 		= 2147483647;
	pi 		= 3.1415926535897932385;
	MAXSTRING	=255;	
	MAXREAL		=3.4E38;
	MINREAL		=1.18E-38;
	mindiv		=$80000;
	EPSREAL		=1.0/mindiv;
	MAXDOUBLE	=1.79E308;
	MINDOUBLE	=2.23E-308;
     	MAXCHAR		=chr(65535);
        MINCHAR		=chr(0);
	NILSTR		='';
 	MAXLSTR		= 1000000;
        MAXLOG 		=  8.8029691931113054295988E1;    { log(2**127)  }
        MINLOG 		= -8.872283911167299960540E1;     { log(2**-128) }
        LOG2E  		=  1.4426950408889634073599;     {  1/log(2)    }
	SEEK_SET	=0;
	SEEK_CUR	=1;
	SEEK_END	=2;
	minint64	=-9223372036854775807;
	maxint64	=9223372036854775807;
	PIO2   		=  1.57079632679489661923;       {  pi/2        }
        PIO4   		=  7.85398163397448309616E-1;    {  pi/4        }
        SQRT2  		=  1.41421356237309504880;       {  sqrt(2)     }

type byte = 0..255;
     pdir=pointer;
     pdirentry=pointer;
     shortint= -128..127;
     short = -32000..32000;
     word=0..32000;
     int64 = minint64..maxint64;
     cardinal=0..4294967295;
     longint=integer;
     textline=string[127];
     ascii = 0..127;
     pchar =^ascii;
     pstring=^textline;
     transtab(low,hi:integer)=array[low..hi] of pstring;
     fileptr=text;
     matrix(rows,cols:integer)=array[1..rows,1..cols] of real;
     vector(cols:integer)=array[1..cols] of real;
     genericset=pointer;tsetelem=integer;
    
var  	nil:pointer;
	input,output:fileptr;
	pure function absi(x:integer):integer;
	pure function absr(x:real):real;
	procedure append(var f:fileptr);external;
	pure function  ArcTan              (x:Real):Real;
(*! \begin{bf}The inverse	function of cos.\end{bf} 
	Calculates (approximates) the angle $\theta \in [0..\pi]$), such that $\cos\ \theta= cosVal.$\\
	Returns \begin{em}arccos(cosVal)\end{em} if cosVal $\in$ [-1,1].\\
	Returns the error code \begin{em}-5\end{em} otherwise.
	*)
	pure function arccos (cosVal : real) : real;
(*! \begin{bf}The inverse	function of sin.\end{bf}
	Calculates (approximates) the angle $\theta \in [-\pi/2..\pi/2]$), such that $\sin\ \theta= sinVal.$\\
	Returns \begin{em}arcsin(sinVal)\end{em} if sinVal $\in$ [-1,1].\\
	Returns the error code \begin{em}-5\end{em} otherwise.
	*)
	pure function arcsin (sinVal : real) : real;
	procedure assign	(var f:fileptr;var fname);external;
	procedure blockread	(var f:fileptr;var buf;count:integer; var resultcount:integer);external;
	procedure blockwrite	(var f:fileptr;var buf;count:integer; var resultcount:integer);external;
      	procedure binread	(var f:fileptr;var buf;count:integer);
  	procedure binwrite	(var f:fileptr;var buf;count:integer);
	
 	procedure bounderr(index,limit,ulimit,line:integer);
	procedure chdir		(path:pchar);external;
	procedure close		(var f:fileptr); external name 'pasclose';
	procedure closedir	(d:pdir);external;
	pure function cmplx			(realpart,imag:real):complex;
	pure function complex_add         	(A,B:Complex):complex;
	pure function complex_conjugate  	(A:Complex):complex; 
	pure function complex_subtract 	(A,B:Complex):complex; 
	pure function complex_multiply 	(A,B:Complex):complex;  
	pure function complex_divide 	(A,B:Complex):complex; 
	pure function complex_eq			(A,B:Complex):boolean;
	function complex_2_string	(A:Complex):string;
	function createdset		(rangeslength:integer;var ranges):pointer;external;
	{$ifdef Linux}
	procedure delay		(DTime: integer);  
	{$endif}
	procedure delphiinitvec(var vectorheader; rank,elemsize:integer);external;
	function  endofline	(f:integer):boolean;external;
	function  endoffile	(f:integer):boolean;external;
	function  entryname	(entry:pdirentry):pchar;external;
	function eof		(var f:fileptr):boolean;external name 'pascaleof';
	function eoln		(var f:fileptr):boolean;external;
	procedure erase		(var f:fileptr);external;
	pure function exp(d:real):real;
	function filesize(var f: fileptr):integer;external;
	function filepos(var f:fileptr):integer;external;
	pure function floor(a:double):integer;
	procedure forerrabove(index,limit,ulimit,line:integer);
	procedure forerrbelow(index,limit,ulimit,line:integer);
	procedure fillchar(var x;count :integer; value:integer);
	pure function frac(x:real):real;
	procedure freemem( p:pointer; num:integer);external;	
	procedure getmem(var p:pointer; num:integer); external;
(*! The	functions getnext, getlast and getfirst must never be called on an empty set. The	function
getnext should never be called on the last element of a set. *)
	procedure genericsetnext(var v:tsetelem;s:genericset);
	procedure genericsetfirst(var v:tsetelem;s:genericset);
	procedure genericsetlast(var v:tsetelem;s:genericset);
	function genericsetislast(v:tsetelem;s:genericset):boolean;
	function isemptygenericset(s:genericset):boolean;
	function genericsetnotempty(s:genericset):boolean;
	procedure addtogenericset(var s:genericset;v:tsetelem);
	function genericsetsingleton(singleton:tsetelem):genericset;
	function genericsetunion(s1,s2:genericset):genericset;
	function genericsetdifference(s1,s2:genericset):genericset;
	function genericsetintersection(s1,s2:genericset):genericset;
	function genericsetsymetricdifference(s1,s2:genericset):genericset;
	function genericseteq(s1,s2:genericset):boolean;
	function genericsetneq(s1,s2:genericset):boolean;
	function isin(s:genericset;v:tsetelem):boolean;
	procedure genericsetisin(s:genericset;v:tsetelem;var b:boolean);
	procedure emptygenericset(var newset:genericset);{ set newset to be empty }
	function genericsetle(s1,s2:genericset):boolean;{ s1<=s2}
	function genericsetge(s1,s2:genericset):boolean;

	procedure gettime(var hour,mins,sec,hundredth:integer);external;
	pure function  iipow(base,exponent:integer):integer;
	pure function im(c:complex):real;
	pure function intmod(a,b:integer):integer;
	procedure initvec(var vectorheader; rank,elemsize:integer);external;
	procedure incp(var p:pchar);external name 'incr'; { increments thepointer }     
	pure function int(r:real):integer;
	function ioresult:integer;external;
	function isdir(path:pchar):boolean;external;
	function length(var s):integer;external;
	function makedynamicbitmapreference(var buf;low,high:integer):genericset;
	procedure memset(var x;value:integer; count:integer);external;
	procedure move(var s;var d; len:integer);external;
	pure function odd(i:integer):boolean;
	function opendir(path :pchar):pdir;external;
	procedure page(var t:text);
	function paramcount:integer;external;
	function parampntr(i:integer):pointer; external;
	function paramstr(i:integer):textline;
	procedure pascalexit(code:integer);external;
      
 
	
	 { list of print routines all of which take 4 params: 
	
	   1 f a file handle

	   2 a value to be printed

	   3 a field width

	   4 the number of chars after the decimal point
	   }
	procedure printstring( f:integer;var s;e1,e2:integer);  external;

	procedure printchar(f:integer; c:char;e1,e2:integer);external;
	 
	procedure printreal( f:integer;r:real;e1,e2:integer);external;
	procedure printint( f:integer;i:integer;e1,e2:integer);external;
	procedure printbool(f:integer;b:boolean;e1,e2:integer);external;
	procedure printordinal(f:integer;i,e1,e2:integer; tab:integer);external;
 	procedure printint64(f:integer;i:int64;e1,e2:integer);external;
	procedure println(f:integer{; c:char});external;
	procedure printdouble(f:integer; d:double;e1,e2:integer);external;
        
	procedure readstring( f:integer;var s;length:integer);  external;
	procedure readchar(f:integer;var c:char);external;
	procedure readbyte(f:integer;var b:byte);external;
	procedure readreal( f:integer;var r:real);external;
	procedure readint( f:integer;var i:integer);external;
	procedure readbool(f:integer;var b:boolean);external;
	procedure readordinal(f:integer;var ordinal;tab,tablen:integer);external;
	
	procedure readline(f:integer);external;

	pure function real2cmplx		(realpart:real):complex;
	function  rand:integer;external;
	function  random:integer;
 	procedure randomize;
	pure function  re(c:complex):real;
	function readdir(d:pdir):pdirentry;external;
	procedure reset(var f:fileptr);external;
	procedure rewrite(var f :fileptr);external;
	{ compute base to an integer exponent power }
	pure function  ripow(base:real;exponent:integer):real;
	pure function  rpow(base,exponent:real):real;
 	procedure runerr(errornum,line:integer); 
 	procedure runerror(errornum:integer); 
	function  real_2_string(A:real):string[24];
	function  secs:double;external;{ time in 1/100 seconds since program started }	
	function  seek(var f:fileptr;pos,mode:integer):integer;external;

	(* low level implementation	functions for sets *)

	function  seteq(var s1;var s2; len:integer):boolean;	
	function  setgt(var s1;var s2; len:integer):boolean;	
	function  setge(var s1;var s2; len:integer):boolean;	
	function  setle(var s1;var s2; len:integer):boolean;	
	function  setlt(var s1;var s2; len:integer):boolean;	
	function  setcmprtl(var s1;var s2; len:integer):integer;external;
	function  setneq(var s1;var s2; len:integer):boolean;
	procedure stringassign(var s1; len:integer;var s2);external name 'cstringassign' ;
	procedure stringappend(var s1; len:integer;var s2);external;
	function stringcompare(var s1;var s2 ):integer;external;
	function cstringcompare(var s1;var s2 ):integer;external;
	function strcomp(var s1;var s2):integer;
	function stringlt(var s1;var s2):boolean;
	function stringgt(var s1;var s2):boolean;
	function stringleq(var s1;var s2):boolean;
	function stringgeq(var s1;var s2):boolean;
	function stringeq(var s1;var s2):boolean;
	function stringneq(var s1;var s2):boolean;
	function stringconcat(s1,s2:string):string;
	function StrPas(Src: PChar): textline;
	function strcat(left,right:PChar):pchar;
	function strlen(s:pchar):integer;
	pure function sqr(x:double):double;
	function substring(s:string;i,j:integer):string;
	function stringmult(s:string;i:integer):string;
	function stringmultr(i:integer; s:string):string;
	pure function  trunc(x:DOUBLE):integer;
	
	pure function int2complex(i:integer):complex;
	procedure u2asciitrunc(var astring; var asciibuffer);external;
	procedure unicodestring2ascii(s:string;var asciibuffer);
 	procedure halt(errornum:integer);
{	Standard operators on complex numbers 	}

{       String operators }
operator        *	=	stringmult, 1;
operator	*	=	stringmultr,1;
operator	cast	=	strpas;
operator 	+	=	strcat,nil; 
operator	+	= 	stringconcat,nilstr;
operator 	cast	=	complex_2_string;
operator	mod	= 	intmod,1;

{		symbol		function		identity element }
operator 	+ 	= 	Complex_add, 		complexzero;
operator	/	=	complex_divide,		complexone;
operator	*	=	complex_multiply,	complexone;
operator	-	=	complex_subtract,	complexzero;
operator    =   =   complex_eq;
operator	cast	=	real2cmplx ;
operator        cast    =       int2complex;
	pure function double2float(d:double):real;external;
operator 	cast	= 	double2float;

implementation
	procedure fillchar(var x; count :integer; value:integer);
		
	begin
		memset(x,value,count);
	end;
	pure function  trunc(x:DOUBLE):integer;
	var a:integer;
	begin
	      a:=round(x); 
              if(x>0.0) then 
              begin
		 if(a>x )then  trunc:= a-1 else trunc:= a;
	      end
	      else if(a<x) then trunc:= a+1
	      else trunc := round(x);
	end;
	pure function floor(a:DOUBLE):integer;
	begin
	if a <0.0 then floor:= - trunc(0.0- a)-1 else floor:= trunc(a)
	end;
	pure function intmod(a,b:integer):integer; 
        var r:integer;
	begin
		if b<=0 then r:=0 else
	    r:= a -(a div b)*b;
		if (a<0) and (r<>0) then  r:= r+b;
       
	
        
        intmod:=r; 
	end;
    	 
	procedure unicodestring2ascii(s:string;var asciibuffer);
	begin u2asciitrunc(s,asciibuffer) end;
	function paramstr(i:integer):textline;
	var s:textline;p:pointer;
	begin
		p:=parampntr(i);
		s:= strpas(p );
		paramstr:=s;
	end;
	pure function int2complex(i:integer):complex;
	var c:complex;
	begin 
		c.data[0]:=i; c.data[1]:=0;
		int2complex:=c;
	end;	
	
	pure function complex_eq(A,B:complex):boolean;
    begin
		complex_eq:=( re(A)=re(B)) and (im(A)=im(B));
    end;
	function complex_2_string(A:complex):string;
	begin 
	{	write(re(a),im(a));} 
		complex_2_string := real_2_string(re(A))+'j'+real_2_string(im(A)); 
	end;
	pure function digit(I:integer):char;begin digit := chr(ord('0')+(i mod  10)) end;
	function int_2_string(i:integer):string;
	var s:string;n:boolean;
	begin

		s:='';
		if i<0 then begin n:=true; i := - i; end else n:=false;
		while i>0 do begin
			s:= digit(i mod 10);
			i:= i div 10;
		end;
		if n then int_2_string:= '-'+s else int_2_string:=s;
	end;


	function stringmultr(i:integer; s:string):string;
	begin stringmultr:= s * i; end;
	function stringmult(s:string; i:integer):string;
        begin
		if i<1 then stringmult:=''
		else if i=1 then stringmult:=s
		else stringmult:= s+stringmult(s,i-1);
	end;
	function stringconcat(s1,s2:string):string;
	var s:string;
	    i,j,l:integer;
	begin
		s:=s1;
		l:=length(s2);
		j:=length(s);
		for i:=1 to l do
			if j+i<maxstring then s[j+i]:=s2[i];
		s[0]:= (j+l) min (maxstring);
		stringconcat:=s;
	end;
			
	type lstr = array[0..MAXLSTR] of  ascii;
	    cheat=record
			case x:boolean of
			true:(p:pchar;);
			false:(pa:^lstr);
		end;
	function strlen(s:pchar):integer;
	var map:cheat;i:integer;
	begin	if s=nil then strlen :=0 else
		with map do begin
			p:=s;
			i:=0;
			while (i<MAXLSTR) and( pa^[i]<>(0)) do i:=i+1;
			strlen:=i;
		end;
	end;
	procedure page(var t:text);begin write(t ,chr(12),chr(11));end;
        type bytearray= array[0..255] of byte;
             pbytearray=^bytearray;
        

 	procedure binwrite(var f:fileptr;var buf;count:integer);
	var res:integer;
	begin
		blockwrite(f,buf,count,res);
		if(res<>count)then
		begin write('binary file output error');
		      pascalexit(400);
		end;
	end;
	procedure binread(var f:fileptr;var buf;count:integer);
	var res:integer;
	    	procedure setiores(resultcode:integer);external;
	begin
		blockread(f,buf,count,res);
		if(res<>count)then setiores(5);
	 
	end;
	function setneq(var s1;var s2; len:integer):boolean;
	begin setneq:= not seteq(s1,s2,len);end;

	function seteq(var s1;var s2;len :integer):boolean;
	begin seteq:=setcmprtl(s1,s2,len)=0; end;

	function setlt(var s1;var s2;len:integer):boolean;
	var res:integer;
        begin
		res:=setcmprtl(s1,s2,len);

		setlt:= res = -1;
	end;
	function setgt(var s1;var s2;len:integer):boolean;
        begin setgt:=setcmprtl(s1,s2,len)=1;;end;

	function setge(var s1;var s2;len:integer):boolean;
	var res:integer;
        begin
		res:=setcmprtl(s1,s2,len);
		setge:= (res =0) or (res =1) 	;
        end;
	function setle(var s1;var s2;len:integer):boolean;
        begin   
		setle:=  setge(s2,s1,len);
        end;
	function strcomp(var s1;var s2):integer;
	begin 
				strcomp:=stringcompare(s1,s2); 
	end;

	function stringlt(var s1;var s2):boolean;begin stringlt:=strcomp(s1,s2)<0; end;

	function stringgt(var s1;var s2):boolean;begin stringgt:=strcomp(s1,s2)>0; end;

	function stringleq(var s1;var s2):boolean;begin stringleq:=strcomp(s1,s2)<=0; end;

	function stringgeq(var s1;var s2):boolean;begin stringgeq:=strcomp(s1,s2)>=0; end;

	function stringeq(var s1;var s2):boolean;begin stringeq:=strcomp(s1,s2)=0; end;

	function stringneq(var s1;var s2):boolean;begin stringneq:=strcomp(s1,s2)<>0; end;

	function substring(s:string;i,j:integer):string;
	var res:string;
            top:integer;
	begin
		top:=1+j-i;
		res[0]:=chr(top);
		res[1..top]:=s[i..j];
		substring:=res;
	end;





	pure function odd(i:integer):boolean;
	begin odd:= (abs(i) mod 2)= 1; end;

	(* Memory allocation *)
	
	 

	procedure printpointer(p:pointer);external;
	
	 
	(* Maths *)
	{ return the absolute value of an integer }
	pure function absi(x:integer):integer;
	begin
		if x<0 then
			absi:=0-x
		else
			absi:=x;
	end;
	{ returns the absolute value of a real }
	pure function absr(x:real):real;
	begin
		if x<0 then absr:= 0.0-x  else absr:= x ;
	end;
	
	{ return the square of a number }
	pure function sqr(x:double):double;
	var d:double;
	begin 
		 d:=x*x;  
		 sqr:=d;
	end;
	pure function int(r:real):integer;
	begin int := trunc (r); end;
	pure function frac(x:real):real;
     begin frac := x - round(x);end;
	function random:integer;
	begin random:=rand; end;
	
	function ldexp( x: Real; N: Integer):Real;
    {* ldexp() multiplies x by 2**n.                                    *}
    var r : Real;
    begin
      R := 1;
      if N>0 then
         while N>0 do
         begin
            R:=R*2;
            N:=N-1;
         end
      else
        while N<0 do
        begin
           R:=R/2;
           N:=N+1;;
        end;
      ldexp := x * R;
    end;
     type TabCoef = array[0..6] of Real;


	pure function polevl(var x:Real; var Coef:TabCoef; N:Integer):Real;
    {*****************************************************************}
    { Evaluate polynomial                                             }
    {*****************************************************************}
    {                                                                 }
    { SYNOPSIS:                                                       }
    {                                                                 }
    {  int N;                                                         }
    {  double x, y, coef[N+1], polevl[];                              }
    {                                                                 }
    {  y = polevl( x, coef, N );                                      }
    {                                                                 }
    {  DESCRIPTION:                                                   }
    {                                                                 }
    {     Evaluates polynomial of degree N:                           }
    {                                                                 }
    {                       2          N                              }
    {   y  =  C  + C x + C x  +...+ C x                               }
    {          0    1     2          N                                }
    {                                                                 }
    {   Coefficients are stored in reverse order:                     }
    {                                                                 }
    {   coef[0] = C  , ..., coef[N] = C  .                            }
    {              N                   0                              }
    {                                                                 }
    {   The	function p1evl() assumes that coef[N] = 1.0 and is        }
    {   omitted from the array.  Its calling arguments are            }
    {   otherwise the same as polevl().                               }
    {                                                                 }
    {  SPEED:                                                         }
    {                                                                 }
    {   In the interest of speed, there are no checks for out         }
    {   of bounds arithmetic.  This routine is used by most of        }
    {   the	functions in the library.  Depending on available         }
    {   equipment features, the user may wish to rewrite the          }
    {   program in microcode or assembly language.                    }
    {*****************************************************************}
    var ans : Real;
        i   : Integer;

    begin
      ans := Coef[0];
      for i:=1 to N do ans := ans * x + Coef[i];
      polevl:=ans;
    end;



	pure function p1evl(var x:Real; var Coef:TabCoef; N:Integer):Real;
    {                                                           }
    { Evaluate polynomial when coefficient of x  is 1.0.        }
    { Otherwise same as polevl.                                 }
    {                                                           }
    var
        ans : Real;
        i   : Integer;
    begin
      ans := x + Coef[0];
      for i:=1 to N-1 do
        ans := ans * x + Coef[i];
      p1evl := ans;
    end;


	pure function Exp(d:Real):Real;
    {*****************************************************************}
    { Exponential	function                                            }
    {*****************************************************************}
    {                                                                 }
    { SYNOPSIS:                                                       }
    {                                                                 }
    { double x, y, exp();                                             }
    {                                                                 }
    { y = exp( x );                                                   }
    {                                                                 }
    { DESCRIPTION:                                                    }
    {                                                                 }
    { Returns e (2.71828...) raised to the x power.                   }
    {                                                                 }
    { Range reduction is accomplished by separating the argument      }
    { into an integer k and fraction f such that                      }
    {                                                                 }
    {     x    k  f                                                   }
    {    e  = 2  e.                                                   }
    {                                                                 }
    { A Pade' form of degree 2/3 is used to approximate exp(f)- 1     }
    { in the basic range [-0.5 ln 2, 0.5 ln 2].                       }
    {*****************************************************************}
    const  P : TabCoef = (
           1.26183092834458542160E-4,
           3.02996887658430129200E-2,
           1.00000000000000000000E0, 0.0, 0.0, 0.0, 0.0);
           Q : TabCoef = (
           3.00227947279887615146E-6,
           2.52453653553222894311E-3,
           2.27266044198352679519E-1,
           2.00000000000000000005E0, 0.0 ,0.0 ,0.0);

           C1 = 6.9335937500000000000E-1;
            C2 = 2.1219444005469058277E-4;
    var n : Integer;
        px, qx, xx : Real;
    begin
      if( d > MAXLOG) then
          RunError(205)
      else
      if( d < MINLOG ) then
      begin
        Runerror(205);
      end
      else
      begin

     { Express e**x = e**g 2**n }
     {   = e**g e**( n loge(2) ) }
     {   = e**( g + n loge(2) )  }

        px := d * LOG2E;
        qx := Trunc( px + 0.5 ); { Trunc() truncates toward -infinity. }
        n  := Trunc(qx);
        d  := d - qx * C1;
        d  := d + qx * C2;

      { rational approximation for exponential  }
      { of the fractional part: }
      { e**x - 1  =  2x P(x**2)/( Q(x**2) - P(x**2) )  }
        xx := d * d;
        px := d * polevl( xx, P, 2 );
        d  :=  px/( polevl( xx, Q, 3 ) - px );
        d  := ldexp( d, 1 );
        d  :=  d + 1.0;
        d  := ldexp( d, n );
        Exp := d;
      end;
    end;

	pure function rpow(base,exponent:real):real;
	begin
		rpow:=exp(ln(base)*exponent);
	end;
	pure function iipow(base,exponent:integer):integer;
	begin
		  if exponent=0 then iipow :=1
		  else if exponent>0 then iipow:=iipow(base,exponent-1) * base
		  else iipow:=   1 div iipow(base,-exponent);
	end;
	pure function ripow(base:real;exponent:integer):real;
	begin
		  if exponent=0 then ripow :=1.0
		  else if exponent>0 then ripow:=ripow(base,exponent-1) * base
		  else ripow:=   1.0/ripow(base,-exponent);
	end;
	function time:integer;external;
	procedure srand(seed:integer);external;
	procedure randomize;
	begin
		srand(time);
	end;

	
	
	{ return the length of an asciiz string }
	function strlength(var s:string):integer;
	var c:char;
	begin
		c:=s[0];
		strlength := ord(c); 
	end;



	procedure printspaces( f,spaces:integer);
	var i:integer;
	begin
		for i:=1 to spaces do printchar(f,' ',1,1);
	end;

	procedure halt(code:integer);
	begin
		pascalexit(code);
	end;
 	procedure runerr(errornum,line:integer);
      
	begin
		write('Line ',line);
		
		runerror(errornum);
	end;
	procedure forerrabove(index,llimit,ulimit,line:integer);
	begin
		
		writeln('For loop from ',llimit:6,' to ',ulimit:6,' will be above array bound ',index);
		runerr(201,line);
	end;
 	procedure forerrbelow(index,llimit,ulimit,line:integer);
	begin
		writeln('For loop from ',llimit:6,' to ',ulimit:5,' will be below array bound ',index);
		runerr(201,line);
	end;
	procedure bounderr(index,llimit,ulimit,line:integer);
	begin
		if (index<llimit) or (index>ulimit) then 
		begin
		writeln('Error ',index,' beyond limits ',llimit:5,'..',ulimit:5);
		runerr(201,line);
		end;
	end;
	procedure runerror(errornum:integer);
        VAR E:0..255;
	begin   ERRORNUM:= ERRORNUM and 255;
		E:=ERRORNUM ;
		write( ' error ',e);
		case e of
		201: writeln(' array or subrange bounds error');
		205: writeln(' floating point overflow');
		end;
		writeln;
		halt(errornum);
 	end;

{ Complex arithmetic	functions }

	pure function Complex_subtract (A,B:Complex):complex; Var C:Complex;
{ C = A - B }
Begin
  C.data := A.data - B.data;
  complex_subtract:=c;
End;

	pure function Complex_multiply (A,B:Complex):complex; Var C:Complex;
{ C = A * B }
Begin
  C.data[0] := A.data[0] * B.data[0]  -  A.data[1] * B.data[1];
  C.data[1] := A.data[0] * B.data[1]  +  A.data[1] * B.data[0];
  Complex_multiply:=C;
End;

 

	pure function Complex_divide (A,B:Complex):complex; Var C:Complex;
{ C = A / B }
Var
  Temp:Real;
Begin
  Temp   :=  B.data[0] * B.data[0]  +  B.data[1] * B.data[1];
  C.data[0] := (A.data[0] * B.data[0]  +  A.data[1] * B.data[1]) / Temp;
  C.data[1] := (A.data[1] * B.data[0]  -  A.data[0] * B.data[1]) / Temp;
  Complex_divide:=C;
End;


    

	pure function Complex_Add (A,B:Complex):complex;
var c:complex;
{ C = A + B }
Begin
  C.data  := A.data+B.data;
  
  Complex_add:=c;
End;


	pure function complex_conjugate  (A:Complex):complex; 
var c:complex;
Begin
  C.data[0] := A.data[0];
  C.data[1] :=-A.data[1];
  complex_conjugate:=c;
End;

	pure function cmplx			(realpart,imag:real):complex;
var c:complex;
begin
	c.data[0]:=realpart;c.data[1]:=imag;cmplx:=c;
end;

	pure function real2cmplx(realpart:real):complex;
begin
	real2cmplx:=cmplx(realpart,0);
end;

	pure function re(c:complex):real;begin re:=c.data[0];end;
	pure function im(c:complex):real;begin im:=c.data[1];end;
	procedure setchan(var f:fileptr;i:integer);external;
type timeval = packed record
    sec,usec:longint
  end;
   
{$ifdef Linux}
	procedure Delay(DTime: integer);
{
  Wait for DTime milliseconds.
}
  var p:timeval;
	procedure sel (i:integer;p1,p2,p3:pchar;var w:timeval);external name 'select';
Begin
  
  p.sec:= dtime div 1000;
  p.usec := (dtime mod 1000);
  p.usec := p.usec *1000;

  Sel(0,nil,nil,nil,p);
   
End;
{$endif}
	pure function ArcTan(x:Real):Real;
    {*****************************************************************}
    { Inverse circular tangent (arctangent)                           }
    {*****************************************************************}
    {                                                                 }
    { SYNOPSIS:                                                       }
    {                                                                 }
    { double x, y, atan();                                            }
    {                                                                 }
    { y = atan( x );                                                  }
    {                                                                 }
    { DESCRIPTION:                                                    }
    {                                                                 }
    { Returns radian angle between -pi/2 and +pi/2 whose tangent      }
    { is x.                                                           }
    {                                                                 }
    { Range reduction is from four intervals into the interval        }
    { from zero to  tan( pi/8 ).  The approximant uses a rational     }
    {	function of degree 3/4 of the form x + x**3 P(x)/Q(x).          }
    {*****************************************************************}
    const P : TabCoef = (
          -8.40980878064499716001E-1,
          -8.83860837023772394279E0,
          -2.18476213081316705724E1,
          -1.48307050340438946993E1, 0.0, 0.0, 0.0);
          Q : TabCoef = (
          1.54974124675307267552E1,
          6.27906555762653017263E1,
          9.22381329856214406485E1,
          4.44921151021319438465E1, 0.0, 0.0, 0.0);

    { tan( 3*pi/8 ) }
    T3P8 = 2.41421356237309504880;
    { tan( pi/8 )   }
    TP8 = 0.41421356237309504880;

    var y,z  : Real;
        Sign : Integer;

    begin
      { make argument positive and save the sign }
      sign := 1;
      if( x < 0.0 ) then
      begin
       sign := -1;
       x := -x;
      end;

      { range reduction }
      if( x > T3P8 ) then
      begin
        y := PIO2;
        x := -( 1.0/x );
      end
      else if( x > TP8 ) then
      begin
        y := PIO4;
        x := (x-1.0)/(x+1.0);
      end
      else
       y := 0.0;

      { rational form in x**2 }

      z := x * x;
      y := y + ( polevl( z, P, 3 ) / p1evl( z, Q, 4 ) ) * z * x + x;

      if( sign < 0 ) then
        y := -y;
      Arctan := y;
    end;
const
	errorMargin = 0.00002; {The acceptable level of error for the approximation}

	pure function arccos (cosVal : real) : real;
var 
	tau, mu, phi : real;
begin
	tau := pi;{Set upper bound for the angle.}
	mu := 0;{Set lower bound for the angle.}
	
	if (cosVal < cos tau) then {If cosVal is below the range of the domain, then assume the sought value is pi.}
		arccos:= pi;
	if (cosVal > cos mu) then {If cosVal is above the range of the domain, then assume the sought value is 0.}
		arccos:= 0;
	if (cosVal > (cos mu) + errorMargin) or (cosVal < (cos tau) - errorMargin) then {If cosVal is outside the range with a noticable margin, return an error value.}
		arccos:= -5;
	if (cosVal > cos tau) and (cosVal < cos mu) then {If cosVal is in the valid range the search for arccos cosVal.}
	begin
		while cosVal - cos tau > errorMargin do {Do a binary search (in the angle range) until cos of the upper bound is sufficiently close to cosVal.}
		begin
			phi := (mu + tau) / 2;
			if cosVal < cos phi then
				mu := phi
			else
				tau := phi
		end;
		arccos:= tau;
	end;
end;

	pure function arcsin (sinVal : real) : real;
var 
	tau, mu, phi : real;
begin
	tau:= pi/2;{Set upper bound for the angle.}
	mu:= -tau;{Set lower bound for the angle.}

	if (sinVal > sin tau) then {If sinVal is above the range of the domain, then assume the sought value is pi/2.}
		arcsin:= pi/2;
	if (sinVal < sin mu) then {If sinVal is below the range of the domain, then assume the sought value is -pi/2.}
		arcsin:= -pi/2;
	if (sinVal < (sin mu) - errorMargin) or (sinVal > (sin tau) + errorMargin) then {If sinVal is outside the range with a noticable margin, return an error value.}
		arcsin:= -5;
	if (sinVal < sin tau) and (sinVal > sin mu) then {If sinVal is in the valid range the search for arcsin sinVal.}
	begin
		while sinVal - sin mu > errorMargin do {Do a binary search (in the angle range) until sin of the lower bound is sufficiently close to sinVal.}
		begin
			phi := -(mu + tau) / 2;
			if sinVal < sin phi then
				mu := phi
			else
				tau := phi
		end;
		arcsin:= mu;
	end;
end;


pure function Magnitude (A:Complex):real;
Begin
  Magnitude := Sqrt(Sqr(A.data[0]) + Sqr(A.data[1]));
End;

{ Convert strings returned from C into Vector Pascal strings }
	function StrPas(Src: PChar): textline;
	var
	  S : textline;i,l:integer;
          c: char;
	  b:pbytearray;
          cheat:record 
	        case boolean of
                true:(a:pchar);
                false:(b:pbytearray);
		end;
	begin
	  cheat.a:=src;
	  b:=cheat.b;
          l:=strlen(src);
	  l:= l min 255;
	  S[0]:=l;
          for i:=1 to l do s[i]:= chr(b^[i-1]);
	  StrPas := S;
	end;

	function strcat(left,right:pchar):pchar;
	var map:cheat;l,r,n:^lstr;i,k,j:integer;
	begin
		j:=strlen(left);k:=strlen(right);
		if (j+k)=0 then strcat:=nil else
		begin getmem(n,j+k+1);
		map.p:=left;
		if left<> nil then
		for i:=0 to j-1 do n^[i]:= map.pa^[i];
		map.p:=right;
		if right<> nil then
		for i:=j to j+k-1 do n^[i]:= map.pa^[i-j];
		n^[j+k]:=0;
		map.pa:=n;
		strcat:=map.p;
		end;
	end;



	function real_2_string(A:real):string[24];
	var e,i:integer;s:string[24];neg:boolean;w:integer;
  	function pexp:string;
	  begin
		if e<>0 then pexp:='e'+int_2_string(e) else pexp:=''
	  end;
	procedure appendw;
	  begin
			s:=s+ digit(w);
	  end;
	begin   if A=0 then real_2_string:='0' else
		begin
		neg := A<0;
		if neg then A:= A* -1.0;
		if A<1.0 then begin
			e:=0;
			while A<1.0  do begin
				e:= e-1;
				A:= A* 10.0;
			end;
		end else begin
			e:=0;
			while A>10.0 do begin
				e:= e+1;
				A:= A* 0.1;
			end;
		end;
		s:='';
		if neg then s:= '-'; 
		w:=int(A);
		
		appendw;
		if A = w then real_2_string := s+pexp
		else 
		begin
			s:=s+'.';
			for i:=1 to 5 do begin
				A:= 10*A;
				w:= int(A);
				
				appendw;
				A:= A-w;
			end;
			i:=length(s);
			while (s[i]= '0')and(i>length(s)-6) 
			do i:=i-1;	 
			s[0]:=chr(i);	  
		   	real_2_string	:=s+pexp;
		end
		end
	end;
   (*! 
    DYNAMIC SET ROUTINES


	These maintain bitmapped sets on the heap to
        handle those circumstances where the actual type
        of a set with ordinal elements can not be determined
        at compile time.
   *)
type 
     bytearray=array[0..0] of byte;
    
     
     setrec = record
	 	 bottom,top:tsetelem;
		 isstatic:integer;
		 bits:^bytearray;
		end;
	pset=^setrec;
	cheat = record
		case boolean of
		true:(yes:pset;);
		false:(no:pointer);
		end;
	procedure phex(p:pointer);
	var r:record
		case boolean of
		true:(i:integer);
		false:(p:pointer);
		end;
	begin
		r.p:=p;
		write(r.i);
	end;
	function pointer2pset(p:pointer):pset;

	begin
	           pointer2pset:=p;
	end;
	function testbit(P:PSET;J:INTEGER):boolean;
	var nindex,offset,mask:integer;
	begin
		nindex := j - (p^.bottom );
                offset := nindex shr 3;
		mask :=(1 shl (nindex and 7));
                testbit:=(p^.bits^[offset] and mask )<>0 ;
	end;
 	procedure printDset(d:genericset);
	var p:pset;i:integer;
	begin
		p:= pointer2pset(d);
		write(p^.bottom,'..',p^.top,':');
		for i:= p^.bottom to p^.top do
		if testbit(p,i) then write(i:4);
	end;
 	procedure genericsetdispose(d:genericset);
	var p:pset;
	begin
		p:= pointer2pset(d);
		if p^.isstatic=0 then
		freemem(p^.bits,(p^.top-p^.bottom)div 8 +1);
		dispose(p);
	end;
	procedure genericsetisin(s:genericset;v:tsetelem;var b:boolean);
	begin b:=isin(s,v);end;
	function genericsetlt(s1,s2:genericset):boolean;
		var d:genericset;
		begin   d:=genericsetdifference(s2,s1);
			genericsetlt:= not isemptygenericset(d) ;
			genericsetdispose(d);
                end;
	function genericsetgt(s1,s2:genericset):boolean;
		begin genericsetgt:=genericsetlt(s2,s1); end;
	function genericsetle(s1,s2:genericset):boolean;
		begin genericsetle:= not genericsetgt(s1,s2); end;
	function genericsetge(s1,s2:genericset):boolean;
		begin genericsetge:=genericsetle(s2,s1) end;
	function genericsetneq(s1,s2:genericset):boolean;
		begin genericsetneq:= not genericseteq(s1,s2); end;
	function genericseteq(s1,s2:genericset):boolean;
		var d:genericset;
		begin	 
			d:=genericsetsymetricdifference(s1,s2);
			if isemptygenericset(d) then
			begin
				genericseteq:=true;
				 
			end
			else
			begin
				genericseteq:=false;
				 
			end;
			genericsetdispose(d);
		 end;

	function genericsetsymetricdifference(s1,s2:genericset):genericset;
        var u,i,d:genericset;
	begin
		  
		u:=genericsetunion(s1,s2);i:=genericsetintersection(s1,s2);
		d:=genericsetdifference(u,i); genericsetdispose(u);genericsetdispose(i);
		genericsetsymetricdifference:=d;
	end;
	function genericsetintersection(s1,s2:genericset):genericset;
	var temp:genericset;
            ps1,ps2:pset;
		procedure rec(p:pset);
		var value:tsetelem;
		begin
			if p<>nil then
		
			with p^ do begin
				for value:= bottom to top do
				if isin(s2,value) and isin(s1,value) then addtogenericset(temp,value);
				
			end
		end;
	begin 
		ps1:=pointer2pset(s1);ps2:=pointer2pset(ps2);
		emptygenericset(temp);
		rec(ps1); 
		genericsetintersection:=temp;
	end;
	function genericsetunion(s1,s2:genericset):genericset;
	var temp:genericset;
		procedure rec(p:pset);
		var value:tsetelem;
		begin
			if p<>nil then
			with p^ do begin
				for value:= bottom to top do
				if isin(s2,value) or isin(s1,value) then addtogenericset(temp,value);
				
			end
		end;
	begin
		
		emptygenericset(temp);
		rec(pointer2pset(s1 ));
		rec(pointer2pset(s2 ));
		genericsetunion:=temp;
	end;
	function genericsetnotempty(s:genericset):boolean;begin genericsetnotempty:=not isemptygenericset(s) end;
	function isemptygenericset(s:genericset):boolean;
	var p:pset;oK:boolean; i:integer;
	begin
		ok:=true;
		p:=pointer2pset(s);
		for i:= p^.bottom to p^.top do ok:=ok and not testbit(p,i);
		isemptygenericset:=ok;
	end;
	procedure emptygenericset(var newset:genericset);
	var p:^setrec;
	begin 
		new(p);
		with p^ do 
		begin
			top:=7;bottom:=0; isstatic:=false;
			new(bits);
			bits^[0]:=0;
		end;
		newset:=p;	
	end;
	
	function isin(s:genericset;v:tsetelem):boolean;
	var ok:boolean;p:pset;
	begin 
	        p:=pointer2pset(s);
		ok:=false;
		if p<>nil then
		with p^ do 
		begin
			ok:= top>=v;
			if ok then ok:= bottom <= v;
			if ok then ok:= testbit(p,v);
		end; 
		isin:=ok
	 end;
	procedure setbit(P:PSET;J:INTEGER);
	var nindex,offset,mask:integer;
	begin
		
		nindex := j - (p^.bottom );
                offset := nindex shr 3;
		mask :=(1 shl (nindex and 7));
                p^.bits^[offset]:=(p^.bits^[offset] or mask ) ;
	end;
	 
          
	procedure addtogenericset(var s:genericset; v:tsetelem);
	{ check if the bitmap is big enough. Extend it by doubling if it is not. then add the bit. }
	var p:pset;count,newtop,newbottom,space,newspace,i:integer;
            bytes:^bytearray;
	begin
		p:=pointer2pset(s);
		with p^ do 
		begin
			if (v>=bottom)and (v<=top) then setbit(p,v)
			else
			begin
				space:=( (top-bottom)div 8) +1;
				newspace:=(space * 2) ;
				getmem(bytes, newspace);
				
				{ check in which direction to extend}
				if v<bottom then
				begin
					newbottom:= (bottom - 8*space) and not 7;
					newtop:=top;
					for i:= 0 to space-1 do bytes^[i]:=0;
					for i:= space to newspace-1 do bytes^[i]:= bits^[i-space];
				end
				else
				begin
					newtop:= (top + 8*space) or 7;
					newbottom:=bottom;
					for i:= 0 to space-1 do bytes^[i]:=bits^[i];
					for i:= space to newspace-1 do bytes^[i]:= 0;
				end;
				if isstatic=0 then freemem(bits,space);
				isstatic:=0;
				bottom:=newbottom;
				top:=newtop;
				bits:=bytes;
				addtogenericset(s,v);
			end;
		 	
		end;
	end;
	procedure removefromgenericset(var s:genericset; v:tsetelem);
	var p,p2:pset;g:genericset;	 nindex,offset,mask:integer;
	begin
		p:=pointer2pset(s);
		if  (v<=p^.top)and(v>=p^.bottom) then begin
		        nindex := v - (p^.bottom );
               	         offset := v shr 3;
			 mask :=(1 shl (nindex and 7));
               		 p^.bits^[offset]:=(p^.bits^[offset] and not mask ) ;
		end;
	end;
	function genericsetsingleton(singleton :tsetelem):genericset;
	var s:genericset;
	begin
		emptygenericset(s);
		addtogenericset(s,singleton);
		genericsetsingleton:= s;
	end;
	function genericsetdifference(s1,s2:genericset):genericset;
	const threshold=2;
	var temp:genericset;
		procedure rec(p:pset);
		var value:integer;
		begin
			if p<>nil then
			with p^ do begin
				for value:=bottom to top do
				if isin(s1,value) and  not isin(s2,value) 	then addtogenericset(temp,value);
				
			end
		end;
	begin
		emptygenericset(temp);
		rec(pointer2pset(s1 ));
		genericsetdifference:=temp;
	end;
	function makedynamicbitmapreference(var buf;low,high:integer):genericset;
	var cheat:record
		case boolean of
		true:(bits:^bytearray); 
		false:(p:pointer);
		end;
            p2s:pset;
	begin
		new(p2s);
		cheat.p:= @buf;
		with p2s^ do 
		begin
			bottom:= low and not 7;
			top:= high or 7;
			bits:=cheat.bits;
			isstatic:=1;
		end;
		makeDynamicBitmapReference:=p2s;
	end;	

var cheater:record
	case boolean of
	true:(x:integer);
	false:(y:pointer);
	end;
begin
 	cheater.x:=0;
	nil:=cheater.y;
	complexzero.data :=0.0;
	complexone.data[0] :=1.0;
        complexone.data[1]:=0;
	setchan(input,0);
	setchan(output,1);
 
end.
 

