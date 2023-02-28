unit system;
{$R-}
 {
---
Module      : system.pas
Used in     : ILCG Compiler toolbox
Author      : W P Cockshott
Date        : March 2001

Function    :  Global declarations for Pascal Runtime

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
     int64 = minint64..maxint64;
     pdir=pointer;
     pdirentry=pointer;
     shortint= -128..127;
     word=0..32000;
     cardinal=0..4294967295;
     longint=integer;
     textline=string[255];
     ascii = 0..127;
     pchar =^ascii;
     
     pstring=^textline;
  {   transtab(low,hi:integer)=array[low..hi] of pstring;   }
     fileptr=text;
  {   matrix(rows,cols:integer)=array[1..rows,1..cols] of real;   }


var    {	nil:pointer;           }
	input,output:fileptr;
	function absi(x:integer):integer;
	function absr(x:real):real;
	procedure append(var f:fileptr);external;
	function  ArcTan              (x:Real):Real;
	procedure assign	(var f:fileptr;var fname);external;
	procedure blockread	(var f:fileptr;var buf;count:integer; var resultcount:integer);external;
	procedure blockwrite	(var f:fileptr;var buf;count:integer; var resultcount:integer);external;
      	procedure binread	(var f:fileptr;var buf;count:integer);
  	procedure binwrite	(var f:fileptr;var buf;count:integer);
	
 	procedure bounderr(index,limit,ulimit,line:integer);
	procedure chdir		(path:pchar);external;
	procedure close		(var f:fileptr); external name 'pasclose';
	procedure closedir	(d:pdir);external;
	function cmplx			(realpart,imag:real):complex;
	function complex_add         	(A,B:Complex):complex;
	function complex_conjugate  	(A:Complex):complex; 
	function complex_subtract 	(A,B:Complex):complex; 
	function complex_multiply 	(A,B:Complex):complex;  
	function complex_divide 	(A,B:Complex):complex; 
	function complex_2_string	(A:Complex):string;
	procedure delay		(DTime: integer);  

	function  endofline	(f:integer):boolean;external;
	function  endoffile	(f:integer):boolean;external;
	function  entryname	(entry:pdirentry):pchar;external;
        function eof		(var f:fileptr):boolean;external;
	function eoln		(var f:fileptr):boolean;external;
	procedure erase		(var f:fileptr);external;
	function exp(d:real):real;
	function filesize(var f: fileptr):integer;external;
	function filepos(var f:fileptr):integer;external;
	procedure forerrabove(index,limit,ulimit,line:integer);
	procedure forerrbelow(index,limit,ulimit,line:integer);
	procedure freemem(var p:pointer; num:integer);external;	
	procedure getmem(var p:pointer; num:integer); external;
	procedure gettime(var hour,mins,sec,hundredth:integer);external;
	function  iipow(base,exponent:integer):integer;
	function im(c:complex):real;
	function intmod(a,b:integer):integer;
	procedure initvec(var vectorheader; rank,elemsize:integer);external;
	procedure inc(var p:pchar);external name 'incr'; { increments thepointer }     
        function int(r:real):integer;
        function ioresult:integer;external;
	function isdir(path:pchar):boolean;external;
	function length(var s):integer;external;
	function odd(i:integer):boolean;
	function opendir(path :pchar):pdir;external;
	function paramcount:integer;external;
	function parampntr(i:integer):pointer; external;
	function paramstr(i:integer):string;
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
	procedure println(f:integer; c:char);external;
	procedure printdouble(f:integer; d:double;e1,e2:integer);external;
        
	procedure readstring( f:integer;var s;length:integer);  external;
	procedure readchar(f:integer;var c:char);external;
	procedure readbyte(f:integer;var b:byte);external;
	procedure readreal( f:integer;var r:real);external;
	procedure readint( f:integer;var i:integer);external;
	procedure readbool(f:integer;var b:boolean);external;
	procedure readordinal(f:integer;var ordinal;tab,tablen:integer);external;
	
	procedure readline(f:integer);external;

	function real2cmplx		(realpart:real):complex;
	function  rand:integer;external;
	function  random:integer;
        procedure randomize;
	function  re(c:complex):real;
	function readdir(d:pdir):pdirentry;external;
	procedure reset(var f:fileptr);external;
	procedure rewrite(var f :fileptr);external;
	{ compute base to an integer exponent power }
	function  ripow(base:real;exponent:integer):real;
	function  rpow(base,exponent:real):real;
 	procedure runerr(errornum,line:integer); 
 	procedure runerror(errornum:integer); 
	function  real_2_string(A:real):string[24];
	function  secs:real;external;{ time in 1/100 seconds since program started }	
        function  seek(var f:fileptr;pos,mode:integer):integer;external;

	(* low level implementation functions for sets *)

	function  seteq(var s1;var s2; len:integer):boolean;	
	function  setgt(var s1;var s2; len:integer):boolean;	
	function  setge(var s1;var s2; len:integer):boolean;	
	function  setle(var s1;var s2; len:integer):boolean;	
	function  setlt(var s1;var s2; len:integer):boolean;	
	function  setcmprtl(var s1;var s2; len:integer):integer;external;
	function  setneq(var s1;var s2; len:integer):boolean;
	procedure stringassign(var s1; len:integer;var s2);external;
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
	function StrPas(Src: PChar): string;
	function strcat(left,right:PChar):pchar;
	function strlen(s:pchar):integer;
	function sqr(x:real):real;
	function substring(s:string;i,j:integer):string;
	function stringmult(s:string;i:integer):string;
	function stringmultr(i:integer;s :string):string;
        function  trunc(x:real):integer;external;
	
	function int2complex(i:integer):complex;
	procedure u2asciitrunc(var astring; var asciibuffer);external;
	procedure unicodestring2ascii(s:string;var asciibuffer);
 	procedure halt(errornum:integer);
{	Standard operators on complex numbers 	}

{       String operators }
{
operator        *	=	stringmult, 1;
operator	*	=	stringmultr,1;
operator	cast	=	strpas;
operator 	+	=	strcat,nil; 
operator	+	= 	stringconcat,nilstr;
operator 	cast	=	complex_2_string;
operator	mod	= 	intmod,1;   }

{		symbol		function		identity element }
{
operator 	+ 	= 	Complex_add, 		complexzero;
operator	/	=	complex_divide,		complexone;
operator	*	=	complex_multiply,	complexone;
operator	-	=	complex_subtract,	complexzero;
operator	cast	=	real2cmplx ;
operator        cast    =       int2complex;

                                      }
implementation
    	function intmod(a,b:integer):integer;
	begin
		intmod:= a- (if a*b<0 then  (( a div b)-1) else   (A div B))*B;
	end;
	procedure unicodestring2ascii(s:string;var asciibuffer);
	begin u2asciitrunc(s,asciibuffer) end;
	function paramstr(i:integer):string;
	var s:string;p:pointer;
	begin
		p:=parampntr(i);
		s:= strpas(p );
		paramstr:=s;
	end;
	function int2complex(i:integer):complex;
	var c:complex;
	begin 
		c.data[0]:=i; c.data[1]:=0;
		int2complex:=c;
	end;	
	

	function complex_2_string(A:complex):string;
	begin 
	{	write(re(a),im(a));} 
		complex_2_string := real_2_string(re(A))+'j'+real_2_string(im(A)); 
	end;
	function digit(I:integer):char;begin digit := chr(ord('0')+(i mod  10)) end;
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





	function odd(i:integer):boolean;
	begin odd:= (i mod 2)= 1; end;

	(* Memory allocation *)
	
	 

	procedure printpointer(p:pointer);external;
	
	 
	(* Maths *)
	{ return the absolute value of an integer }
	function absi(x:integer):integer;
	begin
		if x<0 then
			absi:=0-x
		else
			absi:=x;
	end;
	{ returns the absolute value of a real }
	function absr(x:real):real;
	begin
		if x<0 then absr:= 0.0-x  else absr:= x ;
	end;
	
	{ return the square of a number }
	function sqr(x:real):real;
	begin  sqr:=x*x; 
	end;
	function int(r:real):integer;
	begin int := trunc (r); end;
	
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


    function polevl(var x:Real; var Coef:TabCoef; N:Integer):Real;
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
    {   The function p1evl() assumes that coef[N] = 1.0 and is        }
    {   omitted from the array.  Its calling arguments are            }
    {   otherwise the same as polevl().                               }
    {                                                                 }
    {  SPEED:                                                         }
    {                                                                 }
    {   In the interest of speed, there are no checks for out         }
    {   of bounds arithmetic.  This routine is used by most of        }
    {   the functions in the library.  Depending on available         }
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



    function p1evl(var x:Real; var Coef:TabCoef; N:Integer):Real;
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


    function Exp(d:Real):Real;
    {*****************************************************************}
    { Exponential Function                                            }
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

	function rpow(base,exponent:real):real;
	begin
		rpow:=exp(ln(base)*exponent);
	end;
	function iipow(base,exponent:integer):integer;
	begin
		  if exponent=0 then iipow :=1
		  else if exponent>0 then iipow:=iipow(base,exponent-1) * base
		  else iipow:=   1 div iipow(base,-exponent);
	end;
	function ripow(base:real;exponent:integer):real;
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
		writeln('Error ',index,' beyond limits ',llimit:5,'..',ulimit:5);
		runerr(201,line);
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

{ Complex arithmetic functions }

function Complex_subtract (A,B:Complex):complex; Var C:Complex;
{ C = A - B }
Begin
  C.data := A.data - B.data;
  complex_subtract:=c;
End;

function Complex_multiply (A,B:Complex):complex; Var C:Complex;
{ C = A * B }
Begin
  C.data[0] := A.data[0] * B.data[0]  -  A.data[1] * B.data[1];
  C.data[1] := A.data[0] * B.data[1]  +  A.data[1] * B.data[0];
  Complex_multiply:=C;
End;

 

function Complex_divide (A,B:Complex):complex; Var C:Complex;
{ C = A / B }
Var
  Temp:Real;
Begin
  Temp   :=  B.data[0] * B.data[0]  +  B.data[1] * B.data[1];
  C.data[0] := (A.data[0] * B.data[0]  +  A.data[1] * B.data[1]) / Temp;
  C.data[1] := (A.data[1] * B.data[0]  -  A.data[0] * B.data[1]) / Temp;
  Complex_divide:=C;
End;


    

function Complex_Add (A,B:Complex):complex;
var c:complex;
{ C = A + B }
Begin
  C.data  := A.data+B.data;
  
  Complex_add:=c;
End;


function complex_conjugate  (A:Complex):complex; 
var c:complex;
Begin
  C.data[0] := A.data[0];
  C.data[1] :=-A.data[1];
  complex_conjugate:=c;
End;

function cmplx			(realpart,imag:real):complex;
var c:complex;
begin
	c.data[0]:=realpart;c.data[1]:=imag;cmplx:=c;
end;

function real2cmplx(realpart:real):complex;
begin
	real2cmplx:=cmplx(realpart,0);
end;

function re(c:complex):real;begin re:=c.data[0];end;
function im(c:complex):real;begin im:=c.data[1];end;
procedure setchan(var f:fileptr;i:integer);external;
type timeval = packed record
    sec,usec:longint
  end;
   

Procedure Delay(DTime: integer);
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
 function ArcTan(x:Real):Real;
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
    { function of degree 3/4 of the form x + x**3 P(x)/Q(x).          }
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


Function Magnitude (A:Complex):real;
Begin
  Magnitude := Sqrt(Sqr(A.data[0]) + Sqr(A.data[1]));
End;

{ Convert strings returned from C into Vector Pascal strings }
	function StrPas(Src: PChar): String;
	var
	  S : String;i,l:integer;
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
		{s:=s+ digit(w);}
		appendw;
		if A = w then real_2_string := s+pexp
		else begin
			s:=s+'.';
			for i:=1 to 6 do begin
				A:= 10*A;
				w:= int(A);
				{s:= s+ digit(w);}
				appendw;
				A:= A-w;
			end;
			while s[length(s)]= '0' 
			do s[0]:= pred(s[0]);		  
		   	real_2_string	:=s+pexp;
		end
		end
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
 

