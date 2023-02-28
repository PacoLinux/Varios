/* Description of the NIOS II processor
   in ILCG

   File written by Paul Cockshott
   Copyright (c) University of Glagow 2005

   This should be processed by the m4 processor prior to use 
*/
register stack(4096)int32 mainSTACK assembles[ 'mainSTACK'];

type word=l;
type uint32=l;
type int32=l;
type ieee64=q;
type int64=q;
type octet=b;
type uint8=b; 
type int16=w;
type uint16=w;
type int8=b;
type ieee32=s;
type halfword=w;


pattern unsigned means[uint32|uint8|uint16];
pattern signed means[int8|int16|int32];
pattern int means[int8|int16|int32|uint32|uint8|uint16];
pattern double means[ieee64];
pattern float means[ieee32];
pattern real means [ieee64|float];
pattern byte means[uint8|int8|octet];

pattern word32 means[int32|uint32|word|ieee32];
pattern word16 means[int16|uint16|halfword];
pattern wordupto16 means[byte|word16];
pattern wordupto32 means[wordupto16|word32];
pattern wordupto64 means[wordupto32|int64];
pattern longint means [int32|uint32];
pattern dword means [double|int64];

define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
     define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')

 
 
define(rrr,`reserved register int32 R$1 assembles[ ' `'' `r$1'`''`];
')
define(rr,`register int32 R$1 assembles[ ' `'' `r$1'`''`];
')
define(brr,`alias register int8 bRR$1=R$1(0:7) assembles[' `'' `r$1'`''`] ;
')
define(obrr,`alias register octet obRR$1=R$1(0:7) assembles[' `'' `r$1'`''`] ;
')

define(uwrr,`alias register halfword uwRR$1=R$1(0:15) assembles[' `'' `r$1'`''`] ;
')
define(wrr,`alias register int16 wRR$1=R$1(0:15) assembles[' `'' `r$1'`''`] ;
')

define(frr, `alias register ieee32 fR$1=R$1(0:31) assembles[' `'' `r$1'`''`] ;
')
/* General use registers */
forloop(`i',`2',`7',`rrr(i)')
forloop(`i',`8',`15',`rr(i)')
forloop(`i',`16',`23',`rrr(i)')
forloop(`i',`2',`23',`brr(i)')
forloop(`i',`2',`23',`obrr(i)')
forloop(`i',`2',`23',`uwrr(i)')
forloop(`i',`2',`23',`wrr(i)')
forloop(`i',`2',`15',`frr(i)')
/* reserved ones */
reserved register int32 ZERO assembles[ '  zero '];
reserved register int32 rFP assembles[ '  fp '];
alias register int32 FP = rFP(0:31) assembles [' fp '];
reserved register int32 GP assembles[ '  gp '];
reserved register int32 rSP assembles[ '  sp '];
alias register int32 SP = rSP(0:31) assembles [' sp '];
reserved register int32 RA assembles[ ' ra '];
/* general purpose integer regs as sets */
 
define(IRRL,`R$1|')
define(FRRL,`fR$1|') 
pattern greg means[forloop(`i',`2',`22',`IRRL(i)') R23|ZERO|RA|rSP|GP|FP|rFP];
pattern freg means[forloop(`i',`2',`14',`FRRL(i)') fR15];
pattern reg32 means[greg|freg];
/* half word registers */

define(shwregdef,`wRR$1|')

pattern shwreg means[forloop(`i',`2',`22',`shwregdef(i)') wRR23];

define(uhwregdef,`uwRR$1|')

pattern uhwreg means[forloop(`i',`2',`23',`uhwregdef(i)') uwRR23];

pattern hwreg means[shwreg|uhwreg];

/* byte regs holding 8 bit ints */
define(bregdef,`bRR$1|')

pattern bireg means[forloop(`i',`2',`22',`bregdef(i)') bRR23];

/* byte registers holding untyped octets */
define(obregdef,`obRR$1|')

pattern obreg means[forloop(`i',`2',`22',`obregdef(i)') obRR23];

pattern breg means[bireg|obreg];
pattern boolreg means[greg|breg];
pattern resreg means[R2];
pattern fresreg means[fR2];
pattern arg1 means[R4];
pattern farg1 means[fR4];
pattern arg2 means[R5];
pattern farg2 means[fR5];
pattern bresreg means[bRR2];
/* Address modes */
pattern immed32(word32 s)
	means[const s]
	assembles[s];
pattern labelf(label l)
	means [l]
	assembles['$'l];
pattern barelab(label l)
	means[l]
	assembles[l];
pattern labelconstf(barelab l,signed s)
	means [+(l,const s)]
	assembles[ l '+'s];
pattern literal means [word16];
pattern constf(literal s)
	means[const s]
	assembles [s];
pattern offset means[constf];
pattern regindirf(greg r)
	means[^(r) ]
	assembles['0(' r ')'];
pattern baseminusoffsetf(greg r, constf s )
	means[-(   ^(r) ,  s)]
	assembles[   '- ' s '('r')'];
pattern baseplusoffsetf(greg r, offset s )
	means[+(   ^(r) ,  s)]
	assembles[   s'('r')' ];
pattern dirf(offset s)
	means[s]
	assembles[' 's'(gp)'];
pattern uncasteaform means[
	dirf| 
	baseplusoffsetf | 
	baseminusoffsetf|
        regindirf
]; 
pattern eaform(uncasteaform f,longint t)  /* allow the address expression to be cast to an integer */
	means[(t)f]
	assembles[f];
 
pattern addrform means[eaform|regindirf];

/* Load and store */
instruction pattern MOVI32(greg r1,immed32 c)
	means[r1:=c]
	assembles['movhi 'r1',%hi('c')\n ori 'r1','r1',%lo('c')'];
pattern signed16 means[int16];
instruction pattern MOVI(greg r1, signed16 c)
	means[r1:=c]
	assembles['movi 'r1','c];
instruction pattern MOVIU(greg r1, constf c)
	means[r1:=(uint16)c]
	assembles['movui 'r1','c];
instruction pattern MOVIA(greg r1, barelab l)
	means[r1:=l]
	assembles['movia 'r1 ','l];
instruction pattern MOV(reg32 r1,reg32 r2)
	means[r1:=^(r2)]
	assembles['mov 'r1 ',' r2];
instruction pattern LDW(reg32 r1,addrform a, word32 t)
	means[(ref t)r1:=(t)^(mem(a))]
	assembles['ldw 'r1','a ];
instruction pattern LDB(greg r1,addrform a)
	means[r1:=EXTEND((int8)^(mem(a)))]
	assembles['ldb 'r1','a ];
instruction pattern LDBU(greg r1,addrform a)
	means[r1:=EXTEND((uint8)^(mem(a)))]
	assembles['ldbu 'r1','a ];
instruction pattern LDH(greg r1,addrform a)
	means[r1:=EXTEND((int16)^(mem(a)))]
	assembles['ldh 'r1','a ];
instruction pattern LDHH(shwreg r1,addrform a)
	means[r1:=(int16)^(mem(a))]
	assembles['ldh 'r1','a ];
instruction pattern LDHUH(uhwreg r1,addrform a)
	means[r1:=(uint16)^(mem(a))]
	assembles['ldhu 'r1','a ];
instruction pattern LDHU(greg r1,addrform a)
	means[r1:=EXTEND((uint16)^(mem(a)))]
	assembles['ldhu 'r1','a ];
instruction pattern STW(greg r1,addrform a, word32 t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['stw 'r1','a ];
instruction pattern STH(hwreg r1,addrform a, word16 t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['sth 'r1','a ];
instruction pattern STB(breg r1,addrform a, byte t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['stw 'r1','a ];
instruction pattern PUSHR(greg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['addi sp,-4\n stw 'r',0(sp)'];
/* arithmetic */


operation add means  +  assembles [ 'add'];
operation and means  AND  assembles[ 'and'];
operation or means OR assembles['or'];
operation xor means XOR assembles['xor'];/* */
operation sub means  -  assembles [ 'sub'];
operation mul means * assembles ['mul'];
operation divide means div assembles ['div'];
operation sr means >> assembles['srl'];
operation sl means << assembles['sll'];

pattern aop means[add|sub|and|or|xor|mul|divide|sr|sl];
pattern iaop means[add|sub|and|or|xor|mul|sr|sl];
instruction pattern RRR(greg r1, greg r2, greg r3 , aop oper)
	means[ r1:=oper(^(r2),^(r3))]
	assembles[oper ' ' r1 ',' r2 ',' r3];
instruction pattern RI(greg r1,greg r2, constf lit, iaop oper)
	means[ r1:=oper(^(r2),lit)]
	assembles[oper 'i ' r1 ',' r2 ',' lit];
instruction pattern NOR(greg r1, greg r2)
	means[r1:=NOT(OR(^(r1),^(r2)))]
	assembles['nor 'r1 ',' r1 ',' r2];
instruction pattern NOTOP(greg r1,greg r2)
	means[r1:=NOT(^(r2))]
	assembles['nor 'r1 ',' r2 ',' r2];
instruction pattern RRRieee32( aop op, resreg r1, farg1 r2, farg2 r3)
        means[(ref ieee32)r1:=  op((ieee32)  ^(  r2), (ieee32)^(  r3))]
	assembles[' call fp'op'\n '];

/* control transfer */
operation lt means < assembles ['lt'];
operation gt means > assembles ['gt'];
operation eq means = assembles ['eq']; 
operation le means <= assembles ['le']; 
operation ge means >= assembles ['ge'];
operation ne means <> assembles ['ne'];
pattern conditionequality means[ne|eq];
pattern comparecondition means [le|eq|lt|gt|ge];
pattern condition means[conditionequality|comparecondition];
instruction pattern RRRBieee32( condition op, bresreg r1, farg1 r2, farg2 r3)
        means[r1:=  op((ieee32)  ^(  r2), (ieee32)^(  r3))]
	assembles[' call fp'op'\n '];

instruction pattern IFGOTO(label l,greg r1, greg  r2,condition c)
	means[if((int8)c( ^(r1),^(r2)))goto l]
	assembles['b'c' ' r1 ','  r2  ',' l];
instruction pattern IFBOOL(label l,breg r1)
	means[ if( (int8)^(r1))goto l]
	assembles['bne ' r1 ',r0,'  l];
/* the set pattern places -1 in r1 if the condition is met and 0 otherwise */
instruction pattern SET(boolreg r1,greg r2,greg r3, condition c)
	means[r1:=c(^(r2),^(r3))]
	assembles['cmp'c' 'r1','r2','r3'\n sub  'r1',r0,'r1];
instruction pattern PLANT(label l)
	means[l]
	assembles[l ':'];  
instruction pattern GOTO(label l)
	means[goto l]
	assembles['br ' l];
instruction pattern GOTOINDIRECT(greg l)
	means[goto ^(l)]
	assembles['jmp ' l];
/* literals */
instruction pattern PLANTICONST( longint r,type t) 
	means[loc (t) r] 
	assembles[ '.long ' r]; 
instruction pattern PLANTSCONST( float  r,type t)
	means[loc (t) r]
	assembles[ '.float ' r];
instruction pattern PLANTBCONST( byte r,type t) 
	means[loc (t) r]
	assembles[ '.byte ' r]; 
instruction pattern PLANTWCONST( word16 r,type t) 
	means[loc (t) r] 
	assembles[ '.short ' r];



instructionset[LDW|LDB|LDBU|LDH|LDHU|LDHH|LDHUH|
              STW|STH|STB|
              RI|RRR|NOR|NOTOP|RRRieee32|RRRBieee32|
	      IFGOTO|IFBOOL|SET|PLANT|GOTO|GOTOINDIRECT|
	      PLANTICONST|PLANTSCONST|PLANTBCONST|PLANTWCONST|
	    /* make mov last to prevent redundant moves */
 	      MOVIA|MOVI|MOVIU|MOVI32|MOV|
	      PUSHR]


