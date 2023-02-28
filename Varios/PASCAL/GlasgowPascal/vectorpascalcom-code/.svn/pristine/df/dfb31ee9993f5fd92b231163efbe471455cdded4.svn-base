/* Description of theARM processor
   in ILCG

   File written by Paul Cockshott
   Copyright (c) University of Glagow 2012
   edited to Arm64 IN 2022

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


pattern unsigned means[uint32|uint8|uint16|uint64];
pattern signed means[int8|int16|int32|int64];
pattern int means[int8|int16|int32|uint32|uint8|uint16|int64|uint64];
pattern double means[ieee64];
pattern float means[ieee32];
pattern real means [ieee64|float];
pattern byte means[ int8|uint8|octet];
pattern word32 means[int32|uint32|word|ieee32 ];
pattern word64 means[int64|uint64];
pattern word16 means[int16|uint16|halfword];
pattern wordupto16 means[byte|word16];
pattern wordupto32 means[wordupto16|word32];
pattern wordupto64 means[wordupto32|int64];
pattern longint means [int32|uint32];
pattern dword means [double|int64];

/* ------------------------ REGISTERS ----------------------------------------------*/
define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
     define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')

/* macros for vector registers */

define(vvr,` register quadword   V$1   assembles[ ' `'' `V$1'`''`];
')

define(dvr,`alias register ieee64   D$1 = V$1(0:63)  assembles[ ' `'' `D$1'`''`];
')
define(mmr,`alias register octet vector (8)  MMo$1 = V$1(0:63)  assembles[ ' `'' `D$1'`''`];
')

define(ivr,`alias register  int64  iV$1=V$1(0:31) assembles[ ' `'' `D$1'   `''`];
')
define(uvr,`alias register uint64  uV$1=V$1(0:31) assembles[ ' `'' `D$1'   `''`];
')
define(svr,`alias register ieee32  S$1=D$1(0:31) assembles[ ' `'' `S$1'   `''`];
')

define(isvr,`alias register int32  iS$1=V$1(0:31) assembles[ ' `'' `S$1'   `''`];
')

define(uisvr,`alias register uint32  uiS$1=V$1(0:31) assembles[ ' `'' `S$1'   `''`];
')
define(hsvr,`alias register int16  iH$1=iS$1(0:15) assembles[ ' `'' `H$1'   `''`];
')
 
define(bsvr,`alias register int8  iB$1=iH$1(0:7) assembles[ ' `'' `B$1'   `''`];
') 

define(uhsvr,`alias register uint16  uiH$1=iS$1(0:15) assembles[ ' `'' `H$1'   `''`];
')

define(ubsvr,`alias register uint8  uiB$1=iH$1(0:7) assembles[ ' `'' `B$1'   `''`];
') 

define(rvvr,` reserved register quadword   V$1   assembles[ ' `'' `V$1'`''`];
')

/*------------------ scalar view of Vector registers for SIMD and floating point */
/* reserved for parameters etc */


/* free to use for general calculations as temporaries */
forloop(`i',`16',`30',`vvr(i)') 

forloop(`i',`0',`15',`rvvr(i)') 
forloop(`i',`0',`30',`dvr(i)') 
forloop(`i',`16',`30',`mmr(i)') 

forloop(`i',`16',`30',`uvr(i)') 
forloop(`i',`16',`30',`ivr(i)') 
forloop(`i',`0',`30',`svr(i)') 
 
/* define these aliases so we do not break type rules with moves to and from the integer registers */
 
forloop(`i',`0',`30',`isvr(i)')  
forloop(`i',`0',`30',`uisvr(i)')  

forloop(`i',`0',`30',`hsvr(i)') 
forloop(`i',`0',`30',`bsvr(i)') 
forloop(`i',`0',`30',`uhsvr(i)') 
forloop(`i',`0',`30',`ubsvr(i)') 

define(DRRL,`D$1|')pattern fdreg means[forloop(`i',`0',`29',`DRRL(i)')  D30]; 

define(SRRL,`S$1|')pattern fsreg means[forloop(`i',`0',`29',`SRRL(i)')  S30];
define(MMRo,`MMo$1|')pattern mmrego means[forloop(`i',`16',`29',`MMRo(i)')  MMo30];
 
define(iRRl,`iV$1|')pattern lsreg means[forloop(`i',`16',`29',`iRRl(i)')  iV30];
define(uRRl,`uV$1|')pattern uvreg means[forloop(`i',`16',`29',`uRRl(i)')  uV30];
define(isRRL,`iS$1|')pattern isreg means[forloop(`i',`0',`29',`isRRL(i)')  iS30];

define(uisRRL,`uiS$1|')pattern uisreg means[forloop(`i',`0',`29',`uisRRL(i)')  uiS30];

define(bRRL,`iB$1|')pattern bvreg means[forloop(`i',`0',`29',`bRRL(i)')  iB30];

define(hRRL,`iH$1|')pattern hvreg means[forloop(`i',`0',`29',`hRRL(i)')  iH30]; 


define(ubRRL,`uiB$1|')pattern ubvreg means[forloop(`i',`0',`29',`ubRRL(i)')  uiB30];

define(uhRRL,`uiH$1|')pattern uhvreg means[forloop(`i',`0',`29',`uhRRL(i)')  uiH30]; 

pattern vreg64 means [fdreg|mmrego|uvreg];




/*------------------- end of vector reg start of general reg section -----------*/





define(rrr,`reserved register int64 X$1 assembles[ ' `'' `X$1'`''`];
')
define(rr,`register int64 X$1 assembles[ ' `'' `X$1'`''`];
')
define(brr,`alias register int8 bRX$1=X$1(0:7) assembles[' `'' `w$1'`''`] ;
')
define(obrr,`alias register octet obRX$1=X$1(0:7) assembles[' `'' `w$1'`''`] ;
')
define(wrr,`alias register int32 W$1=X$1(0:31) assembles[' `'' `W$1'`''`] ;
')
define(uwrr,`alias register uint32 uW$1=X$1(0:31) assembles[' `'' `W$1'`''`] ;
')
define(ubrr,`alias register uint8 ubRX$1=X$1(0:7) assembles[' `'' `w$1'`''`] ;
')
define(uhrr,`alias register uint16 uwRX$1=X$1(0:15) assembles[' `'' `w$1'`''`] ;
')
define(urr,`alias register uint64 uX$1=X$1(0:63) assembles[' `'' `X$1'`''`] ;
')
define(hrr,`alias register int16 wRX$1=X$1(0:15) assembles[' `'' `w$1'`''`] ;
')

/* ARM64 general purpose integer registers used for addressing */
/* reserved ones for parameter passing */
forloop(`i',`0',`8',`rrr(i)')

/* General use registers */
/* temporaries for calculations */ 
forloop(`i',`9',`15',`rr(i)')
/* reserved ones callee saved, fp and lr */
forloop(`i',`16',`31',`rrr(i)') 


forloop(`i',`0',`30',`wrr(i)') 
forloop(`i',`0',`30',`uwrr(i)')
forloop(`i',`0',`30',`urr(i)')
forloop(`i',`0',`30',`brr(i)')
forloop(`i',`0',`30',`obrr(i)')

forloop(`i',`0',`30',`ubrr(i)')
forloop(`i',`0',`30',`uhrr(i)')
forloop(`i',`0',`30',`hrr(i)')
/* ----------- Declare special purpuse registers for procedure calls */
alias register int64 FP = X29(0:63) assembles [' X29 ']; 

alias register int64 SP = X31(0:63) assembles[' SP '];
alias register int64 RSP = X31(0:63) assembles[' SP '];

alias register int64 LR = X30(0:63) assembles [' X30 '];  
/* general purpose integer regs as sets */

define(IRRL,`X$1|')
pattern greg means[forloop(`i',`0',`29',`IRRL(i)')  FP|LR|X31|RSP];
define(wRRL,`W$1|')
pattern reg32 means[forloop(`i',`0',`29',`wRRL(i)')  W30]; 



pattern freg means[fdreg|fsreg ];
pattern scalarvreg means[freg|hvreg|lsreg|isreg|uisreg|bvreg|ubvreg|uhvreg];

/* half word registers */

define(shwregdef,`wRX$1|')pattern shwreg means[forloop(`i',`0',`29',`shwregdef(i)') wRX30];

define(uwregdef,`uW$1|')pattern uwreg means[forloop(`i',`0',`29',`uwregdef(i)') uW30];
define(uhwregdef,`uwRX$1|')pattern uhwreg means[forloop(`i',`0',`29',`uhwregdef(i)') uwRX30];
define(uregdef,`uX$1|')pattern ureg means[forloop(`i',`0',`29',`uregdef(i)') uX30];
pattern hwreg means[shwreg|uhwreg];

/* byte regs holding 8 bit ints */
define(bregdef,`bRX$1|')pattern bireg means[forloop(`i',`0',`29',`bregdef(i)') bRX30];

/* byte registers holding unsigned ints */
define(ubregdef,`ubRX$1|')pattern ubreg means[forloop(`i',`0',`29',`ubregdef(i)') ubRX30];

/* byte registers holding octets */
define(obregdef,`obRX$1|')pattern obreg means[forloop(`i',`0',`29',`obregdef(i)') ubRX30];

/* ------------ Register groups ---------------------*/

pattern breg means[bireg|ubreg|obreg];
pattern boolreg means[  breg|greg];

pattern bytescalar means[bvreg|ubvreg];
pattern wordscalar means[uhvreg|hvreg];

pattern reg64 means[greg|ureg ];
pattern reg32or64 means [ reg32|uwreg|greg|ureg];/* arrange to select smallest first */
pattern scalarReg means [reg32or64|hwreg|breg ];
pattern scalar32 means [reg32|uwreg|fsreg|isreg];
pattern scalar64 means [greg|ureg|fdreg|lsreg];
pattern greg64 means [greg|ureg];
pattern v64 means [fdreg|lsreg];
pattern smallreg means[breg|hwreg];
pattern anyreg means[scalarReg|scalarvreg];
pattern signedreg means [greg|reg32];
pattern unsignedreg means [ureg|uwreg];
/* -------------------------------------Address modes ---------- */
pattern labelf(label l)
	means [l]
	assembles['='l];

pattern barelab(label l)
	means[l]
	assembles[l];
 
pattern literal means [uint8|int8];

pattern constf(literal s)
	means[const  s]
	assembles [s];

pattern offset means[constf];

pattern regindirf(greg r)
	means[^(r) ]
	assembles['[' r ']'];
 
pattern regoffset(greg r1,constf s)
	means[+(^(r1),s)]
	assembles['['r1',#'s']'];
	
pattern regpair(greg r1,greg r2)
	means[+(^(r1),^(r2))]
	assembles['[' r1 ',' r2 ']' ];
 
pattern immed32(word32 s)
	means[const s]
	assembles['='s];

pattern immed64(word64 s)
	means[const s]
	assembles['='s];
	
pattern immed means[immed32|immed64];

pattern uncasteaform means[
 

    regpair|    regindirf 
];

pattern addrform(uncasteaform f,word64 t)  /* allow the address expression to be cast to an integer */
	means[(t)f]
	assembles[f];

 

/* ---------------------------Load and store -------------------------*/
pattern immedint means[int64|int32|int16|int8|uint8|uint16|uint8|uint32];

instruction pattern LL(scalarReg r1,immedint c, type t)
	means[(ref t)r1:=(t)const c]
	assembles['LDR  \t'r1', ='c];
instruction pattern LLDW(reg32 r1,immed32 c)
	means[r1:=c]
	assembles['LDR  \t'r1', 'c];
 
 
instruction pattern LLB(breg r1,constf c)
	means[r1:=c]
	assembles['MOV  \t'r1',= 'c];
instruction pattern ADRL(greg r1,label c)
	means[r1:=c]
	 
	 assembles['LDR \t'r1', 'c]; 
instruction pattern LDF(fsreg r1,addrform a  )
	means[(ref ieee32) r1:=(ieee32)^(mem(a))]
	assembles['LDR \t'r1','a ];
 
instruction pattern LDD(fdreg r1,addrform a  )
	means[(ref ieee64) r1:=(ieee64)^(mem(a))]
	assembles['LDR \t'r1','a ];
 
instruction pattern LDR(greg r1,addrform a, word64 t)
	means[(ref t)r1:=(t)^(mem(a))]
	assembles['LDR \t'r1','a ];
instruction pattern LDRw(scalar32 r1,addrform a, word32 t)
	means[(ref t)r1:=(t)^(mem(a))]
	assembles['LDR \t'r1','a '//LDRw'];
	
instruction pattern LoadScalar(scalarvreg r1, addrform a, type t)
	means[(ref t)r1:=(t)^(mem(a))]
	assembles['LDR \t'r1','a ];

instruction pattern LDRSB(greg r1,addrform a )
	means[ r1:=(int64)EXTEND((int8)^(mem(a)))]
	assembles['ldrsb \t'r1','a ];
instruction pattern LDRSBh(shwreg r1,addrform a )
	means[ r1:=(int16)EXTEND((int8)^(mem(a)))]
	assembles['ldrsb \t'r1','a ];
instruction pattern LDRSBw(reg32 r1,addrform a )
	means[(ref int32) r1:=(int32)EXTEND((int8)^(mem(a)))]
	assembles['ldrsb \t'r1','a ];	
instruction pattern LDRB(scalarReg r1,addrform a,type t)
	means[(ref t)r1:=(t)EXTEND((uint8)^(mem(a)))]
	assembles['ldrb 'r1','a'//ldrb' ];
	pattern bt means[octet|int8|uint8];
instruction pattern LDRBo(breg r1,addrform a, bt t)
	means[(ref t)r1:= (t)^(mem(a))]
	assembles['ldrb 'r1','a '//ldrbo'];
instruction pattern LDRSH(reg32 r1,addrform a )
	means[ r1:=(int32)EXTEND((int16)^(mem(a)))]
	assembles['ldrsh \t'r1','a ];
instruction pattern LDRUH(uwreg r1,addrform a )
	means[ r1:=(uint32)EXTEND((uint16)^(mem(a)))]
	assembles['ldruh \t'r1','a ];
instruction pattern SXTW(greg r1,reg32 r2)
	means[r1:=(int64)EXTEND((int32)^(r2))]
	assembles['SXTW\t'r1','r2];
instruction pattern SXTB(greg r1,breg r2)
	means[r1:=(int64)EXTEND((int8)^(r2))]
	assembles['SXTB\t'r1','r2];
instruction pattern SXTBw(reg32 r1,breg r2)
	means[r1:=(int32)EXTEND((int8)^(r2))]
	assembles['SXTB\t'r1','r2];
instruction pattern SXTHw(reg32 r1,shwreg r2)
	means[r1:=(int32)EXTEND((int16)^(r2))]
	assembles['SXTH\t'r1','r2];
	instruction pattern SXTH(greg r1,shwreg r2)
	means[r1:=(int64)EXTEND((int16)^(r2))]
	assembles['SXTH\t'r1','r2];
instruction pattern UXTB(reg32 r1,ubreg r2)
	means[r1:=EXTEND((uint8)^(r2))]
	assembles['UXTB\t'r1','r2];	
instruction pattern UXTW(greg r1,uwreg r2)
	means[r1:=EXTEND((uint32)^(r2))]
	assembles['UXTW\t'r1','r2];
instruction pattern LDRH(reg32 r1,addrform a,type t)
	means[(ref t)r1:=(t)EXTEND((uint16)^(mem(a)))]
	assembles['ldrh \t'r1','a ];
instruction pattern LDRHh(hwreg r1,addrform a)
	means[r1:= (int16)^(mem(a))]
	assembles['ldrh \t'r1','a ];
instruction pattern LDRHhu(hwreg r1,addrform a)
	means[r1:= (uint16)^(mem(a))]
	assembles['ldrh \t'r1','a ];
instruction pattern FTRUNC(isreg s1,fsreg f1)
    means [s1:=TRUNCATE(^(f1))]
    assembles ['FCVTZS \t's1' , 'f1];
    pattern srcint  means[signedreg];

instruction pattern FLT(srcint s1,fsreg f1)
    means [f1:=FLOAT(^(s1))]
    assembles ['SCVTF \t'f1' , 's1'//FLT'];
instruction pattern FLTD(srcint s1,fdreg f1)
    means [f1:=FLOAT(^(s1))]
    assembles ['SCVTF \t'f1' , 's1'//FLTD'];
instruction pattern UCVTF32(fsreg f1, uisreg u1)
	means[f1:=FLOAT(^(u1))]
	assembles['FCVTNU \t'f1','u1];
instruction pattern UCVTF6432(fsreg f1, uvreg u1)
	means[f1:=FLOAT(^(u1))]
	assembles['FCVTNU \t'f1','u1];
instruction pattern UCVTF3264(fdreg f1, uisreg u1)
	means[f1:=FLOAT(^(u1))]
	assembles['FCVTNU \t'f1','u1];
instruction pattern UCVTF6464(fdreg f1, uvreg u1)
	means[f1:=FLOAT(^(u1))]
	assembles['FCVTNU \t'f1','u1];
instruction pattern FCVTSD(fsreg f1, fdreg d1)
	means[d1:=(ieee64) EXTEND((ieee32)^(f1))]
	assembles['FCVT \t'd1','f1];
 
instruction pattern FCVTDS(fsreg f1, fdreg d1)
	means[f1:=  ^(d1)]
	assembles['FCVT \t'f1','d1'//FCVTDS'];
instruction pattern MOV(scalar32 r1,scalar32 r2,type t)
	means[(ref t)r1:=(t)^(r2)]
	assembles['MOV \t'r1 ',' r2];
instruction pattern MOVD(greg r1,greg r2,type t)
	means[(ref t)r1:=(t)^(r2)]
	assembles['MOV \t'r1 ',' r2];
instruction pattern MOVDD(fdreg r1,fdreg r2)
	means[r1:=^(r2)]
	assembles['VPUSH {'r2'}\nVPOP {'r1'}'];	
instruction pattern MOVGD(greg64 r2,v64 r1)
	means[r1:=^(r2)]
	assembles[' FMOV \t'r1','r2];
instruction pattern MOVDG(greg64 r1,v64 r2)
	means[r1:=^(r2)]
	assembles[' FMOV \t'r1','r2];

instruction pattern VMOVL(reg32 r1,isreg r2)
	means[r1:=^(r2)]
	assembles['FMOV \t'r1 ',' r2];
instruction pattern VMOVS(reg32 r2,isreg r1)
	means[r1:=^(r2)]
	assembles['FMOV \t'r1 ',' r2]; 
instruction pattern SDF(fsreg r1,regindirf a )
	means[ (ref ieee32)  mem(a):= ^(r1)]
	assembles['STR \t'r1','a ];
instruction pattern SDD(fdreg r1,regindirf a )
	means[ (ref ieee64)  mem(a):=(ieee64) ^(r1)]
	assembles['STR \t'r1','a ]; 
	
 
instruction pattern STR(scalar32  r1,addrform a, word32 t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['STR \t'r1','a'//STR' ];
	pattern store64 means[reg64|vreg64];
instruction pattern STR64(store64  r1,addrform a, word64 t)
	means[(ref doubleword)mem(a):= ^(r1)]
	assembles['STR \t'r1','a'//STR64' ];
 
instruction pattern STRP(greg r1,addrform a, type t, type t2)
	means[(ref ref t)mem(a):=(t2)^(r1)]
	assembles['str \t'r1','a'//STRP' ];
	
instruction pattern STRH(hwreg r1,addrform a, word16 t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['strh \t'r1','a'//STRH' ];
instruction pattern STRB(breg r1,addrform a, byte t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['strb \t'r1','a'//STRB' ];
	
instruction pattern STRvB(bytescalar r1,addrform a, byte t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['STR \t'r1','a'//STRvB' ];
instruction pattern STRvH(wordscalar r1,addrform a, word16 t)
	means[(ref t)mem(a):=(t)^(r1)]
	assembles['STR \t'r1','a'//STRvH' ];
instruction pattern PUSHR(greg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['sub \tSP,SP,16\n STR 'r',[SP]'];
instruction pattern VPUSHR(vreg64 r)
	means[PUSH(mainSTACK,^(r))]
	assembles['sub \tSP,SP,16\n STR 'r',[SP]'];

instruction pattern PUSHSR(fdreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['sub \tSP,SP,16\n STR 'r',[SP]'];
instruction pattern POPR(greg r)
	means[r:=(word32)POP(mainSTACK)]
	assembles['POP {'r'}'];
 /*
instruction pattern RETF(freg s)
    means[ret((ieee32)^(s ),s)]
    assembles['MOV r0,'s]; 
/* ------------ arithmetic operators ---------------------------- */
/* these are used in the definition of register to register ops */

operation add means  +  assembles [ 'ADD'];
operation and means  AND  assembles[ 'AND'];
operation or means OR assembles['ORR'];
operation xor means XOR assembles['EOR'];/* */
operation sub means  -  assembles [ 'SUB'];
operation mul means * assembles ['mul'];
operation divide means div assembles ['sdiv'];
operation idiv means div assembles ['IDIV'];
/* The binary float operations are...*/
operation ADF means + assembles['add'];
operation DVF means div assembles ['div']; 
operation MUF means * assembles['mul']; 
operation SUF means - assembles['sub'];
 

operation sr means >> assembles['lsr'];
operation sl means << assembles['lsl'];
pattern aop means[add|sub|and|or|xor|mul|divide| sr|sl];
pattern iaop means[add|sub|and|or|xor |sr|sl];
pattern fop means[ADF|DVF|MUF|SUF];
instruction pattern IDIV(isreg r1,isreg r2)
   means[r1:=div(r1,r2)]
   assembles['vcvtr.f32.s32 \t'r1' , 'r1 '// convert both ints to floats \n'
             ' vcvtr.f32.s32 \t'r2' , 'r2 '\n'
             ' vdiv.f32 \t'r1','r1','r2'// floating point val now in 'r1'\n'
             ' vcvtr.s32.f32 \t'r1' , 'r1' // convert 'r1'to an integer again \n'
             ];
define(mkrrr,`
instruction pattern RRR$1($2 r1, $2 r2, $2 r3 , aop oper )
	means[  (ref $3)r1:=oper(($3)^(r2),($3)^(r3))]
	assembles[oper ' `''  `\t' `'' ` r1 ' `'' ` ,' `'' `r2' `''`,' `'' ` r3];')
mkrrr(a,greg,int64)
mkrrr(b,ureg,uint64)

mkrrr(c,reg32,int32)
mkrrr(d,uwreg,uint32)


mkrrr(g,breg,int8)

mkrrr(g2,breg,uint8)
mkrrr(g3,breg,octet)
instruction pattern FFF(fsreg r1, fsreg r2, fsreg r3 , fop oper, type t)
	means[(ref t) r1:=(t)oper((t)^(r2),(t)^(r3))]
	assembles['f'oper ' \t' r1 ',' r2 ',' r3];
 instruction pattern DDD(fdreg r1, fdreg r2, fdreg r3 , fop oper, type t)
	means[(ref t) r1:=(t)oper((t)^(r2),(t)^(r3))]
	assembles['f'oper ' \t' r1 ',' r2 ',' r3];
instruction pattern IMIN(greg r1, greg r2)
	means[ r1 := MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n csel 'r1', 'r1','r2',gt'];
instruction pattern UMIN(unsignedreg r1, unsignedreg r2)
	means[ r1 := MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n csel 'r1','r1','r2',gs'];
instruction pattern IMINw(reg32 r1, reg32 r2)
	means[ r1 := MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n csel 'r1', 'r1','r2',gt'];
instruction pattern FMAX(fsreg r1, fsreg r2,fsreg r3)
	means[ r1 := MAX(^(r3),^(r2))]
	assembles['FMAX 'r1 ',' r3 ',' r2];
instruction pattern FMAXd(fdreg r1, fdreg r2,fdreg r3)
	means[ r1 := MAX(^(r3),^(r2))]
	assembles['FMAX \t'r1 ',' r3 ',' r2];
instruction pattern FMIN(fsreg r1, fsreg r2,fsreg r3)
	means[ r1 := MIN(^(r3),^(r2))]
	assembles['FMIN \t'r1 ',' r3 ',' r2];
instruction pattern FMINd(fdreg r1, fdreg r2,fdreg r3)
	means[ r1 := MIN(^(r3),^(r2))]
	assembles['FMIN 'r1 ',' r3 ',' r2];
instruction pattern UQADD(ubvreg b1, ubvreg b2,ubvreg b3)
	means[b1:=+:(^(b2),^(b3))]
	assembles['UQADD \t'b1 ',' b2 ',' b3];
instruction pattern UQSUB(ubvreg b1, ubvreg b2,ubvreg b3)
	means[b1:=-:(^(b2),^(b3))]
	assembles['UQSUB \t'b1 ',' b2 ',' b3];
instruction pattern SQSUB(bvreg b1, bvreg b2,bvreg b3)
	means[b1:=-:(^(b2),^(b3))]
	assembles['SQSUB \t'b1 ',' b2 ',' b3];
instruction pattern SQADD(bvreg b1, bvreg b2,bvreg b3)
	means[b1:=+:(^(b2),^(b3))]
	assembles['SQADD \t'b1 ',' b2 ',' b3];
instruction pattern IMAXw(reg32 r1, reg32 r2)
	means[ r1 := MAX(^(r1),^(r2))]
	assembles['cmp \t'r1','r2'\n movlt 'r1','r2'//IMAXw'];
instruction pattern IMAX(greg r1, greg r2)
	means[ r1 := MAX(^(r1),^(r2))]
	assembles['cmp \t'r1','r2'\n movlt 'r1','r2'//IMAX'];
instruction pattern UMAX(unsignedreg r1, unsignedreg r2)
	means[ r1 := MAX(^(r1),^(r2))]
	assembles['cmp \t'r1','r2'\n movls 'r1','r2'//IMAX'];
instruction pattern RRRG(greg r1, greg r2, greg r3 , iaop oper)
	means[  r1:=EXTEND(oper(^(r2),^(r3)))]
	assembles[oper ' ' r1 ',' r2 ',' r3];
instruction pattern RI(greg r1,greg r2, constf lit, iaop oper)
	means[ r1:=oper(^(r2),(int8)lit)]
	assembles[oper ' \t' r1 ',' r2 ',' lit];
instruction pattern fSQR(freg r1)
	means[r1:=SQR(^(r1))]
	assembles['FMUL 'r1 ', 'r1', 'r1];
instruction pattern NOTOP(scalarReg r1,scalarReg r2)
	means[r1:=NOT(^(r2))]
	assembles['mvn ' r1', ' r2];
instruction pattern NOTG(greg r1,greg r2)
	means[r1:=EXTEND(NOT(^(r2)))]
	assembles['mvn ' r1', #0\n eor  'r1 ',' r1 ',' r2];


/* control transfer and conditions*/
/* signed conditions */
operation lt means < assembles ['lt'];
operation gt means > assembles ['gt'];
operation eq means = assembles ['eq'];
operation le means <= assembles ['le'];
operation ge means >= assembles ['ge'];
operation ne means <> assembles ['ne'];
/* unsigned conditions */
operation lo means < assembles ['lo'];
operation hi means > assembles ['hi']; 
operation ls means <= assembles ['ls'];
operation hs means >= assembles ['hs']; 

operation shiftleft	means <<	assembles ['lsl'];
operation shiftright	means >>	assembles ['lsr'];
pattern conditionequality means[ne|eq];
pattern comparecondition means [le|eq|lt|gt|ge];
pattern condition means[conditionequality|comparecondition];
pattern unsignedcompare means[lo|hi| ls|hs];
pattern unsignedcondition means[conditionequality|unsignedcompare];
pattern shiftop	means [shiftleft|shiftright];
instruction pattern SHIFT(shiftop s,scalarReg r0,scalarReg r1,scalarReg r2)
	means [r1:=s(^(r0),^(r2))]
	assembles['movs 'r1', ' r0 ', ' s ' ' r2];
instruction pattern IFGOTO64(label l,greg r1, greg  r2,condition c, type t)
	means[if((int8)c((t) ^(r1),(t)^(r2)))goto l]	
	assembles['cmp \t'r1','r2'\n b'c'  ' l'//ifgoto'];

instruction pattern IFGOTO32(label l,reg32 r1, reg32  r2,condition c, type t)
	means[if((int8)c((t) ^(r1),(t)^(r2)))goto l]
	assembles['cmp \t'r1','r2'\n b'c'  ' l'//ifgoto'];
define(IFGOTO,`IFGOTO32|IFGOTO64')

instruction pattern ABSI(reg32 r1,reg32 r2)
	means[r1:=ABS((int32)^(r2))]
	assembles['cmp 'r2',#0\nrsblt 'r1','r2',#0'];
instruction pattern IFfGOTO(label l,fsreg r1, fsreg  r2,condition c)
	means[if((int8)c( ^(r1),^(r2)))goto l]
	assembles['FCMP 'r1','r2' //IFfGOTO\n b'c' '   l];
instruction pattern IFdGOTO(label l,fdreg r1, fdreg  r2,condition c)
	means[if((int8)c( ^(r1),^(r2)))goto l]
	assembles['FCMP 'r1','r2' //IFdGOTO\n   \n b'c' '  l];
instruction pattern IFBOOL(label l,breg r1)
	means[ if( (int8)^(r1))goto l]
	assembles[' TBNZ 'r1',#0, '  l];
	
/* the set pattern places -1 in r1 if the condition is met and 0 otherwise */
instruction pattern IMOD(reg32or64 x10,reg32or64 x0, reg32or64 x9)
	means[x10:=MOD(^(x0),^(x9))]
	assembles['udiv \t'x10',' x0',' x9'\n'
			  ' msub  \t'  x10',' x10',' x9',' x0'//IMOD'];
instruction pattern IMODh(shwreg x10,shwreg x0, shwreg x9)
	means[x10:=MOD(^(x0),^(x9))]
	assembles['udiv \t'x10',' x0',' x9'\n'
			  ' msub  \t'  x10',' x10',' x9',' x0'//IMOD'];
instruction pattern IMODw(reg32 x10,reg32 x0, reg32 x9,longint t)
	means[x10:=MOD((t)^(x0),(t)^(x9))]
	assembles['udiv \t'x10',' x0',' x9'\n'
			  ' msub  \t'  x10',' x10',' x9',' x0'//IMODw']; 
instruction pattern SET64(breg r1,greg r2,greg r3, condition c, type t)
	means[r1:=c((t)^(r2),(t)^(r3))]
	assembles['mov 'r1',#-1\n ' 'cmp 'r2','r3'\n b'c' 0f\n MVN 'r1','r1'//SET\n0:'];
instruction pattern SET32(breg r1,reg32 r2,reg32 r3, condition c, type t)
	means[r1:=c((t)^(r2),(t)^(r3))]
	assembles['mov 'r1',#-1\n ' 'cmp 'r2','r3'\n b'c' 0f\n MVN 'r1','r1'//SET\n0:'];

instruction pattern SETU(breg r1,unsignedreg r2,unsignedreg r3, unsignedcondition c, unsigned t)
	means[r1:= c((t)^(r2),(t)^(r3))]
	assembles['mov 'r1',#-1\n' 	' cmp 'r2','r3'\n b'c' 0f\n MVN  'r1','r1'//SETU\n0:'];
pattern fs means[ieee32];
instruction pattern SETF(breg r1,fsreg r2,fsreg  r3, condition c, fs t)
	means[r1:=c((t)^(r2),(t)^(r3))]
	assembles['mov 'r1',#0 //SETF\n FCMP 'r2','r3'\n  b'c' 0f\n MVN 'r1','r1'//SETF\n0: ']; 
instruction pattern SETD(breg r1,fdreg r2,fdreg  r3, condition c, real t)
	means[r1:=c((t)^(r2),(t)^(r3))]
	assembles['mov 'r1',#0 //SETD\n ' ' FCMP 'r2','r3'\n  b'c' 0f\n MVN 'r1','r1'//SETD\n0:']; 
instruction pattern SETUF(breg r1,fsreg r2,fsreg r3, condition c, type t)
	means[r1:=EXTEND(c((t)^(r2),(t)^(r3)))]
	assembles['mov 'r1',#0 //SETUF\n ' ' FCMP 'r2','r3'\n  b'c' 0f\n MVN 'r1','r1'//SETUF\n0:'];
instruction pattern SETUD(greg r1,fdreg r2,fdreg r3, condition c, type t)
	means[r1:=EXTEND(c((t)^(r2),(t)^(r3)))]
	assembles['mov 'r1',#0 //SETUD\n ' ' FCMP 'r2','r3'\n  b'c' 0f\n MVN 'r1','r1'//SETUD\n0:'];
instruction pattern PLANT(label l)
	means[l]
	assembles[l ':'];
instruction pattern GOTO(label l)
	means[goto l]
	assembles['b ' l];
instruction pattern GOTOINDIRECT(greg l)
	means[goto ^(l)]
	assembles['BR \t' l];
/* literals */
instruction pattern PLANTICONST( wordupto64 r,type t)
	means[loc (t) r]
	assembles[ '\t.xword  ' r];
instruction pattern PLANTSCONST( float  r,type t)
	means[loc (t) r]

	assembles[ '\t.float ' r];
instruction pattern PLANTBCONST( byte r,type t)
	means[loc (t) r]
	assembles[ '\t.byte ' r];
instruction pattern PLANTWCONST( word16 r,type t)
	means[loc (t) r]
	assembles[ '\t.short ' r];

instruction pattern PLANTRCONST(double r, type t)
	means [loc (t)r]
	assembles ['\t.double ' r];

/* --------------------------------------------------------------------
                                          tree transformation rules 
   -------------------------------------------------------------------*/
 
/* ---------------------------------------------------------------------
		Instructions in order of selection priority
   ------------------------------------------------------------------ */
instructionset[	

SDF|
SDD|
STR|STR64|
STRH|STRvH|
STRB| STRvB|
STRP|
LDR|
LDRB|
LDRSB|
LDRBo|
LDRSH|
LDRH|LDRHh|LDRHhu|LDRSBh|LDRSBw|LDRw|LDRUH|
SXTW|UXTW|UXTB|SXTH|SXTHw|SXTB|SXTBw|
ADRL|
LL|
LLDW|
LLB| 
RI|
RRRa|RRRb|RRRc|RRRd|RRRg|RRRg2|RRRg3|
DDD|
SHIFT|
RRRG|
NOTOP|
IDIV|IMOD|IMODw|IMODh|
ABSI|
NOTG|
SQADD|SQSUB|UQADD|UQSUB|
FMINd|FMIN|
IMIN|IMINw|UMIN|
FMAXd|FMAX|
IMAX|IMAXw|UMAX|
LDF|
LDD|
FFF| 
FLT|
FLTD|
fSQR|
UCVTF32|UCVTF6432|UCVTF6464|UCVTF3264|
FCVTDS|
FCVTSD|
IFGOTO|
IFfGOTO|
IFdGOTO|
IFBOOL|

SETF|
SETD|
SETUF|
SETUD|
SET32|SET64| 
SETU|
LoadScalar|
PLANT|
GOTO|
GOTOINDIRECT|
PLANTICONST|
PLANTSCONST|
PLANTBCONST|
PLANTWCONST|
PLANTRCONST|
	    /* make mov last to prevent redundant moves */

 VMOVL|
VMOVS|
POPR|
PUSHR|   
VPUSHR|
 MOV|MOVD|
MOVDD|
MOVGD|MOVDG|	 
PUSHSR]


