/*
Opteron ILCG

Copyright(c) Iain Jackson, University of Glasgow
October 2003

\subsection{Declare ILCG Types}
\begin{verbatim}
*/

type octet=b;
type int8=b;
type uint8=b;

type halfword=w;
type int16=w;
type uint16=w;

type word=l;
type ieee32=s;
type int32=l;
type uint32=l;

type doubleword=q;
type int64=q;
type uint64=q;
type ieee64=l;

/*
\end{verbatim}
\subsection{Compiler Configuration}
\begin{verbatim}
*/

flag realLitSupported = 0;

/*
\end{verbatim}
\subsection{Register Declarations}
\begin{verbatim}
*/

/* Main registers in CPU */
register quadword RADX assembles ['%radx'];
alias register int64 RAX= RADX (0:63) assembles ['%rax'] ;
alias register int64 RDX= RADX (64:127) assembles ['%rdx'] ;
alias register int64 EADX = RADX(32:95) assembles [' ']; /* this is a pseudo register whose alignment is wrong but which should do the correct reservations */
register int64 RCX assembles['%rcx'];
register int64 RBX assembles['%rbx'];

register int64 RSI assembles['%rsi'];
register int64 RDI assembles['%rdi'];

reserved register int64 RBP assembles['%rbp'];
alias register int64 FP = RBP(0:63) assembles['%rbp'];

reserved register int64 RSP assembles['%rsp'];

register int64 R8 assembles ['%r8'];
register int64 R9 assembles ['%r9'];
register int64 R10 assembles ['%r10'];
register int64 R11 assembles ['%r11'];
register int64 R12 assembles ['%r12'];
register int64 R13 assembles ['%r13'];
register int64 R14 assembles ['%r14'];
register int64 R15 assembles ['%r15'];

/* Unsigned aliases of 64-bit registers */

alias register uint64 uRAX = RAX(0:63) assembles ['%rax'];
alias register uint64 uRBX = RBX(0:63) assembles ['%rbx'];
alias register uint64 uRCX = RCX(0:63) assembles ['%rcx'];
alias register uint64 uRDX = RDX(0:63) assembles ['%rdx'];

alias register uint64 uRSI = RSI(0:63) assembles ['%rsi'];
alias register uint64 uRDI = RDI(0:63) assembles ['%rdi'];

alias register uint64 uR8 = R8(0:63) assembles ['%r8'];
alias register uint64 uR9 = R9(0:63) assembles ['%r9'];
alias register uint64 uR10 = R10(0:63) assembles ['%r10'];
alias register uint64 uR11 = R11(0:63) assembles ['%r11'];
alias register uint64 uR12 = R12(0:63) assembles ['%r12'];
alias register uint64 uR13 = R13(0:63) assembles ['%r13'];
alias register uint64 uR14 = R14(0:63) assembles ['%r14'];
alias register uint64 uR15 = R15(0:63) assembles ['%r15'];

/* 32-bit registers */

alias register int32 EAX = RAX(0:31) assembles ['%eax'];
alias register int32 EBX = RBX(0:31) assembles ['%ebx'];
alias register int32 ECX = RCX(0:31) assembles ['%ecx'];
alias register int32 EDX = RDX(0:31) assembles ['%edx'];

alias register int32 R8D = R8(0:31) assembles ['%r8d'];
alias register int32 R9D = R9(0:31) assembles ['%r9d'];
alias register int32 R10D = R10(0:31) assembles ['%r10d'];
alias register int32 R11D = R11(0:31) assembles ['%r11d'];
alias register int32 R12D = R12(0:31) assembles ['%r12d'];
alias register int32 R13D = R13(0:31) assembles ['%r13d'];
alias register int32 R14D = R14(0:31) assembles ['%r14d'];
alias register int32 R15D = R15(0:31) assembles ['%r15d'];

alias register int32 ESI = RSI(0:31) assembles ['%esi'];
alias register int32 EDI = RDI(0:32) assembles ['%edi'];

/* 32-bit unsigned registers */

alias register uint32 uEAX = RAX(0:31) assembles ['%eax'];
alias register uint32 uEBX = RBX(0:31) assembles ['%ebx'];
alias register uint32 uECX = RCX(0:31) assembles ['%ecx'];
alias register uint32 uEDX = RDX(0:31) assembles ['%edx'];

alias register uint32 uR8D = R8(0:31) assembles ['%r8d'];
alias register uint32 uR9D = R9(0:31) assembles ['%r9d'];
alias register uint32 uR10D = R10(0:31) assembles ['%r10d'];
alias register uint32 uR11D = R11(0:31) assembles ['%r11d'];
alias register uint32 uR12D = R12(0:31) assembles ['%r12d'];
alias register uint32 uR13D = R13(0:31) assembles ['%r13d'];
alias register uint32 uR14D = R14(0:31) assembles ['%r14d'];
alias register uint32 uR15D = R15(0:31) assembles ['%r15d'];

alias register uint32 uESI = RSI(0:31) assembles ['%esi'];
alias register uint32 uEDI = RDI(0:31) assembles ['%edi'];

/* 16-bit registers */

alias register int16 AX = RAX(0:15) assembles ['%ax'];
alias register int16 BX = RBX(0:15) assembles ['%bx'];
alias register int16 CX = RCX(0:15) assembles ['%cx'];
alias register int16 DX = RDX(0:15) assembles ['%dx'];

alias register int16 R8W = R8(0:15) assembles ['%r8w'];
alias register int16 R9W = R9(0:15) assembles ['%r9w'];
alias register int16 R10W = R10(0:15) assembles ['%r10w'];
alias register int16 R11W = R11(0:15) assembles ['%r11w'];
alias register int16 R12W = R12(0:15) assembles ['%r12w'];
alias register int16 R13W = R13(0:15) assembles ['%r13w'];
alias register int16 R14W = R14(0:15) assembles ['%r14w'];
alias register int16 R15W = R15(0:15) assembles ['%r15w'];

/* 16-bit unsigned registers */

alias register uint16 uAX = RAX(0:15) assembles ['%ax'];
alias register uint16 uBX = RBX(0:15) assembles ['%bx'];
alias register uint16 uCX = RCX(0:15) assembles ['%cx'];
alias register uint16 uDX = RDX(0:15) assembles ['%dx'];

alias register uint16 uR8W = R8(0:15) assembles ['%r8w'];
alias register uint16 uR9W = R9(0:15) assembles ['%r9w'];
alias register uint16 uR10W = R10(0:15) assembles ['%r10w'];
alias register uint16 uR11W = R11(0:15) assembles ['%r11w'];
alias register uint16 uR12W = R12(0:15) assembles ['%r12w'];
alias register uint16 uR13W = R13(0:15) assembles ['%r13w'];
alias register uint16 uR14W = R14(0:15) assembles ['%r14w'];
alias register uint16 uR15W = R15(0:15) assembles ['%r15w'];

alias register halfword SI = RSI(0:15) assembles ['%si'];
alias register halfword DI = RDI(0:15) assembles ['%di'];

/* 8-bit registers */
/* treat 2 memory locations as dummy registers to speed
    transfer to and from fpu stack
 register int64 regutil0 assembles [' regutil0'];

 alias register int32 rui0 =regutil0(0:31)assembles['regutil0'];
 alias register int16 rui00= rui0(0:15) assembles['regutil0'];



 pattern rui means[rui0|regutil0|rui00];*/
alias register int8 AL = RAX(0:7) assembles ['%al'];
alias register int8 BL = RBX(0:7) assembles ['%bl'];
alias register int8 CL = RCX(0:7) assembles ['%cl'];
alias register int8 DL = RDX(0:7) assembles ['%dl'];

alias register int8 R8B = R8(0:7) assembles ['%r8b'];
alias register int8 R9B = R8(0:7) assembles ['%r9b'];
alias register int8 R10B = R10(0:7) assembles ['%r10b'];
alias register int8 R11B = R11(0:7) assembles ['%r11b'];
alias register int8 R12B = R12(0:7) assembles ['%r12b'];
alias register int8 R13B = R13(0:7) assembles ['%r13b'];
alias register int8 R14B = R14(0:7) assembles ['%r14b'];
alias register int8 R15B = R15(0:7) assembles ['%r15b'];

/* 8-bit unsigned registers */

alias register uint8 uAL = RAX(0:7) assembles ['%al'];
alias register uint8 uBL = RBX(0:7) assembles ['%bl'];
alias register uint8 uCL = RCX(0:7) assembles ['%cl'];
alias register uint8 uDL = RDX(0:7) assembles ['%dl'];

alias register uint8 uR8B = R8(0:7) assembles ['%r8b'];
alias register uint8 uR9B = R9(0:7) assembles ['%r9b'];
alias register uint8 uR10B = R10(0:7) assembles ['%r10b'];
alias register uint8 uR11B = R11(0:7) assembles ['%r11b'];
alias register uint8 uR12B = R12(0:7) assembles ['%r12b'];
alias register uint8 uR13B = R13(0:7) assembles ['%r13b'];
alias register uint8 uR14B = R14(0:7) assembles ['%r14b'];
alias register uint8 uR15B = R15(0:7) assembles ['%r15b'];

/* octet registers */

alias register octet oAL = RAX(0:7) assembles ['%al'];
alias register octet oBL = RBX(0:7) assembles ['%bl'];
alias register octet oCL = RCX(0:7) assembles ['%cl'];
alias register octet oDL = RDX(0:7) assembles ['%dl'];

alias register octet oR8B = R8(0:7) assembles ['%r8b'];
alias register octet oR9B = R8(0:7) assembles ['%r9b'];
alias register octet oR10B = R10(0:7) assembles ['%r10b'];
alias register octet oR11B = R11(0:7) assembles ['%r11b'];
alias register octet oR12B = R12(0:7) assembles ['%r12b'];
alias register octet oR13B = R13(0:7) assembles ['%r13b'];
alias register octet oR14B = R14(0:7) assembles ['%r14b'];
alias register octet oR15B = R15(0:7) assembles ['%r15b'];

register stack(4096)int64 mainSTACK assembles ['mainSTACK'];
alias register word wEAX = RAX(0:31)	assembles ['%eax'];
alias register word wEBX = RBX(0:31)	assembles ['%ebx'];
alias register word wECX = RCX(0:31)	assembles ['%ecx'];
alias register word wEDX = RDX(0:31)	assembles ['%edx'];
/*
\end{verbatim}
\subsection{Register Sets}
\begin{verbatim}
*/

/* 8-bit register sets */

pattern bsreg means [R8B|R9B|R10B|R11B|R12B|R13B|R14B|R15B|BL|AL|DL|CL];
pattern bureg means [uBL|uAL|uDL|uR8B|uR9B|uR10B|uR11B|uR12B|uR13B|uR14B|uR15B|uCL];
pattern boreg means [oBL|oAL|oDL|oR8B|oR9B|oR10B|oR11B|oR12B|oR13B|oR14B|oR15B|oCL];

pattern bacc means [AL];
pattern bdacc means [DL];
pattern ubacc means [uAL];
pattern ubdacc means [uDL];
pattern bnonacc means [BL|CL|DL|R8B|R9B|R10B|R11B|R12B|R13B|R14B|R15B];
pattern bireg means[ BL|DL|AL];
pattern breg means [bireg|bsreg|bnonacc|bureg|boreg|bacc];
pattern shcl means[CL];
pattern shocl means[oCL];
pattern shcx means[CX];
pattern shecx means[ECX];
pattern shiftcountreg means [shcl|shcx|shecx|shocl];

/* 16-bit register sets */

pattern hwsreg means [R8W|R9W|R10W|R11W|R12W|R13W|R14W|R15W|BX|CX|DX|AX];
pattern hwureg means [uR8W|uR9W|uR10W|uR11W|uR12W|uR13W|uR14W|uR15W|uBX|uCX|uDX|uAX];

pattern hwacc means [AX];
pattern hwdacc means [DX];
pattern uhwacc means [uAX];
pattern uhwdacc means [uDX];
pattern hwmodreg means [CX];
pattern hwnonacc means [BX|CX|DX|R8W|R9W|R10W|R11W|R12W|R13W|R14W|R15W];

pattern hwuntypedreg means [SI|DI];

pattern hwreg means [hwsreg|hwureg|hwdacc|uhwdacc|hwuntypedreg];

/* 32-bit register sets */

pattern wsreg means [EAX|EBX|EDX|ECX|R8D|R9D|R10D|R11D|R12D|R13D|R14D|R15D];
pattern dwreg means[wsreg];
pattern wureg means [uEBX|uEDX|uEAX|uECX|uR8D|uR9D|uR10D|uR11D|uR12D|uR13D|uR14D|uR15D];

pattern wacc means [EAX];
pattern wdacc means [EDX];
pattern uwacc means [uEAX];
pattern uwdacc means [uEDX];
pattern wmodreg means [ECX];
pattern wnonacc means [EBX|ECX|R8D|R9D|R10D|R11D|R12D|R13D|R14D|R15D|ESI];

pattern wuntypedreg means [ESI|EDI];

pattern wreg means [wsreg|wdacc|wacc|uwdacc|uwacc|wureg|wuntypedreg];

pattern int32reg means[wsreg|wacc];
/* 64-bit register sets */
pattern ireg means [RBX|RDI|RSI|  RAX|RDX|RCX|R8|R9|R10|R11|R12|R13|R14|R15];
pattern sreg means [RBX|RDI|RSI|RBP|RSP|RAX|RDX|RCX|R8|R9|R10|R11|R12|R13|R14|R15];
pattern ureg means [uRBX|uRDI|uRSI|uRDX|uRCX|uRAX|uR8|uR9|uR10|uR11|uR12|uR13|uR14|uR15];
pattern unonacc means[uRBX|uRDI|uRSI|uRCX|uR8|uR9|uR10|uR11|uR12|uR13|uR14|uR15];
pattern acc means [RAX];
pattern dacc means [RDX];
pattern uacc means [uRAX];
pattern udacc means [uRDX];
pattern rbase means [RBP];
pattern nonacc means [R8|R9|R10|R11|R12|R13|R14|R15|RCX|RBX|RSI];

pattern reg means [rbase|sreg|ureg|dacc|acc|udacc|uacc];

pattern countreg means [RCX];
pattern sourcereg means [RSI];
pattern destreg means [RDI];
pattern modreg means [RCX];

pattern ut32r 	means [wEAX|wEBX|wECX|wEDX];
pattern ut32	means[wreg|ut32r];
/* Global sets */
pattern anyreg means [breg|hwreg|wreg|reg|ut32r];
pattern signedreg means [bsreg|hwsreg|wsreg|sreg];
pattern unsignedreg means [bureg|hwureg|wureg|ureg];

pattern pushreg means [reg|hwreg]; /* directly pushable registers */

/* need to finish off the rest , consulting instructions */

/*
\end{verbatim}
\subsection{Operator Definition}
\begin{verbatim}
*/

operation add means + assembles ['add'];
operation and means AND assembles ['and'];
operation or means OR assembles ['or'];
operation xor means XOR assembles ['xor'];
operation sub means - assembles ['sub'];
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

/* operation groups */

pattern condition means[ne|ge|le|eq|gt|lt];
pattern unsignedcondition means[ne|ae|be|eq|ab|bel];
pattern operator means[add | sub|imul|and|or|xor];
pattern nonmultoperator means[add|sub|and|or|xor];
pattern saddoperator means[add|imul|and|or|xor];
pattern shiftop means [shiftleft|shiftright];

/*
\end{verbatim}
\subsection{Data Formats}
\begin{verbatim}
*/

pattern unsigned means [uint64|uint32|uint16|uint8];
pattern signed means [int64|int32|int16|int8];
pattern int means [signed|unsigned];

pattern double means [ieee64];
pattern float means [ieee32];
pattern real means [double|float];

pattern word64 means [int64|uint64|doubleword];
pattern word32 means [int32|uint32|word];
pattern word16 means [int16|uint16|halfword];
pattern byte means [uint8|int8|octet];

pattern wordupto64 means [byte|word16|word32|word64];

pattern longint means [int64|uint64];
pattern hiint means [int64|int32|int16];

pattern two(type t) means [2] assembles ['2'];
pattern four(type t) means [4] assembles ['4'];
pattern eight(type t) means [8] assembles ['8'];

pattern scale means [two|four|eight];

/*
\end{verbatim}
\subsection{Addressing Forms}
\begin{verbatim}
*/

pattern labelf(label l)
	means [l]
	assembles [l];

pattern barelab(label l)
	means [l]
	assembles [l];

pattern typedbarelab(barelab l, longint t)
	means[(t)l]
	assembles[l];

pattern tbarelab means [barelab|typedbarelab];

pattern labelconstf(tbarelab l, signed s)
	means [+(l,const s)]
	assembles [l '+' s];


pattern constf(signed s)
	means [const s]
	assembles [s];

/*
Not in GAS file, researching

pattern lconstf means [labelf|constf];
*/

pattern offset means [constf|barelab|labelconstf];

pattern regindirf(reg r)
	means [^(r)]
	assembles ['('r')'];

/*
scaled section not in gas, checking

pattern simplescaled(reg r1, scale s)
	means [*(^(r1),s)]
	assembles [r1'*'s];

pattern negcompscaled(reg r1, scale s, offset o)
	means [*(-(^(r1),o),s)]
	assembles [r1 '*'s'-(' s'*'o')'];

pattern compscaled(reg r1, scale s, offset o)
	means [*(+(^(r1),o),s)]
	assembles [r1 '*'s'+(' s'*'o')'];

pattern scaled means [compscaled|negcompscaled|simplescaled];

*/

pattern baseminusoffsetf(reg r, offset s )
	means[-(^(r),s)]
	assembles['- 's'('r')'];

pattern baseplusoffsetf(reg r, offset s )
	means[+(^(r),s)]
	assembles[s'('r')'];

pattern scaledIndexPlusOffsetf(reg r1, scale s, offset offs)
	means[+(*(^(r1),s),offs)]
	assembles[offs'(,'r1','s')'];

address pattern basePlusScaledIndexf(reg r1, ireg r2, scale s)
	means[+(^(r1),*(^(r2),s))]
        assembles['0('r1','r2','s')'];

address pattern basePlusScaledIndexPlusOffsetf(reg r1, ireg r2, scale s, offset off,longint t)
	means[+((t)+(^(r1),off),*(^(r2),s))]
        assembles[off'('r1','r2','s')'];

address pattern basePlusIndexPlusOffsetf(reg r1,ireg r2,offset off)
	means[+(^(r1),+(^(r2),  off))]
        assembles[off'('r1','r2'  )'];


address pattern basePlusIndexf(reg r1,ireg r2)
	means [+(^(r1),^(r2))]
	assembles['0('r1','r2' )'];

pattern directf(unsigned s)
	means[const s]
	assembles[s'(,1)'];

pattern udirectf(int s)
	means[const s]
	assembles[s'(,1)'];

/*
\end{verbatim}
\subsection{Choice Of Effective Address}
\begin{verbatim}
*/

pattern uncasteaform means[
	directf|
	udirectf|
	labelf|
	labelconstf|
	scaledIndexPlusOffsetf|
	basePlusScaledIndexPlusOffsetf|
	baseplusoffsetf|
	basePlusIndexPlusOffsetf|
	basePlusScaledIndexf|
	scaledIndexPlusOffsetf|
	baseminusoffsetf|
	basePlusIndexf
	|regindirf
];

pattern leaform means[
	scaledIndexPlusOffsetf|
	basePlusScaledIndexPlusOffsetf|
	baseplusoffsetf|
	basePlusIndexPlusOffsetf|
	basePlusScaledIndexf|
	scaledIndexPlusOffsetf|
	baseminusoffsetf|
/*	basePlusIndexf| 
	constf|*/
	barelab
];


/* for allowing an address expression to be cast to an integer */

pattern eaform(uncasteaform f, longint t)
	means [(t)f]
	assembles [f];

/*
\end{verbatim}
\subsection{Memory Address Formats}
\begin{verbatim}
*/

pattern addrform means [eaform|regindirf];

/*
\end{verbatim}
The address patterns used in other instructions
\begin{verbatim}
*/

pattern innermaddrmode(addrform f)
	means [mem(f)]
	assembles [f];

pattern maddrmode means[innermaddrmode];
pattern wsmaddrmode
	means[maddrmode|wsreg];
/*pattern ruimode means[rui];*/
pattern immediate(signed s)
	means [const s]
	assembles ['$'s];

pattern intimmediate(int s)
	means [const s]
	assembles ['$'s];

pattern jindirmode(maddrmode m)
	means[m]
	assembles['*' m];

pattern jumpmode
	means [barelab|jindirmode];

pattern addrmode
	means [maddrmode|anyreg];

pattern baddrmode
	means [maddrmode|breg];

pattern baccregmode
	means [maddrmode|bacc];

pattern bnonaccregmode
	means [maddrmode|bnonacc];

pattern hwaddrmode
	means [maddrmode|hwreg];

pattern waddrmode
	means [maddrmode|wreg];

pattern dwaddrmode
	means [maddrmode|reg];

pattern regshift(shiftcountreg r)
	means [^(r)]
	assembles ['%cl'];

pattern shiftcount
	means [immediate|regshift];

pattern regaddrop(addrmode r)
	means [^(r)]
	assembles [r];

/*pattern addrform means[eaform|regindirf];*/
pattern riscaddr means[addrform];
pattern memrisc(riscaddr r)
	means[mem(r)]
	assembles[r];
pattern mriscmode means[memrisc];
pattern regaddrimmediate means [intimmediate|maddrmode|regaddrop];

/*
\end{verbatim}
\subsection{Instuction Patterns for the AMD Opteron}
\subsubsection{Stack Operations}
\begin{verbatim}
*/

instruction pattern STACKDWSTORE(reg r1)
	means [(ref int64)mem((int64)POP(mainSTACK)) := ^(r1)]
	assembles ['xchgq (%rsp),'r1'\n pop ('r1')\n'];

instruction pattern STACKWSTORE(wreg r1)
	means [(ref int32)mem((int64)POP(mainSTACK)) := ^(r1)]
	assembles ['xchgq (%rsp),%rsi\n movl 'r1',(%rsi)\n pop %rsi'];

instruction pattern STACKHWSTORE(hwreg r1)
	means [(ref halfword)mem((int64)POP(mainSTACK)) := ^(r1)]
	assembles ['xchgq (%rsp),%rsi\n movw 'r1',(%rsi)\n pop %rsi'];

instruction pattern STACKBSTORE(breg r1)
	means [(ref octet)mem((int64)POP(mainSTACK)) := ^(r1)]
	assembles ['xchgq (%rsp),%rsi\n movb 'r1',(%rsi)\n pop %rsi'];

instruction pattern SMLIT( nonmultoperator op, offset s)
	means [ PUSH(mainSTACK, (int64)op( (int64)POP(mainSTACK), s))]
	assembles [op'q $'s',(%rsp)'];

instruction pattern SMULIT(offset s)
	means [ PUSH(mainSTACK, (int64)*((int64)POP(mainSTACK), s))]
	assembles ['xchgl %rax,(%rsp)\n imul $'s',%rax\n xchgq %rax,(%rsp)'];

instruction pattern SADD( saddoperator op)
	means [PUSH(mainSTACK, (longint)+((int64)POP(mainSTACK),(int64)POP(mainSTACK)))]
	assembles ['xchgq %rax,(%rsp)\n addq %rax, 8(%rsp)\n pop %rax'];

instruction pattern SOP(saddoperator op,longint t)
	means [PUSH(mainSTACK, (t)op((t)POP(mainSTACK),(t)POP(mainSTACK)))]
	assembles ['xchgq %rax,(%rsp)\n 'op'q %rax, 8(%rsp)\n movq %rax,8(%rsp)\n pop %rax'];

instruction pattern SMR( nonmultoperator op, reg r1)
	means [PUSH(mainSTACK, (int64)op((int64)POP(mainSTACK),^(r1)))]
 	assembles [op 'q 'r1',(%rsp)'];

instruction pattern SMRSHIFT( shiftop op, shiftcountreg r1)
	means [PUSH(mainSTACK, (int64)op((int64)POP(mainSTACK),^(r1)))]
	assembles ['xchgq %rax, (%rsp)\n sa'op'q %cl,%rax\n xhcgl %eax,(%rsp)'];

instruction pattern BSMR( nonmultoperator op, breg r1)
	means [PUSH(mainSTACK, (octet)op((octet)POP(mainSTACK),^(r1)))]
	assembles [op 'b 'r1',(%rsp)'];

instruction pattern SMRADD(reg r1)
	means [ r1 := (int64)+((int64)POP(mainSTACK), ^(r1))]
	assembles ['addq (%rsp),'r1'\n addq $8,%rsp'];

instruction pattern SMRP( nonmultoperator op, reg r1, longint t)
	means [PUSH(mainSTACK, (ref t)op( (t)POP(mainSTACK),^(r1)))]
	assembles [op 'q 'r1',(%rsp)'];

instruction pattern RPUSH(reg r,type t)
	means [PUSH(mainSTACK,(t)^(r))]
	assembles['push ' r];

instruction pattern HWPUSH(hwreg r,type t)
	means [PUSH(mainSTACK,(t)^(r))]
	assembles['push $0\n movw 'r',(%rsp)'];



/* RPUSH E deemed unnecessary due to this all being in 64-bit arithmetic */

instruction pattern RPOP(reg r, word64 t)
	means [(ref t) r := (t)POP(mainSTACK)]
	assembles ['pop 'r];



instruction pattern HWPOP(hwreg r, word16 t)
	means [(ref t) r := (t)POP(mainSTACK)]
	assembles ['popw 'r];

instruction pattern BPUSH(bureg r)
	means [PUSH(mainSTACK,^(r))]
	assembles ['push $0\n movb 'r',(%rsp)'];

instruction pattern BSPUSH(baddrmode r)
	means [PUSH(mainSTACK,(int8)^(r))]
	assembles ['push %rsi\n movsbl 'r',%rsi\n xchgq %rsi,(%rsp)'];

instruction pattern BSPOP(bsreg r)
	means [r:=(int8)POP(mainSTACK)]
	assembles['movb (%rsp),'r'\n addq $8,%rsp'];

instruction pattern BPOP(bureg r)
	means [r:=(uint8)POP(mainSTACK)]
	assembles['movb (%rsp),'r'\n addq $8,%rsp'];

instruction pattern REFPOP(addrmode r, type t, type t2)
	means [(ref ref t) r := (ref t2) POP(mainSTACK)]
	assembles ['pop 'r];
instruction pattern REFPOPD(addrmode r, type t)
	means [(ref ref t) r := (doubleword) POP(mainSTACK)]
	assembles ['pop 'r];
instruction pattern MEMPOP(maddrmode m,word64 t)
	means [(ref t)m:=(t)POP(mainSTACK)]
	assembles['pop 'm];

instruction pattern LITPUSH(offset s)
	means [PUSH(mainSTACK,s)]
	assembles ['pushq  $'s];

instruction pattern MEMPUSH(maddrmode m)
	means [PUSH(mainSTACK,(doubleword)^(m))]
	assembles['push 'm];

/* DMEMPUSH Unnecessary since all in 64-bit arithmetic */

instruction pattern STACKLOAD(word64 t,word64 t2)
	means [PUSH(mainSTACK,^((ref t)mem((t2)POP(mainSTACK))))]
	assembles ['xchgq %rax,(%rsp)\n movq (%rax),%rax\n xchgq %rax,(%rsp)'];

instruction pattern REFPUSH(maddrmode m, type t)
	means [PUSH(mainSTACK,(ref t)^(m))]
	assembles ['push' ' 'm];

instruction pattern SDEREF(word64 t)
	means [PUSH(mainSTACK,(t)^(mem((t)POP(mainSTACK))))]
	assembles ['xchgq %rsi,(%rsp)\nmovq (%rsi),%rsi\n xchgq %rsi,(%rsp)'];

/* SDEREFDOUBLEW not necessary since all n 64-bit arithmetic */

define(STACKPUSH,LITPUSH|
MEMPUSH|
REFPUSH|
SDEREF|
HWPUSH |
RPUSH)

define(STACKSTORE,STACKDWSTORE|
STACKWSTORE|
STACKHWSTORE|
STACKBSTORE|
STACKLOAD|
REFPOP|
REFPOPD|
MEMPOP|
BPOP|
BSPOP|
BSPUSH|
BPUSH|
RPOP|
SMRSHIFT|
HWPOP)

define(STACKOPS,SMLIT|
SMRP|
SADD|
SMULIT|
SMRADD|
SOP|
SMR|
BSMR)

/*
\end{verbatim}
\subsubsection{Data Movement to and from Registers}
\begin{verbatim}
*/

pattern incfloat means[word32|ieee32];
pattern regword means[wordupto64|incfloat];
instruction pattern SELECT(anyreg r1, anyreg r2, anyreg r3,anyreg r4, regword t)
	means [(ref t) r1 := OR(AND((t)^(r1), ^(r2)),AND((t)^(r3),NOT(^(r4))))]
	assembles ['and 'r2 ',' r1 '\n'
     'not 'r4                     '\n'
     'and 'r3 ',' ' 'r4 '\n'
     'or 'r4      ','     r1];
instruction pattern LOAD(maddrmode rm, anyreg r1, wordupto64 t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['mov't' 'rm',' r1];
/*instruction pattern LOADrui(ruimode rm, anyreg r1, wordupto64 t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['mov't' 'rm',' r1];*/
/* instructions for extending to 64-bits */

pattern bit64int means[uint64|int64];
pattern bit64intreg means[sreg|ureg];
instruction pattern DWMOVZXB(bit64intreg r1, baddrmode rm,bit64int t)
	means [r1:= (t)EXTEND((uint8)^(rm))]
	assembles['movzbq ' rm ','r1];


instruction pattern DWMOVSXB(sreg r1, baddrmode rm)
	means [r1:=(int64)EXTEND((int8)^(rm))]
	assembles ['movsbq 'rm','r1];

instruction pattern DWMOVZXHW(bit64intreg r1, hwaddrmode rm,bit64int t)
	means [r1 := (t)EXTEND((uint16)^(rm))]
	assembles ['movzwq 'rm','r1];


instruction pattern DWMOVSXHW(sreg r1, hwaddrmode rm)
	means [r1 := (int64)EXTEND((int16)^(rm))]
	assembles ['movswq 'rm','r1];

/* There is no instruction to zero extend to 64-bits since upper 32-bits is always clear */


instruction pattern DWMOVZXW(bit64intreg r1, waddrmode rm,bit64int t)
	means [r1 := (t)EXTEND((uint32)^(rm))]
	assembles ['movl 'rm','r1];

instruction pattern CLTQ( acc r1,wacc rm)
	means [r1 := (int64)EXTEND((int32)^(rm))]
	assembles['cltq'];

instruction pattern DWMOVSXW(sreg r1, wsmaddrmode rm)
	means [r1 := (int64)EXTEND((int32)^(rm))]
	assembles ['movslq 'rm','r1];

/* instructions for extending to 32-bits */
pattern bit32intreg means[wureg|wsreg];
pattern bit32int means[int32|uint32];

instruction pattern WMOVZXB(bit32intreg r1, baddrmode rm, bit32int t)
	means [r1 := (t)EXTEND((uint8)^(rm))]
	assembles ['movzbl 'rm','r1];

instruction pattern WMOVSXB(wsreg r1, baddrmode rm)
	means [r1 := (int32)EXTEND((int8)^(rm))]
	assembles ['movsbl 'rm','r1];

instruction pattern WMOVZXHW(bit32intreg r1, hwaddrmode rm,bit32int t)
	means [r1 := (t)EXTEND((uint16)^(rm))]
	assembles ['movzwl 'rm','r1];

instruction pattern WMOVSXHW(wsreg r1, hwaddrmode rm)
	means [r1 := (int32)EXTEND((int16)^(rm))]
	assembles ['movswl 'rm','r1];

/* instructions for extending to 16-bits */
pattern bit16intreg means[hwureg|hwsreg];
pattern bit16int means [uint16|int16];


instruction pattern HWMOVZXB(bit16intreg r1, baddrmode rm,bit16int t)
	means [r1 := (uint16)EXTEND((octet)^(rm))]
	assembles ['movzbw 'rm','r1];

instruction pattern HWMOVSXB(hwsreg r1, baddrmode rm)
	means [r1 := (int16)EXTEND((int8)^(rm))]
	assembles ['movsbw 'rm','r1];

define(MOVX,CLTQ|
HWMOVSXB|
HWMOVZXB|
WMOVSXB|
WMOVZXB|
WMOVSXHW|
WMOVZXHW|
DWMOVSXB|
DWMOVZXB|
DWMOVSXHW|
DWMOVZXHW|
DWMOVSXW|
DWMOVZXW|
SELECT)

/* instructions for storing a register to memory */

instruction pattern STOREB(maddrmode rm, breg r1, byte t)
	means [(ref octet) rm := ^(r1)]
	assembles ['movb 'r1','rm];

instruction pattern STOREHW(maddrmode rm, hwreg r1, word16 t)
	means [(ref t) rm := ^(r1)]
	assembles ['movw 'r1',' rm];

instruction pattern STOREW(waddrmode rm, wreg r1, word32 t)
	means [(ref t) rm := ^(r1)]
	assembles ['movl 'r1',' rm];
 

instruction pattern STOREREF(maddrmode rm, wreg r1,   type t)
	means [(ref ref t) rm := ^(r1)]
	assembles ['movl 'r1',' rm];

instruction pattern STOREDW(maddrmode rm, reg r1, word64 t)
	means [(ref t) rm := ^(r1)]
	assembles ['movq 'r1',' rm];
pattern typeupto32 means[int32|int16|int8|uint8|uint16|uint32];

instruction pattern STORELIT(addrmode rm, typeupto32 t, int s)
	means [(ref t) rm := (t)const s]
	assembles ['mov't' $'s','rm];
instruction pattern EAXStore( wacc r1,wreg r2)
	means[r2 := ^(r1)]
	assembles['movl 'r1','r2];
define(STORE,STORELIT|
STOREB|
STOREHW|
/*EAXStore|*/STOREW|
STOREDW|
STOREREF )

instruction pattern CLEARREG(reg rm, type t, int s)
	means [(ref t) rm := (t)0]
	assembles ['xor 'rm','rm];

define(CLEAR,CLEARREG)

/*
\end{verbatim}
\subsubsection{Register Arithmetic}
\begin{verbatim}
*/

/* Ports of existing operations from i386 gas syntax file */

/* Increment / Decrement Operations */

instruction pattern INC(addrmode rm, int t)
	means [(ref t)rm := +((t)^(rm),1)]
	assembles ['inc't' 'rm];

instruction pattern DEC(addrmode rm, int t)
	means [(ref t)rm := -((t)^(rm),1)]
	assembles ['dec't' 'rm];

/* Shift operation */

instruction pattern SHIFT(shiftop op, shiftcount s, anyreg r, type t)
	means [ r := op(^(r),s)]
	assembles ['sa'op' 's','r];

/* Basic Operations */

instruction pattern RMLIT(nonmultoperator op, addrmode rm, type t, offset sm)
	means [(ref t) rm := op(^(rm),(t)sm)]
	assembles [op t' '  ' $'sm','rm];

instruction pattern RMR(nonmultoperator op, maddrmode rm, anyreg r1, wordupto64 t)
	means [(ref t) rm := op((t)^(rm),(t)^(r1))]
	assembles [op t' 'r1','rm];

instruction pattern RMRB(nonmultoperator op, addrmode rm, breg r1, byte t)
	means [(ref t) rm := op((t)^(rm),(t)^(r1))]
	assembles [op t' 'r1','rm];

instruction pattern RRINT64(operator op, reg r1, reg r2)
	means [r1 := (int64)op((int64)^(r1),(int64)^(r2))]
	assembles [op 'q 'r2','r1];

instruction pattern RRINT32(operator op, wreg r1, wreg r2)
	means [r1 := (int32)op((int32)^(r1),(int32)^(r2))]
	assembles[op 'l 'r2','r1];

instruction pattern RR(nonmultoperator op, anyreg r1, anyreg r2, int t)
	means [r1 := (t)op((t)^((ref t)r1),(t)^((ref t)r2))]
	assembles [op t' 'r2','r1];

instruction pattern RRM(operator op, pushreg r1, maddrmode rm, int t)
	means [r1 := (t)op((t)^(r1),(t)^(rm))]
	assembles [op t' 'rm','r1];

define(BASICOPS,INC|
DEC|
SHIFT|
RMLIT|
RMR|
RMRB|
RRM|
RRINT64|
RRINT32|
RR)

/* Multiply and Division Operations */

/* signed division */

instruction pattern fastBIDIV(bacc r1, bnonaccregmode r2)
	means [r1 := div((int8)^(r1),(int8)^(r2))]
	assembles['movsbw 'r1',%ax\n idiv 'r2];

instruction pattern BIDIV(bacc r1, bnonaccregmode r2, baccregmode r3)
	means [r3 := div((int8)^(r1),(int8)^(r2))]
	assembles ['movsbw 'r1',%ax\n idiv 'r2'\n mov %al,'r3];

instruction pattern IDIV64(acc r1,modreg r2)
   	means[PUSH(mainSTACK,div((int64)^(r1),^( r2))) ]
	assembles['push %rdx\n xor %rdx,%rdx\n idiv   ' r2 '\n xchgq %rax,(%rsp)\n xchgq %rax,%rdx'];
pattern qacc means[EADX];
pattern acc32 means[EAX];
instruction pattern CDQ(qacc r1,acc32 r2)
	means[r1:=EXTEND(^(r2))]
	assembles['cdq'];
instruction pattern IDIV(acc32 r1, qacc r2, wnonacc r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['idiv 'r3];
instruction pattern IDIV2(wnonacc r1, wnonacc r2, wnonacc r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['push %rdx\n push %rax\n movl 'r2',%eax \n cdq  \n idiv 'r3'\n movl %eax,'r1'\n pop %rax\n pop %rdx'];
instruction pattern IDIV3(acc32 r1, wnonacc r2, wnonacc r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['push %rdx\n   movl 'r2',%eax \n cdq  \n idiv 'r3'\n    pop %rdx'];


define(SDIV,fastBIDIV|
BIDIV|
IDIV64|
CDQ|
IDIV|
IDIV2|
IDIV3)

/* Modulus Operations */

instruction pattern IMOD64(acc r1, dacc r2,nonacc r3)
	means [r2:= (int64)MOD(^(r1),^(r3))]
	assembles ['cltd \n idiv 'r3];

instruction pattern UMOD64(uacc r1, udacc r2,unonacc r3)
	means [r2:= (uint64)MOD(^(r1),^(r3))]
	assembles ['cltd \n div 'r3];

instruction pattern IMOD32(wacc r1, wdacc r2, wnonacc r3)
       means [r2:= (int32)MOD(^(r1),^(r3))]
	assembles ['cltd \n idiv 'r3];
instruction pattern UMOD32(uwacc r1, uwdacc r2, wureg r3)
       means [r2:= (uint32)MOD(^(r1),^(r3))]
	assembles ['cltd \n div 'r3];

define(MODOPS,IMOD64|
UMOD64|
IMOD32|
UMOD32)








/* unsigned division */

instruction pattern UDIV64(uacc r1, udacc r2,unonacc r3)
	means [r2:= (uint64)div(^(r1),^(r3))]
	assembles ['xorq %rdx,%rdx \n div 'r3'\n movq 'r1','r2];

instruction pattern UDIV32(uwacc r1, uwdacc r2, wureg r3)
       means [r2:= (uint32)div(^(r1),^(r3))]
       assembles ['xorl %edx,%edx \n div 'r3'\n movl 'r1','r2];

instruction pattern UDIV16(uhwacc r1, uhwdacc r2, hwureg r3)
       means [r2:= (uint16)div(^(r1),^(r3))]
       assembles ['xorw %dx,%dx \n div 'r3'\n movw 'r1','r2];

instruction pattern UDIV8(bacc r1, bnonaccregmode r2)
	means[(uint8) r1 := div((uint8)^(r1),^(r2))]
	assembles['movzxbw %al,%ax\n div 'r2];

define(UDIV,UDIV64|
UDIV32|
UDIV16|
UDIV8)

/* signed multiplication */

instruction pattern fastIMUL(acc a, dacc d)
	means [(ref int64)a := *((int64)^(a),^(d))]
	assembles ['imul %rdx'];

instruction pattern fastIMULW(wacc a, wdacc d)
	means [(ref int32)a := *((int32)^(a),^(d))]
	assembles ['imul %edx'];

instruction pattern fastIMULHW(hwacc a, hwdacc d)
	means [(ref int16)a := *((int16)^(a),^(d))]
	assembles ['imul %dx'];

instruction pattern BIMUL(bacc r1, bnonacc r2)
	means [r2 := *((int8)^(r1),(int8)^(r2))]
	assembles ['imul 'r2'\n movb %al,'r2];

instruction pattern IMULLIT(pushreg r1, addrmode rm, signed s)
	means [(ref int64)r1 := *(^(rm),const s)]
	assembles ['imulq $'s','rm','r1];

define(SMUL,IMULLIT|
fastIMUL|
fastIMULW|
fastIMULHW|
BIMUL|
IMULLIT)

/* Unsigned multiplication */

instruction pattern fastMUL(uacc a, udacc d)
	means [(ref uint64)a := *((uint64)^(a),^(d))]
	assembles ['mul %rdx'];

instruction pattern fastMULW(uwacc a, wdacc d)
	means [(ref uint32)a := *((uint32)^(a),^(d))]
	assembles ['mul %edx'];

instruction pattern fastMULHW(uhwacc a, uhwdacc d)
	means [(ref uint16)a := *((uint16)^(a),(uint16)^(d))]
	assembles ['mul %dx'];

instruction pattern BMUL(ubacc r1, bureg r2)
	means [r2 := *((uint8)^(r1),(uint8)^(r2))]
	assembles ['mul 'r2'\n movb %al,'r2];

define(UMUL,fastMUL|
fastMULW|
fastMULHW|
BMUL)

/* Load Effective Address */

instruction pattern LEA(reg r1, leaform ea)
	means [r1:=ea]
	assembles ['leaq 'ea','r1];

/* Negation/NOT Unary Opterators */

instruction pattern Negate(anyreg r1, type t)
	means [(ref t)r1 := -((t)0,(t)^(r1))]
	assembles ['neg't' 'r1];

instruction pattern MNegate(anyreg r1, type t)
	means [(ref t)r1 := *((t)-1,(t)^(r1))]
	assembles ['neg't' 'r1];

instruction pattern NOTOP(addrmode rm, type t)
	means [(ref t)rm := NOT((t)^(rm))]
	assembles ['not't' 'rm];

define(NOTs,Negate|MNegate|NOTOP)

/* Register Saturated Arithmetic */

instruction pattern ADDUSB(addrmode fm, bureg r1, bureg rm)
	means [ rm := +:((uint8)^(rm),^(r1))]
	assembles ['addb 'r1', 'rm'\n'
		   'jnc 0f\n'
		   'movb $255,'rm'\n'
		   '0:\n'
		   'nop'];

instruction pattern ADDSSB(addrmode fm, bsreg r1, bsreg rm)
	means [ rm := +:((int8)^(rm),^(r1))]
	assembles ['addb 'r1', 'rm'\n'
		   'jno 0f\n'
		   'jg 1f\n'
		   'movb $-128,'rm'\n'
		   'jng  0f\n'
		   '1:movb $127,'rm'\n'
		   '0:nop\n'
		   'nop'];

instruction pattern SUBUSB(addrmode fm, bureg r1, bureg rm)
	means [  rm := -:((uint8)^(rm),^(r1))]
	assembles ['subb 'r1', 'rm'\n'
		   'jnc 0f\n'
		   'xor 'rm','rm'\n'
		   '0:\n'
		   'nop'];

instruction pattern SUBSSB(addrmode fm, bsreg r1, bsreg rm)
	means [ rm := -:((int8)^(rm),^(r1))]
	assembles ['subb 'r1', 'rm'\n'
		   'jno 0f\n'
		   'jg 1f\n'
		   'movb  $-128,'rm'\n'
		   'jng 0f\n'
		   '1:movb $127,'rm'\n'
		   '0:nop\n'
		   'nop'];

instruction pattern MULTSSBAL(bacc r1, bnonacc r2)
	means [r1 := *:(^(r1),^(r2))]
	assembles ['imul 'r2'\n'
		   'shr  $7,%ax'];

instruction pattern MULTSSB(breg r1, bnonacc r2)
	means [r2 := *:(^(r2),^(r1))]
	assembles ['push %ax\n'
		   'mov %al,'r1'\n'
		   'imul 'r2'\n'
		   'shr $7, %ax\n'
		   'mov 'r2',%al\n'
		   'pop %ax'];


define(SATOPS,ADDUSB|
ADDSSB|
SUBUSB|
SUBSSB|
MULTSSBAL|
MULTSSB)
/* Maximum and Minimum Operations */
instruction pattern INTMAXa(ireg r1,ireg r2, type t)
	means[ (ref t)r1:=MAX((t)^(r1),(t)^(r2))]
	assembles['cmp 'r1','r2'\n cmovgl 'r2','r1];
instruction pattern INTMINa(ireg r1,ireg r2, type t)
  	means[(ref t) r1:=MIN((t)^(r1),(t)^(r2))]
	assembles['cmp 'r1','r2'\n  cmovll 'r2','r1];

instruction pattern UINT8MAX(bureg r1,bureg r2)
        means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n ja 1f\n mov 'r2','r1'\n1:#uint8max'];

instruction pattern UINT8MIN(bureg r1,bureg r2)
        means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jnb 1f\n mov 'r2','r1'\n1:#uint8min'];
 
	instruction pattern INT8MAX(breg r1,breg r2)
        means[ (ref int8)r1:=MAX((int8)^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n jg 0f\n mov 'r2','r1'\n0:#int8max'];

instruction pattern INT8MIN(bsreg r1,bsreg r2)
        means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r2','r1'\n jl 1f\n mov 'r2','r1'\n1:#int8min'];
define(MAXMIN,
INTMINa|
INTMAXa|
UINT8MIN|
INT8MAX|
UINT8MAX|
INT8MIN)

/* Putting in constants */

instruction pattern PLANTLABEL(label l)
	means [l]
	assembles [l':'];

instruction pattern PLANTRCONST(double r, type t)
	means [loc (t)r]
	assembles ['.double ' r];

instruction pattern PLANTICONST(longint r, type t)
	means [loc (t) r]
	assembles ['.long ' r];

instruction pattern PLANTSCONST(float r, type t)
	means [loc (t) r]
	assembles ['.float ' r];

instruction pattern PLANTBCONST(byte r, type t)
	means [loc (t) r]
	assembles ['.byte ' r];

instruction pattern PLANTWCONST(word16 r, type t)
	means [loc (t) r]
	assembles ['.short ' r];

instruction pattern PLANTDWCONST(word32 r, type t)
	means [loc (t) r]
	assembles ['.int ' r];

instruction pattern PLANTQWCONST(word64 r, type t)
	means [loc (t) r]
	assembles ['.quad ' r];
	/* NOTE !!! the order is important below, start with large and work down to small */
define(PLANT,PLANTLABEL|
PLANTRCONST|
PLANTSCONST|
PLANTQWCONST|
PLANTDWCONST|
PLANTWCONST|
PLANTBCONST)

/*
\end{verbatim}
\subsubsection{Control Transfers and Tests}
\begin{verbatim}
*/

instruction pattern FAIL(int i)
	means [interrupt i]
	assembles ['int $'i];

instruction pattern GOTO(jumpmode l)
	means [goto l]
	assembles ['jmp 'l];

instruction pattern SETI(condition c, ireg r1, ireg rm, breg r, signed t)
	means [ r := c((t)^(r1),(t) ^(rm))]
	assembles ['cmpq'  ' 'rm ',' ' ' r1 '\n set'c ' ' r'\n subb $1, 'r'\n not ' r];
instruction pattern SETW(condition c, wsreg r1, wsreg rm, breg r, signed t)
	means [ r := c( ^(r1),(t)^( rm))]
	assembles ['cmpl'  ' 'rm ',' ' ' r1 '\n set'c ' ' r'\n subb $1, 'r'\n not ' r];
define(SETS,SETI|SETW)
instruction pattern SETU(unsignedcondition c, unsignedreg r1, regaddrimmediate rm, breg r, unsigned t)
	means [r := c((t)^(r1),(t)rm)]
	assembles ['cmp't ' 'rm ',' ' ' r1 '\n set'c ' ' r'\n subb $1, 'r'\n not ' r];
instruction pattern IFGOTO(label l,signedreg r1, immediate r2,condition c,signed t,int b)
	means[if((int8)c((t) ^(r1),(t) r2))goto l]
	assembles['cmp't' ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFGOTOR(label l,ireg r1, ireg r2,condition c,signed t,int b)
	means[if((int8)c((t) ^(r1),(t) r2))goto l]
	assembles['cmpq '     r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFBOOL(label l, breg r1)
	means [ if ((int8)^(r1))goto l]
	assembles ['test 'r1','r1 '\n jnz 'l];
instruction pattern IFBOOLW(label l, wreg r1)
	means [ if ( ^(r1))goto l]
	assembles ['test 'r1','r1 '\n jnz 'l];
instruction pattern BOUND0(reg r1, reg r2)
	means [if(OR(<(^(r2),^((ref int64)mem(^(r1)))), >(^(r2),^((ref int64)mem(+(^(r1),4))))))interrupt 5]
	assembles ['bound ' r2 ',(' r1 ')'];

instruction pattern BOUND4(reg r1,reg r2)
	means[if(OR(<( ^(r2),^((ref int64)mem(+(^(r1),4)))),>(^(r2),^((ref int64)mem(+(^(r1), 8))))))interrupt 5]
 	assembles['bound ' r2 ',4(' r1 ')'];

instruction pattern BOUND16(reg r1,reg r2)
	means[if(OR(<( ^(r2),^((ref int64)mem(+(^(r1),16)))),>(^(r2),^((ref int64)mem(+(^(r1), 20))))))interrupt 5]
 	assembles['bound ' r2 ',16(' r1 ')'];

instruction pattern IFIN(reg r1,reg r2, label l)
	means[ if((int8)AND((uint8)^(mem(r1 )) , <<( (uint8)1,^(r2))))goto l]
	assembles['bt  ' r2 ',(' r1 ')\n jc 'l];

instruction pattern TESTIN(reg r1,reg r2, breg r)
	means[ r:=<>(AND((uint8)^(mem(r1 )) , <<( (uint8)1,^(r2))),(int8)0)]
	assembles['bt  ' r2 ',(' r1 ')\n setc 'r'\n not 'r'\n inc 'r];

instruction pattern BTS(reg r1, reg r2)
	means [(ref uint8)mem(r1) := OR((uint8)^(mem(r1)),<<((uint8)1,^(r2)))]
	assembles ['bts 'r2',('r2')'];

instruction pattern REPMOVQ(countreg s, maddrmode m1, sourcereg si, destreg di, word64 t)
	means [for (ref int64)m1 := 0 to ^(s) step 1 do
		(ref t)mem(+(^(di),*(^((ref int64)m1),8))) := ^((ref t)mem(+(^(si),*(^((ref int64)m1),8))))]
	assembles ['inc %rcx\n jle 1f\n rep movsq\n1:'];

instruction pattern REPMOVD(countreg s, maddrmode m1, sourcereg si, destreg di, word32 t)
	means [for (ref int64)m1 := 0 to ^(s) step 1 do
		(ref t)mem(+(^(di),*(^((ref int64)m1),4))) := ^((ref t)mem(+(^(si),*(^((ref int64)m1),4))))]
	assembles ['inc %rcx\n jle 1f\n rep movsl\n1:'];

instruction pattern REPMOVW(countreg s, maddrmode m1, sourcereg si, destreg di, word16 t)
	means [for (ref int64)m1 := 0 to ^(s) step 1 do
		(ref t)mem(+(^(di),*(^((ref int64)m1),2))) := ^((ref t)mem(+(^(si),*(^((ref int64)m1),2))))]
	assembles ['inc %rcx\n jle 1f\n rep movsw\n1:'];

instruction pattern REPMOVB(countreg s, maddrmode m1, sourcereg si, destreg di, byte t)
	means [for (ref int64)m1 := 0 to ^(s) step 1 do
		(ref t)mem(+(^(di),^((ref int64)m1))) := ^((ref t)mem(+(^(si),^((ref int64)m1))))]
	assembles ['inc %rcx\n jle 1f\n rep movsb\n1:'];


define(CONTROL,FAIL|
GOTO|
SETS|
SETU|
IFGOTO|
IFGOTOR|
IFBOOLW|
IFBOOL|
BOUND0|
BOUND4|
BOUND16|
IFIN|
TESTIN|
BTS)

define(REPMOV,REPMOVQ|
REPMOVD|
REPMOVW|
REPMOVB)

/*
\end{verbatim}
*/

define(AMD64Codes, CONTROL|
MOVX|
PLANT|
LOAD|
SMUL|
BASICOPS|
LEA|
UMUL|
SDIV|
MAXMIN|
UDIV|
MODOPS|
NOTs|
REPMOV|
STORE|
CLEARREG|
SATOPS)

define(lastAMD64Codes,STACKPUSH|
STACKOPS|
STACKSTORE/*|LOADrui*/)
