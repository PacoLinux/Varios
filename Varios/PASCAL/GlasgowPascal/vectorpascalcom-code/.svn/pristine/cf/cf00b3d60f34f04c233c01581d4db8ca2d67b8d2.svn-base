/*

Description of the glasgow pcode processor
  in ILCG

  File written by Paul Cockshott
  Copyright (c) University of Glagow 2010

  By convention a machine descriptions like his should be processed by the m4 processor prior to use 


\section{Type codes}
This section of the machine description describes the internal assembler codes used as instruction suffixes
for the basic types that may be operated on by the compiler front end.
\begin{verbatim} 
*/
 

type word=l;
type uint32=l;
type int32=l;
type ieee64=d;
type int64=q;
type octet=b;
type uint8=b; 
type int16=w;
type uint16=w;
type int8=b;
type ieee32=s;
type halfword=w;

/*\end{verbatim}
\section{Type classes}
The next section defines groups of types that it is convenient to form into
super types for the purposes of various instructions that use them.
\begin{verbatim}
*/
pattern unsigned  means[uint32|uint8|uint16];
pattern signed  means[int8|int16|int32];
pattern int  means[int32|int8|int16|uint32|uint8|uint16];
pattern double  means[ieee64];
pattern float  means[ieee32];
pattern real  means [ieee64|float];
pattern byte  means[uint8|int8|octet];
pattern valtype  means[int|real|byte];
pattern word32  means[int32|uint32|word|ieee32];
pattern word16  means[int16|uint16|halfword];
pattern wordupto16  means[byte|word16];
pattern wordupto32  means[wordupto16|word32];
pattern wordupto64  means[wordupto32|int64];
pattern longint  means [int32|uint32];
pattern dword  means [double|int64];
/*
\end{verbatim}
\section{Registers}

The following section defines the register architecture of the abstract machine.
It contains a minimal set of registers, essentially a stack pointer {\tt sp},
a frame pointer {\tt ebp}, following the intel naming convention, and a general purpose
register {\tt gp}. The general purpose register can hold a variety of data types so
its basic set of bits are aliased according to the type that is being stored in them.
In addition a register {\tt gpd} exists for handling 64 bit reals.
Any integer or float value returned from a function is returned in the {\tt gp} register
with double precision values being returned in the {\tt gpd} register.

A little lower down groups of registers are declared.
\begin{verbatim}
*/
register int32 GP  assembles ['gp'];
register ieee64 GPD  assembles['gpd']; 
alias register int8 GP8 = GP(0:7)  assembles ['gpb'];
alias register int16 GP16 = GP(0:15)  assembles['gpw'];
alias register uint8 uGP8 = GP(0:7)  assembles ['ugpb'];
alias register uint16 uGP16 = GP(0:15)  assembles['ugpw'];
alias register ieee32 fGP =GP(0:31)  assembles ['fgp'];
reserved register int32 ESP  assembles[ 'sp'];
register int32 EBP  assembles['ebp'] ;
alias register word FP = EBP(0:31)  assembles ['ebp'];
flag realLitSupported = 1;

pattern breg  means[GP8];
pattern hwreg  means[GP16];
pattern ubreg  means[uGP8];
pattern freg  means [ fGP];
pattern uhwreg  means[uGP16];
pattern wreg  means[EBP|FP|GP|ESP];
pattern dreg  means[GPD];
pattern reg  means[wreg|hwreg|breg|ubreg|uhwreg|freg|dreg];
pattern big  means[wreg];
pattern medium  means[hwreg|uhwreg];
pattern smaller  means[breg|ubreg];
pattern small  means[smaller|medium];
/*
\end{verbatim}
\section{Stacks}

Two stacks are used in the machine. The lengths in the declaration are purely indicative, an
implementor of the abstract machine can choose to make the actual stack lengths different.

The VSTACK is used for all arithmetic, and values are stored on the stack in double real precision format.
All arithmetic is done in double precision real format, but other formats can be loaded and stored onto
the stack.
Arithmetic takes place between the top two elements on the stack, except for monadic operations
which operate only on the stack top.

The VSTACK is conceptually outside of the main address space of the machine, and can only be
operated on by pushes and pops.

The mainSTACK is used to hold local variables in stack frames and also to perform boolean operations
which can not be sensibly done in floating point format. The FP register points into the mainSTACK which
is assumed to exist within the general address space of the machine. The mainSTACK starts out at the top
of memory and grows downwards.
\begin{verbatim}*/
register stack(4096)double VSTACK  assembles[ 'VSTACK']; 
/* used for arithmetic */

register stack(64000)int32 mainSTACK  assembles[ 'mainSTACK']; 
/* used for evaluating booleans and procedure calling */

 
 
/* \end{verbatim}
\section{Address modes}
There are only 3 forms of address supported, an address may be evaluated using an integer constant,
a label, or it may be poped from the VSTACK. 
\begin{verbatim}*/
pattern immed(int s)
	  means[const s]
	  assembles[s]; 
	
pattern barelab(label l)
	  means[l]
	  assembles[l];
	
pattern poped(int t)
	  means[(t)POP(VSTACK)]
	  assembles[' '];
	
pattern litval  means[barelab|immed];
pattern addrform  means[litval|poped];
pattern maddrmode(addrform f)
	  means[mem(f) ]
	  assembles[ '[' f ']' ];
/*\end{verbatim}\section{ Load and store instructions} 

The definitions of the instruction patterns below give a name to the instruction or group of instructions,
a brackedted list of sub-patterns that are free variables in the instruction, and then a meaning for the
instruction, and finally the assembler source representation of the instruction.
\begin{verbatim}*/
instruction pattern RSTORE(   type t,reg r,poped st)
  means[(ref t)mem(st):=(t)^(r)]
  assembles ['store't ' 'r ' '  ];
  /*\end{verbatim}What this means is that the register store group of instructions store 
  a value of type $t$ from register $r$ in the memory location addressed by poping the VSTACK. \begin{verbatim}*/

instruction pattern VSTORE(  type t,  poped st)
  means[( ref t)mem(st):=( t)POP(VSTACK)]
  assembles ['vstore't ' '];
  
   /*\end{verbatim}What this means is that the VSTACK store group of instructions stores 
  a value of type $t$ obtained by initially poping the VSTACK in the memory location addressed by subsequently poping the VSTACK. \begin{verbatim}*/
  
instruction pattern PSTORE(   type t, type t2,poped st)
  means[(ref ref t)mem(st):=( t2)POP(VSTACK)]
  assembles ['vstorel' ];
  
  /*\end{verbatim}PTORE is a special version of the vstorel instruction that has the type rules fixed so
  that it can store an address in a pointer location ($ref$ $ref$ $t$) , this encodes the fact that addresses
  are in practice 32 bits long.
  \begin{verbatim}*/ 
  
instruction pattern VLOAD(longint l, type t,poped st)
  means[PUSH(VSTACK,(t)^(mem(st)))]
  assembles['load't ];
    
   /*\end{verbatim}What this means is that the VSTACK load group of instructions loads
  a value of type $t$ obtained by initially poping the VSTACK to obtain a memory location from which it is fetched. \begin{verbatim}*/
  
instruction pattern MLOAD(longint l, type t,poped st)
  means[PUSH(mainSTACK,(t)^(mem(st)))]
  assembles['mload't ];
  
 /*\end{verbatim}What this means is that the mainSTACK load group of instructions also loads
  a value of type $t$ obtained by initially poping the VSTACK to obtain a memory location from which it is fetched. \begin{verbatim}*/  

instruction pattern VLOADLIT(  valtype l, litval v)
	  means[PUSH(VSTACK,(l)v)]
	  assembles['loadlit'  ' ' v];
	  
instruction pattern RVLOADLIT( valtype l,  real v)
	  means[PUSH(VSTACK,(l)const v)]
	  assembles['rloadlit'   ' ' v];
	 
 /*\end{verbatim} The above pair of patterns push constants onto the value stack. 
 The next 4 instruction groups push or pop registers onto the two stacks.
 \begin{verbatim}*/	  
	  
instruction pattern VPUSH(reg r)
	  means[PUSH(VSTACK,^(r))]
	  assembles['vpush ' r];
instruction pattern MPUSH(reg r)
	  means[PUSH(mainSTACK,^(r))]
	  assembles['pushb ' r];
instruction pattern VPOP(reg r,valtype t)
	  means[r:=(t)POP(VSTACK)]
	  assembles['vpop ' r];
instruction pattern MPOP(reg r,int t)
	  means[r:=(t)POP(mainSTACK)]
	  assembles['popb ' r];
/*\end{verbatim} 
The next two instructions sign extend the lower 8 or 16 bits of the general purpose register to either 16 or 32 bits precision.
They are needed for converting 8 bit signed numbers to 32 bit signed numbers for example.
\begin{verbatim}*/
pattern EXT( big b,small s)
	  means [ b := EXTEND(^(s))]
	  assembles['extend 'b','s];
pattern EXTH( medium b,smaller s)
	  means [ b := EXTEND(^(s))]
	  assembles['extend 'b','s];
 /* \end{verbatim}\section{Arithmetic and logical operations} 
 \begin{verbatim}
 */

operation min  means MIN  assembles ['min'];
/* select the smaller of two elements */
operation max  means MAX  assembles ['max'];
/* seledt the greater of two elements */
operation add  means  +  assembles [ 'add'];
operation addsat  means +:  assembles ['addsat'];
/*\end{verbatim} This and all other saturated operations
work on signed bytes and are there for the purposes of doing pixel arithmetic without wraparound.
The operation a:=b +: c means 

if $(b+c)>127$ then $a:=127$ else
if $(b+c)<128$ then $ a:= -128$ else
  $a:= a+b$
  
  With analogous rules for minus.
  
  \begin{verbatim}*/
operation and  means  AND  assembles[ 'and'];
operation or  means OR  assembles['or'];
operation xor  means XOR  assembles['xor'];/* */
operation sub  means  -  assembles [ 'sub'];
operation subsat  means -:  assembles ['subsat'];
operation mul  means *  assembles ['mul'];
operation mulsat  means *:  assembles ['mulsat'];
operation frem  means MOD  assembles['prem'];
operation divide  means div  assembles ['div'];
operation sr  means >>  assembles['srl'];
operation sl  means <<  assembles['sll'];
operation and  means  AND  assembles[ 'and'];
operation or  means OR  assembles['or'];
operation xor  means XOR  assembles['xor'];
operation lt  means <  assembles ['lt'];
operation gt  means >  assembles ['gt'];
operation eq  means =  assembles ['eq'];
operation le  means <=  assembles ['le'];
operation ge  means >=  assembles ['ge'];
operation ne  means <>  assembles ['ne'];
pattern comp  means[lt|gt|eq|le|ge|ne];
pattern log  means[and|or|xor|sr|sl];
pattern aop  means[add|sub|mul|divide|min|max|addsat|subsat|mulsat|frem];

/*\end{verbatim}
\section{Arithmetic, logical and conditional instruction patterns}
The following patterns specify where the different operations take
their arguments and place their results.
The arithmetic instruction take arguments on and return results to the VSTACK.
The conditional instructions take arguments on the VSTACK and push a -1 for true
or a 0 for false on the mainSTACK.
The logical instructions take arguments from and return results to the mainSTACK.
\begin{verbatim}*/
 instruction pattern COND(comp o,valtype t,int i)
	  means[PUSH(mainSTACK,(i) o((t)POP(VSTACK),(t)POP(VSTACK)))]
	  assembles[ o  ];
instruction pattern ARITH(aop o,valtype t)
	  means[PUSH(VSTACK,(t) o((t)POP(VSTACK),(t)POP(VSTACK)))]
	  assembles[o ' ' ];
instruction pattern LOGICAL(log o, int t)
	  means[PUSH(mainSTACK,(t) o((t)POP(mainSTACK),(t)POP(mainSTACK)))]
	  assembles[o ' ' ];
	  
/*\end{verbatim}\section{Functions}
A group of built in hardware functions are assumed by the compiler, these
are they. They take a single argument, generally on the VTACK, except for
NOT which takes an argument on the mainSTACK.
\begin{verbatim}*/
pattern fround(real t,int i)  
means [(i)ROUND((t)POP(VSTACK))]  
assembles['frndint'];

pattern fsqrt(type t) 
means[(t)SQRT((t)POP(VSTACK))]  
assembles ['fsqrt'];

pattern fsin(type t)  
means[(t)SIN((t)POP(VSTACK))]
assembles ['fsin'];

pattern fcos(type t)  
means[(t)COS((t)POP(VSTACK))]  
assembles ['fcos'];

pattern fextend(real t, real t2)  
means[(t)EXTEND((t2)POP(VSTACK))]  
assembles ['fextend '];

pattern fln(type t)
means[(t)LN((t)POP(VSTACK))]  
assembles['fln'];

pattern fptan(type t)
means[(t)TAN((t)POP(VSTACK))]  
assembles['ftan'];

pattern fabs(type t)
means[(t)ABS((t)POP(VSTACK))] 
assembles['fabs'];

pattern bnot(int t)
means[(t)NOT((t)POP(mainSTACK))]  
assembles['not'];

instruction pattern FLOATMS(real t,int t2)
	  means[PUSH(VSTACK,(t)FLOAT((t2)POP(mainSTACK)))]
	  assembles['floatms'];
pattern fmoperator  means [fround|fsqrt|fsin|fcos|fptan|fln|fabs|fextend|bnot];

instruction pattern MONADICFN(fmoperator op)
	  means[PUSH(VSTACK,op)]
	  assembles[op];
/*\end{verbatim} \section{Control Transfers}
All control is by jumping to labels. The 
Conditional control is pefrormed by the IFGOTO pattern which
jumps to a label if the value popped from the mainstack is non-zero.
\begin{verbatim} */
 

instruction pattern IFGOTO(label l,int t)
  means[if((t)POP(mainSTACK))goto l]
	  assembles['iftrue ' l];
 
 
instruction pattern PLANT(label l)
	  means[l]
	  assembles[l ':'];  

pattern jumpmode  means[litval|maddrmode];
instruction pattern GOTO(jumpmode l)
	  means[goto l]
	  assembles['goto ' l];
instruction pattern GOTOINDIRECT(int t)
	  means[goto (t)POP(VSTACK) ]
	  assembles['jmpstack '];
/*\end{verbatim}\section{Data declarations} The following use the standard gnu assembler conventions for planting constants.
\begin{verbatim}*/
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

/*\end{verbatim}
\section{Ordered instructionset}
The following is the list of instruction patterns available to the code generator, listed in the order in
which it will attempt to apply them when translating the source language semantics.
\begin{verbatim}
*/

instructionset[ 
VSTORE|
VLOADLIT|
ARITH|
VLOAD|
RVLOADLIT|
MLOAD|
MONADICFN|
FLOATMS|
LOGICAL|
COND|
RSTORE|
EXTH|
IFGOTO|
PLANT|
GOTO|
GOTOINDIRECT|
PLANTICONST|
PLANTSCONST|
PLANTBCONST|
PLANTWCONST|
PSTORE|
VPOP|
MPOP|
EXT|
VPUSH|
MPUSH]


/*\end{verbatim} 
In addition there are 4 ancillary instructions associated with procedure call,
these are CALL, RET, ENTER, LEAVE.
These 4 instruction have semantics that exactly follow those of the equivalent
instructions on the Pentium.
They are not automatically generated from the machine specification but
are output by a handwritten class ilcg.tree.PcodeCG.class which extends the
automatically generated class Pcode.class.
The former class is what you would have to modify if you wanted to include
an assemble and interpret phase into the translation process.

*/

