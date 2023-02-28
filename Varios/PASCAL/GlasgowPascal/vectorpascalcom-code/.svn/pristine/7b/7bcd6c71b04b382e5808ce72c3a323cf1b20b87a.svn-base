
/* 
 


Basic ia32 processor description int ilcg
 copyright(c) Paul Cockshott, University of Glasgow
 Feb 2000

Version that takes shortcuts for fast compile speed

\subsection{Declare types to correspond to internal ilcg types }
\begin{verbatim}
*/

type word=DWORD;
type uint32=DWORD;
type int32=DWORD;
type ieee64=QWORD;
type int64=QWORD;
type octet=BYTE;
type uint8=BYTE; 
type int16=WORD;
type int8=BYTE;
type ieee32=DWORD;
type halfword=WORD;

/* \end{verbatim}
\subsection{compiler configuration flags }
\begin{verbatim}
*/
flag realLitSupported = 0;
/* \end{verbatim}
\subsection{Register declarations}

\begin{verbatim}
*/
register int32 EAX assembles['eax'] ;
register int32 ECX assembles['ecx'] ;
register int32 EBX assembles['ebx'] ;
register word EBP assembles['ebp'] ;
alias register word FP = EBP(0:31) assembles ['ebp'];
reserved register word ESP assembles['esp'];
register int32 ESI assembles['esi'] ;
register int32 EDI assembles['edi'] ;
register int32 EDX assembles['edx'];

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
pattern indexreg means[EDI|ESI|EBX|EBP|ESP|EAX|EDX|ECX];
pattern accumulators means[EAX|EDX|ECX|EBX];
pattern ireg means [  indexreg]  ;
pattern ureg means [EBP| ubx|udi|usi|udx|ESP|ucx|uax ]  ;

pattern reg means [ireg|ureg];

/* Note that the order of the byte registers is chosen to keep the ah and al regs
   free for instructions that require themspecifically, particularly
conditional expressions on the floating point stack, that return boolean
results in al */
pattern bireg means[ BL|DL|AL|CL];
pattern bureg means[BH|DH|uAL|uBL|uDL|uCL|CH];
pattern boreg means[oBL|oAL|oDL|oCL];
pattern breg means[bireg|bureg|boreg];
pattern wreg means[BX|CX|DX|AX|SI|DI];
pattern pushreg means[reg|wreg]; /* these are directly pushable */
pattern anyreg means[ breg|wreg|reg];
pattern signedreg means[bireg|ireg|wreg];
pattern unsignedreg means[bureg|ureg|wreg];
pattern acc means[EAX];
pattern dacc means[EDX];
pattern wacc means[AX];
pattern bacc means[AL];
pattern bnonacc means[BL|CL|DL];
pattern ebxacc means[EBX];
pattern ebxbacc means[BL];
pattern ecxacc means[ECX];
pattern ecxbacc means[CL];
pattern modreg means [ECX];
pattern sourcereg means [ESI];
pattern destreg means [EDI];
pattern countreg means [ECX];
pattern shiftcountreg means [ecxbacc|ecxacc];

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

pattern condition means[ne|ge|le|eq|gt|lt];
pattern unsignedcondition means[ne|ae|be|eq|ab|bel];
pattern operator means[add | sub|imul|and|or|xor];
pattern nonmultoperator means[add|sub|and|or|xor];
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
pattern signed means[   int8 |   int16|int32 ];
pattern int means[   int8 |   int16 |int32| uint32|uint8|uint16];
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
	assembles[l];
pattern labelconstf(label l,signed s)
	means [+(l,const s)]
	assembles[l'+'s];
pattern constf(signed s)
	means[const s]
	assembles [s];
pattern offset means[constf|labelf|labelconstf];
pattern regindirf(reg r) 
	means[^(r) ]
	assembles[ r ];

pattern baseminusoffsetf(reg r, offset s ) 
	means[-(   ^(r) ,  s)] 
	assembles[  r '-(' s ')']; 
pattern baseplusoffsetf(reg r, offset s )
	means[+(   ^(r) ,  s)]
	assembles[  r '+' s ];
pattern scaledIndexPlusOffsetf(reg r1, scale s, offset offs)
	means[+(*(^(r1),s), offs)]
	assembles[r1 '*' s '+' offs];
address pattern basePlusScaledIndexf(reg r1,reg r2,scale s)
	means[+(^(r1),*(^(r2),s))]
        assembles[  r1 '+' r2 '*'  s   ];
address pattern basePlusScaledIndexPlusOffsetf(reg r1,reg r2,scale s,offset off,longint t)
	means[+((t)+(^(r1),  off),*(^(r2),s) )]
        assembles[  r1 '+' r2 '*'  s '+'off  ];
address pattern basePlusIndexPlusOffsetf(reg r1,reg r2,offset off)
	means[+(^(r1),+(^(r2),  off))]
        assembles[  r1 '+' r2 ' +'off  ];
address pattern basePlusIndexf(reg r1,reg r2)
	means [+(^(r1),^(r2))]
	assembles[  r1 '+' r2   ];
pattern directf(unsigned s) 
	means[const s] 
	assembles[  s  ];

 
/*\end{verbatim}\subsection{Choice of effective address}
 This contains the useful formats for the load effective address instruction.
The pattern 
 regindirf is excluded here as it adds nothing
   we do not have already from mov instructions.

\begin{verbatim}
*/
pattern uncasteaform means[directf  |labelf|  labelconstf|baseplusoffsetf ];
pattern eaform(uncasteaform f,longint t)  /* allow the address expression to be cast to an integer */
	means[(t)f]assembles[f];
/*\end{verbatim}
 \subsection{ Formats for all memory addresses}
 \begin{verbatim}*/

pattern addrform means[eaform|regindirf];

 
/** \end{verbatim}
define the address patterns used in other instructions 

\begin{verbatim}

*/





pattern maddrmode(addrform f) 
means[mem(f) ] 
assembles[ '[' f ']' ];
pattern immediate(signed s)means [const s] assembles [s]; 
pattern intimmediate(int s)means [const s] assembles [s];
pattern jumpmode means[labelf|maddrmode];
pattern addrmode means[maddrmode|anyreg];
pattern baddrmode means[maddrmode|breg];
pattern waddrmode means[maddrmode|reg];
pattern regshift(shiftcountreg r)means[^(r)] assembles['cl'];
pattern shiftcount means[immediate|regshift];
pattern regaddrop(addrmode r)means[^(r)] assembles[r];
pattern regaddrimmediate means[intimmediate|maddrmode|regaddrop];
/* \end{verbatim}

\subsection{Instruction patterns for the  386}
\subsubsection{Stack operations }

\begin{verbatim}
*/

instruction pattern STACKSTORE(reg r1 )
	means[(ref int32)mem(POP(mainSTACK)):=^(r1)]
	assembles['xchg DWORD[esp],'r1'\n  pop DWORD['r1']\n  pop 'r1];
instruction pattern STACKWSTORE(wreg r1 )
	means[(ref halfword)mem(POP(mainSTACK)):=^(r1)]
	assembles['xchg DWORD[esp],esi\n  mov word[esi],'r1'\n  pop esi'];
instruction pattern STACKBSTORE(breg r1 )
	means[(ref octet)mem(POP(mainSTACK)):=^(r1)]
	assembles['xchg DWORD[esp],esi\n  mov BYTE[esi],'r1'\n  pop esi'];
instruction  pattern SMLIT( nonmultoperator op,offset s) 
        means[ PUSH(mainSTACK,(int32)op( POP(mainSTACK), s))] 
    	assembles[op '  DWORD[esp] ,' s];

instruction  pattern SMULIT( nonmultoperator op,offset s) 
        means[ PUSH(mainSTACK,(int32)*( POP(mainSTACK), s))] 
    	assembles['xchg eax,DWORD[esp]\n imul eax ,' s'\n xchg eax,DWORD[esp]' ];

instruction pattern SADD(saddoperator op)
	means [PUSH(mainSTACK,(longint)+(POP(mainSTACK),POP(mainSTACK)))]
	assembles['xchg eax,DWORD[esp]\n add DWORD[esp+4],eax\n pop eax'];
 
instruction pattern SOP(saddoperator op)
	means [PUSH(mainSTACK,(longint)op(POP(mainSTACK),POP(mainSTACK)))]
	assembles['xchg eax,DWORD[esp]\n 'op' eax,DWORD[esp+4]\n mov DWORD[esp+4],eax\n pop eax'];
instruction  pattern SMR( nonmultoperator op,reg r1) 
        means[ PUSH(mainSTACK,(int32)op( POP(mainSTACK),^( r1)))] 
    	assembles[op '  DWORD[esp] ,' r1]; 
instruction  pattern BSMR( nonmultoperator op,breg r1) 
        means[ PUSH(mainSTACK,(octet)op( POP(mainSTACK),^( r1)))] 
    	assembles[op '  byte[esp] ,' r1]; 

instruction  pattern SMRADD( reg r1) 
        means[ r1:=(int32)+( POP(mainSTACK),^( r1))] 
    	assembles['add 'r1',DWORD[esp] \n add esp,4']; 

instruction  pattern SMRP( nonmultoperator op,reg r1,type t) 
        means[ PUSH(mainSTACK,(ref t)op( POP(mainSTACK),^(r1)))] 
    	assembles[op '  DWORD[esp] ,' r1]; 
instruction pattern RPUSH(pushreg r) 
	means[PUSH(mainSTACK,^(r))] 
	assembles['push '  r];
 
instruction pattern RPOP(pushreg r,type t) 
	means[(ref t)r:=(t)POP(mainSTACK)] 
	assembles['pop  '  r];	
instruction pattern BPUSH(bureg r) 
	means[PUSH(mainSTACK,^(r))] 
	assembles['push 0\n mov BYTE[esp],'r];
instruction pattern BSPUSH(baddrmode r)
	means[PUSH(mainSTACK,(int8)^(r))]
	assembles['push esi\n movsx esi,'r'\n xchg esi,[esp]'];
instruction pattern BSPOP(bireg r)
	means[r:=POP(mainSTACK)]
	assembles['mov  '  r',BYTE[esp]\n add esp,4']; 
instruction pattern BPOP(bureg r) 
	means[r:=POP(mainSTACK)] 
	assembles['mov  '  r',BYTE[esp]\n add esp,4'];	

	
instruction pattern REFPOP(addrmode r,type t) 
	means[(ref ref t)r:=POP(mainSTACK)] 
	assembles['pop DWORD '  r];
instruction pattern MEMPOP(maddrmode m)
	means[(ref int32)m:=POP(mainSTACK)]
	assembles['pop DWORD 'm];		 
instruction pattern LITPUSH(offset s) 
	means[PUSH(mainSTACK, s)] 
	assembles['push DWORD '  s];
instruction pattern MEMPUSH(maddrmode m) 
	means[PUSH(mainSTACK,(int32)^((ref int32)m))] 
	assembles['push DWORD ' m]; 
instruction pattern DMEMPUSH(eaform ea) 
	means[PUSH(mainSTACK,(doubleword)^((ref doubleword)mem(ea)))] 
	assembles['push DWORD['ea'+4]\n push DWORD['ea']']; 

instruction pattern STACKLOAD(word32 t)
	means[PUSH(mainSTACK,^((ref t)mem(POP(mainSTACK))))]
	assembles['xchg DWORD[esp],eax\n  mov eax,DWORD[eax]\n  xchg DWORD[esp],eax'];
instruction pattern REFPUSH(maddrmode m,type t) 
	means[PUSH(mainSTACK,(ref t)^(m))] 
	assembles['push DWORD ' m]; 
instruction pattern SDEREF(int t)
 means[PUSH(mainSTACK,(t)^(mem(POP(mainSTACK))))]
 assembles['xchg esi,[esp]\n mov esi,dword[esi]\n  xchg esi,[esp]'];
instruction pattern SDEREFDOUBLEWORD(int t)
 means[PUSH(mainSTACK,(doubleword)^(mem(POP(mainSTACK))))]
 assembles['xchg esi,[esp]\n push dword[esi]\n mov esi,dword[esi+4]\n  xchg esi,[esp]'];

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
instruction  pattern LOAD(maddrmode rm, anyreg r1, wordupto32 t) 
        means[ (ref t) r1:= (t)^(rm )] 
	assembles['mov ' r1 ',' t ' ' rm]; 
instruction pattern MOVZXB(reg r1, baddrmode rm) 
	means[  r1:=(uint32)EXTEND( (uint8)^( rm) )]
	assembles['movzx ' r1 ', BYTE  'rm]; 
instruction pattern MOVZXB2(reg r1, baddrmode rm) 
	means[  r1:=(int32)EXTEND( (uint8)^( rm) )]
	assembles['movzx ' r1 ', BYTE  'rm]; 

instruction pattern MOVSXB(reg r1,baddrmode rm) 
	means[r1:=(int32)EXTEND( (int8)^( rm) )]
	assembles['movsx 'r1',BYTE   'rm]; 
instruction pattern MOVZXW(reg r1, wreg rm) 
	means[  r1:=(uint32)EXTEND(^(rm))]
	assembles['movzx ' r1 ',   'rm]; 
instruction pattern MOVSXW(reg r1, wreg rm) 
	means[  r1:=(int32)EXTEND(^(rm))]
	assembles['movsx ' r1 ',   'rm]; 
instruction pattern ToBYTE(reg r, breg b)
	means[b:= (octet) ^( r)]
        assembles['push ' r '\nmov ' b ',BYTE[esp]\nadd esp,4 ' ];


instruction pattern STOREBR(maddrmode rm, breg r1)
        means[  (ref octet ) rm:= ^(r1) ]
	assembles['mov BYTE 'rm',' r1];
instruction pattern STORER(maddrmode rm, reg r1, word32 t)
        means[  (ref t) rm:= ^( r1) ]
	assembles['mov ' t ' 'rm',' r1];
 instruction pattern STOREWR(maddrmode rm, wreg r1, word16 t)
        means[  (ref t) rm:= ^( r1) ]
	assembles['mov ' t ' 'rm',' r1];
instruction  pattern NULMOV(reg r3, type t)
	means[(ref t)r3:=^((ref t)r3)]
        assembles[';nulmov ' r3  r3];
instruction  pattern STORELIT(addrmode rm,  type t, int s)
        means[ (ref t) rm:= (t)const s  ]
	assembles['mov ' t ' 'rm ','  ' ' s];
instruction  pattern CLEARREG(reg rm,  type t, int s)
        means[ (ref t) rm:= (t)0  ]
	assembles['xor '  rm ','  rm];
/*
\end{verbatim}
\subsubsection{Register to register arithmetic }
\begin{verbatim}
*/ 
instruction  pattern RMLIT(nonmultoperator op,addrmode rm,  type t, offset sm)
        means[  (ref t) rm:= op(^(rm),(t) sm)  ]
	assembles[op '  ' t ' ' rm ',' sm];
instruction  pattern INC(addrmode rm,int t)
	means[(ref t)rm:=   + (^(rm),1)]
	assembles['inc ' t ' ' rm];
instruction  pattern DEC(addrmode rm,int t)
	means[(ref t)rm:=   - ((t)^(rm),1)]
	assembles['dec ' t ' ' rm];
instruction  pattern SHIFT(shiftop op, shiftcount s, anyreg r,type t)
	means[(ref t) r:= (t)op(^(r),s)]
	assembles['sh' op' ' r ', 's];	
instruction  pattern RMR( nonmultoperator op,addrmode rm,anyreg r1,wordupto32 t)
        means[ (ref t) rm :=op((t) ^( rm),(t)^( r1))]
    	assembles[op '  '   t ' ' rm ',' r1]; 
instruction  pattern RMRB( nonmultoperator op,addrmode rm,breg r1,byte t)
        means[ (ref t) rm :=op((t) ^( rm),(t)^( r1))]
    	assembles[op '  '   t ' ' rm ',' r1]; 
instruction pattern ADDUSB(addrmode fm,breg r1,breg rm)
	means[ rm:= +:((uint8)^(rm),^(r1))]
	assembles[ 'add  ' rm ',' r1 '\n jnc $+4\n mov ' rm',255\n nop\n nop']; 
instruction pattern SUBUSB(breg r1,breg rm)
	means[ rm:= -:((uint8)^(rm),^(r1))]
	assembles[ 'sub  ' rm ',' r1 '\n jnc $+4\n mov ' rm',0\n nop\n nop'];
instruction pattern ADDSSB(breg r1,breg rm)
	means[ rm:=(int8) +:((int8)^(rm),^(r1))]
	assembles[ 'add  ' rm ',' r1 '\n jno $+10\n jg $+6\n mov 'rm' ,-128 \n jng $+4\n mov ' rm',127\n '];
instruction pattern MULTSSB(bacc r1,bnonacc r2)
	means[r2:=*:(^(r1),^(r2))]
	assembles['imul  'r2'\n shr ax,7\n mov 'r2',al'];
instruction pattern MULTSSBAL(bacc r1,bnonacc r2)
	means[r1:=*:(^(r1),^(r2))]
	assembles['imul  'r2'\n shr ax,7'];

instruction pattern SUBSSB(addrmode fm,breg r1,breg rm)
	means[ rm:= (int8)-:((int8)^(rm),^(r1))]
	assembles[ 'sub  ' rm ',' r1 '\n jno $+10\n jg $+6\n mov 'rm' ,-128 \n jng $+4\n mov ' rm',127\n nop\n nop'];
instruction pattern UINT8MAX(breg r1,breg r2)
        means[ (ref uint8)r1:=MAX((uint8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n ja $+4\n mov 'r1','r2];
instruction pattern UINT8MIN(breg r1,breg r2)
        means[ (ref uint8)r1:=MIN((uint8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jna $+4\n mov 'r1','r2];
instruction pattern INT8MAX(breg r1,breg r2)
        means[ (ref int8)r1:=MAX((int8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jg $+4\n mov 'r1','r2];
instruction pattern INT8MIN(breg r1,breg r2)
        means[ (ref int8)r1:=MIN((int8)^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jl $+4\n mov 'r1','r2];
instruction pattern LEA(reg r1, eaform ea)
	means [r1:=ea]
        assembles ['lea ' r1 ',[' ea ']' ];
instruction pattern NOTOP(addrmode rm, type t)
	means[(ref t)rm:= NOT((t)^(rm))]
	assembles['not 't ' ' rm];
instruction pattern Negate(anyreg r1,type t)
	means[(ref t)r1:= -((t)0,( t)^(r1))]
	assembles ['neg ' ' '  r1];
instruction pattern MNegate(anyreg r1,type t)
	means[(ref t)r1:= *((t)-1,( t)^(r1))]
	assembles ['neg '  ' '  r1];
instruction  pattern RLIT(operator op,pushreg r0,  type t, signed sm)
        means[r0:=  op(^( r0), const sm)  ]
	assembles[op '  '  r0 ',' sm];
instruction pattern RR( nonmultoperator op, anyreg r1, anyreg r2, int t)
        means[r1:=(t) op((t) ^( (ref t) r1),(t)^( (ref t) r2))]
	assembles[op ' ' r1 ',' r2];
instruction  pattern RRM(operator op, pushreg r1, maddrmode rm, int t)
        means [r1:=(t) op((t) ^(r1),(t)^( rm))]
        assembles[op ' ' r1 ',' rm ] ;
pattern bnonacreg means[DH|DL|BH|BL|CH|CL];
pattern baccreg means[AL];
pattern baccregmode means[maddrmode|baccreg];
pattern bnonacregmode means[maddrmode|bnonacreg];
instruction pattern fastBIDIV(baccreg r1,bnonacregmode r2)
        means[r1:=div((int8)^(r1),(int8)^(r2))]
	assembles[' movsx ax,'r1'\n idiv BYTE 'r2];
instruction pattern BIDIV(baccreg r1, bnonacregmode r2,baccregmode r3)
        means[r3:=div((int8)^(r1),(int8)^(r2))]
	assembles[' movsx ax,'r1'\n idiv BYTE 'r2'\n mov BYTE 'r3',al'];
instruction pattern BIMUL(baccreg r1, bnonacreg r2)
        means[r2:=*((int8)^(r1),(int8)^(r2))]
	assembles['imul BYTE 'r2'\n mov BYTE 'r2',al'];
instruction pattern fastIMUL(acc a,dacc d)
	means[(ref int32)a:=*((int32)^(a),^(d))]
	assembles['imul edx'];
instruction pattern IDIV(acc r1,modreg r2)
   	means[PUSH(mainSTACK,div((int32)^(r1),^( r2))) ]
	assembles['push edx\n cdq\n idiv   ' r2 '\n xchg eax,DWORD[esp]\n xchg eax,edx'];
instruction pattern UDIV(acc r1,modreg r2)
   	means[PUSH(mainSTACK,div((uint32)^(r1),^( r2))) ]
	assembles['push edx\n xor edx,edx\n div   ' r2 '\n xchg eax,DWORD[esp]\n xchg eax,edx'];
instruction pattern IMULLIT(pushreg r1,addrmode rm, signed s)
	means[(ref int32)r1:=*(^(rm),const s)]
	assembles['imul 'r1',DWORD 'rm','s];
instruction pattern IMOD(acc r1, modreg r2)
        means[PUSH(mainSTACK,MOD((int32)^(r1),^( r2))) ]
	assembles['push edx\n cdq\n idiv   ' r2 '\n xchg edx,DWORD[esp]'];
instruction pattern UMOD(acc r1, modreg r2)
        means[PUSH(mainSTACK,MOD((uint32)^(r1),^( r2))) ]
	assembles['push edx\n xor edx,edx\n div   ' r2 '\n xchg edx,DWORD[esp]'];
instruction pattern BIMOD(baccreg r1, bnonacreg r2)
        means[r2:=MOD((int8)^(r1),(int8)^(r2))]
	assembles[' movsx ax,'r1'\n idiv 'r2'\n mov 'r2',ah'];

instruction pattern MOD2(reg r)
	means[r:=MOD(^(r),2)]
	assembles['and 'r ',1'];
instruction pattern MOD4(reg r)
	means[r:=MOD(^(r),4)]
	assembles['and 'r ',3'];
instruction pattern MOD8(reg r)
	means[r:=MOD(^(r),8)]
	assembles['and 'r ',7'];
instruction pattern DIV8(ureg r)
	means[r:=div((uint32)^(r),8)]
	assembles['shr 'r ',3'];

instruction pattern MOD16(reg r)
	means[r:=MOD(^(r),16)]
	assembles['and 'r ',15'];	
instruction pattern PLANT(label l)
	means[l]
	assembles[l ':'];  
instruction pattern PLANTRCONST( double r,type t)
	means[loc (t)r]
	assembles[ 'dq ' r];
instruction pattern PLANTICONST( longint r,type t) 
	means[loc (t) r] 
	assembles[ 'dd ' r]; 
 
instruction pattern PLANTSCONST( float  r,type t)
	means[loc (t) r]
	assembles[ 'dd ' r];
instruction pattern PLANTBCONST( byte r,type t) 
	means[loc (t) r] 
	assembles[ 'db ' r]; 
instruction pattern PLANTWCONST( word16 r,type t) 
	means[loc (t) r] 
	assembles[ 'dw ' r];
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
	assembles[' cmp 't' ' r1 ',  '  r2 '\n j' c ' near  '  l];
instruction pattern BIFLITGOTO(label l,baddrmode r1,signed arg2,condition c,signed t)
	means[if(c((t) ^(r1),const arg2))goto l]
	assembles[' cmp 't' ' r1 ',  't  arg2 '\n j' c ' near  '  l];
instruction pattern IFGOTO(label l,signedreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c((t) ^(r1),(t) r2))goto l]
	assembles['cmp ' r1 ','t '  '  r2 '\n j' c ' near  ' l];

instruction pattern IFASS(signedreg r1,regaddrimmediate r2,condition c,anyreg r3,addrmode rm, type t )
	means[if((int8)c((t) ^(r1),(t) r2))(ref t)rm:= (t)^(r3)]
	assembles['cmp ' r1 ','t '  '  r2 '\n mov 'r1','t rm'\n cmov'c' 'r1','r3'\n mov 't rm ',' r1];
instruction pattern ANDIFGOTO(label l,anyreg r1,regaddrimmediate r2,condition c,int t,int b,anyreg r3,regaddrimmediate r4, condition c2, int t2,int b)
	means[if((b)AND((b)c((t) ^(r1),(t) r2),(b)c2((t2)^(r3),(t2)r4)))goto l]
	assembles['andifgoto ' c','r1','t r2','c2','r3',' t2 r4 ',' l];
instruction pattern SET(condition c,signedreg r1,regaddrimmediate rm, breg r,signed t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmp 'r1 ','t ' ' rm '\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern SETU(unsignedcondition c,unsignedreg r1,regaddrimmediate rm, breg r,unsigned t)
	means[r:= c((t)^(r1),(t) rm)]
	assembles['cmp 'r1 ','t ' ' rm '\n set'c ' ' r'\n sub 'r',1\n not 'r];
instruction pattern IFBOOL(label l,breg r1)
	means[ if( (int8)^(r1))goto l]
	assembles['test ' r1 ',' r1 '\n jnz near ' l];
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

instruction pattern TESTIN(reg r1,reg r2, breg r)
	means[ r:=AND((uint8)^(mem(r1 )) , <<( (uint8)1,^(r2)))]
	assembles['bt  [' r1 '],' r2 '\n setc 'r'\n not 'r'\n inc 'r];
instruction pattern BTS(reg r1,reg r2)
	means[(ref uint8)mem(r1 ):=OR((uint8)^(mem(r1 ) ), <<( (uint8)1,^(r2)))]
	assembles['bts [' r1 '],' r2];
instruction pattern REPMOVSD(countreg s,maddrmode m1,sourcereg si, destreg di)
	means[for (ref int32)m1:=0 to ^(s) step 1 do 
              (ref int32)mem(+(^(di),*(^((ref int32)m1),4))):=^((ref int32)mem(+(^(si),*(^((ref int32)m1),4))))
	]
	assembles[' inc ecx\n rep movsd'];  
instruction pattern REPMOVSB(countreg s,maddrmode m1,sourcereg si, destreg di)
	means[for (ref int32)m1:=0 to ^(s) step 1 do 
              (ref octet)mem(+(^(di),^((ref int32)m1))):=^((ref octet)mem(+(^(si),^((ref int32)m1))))
	]
	assembles[' inc ecx\n rep movsb'];
	

			
define(IA32codes,LOAD|MOVZXB|MOVSXB|MOVZXW|MOVSXW|MOVZXB2|
		CLEARREG|STORELIT|INC|
		RMLIT|RMR|RR|LEA|
		STOREWR|STORER|STOREBR|/* stores */
		
		DEC|IMULLIT|
		BIMUL|RLIT|RRM|RMRB|RR|DIV8|IDIV|fastBIDIV|BIDIV|UDIV
		|MOD2|MOD4|MOD8|MOD16| IMOD|UMOD|
		fastIMUL|
		Negate|NOTOP|MNegate|BTS|TESTIN|SHIFT|
		UINT8MAX|UINT8MIN|INT8MAX|INT8MIN|SELECT|
		PLANT|LITPUSH| MEMPUSH|
		SET|SETU|ToBYTE|ANDIFGOTO |IFLITGOTO|BIFLITGOTO|IFIN|IFGOTO
		|GOTO|FAIL|BOUND4|BOUND0|BOUND16
		|PLANTBCONST|PLANTWCONST|PLANTICONST|PLANTRCONST|PLANTSCONST
		|REPMOVSB|REPMOVSD |ADDUSB|SUBUSB|ADDSSB|SUBSSB|MULTSSB|MULTSSBAL )
/* these come last as they are a fallback for having no free registers */
define(lastIA32codes,	RPUSH| REFPUSH|SDEREF|SDEREFDOUBLEWORD/* pushes */
			|IFBOOL|SMLIT|SMRP|SADD|SMULIT|SMRADD|SOP|SMR|BSMR|/* stack ops */
                 	STOREWR|STORER|STOREBR|/* stores */
			STACKLOAD |REFPOP|MEMPOP|BPOP|BSPOP|BSPUSH|DMEMPUSH
                         |BPUSH|STACKSTORE|STACKWSTORE|STACKBSTORE|RPOP)


/* \end{verbatim} */

