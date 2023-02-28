
/*



Basic ia32 processor description in ilcg

GAS syntax version

 copyright(c) Paul Cockshott, University of Glasgow
 Feb 2000


\subsection{Declare types to correspond to internal ilcg types }
\begin{verbatim}
*/

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

/* \end{verbatim}
\subsection{compiler configuration flags }
\begin{verbatim}
*/
flag realLitSupported = 0;
/* \end{verbatim}
\subsection{Register declarations}

\begin{verbatim}
*/
register int64 EADX assembles ['%eadx'];
alias register int32 EAX= EADX (0:31) assembles ['%eax'] ;
alias register int32 EDX= EADX (32:63) assembles ['%edx'] ;

register int32 ECX assembles['%ecx'] ;
register int32 EBX assembles['%ebx'] ;
register int32 EBP assembles['%ebp'] ;
alias register word FP = EBP(0:31) assembles ['%ebp'];
reserved register int32 ESP assembles['%esp'];
alias register int32 SP = ESP(0:31) assembles['%esp'];
register int32 ESI assembles['%esi'] ;
register int32 EDI assembles['%edi'] ;


alias register uint32 uax= EAX (0:31) assembles ['%eax'] ;
alias register uint32 ucx= ECX (0:31) assembles ['%ecx'] ;
alias register uint32 ubx= EBX (0:31) assembles ['%ebx'] ;
alias register uint32 usi= ESI (0:31) assembles ['%esi'] ;
alias register uint32 udi= EDI (0:31) assembles ['%edi'] ;
alias register uint32 udx= EDX (0:31) assembles ['%edx'];

alias register word wax= EAX (0:31) assembles ['%eax'] ;
alias register word wcx= ECX (0:31) assembles ['%ecx'] ;
alias register word wbx= EBX (0:31) assembles ['%ebx'] ;
alias register word wsi= ESI (0:31) assembles ['%esi'] ;
alias register word wdi= EDI (0:31) assembles ['%edi'] ;
alias register word wdx= EDX (0:31) assembles ['%edx'];


/* use these for signed 8 bit values */
 alias register int8 AL = EAX(0:7) assembles['%al'];
 alias register int8 BL = EBX(0:7) assembles['%bl'];
 alias register int8 CL = ECX(0:7) assembles['%cl'];
 alias register int8 DL = EDX(0:7) assembles['%dl'];
/* use these for unsigned 8 bit values */
/* alias register uint8 AH = EAX(8:15) assembles['%ah']; dont use this*/
 alias register uint8 BH = EBX(8:15) assembles['%bh'];
 alias register uint8 CH = ECX(8:15) assembles['%ch'];
 alias register uint8 DH = EDX(8:15) assembles['%dh'];
 alias register uint8 uAL = EAX(0:7) assembles['%al'];
 alias register uint8 uBL = EBX(0:7) assembles['%bl'];
 alias register uint8 uCL = ECX(0:7) assembles['%cl'];
 alias register uint8 uDL = EDX(0:7) assembles['%dl'];

/* use these for untyped 8 bit values */
 alias register octet oAL = EAX(0:7) assembles['%al'];
 alias register octet oBL = EBX(0:7) assembles['%bl'];
 alias register octet oCL = ECX(0:7) assembles['%cl'];
 alias register octet oDL = EDX(0:7) assembles['%dl'];

 alias register int16 AX =EAX(0:15)assembles['%ax'];
 alias register int16 BX =EBX(0:15)assembles['%bx'];

 alias register int16 DX =EDX(0:15)assembles['%dx'];
 alias register int16 CX =ECX(0:15)assembles['%cx'];

 alias register uint16 uAX =EAX(0:15)assembles['%ax'];
 alias register uint16 uBX =EBX(0:15)assembles['%bx'];
  alias register uint16 uSI = ESI(0:15)assembles['%si'];
 alias register uint16 uDI = EDI(0:15)assembles['%di'];

 alias register uint16 uDX =EDX(0:15)assembles['%dx'];
 alias register uint16 uCX =ECX(0:15)assembles['%cx'];
 alias register halfword SI = ESI(0:15)assembles['%si'];
 alias register halfword DI = EDI(0:15)assembles['%di'];

register stack(4096)int32 mainSTACK assembles[ 'mainSTACK'];
                  /* \end{verbatim}
\subsection{Register sets }
There are several intersecting sets of registers defined
for different instructions. Note that the ECX  and CL,CH registers
are named last  in their   lists to increase the chance
that they are free for sepecial instructions that need them.
\begin{verbatim}
*/

pattern indexreg means[EBX|EDI|ESI|EBP|ESP|EAX|ECX|EDX];
pattern nsreg means[EDI|ESI|EBX|EBP|EAX|EDX|ECX];
pattern accumulators means[EAX|EDX|ECX|EBX];
pattern ireg means [  indexreg]  ;
/*pattern ureg means [ ubx|ucx|uax|udi|usi|udx|ESP|EBP ]  ;*/

pattern ureg means [ ubx|udi|usi|udx|ucx|uax ]  ;
pattern untypedreg means[wax|wcx|wsi|wdi|wdx];
pattern reg means [ireg|ureg|untypedreg];
pattern dwreg means [reg];
/* Note that the order of the byte registers is chosen to keep the ah and al regs
   free for instructions that require themspecifically, particularly
conditional expressions on the floating point stack, that return boolean
results in al */
pattern bireg means[ BL|DL|AL|CL];
pattern bureg means[BH|DH|uAL|uBL|uDL|uCL|CH];
pattern boreg means[oBL|oAL|oDL|oCL];
pattern breg means[bireg|bureg|boreg];
pattern swreg means[AX|BX|CX|DX];
pattern uwreg means[uBX|uCX|uDX|uSI|uDI|uAX];
pattern untypedwreg means[SI|DI];

pattern wreg means[swreg|uwreg|untypedwreg];

pattern pushreg means[reg]; /* these are directly pushable */
pattern anyreg means[ breg|wreg|reg];
pattern signedreg means[bireg|swreg|ireg];
pattern unsignedreg means[bureg|uwreg|ureg];
pattern acc means[EAX];
pattern dacc means[EDX];

pattern qacc means[EADX];
pattern wacc means[AX];
pattern bacc means[AL];
pattern bnonacc means[BL|CL|DL|BH|CH];
pattern ebxacc means[EBX];
pattern ebxbacc means[BL];
pattern ecxacc means[ECX];
pattern ecxbacc means[CL];
pattern ecxuacc means[ucx];
pattern modreg means [ECX];
pattern sourcereg means [ESI];
pattern destreg means [EDI];
pattern countreg means [ECX];
pattern shiftcountreg means [ecxbacc|ecxacc|ecxuacc];

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
operation imul means * assembles ['imul'];
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

pattern condition means[ne|ge|le|eq|gt|lt];
pattern unsignedcondition means[ne|ae|be|eq|ab|bel];
pattern operator means[add |sub|imul|and|or|xor];

pattern nonmultoperator means[add|sub|and|or|xor];
pattern saddoperator means[add|imul|and|or|xor];
pattern sloperator means[and|or|xor];
pattern shiftop means [shiftleft|shiftright];

/*

\end{verbatim}
\subsection{Data formats}
Here we define ilcg symbols for the types that
can be used as part of instructions.
\begin{verbatim}
*/
pattern unsigned means[uint32|uint8|uint16];
pattern signed means[  int32| int8 |int16];
pattern int means[   int8 |int16 |int32|uint32|uint8|uint16];
pattern double means[ieee64] ;
pattern float  means[ieee32];
pattern real means [ieee64|float];
pattern byte means[uint8|int8|octet];

pattern word32 means[int32|uint32|word];
pattern word16 means[int16|uint16|halfword];
pattern wordupto32 means[byte|word16|word32];
pattern dataformat means[octet|word];
pattern longint means [int32|uint32];
pattern hiint means[int32|int64|int16];
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
	assembles['$'l];
pattern barelab(label l)
	means[l]
	assembles[l];
pattern constf(signed s)
	means[const s]
	assembles [s];
pattern laborconst means[constf|barelab];
operation addplus means +  assembles['+'];
operation addminus means - assembles['-'];
pattern plusminus means[addplus|addminus];
pattern labelconstf(laborconst l,laborconst s,plusminus op)
	means [op(l,  s)]
	assembles[ l ' 'op' 's];
pattern offseta means[laborconst|labelconstf];
pattern offsetb(offseta l,offseta s,plusminus op)
	means [op(l,  s)]
	assembles[ l  op s];
pattern offset means[offseta|offsetb];
pattern regindirf(reg r)
	means[^(r) ]
	assembles['0(' r ')'];
pattern baseminusoffsetf(reg r, constf s )
	means[-(   ^(r) ,  s)]
	assembles[   '- ' s '('r')'];
pattern baseplusoffsetf(reg r, offset s )
	means[+(   ^(r) ,  s)]
	assembles[   s'('r')' ];
pattern scaledIndexPlusOffsetf(reg r1, scale s, offset offs)
	means[+(*(^(r1),s), offs)]
	assembles[ offs'(,'r1','s ')'];
address pattern basePlusScaledIndexf(reg r1,nsreg r2,scale s)
	means[+(*(^(r2),s),^(r1))]
        assembles[   '0('r1 ',' r2 ','  s ')'   ];
address pattern basePlusScaledIndexPlusOffsetf2(reg r1,nsreg r2,scale s,offset off,longint t)
	means[+( *(^(r2),s)  ,+(^(r1), off))]
        assembles[off '('  r1 ',' r2 ','  s ')'  ];
address pattern basePlusScaledIndexPlusOffsetf(reg r1,nsreg r2,scale s,offset off,longint t)
	means[+(off,+(*(^(r2),s), ^(r1)) ) ]
 	assembles[off '('  r1 ',' r2 ','  s ')'  ];
address pattern basePlusIndexPlusOffsetf(reg r1,nsreg r2,offset off)
	means[+(^(r1),+(^(r2),  off))]
        assembles[  off '('r1 ',' r2 ' ,1)'  ];
address pattern basePlusIndexf(reg r1,nsreg r2)
	means [+(^(r1),^(r2))]
	assembles[  '0('r1 ',' r2',1)'   ];
pattern directf(unsigned s)
	means[const s]
	assembles[  s '(,1)' ];
pattern udirectf(int s)
	means[const s]
	assembles[  s '(,1)' ];

/*\end{verbatim}\subsection{Choice of effective address}
 This contains the useful formats for the load effective address instruction.
The pattern
 regindirf is excluded here as it adds nothing
   we do not have already from mov instructions.

\begin{verbatim}
*/
pattern guncasteaform means[directf
|udirectf|/*	labelf|*/
	labelconstf
	|basePlusScaledIndexPlusOffsetf
	|basePlusScaledIndexPlusOffsetf2
	|scaledIndexPlusOffsetf
	|basePlusScaledIndexf
	|basePlusIndexPlusOffsetf
	|baseplusoffsetf
	|     scaledIndexPlusOffsetf
	|baseminusoffsetf
	|basePlusIndexf
];
pattern uncasteaform means[directf
|udirectf
|labelf
|labelconstf
|scaledIndexPlusOffsetf
|basePlusScaledIndexPlusOffsetf
|basePlusScaledIndexPlusOffsetf2
|scaledIndexPlusOffsetf
|basePlusScaledIndexf
|	baseplusoffsetf
|basePlusIndexPlusOffsetf
|baseminusoffsetf
|basePlusIndexf
];
pattern leaform means[scaledIndexPlusOffsetf
|basePlusIndexPlusOffsetf
	|baseplusoffsetf|basePlusIndexf
|basePlusScaledIndexPlusOffsetf
|basePlusScaledIndexPlusOffsetf2
|basePlusScaledIndexf
|     scaledIndexPlusOffsetf
|baseminusoffsetf 
	|barelab
];
pattern eaform(guncasteaform f,longint t)  /* allow the address expression to be cast to an integer */
	means[(t)f]
	assembles[f];
/*\end{verbatim}
 \subsection{ Formats for all memory addresses}
 \begin{verbatim}*/
pattern addrform means[eaform|regindirf];
pattern riscaddr means[addrform];
/*pattern riscaddr means[directf  |udirectf|labelf|labelconstf|baseplusoffsetf|regindirf];*/

/** \end{verbatim}
define the address patterns used in other instructions

\begin{verbatim}

*/





pattern maddrmode(addrform f)
means[mem(f) ]
assembles[  f  ];
pattern memrisc(riscaddr r)
	means[mem(r)]
	assembles[r];
pattern mriscmode means[memrisc];
pattern immediate(signed s)means [const s] assembles ['$'s];
pattern intimmediate(int s)means [const s] assembles ['$'s];
pattern uimmediate(unsigned s)means[const s] assembles[s];
pattern indirmode(maddrmode m)means[m]assembles ['* ' m];
pattern jumpmode means[barelab|indirmode];
pattern addrmode means[maddrmode|anyreg];

pattern uwaddrmode means[maddrmode|uwreg];
pattern baddrmode means[maddrmode|breg];
pattern waddrmode means[maddrmode|reg];
pattern regshift(shiftcountreg r)means[^(r)] assembles['%cl'];
pattern shiftcount means[immediate|regshift];
pattern regaddrop(addrmode r)means[^(r)] assembles[r];
pattern regaddrimmediate means[intimmediate|maddrmode|regaddrop];

pattern uwregaddrop(uwaddrmode r)means[^(r)]assembles[r];
pattern uwregaddrimmediate means[uimmediate|uwregaddrop];
/* \end{verbatim}

\subsection{Instruction patterns for the  386}
\subsubsection{Stack operations }

\begin{verbatim}
*/
instruction pattern STACKSTORE(reg r1 )
	means[(ref int32)mem((int32)POP(mainSTACK)):=^(r1)]
	assembles['xchgl (%esp),'r1'\n  popl ('r1')\n   '];
instruction pattern STACKWSTORE(wreg r1 )
	means[(ref halfword)mem((int32)POP(mainSTACK)):=^(r1)]
	assembles['xchgl (%esp),%esi\n  movw 'r1',(%esi)' '\n  popl %esi'];
instruction pattern STACKBSTORE(breg r1 )
	means[(ref octet)mem((int32)POP(mainSTACK)):=^(r1)]
	assembles['xchgl (%esp),%esi\n  movb 'r1',(%esi)' '\n  popl %esi'];
instruction  pattern SMLIT( nonmultoperator op,offset s)
        means[ PUSH(mainSTACK,(int32)op( (int32)POP(mainSTACK), s))]
    	assembles[op 'l  $'s',(%esp) ' ];
instruction  pattern SMULIT( nonmultoperator op,offset s)
        means[ PUSH(mainSTACK,(int32)*( (int32)POP(mainSTACK), s))]
    	assembles['xchgl %eax,(%esp)\n imul  $' s',%eax\n xchgl %eax,(%esp)' ];
instruction pattern SADD(saddoperator op)
	means [PUSH(mainSTACK,(longint)+((longint)POP(mainSTACK),(longint)POP(mainSTACK)))]
	assembles['xchgl %eax,(%esp)\n addl %eax, 4(%esp)\n popl %eax'];
instruction pattern SOP(saddoperator op)
	means [PUSH(mainSTACK,(longint)op((longint)POP(mainSTACK),(longint)POP(mainSTACK)))]
	assembles['xchgl %eax,(%esp)\n 'op'l  4(%esp),%eax\n movl %eax,4(%esp)\n popl %eax'];
	instruction pattern SLOP(sloperator op)
	means [PUSH(mainSTACK,(word)op((word)POP(mainSTACK),(word)POP(mainSTACK)))]
	assembles['xchgl %eax,(%esp)\n 'op'l %eax, 4(%esp)\n popl %eax'];
instruction  pattern SMR( nonmultoperator op,reg r1)
        means[ PUSH(mainSTACK,(int32)op( (longint)POP(mainSTACK),^( r1)))]
    	assembles[op 'l 'r1',(%esp) ' ];
instruction  pattern SMRSHIFT( shiftop op,shiftcountreg r1)
        means[ PUSH(mainSTACK, op((longint) POP(mainSTACK),^( r1)))]
    	assembles['xchgl %eax, (%esp)\n'
                  'sa'op 'l  %cl,%eax '
                  '\n xchgl %eax,(%esp)'];
instruction  pattern BSMR( nonmultoperator op,breg r1)
        means[ PUSH(mainSTACK,(octet)op((octet) POP(mainSTACK),^( r1)))]
    	assembles[op 'b 'r1',(%esp) ' ];
instruction  pattern SMRADD( reg r1)
        means[ r1:=(int32)+( (int32)POP(mainSTACK),^( r1))]
    	assembles['addl (%esp), 'r1' \n addl $4, %esp'];
instruction  pattern SMRP( nonmultoperator op,reg r1,type t)
        means[ PUSH(mainSTACK,(ref t)op((word) POP(mainSTACK),^(r1)))]
    	assembles[op 'l ' r1',(%esp)'];
instruction pattern RPUSH(pushreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['pushl '  r];
instruction pattern RPUSHE(ureg r)
	means[PUSH(mainSTACK,(int64)EXTEND(^(r)))]
	assembles[' pushl $0 # extend 'r' to 64'
                  '\n pushl '  r];
instruction pattern RPOP(pushreg r,type t)
	means[(ref t)r:=(t)POP(mainSTACK)]
	assembles['popl  '  r];
instruction pattern BPUSH(bureg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['pushl $0\n movb 'r',(%esp)'];
instruction pattern BSPUSH(baddrmode r)
	means[PUSH(mainSTACK,(int8)^(r))]
	assembles['pushl %esi\n movsbl 'r',%esi\n xchgl %esi,(%esp)'];
instruction pattern BSPOP(bireg r)
	means[r:=(int8)POP(mainSTACK)]
	assembles['movb (%esp),  '  r'\n addl $4,%esp'];
instruction pattern BPOP(bureg r)
	means[r:=(octet)POP(mainSTACK)]
	assembles['movb (%esp),  '  r'\n add $4,%esp'];

instruction pattern REFPOP(addrmode r,type t,type t2)
	means[(ref ref t)r:=( ref t2)POP(mainSTACK)]
	assembles['popl '  r];
instruction pattern REFPOP2(addrmode r,type t)
	means[(ref ref t)r:=( word)POP(mainSTACK)]
	assembles['popl '  r];
instruction pattern MEMPOP(maddrmode m)
	means[(ref int32)m:=(int32)POP(mainSTACK)]
	assembles['popl 'm];
instruction pattern LITPUSH(offset s)
	means[PUSH(mainSTACK, s)]
	assembles['pushl $'  s];
instruction pattern MEMPUSH(maddrmode m)
	means[PUSH(mainSTACK,(word)^( m))]
	assembles['pushl ' m];
instruction pattern DMEMPUSH(regindirf ea)
	means[PUSH(mainSTACK,(doubleword)^((ref doubleword)mem(ea)))]
	assembles['pushl  4'ea'\n pushl 'ea];
instruction pattern REFPUSH(maddrmode m,type t)
	means[PUSH(mainSTACK,(ref t)^(m))]
	assembles['push l ' m];
instruction pattern SDEREF(int t)
 	means[PUSH(mainSTACK,(t)^(mem((word)POP(mainSTACK))))]
	assembles['xchgl %esi,(%esp)\n movl (%esi),%esi\n  xchgl %esi,(%esp)'];
instruction pattern SDEREFDOUBLEw(int t)
	means[PUSH(mainSTACK,(doubleword)^(mem((word)POP(mainSTACK))))]
	assembles['xchgl %esi,(%esp)\n pushl (%esi)\n movl  4(%esi),%esi\n  xchgl %esi,4(%esp)'];

/* \end{verbatim}
\subsubsection{Data movement  to and from registers }
\begin{verbatim}
*/
instruction pattern SELECT(reg r1,reg r2,addrmode r3,signed t)
	means[(ref t) r1:=OR(AND((t)^(r1),(t)^(r2)),AND((t)^(r3),NOT(^(r2))))]
	assembles[
		'andl 'r2      ','     		r1         '\n'
                'notl 'r1                         '\n'
		'andl 'r3      ','    ' ' 	r2         '\n'
		'orl 'r2       ','     		r1];
instruction  pattern LOAD(maddrmode rm, anyreg r1, int t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov't' 'rm',' r1 '#LOAD' ];
instruction  pattern LOADB(maddrmode rm, breg r1, byte t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov't' 'rm',' r1 ];
instruction  pattern LOADW(maddrmode rm, wreg r1, word16 t)
        means[ (ref t) r1:= (t)^(rm )]
	assembles['mov't' 'rm',' r1 ];
instruction pattern MOVZXB(reg r1, baddrmode rm)
	means[  r1:=(uint32)EXTEND( (uint8)^( rm) )]
	assembles['movzbl ' rm ',   'r1];
instruction pattern MOVZXB2(reg r1, baddrmode rm)
	means[  r1:=(int32)EXTEND( (uint8)^( rm) )]
	assembles['movzbl ' rm ',   'r1];
instruction pattern MOVSXB(ireg r1,baddrmode rm)
	means[r1:=(int32)EXTEND( (int8)^( rm) )]
	assembles['movsbl 'rm',   'r1];
instruction pattern MOVZXBW(uwreg r1, breg rm)
	means[  r1:= EXTEND(^(rm))]
	assembles['movzx ' rm ',   'r1];
instruction pattern MOVSXBW(swreg r1, baddrmode rm)
	means[  r1:= EXTEND(^(rm))]
	assembles['movsx ' rm ',   'r1];
instruction pattern MOVZXW(reg r1, wreg rm)
	means[  r1:=(uint32)EXTEND(^(rm))]
	assembles['movzwl ' rm ',   'r1];
instruction pattern MOVSXW(reg r1, wreg rm)
	means[  r1:=(int32)EXTEND(^(rm))]
	assembles['movswl ' rm ',   'r1];
instruction pattern MOVSBW(wreg r1, breg rm)
	means[  r1:=(int16)EXTEND(^(rm))]
	assembles['movsbw ' rm ',   'r1];
instruction pattern MOVZBW(wreg r1, bureg rm)
	means[  r1:=(int16)EXTEND(^(rm))]
	assembles['movzbw ' rm ',   'r1];
instruction pattern Tob(reg r, breg b)
	means[b:= (octet) ^( r)]
        assembles['pushl ' r '\nmovb (%esp), ' b '\n addl $4,%esp ' ];
instruction pattern STOREBR(maddrmode rm, breg r1)
        means[  (ref octet ) rm:= ^(r1) ]
	assembles['movb 'r1',' rm];
instruction pattern STORER(memrisc rm, reg r1, word32 t)
        means[  (ref t) rm:= ^( r1) ]
	assembles['mov' t ' 'r1',' rm'#STORER'];
 instruction pattern STOREWR(memrisc rm, wreg r1, word16 t)
        means[  (ref t) rm:= ^( r1) ]
	assembles['mov' t ' 'r1',' rm'#STOREWR'];
instruction  pattern NULMOV(reg r3, type t)
	means[(ref t)r3:=^((ref t)r3)]
        assembles[';nulmov ' r3  r3];
instruction  pattern STORELIT(addrmode rm,  wordupto32 t, int s)
        means[ (ref t) rm:= (t)const s  ]
	assembles['mov' t '  $'s','  ' ' rm];
instruction  pattern CLEARREG(reg rm,  type t, int s)
        means[ (ref t) rm:= (t)0  ]
	assembles['xor't ' '  rm ','  rm];
/*
\end{verbatim}
\subsubsection{Register to register arithmetic }
\begin{verbatim}
*/
instruction  pattern RMLIT(nonmultoperator op,addrmode rm,  wordupto32 t, offset sm)
        means[  (ref t) rm:= (t)op(^(rm),(t) sm)  ]
	assembles[op  t '  $' sm ',' rm];
instruction  pattern INC(addrmode rm,wordupto32 t)
	means[(ref t)rm:= (t)  + (^(rm),1)]
	assembles['inc' t ' ' rm];
instruction  pattern DEC(addrmode rm,wordupto32 t)
	means[(ref t)rm:= (t)  - ((t)^(rm),1)]
	assembles['dec' t ' ' rm];
instruction  pattern SHIFT(shiftop op, shiftcount s, anyreg r,type t)
	means[(ref t) r:= (t)op(^(r),s)]
	assembles['sa' op' ' s ', 'r];
instruction  pattern RMR( nonmultoperator op,addrmode rm,anyreg r1,wordupto32 t)
        means[ (ref t) rm := (t)op((t) ^( rm),(t)^( r1))]
    	assembles[op    t ' ' r1',' rm];
instruction pattern RMRAdd(addrmode rm, anyreg r1, wordupto32 t)
 		means[ (ref t) rm :=(t)+((t) ^( rm),(t)^( r1))]
    	assembles['add'    t ' ' r1',' rm];
instruction  pattern RMRB( nonmultoperator op,addrmode rm,breg r1,byte t)
        means[ (ref t) rm :=op((t) ^( rm),(t)^( r1))]
    	assembles[op    t ' ' r1 ',' rm];

/*\end{verbatim}
\paragraph{Saturated arithmetic} This has to be done on bytes for completeness since
the mmx only does it on sequences of bytes \begin{verbatim}
*/

instruction pattern ADDUSB(addrmode fm,breg r1,breg rm)
	means[ rm:= +:((uint8)^(rm),^(r1))]
	assembles[ 'addb  ' r1 ',' rm '\n jnc 0f\n movb $255, ' rm'\n 0:nop\n '];
instruction pattern SUBUSB(breg r1,breg rm)
	means[ rm:= -:((uint8)^(rm),^(r1))]
	assembles[ 'subb  ' r1 ',' rm '\n jnc 0f\n movb $0, ' rm'\n 0:nop\n '];
instruction pattern ADDSSB(breg r1,breg rm)
	means[ rm:=  +:( ^(rm), ^(r1))]
	assembles[ 'addb  ' r1 ',' rm '\n jno 0f\n jg 1f\n movb $-128 ,'rm'  \n jng 0f\n1:\n movb $127, ' rm'\n0:\n '];
instruction pattern MULTSSB(bacc r1,bnonacc r2)
	means[r2:=*:(^(r2),^(r1))]
	assembles['push %eax\n imul  'r2'\n shr $7,%ax\n movb %al, 'r2'\n pop %eax '];
instruction pattern MULTSSBAL(bacc r1,bnonacc r2)
	means[r1:=*:(^(r1),^(r2))]
	assembles['imul  'r2'\n shr  $7,%ax'];
instruction pattern SUBSSB(addrmode fm,breg r1,breg rm)
	means[ rm:= (int8)-:((int8)^(rm),^(r1))]
	assembles[ 'subb  ' r1 ',' rm '\n jno 0f\n jg 1f\n movb $-128, 'rm'  \n jng 0f\n1: movb $127,' rm'\n0: nop\n nop'];
instruction pattern UINT8MAX(breg r1,breg r2)
        means[ (ref uint8)r1:=MAX((uint8)^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n ja 0f\n mov 'r2','r1 '\n0:#uint8max \n'];
	instruction pattern INTABS(reg r1)
        means[ r1:=ABS(^(r1))]
	assembles['sub '   '$ 0,'   r1   '\n jns 0f\n neg 'r1'\n 0:#intabs'];
instruction pattern UINT8MIN(breg r1,breg r2)
        means[ (ref uint8)r1:=MIN((uint8)^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n jna 0f\n mov 'r2','r1'\n0:'];
instruction pattern INT8MAX(breg r1,breg r2)
        means[ (ref int8)r1:=MAX((int8)^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n jg 0f\n mov 'r2','r1'\n0:#int8max'];
instruction pattern INT8MIN(breg r1,breg r2)
        means[ (ref int8)r1:=MIN((int8)^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n jl 0f\n mov 'r2','r1 '\n0:#int8min'];
instruction pattern LEA(reg r1, leaform ea)
	means [r1:=ea]
        assembles ['lea ' ea ',' r1  ];
instruction pattern NOTOP(addrmode rm, type t)
	means[(ref t)rm:= NOT((t)^(rm))]
	assembles['not't ' ' rm];
instruction pattern Negate(anyreg r1,type t)
	means[(ref t)r1:= -((t)0,( t)^(r1))]
	assembles ['neg' t' '  r1];
instruction pattern MNegate(anyreg r1,type t)
	means[(ref t)r1:= *((t)-1,( t)^(r1))]
	assembles ['neg't  ' '  r1];
instruction  pattern RLIT(operator op,pushreg r0,  type t, signed sm)
        means[r0:= (t) op(^( r0), const sm)  ]
	assembles[op t'   $'  sm ',' r0];
instruction pattern RRint32( operator op, reg r1, reg r2)
        means[r1:=(int32) op((int32) ^(  r1),(int32)^(  r2))]
	assembles[op 'l ' r2 ',' r1];

instruction pattern BSS(label l, word32 r)
	means[bss(l,r)]
	assembles['.section .bss;\n.align 16;\n'l':\n .space 'r'\n.section .data'];
instruction pattern RR( nonmultoperator op, anyreg r1, anyreg r2, int t)
        means[r1:=(t) op((t) ^( (ref t) r1),(t)^( (ref t) r2))]
	assembles[op t' ' r2 ',' r1];
instruction  pattern RRM(operator op, pushreg r1, maddrmode rm, int t)
        means [r1:=(t) op((t) ^(r1),(t)^( rm))]
        assembles[op t' ' rm ',' r1 ] ;
pattern bnonacreg means[DH|DL|BH|BL|CH|CL];
pattern baccreg means[AL];
pattern baccregmode means[maddrmode|baccreg];
pattern bnonacregmode means[maddrmode|bnonacreg];
instruction pattern fastBIDIV(baccreg r1,bnonacregmode r2)
        means[r1:=div((int8)^(r1),(int8)^(r2))]
	assembles[' movsbw 'r1',%ax\n idiv  'r2];
instruction pattern BIDIV(baccreg r1, bnonacreg r2,baccregmode r3)
        means[r3:=div((int8)^(r1),(int8)^(r2))]
	assembles[' movsbw 'r1',%ax\n idiv  'r2'\n mov  %al,'r3];
instruction pattern BIMUL(baccreg r1, bnonacreg r2)
        means[r2:=*((int8)^(r1),(int8)^(r2))]
	assembles['imul 'r2'\n movb %al,'r2' '];
instruction pattern fastIMUL(acc a,dacc d)
	means[(ref int32)a:=*((int32)^(a),^(d))]
	assembles['imul %edx'];
	instruction pattern CDQ(qacc r1,acc r2)
	means[r1:=EXTEND(^(r2))]
	assembles['cdq'];
instruction pattern IDIV(acc r1, qacc r2, indexreg r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['idiv 'r3];

pattern nonaccreg means[EDI|ESI|EBX|EBP|ECX];
instruction pattern IDIVold(nonaccreg r2)
   	means[PUSH(mainSTACK,(int32)div((int32)POP(mainSTACK),(int32)^(r2))) ]
	assembles[' xchg %eax,(%esp)\n pushl %edx\n'
              ' cltd\n'
              ' idiv   'r2'\n'
              ' popl %edx\n'
              ' xchg %eax,(%esp)\n\n '];
instruction pattern UDIV(acc r1,modreg r2)
   	means[PUSH(mainSTACK,div((uint32)^(r1),^( r2))) ]
	assembles['pushl %edx\n xor %edx,%edx\n div   ' r2 '\n xchg (%esp),%eax\n xchg %eax,%edx'];
instruction pattern IMULLIT(pushreg r1,addrmode rm, signed s)
	means[(ref int32)r1:=*(^(rm),const s)]
	assembles['imull $'s', 'rm','r1];
instruction pattern IMOD(acc r1, modreg r2)
        means[PUSH(mainSTACK,(int32)MOD((int32)^(r1),^( r2))) ]
	assembles['pushl %edx\n cltd\n idiv   ' r2 '\n xchgl %edx,(%esp)'];
instruction pattern UMOD(acc r1, modreg r2)
        means[PUSH(mainSTACK,(uint32)MOD((uint32)^(r1),^( r2))) ]
	assembles['pushl %edx\n xor %edx,%edx\n div   ' r2 '\n xchgl %edx,(%esp)'];
instruction pattern BIMOD(baccreg r1, bnonacreg r2)
        means[r2:=MOD((int8)^(r1),(int8)^(r2))]
	assembles[' movsbw 'r1',%ax\n idiv 'r2'\n movb %al,'r2];

instruction pattern MOD16(reg r)
	means[r:=MOD(^(r),16)]
	assembles['andl $15, 'r ];
instruction pattern PLANT(label l)
	means[l]
	assembles[l ':'];
instruction pattern PLANTRCONST( double r,type t)
	means[loc (t)r]
	assembles[ '.double ' r];
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
	/*
\end{verbatim}
\subsubsection{Control transfers and tests }
\begin{verbatim}
*/
instruction pattern FAIL(int i)
	means[interrupt i]
	assembles['int $'i];
instruction pattern GOTO(jumpmode l)
	means[goto l]
	assembles['jmp ' l];
instruction pattern SET(condition c,ireg r1,ireg rm, breg r,signed t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmpl' ' 'rm ',' ' ' r1 '#set\n set'c ' ' r'\n subb $1 ,'r'\n not 'r];
instruction pattern SETU(unsignedcondition c,ureg r1,ureg rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmpl' ' ' rm ',' ' ' r1 '#setu\n set'c ' ' r'\n subb $1, 'r'\n not 'r];

instruction pattern SETW(condition c,wreg r1,wreg   rm, breg r,signed t,byte b)
	means[r:=(b) c((t)^(r1),(t) rm)]
	assembles['cmp't ' ' rm ',' ' ' r1 '#setw\n set'c ' ' r'\n subb $1, 'r'\n not 'r];

instruction pattern SETUW(unsignedcondition c,uwreg r1,uwreg rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmp't ' ' rm ',' ' ' r1 '#setuw\n set'c ' ' r'\n subb $1, 'r'\n not 'r];

instruction pattern SETB(condition c,breg r1,breg   rm, breg r,signed t,byte b)
	means[r:=(b) c((t)^(r1),(t) rm)]
	assembles['cmp't ' ' rm ',' ' ' r1 '#setb\n set'c ' ' r'\n subb $1, 'r'\n not 'r];

instruction pattern SETUB(unsignedcondition c,bureg r1,regaddrimmediate rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmp't ' ' rm ',' ' ' r1 '#setub\n set'c ' ' r'\n subb $1, 'r'\n not 'r];


instruction pattern IFBOOL(label l,reg r1)
	means[ if( ^(r1))goto l]
	assembles['test ' r1 ',' r1 '\n jnz ' l];
instruction pattern BOUND0(reg r1,reg r2)
	means[if(OR(<( ^(r2), ^((ref int32)mem(  ^(r1) ))), >( ^(r2), ^((ref int32)mem(+(^(r1), 4))))) )interrupt 5]
 	assembles['bound ' r2 ',(' r1 ')'];
instruction pattern BOUND4(reg r1,reg r2)
	means[if(OR(<( ^(r2),^((ref int32)mem(+(^(r1),4)))),>(^(r2),^((ref int32)mem(+(^(r1), 8))))))interrupt 5]
 	assembles['bound ' r2 ',4(' r1 ')'];
instruction pattern BOUND16(reg r1,reg r2)
	means[if(OR(<( ^(r2),^((ref int32)mem(+(^(r1),16)))),>(^(r2),^((ref int32)mem(+(^(r1), 20))))))interrupt 5]
 	assembles['bound ' r2 ',16(' r1 ')'];
instruction pattern IFIN(reg r1,reg r2, label l)
	means[ if((int8)AND((uint8)^(mem(r1 )) , <<( (uint8)1,^(r2))))goto l]
	assembles['bt  ' r2 ',(' r1 ')\n jc 'l];
instruction pattern TESTIN(reg r1,reg r2, breg r)
	means[ r:=<>(AND((uint8)^(mem(r1 )) , <<( (uint8)1,^(r2))),(int8)0)]
	assembles['bt  ' r2 ',(' r1 ')\n setc 'r'\n not 'r'\n inc 'r];
instruction pattern BTS(reg r1,reg r2)
	means[(ref uint8)mem(^(r1) ):=OR( <<(  1,^(r2)),(uint8)^(mem(^(r1) ) ))]
	assembles['bts ' r2 ',(' r1')'];
	instruction pattern BTR(reg r1,reg r2)
	means[(ref uint8)mem(^(r1) ):=AND((uint8)XOR( <<(  1,^(r2)),-1),(uint8)^(mem(^(r1) ) ))]
	assembles['btr ' r2 ',(' r1')'];
instruction pattern REPMOVSD(countreg s,maddrmode m1,sourcereg si, destreg di)
	means[for (ref int32)m1:=0 to ^(s) step 1 do
              (ref int32)mem(+(^(di),*(^((ref int32)m1),4))):=^((ref int32)mem(+(^(si),*(^((ref int32)m1),4))))
	]
	assembles[' inc %ecx\n jle 1f\n rep movsl\n1:'];
instruction pattern REPMOVSB(countreg s,maddrmode m1,sourcereg si, destreg di)
	means[for (ref int32)m1:=0 to ^(s) step 1 do
              (ref octet)mem(+(^(di),^((ref int32)m1))):=^((ref octet)mem(+(^(si),^((ref int32)m1))))
	]
	assembles[' inc %ecx\n jle 1f\n rep movsb\n1:'];

/* \end{verbatim} */

/* \subsection{Intel fpu instructions}

\begin{verbatim}
*/

register stack(8)ieee64 ST assembles[ 'ST'];

operation fdiv means div assembles['div'];
operation frem means MOD assembles['prem'];
pattern foperator means[add |sub|mul|fdiv];
pattern fcommuteoperator means[add|mul];
pattern fpuint means[int32|int16|int64];
pattern ftype means[ real|fpuint];

instruction pattern FPUSHI32T(type t)
	means[PUSH(mainSTACK,(int32)TRUNCATE((t)POP(ST)))]
	assembles['lea  -4(%esp),%esp\n fisttpl (%esp)'];
pattern fround(ftype t,fpuint it) means [(it)ROUND((t)POP(ST))] assembles['frndint'];
pattern fsqrt(real t , ftype t2) means[(t)SQRT((t2)POP(ST))]   assembles ['fsqrt'];
pattern fsin(real t, ftype t2) means[(t)SIN((t2)POP(ST))]  assembles ['fsin'];
pattern fcos(real t, ftype t2) means[(t)COS((t2)POP(ST))]   assembles ['fcos'];
pattern fln(real t, ftype t2)means[(t)LN((t2)POP(ST))] assembles['fldln2\n fxch\n fyl2x'];
pattern fptan(real t, ftype t2) means[(t)TAN((t2)POP(ST))]assembles['fsincos\n fxch\n fdivp  '];
pattern fabs(ftype t, ftype t2) means[(t)ABS((t2)POP(ST))]assembles['fabs'];
pattern fmoperator means [fround|fsqrt|fsin|fcos|fptan|fln|fabs];
pattern fputype means[ieee64|ieee32|int32|int16|int64];
instruction pattern RDIVB(breg b1,baddrmode b2)
	means[b1:=div(^(b1),^(b2))]
	assembles['bytediv 'b1','b2];
instruction pattern RMULTB(breg b1,baddrmode b2)
	means[b1:=*(^(b1),^(b2))]
	assembles['bytemult 'b1','b2];
instruction pattern FISTB(breg b1)
	means[b1:=(octet)POP(ST)]
	assembles['fistb 'b1];
instruction pattern FILDB(baddrmode b2)
	means[PUSH(ST,(int8)^(b2))]
	assembles['fildb 'b2];
instruction pattern FILDR(reg r)
	means[PUSH(ST,(int32)^(r))]
	assembles['fildr 'r];
	pattern dtop() means[(ieee64)POP(ST)]assembles[' '];
	pattern ftop() means[(ieee32)POP(ST)]assembles[' '];
	pattern anytop means[dtop|ftop];
instruction pattern FSTR(memrisc a, anytop t)
	means[(ref ieee64) a:= t]
	assembles['fstpl ' a];
instruction pattern FSTRF(memrisc a,anytop t)
	means[(ref ieee32) a:= t]
	assembles['fstps ' a];
pattern anyreal means[ieee32|ieee64];
instruction pattern FLOATFPU(anyreal t,fpuint i)
	means[PUSH(ST, (t)FLOAT((i)POP(ST)))]
	assembles[' '];
instruction pattern FLOATLDR(indexreg r,anyreal t)
	means[PUSH(ST,(t)FLOAT((int32)^(r)))]
	assembles[' sub $8, %esp\n'
		  '  movl 'r', (%esp)\n'
		  '  fildl (%esp)\n'
		   '  add $8, %esp ' ];
instruction pattern FLOATMS(fputype t)
	means[PUSH(ST,(ieee32)FLOAT((int32)POP(mainSTACK)))]
	assembles['fildl  (%esp)\n addl $4,%esp'];
instruction pattern EXTENDMS(fputype t)
	means[PUSH(ST,(int64)EXTEND((int32)POP(mainSTACK)))]
	assembles['fildl  (%esp)\n addl $4, %esp'];
instruction pattern FPOPMS(fputype t)
	means[PUSH(ST,(ieee32)POP(mainSTACK))]
	assembles['flds  (%esp)\n addl $4, %esp'];
instruction pattern FPOPMSI64(fputype t)
	means[PUSH(ST,(int64)POP(mainSTACK))]
	assembles['fildq (%esp)\n addl $8, %esp'];
instruction pattern DPOPMS(fputype t)
	means[PUSH(ST,(ieee64)POP(mainSTACK))]
	assembles['fldl (%esp)\n add $8,%esp'];
instruction pattern FPUSHD(fputype t)
	means[PUSH(mainSTACK,(ieee64)POP(ST))]
	assembles['subl $8, %esp\n fstpl (%esp)'];
instruction pattern FPUSHF(fputype t)
	means[PUSH(mainSTACK,(ieee32)POP(ST))]
	assembles['subl $4,%esp\n fstps  (%esp)'];
instruction pattern FISTR(memrisc m, hiint i)
	means[(ref i )m:=(i )POP(ST)]
	assembles['fistp'i' ' m];
	
instruction pattern FPUSHI(type t)
	means[PUSH(mainSTACK,(int32)ROUND((t)POP(ST)))] 
	assembles['subl $4, %esp\n fistpl  (%esp)'];
instruction pattern FLD(maddrmode a)
	means[PUSH(ST,^((ref ieee64) a))]
	assembles['fldl ' a];
instruction pattern FLDF(maddrmode a)
	means[PUSH(ST,^((ref ieee32) a))]
	assembles['flds  ' a];
instruction pattern FILD(maddrmode a,real t, hiint i)
	means[PUSH(ST,(i)^( a))]
	assembles['fild'i ' ' a];
instruction pattern FILDF(maddrmode a,real t, hiint i)
	means[PUSH(ST,FLOAT((i)^((ref i) a)))]
	assembles['fild'i ' ' a];
instruction pattern FILDIP(real t)
	means[PUSH(ST, (int32)POP(mainSTACK))]
	assembles['fildl (%esp)\n add $4,%esp'];
instruction pattern FILDFt(maddrmode a,real t, hiint i)
	means[PUSH(ST,(t)FLOAT((i)^((ref i) a)))]
	assembles['fild'i ' ' a];

operation flt means < assembles ['b'];
operation fgt means > assembles ['a'];
operation feq means = assembles ['z'];
operation fle means <= assembles ['na'];
operation fge means >= assembles ['ae'];
operation fne means <> assembles ['nz'];
pattern fcondition means[fne|fge|fle|feq|fgt|flt];
instruction pattern FSET(fcondition c, breg r,fputype t)
	means[(ref int8)r:=(int8) c((t)POP(ST), (t)POP(ST))]
	assembles['fxch'
		'\n  fucompp'
		'\n pushw %ax'
		'\n fnstsw %ax'
		'\n sahf'
		'\n popw %ax'
		'\n set'c ' ' r
		'\n not 'r
		'\n inc 'r
		];
instruction pattern FMOP(fmoperator op)
	means[PUSH(ST,op)]
	assembles[op];
instruction pattern FCHS(real t)
	means[PUSH(ST,(t)-((t)0,(t)POP(ST)))]
	assembles['fchs'];
instruction pattern RFLOADLIT(float f,reg r)
	means[r:=const f]
	assembles['jmp 0f\n1:.float 'f'\n0:movl 1b,'r];


/* this handles any length of real and should come last in the set of codes */
instruction pattern FLOADDLIT(real f)
	means[PUSH(ST,const f)]
	assembles['jmp 0f\n1:.double 'f'\n0:fldl 1b'];
/*	assembles['db 0ebh,8\ndq ' f'\nfld qword  [$-8]'];*/
instruction pattern FILOADLIT(hiint i)
	means[PUSH(ST, const i)]
	assembles['jmp 0f\n1:.quad 'i'\n0:fildq 1b'];
/*	assembles['db 0ebh,10\ndt ' i'.0\nfld tword  [$-10]'];*/
instruction pattern FOP(maddrmode a,foperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),^((ref ieee64)a)  )) ]
	assembles['f'op 'l  ' a];
instruction pattern FOPF(maddrmode a,foperator op,real t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)^((ref t)a)  )) ]
	assembles['f'op  t   ' ' a];
instruction pattern FOPI(maddrmode a,foperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),FLOAT((int32)^(a) ) )) ]
	assembles['fi'op 'l   ' a];
instruction pattern ReversePolishFOP(fcommuteoperator op,fputype t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)POP(ST)))]
	assembles['f'op'p']; /* looks like stack operand not needed in as */
instruction pattern ReversePolishFOPG(foperator op,fputype t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)POP(ST)))]
	assembles['fxch\n f'op'p'];


/* this version only works on P6s and above comment out for now since fcmov not supported properly in gas
instruction pattern FMAXp6(maddrmode a,fputype t)
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)\n fcmovb %st(0),%st(1) \nfstp %st(1)'];
instruction pattern FMINp6(maddrmode a,fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)\n fcmovnb %st(0),%st(1)   \nfstp %st(1)']; /* */
instruction pattern MINR(ireg r1,ireg r2)
	means[r1:=MIN(^(r1),^(r2))]
	assembles['minr ' r1','r2];
instruction pattern MAXR(ireg r1,ireg r2)
	means[r1:=MAX(^(r1),^(r2))]
	assembles['maxr ' r1','r2];	
instruction pattern FMAX(maddrmode a,fputype t)
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcom %st(1) # fmax \npushw %ax\n fstsw %ax\n sahf\n popw %ax\n jnb 0f \n fxch \n0:fstp %st(1)\n #end of fmax'];
instruction pattern FMIN(maddrmode a,fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcom %st(1) #fmin  \n pushw %ax\n fstsw %ax\n sahf\n pop %ax\n jb 0f \n fxch \n0:fstp %st(1)\n #end of fmin'];
instruction pattern FPREM(fputype t)
	means[PUSH(ST,(t)MOD((t) POP(ST),(t)POP(ST)))]
	assembles['fxch\n fprem\n fstp %st(1)'];

instruction pattern EXTENDANY(type t)
	means[PUSH(ST,(ieee64)EXTEND((t)POP(ST)))]
	assembles[' '];
/* conditional instructions */



/*instruction pattern FIFGOTO(label l, maddrmode a,fcondition c,int t)
	means[if((t)c((ieee32)POP(ST), ^((ref ieee32)a)))goto l]
	assembles['fcompl  ' a ' \n push %ax\n fstsw %ax\n sahf\npop %ax\n j' c '    ' l];*/
instruction pattern FIFGOTOgeneral(label l,  fcondition c,int t,fputype t)
	means[if((t)c((t)POP(ST), (t)POP(ST)))goto l]
	assembles['fxch\n fcompp \npush %ax  \n fstsw %ax\n sahf\n pop %ax\n j' c '   ' l];
instruction pattern IFLITGOTO(label l,addrmode r1,signed r2,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const r2))goto l]
	assembles[' cmp't'  $' r2 ',  '  r1 '\n j' c '   '  l];
instruction pattern BIFLITGOTO(label l,baddrmode r1,signed arg2,condition c,signed t)
	means[if(c((t) ^(r1),const arg2))goto l]
	assembles[' cmp't'  $' arg2 ',  '  r1 '\n j' c '   '  l];
instruction pattern IFGOTOB(label l,bireg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int8) r2))goto l]
	assembles['cmpb ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFGOTOW(label l,wreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int16) r2))goto l]
	assembles['cmpw ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFGOTO(label l,ireg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int32) r2))goto l]
	assembles['cmpl ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFASS(signedreg r1,regaddrimmediate r2,condition c,anyreg r3,addrmode rm, type t )
	means[if((int8)c((t) ^(r1),(t) r2))(ref t)rm:= (t)^(r3)]
	assembles['cmp't '  'r2 ',' '  '  r1 '\n mov't ' 'rm',' r1'\n cmov'c t' 'r3','r1'\n mov't ' 'r1 ',' rm];
instruction pattern ANDIFGOTO(label l,anyreg r1, reg r2,condition c,int t,int b,anyreg r3, reg r4, condition c2, int t2,int b)
	means[if((b)AND((b)c((t) ^(r1),(t) r2),(b)c2((t2)^(r3),(t2)r4)))goto l]
	assembles['andifgoto ' c','r1',' r2','c2','r3','  r4 ',' l','t','t2];



define(IFcodes,
    IFLITGOTO
	|BIFLITGOTO
	|IFIN
	|IFGOTO
	|IFGOTOB
	|IFGOTOW
	|FIFGOTOgeneral)


define(IA32codes,
    IFcodes
	|LOAD
	|LOADB
	|LOADW
	|MOVZXB
	|MOVSXB
	|MOVZXW
	|MOVSXW
	|MOVZXB2
	|MOVZBW
	|MOVSBW
	|MOVZXBW
	|MOVSXBW
	|CLEARREG
	|STORELIT
	|LEA
	|INC
	|RMLIT
	|RMR
	|DEC
	|IMULLIT
	|BIMUL
	|RLIT
	|RRM
	|RMRB
	|RMR
	|RMRAdd
	|RRint32
	|RR
	|IDIV
	|fastBIDIV
	|BIDIV
	|UDIV
	|INTABS
	|IDIVold
	|IMOD
	|UMOD
	|CDQ
	|fastIMUL
	|Negate
	|NOTOP
	|MNegate
	|BTS
	|BTR
	|TESTIN
	|SHIFT
	|MINR
	|MAXR
	|UINT8MAX
	|UINT8MIN
	|INT8MAX
	|INT8MIN
	|SELECT
	|PLANT
	|LITPUSH
	|MEMPUSH
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

	|PLANTICONST
	|PLANTWCONST
	|PLANTBCONST
	|PLANTRCONST
	|PLANTSCONST
    |BSS
	|REPMOVSD
	|REPMOVSB
	|ADDUSB
	|SUBUSB
	|ADDSSB
	|SUBSSB
	|MULTSSB
	|MULTSSBAL
	|STOREWR
	|STORER
	|STOREBR )
/* these come last as they are a fallback for having no free registers */
define(lastIA32codes,
    SLOP
	|RPUSH
	|REFPUSH
	|SDEREF
	|SDEREFDOUBLEw/* pushes */
	|IFBOOL
	|SMLIT
	|SMRP
	|SADD
	|SMULIT
	|SMRADD
	|SOP
	|SMR
	|BSMR
	|STOREWR
	|STORER
	|STOREBR
	|REFPOP
	|REFPOP2
	|MEMPOP
	|BPOP
	|BSPOP
	|BSPUSH
	|DMEMPUSH
	|RPUSHE
	|BPUSH
	|STACKSTORE
	|STACKWSTORE
	|STACKBSTORE
	|Tob
	|RPOP
	|SMRSHIFT)




define(fpucodes,FCHS
	|FOPF
	|FILOADLIT
/*
	|FMAXp6
	|FMINp6 /* */
	|FMAX
	|FMIN
	|    FLD
	|FPUSHI32T
	|FLDF
	|FILDF
	|FILD
	|FILDF
	|FLOADDLIT
	|FILDB
	|FILDR
	|FLOATLDR
	|ReversePolishFOP
	|ReversePolishFOPG
	|     FMOP
	|FPREM
	|FOP
	|FOPI
	|EXTENDANY
	|     RMULTB
	|FPOPMSI64
	|FISTR
	|FSTR
	|FSTRF
	|FLOATMS
	|FILDIP
	|EXTENDMS
	|FSET
	|DPOPMS
	|FPOPMS
	|FISTB)
define(fpupushes,FPUSHI
	|FPUSHD
	|FPUSHF
	|FLOATFPU)

/* \end{verbatim}
\subsection{Pentium extensions to the FPU codes }
\begin{verbatim}*/

/* \end{verbatim} */



