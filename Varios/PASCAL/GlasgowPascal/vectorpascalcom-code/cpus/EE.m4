/* Sony PS2 description
   Paul Cockshott
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
pattern signed means[int8|int16|int32|int64];
pattern int means[int8|int16|int32|uint32|uint8|uint16];
pattern double means[ieee64];
pattern float means[ieee32];
pattern real means [ieee64|float];
pattern byte means[uint8|int8|octet];

pattern word32 means[int32|uint32|word];
pattern word16 means[int16|uint16|halfword];
pattern wordupto16 means[byte|word16];
pattern wordupto32 means[wordupto16|word32];
pattern wordupto64 means[wordupto32|int64];
pattern longint means [int32|uint32];
pattern dword means [double|int64];

/*
\end{verbatim}
\section{Registers for the Sony Emotion Engine Core}
Copyright University of Glasgow (c) 2002

These are a superset of the MIPs registers. We define the 128 bit
emotion engine registers first and then define the MIPS ones as
sub fields of these.
\subsubsection{ 128 bit Registers}
\begin{verbatim}


*/
    define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
     define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')

define(saved_lower, `16')
define(saved_mid, `21')
define(saved_upper, incr(saved_mid))

define(f_saved_lower, `20')
define(f_saved_mid, `30')
define(f_saved_upper, incr(f_saved_mid))

define(mmr,`register quadword RMM$1 assembles[ ' `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmr(i)')
/* unsigned byte registers  note spaces in the assembler version of the register names are significant*/
define(mmrub,`alias register uint8 vector(16) ubRMM$1=RMM$1(0:127) assembles[ '  `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmrub(i)')
/* signed byte registers */
define(mmrsb,`alias register int8 vector(16) sbRMM$1=RMM$1(0:127) assembles[ '   `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmrsb(i)')

/* unsigned halfword registers  note spaces in the assembler version of the register names are significant*/
define(mmruh,`alias register uint16 vector(8) uhRMM$1=RMM$1(0:127) assembles[ '  `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmruh(i)')
/* signed halfword registers */
define(mmrsh,`alias register int16 vector(8) shRMM$1=RMM$1(0:127) assembles[ '   `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmrsh(i)')

/* unsigned word registers  note spaces in the assembler version of the register names are significant*/
define(mmruw,`alias register uint32 vector(4) uwRMM$1=RMM$1(0:127) assembles[ '  `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmruw(i)')
/* signed word registers */
define(mmrsw,`alias register int32 vector(4) swRMM$1=RMM$1(0:127) assembles[ '   `'' `$$1'`''`];
')
forloop(`i',saved_lower,saved_upper,`mmrsw(i)')


define(mreg,`RMM$1|')
define(mreg_noslash,`RMM$1')
pattern mregs means[forloop(`i',saved_lower,saved_mid,`mreg(i)')mreg_noslash(saved_upper)];
define(ubmreg,`ubRMM$1|')
define(ubmreg_noslash,`ubRMM$1')
pattern ubmregs means[forloop(`i',saved_lower,saved_mid,`ubmreg(i)')ubmreg_noslash(saved_upper)]; 
define(sbmreg,`sbRMM$1|')
define(sbmreg_noslash,`sbRMM$1')
pattern sbmregs means[forloop(`i',saved_lower,saved_mid,`sbmreg(i)')sbmreg_noslash(saved_upper)];

define(uhmreg,`uhRMM$1|')
define(uhmreg_noslash,`uhRMM$1')
pattern uhmregs means[forloop(`i',saved_lower,saved_mid,`uhmreg(i)')uhmreg_noslash(saved_upper)]; 
define(shmreg,`shRMM$1|')
define(shmreg_noslash,`shRMM$1')
pattern shmregs means[forloop(`i',saved_lower,saved_mid,`shmreg(i)')shmreg_noslash(saved_upper)];

define(uwmreg,`uwRMM$1|')
define(uwmreg_noslash,`uwRMM$1')
pattern uwmregs means[forloop(`i',saved_lower,saved_mid,`uwmreg(i)')uwmreg_noslash(saved_upper)]; 
define(swmreg,`swRMM$1|')
define(swmreg_noslash,`swRMM$1')
pattern swmregs means[forloop(`i',saved_lower,saved_mid,`swmreg(i)')swmreg_noslash(saved_upper)];

 
/*\end{verbatim}
\subsubsection{Double precision floating point registers}
These are stored in a single general purpose register since the EE has no
dedicated double precision circuit.
\begin{verbatim}
*/

define(i64rr,`alias register int64 i64RR$1=RMM$1(0:63) assembles[' `'' `$$1'`''`] ;
')
forloop(`i',saved_lower,saved_upper,`i64rr(i)')

/*\end{verbatim}
\subsubsection{32 bit integer registers}
These are the MIPs 1 subset of registers and are aliased to the
low order bits of the RMM registers.\begin{verbatim}
*/
define(irr,`alias register int32 iRR$1=i64RR$1(0:31) assembles[' `'' `$$1'`''`] ;
')
define(rr,`alias register word RR$1=RMM$1(0:31) assembles[' `'' `$$1'`''`] ;
')
define(brr,`alias register int8 bRR$1=iRR$1(0:7) assembles[' `'' `$$1'`''`] ;
')
define(obrr,`alias register octet obRR$1=iRR$1(0:7) assembles[' `'' `$$1'`''`] ;
')

define(uwrr,`alias register halfword uwRR$1=iRR$1(0:15) assembles[' `'' `$$1'`''`] ;
')
define(wrr,`alias register int16 wRR$1=iRR$1(0:15) assembles[' `'' `$$1'`''`] ;
')
forloop(`i',saved_lower,saved_upper,`irr(i)')
forloop(`i',saved_lower,saved_upper,`rr(i)')

reserved register int64 i64A0 assembles[ '  $4'];
reserved register int64 i64A1 assembles[ '  $5'];
reserved register int64 i64A2 assembles[ '  $6'];
reserved register int64 i64A3 assembles[ '  $7'];




reserved register int32 R0 assembles[ '  $0'];
reserved register int32 A0 assembles[ '  $4'];
reserved register int32 A1 assembles[ '  $5'];
reserved register int32 A2 assembles[ '  $6'];
reserved register int32 A3 assembles[ '  $7'];
reserved register int64 V0 assembles[ '  $2'];
reserved register int64 V1 assembles[ '  $3'];
reserved register int32 RA assembles[ '  $31'];
reserved register int32 eSP assembles[ '  $sp'];
reserved register int32 GP assembles[ '  $gp'];
register int8 cpf assembles ['cpf'];
pattern cpflag means[cpf];
register word realBP assembles[' $fp'] ;
alias register word realFP = realBP(0:31) assembles [' $fp'];
alias register word SP = eSP(0:31) assembles [' $sp'];

register word BP assembles[' $23'] ;
alias register word FP = BP(0:31) assembles [' $23'];

reserved register int64 T0 assembles[ '  $8'];
reserved register int64 T1 assembles[ '  $9'];
reserved register int64 T2 assembles[ '  $10'];
reserved register int64 T3 assembles[ '  $11'];
reserved register int64 T4 assembles[ '  $12'];
reserved register int64 T5 assembles[ '  $13'];
reserved register int64 T6 assembles[ '  $14'];
reserved register int64 T7 assembles[ '  $15'];
reserved register int64 T8 assembles[ '  $24'];
reserved register int64 T9 assembles[ '  $25'];

register int32 hi assembles ['hi'];
pattern rhi means[hi];
register int32 lo assembles ['lo'];
pattern rlo means[lo];

pattern argregs means [i64A0|i64A1|i64A2|i64A3];

forloop(`i',saved_lower,saved_upper,`brr(i)')

forloop(`i',saved_lower,saved_upper,`obrr(i)')
forloop(`i',saved_lower,saved_upper,`wrr(i)')

forloop(`i',saved_lower,saved_upper,`uwrr(i)')
/*\end{verbatim}
\subsubsection{32 bit unsigned integer registers}
These are the MIPs 1 subset of registers and are aliased to the
low order bits of the RMM registers.\begin{verbatim}
*/
define(uirr,`alias register uint32 uiRR$1=RMM$1(0:31) assembles[' `'' `$$1'`''`] ;
')

forloop(`i',saved_lower,saved_upper,`uirr(i)')

/*\end{verbatim}
\subsubsection{Double precision floating point registers}
These are stored in a single general purpose register since the EE has no
dedicated double precision circuit.
\begin{verbatim}
*/
define(ieee64rr,`alias register ieee64 DFPR$1=RMM$1(0:63) assembles[' `'' `$$1'`''`] ;
')
forloop(`i',saved_lower,saved_upper,`ieee64rr(i)')


/*\end{verbatim}
\subsubsection{32 bit floating point registers}
Assume register f0 for return values of functions and that
f12 and 14 used for function parameters.
Only the even registers can be used, the odd ones are unused on the MIPS
because there are no double precision floating point operations
 \begin{verbatim}
*/
reserved register ieee32 FPR0 assembles[ '  $f0'];

reserved register ieee32 FPR12 assembles[ '  $f12'];
reserved register ieee32 FPR14 assembles[ '  $f14'];

reserved register ieee32 FPR2 assembles[  ' $f2'];
reserved register ieee32 FPR4 assembles[  ' $f4'];
reserved register ieee32 FPR6 assembles[  ' $f6'];
reserved register ieee32 FPR8 assembles[  ' $f8'];
reserved register ieee32 FPR10 assembles[  ' $f10'];
reserved register ieee32 FPR16 assembles[  ' $f16'];
reserved register ieee32 FPR18 assembles[  ' $f18'];
register ieee32 FPR20 assembles[  ' $f20'];
register ieee32 FPR22 assembles[  ' $f22'];
register ieee32 FPR24 assembles[  ' $f24'];
register ieee32 FPR26 assembles[  ' $f26'];
register ieee32 FPR28 assembles[  ' $f28'];
register ieee32 FPR30 assembles[  ' $f30'];

reserved register ieee32 FPR1 assembles[  ' $f1'];
reserved register ieee32 FPR3 assembles[  ' $f3'];
reserved register ieee32 FPR5 assembles[  ' $f5'];
reserved register ieee32 FPR7 assembles[  ' $f7'];
reserved register ieee32 FPR9 assembles[  ' $f9'];
reserved register ieee32 FPR11 assembles[  ' $f11'];
reserved register ieee32 FPR13 assembles[  ' $f13'];
reserved register ieee32 FPR15 assembles[  ' $f15'];
reserved register ieee32 FPR17 assembles[  ' $f17'];
reserved register ieee32 FPR19 assembles[  ' $f19'];
reserved register ieee32 FPR21 assembles[  ' $f21'];
reserved register ieee32 FPR23 assembles[  ' $f23'];
reserved register ieee32 FPR25 assembles[  ' $f25'];
reserved register ieee32 FPR27 assembles[  ' $f27'];
reserved register ieee32 FPR29 assembles[  ' $f29'];
reserved register ieee32 FPR31 assembles[  ' $f31'];

reserved register word FCSR assembles[  ' $31'];

define(FRRL,`FPR$1|')
define(FRRL_noslash,`FPR$1')
pattern freg means[forloop(`i',f_saved_lower,f_saved_mid,`FRRL(i)')FRRL_noslash(f_saved_upper)|FPR0|FPR12|FPR14];

/* \end{verbatim}
Declare a bunch of integer registers that occupy the same state bits
as the floating point registers. This will allow integer variables 
to be loaded into them prior to executing a conversion instruction
to convert integers to floats. There are no move instructions 
between the float registers and the integer registers so
this is necessary to float an integer. \begin{verbatim}*/ 

define(ifpr,`alias register int32 iFPR$1=FPR$1(0:31) assembles[' `'' `$f$1'`''`] ;
')

forloop(`i',0,31,`ifpr(i)')

define(iFRRL,`iFPR$1|')
define(iFRRL_noslash,`iFPR$1')
pattern ifreg means[forloop(`i',0,30,`iFRRL(i)')iFRRL_noslash(31)];
pattern anyfreg means[freg|ifreg];


/*\end{verbatim}
 \subsection{Register classes}
\begin{verbatim}*/
/* general purpose integer regs */
pattern ZEROREG() means [0] assembles ['$0'];
define(IRRL,`iRR$1|')
define(IRRL_noslash,`iRR$1')
pattern greg means[forloop(`i',saved_lower,saved_mid,`IRRL(i)')IRRL_noslash(saved_upper)|R0|A0|A1|A2|A3|V0|V1|T0|T1|T2|T3|T4|T5|T6|T7|RA|eSP|GP|FP|BP|realFP|realBP];
/* half word registers */

define(shwregdef,`wRR$1|')
define(shwregdef_noslash,`wRR$1')
pattern shwreg means[forloop(`i',saved_lower,saved_mid,`shwregdef(i)')shwregdef_noslash(saved_upper)];

define(uhwregdef,`uwRR$1|')
define(uhwregdef_noslash,`uwRR$1')
pattern uhwreg means[forloop(`i',saved_lower,saved_mid,`uhwregdef(i)')uhwregdef_noslash(saved_upper)];

pattern hwreg means[shwreg|uhwreg];

define(wregdef,`RR$1|')
define(wregdef_noslash,`RR$1')
pattern wreg means[forloop(`i',saved_lower,saved_mid,`wregdef(i)')wregdef_noslash(saved_upper)];

define(uwregdef,`uiRR$1|')
define(uwregdef_noslash,`uiRR$1')
pattern uwreg means[forloop(`i',saved_lower,saved_mid,`uwregdef(i)')uwregdef_noslash(saved_upper)];

/* byte regs holding 8 bit ints */
define(bregdef,`bRR$1|')
define(bregdef_noslash,`bRR$1')
pattern breg means[forloop(`i',saved_lower,saved_mid,`bregdef(i)')bregdef_noslash(saved_upper)];

/* byte registers holding untyped octets */
define(obregdef,`obRR$1|')
define(obregdef_noslash,`obRR$1')
pattern obreg means[forloop(`i',saved_lower,saved_mid,`obregdef(i)')obregdef_noslash(saved_upper)];
define(UIRRL,`uiRR$1|')
define(UIRRL_noslash,`uiRR$1')
pattern ugreg means[forloop(`i',saved_lower,saved_mid,`UIRRL(i)')UIRRL_noslash(saved_upper)];

/* 64 bit registers to hold a single 64-bit double value */
define(DFPRL,`DFPR$1|')
define(DFPRL_noslash,`DFPR$1')
pattern dfreg means[forloop(`i',saved_lower,saved_upper,`DFPRL(i)')DFPRL_noslash(saved_upper)];

/* 64 bit registers to hold a single 64-bit integer value */
define(i64reg,`i64RR$1|')
define(i64reg_noslash,`i64RR$1')
pattern reg64 means[forloop(`i',saved_lower,saved_upper,`i64reg(i)')i64reg_noslash(saved_upper)];

pattern reg means[greg|ugreg|wreg|dfreg|reg64];
pattern regincob means[reg|obreg];

pattern ireg means[greg|reg64];
pattern dwregs means[reg64|dfreg];

pattern vecregs means [ubmregs|sbmregs|ubmregs|shmregs|uwmregs|swmregs];

/* vu0 macro mode registers, note vf0 is defined but not used as it
is a constant register set to [1,0,0,0] */
define(vfr,`register real vector(4) VF$1 assembles[ ' `'' `vf$1'`''`];
')
forloop(`i',0,31,`vfr(i)')

define(vfreg,`VF$1|')
pattern vfregs means[forloop(`i',1,31,`vfreg(i)')VF7];

register real VU0Q assembles ['vq'];
pattern v0q means[VU0Q];

/*\end{verbatim}
\subsection{Operator definition}
This section defines operations that can be used to parameterise
functions.
\begin{verbatim}
*/
operation add means  +  assembles [ 'add'];
operation and means  AND  assembles[ 'and'];
operation or means OR assembles['or'];
operation xor means XOR assembles['xor'];/* */
operation sub means  -  assembles [ 'sub'];
operation mul means * assembles ['mul'];
operation divide means div assembles ['div'];
operation rem means MOD assembles['rem'];
operation max means MAX assembles['max'];
operation min means MIN assembles['min'];
operation srav means >> assembles['srav'];
operation sllv means << assembles['sllv'];

/*pattern maxmin means[MAX|MIN];*/
pattern nonmultoperator means[add|sub|sllv|srav];
pattern bitwiseoperator means[and|or|xor];
pattern arithoperator means[add|sub|divide|mul];
pattern pbarithop means[add|sub];

/* Address modes */

pattern labelf(label l)
	means [l]
	assembles['$'l];
pattern barelab(label l)
	means[l]
	assembles[l];
pattern labelconstf(barelab l,signed s)
	means [+(l,const s)]
	assembles[ l '+'s];
pattern literal means [signed|unsigned];
pattern constf(literal s)
	means[const s]
	assembles [s];
pattern offset means[constf];
pattern regindirf(reg r)
	means[^(r) ]
	assembles['0(' r ')'];
pattern baseminusoffsetf(reg r, constf s )
	means[-(   ^(r) ,  s)]
	assembles[   '- ' s '('r')'];
pattern baseplusoffsetf(reg r, offset s )
	means[+(   ^(r) ,  s)]
	assembles[   s'('r')' ];
pattern dirf(offset s)
	means[s]
	assembles[' 's'($gp)'];
pattern uncasteaform means[
	dirf| 
	baseplusoffsetf | 
	baseminusoffsetf|
        regindirf
]; 
pattern eaform(uncasteaform f,longint t)  /* allow the address expression to be cast to an integer */
	means[(t)f]
	assembles[f];
/*\end{verbatim}
 \subsection{ Formats for all memory addresses}
 \begin{verbatim}*/
pattern addrform means[eaform|regindirf];
/*-------------------- Data movment ---------------------------*/
instruction pattern LW(greg r1,addrform a, wordupto32 t)
	means[(ref t)r1:=(t)^(mem(a))]
	assembles['lw 'r1','a ];
instruction pattern LD(dwregs r1,addrform a, dword t)
	means[(ref t)r1:=(t)^(mem(a))]
	assembles['ldl 'r1','a '\n ldr 'r1','a ];
instruction pattern LWC1(anyfreg r1,addrform a)
	means[r1:=(ieee32)^(mem(a))]
	assembles['lwc1 'r1','a ];
 
instruction pattern SW(reg r1,addrform a, wordupto32 t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['sw 'r1','a];
instruction pattern SWZERO(addrform a, word32 t)
	means[(ref t)mem(a):=0]
	assembles['sw $0,'a];
instruction pattern SWC1(freg r1,addrform a)
	means[(ref ieee32)mem(a):=^(r1)]
	assembles['swc1 'r1','a];
instruction pattern SH(hwreg r1,addrform a)
	means[(ref halfword)mem(a):=(halfword)^(r1)]
	assembles['sh 'r1','a];
instruction pattern SHZERO(addrform a, word16 t)
	means[(ref t)mem(a):=0]
	assembles['sh $0,'a];
instruction pattern SB(breg r1,addrform a, byte t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['sb 'r1','a];
instruction pattern SBZERO(addrform a, byte t)
	means[(ref t)mem(a):=0]
	assembles['sb $0,'a];
instruction pattern SoB(obreg r1,addrform a)
	means[(ref octet)mem(a):=^(r1)]
	assembles['sb 'r1','a];
instruction pattern SUW(uhwreg r1,addrform a)
	means[(ref halfword)mem(a):=^(r1)]
	assembles['ush 'r1','a];
instruction pattern SD(dwregs r1,addrform a, dword t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['sdl 'r1','a'\n sdr 'r1','a];
instruction pattern SDZERO(addrform a)
	means[(ref int64)mem(a):=0]
	assembles['sdl $0,'a'\n sdr $0,'a];
instruction pattern SWOTHER(reg r1,addrform a)
	means[mem(a):=^(r1)]
	assembles['sw 'r1','a];
instruction pattern LB(reg r1,addrform a)
	means[r1:=EXTEND((ref int8)^(mem(a)))]
	assembles['lb 'r1','a];
instruction pattern LBU(reg r1,addrform a)
	means[r1:=EXTEND(^((ref uint8)mem(a)))]
	assembles['lbu 'r1','a];
instruction pattern LoB(obreg r1,addrform a)
	means[r1:=(octet) ^(mem(a))]
	assembles['lb 'r1','a];
instruction pattern LH(reg r1,addrform a)
	means[r1:=EXTEND(^((ref halfword)mem(a)))]
	assembles['lh 'r1','a];
instruction pattern LHU(reg r1,addrform a)
	means[r1:=EXTEND(^((ref uint16)mem(a)))]
	assembles['lhu 'r1','a];

instruction pattern LA(greg r1,barelab s)
	means[r1:=s]
	assembles['la 'r1','s];
instruction pattern LI(reg r1,offset s, wordupto64 t)
	means[(ref t)r1:=s]
	assembles['li 'r1','s];
instruction pattern FLOADLIT(float f,freg r1)
	means[r1:=const f]
	assembles['li.s 'r1', 'f];
instruction pattern DLOADLIT(double f,reg r1)
	means[(ref ieee64)r1:=const f]
	assembles['li.d 'r1', 'f];
instruction pattern MOV(wordupto64 t, reg r1, reg r2)
	means[r1:=(t)^(r2)]
	assembles['move 'r1','r2];
instruction pattern MOVEXTEND(type t, reg r1, reg r2)
	means[(ref t)r1:=(t)EXTEND(^(r2))]
	assembles['move 'r1','r2];
instruction pattern MOVB(type t, reg r1, breg r2)
	means[(ref t)r1:=(t)EXTEND(^(r2))]
	assembles['move 'r1','r2];
instruction pattern MOVS(type t, freg r1, freg r2)
	means[r1:=(t)^(r2)]
	assembles['mov.s 'r1','r2];
instruction pattern LDPARAM(dword t, argregs r1, addrform a)
	means[r1:=(t)^(mem(a))]
	assembles['.set mips2\n ld 'r1','a'\n .set mips0'];
instruction pattern MTC1(type t, freg r1, reg r2)
	means[(ref t)r1:=(t)^(r2)]
	assembles['mtc1 'r2','r1];
instruction pattern MFC1(type t, reg r1, anyfreg r2)
	means[(ref t)r1:=(t)^(r2)]
	assembles['mfc1 'r1','r2];
instruction pattern ROUND32(anyfreg r1,freg r2)
	means[r1:=ROUND(^(r2))]
	assembles['cvt.w.s 'r1','r2];
instruction pattern PUSHR(reg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['addi $sp,-4\n sw 'r',0($sp)'];
instruction pattern PUSHFR(freg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['addi $sp,-4\n s.s 'r',0($sp)'];
instruction pattern SFLOAT(freg r1,ifreg r2)
	means[r1:=(ieee32)FLOAT(r2)]
	assembles['cvt.s.w 'r1','r2];
instruction pattern FPTODP(dfreg r1,freg r2)
	means[r1:=(ieee64)EXTEND((ref ieee32)^(r2))]
	assembles['mov.s $f12, 'r2'\n jal fptodp\n move 'r1', $2'];
/* --------------------------- Pseudo operations --------------------*/	

  
instruction pattern GETcpf(breg b, cpflag f)
	means[b:=^(f)]
	assembles['li '  b   ',-1'
                  '\n bc1t 1f'
                  '\n xor 'b','b','b
                  '\n 1:'];
				  
/* Floating point math opertions */	  

instruction pattern FMOPabs(freg r1, freg r2 )
	means[r1:=ABS(^(r2))]
	assembles['abs.s 'r2', 'r1];
instruction pattern FMOPsqrt(freg r1, freg r2 )
	means[r1:=SQRT(^(r2))]
	assembles['sqrt.s 'r2', 'r1];
instruction pattern FMOPtan(freg r1, freg r2 )
	means[r1:=TAN(^(r2))]
	assembles['mov.s $f12,'r2'\n jal fptodp\n move $4,$2\n move $5,$3\n jal tan\n move $4,$2\n move $5,$3\n jal dptofp\n mov.s 'r1',$f0'];
instruction pattern FMOPln(freg r1, freg r2 )
	means[r1:=LN(^(r2))]
	assembles['mov.s $f12,'r2'\n jal fptodp\n move $4,$2\n move $5,$3\n jal log\n move $4,$2\n move $5,$3\n jal dptofp\n mov.s 'r1',$f0'];
instruction pattern FMOPsin(freg r1, freg r2 )
	means[r1:=SIN(^(r2))]
	assembles['mov.s $f12,'r2'\n jal fptodp\n move $4,$2\n move $5,$3\n jal sin\n move $4,$2\n move $5,$3\n jal dptofp\n mov.s 'r1',$f0'];
instruction pattern FMOPcos(freg r1, freg r2 )
	means[r1:=COS(^(r2))]
	assembles['mov.s $f12,'r2'\n jal fptodp\n move $4,$2\n move $5,$3\n jal cos\n move $4,$2\n move $5,$3\n jal dptofp\n mov.s 'r1',$f0'];


/* double precision math operations */
instruction pattern DOPabs(dfreg r1, dfreg r2 )
	means[r1:=ABS(^(r2))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0 \n jal abs\n pextlw 'r1', $3, $2'];
instruction pattern DOPsqrt(dfreg r1, dfreg r2 )
	means[r1:=SQRT(^(r2))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0 \n jal sqrt\n pextlw 'r1', $3, $2'];
instruction pattern DOPtan(dfreg r1, dfreg r2 )
	means[r1:=TAN(^(r2))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0 \n jal tan\n pextlw 'r1', $3, $2'];
instruction pattern DOPln(dfreg r1, dfreg r2 )
	means[r1:=LN(^(r2))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0 \n jal log\n pextlw 'r1', $3, $2'];
instruction pattern DOPsin(dfreg r1, dfreg r2 )
	means[r1:=SIN(^(r2))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0 \n jal sin\n pextlw 'r1', $3, $2'];
instruction pattern DOPcos(dfreg r1, dfreg r2 )
	means[r1:=COS(^(r2))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0 \n jal cos\n pextlw 'r1', $3, $2'];
	
instruction pattern PLANT(label l)
	means[l]
	assembles[l ':'];  
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
/* --------------------------- Control ---------------------------*/
instruction pattern GOTO(label l)
	means[goto l]
	assembles['j ' l];
instruction pattern GOTOINDIRECT(reg l)
	means[goto ^(l)]
	assembles['jr ' l];
operation lt means < assembles ['lt'];
operation gt means > assembles ['gt'];
operation eq means = assembles ['eq']; 
operation le means <= assembles ['le']; 
operation ge means >= assembles ['ge'];
operation ne means <> assembles ['ne'];
pattern conditionequality means[ne|eq];
pattern comparecondition means [le|eq|lt];
instruction pattern IFSGOTO(label l,freg r1, freg  r2,comparecondition c)
	means[if((int8)c( ^(r1),^(r2)))goto l]
	assembles['c.'c'.s ' r1 ','  r2  '\n bc1t ' l];
	
instruction pattern IFSGTGOTO(label l,freg r1, freg  r2)
	means[if((int8)>( ^(r1),^(r2)))goto l]
	assembles['c.lt.s ' r2 ','  r1  '\n bc1t ' l];
instruction pattern IFSGEGOTO(label l,freg r1, freg  r2)
	means[if((int8)>=( ^(r1),^(r2)))goto l]
	assembles['c.le.s ' r2 ','  r1  '\n bc1t ' l];
instruction pattern IFSNEGOTO(label l,freg r1, freg  r2)
	means[if((int8)<>( ^(r1),^(r2)))goto l]
	assembles['c.eq.s ' r1 ','  r2  '\n bc1f ' l];

instruction pattern IFGOTO(label l,reg r1, reg  r2,conditionequality c)
	means[if((int8)c( ^(r1),^(r2)))goto l]
	assembles['b'c' ' r1 ','  r2  ',' l];
instruction pattern IFGTGOTO(label l,reg r1, reg  r2)
	means[if((int8)>( ^(r1),^(r2)))goto l]
	assembles['slt $8 ,' r2 ',' r1  '\n bne $8, $0, ' l];
instruction pattern IFLTGOTO(label l,reg r1, reg  r2)
	means[if((int8)<( ^(r1),^(r2)))goto l]
	assembles['slt $8 ,' r1 ',' r2  '\n bne $8, $0, ' l];
instruction pattern IFGEGOTO(label l,reg r1, reg  r2)
	means[if((int8)>=( ^(r1),^(r2)))goto l]
	assembles['slt $8 ,' r1 ',' r2  '\n beq $8, $0, ' l];
instruction pattern IFLEGOTO(label l,reg r1, reg  r2)
	means[if((int8)<=( ^(r1),^(r2)))goto l]
	assembles['slt $8 ,' r2 ',' r1  '\n beq $8, $0, ' l];
	
instruction pattern SETLT(reg r1,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) <((t)^(r1),^( rm))]
	assembles['slt ' b ',' r1 ',' rm  '\n subu 'b  ', $0, 'b];
instruction pattern SETGT(reg r1,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) >((t)^(r1),^( rm))]
	assembles['slt ' b ',' rm ',' r1  '\n subu 'b  ', $0, 'b];
instruction pattern SETEQ(reg r1,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) =((t)^(r1),(t)^( rm))]
	assembles['slt $2,' rm ',' r1  '\n slt $3,' r1 ',' rm '\n or $2, $2, $3\n addiu 'b  ', $2, -1'];
instruction pattern SETLE(reg r1,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) <=((t)^(r1),^( rm))]
	assembles['slt ' b ',' rm ',' r1  '\n addiu 'b ', ' b ', -1'];
instruction pattern SETGE(reg r1,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) >=((t)^(r1),^( rm))]
	assembles['slt ' b ',' r1 ',' rm  '\n addiu 'b ', ' b ', -1'];
instruction pattern SETNE(reg r1,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) <>((t)^(r1),^( rm))]
	assembles['slt $2,' rm ',' r1  '\n slt $3,' r1 ',' rm  '\n or $2, $2, $3\n subu 'b  ', $0, $2'];
	
instruction pattern SETLTI(reg r1,offset s, breg b,signed t, byte bt)
	means[b:=(bt) <((t)^((ref t)r1),(wordupto16)s)]
	assembles['slti ' b ',' r1 ',' s  '\n subu 'b  ', $0, 'b];
instruction pattern SETGTI(offset s,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) >((wordupto16)s,(t)^( (ref t)rm))]
	assembles['slti ' b ',' rm ',' s  '\n subu 'b  ', $0, 'b];
instruction pattern SETLEI(offset s,reg rm, breg b,signed t, byte bt)
	means[b:=(bt) <=((wordupto16)s,(t)^( (ref t)rm))]
	assembles['slti ' b ',' rm ',' s  '\n addiu 'b ', ' b ', -1'];
instruction pattern SETGEI(reg r1,offset s, breg b,signed t, byte bt)
	means[b:=(bt) >=((t)^((ref t)r1),(wordupto16)s)]
	assembles['slti ' b ',' r1 ',' s  '\n addiu 'b ', ' b ', -1'];


	
instruction pattern SETfpcomp(freg r1,freg r2, breg b, byte bt,comparecondition c)
	means[b:=(bt) c((ieee32)^(r1),(ieee32)^(r2))]
	assembles['c.'c'.s 'r1','r2 '\n cfc1 $8, $31\n srl $8, $8, 23\n andi $8, $8, 1\n subu 'b', $0, $8'];

instruction pattern SETfpgt(freg r1,freg r2, breg b, byte bt)
	means[b:=(bt) >((ieee32)^(r1),(ieee32)^(r2))]
	assembles['c.le.s 'r1','r2 '\n cfc1 $8, $31\n srl $8, $8, 23\n andi $8, $8, 1\n addiu 'b', $8, -1'];
instruction pattern SETfpge(freg r1,freg r2, breg b, byte bt)
	means[b:=(bt) >=((ieee32)^(r1),(ieee32)^(r2))]
	assembles['c.lt.s 'r1','r2 '\n cfc1 $8, $31\n srl $8, $8, 23\n andi $8, $8, 1\n addiu 'b', $8, -1'];
instruction pattern SETfpne(freg r1,freg r2, breg b, byte bt)
	means[b:=(bt) <>((ieee32)^(r1),(ieee32)^(r2))]
	assembles['c.eq.s 'r1','r2 '\n cfc1 $8, $31\n srl $8, $8, 23\n andi $8, $8, 1\n addiu 'b', $8, -1'];

instruction pattern SETdpeq(dfreg r1,dfreg r2, breg b, byte bt)
	means[b:=(bt) =((ieee64)^(r1),(ieee64)^(r2))]
	assembles['move $4,'r1'\n move $5,'r2'\n jal dpcmp\n andi $2,$2,1\n addiu 'b',$2,-1'];
instruction pattern SETdplt(dfreg r1,dfreg r2, breg b, byte bt)
	means[b:=(bt) <((ieee64)^(r1),(ieee64)^(r2))]
	assembles['move $4,'r1'\n move $5,'r2'\n jal dpcmp\n sra 'b',$2,1'];
instruction pattern SETdpgt(dfreg r1,dfreg r2, breg b, byte bt)
	means[b:=(bt) >((ieee64)^(r1),(ieee64)^(r2))]
	assembles['move $4,'r1'\n move $5,'r2'\n jal dpcmp\n subu $2,$0,$2\n sra 'b',$2,1'];
instruction pattern SETdple(dfreg r1,dfreg r2, breg b, byte bt)
	means[b:=(bt) <=((ieee64)^(r1),(ieee64)^(r2))]
	assembles['move $4,'r1'\n move $5,'r2'\n jal dpcmp\n addiu $2,$2,-1\n sra 'b',$2,1'];
instruction pattern SETdpge(dfreg r1,dfreg r2, breg b, byte bt)
	means[b:=(bt) >=((ieee64)^(r1),(ieee64)^(r2))]
	assembles['move $4,'r1'\n move $5,'r2'\n jal dpcmp\n subu $2,$0,$2\n addiu $2,$2,-1\n sra 'b',$2,1'];
instruction pattern SETdpne(dfreg r1,dfreg r2, breg b, byte bt)
	means[b:=(bt) <>((ieee64)^(r1),(ieee64)^(r2))]
	assembles['move $4,'r1'\n move $5,'r2'\n jal dpcmp\n andi $2,$2,1\n subu 'b',$0,$2'];
	
	
instruction pattern IFBOOL(label l,breg r1)
	means[ if( (int8)^(r1))goto l]
	assembles['bnez ' r1 ','  l];
instruction pattern IFcpf(label l , cpflag f)
	means[ if( (int8)^(f))goto l]
	assembles['bc1t '   l];
/* -------------------------- Computation -------------------------*/ 
instruction pattern ADDIR(greg r1, greg r2, offset s)
        means[r1:=  +(  ^(  r2), s)]
	assembles['addi 'r1',' r2 ',' s];
instruction pattern ADDIL(greg r1, greg r2, offset s)
        means[r1:=  +(  s, ^(  r2))]
	assembles['addi 'r1',' r2 ',' s];
instruction pattern ADDIUR(greg r1, greg r2, offset s)
        means[r1:=  +(  ^(  r2), s)]
	assembles['addiu 'r1',' r2 ',' s];
instruction pattern ANDIR(ireg r1, ireg r2, offset s)
        means[r1:=  AND(  ^(  r2), s)]
	assembles['andi 'r1',' r2 ',' s];
instruction pattern ANDIL(ireg r1, ireg r2, offset s)
        means[r1:=  AND(  s, ^(  r2))]
	assembles['addi 'r1',' r2 ',' s];
instruction pattern ORIR(ireg r1, ireg r2, offset s)
        means[r1:=  OR(  ^(  r2), s)]
	assembles['ori 'r1',' r2 ',' s];
instruction pattern ORIL(ireg r1, ireg r2, offset s)
        means[r1:=  OR(  s, ^(  r2))]
	assembles['ori 'r1',' r2 ',' s];
instruction pattern XORIR(ireg r1, ireg r2, offset s)
        means[r1:=  XOR(  ^(  r2), s)]
	assembles['xori 'r1',' r2 ',' s];
instruction pattern XORIL(ireg r1, ireg r2, offset s)
        means[r1:=  XOR(  s, ^(  r2))]
	assembles['xori 'r1',' r2 ',' s];
instruction pattern SRA(greg r1, greg r2, offset s, signed t)
        means[(ref t)r1:=  (t)>>(  ^(  r2), s)]
	assembles['sra 'r1',' r2 ',' s];
instruction pattern SRL(greg r1, greg r2, offset s, unsigned t)
        means[(ref t)r1:=  (t)>>(  ^(  r2), s)]
	assembles['srl 'r1',' r2 ',' s];
instruction pattern SLL(greg r1, greg r2, offset s, signed t)
        means[(ref t)r1:=  <<(  (t)^(  r2), s)]
	assembles['sll 'r1',' r2 ',' s];
instruction pattern NEGieee32(freg r1, freg r2)
        means[r1:=  -(0.0, ^(  r2))]
	assembles['neg.s 'r1',' r2];
instruction pattern RRRbitwise(bitwiseoperator op, ireg r1, ireg r2, ireg r3, wordupto64 t)
        means[(ref t)r1:=  op(  (t)^(  r2), (t)^(  r3))]
	assembles[op ' 'r1',' r2 ',' r3];
instruction pattern RRRint32( nonmultoperator op, greg r1, greg r2, greg r3, wordupto32 t)
        means[(ref t)r1:= op(  (t)^(  r2), (t)^(  r3))]
	assembles[op ' 'r1',' r2 ',' r3];
instruction pattern RRRint64( nonmultoperator op, reg64 r1, reg64 r2, reg64 r3)
        means[(int64)r1:=  (int64)op(  ^(  r2), ^(  r3))]
	assembles['d'op ' 'r1',' r2 ',' r3];
instruction pattern RRRieee32( arithoperator op, freg r1, freg r2, freg r3)
        means[r1:=  op(  ^(  r2), ^(  r3))]
	assembles[op '.s 'r1',' r2 ',' r3];
instruction pattern RRRieee64( arithoperator op, dfreg r1, dfreg r2, dfreg r3)
        means[(ref ieee64)r1:=  op(  ^(  r2), ^(  r3))]
	assembles['move $4,'r2'\n dsra32 $5,'r2', 0\n move $6,'r3'\n dsra32 $7,'r3', 0\n jal dp'op'\n pextlw 'r1', $3, $2'];
instruction pattern MULTint32(  rlo r1, greg r2, greg r3, wordupto32 t)
        means[(ref t)r1:=  *(  (t)^(  r2), (t)^(  r3))]
	assembles['mult 'r2 ',' r3];
instruction pattern MULTuint32(  rlo r1, uwreg r2, uwreg r3, unsigned t)
        means[r1:=  (t)*(  ^(  (t)r2), ^(  (t)r3))]
	assembles['multu ' r2 ','r3];
instruction pattern DIVint32(  rlo r1, greg r2, greg r3, wordupto32 t)
    means[(ref t)r1:=  div(  (t)^(  r2), (t)^(  r3))]
	assembles['div  'r2',' r3];
instruction pattern MODint32(  rhi r1, greg r2, greg r3, wordupto32 t)
    means[(ref t)r1:=  MOD(  (t)^(  r2), (t)^(  r3))]
	assembles['div  'r2',' r3];
instruction pattern MFHI(  rhi r1, greg r2)
    means[r2:= r1]
	assembles['mfhi 'r2];
instruction pattern MFLO(  rlo r1, greg r2)
    means[r2:= r1]
	assembles['mflo 'r2];
instruction pattern MAXint32(greg r1, greg r2, greg r3)
        means[(ref int32)r1:=  MAX(  (int32)^(  r2), (int32)^(  r3))]
	assembles[ 'pmaxw  'r1','r2','r3 ];
instruction pattern MINint32(greg r1, greg r2, greg r3)
        means[(ref int32)r1:=  MIN(  (int32)^(  r2), (int32)^(  r3))]
	assembles[ 'pminw  'r1','r2','r3 ];
instruction pattern MAXint16(greg r1, greg r2, greg r3)
        means[(ref int16)r1:=  MAX(  (int16)^(  r2), (int16)^(  r3))]
	assembles[ 'pmaxh  'r1','r2','r3 ];
instruction pattern MINint16(greg r1, greg r2, greg r3)
        means[(ref int16)r1:=  MIN(  (int16)^(  r2), (int16)^(  r3))]
	assembles[ 'pminh  'r1','r2','r3 ];
instruction pattern MAXieee32(freg r1, freg r2, freg r3)
        means[r1:=  MAX(  ^(  r2), ^(  r3))]
	assembles['max.s  'r1','r2',' r3 ];
instruction pattern MINieee32(freg r1, freg r2, freg r3)
        means[r1:=  MIN(  ^(  r2), ^(  r3))]
	assembles['min.s  'r1','r2',' r3 ];
instruction pattern NOTOP(regincob rm,regincob r1, wordupto64 t)
	means[(ref t)r1:= NOT((t)^(rm))]
	assembles['nor 'r1' ,' rm ', $0'];

define(typehexb,int8 vector(16))
define(typehexoct,octet vector(16))
define(typehexub,uint8 vector(16))

define(typeocth,int16 vector(8))
define(typeoctuh,uint16 vector(8))

define(typequadw,int32 vector(4))
define(typequaduw,uint32 vector(4))

define(reftypehexoct,ref typehexoct)
define(reftypehexb,ref typehexb)
define(reftypehexub,ref typehexub)

define(reftypeocth,ref typeocth)
define(reftypeoctuh,ref typeoctuh)

define(reftypequadw,ref typequadw)
define(reftypequaduw,ref typequaduw)

define(hexub,(typehexub)$1)
define(hexb,(typehexb)$1)
define(hexoct,(typehexoct)$1)
define(refhexub,(reftypehexub)$1)
define(refhexb,(reftypehexb)$1)
define(refhexoct,(reftypehexoct)$1)

define(octuh,(typeoctuh)$1)
define(octh,(typeocth)$1)
define(refoctuh,(reftypeoctuh)$1)
define(refocth,(reftypeocth)$1)

define(quaduw, (typequaduw)$1)
define(quadw, (typequadw)$1)
define(refquaduw,(reftypequaduw)$1)
define(refquadw,(reftypequadw)$1)

instruction pattern LQVECUB(ubmregs r1,addrform a)
	means[refhexub(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld 'r1',$3,$2'];
instruction pattern SQVECUB(ubmregs r1,addrform a)
	means[mem(a):=hexub(^(r1))]
	assembles['pcpyud $3,'r1',$3\n sdl 'r1','a'\n sdr 'r1','a'\n sdl $3,8+'a'\n sdr $3,8+'a];
instruction pattern PADDUB(ubmregs r1, ubmregs r2, ubmregs r3)
	means[refhexub(r1) := +(hexub(^(r2)),hexub(^(r3)))]
	assembles ['paddub 'r1 ',' r2 ',' r3];
instruction pattern PSUBUB(ubmregs r1, ubmregs r2, ubmregs r3)
	means[refhexub(r1) := -(hexub(^(r2)),hexub(^(r3)))]
	assembles ['psubub 'r1 ',' r2 ',' r3];
instruction pattern PCMPLTUB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := <(hexub(^(r2)),hexub(^(r3)))]
	assembles ['pcgtb 'r1 ',' r3 ',' r2];
instruction pattern PCMPGTUB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := >(hexub(^(r2)),hexub(^(r3)))]
	assembles ['pcgtb 'r1 ',' r2 ',' r3];
instruction pattern PCMPLEUB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := <=(hexub(^(r2)),hexub(^(r3)))]
	assembles ['pcgtb 'r1 ',' r2 ',' r3 '\n pnor ' r1 ',' r1 ', $0'];
instruction pattern PCMPGEUB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := >=(hexub(^(r2)),hexub(^(r3)))]
	assembles ['pcgtb 'r1 ',' r3 ',' r2 '\n pnor ' r1 ',' r1 ', $0'];
instruction pattern PCMPEQUB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := =(hexub(^(r2)),hexub(^(r3)))]
	assembles ['pceqb 'r1 ',' r3 ',' r2];
instruction pattern PCMPNEUB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := <>(hexub(^(r2)),hexub(^(r3)))]
	assembles ['pceqb 'r1 ',' r3 ',' r2 '\n pnor ' r1 ',' r1 ', $0'];
	
instruction pattern LQVECB(sbmregs r1,addrform a)
	means[refhexb(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld 'r1',$3,$2'];
instruction pattern SQVECB(sbmregs r1,addrform a)
	means[mem(a):=hexb(^(r1))]
	assembles['pcpyud $3,'r1',$3\n sdl 'r1','a'\n sdr 'r1','a'\n sdl $3,8+'a'\n sdr $3,8+'a];
instruction pattern PADDB(sbmregs r1, sbmregs r2, sbmregs r3)
	means[refhexb(r1) := +(hexb(^(r2)),hexb(^(r3)))]
	assembles ['paddb 'r1 ',' r2 ',' r3];
instruction pattern PSUBB(sbmregs r1, sbmregs r2, sbmregs r3)
	means[refhexb(r1) := -(hexb(^(r2)),hexb(^(r3)))]
	assembles ['psubb 'r1 ',' r2 ',' r3];
instruction pattern PCMPLTB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := <(hexb(^(r2)),hexb(^(r3)))]
	assembles ['pcgtb 'r1 ',' r3 ',' r2];
instruction pattern PCMPGTB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := >(hexb(^(r2)),hexb(^(r3)))]
	assembles ['pcgtb 'r1 ',' r2 ',' r3];
instruction pattern PCMPLEB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := <=(hexb(^(r2)),hexb(^(r3)))]
	assembles ['pcgtb 'r1 ',' r2 ',' r3 '\n pnor ' r1 ',' r1 ', $0'];
instruction pattern PCMPGEB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := >=(hexb(^(r2)),hexb(^(r3)))]
	assembles ['pcgtb 'r1 ',' r3 ',' r2 '\n pnor ' r1 ',' r1 ', $0'];
instruction pattern PCMPEQB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := =(hexb(^(r2)),hexb(^(r3)))]
	assembles ['pceqb 'r1 ',' r3 ',' r2];
instruction pattern PCMPNEB(vecregs r1, vecregs r2, vecregs r3)
	means[refhexb(r1) := <>(hexb(^(r2)),hexb(^(r3)))]
	assembles ['pceqb 'r1 ',' r3 ',' r2 '\n pnor ' r1 ',' r1 ', $0'];

instruction pattern LQVECUH(uhmregs r1,addrform a)
	means[refoctuh(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld 'r1',$3,$2'];
instruction pattern SQVECUH(uhmregs r1,addrform a)
	means[mem(a):=octuh(^(r1))]
	assembles['pcpyud $3,'r1',$3\n sdl 'r1','a'\n sdr 'r1','a'\n sdl $3,8+'a'\n sdr $3,8+'a];
instruction pattern PADDUH(uhmregs r1, uhmregs r2, uhmregs r3)
	means[refoctuh(r1) := +(octuh(^(r2)),octuh(^(r3)))]
	assembles ['padduh 'r1 ',' r2 ',' r3];
instruction pattern PSUBUH(uhmregs r1, uhmregs r2, uhmregs r3)
	means[refoctuh(r1) := -(octuh(^(r2)),octuh(^(r3)))]
	assembles ['psubuh 'r1 ',' r2 ',' r3];
	
instruction pattern LQVECH(shmregs r1,addrform a)
	means[refocth(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld 'r1',$3,$2'];
instruction pattern SQVECH(shmregs r1,addrform a)
	means[mem(a):=octh(^(r1))]
	assembles['pcpyud $3,'r1',$3\n sdl 'r1','a'\n sdr 'r1','a'\n sdl $3,8+'a'\n sdr $3,8+'a];
instruction pattern PADDH(shmregs r1, shmregs r2, shmregs r3)
	means[refocth(r1) := +(octh(^(r2)),octh(^(r3)))]
	assembles ['paddh 'r1 ',' r2 ',' r3];
instruction pattern PSUBH(shmregs r1, shmregs r2, shmregs r3)
	means[refocth(r1) := -(octh(^(r2)),octh(^(r3)))]
	assembles ['psubh 'r1 ',' r2 ',' r3];
instruction pattern PMULTH(shmregs r1, shmregs r2, shmregs r3)
	means[refocth(r1) := *(octh(^(r2)),octh(^(r3)))]
	assembles ['pmulth 'r1 ',' r2 ',' r3'\n pmfhl.lh 'r1];
instruction pattern PMAXH(shmregs r1, shmregs r2, shmregs r3)
    means[refocth(r1):=  MAX(octh(^(r2)),octh(^(r3)))]
	assembles['pmaxh  'r1','r2','r3];
instruction pattern PMINH(shmregs r1, shmregs r2, shmregs r3)
    means[refocth(r1):=  MIN(octh(^(r2)),octh(^(r3)))]
	assembles['pminh  'r1','r2','r3];
instruction pattern PABSH(shmregs r1, shmregs r2)
    means[refocth(r1):=  ABS(octh(^(r2)))]
	assembles['pabsh  'r1','r2','r3];
	
instruction pattern LQVECUW(uwmregs r1,addrform a)
	means[refquaduw(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld 'r1',$3,$2'];
instruction pattern SQVECUW(uwmregs r1,addrform a)
	means[mem(a):=quaduw(^(r1))]
	assembles['pcpyud $3,'r1',$3\n sdl 'r1','a'\n sdr 'r1','a'\n sdl $3,8+'a'\n sdr $3,8+'a];
instruction pattern PADDUW(uwmregs r1, uwmregs r2, uwmregs r3)
	means[refquaduw(r1) := +(quaduw(^(r2)),quaduw(^(r3)))]
	assembles ['padduw 'r1 ',' r2 ',' r3];
instruction pattern PSUBUW(uwmregs r1, uwmregs r2, uwmregs r3)
	means[refquaduw(r1) := -(quaduw(^(r2)),quaduw(^(r3)))]
	assembles ['psubuw 'r1 ',' r2 ',' r3];
	
instruction pattern LQVECW(swmregs r1,addrform a)
	means[refquadw(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld 'r1',$3,$2'];
instruction pattern SQVECW(swmregs r1,addrform a)
	means[mem(a):=quadw(^(r1))]
	assembles['pcpyud $3,'r1',$3\n sdl 'r1','a'\n sdr 'r1','a'\n sdl $3,8+'a'\n sdr $3,8+'a];
instruction pattern PADDW(swmregs r1, swmregs r2, swmregs r3)
	means[refquadw(r1) := +(quadw(^(r2)),quadw(^(r3)))]
	assembles ['paddw 'r1 ',' r2 ',' r3];
instruction pattern PSUBW(swmregs r1, swmregs r2, swmregs r3)
	means[refquadw(r1) := -(quadw(^(r2)),quadw(^(r3)))]
	assembles ['psubw 'r1 ',' r2 ',' r3];
instruction pattern PMAXW(swmregs r1, swmregs r2, swmregs r3)
    means[refquadw(r1):=  MAX(quadw(^(r2)),quadw(^(r3)))]
	assembles['pmaxw  'r1','r2','r3];
instruction pattern PMINW(swmregs r1, swmregs r2, swmregs r3)
    means[refquadw(r1):=  MIN(quadw(^(r2)),quadw(^(r3)))]
	assembles['pminw  'r1','r2','r3];
instruction pattern PSRAW(swmregs r1, swmregs r2, offset s)
    means[refquadw(r1):= >>(quadw(^(r2)), s)]
	assembles['psraw 'r1',' r2 ',' s];
instruction pattern PSLLW(swmregs r1, swmregs r2, offset s)
    means[refquadw(r1):= <<(quadw(^(r2)), s)]
	assembles['psllw 'r1',' r2 ',' s];
instruction pattern PABSW(swmregs r1, swmregs r2)
    means[refquadw(r1):=  ABS(quadw(^(r2)))]
	assembles['pabsw  'r1','r2','r3];
	
instruction pattern PBITWISE(bitwiseoperator op, vecregs r1, vecregs r2, vecregs r3)
        means[r1:= op(^(r2), ^(r3))]
	assembles['p'op ' 'r1',' r2 ',' r3];
instruction pattern PNOT(vecregs r1, vecregs r2)
    means[r1:= NOT(^(r2))]
	assembles['pnor 'r1' ,' r2 ', $0'];
	
define(typequadf,ieee32 vector(4))
define(reftypequadf,ref typequadf)
define(quadf, (typequadf)$1)
define(refquadf,(reftypequadf)$1)

instruction pattern LQC2(vfregs r1,addrform a)
	means[refquadf(r1):=^(mem(a))]
	assembles['ldl $2,'a'\n ldr $2,'a'\n ldl $3,8+'a'\n ldr $3,8+'a'\n pcpyld $8,$3,$2\n qmtc2 $8,'r1];
instruction pattern SQC2(vfregs r1,addrform a)
	means[mem(a):=quadf(^(r1))]
	assembles['qmfc2 $2,'r1'\n pcpyud $8,$2,$3\n sdl $2,'a'\n sdr $2,'a'\n sdl $8,8+'a'\n sdr $8,8+'a];
instruction pattern VMOVE(vfregs r1, vfregs r2)
	means[refquadf(r1) := refquadf(r2)]
	assembles ['vmov.wxyz 'r1 ',' r2 ',' r3];
instruction pattern VADD(vfregs r1, vfregs r2, vfregs r3)
	means[refquadf(r1) := +(quadf(^(r2)),quadf(^(r3)))]
	assembles ['vadd.wxyz 'r1 ',' r2 ',' r3];
instruction pattern VSUB(vfregs r1, vfregs r2, vfregs r3)
	means[refquadf(r1) := -(quadf(^(r2)),quadf(^(r3)))]
	assembles ['vsub.wxyz 'r1 ',' r2 ',' r3];
instruction pattern VMUL(vfregs r1, vfregs r2, vfregs r3)
	means[refquadf(r1) := *(quadf(^(r2)),quadf(^(r3)))]
	assembles ['vmul.wxyz 'r1 ',' r2 ',' r3];
instruction pattern VMAX(vfregs r1, vfregs r2, vfregs r3)
	means[refquadf(r1) := MAX(quadf(^(r2)),quadf(^(r3)))]
	assembles ['vmax.wxyz 'r1 ',' r2 ',' r3];
instruction pattern VMIN(vfregs r1, vfregs r2, vfregs r3)
	means[refquadf(r1) := MIN(quadf(^(r2)),quadf(^(r3)))]
	assembles ['vmini.wxyz 'r1 ',' r2 ',' r3];
instruction pattern VABS(vfregs r1, vfregs r2)
	means[refquadf(r1) := ABS(quadf(^(r2)))]
	assembles ['vabs.wxyz 'r1 ',' r2 ',' r3];

instructionset[ LA|LI|ADDIL|ADDIR|ANDIL|ANDIR|ORIL|ORIR|XORIL|XORIR|SRL|SRA|SLL
		|RRRieee64|RRRint64|RRRint32|NOTOP|MULTuint32|MULTint32|DIVint32
		|NEGieee32|RRRieee32|MODint32|MAXieee32|MINieee32
		|RRRbitwise|SETfpcomp|SETfpgt|SETfpge|SETfpne
		
		
		|FMOPabs|FMOPsqrt|FMOPtan|FMOPsin|FMOPcos|FMOPln
		|DOPabs|DOPsqrt|DOPtan|DOPln|DOPsin|DOPcos
		
		|PCMPLTUB|PCMPGTUB|PCMPLEUB|PCMPGEUB|PCMPEQUB|PCMPNEUB
		|PCMPLTB|PCMPGTB|PCMPLEB|PCMPGEB|PCMPEQB|PCMPNEB
		
		|PLANT|PLANTBCONST|PLANTWCONST|PLANTICONST|PLANTSCONST
		|SETLTI|SETLEI|SETGTI|SETGEI|SETLT|SETGT|SETEQ|SETLE|SETGE|SETNE
		|SETdpeq|SETdplt|SETdpgt|SETdple|SETdpge|SETdpne
		|SDZERO|SWZERO|SHZERO|SBZERO|SoB|LoB|SB|SWC1|SH|SD|SW|LWC1|LW
		|FLOADLIT|DLOADLIT|LHU|LH|LBU|LB|LD|FPTODP|MOVB|MOVEXTEND|MOVS
		|SUW|SFLOAT|ROUND32|MFHI|MFLO
        
		/*|PUSHR|PUSHFR*/
	 	|IFSGTGOTO|IFSGEGOTO|IFSNEGOTO|IFSGOTO|IFGTGOTO|IFLTGOTO|IFGEGOTO|IFLEGOTO|IFGOTO
		|GOTO|GOTOINDIRECT|IFcpf|IFBOOL
		|GETcpf
		
		|MAXint32|MINint32
		|SQVECUB|LQVECUB|PADDUB|PSUBUB
		|SQVECB|LQVECB|PADDB|PSUBB
		|SQVECUH|LQVECUH|PADDUH|PSUBUH
		|SQVECH|LQVECH|PADDH|PSUBH|PMULTH|PABSH
		|SQVECUW|LQVECUW|PADDUW|PSUBUW
		|SQVECW|LQVECW|PADDW|PSUBW|PSRAW|PSLLW|PABSW
		
		|PBITWISE|PNOT
		
		
		|LQC2|SQC2|VADD|VSUB|VMUL|VMAX|VMIN|VABS|VMOVE
		
		|LDPARAM|MOV|MTC1|MFC1|SWOTHER
              ]
