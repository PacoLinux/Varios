
/*
 Ilcg to C code generator
*/
type word=int;
type ieee32=float;
type uint32=UINT32;
type int32=int;
type ieee64=double;
type int64=INT64;



type int16=short;
type uint16=UINT16;
type halfword=short;

type int8=char;
type octet=BYTE;
type uint8=BYTE;
/*
The registers below will be implemented as C variables.
*/

register int32 R0 assembles['r0'] ;
reserved register int32 R1 assembles['r1'] ;
reserved register int32 R2 assembles['r2'] ; /* Frame Pointer */
alias register int32 FP = R2(0:31) assembles ['r2'] ;/* Table of Contents */
register int32 R3 assembles['r3'] ;
register int32 R4 assembles['r4'] ;
register int32 R5 assembles['r5'] ;
register int32 R6 assembles['r6'] ;
register int32 R7 assembles['r7'] ;
register int32 R8 assembles['r8'] ;
register int32 R9 assembles['r9'] ;
register int32 R10 assembles['r10'] ;
register int32 R11 assembles['r11'] ;
register int32 R12 assembles['r12'] ;
register int32 R13 assembles['r13'] ;
register int32 R14 assembles['r14'] ;
register int32 R15 assembles['r15'] ;
register ieee32 F0 assembles['F0'];
register ieee32 F1 assembles['F1'];
register ieee32 F2 assembles['F2'];
register ieee32 F3 assembles['F3'];

register ieee64 D0 assembles['D0'];
register ieee64 D1 assembles['D1'];
register ieee64 D2 assembles['D2'];
register ieee64 D3 assembles['D3'];
/*The unsinged registers*/
/*alias register uint32 uR0= R0(0:31) assembles['r0'] ; */
/* R1 (STACK POINTER) and R2 (TOC) are reserved */
alias register uint32 uR3= R3(0:31) assembles['r3'] ;
alias register uint32 uR4= R4(0:31) assembles['r4'] ;
alias register uint32 uR5= R5(0:31) assembles['r5'] ;
alias register uint32 uR6= R6(0:31) assembles['r6'] ;
alias register uint32 uR7= R7(0:31) assembles['r7'] ;
alias register uint32 uR8= R8(0:31) assembles['r8'] ;
alias register uint32 uR9= R9(0:31) assembles['r9'] ;
alias register uint32 uR10= R10(0:31) assembles['r10'] ;
alias register uint32 uR11= R11(0:31) assembles['r11'] ;
alias register uint32 uR12= R12(0:31) assembles['r12'] ;

alias register int32 SP = R12(0:31) assembles['r12'];
alias register uint32 uR13= R13(0:31) assembles['r13'] ;
alias register uint32 uR14= R14(0:31) assembles['r14'] ;
alias register uint32 uR15= R15(0:31) assembles['r15'] ;
/* use these for signed 8 bit values */
alias register int8 bR3 = R0(0:7) assembles['r0'];
alias register int8 bR4 = R4(0:7) assembles['r4'];
alias register int8 bR5 = R5(0:7) assembles['r5'];
alias register int8 bR6 = R6(0:7) assembles['r6'];
alias register int8 bR7 = R7(0:7) assembles['r7'];

/* use these for unsigned 8 bit values */
alias register uint8 ubR3 = R0(0:7) assembles['r0'];
alias register uint8 ubR4 = R4(0:7) assembles['r4'];
alias register uint8 ubR5 = R5(0:7) assembles['r5'];
alias register uint8 ubR6 = R6(0:7) assembles['r6'];
alias register uint8 ubR7 = R7(0:7) assembles['r7'];

/* use these for untyped 8 bit values */
alias register octet oR3 = R0(0:7) assembles['r0'];
alias register octet oR4 = R4(0:7) assembles['r4'];
alias register octet oR5 = R5(0:7) assembles['r5'];
alias register octet oR6 = R6(0:7) assembles['r6'];
alias register octet oR7 = R7(0:7) assembles['r7'];

/* and 16 bit values */
alias register int16 sR3 = R0(0:15)assembles['r0'];
alias register int16 sR4 = R4(0:15)assembles['r4'];
alias register int16 sR5 = R5(0:15)assembles['r5'];
alias register int16 sR6 = R6(0:15)assembles['r6'];
alias register int16 sR7 = R7(0:15)assembles['r7'];
/* and unsigned 16 bit values */
alias register uint16 huR3 = R0(0:15)assembles['r0'];
alias register uint16 huR4 = R4(0:15)assembles['r4'];
alias register uint16 huR5 = R5(0:15)assembles['r5'];
alias register uint16 huR6 = R6(0:15)assembles['r6'];
alias register uint16 huR7 = R7(0:15)assembles['r7'];
/* untyped 16 bit value */
alias register uint8 hR8 = R8(0:15)assembles['r8'];
alias register uint8 hR9 = R9(0:15)assembles['r9'];

register stack(4096)int32 mainSTACK assembles[ 'mainSTACK'];

/* \end{verbatim}
\subsection{Register sets }
\begin{verbatim}
*/
pattern indexreg means [ R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 ];
pattern freg means[F0|F1|F2|F3];
pattern dreg means[D0|D1|D2|D3];
pattern ireg means [ indexreg ] ;
pattern ureg means [ uR3 | uR4 | uR5 | uR6 | uR7 | uR8 | uR9 | uR10 | uR11 | uR12 | uR14 | uR15 ];
/* all registers reg means: all 32-bits regs signed and unsigned*/
pattern reg means [ ireg|ureg ];

/* All registers are 32 bits long*/

pattern bireg 	means	[ bR3 | bR4 | bR5 | bR6 | bR7 ];
pattern bureg 	means	[ ubR3 | ubR4 | ubR5 | ubR6 | ubR7 ];
pattern boreg 	means	[ oR3 | oR4 | oR5 | oR6 | oR7 ];
pattern breg 	means	[ bireg | bureg | boreg ];
pattern hureg 	means	[ huR3 | huR4 | huR5 | huR6 | huR7 | hR8 | hR9 ];
pattern hreg 	means	[ sR3 | sR4 | sR5 | sR6 | sR7 | hR8 | hR9 ];
pattern anyreg 	means[  breg | hreg|hureg | reg |freg|dreg];
pattern signedreg means[bireg|hreg|ireg|hreg];
pattern unsignedreg means[bureg|hreg|ureg|hreg];




operation add 	means 	+  	assembles ['add'];
operation and 	means 	AND assembles ['and'];
operation or  	means 	OR 	assembles ['or'] ;
operation xor 	means 	XOR assembles ['xor'];
operation sub 	means 	-  	assembles ['sub'];
operation mul  	means 	* 	assembles ['mul'];
operation dv	means	div assembles ['div'];
operation mod 	means 	MOD assembles['mod'];
operation satp  means   +:  assembles['satp'];
operation sats  means   -:  assembles['sats'];
operation satm  means   *:  assembles['satm'];
operation min   means   MIN assembles ['min'];
operation max   means  MAX  assembles['max'];

operation lt  	means	< 	assembles ['lt'];
operation gt 	means 	> 	assembles ['gt'];
operation eq 	means 	= 	assembles ['eq'];
operation ng 	means 	<= 	assembles ['ng'];
operation le 	means	<= 	assembles ['le'];
operation nl 	means 	>= 	assembles ['nl'];
operation ge 	means 	>= 	assembles ['ge'];
operation ne 	means 	<> 	assembles ['ne'];
operation shl 			means 	<< assembles ['shiftleft'];
operation shr 			means 	>> assembles ['shiftright'];

pattern condition 		means[lt|gt|eq|ng|le|nl|ge|ne];
pattern shifts			means[shl|shr];


pattern boolop			means[and|or|xor];
pattern arith			means[add|sub|mul|dv|mod|satp|sats|satm|min|max]; /* dv = div */
pattern opcode			means[arith|condition|boolop|shifts];



pattern unsigned 		means[uint32|uint8|uint16];
pattern signed 			means[int8|int16|int32];
pattern int 			means[int8|int16|int32|uint32|uint8|uint16];
pattern double 			means[ieee64] ;
pattern float  			means[ieee32];
pattern real 			means[double|float];
pattern byte 			means[uint8|int8|octet];
pattern numeric			means[int|real];
pattern char			means[byte];
pattern word32 			means[int32|uint32|word];
pattern word16 			means[int16|uint16|halfword];
pattern wordupto16  	means[byte|word16];
pattern wordupto32 		means[byte|word16|word32];
pattern dataformat 		means[octet|word];
pattern longint 		means[int32|uint32];
pattern hiint 			means[int32|int64|int16];
 
pattern scalar means[int|real|wordupto32|hiint];



pattern labelf(label l)					means [l]		assembles['(char*)'l];
pattern labconst(label l)				means[l]		assembles[' &&'l];
pattern eareg(anyreg r) 				means[^(r)]		assembles[ ' 'r ' ' ];
pattern intlit(int s)					means[const s]	assembles 	[s];
pattern floatlit(real s,real t)			means[(ieee32)const s]	assembles	['(float)'s];
pattern base(reg r)						means[^(r)]		assembles	[r];
pattern doublelit(real s,real t)		means[(ieee64)const s]	assembles	['(double)'s];
pattern reallit means[floatlit|doublelit];

 
pattern basef means[labelf|base];
pattern baseminusoffsetf(basef r, intlit s )		means[ -( r , s )]	assembles	[ '('r'-'s')'];
pattern baseplusoffsetf(basef r, intlit s )		means[ +( r , s )]	assembles	[ '('r'+'s')' ];
pattern eaform 						means [ baseplusoffsetf | baseminusoffsetf |intlit| base];


pattern addrform 					means[eaform|eareg];
pattern memref(addrform f) 			means[mem(f)] 		assembles[ '((char *)'f ')'];
pattern typedmemref(memref m,type t)means[(ref t)m]		assembles['((' t '*)' m ')'] ;
pattern typedreg( anyreg r, type t) means[(ref t)r]		assembles['('t')'r];
pattern memloc(typedmemref l)		means[l] 			assembles['*('l')'];
pattern pointerderef(type t,indexreg r)	means[(ref t)^(r)]    	assembles['*(('t'*)'r')'];
pattern lvalue 						means[memloc|anyreg|pointerderef];
pattern deref(lvalue l)				means[^(l)] 		assembles[l];
pattern rvalue						means[ intlit|labelf|reallit|deref|eareg];
pattern negate(rvalue r1,type t)	means[(t)NOT(r1)] 	assembles['~('r1')'];
pattern Float(rvalue r1,real t) 	means[(t)FLOAT(r1)]	assembles['('t')('r1')'];
pattern sq(rvalue r1,real t)		means[(t)SQR(r1)]	assembles['('r1 '*' r1')'];
pattern root(rvalue r1,real t)		means[(t)SQRT(r1)]	assembles['sqrt('r1')'];
pattern sin(rvalue r1,real t)		means[(t)SIN(r1)]	assembles['sin('r1')'];
pattern cos(rvalue r1,real t)		means[(t)COS(r1)] 	assembles['cos('r1')'];
pattern abs(rvalue r1,numeric t)	means[(t)ABS(r1)] 	assembles['('r1'>0?'r1':- 'r1')'];
pattern tan(rvalue r1,real t)		means[(t)TAN(r1)] 	assembles['tan('r1')'];
pattern ln(rvalue r1,real t)		means[(t)LN(r1)] 	assembles['log('r1')'];
pattern extend(eareg r1, type t) 	means[(t)EXTEND(r1)] 	assembles['('t')'r1];
pattern trunc(rvalue r1,int t)		means[(t)TRUNCATE(r1)] 	assembles['trunc('r1')'];
pattern round(rvalue r1,int t)		means[(t)ROUND(r1)] 	assembles['(int)'r1];
pattern primfun 					means[Float|root|sin|cos|abs|ln|tan|trunc|round|extend|sq|negate];
pattern atom 						means [primfun|rvalue];
pattern minimum(atom r1,atom r2, type t)    		means[(t)MIN(r1,r2)]	assembles['('r1'<'r2'?'r1':'r2')'];
pattern maximum(atom r1,atom r2, type t)    		means[(t)MAX(r1,r2)]	assembles['('r1'>'r2'?'r1':'r2')'];
pattern dyadic0(opcode o,atom r1,atom r2,type t)	means[(t)o(r1,r2)]	assembles['(' t')'o'('r1','r2')'];
pattern rhs0						means[primfun|dyadic0|atom|minimum|maximum];

pattern dyadic(opcode o,rhs0 r1,rhs0 r2,type t)		means[(t)o(r1,r2)]	assembles['(' t')'o'('r1','r2')'];
pattern dmem(rhs0 r,type t)			means[(t)^(mem(r))]	assembles['*((' t '*)' r ')'];
pattern rhs							means[dmem|dyadic|rhs0];
pattern computed means[dyadic |primfun|dyadic0];

/* --------- instructions -------------------- */

instruction pattern 	ASSIGN(lvalue l,rhs r,scalar t)
means		[l:=(t)r]
assembles	[l'=('t ')'r';'];
instruction pattern 	RASSIGN(lvalue l,rhs r,type t)
means		[l:=(ref t)r]
assembles	[l'='r';'];

instruction pattern FASS(lvalue l, primfun r)
means		[l:=r]
assembles	[l'='r';'];
/* "label:" always needs ":" */
instruction pattern PLANT(label l)
means		[l]
assembles	[ l':' ];


instruction pattern GOTO(label l)
means		[goto l]
assembles	['goto ' l ';'];

instruction pattern computedgoto(rvalue r)
means [goto r]
assembles [ 'goto *((void*)'r');'];

instruction pattern IFGOTO(rhs r,label l)
means		[if(r)goto l]
    assembles	[ 'if(' r ' )goto 'l ';'];

instruction pattern PUSHR(rhs r)
means[PUSH(mainSTACK,r)]
assembles	[ r ];
instruction pattern PUSHL(labelf r,type t)
means[PUSH(mainSTACK,(t)r)]
assembles	['('t')' r ];




instructionset[GOTO|IFGOTO|PLANT|ASSIGN|RASSIGN|computedgoto|FASS|PUSHL|PUSHR]

