/*
\ 	PowerPC  
\	Youssef Gdura           
*/  
 /*09/10/09 new part start*/
type word=l;
type uint32=l;
type int32=l;
type ieee64=l;
type int64=q;
type octet=b;
type uint8=b; 
type int16=w;
type uint16=w; 
type int8=b;
type ieee32=s;

type halfword=w;
/*09/10/09 end*/

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Loop Definitions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')') 
     define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                  `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')

define(lReg, `3')  
define(uReg, `31') 
define(lBit, `0')  
define(hBit, `63')
define(Start1, `3')
define(End1, `10')

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Type Declarations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
/*
\begin{verbatim} 
*/
type int8=BYTE;
type uint8=BYTE; 
type octet=BYTE;

type int16=WORD;
type uint16=WORD;
type halfword=WORD;



type int32=DWORD;
type uint32=DWORD;
type ieee32=DWORD;  
type word=DWORD;


type ieee64=QWORD; 
type int64=QWORD;
type uint64=QWORD;


/*
\end{verbatim}
*/
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Data formats Patterns 
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
/*
\begin{verbatim}
*/
pattern unsigned 		means [uint32|uint8|uint16];
pattern unsignedup16	means [uint8|uint16];
pattern signedup16	means [int16|uint16|int8|uint8];
pattern signed 			means [int8|int16|int32|int64];
pattern int 			means [int32|uint32|int8|uint8|uint16|int16|int64];
pattern double 			means [ieee64];
pattern float  			means [ieee32];
pattern real 			means [float|double];

pattern word64 			means [int64|uint64];
pattern word32 			means [int32|uint32|word];
pattern word16 			means [int16|uint16|halfword];
pattern byte 			means [uint8|int8|octet];


pattern wordupto16  	means [byte|word16];
pattern wordupto32 		means [word32|byte|word16];
pattern wordupto64 		means [word32|byte|word16|word64];
pattern dataformat 		means [octet|word];
pattern longint 		means [int32|uint32];
pattern hiint 			means [int32|int64|int16];
pattern two(type t)		means[2] assembles['2'];
pattern four(type t)	means[4] assembles['4'];
pattern eight(type t)	means[8] assembles['8'];

pattern scale means[two|four|eight];

/* 
\end{verbatim}
*/

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Registers Declarations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

/*
\begin{verbatim}
*/

/* General Purpose Registers (gpr)  */

/* 64 bit registers */

define(resReg,`reserved register int64 R$1 assembles['`''`r$1'`''`];
')
forloop(`i',0,eval(lReg-1),`resReg(i)') 
define(gpr,`register int64 R$1 assembles['`''`r$1'`''`];
')
forloop(`i',lReg,20,`gpr(i)') 
define(gpr,`register int64 R$1 assembles['`''`r$1'`''`];
')
forloop(`i',22,eval(uReg-2),`gpr(i)') 
reserved register int64 R21 assembles['r21'];  /* Reserved for Pmainbase  */
reserved register int64 R30 assembles['r30'];  /* Reserved for macros  */
reserved register int64 R31 assembles['r31'];  /* Reserved for frame pointer */

/*Alias regsiters */
alias register word64 LR = R0(lBit:hBit) assembles ['r0'] ;	/* Coping of the Link Register (LR)*/
alias register word64 SP = R1(lBit:hBit) assembles ['r1'] ;	/* Stack Pointer (SP )*/
alias register word64 FP = R31(lBit:hBit) assembles ['r31'] ;	/* Frame Pointer (FP) or Table of Contents */
alias register word64 SD = R13(lBit:hBit) assembles ['r13'] ; 	/* Small Data (SD) pointer */
alias register word64 TMPREG = R30(lBit:hBit) assembles ['r30'] ;	/* Used as a temporary register*/

define(ugpr,`alias register uint64 uR$1=R$1(lBit:hBit) assembles['`''`r$1'`''`];
')
forloop(`i',lReg,eval(uReg-1),`ugpr(i)') 


/* 8bit registers */

/* Signed 8 bit values */
define(sbreg,`alias register int8 bR$1=R$1(0:7) assembles['`''`r$1'`''`];
')
forloop(`i',Start1,End1,`sbreg(i)') 

/* Unsigned Registers (Byte values) */
define(ubreg,`alias register uint8 ubR$1=R$1(0:7) assembles['`''`r$1'`''`];
')
forloop(`i',Start1,End1,`ubreg(i)') 

/* Untyped Registers (Byte values) */
define(uoreg,`alias register octet oR$1=R$1(0:7) assembles['`''`r$1'`''`];
')
forloop(`i',Start1,End1,`uoreg(i)') 

/* 16 bit registers */

/* Signed Registers (halfword values) */
define(shreg,`alias register int16 sR$1=R$1(0:15) assembles['`''`r$1'`''`];
')
forloop(`i',Start1,End1,`shreg(i)') 

/* Untyped Registers (halfword values) */ 
define(uhreg,`alias register uint16 hR$1=R$1(0:15) assembles['`''`r$1'`''`];
')
forloop(`i',Start1,End1,`uhreg(i)')

/* Untyped Registers (halfword values) */ 
define(uhxreg,`alias register halfword hxR$1=R$1(0:15) assembles['`''`r$1'`''`];
')
forloop(`i',Start1,End1,`uhxreg(i)') 

/* 32 bit registers */
/* Signed Registers (32bit word values) */

define(dswreg,`alias register int32 swR$1=R$1(0:31) assembles['`''`r$1'`''`];
')
forloop(`i',lReg,eval(uReg-1),`dswreg(i)') 

/* Unsigned Registers (32bit word values) */ 
define(duwreg,`alias register uint32 uwR$1=R$1(0:31) assembles['`''`r$1'`''`];
')
forloop(`i',lReg,eval(uReg-1),`duwreg(i)') 


register stack(4096)int64 mainSTACK assembles[ 'mainSTACK']; 

/* \end{verbatim}
\subsection{Register sets }
\begin{verbatim}
*/
/*XXXXXXXXXXXXXXXXXXXXXXX Register Sets XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

pattern siregs means[R0|R1|R2|R4|R5|R6|R7|R8|R9|R10|R11|R12|R13|R14|R15|R16|R17|R18|R19|R20|R22|R23|R24|R25|R26|R27|R28|R29|R21|R30|R31|R3];

 
pattern uiregs means[uR4|uR5|uR6|uR7|uR8|uR9|uR10|uR11|uR12|uR13|uR14|uR15|uR16|uR17|uR18|uR19|uR20|uR22|uR23|uR24|uR25|uR26|uR27|uR28|uR29|uR21|uR30|uR3];
 
 
pattern swregs means[swR4|swR5|swR6|swR7|swR8|swR9|swR10|swR11|swR12|swR13|swR14|swR15|swR16|swR17|swR18|swR19|swR20|swR22|swR23|swR24|swR25|swR26|swR27|swR28|swR29|swR21|swR30|swR3];

 
pattern uwregs means[uwR4|uwR5|uwR6|uwR7|uwR8|uwR9|uwR10|uwR11|uwR12|uwR13|uwR14|uwR15|uwR16|uwR17|uwR18|uwR19|uwR20|uwR22|uwR23|uwR24|uwR25|uwR26|uwR27|uwR28|uwR29|uwR21|uwR30|uwR3];

 
pattern sbregs means[bR4|bR5|bR6|bR7|bR8|bR9|bR10|bR3];

 
pattern ubregs means[ubR4|ubR5|ubR6|ubR7|ubR8|ubR9|ubR10|ubR3];

 
pattern uoregs means[oR4|oR5|oR6|oR7|oR8|oR9|oR10|oR3];

 
pattern shregs means[sR4|sR5|sR6|sR7|sR8|sR9|sR10|sR3];

 
pattern uhregs means[hR4|hR5|hR6|hR7|hR8|hR9|hR10|hR3];

 
pattern uhxregs means[hxR4|hxR5|hxR6|hxR7|hxR8|hxR9|hxR10|hxR3];
 
/* \end{verbatim}
\subsection{Register Pattern }
\begin{verbatim}    
*/
pattern indexreg 	means	[ siregs ] ;
pattern reg 		means	[ siregs | uiregs ];
pattern wreg 		means	[ swregs | uwregs ];
pattern hreg 		means	[ shregs | uhregs | uhxregs ];
pattern breg	 	means	[ sbregs | ubregs | uoregs ];
pattern anyreg 		means	[  breg|reg    | wreg   | hreg    ];
pattern wordreg		means	[ wreg | hreg | breg ];
pattern signedreg	means	[ siregs | swregs | shregs | sbregs ];
pattern unsignedreg means	[ uiregs | uwregs | ubregs | uhregs | uhxregs];
/*09/10/09 new part start*/
pattern nsreg		means	[ shregs | uhregs | uhxregs ];
/*09/10/09 end*/
/*
\end{verbatim}
*/
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Operators Definitions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

/*
\begin{verbatim}
*/
operation add 		means 	+  	assembles ['add'];
operation and 		means 	AND	assembles ['and'];
operation or  		means 	OR 	assembles ['or'] ;
operation xor	 	means 	XOR	assembles ['xor'];
operation sub 		means 	-  	assembles ['sub'];
operation mul	  	means 	* 	assembles ['mullw'];  
operation muli	  	means 	* 	assembles ['mull'];  
operation dv		means	div assembles ['divw']; 
operation max		means	MAX assembles['max'];
operation min		means	MIN assembles['min'];
operation rem		means	MOD assembles['rem'];
operation lt	  	means	< 	assembles ['lt'];
operation gt 		means 	> 	assembles ['gt'];
operation eq	 	means 	= 	assembles ['eq'];
operation ng 		means 	<= 	assembles ['ng'];
operation le 		means	<= 	assembles ['le'];
operation nl 		means 	>= 	assembles ['nl'];
operation ge 		means 	>= 	assembles ['ge'];
operation ne 		means 	<> 	assembles ['ne'];

operation shiftleft 	means 	<< 	assembles ['l'];
operation shiftright	means 	>> 	assembles ['r'];

/* \end{verbatim} 
\subsection{Operations Pattern }
\begin{verbatim}
*/

pattern logicoperator		means [and|or|xor];
pattern logicandoperator	means [and];
pattern nonmultoperator 	means [add|sub|logicoperator]; 
pattern immediateoperator 	means [add|sub|muli|or|xor]; 
pattern operator 			means [mul|dv|nonmultoperator]; 
pattern condition 			means [lt|gt|eq|ng|le|nl|ge|ne];
pattern cregcond			means [lt|gt|eq];
pattern unsignedcondition 	means [ne|nl|ng|eq];
pattern shiftop 			means [shiftleft|shiftright];
pattern eqcondition 		means [ne|eq];
/*
\end{verbatim}
*/
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					Memory Addresses Operations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
/*
\begin{verbatim}
*/
pattern 	labelf(label l)	
		means [l]	
		assembles [l];

pattern 	eareg(anyreg r)	
	 	means	[^(r)]		
		assembles ['('r')'];
	
pattern		regindirf(anyreg r)
	    means[^(r) ]
	    assembles['0(' r ')'];
	    
pattern 	offset(wordupto16 s)
		means	[const s]
		assembles [s];

pattern regoffset(wordupto32 s)
		means	[const s]
		assembles [s];


pattern 	immediate(signed s)
		means  	[const s] 	
		assembles [s];

pattern 	uimmediate(unsigned s)
		means  	[const s] 	
		assembles [s];

pattern 	intimmediate(int s) 
		means 	[const s] 	
		assembles [s];


		
/*09/10/09 new part start*/
	
pattern directf(unsigned s)
	means[const s]
	assembles[  s '(,1)' ];
pattern udirectf(int s)
	means[const s]
	assembles[  s '(,1)' ];
pattern barelab(label l)
	means[l]
	assembles[l];
pattern labelconstf(barelab l,signed s)
	means [+(l,const s)]
	assembles[l'+'s];
pattern constf(signed s)
	means[const s]
	assembles [s];


pattern offset2 means[/*labelconstf|*/constf|barelab];
pattern 	baseplusoffsetf(anyreg r, offset s )
		means	[ +( ^(r) , s )]
		assembles [ s'('r')' ];
pattern 	baseminusoffsetf(anyreg r, offset s ) 
		means	[ -( ^(r) , s )]
		 assembles [ '-'s'('r')'];


/* allow the address expression to be cast to an integer */
/*pattern eaform(guncasteaform f,int t)  
	means[(t)f]
	assembles[f];*/ 
	
pattern mainbase(barelab l,offset s)
	means [+(l,const s)]
	assembles[s'(r21)'];
/*
pattern mainbase1(barelab l,regoffset s)
	means [+(l, const s)]
	assembles['loadintr  r28 ,' s
			  '\n add r21,r21,r28'
			  '\n 0(r21)'];
*/	
pattern 	eaform 		means [/*mainbase|*/baseplusoffsetf | baseminusoffsetf  ];

pattern 	addrform 	means [eaform| regindirf];

pattern 	maddrmode(addrform f) 		
		means 	[mem(f)] 
		assembles [ f ];

pattern 	jumpmode 		means	[labelf|maddrmode];
pattern 	addrmode 		means	[maddrmode|anyreg]; 


pattern 	regaddrop(addrmode r)
		means[^(r)] 
		assembles[r];


pattern 	regaddrimmediate 	means[intimmediate|maddrmode|regaddrop];

instruction pattern PLANT(label l)
		means		[l] 
		assembles	[l':'];  
		
instruction pattern GOTO(anyreg r)
		means		[goto r]
		assembles	['mfctr TMPREG'
				   '\n mtctr ' r
				   '\n bctr ' 
				   '\n mtctr TMPREG' ];
				   
instruction pattern GOTO1(labelf l)
		means		[goto l]
		assembles	['b ' l];

instruction pattern LOADADDRESSfromVAR(wreg r, labelf lbl)
		means		[r:= lbl ]
		assembles	['lis ' r ',' lbl'@ha'
					 '\n la  ' r ',' lbl'@l(' r ')'];

instruction pattern LOADADDRESSfromDISP(wreg r, eaform ea)
		means		[r:= ea ]
		assembles	['la 'r','ea];

instruction pattern LOADADDRESSfromDISP2(wreg r, addrform ea)
		means		[r:= ea ]
		assembles	['la 'r','ea];

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
						Stack Instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction pattern INCSP(wordupto16 i)  
		means[ R1 :=+ (^(R1),i) ] 
		assembles['addi SP, SP, 'i]; 

instruction pattern DECSP(wordupto16 i)
		means[ R1 :=- (^(R1),i) ]  
		assembles['addi SP,SP,-'i]; 
			
instruction pattern PUSHDREG(reg r) 
		means[PUSH(mainSTACK,^(r))] 
		assembles['stdu ' r ', -8(SP)']; 

instruction pattern POPDREG(reg r)
		means[r:=(int64)POP(mainSTACK)] 
		assembles['ldu 'r', 8(SP)']; 
		

instruction pattern PUSHWREG(wreg r) 
		means[PUSH(mainSTACK,^(r))] 
		assembles['stwu 'r', -4(SP) '];  
	
instruction pattern POPWREG(wreg r,word32 t)
		means[(ref t) r:=(int32)POP(mainSTACK)] 
		assembles['lwzu 'r', 4(SP)']; 

instruction pattern PUSHHREG(hreg r) 
		means[PUSH(mainSTACK,^(r))] 
		assembles['sthu 'r', -4(SP)']; 
	
instruction pattern POPHREG(hreg r,word16 t)
		means[(ref t) r:=(int16)POP(mainSTACK)] 
		assembles['lhzu 'r', 4(SP)']; 

instruction pattern PUSHBREG(breg r) 
		means[PUSH(mainSTACK,^(r))] 
		assembles['stbu 'r', -4(SP)']; 
	
instruction pattern POPBREG(breg r,byte t)
		means[(ref t) r:=(int8)POP(mainSTACK)] 
		assembles['lbzu 'r', 4(SP)']; 


/*
\end{verbatim}
*/

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Load Instructions  
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
instruction pattern UALOADD(reg r, reg base, offset s, word64 t)
    	means		[r:= (t)^(mem(+(^(base),s)))]
		assembles	['unalignload ' r ',' base ',' s ];

instruction pattern UALOADW(wreg r, wreg base, offset s,word32 t)
    	means		[r:= (t)^(mem(+(^(base),s)))]
		assembles	['unalignload ' r ',' base ',' s ];

instruction pattern UALOADH(hreg r, hreg base, offset s, word16 t)
    	means		[r:= (t)^(mem(+(^(base),s)))]
		assembles	['unalignload ' r ',' base ',' s ];

instruction pattern UALOADB(breg r, breg base, offset s, byte t)
    	means		[r:= (t)^(mem(+(^(base),s)))]
		assembles	['unalignload ' r ',' base ',' s ];
		
instruction pattern LOAD(maddrmode rm, reg r, word64 t)
    	means		[r:= (t)^(rm)]
		assembles	['ld ' r ',' rm ];

instruction pattern LOADW(maddrmode rm, wreg r, word32 t)
    	means		[r:= (t)^(rm)]
		assembles	['lwz ' r ',' rm ];

instruction pattern LOADH(maddrmode rm, hreg r, word16 t)
    	means		[r:= (t)^(rm)]
		assembles	['lhz ' r ',' rm ];

instruction pattern LOADB(maddrmode rm, breg r, byte t)
    	means		[r:= (t)^(rm)]
		assembles	['lbz ' r ',' rm ];
pattern waddrmode means[maddrmode|wreg];
pattern haddrmode means[maddrmode|hreg];
pattern baddrmode means[maddrmode|breg];


instruction pattern LWZ(maddrmode rm, anyreg r,word32 t1,word64 t2)
    	means		[r:= (t2)EXTEND((t1)^(rm))]
		assembles	['lwz ' r ',' rm ];

instruction pattern LHZ(maddrmode rm, anyreg r, word16 t1,word64 t2)
		means		[r:=(t2)EXTEND((t1)^(rm))]
		assembles	['lhz ' r ',' rm];

instruction pattern LHZ2(maddrmode rm, anyreg r, word16 t1,word32 t2)
		means		[r:=(t2)EXTEND((t1)^(rm))]
		assembles	['lhz ' r ',' rm];
		
instruction pattern LBZ(maddrmode rm, anyreg r, byte t1,word64 t2)
		means		[r:=(t2)EXTEND((t1)^(rm))]
		assembles	['lbz ' r ',' rm];

instruction pattern LBZ2(maddrmode rm, anyreg r, byte t1,word32 t2)
		means		[r:=(t2)EXTEND((t1)^(rm))]
		assembles	['lbz ' r ',' rm];
		
instruction pattern LBZ3(maddrmode rm, anyreg r, byte t1,word16 t2)
		means		[r:=(t2)EXTEND((t1)^(rm))]
		assembles	['lbz ' r ',' rm];

instruction pattern LDX(reg r, reg r2, reg r3)
		means 		[r:=(int64) mem( +( ^(r2) , ^(r3)  ) ) ]
		assembles	['ldx ' r ',' r2 ',' r3 ];

instruction pattern LWZX(reg r, anyreg r2, anyreg r3,word32 t)
		means 		[r:=(int64)EXTEND( (t)mem( +( ^(r2) , ^(r3)  ) ) )]
		assembles	['lwzx ' r ',' r2 ',' r3 ]; 
 
instruction pattern LHZX(reg r, anyreg r2, anyreg r3,word16 t)
		means		[r:=(int64)EXTEND((t) mem(+(^(r2) ,^(r3) ) ) )]
		assembles	['lhzx ' r ',' r2 ',' r3 ];

instruction pattern LBZX(reg r, anyreg r2, anyreg r3,byte t)
		means		[r:=(int64)EXTEND((t) mem(+( ^(r2) , ^(r3) ) ) )]
		assembles	['lbzx ' r ',' r2 ',' r3 ];

 
instruction pattern LHZX2(anyreg r, anyreg r2, anyreg r3,word16 t,word32 tt)
		means		[r:=(tt)EXTEND((t) mem(+(^(r2) ,^(r3) ) ) )]
		assembles	['lhzx ' r ',' r2 ',' r3 ];

instruction pattern LBZX2(anyreg r, anyreg r2, anyreg r3,byte t,word32 tt)
		means		[r:=(tt)EXTEND((t) mem(+( ^(r2) , ^(r3) ) ) )]
		assembles	['lbzx ' r ',' r2 ',' r3 ];

instruction pattern LBZX3(anyreg r, anyreg r2, anyreg r3,byte t,word16 tt)
		means		[r:=(tt)EXTEND((t) mem(+( ^(r2) , ^(r3) ) ) )]
		assembles	['lbzx ' r ',' r2 ',' r3 ];

instruction pattern LOADLITI1(wordupto16 i, anyreg r)
		means		[r:=const i]
		assembles	['li ' r ',' i ]; 

instruction pattern LOADLITI(int i, anyreg r)
		means		[r:=const i]
		assembles	['loadintr ' r ',' i ]; 

instruction pattern LOADLITD(int i, anyreg r)
		means		[r:=const i]
		assembles	['loadd ' i
					 '\n mr ' r ', TMPREG']; 

instruction pattern LOADLITS(int i, anyreg r)
		means		[r:=const i]
		assembles	['loads ' i
					 '\n mr ' r ', TMPREG']; 

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Store Instructions  
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
instruction pattern UASTORE(reg r, reg base, offset s)
    	means		[ mem(+(^(base),s)) := r]
		assembles	['unalignstore ' r ',' base ',' s ];

instruction pattern STORED(maddrmode rm, reg r, word64 t)   
    	means		[ (ref t) rm:= ^(r) ]
		assembles	['std 'r','rm];
		
instruction pattern STOREW(maddrmode rm, wreg r, word32 t)
		means		[ (ref t) rm:= ^(r) ]
		assembles	['stw 'r','rm];
		
instruction pattern SW(reg r,reg rm, wordupto32 t)
	means[(ref t)mem(rm):=(t)^(r)]
	assembles['stw 'r',0('rm')'];
	
	
instruction pattern STOREW2(barelab l, wreg r1, wreg r2, word32 t, regoffset s)
		means		[(ref t) mem(+(l, s)) := r1]
		assembles['loadintr ' r2 ',' s
			  '\n add r27,r21,' r2
			  '\n stw' r1 ',0(r27)'];

instruction pattern STOREH(maddrmode rm, hreg r , word16 t)
		means		[ (ref t) rm:= ^( r) ]
		assembles	['sth 'r','rm];

instruction pattern STOREB(maddrmode rm, breg r, byte t)
	    	means		[ (ref t) rm:= ^(r) ]
		assembles	['stb 'r','rm];

/*
\end{verbatim}
*/
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Arithmetic Operations  
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
pattern const16(wordupto16 i)
    	        means           [ const i ]
                assembles       [ i ];
 
 pattern unconst16(unsignedup16 i)
    	        means           [ const i ]
                assembles       [ i ];
                
instruction pattern LOGOPERATION(operator op, anyreg r, anyreg r2, anyreg r3, int t)
	means		[(ref t) r := op ( (t)^(r3),(t)^(r2) ) ]
	assembles	[op' 'r','r3','r2];

instruction pattern ARIMOPERATION(immediateoperator op,reg r, anyreg r2, const16 r3, int t)
	means		[r :=   (t)op( (t)^(r2),r3 ) ]
	assembles	[op'i 'r','r2','r3];

instruction pattern ANDMOPERATION(reg r, anyreg r2, unconst16 r3, int t)
	means		[r :=   (t)AND( (t)^(r2),r3 ) ]
	assembles	['andi. ' r ',' r2 ',' r3];

instruction pattern ORMOPERATION(reg r, anyreg r2, unconst16 r3, int t)
	means		[r :=   (t)OR( (t)^(r2),r3 ) ]
	assembles	['ori' r ',' r2 ',' r3];

instruction pattern ARIOPERATION(operator op,reg r, anyreg r2, anyreg r3, int t)
	means		[r := EXTEND( (t)op( (t)^(r2),(t)^(r3) ) )]
	assembles	[op' 'r','r2','r3];

instruction pattern DIVD(reg r, reg r2)
   	means		[r:=div(^(r),^(r2))]
	assembles	['divd 'r','r','r2];
	
instruction pattern DIVW(wreg r, wreg r2)
   	means		[r:=div(^(r),^(r2))]
	assembles	['divw 'r','r','r2];
	
instruction pattern UDIVD(unsignedreg r, unsignedreg r2)
   	means		[r:=div((uint64)^(r),(uint64)^(r2))]
	assembles	['divdu 'r','r','r2];

instruction pattern UDIVW(unsignedreg r, unsignedreg r2)
   	means		[r:=div((uint32)^(r),(uint32)^(r2))]
	assembles	['divwu 'r','r','r2];

instruction pattern DIVD8(reg r)
	means		[r:=div((uint64)^(r),8)]
	assembles	['li r20,8 \n divdu 'r','r',r20'];

instruction pattern DIVW8(wreg r)
	means		[r:=div((uint32)^(r),8)]
	assembles	['li r20,8 \n divwu 'r','r',r20'];

instruction pattern MOD2(reg r)
	means		[r:=MOD(^(r),2)]
	assembles	['andi. 'r','r',1'];
	
instruction pattern MOD4(reg r)
	means		[r:=MOD(^(r),4)]
	assembles	['andi. 'r','r',3'];
	
instruction pattern MOD8(reg r)
	means		[r:=MOD(^(r),8)]
	assembles	['andi. 'r','r',7'];
	
instruction pattern MOD16(reg r)
	means		[r:=MOD(^(r),16)]
	assembles	['andi. 'r','r',15'];	

instruction pattern MODint32(anyreg r1, anyreg r2, anyreg r3, wordupto32 t)
    means[(ref t)r1:=  MOD(  (t)^(  r2), (t)^(  r3))]
	assembles['divw  ' r1 ',' r2 ',' r3
		   '\n mullw ' r1 ',' r1 '.' r3
		   '\n subf  ' r1 ',' r1 ',' r2];
instruction pattern MODEXTNEDint32(wreg r1, anyreg r2, immediate s,wordupto32 t)
    means[r1:=MOD((int32)EXTEND((t)^(r2)),s) ]
	assembles['li  r30 ,' s
			  '\n divw  ' r1 ',' r2  ', r30'
		      '\n mullw ' r1 ',' r1  ', r30'
		      '\n subf  ' r1 ',' r1  ',' r2];

/*
\begin{verbatim}
*/

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					Conditional Operations  
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/


instruction pattern IFWBOOL(label l, wordreg r, wordupto32 t) 
	means		[if(  (t)^(r)  ) goto l]
	assembles	['cmpwi ' r ',0' '\n bne ' l]; 		

instruction pattern IFDBOOL(label l, reg r, word64 t) 
	means		[if(  (t)^(r)  ) goto l]
	assembles	['cmpdi ' r ',0' '\n bne ' l]; 


instruction pattern IFLOGICOP(nonmultoperator op, addrmode rm1, addrmode rm2,anyreg r, int t, label l)
	means [if ( (int8) op( (int8)^(rm1) , (int8)^(rm2) ) ) goto l]
	assembles ['nop'];
	/*assembles [op ' 'rm2','rm1];*/

instruction pattern IFGOTO(label l, anyreg r1, anyreg  r2,eqcondition c)
	means[if((int8)c( ^(r1),^(r2)))goto l]
	assembles['cmpw ' r1 ','  r2 
			  '\n b'c ' ' l];
instruction pattern IFGTGOTO(label l,anyreg r1, anyreg  r2)
	means[if((int8)>( ^(r1),^(r2)))goto l]
	assembles['cmpw ' r1 ','  r2 
			  '\n bgt ' l];
instruction pattern IFLTGOTO(label l,anyreg r1, anyreg  r2)
	means[if((int8)<( ^(r1),^(r2)))goto l]
	assembles['cmpw ' r1 ','  r2 
			  '\n blt ' l];
instruction pattern IFGEGOTO(label l,anyreg r1, anyreg  r2)
	means[if((int8)>=( ^(r1),^(r2)))goto l]
	assembles['cmpw ' r1 ','  r2 
			  '\n bge ' l];
instruction pattern IFLEGOTO(label l,anyreg r1, anyreg  r2)
	means[if((int8)<=( ^(r1),^(r2)))goto l]
	assembles['cmpw ' r1 ','  r2 
			  '\n ble ' l];

instruction pattern IFLITGOTO(label l,anyreg r1,wordupto16 r2,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const r2))goto l]
	assembles['cmpwi  ' r1 ',  '  r2 
			  '\n b'c '   '  l];

instruction pattern IFLITGOTO2(label l,anyreg r1,signed s,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const s))goto l]
	assembles[' loadint ' s
			  '\n cmpw  ' r1 ', r30 '  
			  '\n b'c '   '  l];

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					Compersion Operations  
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/


instruction pattern SETW(condition c,anyreg r3,anyreg r2, anyreg r,type t1, wordupto32 t)
	means		[(ref t1) r:=(t1) c((t)^(r3),(t)^(r2))]
 	assembles  ['cmpw 'r3 ',' r2 
 				'\n li ' r ',0' 
 				'\n b'c ' 1f' 
 				'\n b 1f' 
 				'\n 1: not	' r ',' r 
 				'\n 2: nop'];

instruction pattern SETD(condition c,anyreg r3,anyreg r2, anyreg r,type t1, word64 t)
	means		[(ref t1) r:=(t1) c((int64)^((ref t)r3),(int64)^((ref t)r2))]
 	assembles  ['cmpd 'r3 ',' r2 
 				'\n li ' r ',0' 
 				'\n b'c ' 1f' 
 				'\n b 1f' 
 				'\n 1: not	' r ',' r 
 				'\n 2: nop'];

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			MINIMUM & MAXIMUM Operations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
instruction pattern INTDMIN(reg r1,reg r2)
	  	means		[ r1:=MIN(^(r1),^(r2))] 
		assembles	['cmpd  'r1','r2'\n  blt 1f \n addi 'r1','r2',0 \n 1:nop'];
instruction pattern INTDMAX(reg r1,reg r2)
	  	means		[ r1:=MAX(^(r1),^(r2))]
		assembles	['cmpd  'r1','r2'\n  bgt 1f \n addi 'r1','r2',0 \n 1:nop'];
instruction pattern INTWMIN(wreg r1,wreg r2)
	  	means		[ r1:=MIN(^(r1),^(r2))] 
		assembles	['cmpw  'r1','r2'\n  blt 1f \n addi 'r1','r2',0 \n 1:nop'];
instruction pattern INTWMAX(wreg r1,wreg r2)
	  	means		[ r1:=MAX(^(r1),^(r2))]
		assembles	['cmpw  'r1','r2'\n  bgt 1f \n addi 'r1','r2',0 \n 1:nop'];
instruction pattern INTHMIN(hreg r1,hreg r2)
        means[ (ref int16)r1:=MIN((int16)^(r1),(int16)^(r2))]
		assembles	['cmpw 'r2','r1'\n  blt 1f \n addi 'r2','r1',0 \n 1:nop'];
instruction pattern INTHMAX(hreg r1,hreg r2)
        means[(ref int16) r1:=MAX((int16)^(r1),(int16)^(r2))]
		assembles	['cmpw 'r2','r1'\n  bgt 1f \n addi 'r2','r1',0 \n 1:nop'];
instruction pattern INTBMIN(breg r1,breg r2)
        means[(ref int8) r1:=MIN((int8)^(r1),^(r2))]
		assembles	['cmpw 'r2','r1'\n  blt 1f \n addi 'r2','r1',0 \n 1:nop'];
instruction pattern INTBMAX(breg r1,breg r2)
        means[(ref int8)r1:=MAX((int8)^(r1),^(r2))]
		assembles	['cmpw 'r2','r1'\n  bgt 1f \n addi 'r2','r1',0 \n 1:nop'];
instruction pattern INTNBMIN(breg r1,breg r2)
        means[(ref uint8) r1:=MIN((uint8)^(r1),^(r2))]
		assembles	['cmpw 'r2','r1'\n  blt 1f \n addi 'r2','r1',0 \n 1:nop'];
instruction pattern INTNBMAX(breg r1,breg r2)
        means[(ref uint8)r1:=MAX((uint8)^(r1),^(r2))]
		assembles	['cmpw 'r2','r1'\n  bgt 1f \n addi 'r2','r1',0 \n 1:nop'];


/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			SHIFT Operations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction pattern SHIFTWIMM(shiftop op, anyreg r, immediate s, type t)
		means		[ (ref t) r:= (t)op(^(r),s)] 
		assembles	['s'op'wi ' r ', ' r ',' s];

instruction pattern SHIFTWREG(shiftop op, anyreg r, anyreg r2, type t)
		means		[ (ref t) r:= (t)op(^(r),^(r2))]
		assembles	['s'op 'w ' r ', ' r ',' r2];

instruction pattern SHIFTDIMM(shiftop op, anyreg r, immediate s, type t)
		means		[ (ref t) r:= (t)op(^(r),s)] 
		assembles	['s'op'di ' r ', ' r ',' s];

instruction pattern SHIFTDREG(shiftop op, anyreg r, anyreg r2, type t)
		means		[ (ref t) r:= (t)op(^(r),^(r2))]
		assembles	['s'op 'd ' r ', 'r ',' r2];

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Saturated Operations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
instruction pattern ADDUSB(ubregs r1,ubregs rm)
	means[ rm:= +:((uint8)^(rm),^(r1))]
	assembles[ 'add.  ' rm ',' rm ',' r1 
			'\n bne 1f '
			'\n li ' rm ',255'
			'\n 1: nop']; 
/*	assembles[ 'vaddubs  ' rm ',' rm ',' r1]; */
	
instruction pattern ADDSSB(sbregs r1,sbregs rm)
	means[ rm:=(int8) +:((int8)^(rm),^(r1))]
	assembles[ 'add.  ' rm ',' rm ',' r1 
			'\n bne 1f '
			'\n li ' rm ',127'
			'\n 1: nop']; 
/*	assembles[ 'vaddsbs  ' rm ',' rm ',' r1]; */

instruction pattern SUBUSB(ubregs r1,ubregs rm)
	means[ rm:= -:((uint8)^(rm),^(r1))]
	assembles[ 'sub  ' rm ',' rm ',' r1 
			'\n bne 1f '
			'\n li ' rm ',0'
			'\n 1: nop']; 

/*	assembles[ 'vsububs  ' rm ',' rm ',' r1]; */

instruction pattern SUBSSB(sbregs r1,sbregs rm)
	means[ rm:= (int8)-:((int8)^(rm),^(r1))]
	assembles[ 'sub  ' rm ',' rm ',' r1 
				'\n bne 1f '
			'\n li ' rm ',-127'
			'\n 1: nop']; 

instruction pattern MULUSB(ubregs r1,ubregs rm)
	means[ rm:= *:((uint8)^(rm),^(r1))]
	assembles[ 'add.  ' rm ',' rm ',' r1 
			'\n bne 1f '
			'\n li ' rm ',255'
			'\n 1: nop']; 
/*	assembles[ 'vaddubs  ' rm ',' rm ',' r1]; */
	
instruction pattern MULSSB(sbregs r1,sbregs rm)
	means[ rm:=(int8) *:((int8)^(rm),^(r1))]
	assembles[ 'add.  ' rm ',' rm ',' r1 
			'\n bne 1f '
			'\n li ' rm ',127'
			'\n 1: nop']; 

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Other Operations
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction  pattern INC(addrmode rm,int t)
	means[(ref t)rm:=   + (^(rm),1)]
	assembles['addi' rm ',' rm ',1']; 

instruction  pattern DEC(addrmode rm,int t)
	means[(ref t)rm:=   - ((t)^(rm),1)]
	assembles['addi' rm ',' rm ',-1']; 
	
instruction pattern IFBOOL(label l,breg r1)
	means[ if( (int8)^(r1))goto l]
	assembles['cmpw ' r1 ',' r1 '\n beq ' l];
	
instruction pattern NOTOP(anyreg r,anyreg r2, type t)
	means[(ref t)r:= NOT((t)^(r2))]
	assembles['not ' r ',' r2];
	
instruction pattern NEG(anyreg r, int t)
		means		[(ref t)r:= -((t)0,(t)^((ref t)r))]
		assembles 	['neg ' r ',' r];    

instruction pattern STOREPNTR64(maddrmode rm1,reg r, type t)
    		means		[ (ref ref t) rm1:=  ^(r) ]
			assembles	['std ' r ', ' rm1 ];		
			
instruction pattern STOREPNTR32(maddrmode rm1,wreg r, type t)
    		means		[ (ref ref t) rm1:=  ^(r) ]
			assembles	['stw ' r ', ' rm1 ];		

instruction pattern UASTOREPNTR(reg r, reg base, offset s, type t)
    	means		[(ref ref t) mem(+(^(base),s)) := ^(r)] 
		assembles	['unalignstore ' r ',' base ',' s ];

instruction pattern CLEARREG(anyreg r,  type t)
    		means		[ (ref t) r:= (t)0 ]
		assembles	['li ' r ',0'];
		
instruction pattern SELECT(anyreg r,anyreg r2,addrmode rm,wordupto64 t)
	means		[(ref t) r:=OR(AND((t)^(r),(t)^(r2)),AND((t)^(rm),NOT(^(r2))))]
	assembles	['   and ' r ',' r ',' r2
			 '\n not ' r2 ',' r2 
			 '\n andi. ' r2 ',' r2 ',' rm
			 '\n or  ' r ',' r ',' r2];   

instruction pattern PLANTDICONST( word64 r,type t) 
	means[loc (t) r] 
	assembles[ '.quad ' r];

instruction pattern PLANTICONST(longint r,type t) 
	means[loc (t) r] 
	assembles[ '.long ' r];

instruction pattern PLANTBCONST( byte r,type t) 
	means[loc (t) r]
	assembles[ '.byte ' r];
instruction pattern PLANTHCONST( word16 r,type t) 
	means[loc (t) r] 
	assembles[ '.short ' r];

instruction pattern FAIL(int i)
	means [interrupt i]
	assembles ['li      0,1'
				'\n li      3,1'
				'\n sc '];

/* \end{verbatim} */


