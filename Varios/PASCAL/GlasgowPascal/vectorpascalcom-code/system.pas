
Unit system;
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

Interface

Type 
  Complex = Record
    data: array[0..1] Of real;
  End;

{*
 * Complex math
 *}

Var complexzero,complexone: complex;

Const 
  BLANK           = ' ';
  maxint   = 2147483647;
  pi   = 3.1415926535897932385;
  MAXSTRING = 255;
  MAXREAL  = 3.4E38;
  MINREAL  = 1.18E-38;
  mindiv  = $80000;
  EPSREAL  = 1.0/mindiv;
  MAXDOUBLE : double = 1.79E308;
  MINDOUBLE : double = 2.23E-308;
  MAXCHAR  = chr(65535);
  MINCHAR  = chr(0);
  NILSTR  = '';
  MAXLSTR  = 10000;
  MAXLOG   =  8.8029691931113054295988E1;    { log(2**127)  }
  MINLOG   = -8.872283911167299960540E1;     { log(2**-128) }
  LOG2E    =  1.4426950408889634073599;     {  1/log(2)    }
  SEEK_SET = 0;
  SEEK_CUR = 1;
  SEEK_END = 2;
  minint64 = -9223372036854775807;
  maxint64 = 9223372036854775807;
  PIO2     =  1.57079632679489661923;       {  pi/2        }
  PIO4     =  7.85398163397448309616E-1;    {  pi/4        }
  SQRT2    =  1.41421356237309504880;       {  sqrt(2)     }

Type byte = 0..255;
  pdir = pointer;
  pdirentry = pointer;
  shortint = -128..127;
  short = -32768..32767;
  word = 0..65535;
  int64 = minint64..maxint64;
  cardinal = 0..4294967295;
  longint = integer;
  textline = string[255];
  ascii = 0..127;
  pchar = ^ascii;
  paramlist=array[0..10] of pchar;
  pstring = ^textline;
  transtab(low,hi:integer) = array[low..hi] Of pstring;
  fileptr = text;
  matrix(rows,cols:integer) = array[1..rows,1..cols] Of real;
  vector(cols:integer) = array[1..cols] Of real;
  genericset = pointer;
  tsetelem = integer;
  tvmt = array[0..100] Of pointer;
  pvmt = ^tvmt;
  objrec = Record
    vmt: pvmt;
  End;
  bytestream = array[1..4096] of byte;
  pobj = ^ objrec;


Var   nil: pointer;
  input,output: fileptr;
  pure Function absi(x:integer): integer;
pure Function absr(x:real): real;
Procedure append(Var f:fileptr);
external;
pure Function  ArcTan              (x:Real): Real;

(*! \begin{bf}The inverse	function of cos.\end{bf}
	Calculates (approximates) the angle $\theta \in [0..\pi]$), such that $\cos\ \theta= cosVal.$\\
	Returns \begin{em}arccos(cosVal)\end{em} if cosVal $\in$ [-1,1].\\
	Returns the error code \begin{em}-5\end{em} otherwise.
	*)
pure Function arccos (cosVal : real) : real;

(*! \begin{bf}The inverse	function of sin.\end{bf}
	Calculates (approximates) the angle $\theta \in [-\pi/2..\pi/2]$), such that $\sin\ \theta= sinVal.$\\
	Returns \begin{em}arcsin(sinVal)\end{em} if sinVal $\in$ [-1,1].\\
	Returns the error code \begin{em}-5\end{em} otherwise.
	*)
pure Function arcsin (sinVal : real) : real;
Procedure assign (Var f:fileptr;Var fname);
external;
Procedure blockread (Var f:fileptr;Var buf;count:integer; Var resultcount:integer);
external;
Procedure blockwrite (Var f:fileptr;Var buf;count:integer; Var resultcount:integer);
external;
Procedure binread (Var f:fileptr;Var buf;count:integer);
Procedure binwrite (Var f:fileptr;Var buf;count:integer);
pure Function bmin(a,b:boolean): boolean;

pure Function bmax(a,b:boolean): boolean;
pure Function bounderr(index,limit,ulimit,line:integer): integer;
Procedure calias (Var dest;size:integer;Var src);external;
Procedure chdir  (path:pchar);external;
Function classis(obj:pointer;ptab:pointer): boolean;
Procedure close  (Var f:fileptr);external name 'pasclose';
Procedure closedir (d:pdir);
external;
pure Function cmplx   (realpart,imag:real): complex;
pure Function complex_add          (A,B:Complex): complex;
pure Function complex_conjugate   (A:Complex): complex;
pure Function complex_subtract  (A,B:Complex): complex;
pure Function complex_multiply  (A,B:Complex): complex;
pure Function complex_divide  (A,B:Complex): complex;
pure Function complex_eq   (A,B:Complex): boolean;
Function complex_2_string (A:Complex): string;
Function createdset  (rangeslength:integer;Var ranges): pointer;external;
 {$ifdef Linux}
Procedure delay  (DTime: integer);
 {$endif}
procedure delete(var s:string; i,n:integer);
Procedure delphiinitvec(Var vectorheader; rank,elemsize:integer);
external;
Function  endofline (f:integer): boolean;
external;
Function  endoffile (f:integer): boolean;
external;
Function  entryname (entry:pdirentry): pchar;
external;
Function eof  (Var f:fileptr): boolean;
external name 'pascaleof';
Function eoln  (Var f:fileptr): boolean;
external;
Procedure erase  (Var f:fileptr);
external;
function exec(fn:pchar; var param:paramlist):integer;external;
function execcommand(Var comm ):integer;external;
pure Function exp(d:real): real;
Function filesize(Var f: fileptr): integer;
external;
Function filepos(Var f:fileptr): integer;
external;
pure Function floor(a:double): integer;
pure Function forerrabove(index,limit,ulimit,line:integer): integer;
pure Function  forerrbelow(index,limit,ulimit,line:integer): integer;
Procedure fillchar(Var x;count :integer; value:integer);
pure Function frac(x:real): real;
Procedure freemem( p:pointer; num:integer);
external;
Procedure getmem(Var p:pointer; num:integer);
external;

(*! The	functions getnext, getlast and getfirst must never be called on an empty set. The	function
getnext should never be called on the last element of a set. *)
Procedure genericsetnext(Var v:tsetelem;s:genericset);
Procedure genericsetfirst(Var v:tsetelem;s:genericset);
Procedure genericsetlast(Var v:tsetelem;s:genericset);
Function genericsetislast(v:tsetelem;s:genericset): boolean;
Function isemptygenericset(s:genericset): boolean;
Function genericsetnotempty(s:genericset): boolean;
Procedure addtogenericset(Var s:genericset;v:tsetelem);
Function genericsetsingleton(singleton:tsetelem): genericset;
Function genericsetunion(s1,s2:genericset): genericset;
Function genericsetdifference(s1,s2:genericset): genericset;
Function genericsetintersection(s1,s2:genericset): genericset;
Function genericsetsymetricdifference(s1,s2:genericset): genericset;
Function genericseteq(s1,s2:genericset): boolean;
Function genericsetneq(s1,s2:genericset): boolean;
Function isin(s:genericset;v:tsetelem): boolean;
Procedure genericsetisin(s:genericset;v:tsetelem;Var b:boolean);
Procedure emptygenericset(Var newset:genericset);{ set newset to be empty }
Function genericsetle(s1,s2:genericset): boolean;{ s1<=s2}
Function genericsetge(s1,s2:genericset): boolean;

Procedure gettime(Var hour,mins,sec,hundredth:integer);
external;

Procedure halt(errornum:integer);
pure Function  iipow(base,exponent:integer): integer;
pure Function im(c:complex): real;
pure Function intmod(a,b:integer): integer;
Procedure initvec(Var vectorheader; rank,elemsize:integer);
external;
Function int_2_string(i:integer): string;
Function int2str(i:integer): string;
Procedure incp(Var p:pchar);
external name 'incr'; { increments thepointer }
pure Function int(r:real): real;
Function ioresult: integer;
external;
Function isdir(path:pchar): boolean;
external;

Function neqnullset(var s; len:integer):boolean;

Function eqnullset(var s; len:integer):boolean;

Function length(Var s): integer;
external;
Function makedynamicbitmapreference(Var buf;low,high:integer): genericset;
Procedure cmemset(Var x;value:integer; count:integer);
external;
Procedure move(Var s;Var d; len:integer);
external;
pure Function odd(i:integer): boolean;
Function opendir(path :pchar): pdir;
external;
Procedure page(Var t:text);
Function paramcount: integer;
external;
Function parampntr(i:integer): pointer;
external;
Function paramstr(i:integer): textline;
Procedure pascalexit(code:integer);
external;




{ list of print routines all of which take 4 params:

	   1 f a file handle

	   2 a value to be printed

	   3 a field width

	   4 the number of chars after the decimal point
	   }
Procedure printstring( f:integer;Var s;e1,e2:integer);
external;

Procedure printchar(f:integer; c:char;e1,e2:integer);
external;
Procedure printreal( f:integer;r:real;e1,e2:integer);
external;
Procedure printint( f:integer;i:integer;e1,e2:integer);
external;
Procedure printbool(f:integer;b:boolean;e1,e2:integer);
external;
Procedure printordinal(f:integer;i,e1,e2:integer; tab:pchar);
external;
Procedure printint64(f:integer;i:int64;e1,e2:integer);
external;
Procedure println(f:integer{; c:char});
external;
Procedure printdouble(f:integer; d:double;e1,e2:integer);
external;
Procedure pvald(  S:textline; Var result:double; Var code :integer);
Procedure pvali(  S:textline; Var result:integer; Var code :integer);
Procedure pvalr(  S:textline; Var result:real; Var code :integer);
Procedure readstring( f:integer;Var s;length:integer);
external;
Procedure readchar(f:integer;Var c:char);
external;
Procedure readbyte(f:integer;Var b:byte);
external;
Procedure readreal( f:integer;Var r:real);
external;
Procedure readint( f:integer;Var i:integer);
external;
Procedure readbool(f:integer;Var b:boolean);
external;
Procedure readordinal(f:integer;Var ordinal;tab,tablen:integer);
external;

Procedure readline(f:integer);
external;

pure Function real2cmplx  (realpart:real): complex;

Function rand:integer;{depends on }Function  crand: integer;external;
Function  random: integer;
Procedure randomize;
pure Function  re(c:complex): real;
Function readdir(d:pdir): pdirentry;
external;
Procedure reset(Var f:fileptr);
external;
Procedure rewrite(Var f :fileptr);
external;
 { compute base to an integer exponent power }
pure Function  ripow(base:real;exponent:integer): real;
pure Function  rpow(base,exponent:real): real;
pure Function runerr(errornum,line:integer): integer;
Procedure runerror(errornum:integer);
Function  real_2_string(A:real): string[24];
Function  secs: double;
external;{ time in 1/100 seconds since program started }
Function  seek(Var f:fileptr;pos,mode:integer): integer;
external;

 (* low level implementation	functions for sets *)

Function  seteq(Var s1;Var s2; len:integer): boolean;
Function  setgt(Var s1;Var s2; len:integer): boolean;
Function  setge(Var s1;Var s2; len:integer): boolean;
Function  setle(Var s1;Var s2; len:integer): boolean;
Function  setlt(Var s1;Var s2; len:integer): boolean;
Function  setcmprtl(Var s1;Var s2; len:integer): integer;
external;
Function  setneq(Var s1;Var s2; len:integer): boolean;
 { functions only used on the playstation 3 }
Procedure speAddVec(r0,r1:integer);
external;
Procedure speMulVec(r0,r1:integer);
external;
Procedure speDivVec(r0,r1:integer);
external;
Procedure speSubVec(r0,r1:integer);
external;
Procedure speRepVec(r0,r1:integer);
external;
Procedure speLoadVec(r0,r1:integer);
external;
Procedure speStoreVec(r0,r1:integer);
external;
Procedure speIntAddVec(r0,r1:integer);
external;
Procedure speIntMulVec(r0,r1:integer);
external;
Procedure speIntDivVec(r0,r1:integer);
external;
Procedure speIntSubVec(r0,r1:integer);
external;
Procedure speIntLoadVec(r0,r1:integer);
external;
Procedure speIntStoreVec(r0,r1:integer);
external;
Procedure speRepIntVec(r0,r1:integer);
external;
Procedure ThreadsInitial;
external;
Procedure speEnd;
external;
Procedure speSQRTFVec(r0,r1:integer);
external;
Procedure stringassign(Var s1; len:integer;Var s2);
external name 'cstringassign' ;
Procedure stringappend(Var s1; len:integer;Var s2);
external;
Function stringcompare(Var s1;Var s2 ): integer;
external name 'cstringcompare';
Function cstringcompare(Var s1;Var s2 ): integer;
external;
Function strcomp(Var s1;Var s2): integer;
Function stringlt(Var s1;Var s2): boolean;
Function stringgt(Var s1;Var s2): boolean;
Function stringleq(Var s1;Var s2): boolean;
Function stringgeq(Var s1;Var s2): boolean;
Function stringeq(Var s1;Var s2): boolean;
Function stringneq(Var s1;Var s2): boolean;
Function stringconcat(s1,s2:String): string;
Function StrPas(Src: PChar): textline;
Function strcat(left,right:PChar): pchar;
Function strlen(s:pchar): integer;
pure Function sqr(x:double): double;
Function substring(s:String;i,j:integer): string;
Function stringmult(s:String;i:integer): string;
Function stringmultr(i:integer; s:String): string;
 
pure Function  trunc(x:DOUBLE): integer;

pure Function int2complex(i:integer): complex;
Procedure u2asciitrunc(Var astring; Var asciibuffer);
external;
Procedure unicodestring2ascii(s:String;Var asciibuffer);


{	Standard operators on complex numbers 	}

{       String operators }
operator        * = stringmult, 1;
operator * = stringmultr,1;
operator cast = strpas;
{operator 	+	=	strcat,nil;}
operator + =  stringconcat,nilstr;
operator  cast = complex_2_string;
operator mod =  intmod,1;
operator    min =   bmin, true;
operator    max =   bmax, true;
{		symbol		function		identity element }
operator  +  =  Complex_add,   complexzero;
operator / = complex_divide,  complexone;
operator * = complex_multiply, complexone;
operator - = complex_subtract, complexzero;
operator    =   =   complex_eq;
operator cast = real2cmplx ;
operator        cast    =       int2complex;
pure Function double2float(d:double): real;
external;
operator  cast =  double2float;
{$IFDEF ARM}
function round(x:double):integer;external  name 'pround';
function sin(x:double):double;external;
function cos(x:double):double;external;
function ln(x:double):double;external name 'pln';
function sqrt(x:double):double;external name 'psqrt';
{$ENDIF}

Implementation

Procedure vald(Var S:textline; Var result:double; Var code :integer);
external;
Procedure vali(Var S:textline; Var result:integer; Var code :integer);
external;
Procedure valr(Var S:textline; Var result:real; Var code :integer);
external;
Procedure pvald(  S:textline; Var result:double; Var code :integer);
Begin
  vald(s,result,code);
End;
Procedure pvali(  S:textline; Var result:integer; Var code :integer);
Begin
  vali(s,result,code);
End;
Procedure pvalr(  S:textline; Var result:real; Var code :integer);
Begin
  valr(s,result,code);
End;


 
Function classis(obj:pointer;ptab:pointer): boolean;

Type  ancestort = Record
  count: integer;
  links: array[0..100] Of pvmt;
End;
panc = ^ancestort;
Function recurse(myclass,possibleancestor:pvmt): boolean;

Var i: integer;
  myancestors: panc;
  ok: boolean;

Begin
  If myclass= possibleancestor Then recurse := true
  Else
    Begin
      {$r-}
      myancestors := myclass^[-1];{$r+}

      If myancestors^.count = 0 Then recurse := false
      Else
        Begin
          ok := false;
          For i:= 0 To myancestors^.count-1 Do
            Begin
              If Not ok Then
                ok :=   recurse(myancestors^.links[i],possibleancestor);

            End;
          recurse := ok;
        End;
    End;

End;

Var p1: pobj;
  p2: pvmt;
Begin
  p1 := obj;
  p2 := ptab;
  classis := recurse (P1^.vmt,p2);
End;
Function rand:integer;begin rand:=crand ; end;
Procedure fillchar(Var x; count :integer; value:integer);

Begin
  cmemset(x,value,count);
End;
pure Function bmin(a,b:boolean): boolean;
Begin
  bmin := a And b
End;

pure Function bmax(a,b:boolean): boolean;
Begin
  bmax := a Or b
End;
pure Function intmod(a,b:integer): integer;

Var r: integer;
Begin
  If b<=0 Then r := 0
  Else
    r := a -(a Div b)*b;
  If (a<0) And (r<>0) Then  r := r+b;
  intmod := r;
  { intmod:= a rem b;}
End;
pure Function  trunc(x:DOUBLE): integer;

Var a: integer;
Begin
  a := round(x);
  If (x>0.0) Then
    Begin
      If (a>x )Then  trunc := a-1
      Else trunc := a;
    End
  Else If (a<x) Then trunc := a+1
  Else trunc := round(x);
End;
pure Function floor(a:DOUBLE): integer;
Begin
  If a <0.0 Then floor := - trunc(0.0- a)-1
  Else floor := trunc(a)
End;


Procedure unicodestring2ascii(s:String;Var asciibuffer);
Begin
  u2asciitrunc(s,asciibuffer)
End;
Function paramstr(i:integer): textline;

Var s: textline;
  p: pointer;
Begin
  p := parampntr(i);
  s := strpas(p );
  paramstr := s;
End;
pure Function int2complex(i:integer): complex;

Var c: complex;
Begin
  c.data[0] := i;
  c.data[1] := 0;
  int2complex := c;
End;

pure Function complex_eq(A,B:complex): boolean;
Begin
  complex_eq := ( re(A)=re(B)) And (im(A)=im(B));
End;
Function complex_2_string(A:complex): string;
Begin
 {	write(re(a),im(a));}
  complex_2_string := real_2_string(re(A))+'j'+real_2_string(im(A));
End;
pure Function digit(I:integer): char;
Begin
  digit := chr(ord('0')+(i Mod  10))
End;
Function int2str(i:integer):string;
begin
    int2str:=int_2_string(i);
end;
Function int_2_string(i:integer): string;

Var s: string;
  n: boolean;
Begin

  s := '';
  If i<0 Then
    Begin
      n := true;
      i := - i;
    End
  Else n := false;
  if i=0 then s:='0' else
  While i>0 Do
    Begin
      s := digit(i Mod 10)+s;
      i := i Div 10;
    End;
  If n Then int_2_string := '-'+s
  Else int_2_string := s;
End;

procedure delete(var s:string; i,n:integer);
var j:integer;
begin
	for j:= i+n to length(s) do
	 s[j-n]:=s[j];
	s[0]:= chr(length(s)-n);
end;

Function stringmultr(i:integer; s:String): string;
Begin
  stringmultr := s * i;
End;
Function stringmult(s:String; i:integer): string;
Begin
  If i<1 Then stringmult := ''
  Else If i=1 Then stringmult := s
  Else stringmult := s+stringmult(s,i-1);
End;
Function stringconcat(s1,s2:String): string;

Var s: string;
  i,j,l: integer;
Begin
  s := s1;
  l := length(s2);
  j := length(s);
  For i:=1 To l Do
    If j+i<maxstring Then s[j+i] := s2[i];
  s[0] := (j+l) min (maxstring);
  stringconcat := s;
End;

Type lstr = array[0..MAXLSTR] Of  ascii;
  cheat = Record
    Case x:boolean Of 
      true: (p:pchar;);
      false: (pa:^lstr);
    End;
    Function strlen(s:pchar): integer;

    Var map: cheat;
      i: integer;
    Begin
      If s=Nil Then strlen := 0
      Else
        With map Do
          Begin
            p := s;
            i := 0;
            While (i<MAXLSTR) And( pa^[i]<>(0)) Do
              i := i+1;
            strlen := i;
          End;
    End;
    Procedure page(Var t:text);
    Begin
      write(t ,chr(12),chr(11));
    End;

    Type bytearray = array[0..255] Of byte;
      pbytearray = ^bytearray;


    Procedure binwrite(Var f:fileptr;Var buf;count:integer);

    Var res: integer;
    Begin
      blockwrite(f,buf,count,res);
      If (res<>count)Then
        Begin
          write('binary file output error');
          pascalexit(400);
        End;
    End;
    Procedure binread(Var f:fileptr;Var buf;count:integer);

    Var res: integer;
    Procedure setiores(resultcode:integer);
    external;
    Begin
      blockread(f,buf,count,res);
      If (res<>count)Then setiores(5);

    End;
    Function setneq(Var s1;Var s2; len:integer): boolean;
    Begin
      setneq := Not seteq(s1,s2,len);
    End;

    Function seteq(Var s1;Var s2;len :integer): boolean;
    Begin
      seteq := setcmprtl(s1,s2,len)=0;
    End;

    Function setlt(Var s1;Var s2;len:integer): boolean;

    Var res: integer;
    Begin
      res := setcmprtl(s1,s2,len);

      setlt := res = -1;
    End;
    Function setgt(Var s1;Var s2;len:integer): boolean;
    Begin
      setgt := setcmprtl(s1,s2,len)=1;;
    End;

    Function setge(Var s1;Var s2;len:integer): boolean;

    Var res: integer;
    Begin
      res := setcmprtl(s1,s2,len);
      setge := (res =0) Or (res =1)  ;
    End;
    Function neqnullset(var s; len:integer):boolean;
    label 99;
	 type intstream = array[0..1024] of integer;
     var p:^bytestream;
         pi:^intstream;
		b:byte;
		i,a,l:integer;
	begin
		{$r-}

                pi:=@s;
                for l:= (len shr 2)-1 downto 0  do
		begin
			if pi^[l]<>0 then
			begin
				neqnullset:=true; goto 99;
			end;
		end;


                 { 
                 l:= len shr 2;
		
		 while l>0 do
		 begin
			l:=l-1;
			if pi^[l]<>0 then
			begin neqnullset:=true; goto 99;end;
		 end;{}
		 p:=@s; 
		b:=0;
		for i:=(len and $fffffffc) to len do b:=b or p^[i];
		{$r+}
	    neqnullset:=( b)<>0; 
	    99:
	end;
	Function eqnullset(var s; len:integer):boolean;
	
	 label 99;
	 type intstream = array[0..1024] of integer;
     var p:^bytestream;
         pi:^intstream;
		b:byte;
		i,a,l:integer;
	begin
		{$r-}
		l:= len shr 2;
		 pi:=@s;{ a:=0;
		 for i:=l-1 downto 0 do a:=a or Pi^[i];
		 
		 if a<>0 then
			begin eqnullset:=false; goto 99;end;}
		 while l>0 do
		 begin
			l:=l-1;
			if pi^[l]<>0 then
			begin eqnullset:=false; goto 99;end;
		 end;{}
		 p:=@s; 
		b:=0;
		for i:=(len and $fffffffc) to len do b:=b or p^[i];
		{$r+}
	    eqnullset:=( b)=0; 
	    99:
	end;
    Function setle(Var s1;Var s2;len:integer): boolean;
    Begin
      setle :=  setge(s2,s1,len);
    End;
    Function strcomp(Var s1;Var s2): integer;
    Begin
      strcomp := cstringcompare(s1,s2);
    End;

    Function stringlt(Var s1;Var s2): boolean;
    Begin
      stringlt := strcomp(s1,s2)<0;
    End;

    Function stringgt(Var s1;Var s2): boolean;
    Begin
      stringgt := strcomp(s1,s2)>0;
    End;

    Function stringleq(Var s1;Var s2): boolean;
    Begin
      stringleq := strcomp(s1,s2)<=0;
    End;

    Function stringgeq(Var s1;Var s2): boolean;
    Begin
      stringgeq := strcomp(s1,s2)>=0;
    End;

    Function stringeq(Var s1;Var s2): boolean;
    Begin
      stringeq := strcomp(s1,s2)=0;
    End;

    Function stringneq(Var s1;Var s2): boolean;
    Begin
      stringneq := strcomp(s1,s2)<>0;
    End;

    Function substring(s:String;i,j:integer): string;

    Var res: string;
      top: integer;
    Begin
      top := 1+j-i;
      res[0] := chr(top);
      res[1..top] := s[i..j];
      substring := res;
    End;





    pure Function odd(i:integer): boolean;
    Begin
      odd := (abs(i) Mod 2)= 1;
    End;

 (* Memory allocation *)



    Procedure printpointer(p:pointer);
    external;


 (* Maths *)
 { return the absolute value of an integer }
    pure Function absi(x:integer): integer;
    Begin
      If x<0 Then
        absi := 0-x
      Else
        absi := x;
    End;
 { returns the absolute value of a real }
    pure Function absr(x:real): real;
    Begin
      If x<0 Then absr := 0.0-x
      Else absr := x ;
    End;

 { return the square of a number }
    pure Function sqr(x:double): double;

    Var d: double;
    Begin
      d := x*x;
      sqr := d;
    End;
    pure Function int(r:real): real;
    Begin
      int := trunc (r);
    End;
    pure Function frac(x:real): real;
    Begin
      frac := x - round(x);
    End;
    Function random: integer;
    Begin
      random := rand;
    End;

    Function ldexp( x: Real; N: Integer): Real;
    {* ldexp() multiplies x by 2**n.                                    *}

    Var r : Real;
    Begin
      R := 1;
      If N>0 Then
        While N>0 Do
          Begin
            R := R*2;
            N := N-1;
          End
          Else
            While N<0 Do
              Begin
                R := R/2;
                N := N+1;;
              End;
      ldexp := x * R;
    End;

    Type TabCoef = array[0..6] Of Real;


      pure Function polevl(Var x:Real; Var Coef:TabCoef; N:Integer): Real;
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

    Var ans : Real;
      i   : Integer;

    Begin
      ans := Coef[0];
      For i:=1 To N Do
        ans := ans * x + Coef[i];
      polevl := ans;
    End;



    pure Function p1evl(Var x:Real; Var Coef:TabCoef; N:Integer): Real;
    {                                                           }
    { Evaluate polynomial when coefficient of x  is 1.0.        }
    { Otherwise same as polevl.                                 }
    {                                                           }

    Var 
      ans : Real;
      i   : Integer;
    Begin
      ans := x + Coef[0];
      For i:=1 To N-1 Do
        ans := ans * x + Coef[i];
      p1evl := ans;
    End;


    pure Function Exp(d:Real): Real;
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

    Const  P : TabCoef = (
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

    Var n : Integer;
      px, qx, xx : Real;
    Begin
      If ( d > MAXLOG) Then
        RunError(205)
      Else
        If ( d < MINLOG ) Then
          Begin
            Runerror(205);
          End
      Else
        Begin

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
        End;
    End;

    pure Function rpow(base,exponent:real): real;
    Begin
      rpow := exp(ln(base)*exponent);
    End;
    pure Function iipow(base,exponent:integer): integer;
    Begin
      If exponent=0 Then iipow := 1
      Else If exponent>0 Then iipow := iipow(base,exponent-1) * base
      Else iipow :=   1 Div iipow(base,-exponent);
    End;
    pure Function ripow(base:real;exponent:integer): real;
    Begin
      If exponent=0 Then ripow := 1.0
      Else If exponent>0 Then ripow := ripow(base,exponent-1) * base
      Else ripow :=   1.0/ripow(base,-exponent);
    End;
    Function time:integer;{depends on } Function ctimes: integer;external;
    begin
		time:= ctimes;
	end;
    Procedure csrand(seed:integer);
    external;
    Procedure randomize;
    Begin
      csrand(time);
    End;
    


 { return the length of an asciiz string }
    Function strlength(Var s:String): integer;

    Var c: char;
    Begin
      c := s[0];
      strlength := ord(c);
    End;



    Procedure printspaces( f,spaces:integer);

    Var i: integer;
    Begin
      For i:=1 To spaces Do
        printchar(f,' ',1,1);
    End;

    Procedure halt(code:integer);
    Begin
      pascalexit(code);
    End;
    pure Function runerr(errornum,line:integer): integer;

    Begin
      write('Line ',line);

      runerror(errornum);
      runerr := errornum;
    End;
    pure Function forerrabove(index,llimit,ulimit,line:integer): integer;
    Begin

      writeln('For loop from ',llimit:6,' to ',ulimit:6,' gives index  above an array bound ',index)
      ;
      forerrabove := runerr(201,line);

    End;
    pure Function forerrbelow(index,llimit,ulimit,line:integer): integer;
    Begin
      writeln('For loop from ',llimit:6,' to ',ulimit:5,' gives index  below an array bound ',index)
      ;

      forerrbelow := runerr(201,line);
    End;
    pure Function bounderr(index,llimit,ulimit,line:integer): integer;
    Begin
      If (index<llimit) Or (index>ulimit) Then
        Begin
          writeln('Error ',index,' beyond limits ',llimit:5,'..',ulimit:5);
          bounderr := runerr(201,line);
        End
      Else
        bounderr := 0;
    End;
    Procedure runerror(errornum:integer);

    Var E: 0..255;
    Begin
      ERRORNUM := ERRORNUM And 255;
      E := ERRORNUM ;
      write( ' error ',e);
      Case e Of 
        201: writeln(' array or subrange bounds error');
        205: writeln(' floating point overflow');
      End;
      writeln;
      halt(errornum);
    End;

{ Complex arithmetic	functions }

    pure Function Complex_subtract (A,B:Complex): complex;

    Var C: Complex;
{ C = A - B }
    Begin
      C.data := A.data - B.data;
      complex_subtract := c;
    End;

    pure Function Complex_multiply (A,B:Complex): complex;

    Var C: Complex;
{ C = A * B }
    Begin
      C.data[0] := A.data[0] * B.data[0]  -  A.data[1] * B.data[1];
      C.data[1] := A.data[0] * B.data[1]  +  A.data[1] * B.data[0];
      Complex_multiply := C;
    End;



    pure Function Complex_divide (A,B:Complex): complex;

    Var C: Complex;
{ C = A / B }

    Var 
      Temp: Real;
    Begin
      Temp   :=  B.data[0] * B.data[0]  +  B.data[1] * B.data[1];
      C.data[0] := (A.data[0] * B.data[0]  +  A.data[1] * B.data[1]) / Temp;
      C.data[1] := (A.data[1] * B.data[0]  -  A.data[0] * B.data[1]) / Temp;
      Complex_divide := C;
    End;




    pure Function Complex_Add (A,B:Complex): complex;

    Var c: complex;
{ C = A + B }
    Begin
      C.data  := A.data+B.data;

      Complex_add := c;
    End;


    pure Function complex_conjugate  (A:Complex): complex;

    Var c: complex;
    Begin
      C.data[0] := A.data[0];
      C.data[1] := -A.data[1];
      complex_conjugate := c;
    End;

    pure Function cmplx   (realpart,imag:real): complex;

    Var c: complex;
    Begin
      c.data[0] := realpart;
      c.data[1] := imag;
      cmplx := c;
    End;

    pure Function real2cmplx(realpart:real): complex;
    Begin
      real2cmplx := cmplx(realpart,0);
    End;

    pure Function re(c:complex): real;
    Begin
      re := c.data[0];
    End;
    pure Function im(c:complex): real;
    Begin
      im := c.data[1];
    End;
    Procedure setchan(Var f:fileptr;i:integer);
    external;

    Type timeval = packed Record
      sec,usec: longint
    End;

{$ifdef Linux}
    Procedure Delay(DTime: integer);
{
  Wait for DTime milliseconds.
}

    Var p: timeval;
    Procedure sel (i:integer;p1,p2,p3:pchar;Var w:timeval);
    external name 'select';
    Begin

      p.sec := dtime Div 1000;
      p.usec := (dtime Mod 1000);
      p.usec := p.usec *1000;

      Sel(0,Nil,Nil,Nil,p);

    End;
{$endif}
    pure Function ArcTan(x:Real): Real;
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

    Const P : TabCoef = (
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

    Var y,z  : Real;
      Sign : Integer;

    Begin
      { make argument positive and save the sign }
      sign := 1;
      If ( x < 0.0 ) Then
        Begin
          sign := -1;
          x := -x;
        End;

      { range reduction }
      If ( x > T3P8 ) Then
        Begin
          y := PIO2;
          x := -( 1.0/x );
        End
      Else If ( x > TP8 ) Then
             Begin
               y := PIO4;
               x := (x-1.0)/(x+1.0);
             End
      Else
        y := 0.0;

      { rational form in x**2 }

      z := x * x;
      y := y + ( polevl( z, P, 3 ) / p1evl( z, Q, 4 ) ) * z * x + x;

      If ( sign < 0 ) Then
        y := -y;
      Arctan := y;
    End;

    Const 
      errorMargin = 0.00002; {The acceptable level of error for the approximation}

      pure Function arccos (cosVal : real) : real;

    Var 
      tau, mu, phi : real;
    Begin
      tau := pi;{Set upper bound for the angle.}
      mu := 0;{Set lower bound for the angle.}

      If (cosVal < cos (tau)) Then
        {If cosVal is below the range of the domain, then assume the sought value is pi.}
        arccos := pi;
      If (cosVal > cos (mu) )Then
        {If cosVal is above the range of the domain, then assume the sought value is 0.}
        arccos := 0;
      If (cosVal > (cos (mu)) + errorMargin) Or (cosVal < (cos( tau) )- errorMargin) Then
        {If cosVal is outside the range with a noticable margin, return an error value.}
        arccos := -5;
      If (cosVal > cos (tau) )And (cosVal < cos (mu)) Then
        {If cosVal is in the valid range the search for arccos cosVal.}
        Begin
          While cosVal - cos (tau )> errorMargin Do
{Do a binary search (in the angle range) until cos of the upper bound is sufficiently close to cosVal.}
            Begin
              phi := (mu + tau) / 2;
              If cosVal < cos (phi )Then
                mu := phi
              Else
                tau := phi
            End;
          arccos := tau;
        End;
    End;

    pure Function arcsin (sinVal : real) : real;

    Var 
      tau, mu, phi : real;
    Begin
      tau := pi/2;{Set upper bound for the angle.}
      mu := -tau;{Set lower bound for the angle.}

      If (sinVal > sin (tau) )Then
        {If sinVal is above the range of the domain, then assume the sought value is pi/2.}
        arcsin := pi/2;
      If (sinVal < sin (mu)) Then
        {If sinVal is below the range of the domain, then assume the sought value is -pi/2.}
        arcsin := -pi/2;
      If (sinVal < (sin (mu)) - errorMargin) Or (sinVal > (sin (tau)) + errorMargin) Then
        {If sinVal is outside the range with a noticable margin, return an error value.}
        arcsin := -5;
      If (sinVal < sin( tau)) And (sinVal > sin( mu)) Then
        {If sinVal is in the valid range the search for arcsin sinVal.}
        Begin
          While sinVal - sin (mu )> errorMargin Do
{Do a binary search (in the angle range) until sin of the lower bound is sufficiently close to sinVal.}
            Begin
              phi := -(mu + tau) / 2;
              If sinVal < sin (phi )Then
                mu := phi
              Else
                tau := phi
            End;
          arcsin := mu;
        End;
    End;


    pure Function Magnitude (A:Complex): real;
    Begin
      Magnitude := Sqrt(Sqr(A.data[0]) + Sqr(A.data[1]));
    End;

{ Convert strings returned from C into Vector Pascal strings }
    Function StrPas(Src: PChar): textline;

    Var 
      S : textline;
      i,l: integer;
      c: char;
      b: pbytearray;
      cheat: Record
        Case boolean Of 
          true: (a:pchar);
          false: (b:pbytearray);
        End;
        Begin
          cheat.a := src;
          b := cheat.b;
          l := strlen(src);
          l := l min 255;
          S[0] := l;
          For i:=1 To l Do
            s[i] := chr(b^[i-1]);
          StrPas := S;
        End;

        Function strcat(left,right:pchar): pchar;

        Var map: cheat;
          l,r,n: ^lstr;
          i,k,j: integer;
        Begin
          j := strlen(left);
          k := strlen(right);
          If (j+k)=0 Then strcat := Nil
          Else
            Begin
              getmem(n,j+k+1);
              map.p := left;
              If left<> Nil Then
                For i:=0 To j-1 Do
                  n^[i] := map.pa^[i];
              map.p := right;
              If right<> Nil Then
                For i:=j To j+k-1 Do
                  n^[i] := map.pa^[i-j];
              n^[j+k] := 0;
              map.pa := n;
              strcat := map.p;
            End;
        End;
		type bytes=array[1..24] of byte;

        procedure real2str(x:real;var buf:bytes);external;
        Function real_2_string(A:real): string[24];        
          var buf:bytes;s:string[24];i:integer;
          begin
			real2str(a,buf);
			i:=1;
			s:='';
			while buf[i]>0 do
			begin
				s:=s+chr(buf[i]);
				i:=i+1;
			end;
			real_2_string:=s;
		end;
(*
        Var e,i: integer;
          s,sf : string[24];
          neg: boolean;
          w,k: integer;
        Function pexp: string;
        Begin
          If e<>0 Then pexp := 'e'+int_2_string(e)
          Else pexp := ''
        End;
        Procedure appendw;
        Begin
          s := s+ digit(w);
        End;
        Begin
          If A=0 Then real_2_string := '0'
          Else
            Begin
              neg := A<0;
              If neg Then A := A* -1.0;
              If A<1.0 Then
                Begin
                  e := 0;
                  While A<1.0  Do
                    Begin
                      e := e-1;
                      A := A* 10.0;
                    End;
                End
              Else
                Begin
                  e := 0;
                  While A>=10.0 Do
                    Begin
                      e := e+1;
                      A := A* 0.1;
                    End;
                End;
              s := '';
              If neg Then s := '-';
              w := round( (A));

              appendw;

              If A = w Then real_2_string := s+pexp
              Else
                Begin
                  s := s+'.';
                  A := (A-w)*100000;
                  sf := int_2_string(round(A));
                  k := 5-length(sf);
                  For i:=1 To k Do
                    s := s+ ' ';
                  s := s+int_2_string(round(A));

                  i := length(s);
                  While (s[i]= '0')And(i>length(s)-6) 
                    Do
                    i := i-1;
                  s[0] := chr(i);
                  real_2_string := s+pexp;
                End
            End
        End;
*)
(*!
    DYNAMIC SET ROUTINES


	These maintain bitmapped sets on the heap to
        handle those circumstances where the actual type
        of a set with ordinal elements can not be determined
        at compile time.
   *)

        Type 
          bytearray = array[0..0] Of byte;


          setrec = Record

            bottom,top: tsetelem;
            isstatic,padding: integer;

            bits: ^bytearray;
          End;
          pset = ^setrec;
          cheat = Record
            Case boolean Of 
              true: (yes:pset;);
              false: (no:pointer);
            End;
            Procedure phex(p:pointer);

            Var r: Record
              Case boolean Of 
                true: (i:integer);
                false: (p:pointer);
              End;
              Begin
                r.p := p;
                write(r.i);
              End;
              Function pointer2pset(p:pointer): pset;

              Begin
                pointer2pset := p;
              End;
              Function testbit(P:PSET;J:INTEGER): boolean;

              Var nindex,offset,mask: integer;
              Begin
                nindex := j - (p^.bottom );
                offset := nindex shr 3;
                mask := (1 shl (nindex And 7));
           {$r-}
                testbit := (p^.bits^[offset] And mask )<>0 ;{$r+}
              End;
              Procedure printDset(d:genericset);

              Var p: pset;
                i: integer;
              Begin
                p := pointer2pset(d);
                write(p^.bottom,'..',p^.top,':');
                For i:= p^.bottom To p^.top Do
                  If testbit(p,i) Then write(i:4);
              End;
              Procedure genericsetdispose(d:genericset);

              Var p: pset;
              Begin
                p := pointer2pset(d);
                If p^.isstatic=0 Then
                  freemem(p^.bits,(p^.top-p^.bottom)div 8 +1);
                dispose(p);
              End;
              Procedure genericsetisin(s:genericset;v:tsetelem;Var b:boolean);
              Begin
                b := isin(s,v);
              End;
              Function genericsetlt(s1,s2:genericset): boolean;

              Var d: genericset;
              Begin
                d := genericsetdifference(s2,s1);
                genericsetlt := Not isemptygenericset(d) ;
                genericsetdispose(d);
              End;
              Function genericsetgt(s1,s2:genericset): boolean;
              Begin
                genericsetgt := genericsetlt(s2,s1);
              End;
              Function genericsetle(s1,s2:genericset): boolean;
              Begin
                genericsetle := Not genericsetgt(s1,s2);
              End;
              Function genericsetge(s1,s2:genericset): boolean;
              Begin
                genericsetge := genericsetle(s2,s1)
              End;
              Function genericsetneq(s1,s2:genericset): boolean;
              Begin
                genericsetneq := Not genericseteq(s1,s2);
              End;
              Function genericseteq(s1,s2:genericset): boolean;

              Var d: genericset;
              Begin
                d := genericsetsymetricdifference(s1,s2);
                If isemptygenericset(d) Then
                  Begin
                    genericseteq := true;

                  End
                Else
                  Begin
                    genericseteq := false;

                  End;
                genericsetdispose(d);
              End;

              Function genericsetsymetricdifference(s1,s2:genericset): genericset;

              Var u,i,d: genericset;
              Begin

                u := genericsetunion(s1,s2);
                i := genericsetintersection(s1,s2);
                d := genericsetdifference(u,i);
                genericsetdispose(u);
                genericsetdispose(i);
                genericsetsymetricdifference := d;
              End;
              Function genericsetintersection(s1,s2:genericset): genericset;

              Var temp: genericset;
                ps1,ps2: pset;
              Procedure rec(p:pset);

              Var value: tsetelem;
              Begin
                If p<>Nil Then

                  With p^ Do
                    Begin
                      For value:= bottom To top Do
                        If isin(s2,value) And isin(s1,value) Then addtogenericset(temp,value);

                    End
              End;
              Begin
                ps1 := pointer2pset(s1);
                ps2 := pointer2pset(ps2);
                emptygenericset(temp);
                rec(ps1);
                genericsetintersection := temp;
              End;
              Function genericsetunion(s1,s2:genericset): genericset;

              Var temp: genericset;
              Procedure rec(p:pset);

              Var value: tsetelem;
              Begin
                If p<>Nil Then
                  With p^ Do
                    Begin
                      For value:= bottom To top Do
                        If isin(s2,value) Or isin(s1,value) Then addtogenericset(temp,value);

                    End
              End;
              Begin

                emptygenericset(temp);
                rec(pointer2pset(s1 ));
                rec(pointer2pset(s2 ));
                genericsetunion := temp;
              End;
              Function genericsetnotempty(s:genericset): boolean;
              Begin
                genericsetnotempty := Not isemptygenericset(s)
              End;
              Function isemptygenericset(s:genericset): boolean;

              Var p: pset;
                oK: boolean;
                i: integer;
              Begin
                ok := true;
                p := pointer2pset(s);
                For i:= p^.bottom To p^.top Do
                  ok := ok And Not testbit(p,i);
                isemptygenericset := ok;
              End;
              Procedure emptygenericset(Var newset:genericset);

              Var p: ^setrec;
              Begin
                new(p);
                With p^ Do
                  Begin
                    top := 7;
                    bottom := 0;
                    isstatic := 0;
                    new(bits);
                    bits^[0] := 0;
                  End;
                newset := p;
              End;

              Function isin(s:genericset;v:tsetelem): boolean;

              Var ok: boolean;
                p: pset;
              Begin
                p := pointer2pset(s);
                ok := false;
                If p<>Nil Then
                  With p^ Do
                    Begin
                      ok := top>=v;
                      If ok Then ok := bottom <= v;
                      If ok Then ok := testbit(p,v);
                    End;
                isin := ok
              End;
              Procedure setbit(P:PSET;J:INTEGER);

              Var nindex,offset,mask: integer;
              Begin

                nindex := j - (p^.bottom );
                offset := nindex shr 3;
                mask := (1 shl (nindex And 7));
             {$r-}
                p^.bits^[offset] := (p^.bits^[offset] Or mask ) ;{$r+}
              End;


              Procedure addtogenericset(Var s:genericset; v:tsetelem);
 { check if the bitmap is big enough. Extend it by doubling if it is not. then add the bit. }

              Var p: pset;
                count,newtop,newbottom,space,newspace,i: integer;
                bytes: ^bytearray;
              Begin
                p := pointer2pset(s);
                With p^ Do
                  Begin
                    If (v>=bottom)And (v<=top) Then setbit(p,v)
                    Else
                      Begin
                        space := ( (top-bottom)Div 8) +1;
                        newspace := (space * 2) ;
                        getmem(bytes, newspace);

    { check in which direction to extend}
                        If v<bottom Then
                          Begin
                            newbottom := (bottom - 8*space) And Not 7;
                            newtop := top;
                            For i:= 0 To space-1 Do
                              bytes^[i] := 0;
                            For i:= space To newspace-1 Do
                              bytes^[i] := bits^[i-space];
                          End
                        Else
                          Begin
                            newtop := (top + 8*space) Or 7;
                            newbottom := bottom;{$r-}
                            For i:= 0 To space-1 Do
                              bytes^[i] := bits^[i];
                            For i:= space To newspace-1 Do
                              bytes^[i] := 0;{$r+}
                          End;
                        If isstatic=0 Then freemem(bits,space);
                        isstatic := 0;
                        bottom := newbottom;
                        top := newtop;
                        bits := bytes;
                        addtogenericset(s,v);
                      End;

                  End;
              End;
              Procedure removefromgenericset(Var s:genericset; v:tsetelem);

              Var p,p2: pset;
                g: genericset;
                nindex,offset,mask: integer;
              Begin
                p := pointer2pset(s);
                If  (v<=p^.top)And(v>=p^.bottom) Then
                  Begin
                    nindex := v - (p^.bottom );
                    offset := v shr 3;
                    mask := (1 shl (nindex And 7));
                    p^.bits^[offset] := (p^.bits^[offset] And Not mask ) ;
                  End;
              End;
              Function genericsetsingleton(singleton :tsetelem): genericset;

              Var s: genericset;
              Begin
                emptygenericset(s);
                addtogenericset(s,singleton);
                genericsetsingleton := s;
              End;
              Function genericsetdifference(s1,s2:genericset): genericset;

              Const threshold = 2;

              Var temp: genericset;
              Procedure rec(p:pset);

              Var value: integer;
              Begin
                If p<>Nil Then
                  With p^ Do
                    Begin
                      For value:=bottom To top Do
                        If isin(s1,value) And  Not isin(s2,value)  Then addtogenericset(temp,value);

                    End
              End;
              Begin
                emptygenericset(temp);
                rec(pointer2pset(s1 ));
                genericsetdifference := temp;
              End;
              Function makedynamicbitmapreference(Var buf;low,high:integer): genericset;

              Var cheat: Record
                Case boolean Of 
                  true: (bits:^bytearray);
                  false: (p:pointer);
                End;
                p2s: pset;
                Begin
                  new(p2s);
                  cheat.p := @buf;
                  With p2s^ Do
                    Begin
                      bottom := low And Not 7;
                      top := high Or 7;
                      bits := cheat.bits;
                      isstatic := 1;
                    End;
                  makeDynamicBitmapReference := p2s;
                End;

Var cheater: Record
  Case boolean Of 
	true: (x:int64);
	false: (y:pointer);
  End;
  Begin
	cheater.x := 0;
	nil := cheater.y;
	complexzero.data := 0.0;
	complexone.data[0] := 1.0;
	complexone.data[1] := 0;
	setchan(input,0);
	setchan(output,1);

  End.
