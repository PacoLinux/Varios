/*


Basic ia32 processor description
 copyright(c) Paul Cockshott, University of Glasgow
 Feb 2000


\subsection{Declare types to correspond to internal ilcg types }
\begin{verbatim}
*/
define(PTRMACRO,ifdef(`gas', ptr , ))
define(NEARMACRO,ifdef(`gas',,near))
type word=DWORD;
type uint32=DWORD;
type int32=DWORD;
type ieee64=QWORD;
type doubleword=QWORD;
type uint64=QWORD;
type int64=QWORD;
type octet=BYTE;
type uint8=BYTE;
type int16=WORD;
type uint16=WORD;
type int8=BYTE;
type ieee32=DWORD;
type halfword=WORD;
pattern oplen means[word|halfword|octet];
/* \end{verbatim}
\subsection{compiler configuration flags }
\begin{verbatim}
*/
flag realLitSupported = 0;
/* \end{verbatim}
\subsection{Register declarations}
Note that we declare the 64 bit registers but do not enable them unless
the flag bit64 has been defined.
this is the ifdef(`bit64', 64 , 32 ) bit version
\begin{verbatim}
*/


register int64 R8	assembles ['r8'];
register int64 R9	assembles ['r9'];
register int64 R10	assembles ['r10'];
reserved register int64 R11	assembles ['r11'];

register int64 R12	assembles ['r12'];
register int64 R13	assembles ['r13'];
register int64 R14	assembles ['r14'];
register int64 R15	assembles ['r15'];
register quadword RADX	assembles ['radx'];
alias register int64 RAX= RADX (0:63)	assembles ['rax'] ;
alias register uint64 uRAX = RAX(0:63)	assembles ['rax'];
register int64 RBX	assembles['rbx'];
alias register int32 EBX=RBX(0:31) assembles['ebx'] ;
register int64 RCX	assembles['rcx'];
alias register int32 ECX=RCX(0:31) assembles['ecx'] ;
alias register int64 RDX= RADX (64:127)	assembles ['rdx'] ;
alias register int64 EADX = RADX(32:95)	assembles ['eadx '];
alias register int32 EAX= EADX (0:31) assembles ['eax'] ;

alias register uint32 uEAX = RAX(0:31)	assembles ['eax'];
alias register int32 EDX= EADX (32:63) assembles ['edx'] ;
alias register uint64 EADXu=EADX(0:63)assembles['eadx'];

register int64 RSI	assembles['rsi'];
alias register int32 ESI =RSI(0:31)assembles['esi'] ;
register int64 RDI	assembles['rdi'];
alias register int32 EDI =RDI(0:31)assembles['edi'] ;
reserved register int64 RBP	assembles['rbp'];
alias register int32 EBP = RBP(0:31) assembles ['ebp'];
reserved register int64 RSP	assembles['rsp'];
alias register int32 ESP = RSP(0:31) assembles['esp'];

define(stackp,ifdef(`bit64',RSP,ESP))
define(stackstride,ifdef(`bit64',8,4))
ifdef(`bit64',

alias register int32 R8D = R8(0:31) assembles ['r8d'];
alias register int32 R9D = R9(0:31) assembles ['r9d'];
alias register int32 R10D = R10(0:31) assembles ['r10d'];
alias register int32 R11D = R11(0:31) assembles ['r11d'];
alias register int32 R12D = R12(0:31) assembles ['r12d'];
alias register int32 R13D = R13(0:31) assembles ['r13d'];
alias register int32 R14D = R14(0:31) assembles ['r14d'];
alias register int32 R15D = R15(0:31) assembles ['r15d'];

alias register int8 R8B = R8D(0:7) assembles ['r8b'];
alias register int8 R9B = R9D(0:7) assembles ['r9b'];
alias register int8 R10B = R10D(0:7) assembles ['r10b'];
alias register int8 R11B = R11D(0:7) assembles ['r11b'];
alias register int8 R12B = R12D(0:7) assembles ['r12b'];
alias register int8 R13B = R13(0:7) assembles ['r13b'];
alias register int8 R14B = R14(0:7) assembles ['r14b'];
alias register int8 R15B = R15(0:7) assembles ['r15b'];
alias register uint8 R8Bu = R8D(0:7) assembles ['r8b'];
alias register uint8 R9Bu = R9D(0:7) assembles ['r9b'];
alias register uint8 R10Bu = R10D(0:7) assembles ['r10b'];
alias register uint8 R11Bu = R11D(0:7) assembles ['r11b'];
alias register uint8 R12Bu = R12D(0:7) assembles ['r12b'];
alias register uint8 R13Bu = R13(0:7) assembles ['r13b'];
alias register uint8 R14Bu = R14(0:7) assembles ['r14b'];
alias register uint8 R15Bu = R15(0:7) assembles ['r15b'];
alias register int64 SP = RSP(0:63)	assembles['rsp'];
alias register int64 FP = RBP(0:63)	assembles['rbp'];,
alias register int32 FP = EBP(0:31) assembles ['ebp'];
alias register int32 SP = ESP(0:31) assembles['esp'];
)
alias register uint32 uax= EAX (0:31) assembles ['eax'] ;
alias register uint32 ucx= ECX (0:31) assembles ['ecx'] ;
alias register uint32 ubx= EBX (0:31) assembles ['ebx'] ;
alias register uint32 usi= ESI (0:31) assembles ['esi'] ;
alias register uint32 udi= EDI (0:31) assembles ['edi'] ;
alias register uint32 udx= EDX (0:31) assembles ['edx'];
/* use these for signed 8 bit values */
 alias register int8 AL = EAX(0:7) assembles['al'];
 alias register int8 BL = EBX(0:7) assembles['bl'];
 alias register int8 CL = ECX(0:7) assembles['cl'];
 alias register int8 DL = EDX(0:7) assembles['dl'];
 alias register int8 iBH = EBX(8:15) assembles['bh'];
 alias register int8 iCH = ECX(8:15) assembles['ch'];
 alias register int8 iDH = EDX(8:15) assembles['dh'];
/* use these for unsigned 8 bit values */
/* alias register uint8 AH = EAX(8:15) assembles['ah']; dont use this*/
 alias register uint8 BH = EBX(8:15) assembles['bh'];
 alias register uint8 CH = ECX(8:15) assembles['ch'];
 alias register uint8 DH = EDX(8:15) assembles['dh'];
 alias register uint8 uAL = EAX(0:7) assembles['al'];
 alias register uint8 uBL = EBX(0:7) assembles['bl'];
 alias register uint8 uCL = ECX(0:7) assembles['cl'];
 alias register uint8 uDL = EDX(0:7) assembles['dl'];

/* use these for untyped 8 bit values */
 alias register octet oAL = EAX(0:7) assembles['al'];
 alias register octet oBL = EBX(0:7) assembles['bl'];
 alias register octet oCL = ECX(0:7) assembles['cl'];
 alias register octet oDL = EDX(0:7) assembles['dl'];

 alias register int16 AX =EAX(0:15)assembles['ax'];
 alias register int16 BX =EBX(0:15)assembles['bx'];

 alias register int16 DX =EDX(0:15)assembles['dx'];
 alias register int16 CX =ECX(0:15)assembles['cx'];
 alias register uint16 uAX =EAX(0:15)assembles['ax'];
 alias register uint16 uBX =EBX(0:15)assembles['bx'];

 alias register uint16 uDX =EDX(0:15)assembles['dx'];
 alias register uint16 uCX =ECX(0:15)assembles['cx'];
 alias register halfword SI = ESI(0:15)assembles['si'];
 alias register halfword DI = EDI(0:15)assembles['di'];


register stack(4096)int32 mainSTACK assembles[ 'mainSTACK'];
                  /* \end{verbatim}
\subsection{Register sets }
There are several intersecting sets of registers defined
for different instructions. Note that the ECX  and CL,CH registers
are named last  in their   lists to increase the chance
that they are free for sepecial instructions that need them.
\begin{verbatim}
*/
pattern basereg means[ifdef(`bit64',
 RBP|RSP| R8|R9|R10|R11|R12|R13|R14|R15|RCX|RDX|RSI|RDI|RAX|RBX|uRAX,
 EAX|EBX|EDX|EDI|ESI|EBP|ESP|EAX|ECX|uEAX)];
pattern indexreg means[
ifdef(`bit64',
 RBP| RCX|RDX|RSI|RDI|RAX|RBX|R8|R9|R10|R11|R12|R13|R14|R15|uRAX,
 EAX|EBX|EDX|EDI|ESI|EBP|EAX|ECX|ESP|uEAX)
 ];
pattern int32reg means [EAX|EBX|EDX|EDI|ESI|EBP|ESP|EAX|ECX 
ifdef(`bit64',
|R8D|R9D|R10D|R11D|R12D|R13D|R14D|R15D,
)];
pattern int64reg means [ RBP|RSP| R8|R9|R10|R11|R12|R13|R14|R15|RCX|RDX|RSI|RDI|RAX|RBX];
pattern nonaccreg means[
ifdef(`bit64',
RDI|RSI|RBX|RCX|R8|R9|R10|R11|R12|R13|R14|R15,
EDI|ESI|EBX|ECX)
];
pattern indexorint32 means[basereg|int32reg];
pattern nsreg means[ifdef(`bit64',RBP|R8|R9|R10|R11|R12|R13|R14|R15,EDI|ESI|EBX|FP|EAX|EDX|ECX)];

pattern accumulators means[EAX|EDX|ECX|EBX];
pattern ireg means [  basereg]  ;
pattern ureg means [ ubx|udi|usi|udx|ucx|uax ]  ;

pattern reg means [ireg|ureg];

/* Note that the order of the byte registers is chosen to keep the ah and al regs
   free for instructions that require themspecifically, particularly
conditional expressions on the floating point stack, that return boolean
results in al */
pattern bireg means[ 
  ifdef(`bit64',
  BL|DL|AL|CL|R8B|R9B|R10B|R11B|R12B|R13B|R14B|R15B,
  BL|DL|AL|iBH|iDH|iCH|CL)
  ];

pattern bureg means[
ifdef(`bit64',
  uAL|uBL|uDL|uCL| R8Bu|R9Bu|R10Bu|R11Bu|R12Bu|R13Bu|R14Bu|R15Bu,
  BH|DH|uAL|uBL|uDL|uCL|CH
  )];
pattern boreg means[oBL|oAL|oDL|oCL];
pattern biacc means[AL];
pattern buacc means[uAL];
pattern bacc means[biacc|buacc];
pattern nonacc means[EBX|EDI|ESI|ECX];
pattern noncount means[EDX|EBX|EDI|ESI|EAX];
pattern noncount64 means [R8|R9|R10|R11|R12|R13|R14|R15];
pattern bnoncount means[
ifdef(`bit64',
BL|DL|AL| R8B|R9B, 
BL|DL|AL|iBH|iDH|iCH)
];
pattern bunoncount means[
ifdef(`bit64',
uAL|uBL|uDL|R8Bu|R9Bu|R10Bu|R11Bu|R12Bu|R13Bu|R14Bu|R15Bu ,
BH|DH|uAL|uBL|uDL|CH)
];
pattern wnoncount means[BX|AX|DX|SI|DI];
pattern noncountreg means[bnoncount|bunoncount|noncount|wnoncount 
ifdef(`bit64',|noncount64)
];
pattern binonacc means[BL|DL|CL];
pattern bunonacc means[
ifdef(`bit64',
uDL|uCL,BH|DH|uDL|uCL|CH)
];
pattern bnonacc means[binonacc|bunonacc];
pattern breg means[bacc|bireg|bureg|bnoncount|bunoncount|bnonacc| boreg  ];
pattern swreg means[BX|AX|DX|CX];
pattern uwreg means[uBX|uDX|uCX];
pattern untypedwreg means[SI|DI];
pattern wreg means[swreg|uwreg|untypedwreg];
pattern pushreg means[
ifdef(`bit64',
indexreg,
reg|wreg)
];
/* these are directly pushable */
/*pattern dummyreg means[fitemp];*/
pattern dpushreg means[ifdef(`bit64',indexreg,reg)];
pattern anyreg means[ breg|wreg|int32reg|reg];
pattern signedreg means[bireg|swreg|int32reg|ireg];
pattern unsignedreg means[bureg|ureg|uwreg|ureg];
pattern acc means[EAX];
pattern qacc means[EADX];
pattern oacc means[RADX];
pattern dacc means[EDX];
pattern wacc means[AX];
pattern ebxacc means[EBX];
pattern ebxbacc means[BL];
pattern ecxacc means[ECX];
pattern ecxbacc means[CL];
pattern ecxbuacc means[uCL];
pattern ecxuacc means[ucx];
pattern modreg means [ECX];
pattern sourcereg means [ESI];
pattern destreg means [EDI];
pattern countreg means [ECX];
pattern eadxu means [EADXu];
pattern shiftcountreg means [ecxbacc|ecxbuacc|ecxacc|ecxuacc];


/*\end{verbatim}

\subsection{Operator definition}
This section defines operations that can be used to parameterise
functions.
\begin{verbatim}

*/
operation add means  +  assembles [ 'add'];
/* */operation and means  AND  assembles[ 'and'];
operation or means OR assembles['or'];
operation xor means XOR assembles['xor'];/* */
operation sub means  -  assembles [ 'sub'];
operation mul means * assembles ['mul'];
operation imul means * assembles ['imul '];
operation bel means < assembles ['b'];
operation lt means < assembles ['l'];
operation ab means > assembles ['a'];
operation gt means > assembles ['g'];
operation eq means = assembles ['z'];
operation be means <= assembles ['be'];
operation le means <= assembles ['le'];
operation ae means >= assembles ['ae'];
operation ge means >= assembles ['ge'];
operation ne means <> assembles ['nz'];
operation shiftleft means << assembles ['l'];
operation shiftright means >> assembles ['r'];
operation plus means + assembles [' + '];
operation minus means - assembles [' - '];
pattern commuteop means[or|xor|add|and];
pattern condition means[ne|ge|le|eq|gt|lt];
pattern equals means[eq];
pattern eqcondition means[ne|eq];
pattern unsignedcondition means[ne|ae|be|eq|ab|bel];
pattern operator means[add |imul| sub|and|or|xor];
pattern logoperator means[and|or|xor];

pattern nonmultoperator means[add|sub|logoperator];
pattern nonmultcomop means[add|logoperator];
pattern saddoperator means[add|imul|and|or|xor];
pattern shiftop means [shiftleft|shiftright];

/*

\end{verbatim}
\subsection{Data formats}
Here we define ilcg symbols for the types that
can be used as part of instructions.
\begin{verbatim}
*/
pattern unsigned means[uint32|uint8|uint16];
pattern signed means[   int8 |   int16| ifdef(`bit64',int64|)int32 ];
pattern intupto32 means [int8|int16|int32|uint8|uint16|uint32];
pattern int means[   int8 |   int16 |int32| ifdef(`bit64',int64|)uint32|uint8|uint16];
pattern double means[ieee64] ;
pattern float  means[ieee32];
pattern real means [ieee64|float];
pattern byte means[uint8|int8|octet];

pattern word32 means[int32|uint32|word];
pattern word16 means[int16|uint16|halfword];
pattern wordupto32 means[byte|word16|word32];
pattern dataformat means[octet|word];
pattern integer64 means[int64|uint64];
pattern integer32 means[int32|uint32];
pattern wordupto64 means[wordupto32|integer64];
pattern longint means  
ifdef(`bit64',
 [integer64], 
 [int32|uint32]
);
pattern hiint means[int32|int64|int16];
pattern int32or64 means[int32|int64];
pattern two(type t)means[2] assembles['2'];
pattern four(type t)means[4] assembles['4'];
pattern eight(type t)means[8] assembles['8'];

pattern scale means[two|four|eight];

/* \end{verbatim}

Define the address forms used in lea instructions
these differ from the address forms used in other instructions as the
semantics includes no memory reference.
Also of course register and immediate modes are not present.

\begin{verbatim} */
pattern labelf(label l)
	means [l]
	assembles[
	ifdef(`bit64', ' rel 'l  ,l)];
pattern abslabelf(label l)
	means [l]
	assembles[l];
pattern sconst(signed s)means[const s]assembles[s];
pattern uconst(unsigned s) means [const s] assembles[s];
pattern lconstf means[sconst|labelf];
pattern plusorminus means[plus|minus];
pattern labelconstf(lconstf l,lconstf s, plusorminus a)
	means [a(l, s)]
	assembles[l  a  s];
pattern constf(signed s)
	means[const s]
	assembles [s];
pattern offset means[
	constf
	ifdef(`bit64', ,
		|labelf
		|labelconstf
	)
	|uconst];
pattern regindirf(reg r)
	means[^(r) ]
	assembles[ r ];
pattern simplescaled(indexreg r1,scale s)
	means[*(^(r1),s)]
	assembles[r1 '*'s];
pattern negcompscaled(indexreg r1,scale s,offset o)
	means[*(-(^(r1),o),s)]
	assembles[r1 '*'s'-(' s'*'o')'];
pattern compscaled(indexreg r1,scale s,offset o)
	means[*(+(^(r1),o),s)]
	assembles[r1 '*'s'+(' s'*'o')'];
pattern scaled means[compscaled|negcompscaled|simplescaled];
pattern baseminusoffsetf(basereg r, offset s )
	means[-(   ^(r) ,  s)]
	assembles[  r '-(' s ')'];
pattern baseplusoffsetf(basereg r, offset s )
	means[+(   ^(r) ,  s)]
	assembles[  r '+' s ];
pattern scaledIndexPlusOffsetf( scaled s, offset offs)
	means[+(s, offs)]
	assembles[ s '+' offs];

address pattern basePlusScaledIndexf(basereg r1,nsreg r2,scale s)
	means[+(^(r1),*(^(r2),s))]
        assembles[  r1 '+' r2 '*'  s ];
/*address pattern basePlusScaledIndexf(reg r1,scaled s)
	means[+(^(r1),s)]
        assembles[  r1 '+'   s   ];*/
address pattern basePlusScaledIndexPlusOffsetf(basereg r1,scaled s,offset off,longint t)
	means[+(^(r1),+(s,off)) ]
        assembles[  r1 '+' s '+'off  ];
address pattern basePlusScaledIndexPlusOffsetf2(basereg r1,scaled s,offset off,longint t)
	means[+(s,+(^(r1),off)) ]
        assembles[  r1 '+' s '+'off  ];
address pattern basePlusScaledIndexPlusOffsetf3(basereg r1,scaled s,offset off,longint t)
	means[+(off,+(^(r1),s)) ]
        assembles[  r1 '+' s '+'off  ];
address pattern basePlusIndexPlusOffsetf(basereg r1,indexreg r2,offset off)
	means[+(^(r1),+(^(r2),  off))]
        assembles[  r1 '+' r2 ' +'off  ];
address pattern basePlusIndexf(basereg r1,indexreg r2)
	means [+(^(r1),^(r2))]
	assembles[  r1 '+' r2   ];
pattern directf(unsigned s)
	means[const s]
	assembles[  s  ];
pattern udirectf(int s)
	means[const s]
	assembles[  s  ];

pattern riscaddr means[offset|baseplusoffsetf|regindirf];
/*\end{verbatim}\subsection{Choice of effective address}
 This contains the useful formats for the load effective address instruction.
The pattern
 regindirf is excluded here as it adds nothing
   we do not have already from mov instructions.

\begin{verbatim}
*/
pattern uncasteaform means[ifdef(`bit64',  , 
     directf  
	|udirectf
	|labelf
	|  labelconstf
	|)scaledIndexPlusOffsetf|
	basePlusScaledIndexPlusOffsetf|
	basePlusScaledIndexPlusOffsetf2|
	basePlusScaledIndexPlusOffsetf3|
	scaledIndexPlusOffsetf|
	basePlusScaledIndexf|
	baseplusoffsetf |
	basePlusIndexPlusOffsetf|
	baseminusoffsetf|
	basePlusIndexf
];
pattern eaform(uncasteaform f,longint t)  /* allow the address expression to be cast to an integer */
	means[(t)f]
	assembles[f];

pattern uncastleaform means[directf  
	|udirectf
	|	labelf
	|  labelconstf
	|scaledIndexPlusOffsetf
	|baseplusoffsetf
	|basePlusScaledIndexPlusOffsetf
	|basePlusScaledIndexPlusOffsetf2
	|basePlusIndexPlusOffsetf
	|basePlusScaledIndexf|basePlusIndexf
	|     scaledIndexPlusOffsetf
	|baseminusoffsetf  
];
	
pattern leaform(uncastleaform f, longint  t)  /* allow the address expression to be cast to an integer */
	means[(t)f]
	assembles[f];
/*\end{verbatim}
 \subsection{ Formats for all memory addresses}
 \begin{verbatim}*/
pattern addrform means[labelf|eaform|regindirf];


/** \end{verbatim}
define the address patterns used in other instructions

\begin{verbatim}

*/





pattern maddrmode(addrform f)
	means[mem(f) ]
	assembles[ 'PTRMACRO [' f ']' ];
pattern memrisc(riscaddr r)
	means[mem(r)]
	assembles['PTRMACRO ['r']'];
pattern gmaddrmode means[maddrmode];
pattern immediate(signed s)means [const s] assembles [s];
pattern intimmediate(int s)means [const s] assembles [s];
pattern uimmediate(unsigned s)means[const s] assembles[s];
pattern jindir(maddrmode m)means[m] assembles['qword ' m];
pattern jumpmode means[ifdef(`bit64',abslabelf,labelf)|ifdef(`gas',jindir,regindirf)];
pattern addrmode means[maddrmode|anyreg];
pattern uwaddrmode means[maddrmode|uwreg];
pattern uaddrmode means[maddrmode|ureg];
pattern baddrmode means[maddrmode|breg];
pattern waddrmode means[maddrmode|reg];
pattern wmemdummy means[maddrmode];
pattern regshift(shiftcountreg r)means[^(r)] assembles['cl'];
pattern shiftcount means[immediate|regshift];
pattern regaddrop(addrmode r)means[^(r)] assembles[r];
pattern uwregaddrop(uwaddrmode r)means[^(r)]assembles[r];
pattern regaddrimmediate means[intimmediate|maddrmode|regaddrop];
pattern regval(anyreg r)means[^(r)] assembles[r];
pattern regimmediate means[ immediate|regval];
pattern uwregaddrimmediate means[uimmediate|uwregaddrop];
/* \end{verbatim}

\subsection{Instruction patterns for the  386}
\subsubsection{Stack operations }

\begin{verbatim}
*/

instruction pattern STACKSTORE32(int32reg r1 )
	means[(ref int32)mem((int32)POP(mainSTACK)):=^(r1)]
	assembles['push 'r1'\n xchg DWORD PTRMACRO[esp+4],eax;STACKSTORE32\n  pop DWORD PTRMACRO[eax]\n pop eax  '];
instruction pattern STACKSTORE64(int64reg r1 )
	means[(ref int64)mem((int64)POP(mainSTACK)):=^(r1)]
	assembles['xchg QWORD PTRMACRO[rsp],'r1'\n  pop QWORD PTRMACRO['r1']\n   '];
instruction pattern STACKWSTORE(wreg r1 )
	means[(ref halfword)mem((int32)POP(mainSTACK)):=^(r1)]
	assembles['xchg DWORD PTRMACRO[esp],esi\n  mov word [esi],'r1'\n  pop esi'];
instruction pattern STACKBSTORE(breg r1 )
	means[(ref octet)mem((int32)POP(mainSTACK)):=^(r1)]
	assembles['xchg DWORD PTRMACRO[esp],esi\n  mov BYTE [esi],'r1'\n  pop esi'];
instruction  pattern SMLIT32( nonmultoperator op,offset s)
        means[ PUSH(mainSTACK,(int32)op((int32) POP(mainSTACK), s))]
    	assembles[op '  DWORD PTRMACRO[esp] ,' s];
instruction  pattern SMLIT64( nonmultoperator op,offset s)
        means[ PUSH(mainSTACK,(int32)op((int32) POP(mainSTACK), s))]
    	assembles[op '  DWORD PTRMACRO[rsp] ,' s];
instruction  pattern SMULIT( nonmultoperator op,offset s)
        means[ PUSH(mainSTACK,(int32)*((int32) POP(mainSTACK), s))]
    	assembles['xchg eax,DWORD PTRMACRO[esp]\n imul eax ,' s'\n xchg eax,DWORD PTRMACRO[esp]' ];

instruction pattern SADD(saddoperator op)
	means [PUSH(mainSTACK,(longint)+((longint)POP(mainSTACK),(longint)POP(mainSTACK)))]
	assembles['xchg eax,DWORD PTRMACRO[esp]\n add DWORD PTRMACRO[esp+4],eax\n pop eax'];

instruction pattern SOP(saddoperator op)
	means [PUSH(mainSTACK,(longint)op((longint)POP(mainSTACK),(longint)POP(mainSTACK)))]
	assembles['xchg eax,DWORD PTRMACRO[esp]\n 'op' eax,DWORD PTRMACRO[esp+4]\n mov DWORD PTRMACRO[esp+4],eax\n pop eax'];
instruction pattern SLOP(logoperator op)
	means [PUSH(mainSTACK,(word)op((word)POP(mainSTACK),(word)POP(mainSTACK)))]
	 assembles['xchg eax,DWORD PTRMACRO[esp];SLOP\n 'op' eax,DWORD PTRMACRO[esp+4]\n mov DWORD PTRMACRO[esp+4],eax\n pop eax'];
instruction pattern SLOP64(logoperator op)
	means [PUSH(mainSTACK,(word)op((word)POP(mainSTACK),(word)POP(mainSTACK)))]
	 assembles['xchg rax,[rsp];#SLOP64\n 'op' rax,[rsp+8]\n mov [rsp+8],rax\n pop rax'];
instruction  pattern SMR( nonmultoperator op,reg r1)
        means[ PUSH(mainSTACK,(int32)op( (longint)POP(mainSTACK),(longint)^( r1)))]
    	assembles[op '  DWORD PTRMACRO[esp] ,ifdef(`gas',DWORD, )' r1];
instruction  pattern SMRSHIFT( shiftop op,shiftcountreg r1)
        means[ PUSH(mainSTACK, op( (int32)POP(mainSTACK),^( r1)))]
    	assembles['xchg eax, [esp]\n'
                  'sa'op '  eax ,cl'
                  '\n xchg eax,[esp]'];
instruction  pattern BSMR( nonmultoperator op,breg r1)
        means[ PUSH(mainSTACK,(octet)op( (int8)POP(mainSTACK),^( r1)))]
    	assembles[op '  byte[esp] ,' r1];

instruction  pattern SMRADD( reg r1)
        means[ r1:=(int32)+((longint) POP(mainSTACK),^( r1))]
    	assembles['add 'r1',DWORD PTRMACRO[esp] \n add esp,4'];

instruction  pattern SMRP( nonmultoperator op,reg r1,type t)
        means[ PUSH(mainSTACK,(ref t)op( (longint)POP(mainSTACK),(longint)^(r1)))]
    	assembles[op '  DWORD PTRMACRO[esp] ,' r1];
instruction pattern RPUSH32when64(int32reg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['movsx r11, '  r'\n push r11;# RPUSH32when64'];
instruction pattern RPUSH(dpushreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['push '  r];
instruction pattern RPUSHE(ureg r, integer64 t)
	means[PUSH(mainSTACK,(t)EXTEND(^(r)))]
	assembles[' push dword 0 ; extend 'r' to 64'
                  '\n push '  r];
instruction pattern POPEADXu(type t,eadxu r)
	means[r:=(uint64)POP(mainSTACK)]
	assembles['pop eax\n pop edx'];
instruction pattern STOREAXDu(eadxu r,destreg d)
	means[(ref uint64)mem(^(d)):=^(r)]
	assembles['mov eax,['d']\n mov edx,['d'+4]'];
pattern eadxi means[EADX];
instruction pattern LOADEADX(eadxi r,destreg d)
	means[r:=^((ref doubleword)mem(^(d)))]
	assembles['mov ['d'],eax\n mov ['d'+4],edx'];
instruction pattern RPOP(dpushreg r,type t)
	means[(ref t)r:=(t)POP(mainSTACK)]
	assembles['pop  '  r];
instruction pattern RPOP3264(int32reg r )
	means[ r:=(int32)POP(mainSTACK)]
	assembles['mov  '  r',dword PTRMACRO [rsp]\n add rsp,8;#RPOP3264'];
instruction pattern BPUSH(bureg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['push dword 0\n mov BYTE[esp],'r];
instruction pattern BSPUSH(breg r)
	means[PUSH(mainSTACK,(int8)^(r))]
	assembles['push esi\n movsx esi,  'r'\n xchg esi,[esp]'];
instruction pattern BSPOP(bireg r)
	means[r:=(octet)POP(mainSTACK)]
	assembles['mov  '  r',BYTE[esp]\n add esp,4'];
instruction pattern BPOP(bureg r)
	means[r:=(octet)POP(mainSTACK)]
	assembles['mov  '  r',BYTE[esp]\n add esp,4'];
instruction pattern REFPOP32(addrmode r,type t,type t2)
	means[(ref ref t)r:=(ref t2)POP(mainSTACK)]
	assembles['pop DWORD '  r];
instruction pattern REFPOP64(addrmode r,type t,type t2)
	means[(ref ref t)r:=(ref t2)POP(mainSTACK)]
	assembles['pop r11\n mov QWORD   '  r',r11'];

instruction pattern REFPOP232(addrmode r,type t)
	means[(ref ref t)r:=( word)POP(mainSTACK)]
	assembles['pop dword '  r];
instruction pattern REFPOP264(addrmode r,type t)
	means[(ref ref t)r:=( doubleword)POP(mainSTACK)]
	assembles['pop r11\n mov QWORD   '  r',r11'];
instruction pattern REFPOP364(addrmode r,type t)
	means[(ref int64)r:=(ref t)POP(mainSTACK)]
	assembles['pop r11\n mov QWORD   '  r',r11'];
instruction pattern SDEREFDOUBLEw(int t)
	means[PUSH(mainSTACK,(doubleword)^(mem((word)POP(mainSTACK))))]
	assembles['xchg esi,[esp]\n push dword [esi]\n mov esi, [4+esi]  \n  xchg esi,[4+esp]'];

instruction pattern WPOP(addrmode r,type t)
	means[(ref ref t)r:=(word)POP(mainSTACK)]
	assembles['pop DWORD '  r];
instruction pattern MEMPOP(memrisc m)
	means[(ref int32)m:=(int32)POP(mainSTACK)]
	assembles['pop DWORD 'm];
instruction pattern LITPUSH(offset s, int t)
	means[PUSH(mainSTACK,(t) s)]
	assembles['push DWORD '  s];
instruction pattern MEMPUSH(maddrmode m)
	means[PUSH(mainSTACK,(word)^( m))]
	assembles['push DWORD ' m];
instruction pattern DMEMPUSH(eaform ea)
	means[PUSH(mainSTACK,(doubleword)^((ref doubleword)mem(ea)))]
	assembles[ 'push DWORD PTRMACRO['ea'+4]\n push DWORD PTRMACRO['ea']'];
instruction pattern DMEMPUSH64(eaform ea)
	means[PUSH(mainSTACK,(doubleword)^((ref doubleword)mem(ea)))]
	assembles[ 'push QWORD PTRMACRO['ea']'];
instruction pattern STACKLOAD(word32 t)
	means[PUSH(mainSTACK,^((ref t)mem((int32)POP(mainSTACK))))]
	assembles['xchg DWORD PTRMACRO[esp],eax\n  mov eax,DWORD PTRMACRO[eax]\n  xchg DWORD PTRMACRO[esp],eax'];
instruction pattern REFPUSH(maddrmode m,type t)
	means[PUSH(mainSTACK,(ref t)^(m))]
	assembles['push DWORD ' m];
instruction pattern SDEREF(int t)
 means[PUSH(mainSTACK,(t)^(mem((int32)POP(mainSTACK))))]
 assembles['xchg esi,[esp]\n mov esi,dword[esi]\n  xchg esi,[esp]'];
instruction pattern SDEREFDOUBLEWORD(int t)
 means[PUSH(mainSTACK,(doubleword)^(mem((int32)POP(mainSTACK))))]
 assembles['xchg esi,[esp]\n push dword[esi]\n mov esi,dword[esi+4]\n  xchg esi,[esp+4]'];

/* \end{verbatim}
\subsubsection{Data movement  to and from registers }
\begin{verbatim}
*/
instruction pattern SELECT(reg r1,reg r2,addrmode r3,wordupto32 t)
	means[(ref t) r1:=OR(AND((t)^(r1),(t)^(r2)),AND((t)^(r3),NOT(^(r2))))]
	assembles[
		'and 'r1      ','     		r2         '\n'
                'not 'r2                         '\n'
		'and 'r2      ','   t ' ' 	r3         '\n'
		'or 'r1       ','     		r2];
instruction  pattern LOAD(maddrmode rm, anyreg r1, integer64 t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov ' r1 ',' t ' ' rm ';#LOAD'];
instruction  pattern LOAD32(maddrmode rm, int32reg r1, word32 t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov ' r1 ',' t ' ' rm ';#LOAD32'];
pattern justsp means[stackp];
	instruction  pattern GENMOVSP(justsp rm, anyreg r1, wordupto64 t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov ' r1 ',' t ' ' rm ';#Genmov'];
instruction  pattern LOADW(maddrmode rm, wreg r1, word16 t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov ' r1 ',' t ' ' rm';#LOADW'];
instruction  pattern LOADB(maddrmode rm, breg r1)
        means[  r1:= (octet)^(rm )]
	assembles['mov ' r1 ','  'byte ' rm';#LOADB'];
instruction pattern MOVZXB0(reg r1, breg rm)
	means[  r1:=EXTEND( (uint8)^( rm) )]
	assembles['movzx ' r1 ',  'rm];
instruction pattern MOVZXB2(reg r1, maddrmode rm)
	means[  r1:=EXTEND( (uint8)^( rm) )]
	assembles['movzx ' r1 ', byte   'rm];
instruction pattern MOVZW(reg r1, maddrmode rm)
	means[  r1:=EXTEND( (uint16)^( rm) )]
	assembles['movzx ' r1 ', word   'rm';#MOVZW'];
define(MOVZXB,MOVZXB2|MOVZXB0)
instruction pattern MOVSXBm(reg r1,maddrmode rm)
	means[r1:=(int32)EXTEND( (int8)^( rm) )]
	assembles['movsx 'r1',BYTE   'rm];
instruction pattern MOVSXBr(reg r1,breg rm)
	means[r1:=(int32)EXTEND( (int8)^( rm) )]
	assembles['movsx 'r1',   'rm';#MOVSXBr'];
define(MOVSXB,MOVSXBm|MOVSXBr)
instruction pattern MOVZXBW(uwreg r1, breg rm)
	means[  r1:= EXTEND((uint8)^(rm))]
	assembles['movzx ' r1 ',    'rm';#MOVZXBW'];
instruction pattern MOVSXBW(swreg r1,breg rm)
	means[  r1:= EXTEND(^(rm))]
	assembles['movsx ' r1 ',   'rm';#MOVSXBW'];
 
instruction pattern MOVSXW(reg r1, maddrmode rm)
	means[  r1:=(int32)EXTEND(^(rm))]
	assembles['movsx ' r1 ', word    'rm';#MOVSXW'];
 
	pattern wordorbytereg means[breg|wreg];
	pattern uptot32reg means[int32reg|wordorbytereg];
instruction pattern MOVSXRR(reg r1, uptot32reg rm)
	means[  r1:=(ifdef(`bit64',int64,int32))EXTEND(^(rm))]
	assembles['movsx ' r1 ',     'rm';#MOVSXRR'];
	 
instruction pattern MOVSXRR32(int32reg r1, wordorbytereg rm)
	means[  r1:=(int32)EXTEND(^(rm))]
	assembles['movsx ' r1 ',     'rm';#MOVSXRR32'];
instruction pattern MOVSX64(indexreg r1, maddrmode rm)
	means [ r1:= (int64) EXTEND((int32)^(rm))]
	assembles['movsx ' r1 ',  dword  'rm';#MOVSX64'];
instruction pattern Tob(reg r, breg b)
	means[b:= (octet) ^( r)]
        assembles['push ' r '\nmov 'b', [esp] '  '\n add esp ,4' ];



instruction pattern MOVSBW(wreg r1, breg rm)
	means[  r1:=(int16)EXTEND(^(rm))]
	assembles['movsx ' r1 ',   'rm];
instruction pattern MOVZBW(wreg r1, bureg rm)
	means[  r1:=(int16)EXTEND(^(rm))]
	assembles['movzx ' r1 ',   'rm];


instruction pattern ToBYTE(reg r, breg b)
	means[b:= (octet) ^( r)]
        assembles['push ' r '\nmov ' b ',BYTE[esp]\nadd esp,4 ' ];


instruction pattern STOREBRr(breg rm, breg r1)
        means[  (ref octet ) rm:= ^(r1) ]
	assembles['mov 'rm',' r1';# STOREBRr'];
instruction pattern STOREBRm(memrisc rm, breg r1)
        means[  (ref octet ) rm:= ^(r1) ]
	assembles['mov BYTE 'rm',' r1';# STOREBRm'];
define(STOREBR,STOREBRm )

instruction pattern STORER(memrisc rm, int32reg r1, integer32 t)
        means[  (ref t) rm:=(t)^( r1) ]
	assembles['mov ' t ' 'rm',' r1';#STORER'];
instruction pattern STOREQR(memrisc rm, anyreg r1, integer64 t)
        means[  (ref t) rm:=(t)^( r1) ]
	assembles['mov ' t ' 'rm',' r1';#STORER'];
 instruction pattern STOREWR(memrisc rm, wreg r1, word16 t)
        means[  (ref t) rm:= ^( r1) ]
	assembles['mov ' t ' 'rm',' r1';#STOREWR'];
instruction  pattern NULMOV(anyreg r3, type t)
	means[(ref t)r3:=^((ref t)r3)]
        assembles[';#nulmov ' r3  r3];
instruction  pattern NONNULMOV(anyreg r3, anyreg r4, type t)
	means[(ref t)r3:=(t)^( r4)]
        assembles['mov ' r3 ',' r4';#NONNULLMOV'];
instruction  pattern STORELIT(maddrmode rm,  intupto32 t, int s)
        means[ (ref t) rm:= (t)const s  ]
	assembles['mov ' t '  'rm ','  ' ' s];
instruction  pattern LOADLIT(anyreg rm,  type t, int s) 
        means[ (ref t) rm:= (t)const s  ]
	assembles['mov '  ' 'rm ','  ' ' s';#LOADLIT'];
instruction  pattern CLEARREG(reg rm,  type t, int s)
        means[ (ref t) rm:= (t)0  ]
	assembles['xor '  rm ','  rm];
/*
\end{verbatim}
\subsubsection{Register to register arithmetic }
\begin{verbatim}
*/
instruction  pattern RLIT0(nonmultoperator op,anyreg rm,  type t, int sm)
        means[  (ref t) rm:= op(^(rm),(t) const sm)  ]
	assembles[op '  '    rm ',' sm';#RLIT0'];
pattern memint means[ifdef(`bit64', wordupto64 ,wordupto32)];
instruction  pattern MLIT(nonmultoperator op,memrisc rm,  memint t, offset sm)
        means[  (ref t) rm:= op(^(rm),(t) sm)  ]
	assembles[op '  ' t ' ' rm ',' sm];
instruction  pattern INCm(maddrmode rm,memint t)
	means[(ref t)rm:=   + (^(rm),1)]
	assembles['inc ' t '  ' rm];
instruction  pattern INCr(anyreg rm,int t)
	means[(ref t)rm:=   + (^(rm),1)]
	assembles['inc '  '  ' rm];
define(INC,INCm|INCr)
instruction  pattern DECr(anyreg rm,int t)
	means[(ref t)rm:=   - ((t)^(rm),1)]
	assembles['dec '  ' ' rm];
	instruction  pattern DECrl(anyreg rm,int t)
	means[(ref t)rm:=   + ((t)^(rm),-1)]
	assembles['dec '  ' ' rm];
instruction  pattern DECm(maddrmode rm,int t)
	means[(ref t)rm:=   - ((t)^(rm),1)]
	assembles['dec ' t ' ' rm];
define(DEC, DECm|DECr|DECrl)
instruction  pattern SHIFT(shiftop op, shiftcount s, noncountreg r,type t)
	means[(ref t) r:= op(^(r),s)]
	assembles['sa' op' ' r ', 's';#SHIFT'];
instruction  pattern GENSHIFT(shiftop op, breg s, noncountreg r,type t)
	means[(ref t) r:= op(^(r),s)]
	assembles['xchg cl,'s'\n sh' op' ' r ', cl\n xchg cl,'s';#GENSHIFT'];
instruction  pattern RMR( nonmultoperator op,memrisc rm,anyreg r1,wordupto32 t)
        means[ (ref t) rm :=op( ^((ref t) rm),(t)^( r1))]
    	assembles[op '  ' t   '  ' rm ',' r1';#RMR'];

instruction  pattern RMRcomm( nonmultcomop op,memrisc rm,anyreg r1,wordupto32 t)
        means[ (ref t) rm :=op((t) ^( r1),^((ref t)rm))]
    	assembles[op '  ' t   '  ' rm ',' r1';#RMR'];
instruction pattern RMRAdd(maddrmode rm, anyreg r1, wordupto32 t)
 		means[ (ref t) rm :=+( ^( (ref t)rm),(t)^( r1))]
    	assembles['add '     t' ' rm','  ' ' r1';#RMRadd'];
instruction  pattern ADDRMR( nonmultoperator op,memrisc rm,anyreg r1,wordupto32 t)
        means[ (ref t) rm :=+((t) ^( rm),(t)^( r1))]
    	assembles[ 'add  '  t  '  ' rm ',' r1';#ADDRMR'];
    	
pattern bmem means[memrisc|breg];
instruction  pattern RMRB( nonmultoperator op,bmem rm,breg r1,byte t)
        means[ (ref t) rm :=op((t) ^( rm),(t)^( r1))]
    	assembles[op '  '    ' ' rm ',' r1';#RMRB'];

instruction pattern nulbass(breg r1,byte t)
	means[(ref t)r1:=(t)^(r1)]
	assembles['; nulbas'];
instruction pattern ADDUSB(addrmode fm,breg r1,breg rm)
	means[ rm:= +:((uint8)^(rm),^(r1))]
	assembles[ 'add  ' rm ',' r1 '\n jnc $+4\n mov ' rm',255\n nop\n nop'];
instruction pattern SUBUSB(breg r1,breg rm)
	means[ rm:= -:((uint8)^(rm),^(r1))]
	assembles[ 'sub  ' rm ',' r1 '\n jnc $+4\n mov ' rm',0\n nop\n nop'];
instruction pattern ADDSSB(breg r1,breg rm)
	means[ rm:=(int8) +:((int8)^(rm),^(r1))]
	assembles[ 'add  ' rm ',' r1 '\n jno $+10\n jg $+6\n mov 'rm' ,-128 \n jng $+4\n mov ' rm',127\n '];
instruction pattern MULTSSB(breg r1,bnonacc r2)
	means[r2:=*:(^(r2),^(r1))]
	assembles['push ax\n mov al,'r1'\n imul  'r2'\n shr ax,7\n mov 'r2',al\n pop ax'];

instruction pattern MULTSSBAL(bacc r1,bnonacc r2)
	means[r1:=*:(^(r1),^(r2))]
	assembles['imul  'r2'\n shr ax,7'];

instruction pattern SUBSSB( breg r1,breg rm)
	means[ rm:= (int8)-:((int8)^(rm),^(r1))]
	assembles[ 'sub  ' rm ',' r1 '\n jno $+10\n jg $+6\n mov 'rm' ,-128 \n jng $+4\n mov ' rm',127\n nop\n nop'];
instruction pattern UINT8MAX(breg r1,breg r2)
        means[ (ref uint8)r1:=MAX((uint8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n ja $+4\n mov 'r1','r2'\n nop\n nop'];
instruction pattern INTMAX(int32reg r1,int32reg r2)
        means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n jl $+4\n mov 'r1','r2'\n nop \n nop;#INTMAX'];
instruction pattern INTMIN(int32reg r1,int32reg r2)
  	means[ r1:=MIN(^(r1),^(r2))]

	assembles['cmp 'r1','r2'\n jl $+4\n mov 'r1','r2';#INTMIN '];
 instruction pattern INT16MAX(wreg r1,wreg r2)
        means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jl $+4\n mov 'r1','r2'\n nop \n nop'];

instruction pattern INTABS(reg r1)
        means[ r1:=ABS(^(r1))]
	assembles['sub '  r1  ',0'      '\n jns $+4\n neg 'r1'\n nop \n nop'];
	 
instruction pattern GENABS(signedreg r1)
	means[ r1:=ABS(^(r1))]
	assembles['genabs 'r1];
instruction pattern UINT8MIN(breg r1,breg r2)
        means[ (ref uint8)r1:=MIN((uint8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jna $+4\n mov 'r1','r2'\n nop \n nop'];
instruction pattern INT8MAX(breg r1,breg r2)
        means[ (ref int8)r1:=MAX((int8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jg $+4\n mov 'r1','r2'\n nop \n nop'];
instruction pattern INT8MIN(breg r1,breg r2)
        means[ (ref int8)r1:=MIN((int8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jl $+4\n mov 'r1','r2'\n nop \n nop'];
instruction pattern LEA(reg r1, leaform ea)
	means [r1:=ea]
        assembles ['lea ' r1 ',[' ea ']' ];
instruction pattern MNOTOP(maddrmode rm, int t)
	means[(ref t)rm:= NOT((t)^(rm))]
	assembles['not 't ' ' rm];
instruction pattern NOTOP(anyreg rm, int t)
	means[(ref t)rm:= NOT((t)^(rm))]
	assembles['not ' ' ' rm];
instruction pattern dNOTOP(anyreg rm,anyreg r2, int t)
	means[(ref t)rm:= NOT((t)^(r2))]
	assembles[' mov 'rm',' r2 '\n not ' ' ' rm];
instruction pattern Negate(anyreg r1,type t)
	means[(ref t)r1:= -((t)0,( t)^(r1))]
	assembles ['neg ' ' '  r1];
instruction pattern MNegate(anyreg r1,type t)
	means[(ref t)r1:= *((t)-1,( t)^(r1))]
	assembles ['neg '  ' '  r1];
instruction  pattern RLIT(operator op,pushreg r0,  type t, signed sm)
        means[r0:=  op(^( r0), const sm)  ]
	assembles[op '  '  r0 ',' sm';#RLIT'];
instruction pattern RRint32( operator op, int32reg r1, int32reg r2)
        means[r1:=(int32) op((int32) ^(  r1),(int32)   ^(r2) )]
	assembles[op ' ' r1 ',' r2';#RRint32'];
instruction pattern RRD( operator op, indexreg r1, indexreg r2)
        means[r1:= (int32)op( ^(  r1),^(  r2))]
	assembles[op ' ' r1 ',' r2';#RRD'];
instruction pattern RR( nonmultoperator op, anyreg r1, anyreg r2, int t)
        means[(ref t)r1:=(t) op((t) ^( (ref t) r1),(t)  ^(r2) )]
	assembles[op ' ' r1 ',' r2';#RR'];
instruction pattern RRPLUS(  anyreg r1, maddrmode r2, int t)
        means[r1:=(t) +((t) ^( (ref t) r2),(t)^( (ref t) r1))]
	assembles['add ' r1 ',' r2];

instruction  pattern RRM(nonmultoperator op, anyreg r1, maddrmode rm, int t)
        means [r1:=(t) op((t) ^(r1),(t)^( rm))]
        assembles[op ' ' r1 ','t' '  rm ';# RRM'] ;
instruction  pattern RRRM(nonmultoperator op, anyreg r1,anyreg r2, maddrmode rm, int t)
        means [r1:=(t) op((t) ^(r2),(t)^( rm))]
        assembles[op ' ' r2 ','t' '  rm ';# RRM'
        '\n mov 'r1','r2] ;
pattern bnonacreg means[ifdef(`bit64',DL|BL|CL|R8B|R9B|R10B,DH|DL|BH|BL|CH|CL)];
pattern baccreg means[AL];
pattern baccregmode means[maddrmode|baccreg];
pattern bnonacregmode means[maddrmode|bnonacreg];
instruction pattern fastBIDIV(baccreg r1,bnonacregmode r2)
        means[r1:=div((int8)^(r1),(int8)^(r2))]
	assembles[' movsx ax,'r1'\n idiv  'r2 ];
instruction pattern BIDIV(baccreg r1, bnonacregmode r2,baccregmode r3)
        means[r3:=div((int8)^(r1),(int8)^(r2))]
	assembles[' movsx ax,'r1'\n idiv  'r2'\n mov  'r3',al'];
instruction pattern BUDIV(buacc r1, bnonacregmode r2,bnonacregmode r3)
        means[r3:=div((uint8)^(r1),(uint8)^(r2))]
	assembles[' movzx ax,'r1'\n idiv  'r2'\n mov  'r3',al'];
instruction pattern BIMUL(baccreg r1, bnonacreg r2)
        means[r2:=*((int8)^(r1),(int8)^(r2))]
	assembles['imul  'r2'\n mov  'r2',al'];
instruction pattern fastIMUL(acc a,dacc d)
	means[(ref int32)a:=*((int32)^(a),^(d))]
	assembles['imul edx'];
instruction pattern IMUL(int32reg r1, int32reg r2)
	means[r1:=*(^(r1),^(r2))]
	assembles['imul 'r1','r2];
instruction pattern IMUL64(indexreg r1, indexreg r2)
	means[r1:=*(^(r1),^(r2))]
	assembles['imul 'r1','r2];
instruction pattern CDQ(qacc r1,acc r2)
	means[r1:=EXTEND(^(r2))]
	assembles['cdq'];
instruction pattern IDIV(acc r1, qacc r2, nonacc r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['idiv 'r3 ';# IDIV'];
	
instruction pattern IDIVsimple(acc r1,   nonacc r3)
	means[r1:=div(^(r1),^(r3))]
	assembles['cdq\n idiv 'r3 ';# IDIV']
	precondition[FREE(EDX)];
/*
instruction pattern RIDIV32(nonacc r1, acc r2, nonacc r3)
	means[r1:=div(^(r1),^(r3))]
	assembles['xchg eax,'r1'\n cdq\n idiv 'r3'\n xchg 'r1',eax'];
	*/
instruction pattern RIDIV64(int64reg r1, qacc r2, int64reg r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['idiv 'r3'\n mov 'r1',rax'];

instruction pattern IDIVstack64(nonaccreg r2)

    means[PUSH(mainSTACK,(int64)div((int64)POP(mainSTACK),(int64)^(r2))) ]
	assembles[' xchg rax,[rsp]\n push rdx\n'
              ' cqo\n'
              ' idiv   'r2'\n'
              ' pop rdx\n'
              ' xchg rax,[rsp]\n\n '];
instruction pattern IDIVstack32(nonaccreg r2)
   	means[PUSH(mainSTACK,(int32)div((int32)POP(mainSTACK),(int32)^(r2))) ]
	assembles[' xchg eax,[esp]\n push edx\n'
              ' cdq\n'
              ' idiv   'r2'\n'
              ' pop edx\n'
              ' xchg eax,[esp]\n\n '];
instruction pattern IDIVstack32W(nonacc r2)
   	means[PUSH(mainSTACK,(int32)div((int32)POP(mainSTACK),(int32)^(r2))) ]
	assembles[' xchg eax,[rsp]\n push rdx\n'
              ' cdq\n'
              ' idiv   'r2'\n'
              ' pop rdx\n'
              ' xchg eax,[rsp]\n\n '];

instruction pattern IMODstack64(nonaccreg r2)
 	means[PUSH(mainSTACK,(int64)MOD((int64)POP(mainSTACK),(int64)^(r2))) ]
	assembles[' xchg rax,[rsp] ; IMODstack64 \n push rdx\n'
              ' cqo\n'
              ' idiv   'r2'\n'

              ' xchg rax,[rsp+8]\n '
			  ' mov  [rsp+8],rdx\n'
			  ' pop rdx\n' ];
instruction pattern IMODstack32(nonaccreg r2)
   	means[PUSH(mainSTACK,(int32)MOD((int32)POP(mainSTACK),(int32)^(r2))) ]
	assembles[' xchg eax,[esp] ; IMODstack32 \n push edx\n'
              ' cdq\n'
              ' idiv   'r2'\n'

              ' xchg eax,[esp+4]\n '
			  ' mov  [esp+4],edx\n'
			  ' pop edx\n' ];

instruction pattern RUWDIV(uwreg r1, wreg r2)
	means[r1:=div(^(r1),^(r2))]
	assembles[';RUWDIV\n push eax\n push edx \n push ecx\n movzx eax,'r1'\n movzx ecx,'r2'\n cdq\n idiv   ecx\npop ecx\n pop edx\n mov 'r1',ax \n pop eax'];
instruction pattern SIDIV(nonacc r1,nonacc r2)
   	means[r1:=div((int32)^(r1),^( r2)) ]
	assembles['push eax\n push edx\n mov eax,'r1'\n cdq\n idiv   ' r2 '\n pop edx\n mov 'r1',eax \n pop eax'];
instruction pattern UDIV(acc r1,modreg r2)
   	means[PUSH(mainSTACK,div((uint32)^(r1),^( r2))) ]
	assembles['push edx\n xor edx,edx\n div   ' r2 '\n xchg eax,DWORD PTRMACRO[esp]\n xchg eax,edx'];
instruction pattern IMULLIT(pushreg r1,addrmode rm, signed s)
	means[(ref int32)r1:=*(^(rm),const s)]
	assembles['imul 'r1',DWORD 'rm','s];
instruction pattern IMULLITR32(int32reg r1,int32reg rm, signed s)
	means[(ref int32)r1:=*(^(rm),const s)]
	assembles['imul 'r1', 'rm','s];
 pattern moddest means[EDX];
 pattern modsrc means[EAX];
instruction pattern IMODbare(int32reg d, modsrc s, nonacc r)
	means[d:=MOD(^(s),^(r))]
	assembles['cdq\n idiv 'r'\n mov 'd',edx'];
instruction pattern IMOD(acc r1, modreg r2)
    means[PUSH(mainSTACK,(int32)MOD((int32)^(r1),^( r2))) ]
	assembles['push edx; IMOD \n cdq\n idiv   ' r2 '\n xchg edx,DWORD PTRMACRO[esp]'];
instruction pattern UMOD(acc r1, modreg r2)
        means[PUSH(mainSTACK,MOD((uint32)^(r1),^( r2))) ]
	assembles['push edx; UMOD\n xor edx,edx\n div   ' r2 '\n xchg edx,DWORD PTRMACRO[esp]'];
instruction pattern BIMOD(baccreg r1, bnonacreg r2)
        means[r2:=MOD((int8)^(r1),(int8)^(r2))]
	assembles[' movsx ax,'r1' ;BIMOD\n idiv 'r2'\n mov 'r2',ah'];


instruction pattern MODFFFF(wreg r)
	means[r:=MOD(^(r),65535)]
	assembles[' '];
instruction pattern DIV8(ureg r)
	means[r:=div((uint32)^(r),8)]
	assembles['shr 'r ',3'];

instruction pattern MOD16(reg r)
	means[r:=MOD(^(r),16)]
	assembles['and 'r ',15'];
instruction pattern MOD4(reg r)
	means[r:=MOD(^(r),4)]
	assembles['and 'r ',3'];
instruction pattern MOD2(reg r)
	means[r:=MOD(^(r),2)]
	assembles['and 'r ',1'];
instruction pattern BSS(label l, word32 r)
	means[bss(l,r)]
	assembles['SECTION .bss;\nalignb 16;\n'l':resb 'r'\nSECTION .data'];
instruction pattern PLANT(label l)
	means[l]
	assembles['\n' l ':\n'];

instruction pattern PLANTRCONST( double r,type t)
	means[loc (t)r]
	assembles[ 'dq ' r];
instruction pattern gPLANTRCONST( double r,type t)
	means[loc (t)r]
	assembles[ '.double ' r];
instruction pattern PLANTLCONST( integer64 r,type t)
	means[loc (t) r]
	assembles[ifdef(`gas','.quad ',  'dq ')  r];
instruction pattern PLANTICONST( word32 r,type t)
	means[loc (t) r]
	assembles[  'dd '  r];

instruction pattern gPLANTICONST( word32 r,type t)
	means[loc (t) r]
	assembles[ '.long ' r];
instruction pattern PLANTSCONST( float  r,type t)
	means[loc (t) r]
	assembles[ 'dd ' r];
instruction pattern gPLANTSCONST( float  r,type t)
	means[loc (t) r]
	assembles[ '.float ' r];
instruction pattern PLANTBCONST( byte r,type t)
	means[loc (t) r]
	assembles[ 'db ' r];
instruction pattern gPLANTBCONST( byte r,type t)
	means[loc (t) r]
	assembles[ '.byte ' r];
instruction pattern PLANTWCONST( word16 r,type t)
	means[loc (t) r]
	assembles[ 'dw ' r];
instruction pattern gPLANTWCONST( word16 r,type t)
	means[loc (t) r]
	assembles[ '.short ' r];


	/*
\end{verbatim}
\subsubsection{Control transfers and tests }
\begin{verbatim}
*/
instruction pattern FAIL(int i)
	means[interrupt i]
	assembles['int 'i];
instruction pattern GOTO(jumpmode l)
	means[goto l]
	assembles['jmp ' l];
instruction pattern IFLITGOTO(label l,addrmode r1,signed r2,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const r2))goto l]
	assembles[' cmp 't' ' r1 ',  '  r2 '\n j' c ' NEARMACRO  '  l';IFLIT'];

instruction pattern IFULITGOTO(label l,addrmode r1,unsigned r2,unsignedcondition c,unsigned t,int b)
	means[if((b)c((t) ^(r1),(t)const r2))goto l]
	assembles[' cmp 't' ' r1 ',  '  r2 '\n j' c ' NEARMACRO    '  l'IFULIT'];
instruction pattern BIFLITGOTO(label l,baddrmode r1,signed arg2,condition c,signed t)
	means[if(c((t) ^(r1),const arg2))goto l]
	assembles[' cmp 't' ' r1 ',  't  arg2 '\n j' c '  NEARMACRO   '  l';BIFLIT'];
instruction pattern IFGOTOB(label l,bireg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int8) r2))goto l]
	assembles['cmp ' r1 ',byte' '  '  r2 '\n j' c ' NEARMACRO   ' l';IFGOTOB'];
instruction pattern IFGOTOW(label l,wreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int16) r2))goto l]
	assembles['cmp ' r1 ',word' '  '  r2 '\n j' c ' NEARMACRO   ' l';IFGOTOW'];
instruction pattern  	IFGOTO(label l,signedreg r1,regaddrimmediate r2,condition c,signed t )

	means[if((int8)c( (t)^(r1),(t) ^(r2)))goto l]
	assembles['cmp ' r1 ',' t'  '  r2 '\n j' c '  NEARMACRO  ' l';IFGOTO'];
instruction pattern IFGOTOr(label l,signedreg r1,signedreg r2,condition c,signed t )
	means[if((int8)c((t) ^(r1),(t) ^(r2)))goto l]
	assembles['cmp ' r1 ', 't '  '  r2 '\n j' c '  NEARMACRO  ' l';IFGOTOr'];
instruction pattern IFUGOTO(label l,ureg r1,ureg r2,unsignedcondition c,signed t,int b)
	means[if((int8)c( ^(r1),^( r2)))goto l]
	assembles['cmp ' r1 ',dword' '  '  r2 '\n j' c ' NEARMACRO    ' l';IFUGOTO'];

/* versions for gnu assembler without the word near */
instruction pattern gIFLITGOTO(label l,signedreg r1,signed r2,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const r2))goto l]
	assembles[' cmp ' ' ' r1 ',  '  r2 '\n j' c '   '  l];

instruction pattern gIFULITGOTO(label l,reg r1,unsigned r2,unsignedcondition c,unsigned t,int b)
	means[if((b)c((t) ^(r1),(t)const r2))goto l]
	assembles[' cmp ' ' ' r1 ',  '  r2 '\n j' c '    '  l];
instruction pattern gBIFLITGOTO(label l,breg r1,signed arg2,condition c,signed t)
	means[if(c((t) ^(r1),const arg2))goto l]
	assembles[' cmp '  ' ' r1 ',  '  arg2 '\n j' c '    '  l];
instruction pattern gIFGOTOB(label l,bireg r1,breg r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int8) r2))goto l]
	assembles['cmp ' r1 ',' '  '  r2 '\n j' c '   ' l];
instruction pattern gIFGOTOW(label l,wreg r1,wreg  r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int16) r2))goto l]
	assembles['cmp ' r1 ',' '  '  r2 '\n j' c '   ' l];
instruction pattern gIFGOTO(label l,int32reg r1,int32reg  r2,condition c,signed t,int b)
	means[if((int8)c( (int32)^(r1),(int32)^( r2)))goto l]
	assembles['cmp ' r1 ',' '  '  r2 '\n j' c '   ' l';gIFGOTO'];
instruction pattern gIFGOTOl(label l,reg r1,reg  r2,condition c,signed t,int b)
	means[if((int8)c(  ^(r1),^(r2)))goto l]
	assembles['cmp ' r1 ',' '  '  r2 '\n j' c '   ' l];
instruction pattern gIFUGOTO(label l,ureg r1,ureg r2,unsignedcondition c,signed t,int b)
	means[if((int8)c( ^(r1),^( r2)))goto l]
	assembles['cmp ' r1 ',' '  '  r2 '\n j' c '    ' l];
instruction pattern IFASSp6(signedreg r1,regaddrimmediate r2,condition c,type t2,maddrmode r3,maddrmode rm, type t )
	means[if((t2)c( (t)^(r1),(t) r2))(ref t)rm:= (t)^(r3)]
	assembles['cmp ' r1 ','t '  '  r2
		'\n mov 'r1','t rm
		'\n cmov'c' 'r1','r3'\n mov 't rm ',' r1];
instruction pattern IFASS(signedreg r1,acc r2,maddrmode rm, type t,equals c,type t2 )
	means[if((t2)c( (t)^(rm),(t) r2))(ref t)rm:= (t)^(r1)]
	assembles['cmpxchg ' t rm ',' '  '  r1 ];
 instruction pattern SETLIT(condition c,reg r1,offset   rm, breg r,signed t,byte b)
	means[r:=(b) c( ^(r1),(t) rm)]
	assembles['cmp 'r1 ',' ' ' rm '\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SET(condition c,indexreg r1,indexreg   rm, breg r,signed t,byte b)
	means[r:=(b) c((t)^(r1),(t) rm)]
	assembles['cmp 'r1 ',' ' ' rm ';#SET\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETU(unsignedcondition c,ureg r1,ureg rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmp 'r1 ',' ' ' rm ';#SETU\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETW(condition c,wreg r1,wreg   rm, breg r,signed t,byte b)
	means[r:=(b) c((int16)^(r1),(int16) rm)]
	assembles['cmp 'r1 ',' ' ' rm ';#SETW\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETUW(unsignedcondition c,uwreg r1,uwreg rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(uint16) rm)]
	assembles['cmp 'r1 ',' ' ' rm ';#SETUW\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETB(condition c,bireg r1,bireg   rm, breg r,signed t,byte b)
	means[r:=(b) c((t)^(r1),(t) ^(rm))]
	assembles['cmp 'r1 ',' ' ' rm ';#SETB\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETUB(unsignedcondition c,unsignedreg r1,unsignedreg rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(uint8) ^(rm))]
	assembles['cmp 'r1 ',' ' ' rm ';#SETUB\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETeq(eqcondition c,reg r1,reg  rm, breg r,oplen t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmp 'r1 ',' ' ' rm '\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern IFBOOL(label l,breg r1)
	means[ if( ^(r1))goto l]
	assembles['and ' r1 ',' r1 '\n jnz NEARMACRO  ' l'; IFBOOL'];
instruction pattern BOUNDC(reg r1,int lwb,int upb)
	means[if(OR(<( ^(r1), const lwb), >( ^(r1), const upb)) )interrupt 5]
 	assembles['boundc ' r1 ','lwb','upb];

instruction pattern BOUND0(reg r1,reg r2)
	means[if(OR(<( ^(r2), ^((ref int32)mem(  ^(r1) ))), >( ^(r2), ^((ref int32)mem(+(^(r1), 4))))) )interrupt 5]
 	assembles['bound ' r2 ',[' r1 ']'];
instruction pattern BOUND4(reg r1,reg r2)
	means[if(OR(<( ^(r2),^((ref int32)mem(+(^(r1),4)))),>(^(r2),^((ref int32)mem(+(^(r1), 8))))))interrupt 5]
 	assembles['bound ' r2 ',[' r1 '+4]'];
instruction pattern BOUND16(reg r1,reg r2)
	means[if(OR(<( ^(r2),^((ref int32)mem(+(^(r1),16)))),>(^(r2),^((ref int32)mem(+(^(r1), 20))))))interrupt 5]
 	assembles['bound ' r2 ',[' r1 '+16]'];
instruction pattern IFIN(reg r1,reg r2, label l)
	means[ if((int8)AND((uint8)^(mem(r1 )) , <<( (uint8)1,^(r2))))goto l]
	assembles['bt  [' r1 '],' r2 '\n jc 'l];

instruction pattern TESTIN(reg r1,reg r2, breg r,type t)
	means[ r:=<>(AND((t)^(mem(r1 )) , (t)<<( 1,^(r2))),0)]
	assembles['bt  [' r1 '],' r2 '\n setc 'r'\n not 'r'\n inc 'r];
instruction pattern TESTINR(anyreg r1,reg r2, breg r,type t)
	means[ r:=<>(AND((t)^(r1 ) , (t)<<( 1,^(r2))),0)]
	assembles['bt  ' r1 ',' r2 '\n setc 'r'\n not 'r'\n inc 'r];
instruction pattern BTS(reg r1,reg r2)
	means[(ref uint8)mem(^(r1 )):=OR((uint8)^((ref uint8)mem(^(r1) ) ), <<( (uint8)1,^(r2)))]
	assembles['bts [' r1 '],' r2];
instruction pattern BTR(ireg r1,reg r2)
	means[r1:=AND(XOR( <<(  1,^(r2)),-1),^(r1)  )]
	assembles['btr ' r1 ',' r2];
instruction pattern REPMOVSD(countreg s,maddrmode m1,sourcereg si, destreg di)
	means[for (ref int32)m1:=0 to ^(s) step 1 do
              (ref int32)mem(+(^(di),*(^((ref int32)m1),4))):=^((ref int32)mem(+(^(si),*(^((ref int32)m1),4))))
	]
	assembles[' inc ecx\n cmp ecx,0\n jle $+4\n rep movsd\n nop\n nop'];
instruction pattern REPMOVSw(countreg s,maddrmode m1,sourcereg si, destreg di,word16 t)
	means[for (ref int32)m1:=0 to ^(s) step 1 do
              (ref t)mem(+(^(di),*(^((ref int32)m1),2))):=^((ref t)mem(+(^(si),*(^((ref int32)m1),2))))
	]
	assembles[' inc ecx\n cmp ecx,0\n jle $+4\n rep movsw\n nop\n nop'];
instruction pattern REPMOVSB(countreg s,maddrmode m1,sourcereg si, destreg di)
	means[for (ref int32)m1:=0 to ^(s) step 1 do
              (ref octet)mem(+(^(di),^((ref int32)m1))):=^((ref octet)mem(+(^(si),^((ref int32)m1))))
	]
	assembles[' inc ecx\n cmp ecx,0\n jle $+4\n rep movsb\n nop\n nop \n  nop'];

instruction pattern INTMAXb(int32reg r1,int32reg r2)
	means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n cmovl 'r1','r2];

instruction pattern INT16MIN(wreg r1,wreg r2)
  	means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n  cmovg 'r1','r2];





define(IFcodes,
    IFLITGOTO
	|BIFLITGOTO
	|IFIN
	|IFGOTO
/*	|IFGOTOr*/
	|IFGOTOB
	|IFGOTOW
	 )
define(gIFcodes,

   gIFLITGOTO
	|gBIFLITGOTO
	|IFIN
	|gIFGOTO

	|gIFGOTOl
	|gIFGOTOB
	|gIFGOTOW
	 )
define(IA32codes,
      ifdef(`gas',gIFcodes,IFcodes)


	ifdef(`bit64',|MOVSX64)
	|LOADB
	|LOADW
	|LOAD32
	|LOAD
	|MOVZXB
	|MOVZW
	|MOVZXB2
	|MOVZBW
	|MOVZXBW
	|MOVSXB 
	|MOVSBW
	|MOVSXW
	|MOVSXBW
	|MOVSXRR32
	|MOVSXRR
	|CLEARREG
	|LOADLIT
	|STORELIT
	|GENMOVSP
	
		 
	|LEA
	|INC
	|DEC
	|MLIT
	|IMULLIT
	
	|IMULLITR32
	|RLIT
	
	|BTS
	
	|STOREBR
	|BTR
	|RMR|RMRcomm
	|BIMUL

	|IMUL
	|fastIMUL

	|RLIT0
	|RRM
	|RRRM
	|RMRB
	|RMR
	|RMRAdd
	|STORER
	|RRint32
	|RR
	
	|IDIVsimple
	|IDIV
	 
	 
	|fastBIDIV
	|BIDIV
	|UDIV
	| GENABS
	 |INTABS
	ifdef(`bit64',|IDIVstack64|IDIVstack32W,|IDIVstack32)
	|IMODbare
	ifdef(`bit64',|IMODstack64|IMUL64,|IMODstack32|IMOD	|UMOD)
	|CDQ
	|Negate
	|MNOTOP
	|NOTOP
/*	|dNOTOP*/
	|MNegate
	|TESTIN
	|TESTINR
	|SHIFT|GENSHIFT
	|UINT8MAX
	|UINT8MIN
	|INT8MAX
	|INT8MIN
	|SELECT
	|BSS
	|PLANT
	|SETB
	|SETUB
	|SETW
	|SETUW
	|SET
	|SETU
	|GOTO
	|FAIL
	|BOUND4
	|BOUND0
	|BOUND16
                 /* Note !! the order below is important you must try and match
                         a 32 bit const before a 16 before an 8
                        Otherwise you will plant a word where you want to plant
                        a doubleword if the constant turns out to be small enough
                        etc
		*/
    |PLANTLCONST
    ifdef(`gas',
	|gPLANTICONST
	|gPLANTWCONST
	|gPLANTBCONST
	|gPLANTRCONST
	|gPLANTSCONST,
	|PLANTICONST
	|PLANTWCONST
	|PLANTBCONST
	|PLANTRCONST
	|PLANTSCONST)

	|REPMOVSD
	|REPMOVSB
	|REPMOVSw
	|ADDUSB
	|SUBUSB
	|ADDSSB
	|SUBSSB
	|MULTSSB
	|MULTSSBAL
	|STOREWR
	|STORER
	
	|RPUSH

	|REFPUSH
	 )


/* these come last as they are a fallback for having no free registers */
define(lastIA32codes,
	SDEREF
	|SDEREFDOUBLEw/* pushes */
	|IFBOOL
	|ifdef(`bit64',SMLIT64,SMLIT32)
	|SMRP
	|SMULIT
	|SMRADD
	|SMR
	|BSMR
	|STOREWR
	|STORER
	|STOREBR
	| STOREBRr
	ifdef(`bit64',
	|RPUSH32when64

	|DMEMPUSH64
	|REFPOP64
	|REFPOP264
	|SLOP64
	|REFPOP364,
    |STOREQR
	|LITPUSH
	|MEMPUSH
	|BSPUSH
	|DMEMPUSH
	|RPUSHE
	|BPUSH
	|SLOP
	|SADD
	|SOP
	|REFPOP32
	|REFPOP232
	|MEMPOP
	|BPOP
	|BSPOP)
	ifdef(`bit64',/*|STACKSTORE64 */,
	|STACKSTORE32
	|STACKWSTORE
	|STACKBSTORE)
	|Tob
	ifdef(`bit64',|RPOP3264)
	 
	|RPOP
	|SMRSHIFT)

 



/* \end{verbatim} */

