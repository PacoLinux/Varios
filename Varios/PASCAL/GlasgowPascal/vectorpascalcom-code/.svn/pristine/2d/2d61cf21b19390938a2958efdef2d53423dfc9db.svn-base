
/*
Opteron ILCG
Copyright(c) Iain Jackson, University of Glasgow
October 2003
AVX extensions Copyright (c) Paul Cockshott
\subsection{Declare ILCG Types}
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
\subsection{Compiler Configuration}
*/
flag realLitSupported = 0;
/*
\subsection{Register Declarations}
*/
/* Main registers in CPU */
register quadword RADX	assembles ['%radx'];
alias register int64 RAX= RADX (0:63)	assembles ['%rax'] ;
alias register int64 RDX= RADX (64:127)	assembles ['%rdx'] ;
alias register int64 EADX = RADX(32:95)	assembles [' ']; /* this is a pseudo register whose alignment is wrong but which should do the correct reservations */
register int64 RCX	assembles['%rcx'];
register int64 RBX	assembles['%rbx'];
register int64 RSI	assembles['%rsi'];
register int64 RDI	assembles['%rdi'];
reserved register int64 RBP	assembles['%rbp'];
alias register int64 FP = RBP(0:63)	assembles['%rbp'];
reserved register int64 RSP	assembles['%rsp'];
alias register int64 SP = RSP(0:63)	assembles['%rsp'];
register int64 R8	assembles ['%r8'];
register int64 R9	assembles ['%r9'];
register int64 R10	assembles ['%r10'];
register int64 R11	assembles ['%r11'];
register int64 R12	assembles ['%r12'];
register int64 R13	assembles ['%r13'];
register int64 R14	assembles ['%r14'];
register int64 R15	assembles ['%r15'];
/* Unsigned aliases of 64-bit registers */
alias register uint64 uRAX = RAX(0:63)	assembles ['%rax'];
alias register uint64 uRBX = RBX(0:63)	assembles ['%rbx'];
alias register uint64 uRCX = RCX(0:63)	assembles ['%rcx'];
alias register uint64 uRDX = RDX(0:63)	assembles ['%rdx'];
alias register uint64 uRSI = RSI(0:63)	assembles ['%rsi'];
alias register uint64 uRDI = RDI(0:63)	assembles ['%rdi'];
alias register uint64 uR8 = R8(0:63)	assembles ['%r8'];
alias register uint64 uR9 = R9(0:63)	assembles ['%r9'];
alias register uint64 uR10 = R10(0:63)	assembles ['%r10'];
alias register uint64 uR11 = R11(0:63)	assembles ['%r11'];
alias register uint64 uR12 = R12(0:63)	assembles ['%r12'];
alias register uint64 uR13 = R13(0:63)	assembles ['%r13'];
alias register uint64 uR14 = R14(0:63)	assembles ['%r14'];
alias register uint64 uR15 = R15(0:63)	assembles ['%r15'];
/* Untyped aliases of 64-bit registers 
alias register doubleword utRAX = RAX(0:63)	assembles ['%rax'];
alias register doubleword utRBX = RBX(0:63)	assembles ['%rbx'];
alias register doubleword utRCX = RCX(0:63)	assembles ['%rcx'];
alias register doubleword utRDX = RDX(0:63)	assembles ['%rdx'];
alias register doubleword utRSI = RSI(0:63)	assembles ['%rsi'];
alias register doubleword utRDI = RDI(0:63)	assembles ['%rdi'];
alias register doubleword utR8 = R8(0:63)	assembles ['%r8'];
alias register doubleword utR9 = R9(0:63)	assembles ['%r9'];
alias register doubleword utR10 = R10(0:63)	assembles ['%r10'];
alias register doubleword utR11 = R11(0:63)	assembles ['%r11'];
alias register doubleword utR12 = R12(0:63)	assembles ['%r12'];
alias register doubleword utR13 = R13(0:63)	assembles ['%r13'];
alias register doubleword utR14 = R14(0:63)	assembles ['%r14'];
alias register doubleword utR15 = R15(0:63)	assembles ['%r15'];*/
/* 32-bit registers */
alias register int32 EAX = RAX(0:31)	assembles ['%eax'];
alias register int32 EBX = RBX(0:31)	assembles ['%ebx'];
alias register int32 ECX = RCX(0:31)	assembles ['%ecx'];
alias register int32 EDX = RDX(0:31)	assembles ['%edx'];
alias register int32 R8D = R8(0:31)	assembles ['%r8d'];
alias register int32 R9D = R9(0:31)	assembles ['%r9d'];
alias register int32 R10D = R10(0:31)	assembles ['%r10d'];
alias register int32 R11D = R11(0:31)	assembles ['%r11d'];
alias register int32 R12D = R12(0:31)	assembles ['%r12d'];
alias register int32 R13D = R13(0:31)	assembles ['%r13d'];
alias register int32 R14D = R14(0:31)	assembles ['%r14d'];
alias register int32 R15D = R15(0:31)	assembles ['%r15d'];
alias register int32 ESI = RSI(0:31)	assembles ['%esi'];
alias register int32 EDI = RDI(0:32)	assembles ['%edi'];
/* 32-bit unsigned registers */
alias register uint32 uEAX = RAX(0:31)	assembles ['%eax'];
alias register uint32 uEBX = RBX(0:31)	assembles ['%ebx'];
alias register uint32 uECX = RCX(0:31)	assembles ['%ecx'];
alias register uint32 uEDX = RDX(0:31)	assembles ['%edx'];
alias register uint32 uR8D = R8(0:31)	assembles ['%r8d'];
alias register uint32 uR9D = R9(0:31)	assembles ['%r9d'];
alias register uint32 uR10D = R10(0:31)	assembles ['%r10d'];
alias register uint32 uR11D = R11(0:31)	assembles ['%r11d'];
alias register uint32 uR12D = R12(0:31)	assembles ['%r12d'];
alias register uint32 uR13D = R13(0:31)	assembles ['%r13d'];
alias register uint32 uR14D = R14(0:31)	assembles ['%r14d'];
alias register uint32 uR15D = R15(0:31)	assembles ['%r15d'];
alias register uint32 uESI = RSI(0:31)	assembles ['%esi'];
alias register uint32 uEDI = RDI(0:31)	assembles ['%edi'];

alias register word wEAX = RAX(0:31)	assembles ['%eax'];
alias register word wEBX = RBX(0:31)	assembles ['%ebx'];
alias register word wECX = RCX(0:31)	assembles ['%ecx'];
alias register word wEDX = RDX(0:31)	assembles ['%edx'];
/* 16-bit registers */
alias register int16 AX = RAX(0:15)	assembles ['%ax'];
alias register int16 BX = RBX(0:15)	assembles ['%bx'];
alias register int16 CX = RCX(0:15)	assembles ['%cx'];
alias register int16 DX = RDX(0:15)	assembles ['%dx'];
alias register int16 R8W = R8(0:15)	assembles ['%r8w'];
alias register int16 R9W = R9(0:15)	assembles ['%r9w'];
alias register int16 R10W = R10(0:15)	assembles ['%r10w'];
alias register int16 R11W = R11(0:15)	assembles ['%r11w'];
alias register int16 R12W = R12(0:15)	assembles ['%r12w'];
alias register int16 R13W = R13(0:15)	assembles ['%r13w'];
alias register int16 R14W = R14(0:15)	assembles ['%r14w'];
alias register int16 R15W = R15(0:15)	assembles ['%r15w'];
/* 16-bit unsigned registers */
alias register uint16 uAX = RAX(0:15)	assembles ['%ax'];
alias register uint16 uBX = RBX(0:15)	assembles ['%bx'];
alias register uint16 uCX = RCX(0:15)	assembles ['%cx'];
alias register uint16 uDX = RDX(0:15)	assembles ['%dx'];
alias register uint16 uR8W = R8(0:15)	assembles ['%r8w'];
alias register uint16 uR9W = R9(0:15)	assembles ['%r9w'];
alias register uint16 uR10W = R10(0:15)	assembles ['%r10w'];
alias register uint16 uR11W = R11(0:15)	assembles ['%r11w'];
alias register uint16 uR12W = R12(0:15)	assembles ['%r12w'];
alias register uint16 uR13W = R13(0:15)	assembles ['%r13w'];
alias register uint16 uR14W = R14(0:15)	assembles ['%r14w'];
alias register uint16 uR15W = R15(0:15)	assembles ['%r15w'];
alias register halfword SI = RSI(0:15)	assembles ['%si'];
alias register halfword DI = RDI(0:15)	assembles ['%di'];
/* 8-bit registers */
/* treat 2 memory locations as dummy registers to speed
    transfer to and from fpu stack
 register int64 regutil0	assembles [' regutil0'];
 alias register int32 rui0 =regutil0(0:31)	assembles['regutil0'];
 alias register int16 rui00= rui0(0:15)	assembles['regutil0'];
 pattern rui	means[rui0|regutil0|rui00];*/
alias register int8 AL = RAX(0:7)	assembles ['%al'];
alias register int8 BL = RBX(0:7)	assembles ['%bl'];
alias register int8 CL = RCX(0:7)	assembles ['%cl'];
alias register int8 DL = RDX(0:7)	assembles ['%dl'];
alias register int8 R8B = R8(0:7)	assembles ['%r8b'];
alias register int8 R9B = R8(0:7)	assembles ['%r9b'];
alias register int8 R10B = R10(0:7)	assembles ['%r10b'];
alias register int8 R11B = R11(0:7)	assembles ['%r11b'];
alias register int8 R12B = R12(0:7)	assembles ['%r12b'];
alias register int8 R13B = R13(0:7)	assembles ['%r13b'];
alias register int8 R14B = R14(0:7)	assembles ['%r14b'];
alias register int8 R15B = R15(0:7)	assembles ['%r15b'];
/* 8-bit unsigned registers */
alias register uint8 uAL = RAX(0:7)	assembles ['%al'];
alias register uint8 uBL = RBX(0:7)	assembles ['%bl'];
alias register uint8 uCL = RCX(0:7)	assembles ['%cl'];
alias register uint8 uDL = RDX(0:7)	assembles ['%dl'];
alias register uint8 uR8B = R8(0:7)	assembles ['%r8b'];
alias register uint8 uR9B = R9(0:7)	assembles ['%r9b'];
alias register uint8 uR10B = R10(0:7)	assembles ['%r10b'];
alias register uint8 uR11B = R11(0:7)	assembles ['%r11b'];
alias register uint8 uR12B = R12(0:7)	assembles ['%r12b'];
alias register uint8 uR13B = R13(0:7)	assembles ['%r13b'];
alias register uint8 uR14B = R14(0:7)	assembles ['%r14b'];
alias register uint8 uR15B = R15(0:7)	assembles ['%r15b'];
/* octet registers */
alias register octet oAL = RAX(0:7)	assembles ['%al'];
alias register octet oBL = RBX(0:7)	assembles ['%bl'];
alias register octet oCL = RCX(0:7)	assembles ['%cl'];
alias register octet oDL = RDX(0:7)	assembles ['%dl'];
alias register octet oR8B = R8(0:7)	assembles ['%r8b'];
alias register octet oR9B = R8(0:7)	assembles ['%r9b'];
alias register octet oR10B = R10(0:7)	assembles ['%r10b'];
alias register octet oR11B = R11(0:7)	assembles ['%r11b'];
alias register octet oR12B = R12(0:7)	assembles ['%r12b'];
alias register octet oR13B = R13(0:7)	assembles ['%r13b'];
alias register octet oR14B = R14(0:7)	assembles ['%r14b'];
alias register octet oR15B = R15(0:7)	assembles ['%r15b'];
register stack(4096)int64 mainSTACK	assembles ['mainSTACK'];
define(havesse,1)
define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')
/*-----------------------------------------------------------*/
/* define the set of ieee32 vector registers */
define(ymmr,`register ieee32 vector(8) YMM$1	assembles[ ' `'' `%ymm$1'`''`];
')
define(rymmr,`reserved register ieee32 vector(8) YMM$1	assembles[ ' `'' `%ymm$1'`''`];
')
forloop(`i',0,4,`ymmr(i)')
forloop(`i',8,15,`ymmr(i)')
forloop(`i',5,7,`rymmr(i)')
define(fymregp,`YMM$1|')
pattern fymreg	means [ forloop(`i',0,14,`fymregp(i)') YMM15];
/*-------------------------------------------------------------*/
/* define the set of 256 bit int32 mask vector registers */
define(iymmr,`alias register  int32 vector(8) iYMM$1=YMM$1(0:255)	assembles[ ' `'' `%ymm$1'`''`];
')
forloop(`i',0,7,`iymmr(i)')
define(iymregp,`iYMM$1|')
pattern iymreg	means [ forloop(`i',0,6,`iymregp(i)') iYMM7];
/*-------------------------------------------------------------*/
/* define the set of 256 bit int64 mask vector registers */
define(qymmr,`alias register  int64 vector(4) qYMM$1=YMM$1(0:255)	assembles[ ' `'' `%ymm$1'`''`];
')
forloop(`i',0,7,`qymmr(i)')
define(qymregp,`qYMM$1|')
pattern qymreg	means [ forloop(`i',0,6,`qymregp(i)') qYMM7];
/*-------------------------------------------------------------*/
/* define the set of ieee64 vector registers */
define(dymmr,`alias register  ieee64 vector(4) dYMM$1=YMM$1(0:255)	assembles[ ' `'' `%ymm$1'`''`];
')
forloop(`i',0,7,`dymmr(i)')
define(dymregp,` dYMM$1|')
pattern dymreg	means [ forloop(`i',0,6,`dymregp(i)') dYMM7];
/*-------------------------------------------------------------*/
define(xmmr,`alias register  quadword XMM$1=YMM$1(0:127)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,15,`xmmr(i)')
/*-------------------------------------------------------------*/
/* define the set of ieee32 scalar registers */
define(fxmmr,`alias register  ieee32 fXMM$1=YMM$1(0:31)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`fxmmr(i)')
define(fxmregp,`fXMM$1|')
pattern fxmreg	means [ forloop(`i',0,6,`fxmregp(i)') fXMM7];
/*-------------------------------------------------------------*/
/* define the set of ieee64 scalar registers */
define(dxmmr,`alias register  ieee64 dXMM$1=YMM$1(0:63)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`dxmmr(i)')
define(dxmregp,`dXMM$1|')
pattern dxmreg	means [ forloop(`i',0,6,`dxmregp(i)') dXMM7];
/*-------------------------------------------------------------*/
/* define the set of 64 bit untyped scalar registers */
define(duxmmr,`alias register  doubleword duXMM$1=YMM$1(0:63)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`duxmmr(i)')
define(duxmregp,`duXMM$1|')
pattern duxmreg	means [ forloop(`i',0,6,`duxmregp(i)') duXMM7];
pattern doublexmreg means[dxmreg|duxmreg];
/*-------------------------------------------------------------*/
/* define the set of int32 vector  registers */
define(ixmmr,`alias register  int32 vector(4) iXMM$1=YMM$1(0:127)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,15,`ixmmr(i)')
define(ixmregp,`iXMM$1|')
pattern ixmreg	means [ forloop(`i',0,14,`ixmregp(i)') iXMM15];
/*-------------------------------------------------------------*/
/* define the set of int16 vector  registers */
define(sxmmr,`alias register  int16 vector(8) sXMM$1=YMM$1(0:127)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`sxmmr(i)')
define(sxmregp,`sXMM$1|')
pattern swxmreg	means [ forloop(`i',0,6,`sxmregp(i)') sXMM7];
/*-------------------------------------------------------------*/
/* define the set of uint16 vector  registers */
define(usxmmr,`alias register  uint16 vector(8) usXMM$1=YMM$1(0:127)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`usxmmr(i)')
define(usxmregp,`usXMM$1|')
pattern uwxmreg	means [ forloop(`i',0,6,`usxmregp(i)') usXMM7];
/*-------------------------------------------------------------*/
/* define the set of quadword registers */
define(uxmmr,`alias register  quadword uXMM$1=YMM$1(0:127)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`uxmmr(i)')
define(uxmregp,`uXMM$1|')
pattern uxmreg	means [ forloop(`i',0,6,`uxmregp(i)') usXMM7];
/*-------------------------------------------------------------*/
/* define the set of byte vector  registers */
define(sbxmmr,`alias register  int8 vector(16) bXMM$1=YMM$1(0:127)	assembles[ ' `'' `%xmm$1'`''`];
')
forloop(`i',0,7,`sbxmmr(i)')
define(sbxmregp,`bXMM$1|')
pattern sbxmreg	means [ forloop(`i',0,6,`sbxmregp(i)') bXMM7];
/*-------------------------------------------------------------*/
/* define the set of unsigned byte vector  registers */
define(ubxmmr,`alias register  uint8 vector(16) ubXMM$1=YMM$1(0:127)	assembles[ ' `'' ` %xmm$1'`''`];
')
forloop(`i',0,7,`ubxmmr(i)')
define(ubxmregp,`ubXMM$1|')
pattern ubxmreg	means [ forloop(`i',0,6,`ubxmregp(i)') ubXMM7];
alias register int8 vector(16) XMM0I8=XMM0(0:127)	assembles['%xmm0'];
alias register int8 vector(16) XMM1I8=XMM1(0:127)	assembles['%xmm1'];
alias register int8 vector(16) XMM2I8=XMM2(0:127)	assembles['%xmm2'];
alias register int8 vector(16) XMM3I8=XMM3(0:127)	assembles['%xmm3'];
alias register int32 vector(4) XMM0I32=XMM0(0:127)	assembles['%xmm0'];
alias register int32 vector(4) XMM1I32=XMM1(0:127)	assembles['%xmm1'];
alias register int32 vector(4) XMM2I32=XMM2(0:127)	assembles['%xmm2'];
alias register int32 vector(4) XMM3I32=XMM3(0:127)	assembles['%xmm3'];
alias register int32 vector(4) XMM4I32=XMM4(0:127)	assembles['%xmm4'];
alias register int32 vector(4) XMM5I32=XMM5(0:127)	assembles['%xmm5'];
alias register int32 vector(4) XMM6I32=XMM6(0:127)	assembles['%xmm6'];
alias register int32 vector(4) XMM7I32=XMM7(0:127)	assembles['%xmm7'];
alias register int32 vector(4) XMM12I32=XMM12(0:127)	assembles['%xmm12'];
alias register int32 vector(4) XMM13I32=XMM13(0:127)	assembles['%xmm13'];
/*
pattern uxmreg	means [XMM1|XMM3|XMM4|XMM5|XMM6|XMM2|XMM0|XMM7|XMM8|XMM9|XMMA|XMMB|XMMC|XMMD|XMME|XMMF];
*/
pattern sxmreg	means[  fxmreg];
pattern bxmreg	means[XMM0I8|XMM1I8|XMM2I8|XMM3I8] ;
/*pattern ixmreg	means[XMM0I32|XMM1I32|XMM2I32|XMM3I32|XMM4I32|XMM5I32|XMM6I32|XMM7I32|XMM12I32|XMM13I32] ;
*/
pattern xmmr64	means[dxmreg];
pattern dmreg	means[dxmreg];
pattern xmreg	means[uxmreg|bxmreg|ixmreg];
/*pattern lowintreg	means [ixmreg];*/
pattern lowreg	means[sxmreg];
/*
\subsection{Register Sets}
*/
/* 8-bit register sets */
pattern bsreg	means [R8B|R9B|R10B|R11B|R12B|R13B|R14B|R15B|BL|AL|DL|CL];
pattern bureg	means [uBL|uAL|uDL|uR8B|uR9B|uR10B|uR11B|uR12B|uR13B|uR14B|uR15B|uCL];
pattern boreg	means [oBL|oAL|oDL|oR8B|oR9B|oR10B|oR11B|oR12B|oR13B|oR14B|oR15B|oCL];
pattern bacc	means [AL];
pattern bdacc	means [DL];
pattern ubacc	means [uAL];
pattern ubdacc	means [uDL];
pattern bnonacc	means [BL|CL|DL|R8B|R9B|R10B|R11B|R12B|R13B|R14B|R15B];
pattern bireg	means[ BL|DL|AL];
pattern breg	means [bireg|bsreg|bnonacc|bureg|boreg|bacc];
pattern shcl	means[CL];
pattern shocl	means[oCL];
pattern shcx	means[CX];
pattern shecx	means[ECX];
pattern shiftcountreg	means [shcl|shcx|shecx|shocl];
/* 16-bit register sets */
pattern hwsreg	means [R8W|R9W|R10W|R11W|R12W|R13W|R14W|R15W|BX|CX|DX|AX];
pattern hwureg	means [uR8W|uR9W|uR10W|uR11W|uR12W|uR13W|uR14W|uR15W|uBX|uCX|uDX|uAX];
pattern hwacc	means [AX];
pattern hwdacc	means [DX];
pattern uhwacc	means [uAX];
pattern uhwdacc	means [uDX];
pattern hwmodreg	means [CX];
pattern hwnonacc	means [BX|CX|DX|R8W|R9W|R10W|R11W|R12W|R13W|R14W|R15W];
pattern hwuntypedreg	means [SI|DI];
pattern hwreg	means [hwsreg|hwureg|hwdacc|uhwdacc|hwuntypedreg];
/* 32-bit register sets */
pattern wsreg	means [R8D|R9D|R10D|R11D|R12D|R13D|R14D|R15D|EBX|EDX|EAX|ECX];
pattern wureg	means [uR8D|uR9D|uR10D|uR11D|uR12D|uR13D|uR14D|uR15D|uEBX|uEDX|uEAX|uECX];
pattern wacc	means [EAX];
pattern ut32r 	means [wEAX|wEBX|wECX|wEDX];
pattern wdacc	means [EDX];
pattern uwacc	means [uEAX];
pattern uwdacc	means [uEDX];
pattern wmodreg	means [ECX];
pattern wnonacc	means [EBX|ECX|R8D|R9D|R10D|R11D|R12D|R13D|R14D|R15D|ESI];
pattern wuntypedreg	means [ESI|EDI];
pattern wreg	means [wsreg|wdacc|wacc|uwdacc|uwacc|wureg|wuntypedreg];
pattern ut32	means[wreg|ut32r];
pattern int32reg	means[wsreg|wacc];
/* 64-bit register sets */
pattern ireg	means [R8|R9|R10|R11|R12|R13|R14|R15|RBX|RDI|RSI|  RAX|RDX|RCX];
pattern indexreg	means [ireg];
pattern sreg	means [R8|R9|R10|R11|R12|R13|R14|R15|RBX|RDI|RSI|RBP|RSP|RAX|RDX|RCX];
pattern ureg	means [uR8|uR9|uR10|uR11|uR12|uR13|uR14|uR15|uRBX|uRDI|uRSI|uRDX|uRCX|uRAX];
/*
pattern utreg	means [utR8|utR9|utR10|utR11|utR12|utR13|utR14|utR15|utRBX|utRDI|utRSI|utRDX|utRCX|utRAX];*/
pattern unonacc	means[uR8|uR9|uR10|uR11|uR12|uR13|uR14|uR15|uRBX|uRDI|uRSI|uRCX];
pattern acc	means [RAX];
pattern dacc	means [RDX];
pattern uacc	means [uRAX];
pattern udacc	means [uRDX];
pattern rbase	means [RBP];
pattern nonacc	means [R8|R9|R10|R11|R12|R13|R14|R15|RCX|RBX|RSI];
pattern reg	means [rbase|sreg|ureg|dacc|acc|udacc|uacc];
pattern countreg	means [RCX];
pattern sourcereg	means [RSI];
pattern destreg	means [RDI];
pattern modreg	means [RCX];
/* Global sets */
pattern anyreg	means [breg|hwreg|wreg|reg|ut32r];
pattern signedreg	means [bsreg|hwsreg|wsreg|sreg];
pattern unsignedreg	means [bureg|hwureg|wureg|ureg];
pattern pushreg	means [reg ]; /* directly pushable registers */
/* need to finish off the rest , consulting instructions */
/*
\subsection{Operator Definition}
*/
operation add	means +	assembles ['add'];
operation and	means AND	assembles ['and'];
operation or	means OR	assembles ['or'];
operation xor	means XOR	assembles ['xor'];
operation sub	means -	assembles ['sub'];
operation mul	means *	assembles ['mul'];
operation imul	means *	assembles ['imul'];
operation bel	means <	assembles ['b'];
operation lt	means <	assembles ['l'];
operation ab	means >	assembles ['a'];
operation gt	means >	assembles ['g'];
operation eq	means =	assembles ['z'];
operation be	means <=	assembles ['be'];
operation le	means <=	assembles ['le'];
operation ae	means >=	assembles ['ae'];
operation ge	means >=	assembles ['ge'];
operation ne	means <>	assembles ['nz'];
operation shiftleft	means <<	assembles ['l'];
operation shiftright	means >>	assembles ['r'];
/* operation groups */
pattern condition	means[ne|ge|le|eq|gt|lt];
pattern unsignedcondition	means[ne|ae|be|eq|ab|bel];
pattern operator	means[add | sub|imul|and|or|xor];
pattern nonmultoperator	means[add|sub|and|or|xor];
pattern saddoperator	means[add|imul|and|or|xor];
pattern shiftop	means [shiftleft|shiftright];
pattern logoperator means[and|or|xor];
/*
\subsection{Data Formats}
*/
pattern unsigned	means [uint64|uint32|uint16|uint8];
pattern signed	means [int64|int32|int16|int8];
pattern int	means [signed|unsigned];
pattern double	means [ieee64];
pattern float	means [ieee32];
pattern real	means [double|float];
pattern word64	means [int64|uint64|doubleword|ieee64];
pattern word32	means [int32|uint32|word|ieee32];
pattern word16	means [int16|uint16|halfword];
pattern byte	means [uint8|int8|octet];
pattern wordupto64	means [byte|word16|word32|word64];
pattern longint	means [int64|uint64];
pattern hiint	means [int64|int32|int16];
pattern two(type t)	means [2]	assembles ['2'];
pattern four(type t)	means [4]	assembles ['4'];
pattern eight(type t)	means [8]	assembles ['8'];
pattern scale	means [two|four|eight];
/*
\subsection{Addressing Forms}
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
pattern tbarelab	means [barelab|typedbarelab];
pattern labelconstf(tbarelab l, signed s)
	means [+(l,const s)]
	assembles [l '+' s];
pattern constf(signed s)
	means [const s]
	assembles [s];
/*
Not in GAS file, researching
pattern lconstf	means [labelf|constf];
*/
pattern offset	means [constf|barelab|labelconstf];
pattern regindirf(reg r)
	means [^(r)]
	assembles ['('r')'];
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
\subsection{Choice Of Effective Address}
*/
pattern uncasteaform	means[
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
pattern leaform	means[
 scaledIndexPlusOffsetf|
 basePlusScaledIndexPlusOffsetf|
 baseplusoffsetf|
 basePlusIndexPlusOffsetf|
 basePlusScaledIndexf|
 scaledIndexPlusOffsetf|
 baseminusoffsetf|
/* basePlusIndexf| */
 constf|
 barelab
];
/* for allowing an address expression to be cast to an integer */
pattern eaform(uncasteaform f, longint t)
	means [(t)f]
	assembles [f];
/*
\subsection{Memory Address Formats}
*/
pattern addrform	means [eaform|regindirf];
/*
The address patterns used in other instructions
*/
pattern innermaddrmode(addrform f)
	means [mem(f)]
	assembles [f];
pattern maddrmode	means[innermaddrmode];
pattern xmmr64m	means[maddrmode|xmmr64];
pattern sxmregm	means[maddrmode|sxmreg];
pattern wsmaddrmode
	means[maddrmode|wsreg];
/*pattern ruimode	means[rui];*/
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
pattern addrform	means[eaform|regindirf];
pattern riscaddr	means[addrform];
pattern memrisc(riscaddr r)
	means[mem(r)]
	assembles[r];
pattern mriscmode	means[memrisc];
pattern regaddrimmediate	means [intimmediate|maddrmode|regaddrop];
/*
\subsection{Instuction Patterns for the AMD Opteron}
\subsubsection{Stack Operations}
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
	assembles ['xchgq %rax, (%rsp)\n sh'op'q %cl,%rax\n xhcgl %eax,(%rsp)'];
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
/*
\subsubsection{Data Movement to and from Registers}
*/
instruction pattern SELECT(anyreg r1, anyreg r2, anyreg r3, wordupto64 t)
	means [(ref t) r1 := OR(AND((t)^(r1), ^(r2)),AND((t)^(r3),NOT(^(r2))))]
	assembles ['and 'r2 ',' r1 '\n'
     'not 'r2                     '\n'
     'and 'r3 ',' ' 'r2 '\n'
     'or 'r2      ','     r1];
instruction pattern LOADb(maddrmode rm, anyreg r1, byte t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['mov't' 'rm',' r1];
instruction pattern LOADw(maddrmode rm, anyreg r1, word16  t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['mov't' 'rm',' r1];
instruction pattern LOADl(maddrmode rm, anyreg r1, word32  t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['movl' ' 'rm',' r1];
instruction pattern LOADq(maddrmode rm, anyreg r1, word64 t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['movq' ' 'rm',' r1];
define(LOAD,LOADb|LOADw|LOADl|LOADq)
/*instruction pattern LOADrui(ruimode rm, anyreg r1, wordupto64 t)
	means [(ref t) r1 := (t)^(rm)]
	assembles ['mov't' 'rm',' r1];*/
/* instructions for extending to 64-bits */
pattern bit64int	means[uint64|int64];
pattern bit64intreg	means[sreg|ureg];
instruction pattern DWMOVZXB(bit64intreg r1, baddrmode rm,bit64int t)
	means [r1:= (t)EXTEND((uint8)^(rm))]
	assembles['movzbq ' rm ','r1];
instruction pattern DWMOVSXB(sreg r1, baddrmode rm)
	means [r1:=(int64)EXTEND((int8)^(rm))]
	assembles ['movsbq 'rm','r1];
instruction pattern DWMOVZXHW(bit64intreg r1, hwaddrmode rm,bit64int t)
	means [r1 := (t)EXTEND((uint16)^(rm))]
	assembles ['movzwq 'rm','r1];
instruction pattern HWMOVZXB(bureg r1,hwureg r2)
	means[r2:=EXTEND(^(r1))]
	assembles['movzbw 'r1','r2];
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
pattern bit32intreg	means[wureg|wsreg];
pattern bit32int	means[int32|uint32];
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
pattern bit16intreg	means[hwureg|hwsreg];
pattern bit16int	means [uint16|int16];
instruction pattern HWMOVZXB(bit16intreg r1, baddrmode rm,bit16int t)
	means [r1 := (uint16)EXTEND((octet)^(rm))]
	assembles ['movzbw 'rm','r1];
instruction pattern HWMOVSXB(hwsreg r1, baddrmode rm)
	means [r1 := (int16)EXTEND((int8)^(rm))]
	assembles ['movsbw 'rm','r1];
/* instructions for storing a register to memory */
instruction pattern STOREB(maddrmode rm, breg r1, byte t)
	means [(ref octet) rm := ^(r1)]
	assembles ['movb 'r1','rm];
instruction pattern STOREHW(maddrmode rm, hwreg r1, word16 t)
	means [(ref t) rm := ^(r1)]
	assembles ['movw 'r1',' rm];
instruction pattern STOREW(waddrmode rm, ut32 r1, word32 t)
	means [(ref t) rm := ^(r1)]
	assembles ['movl 'r1',' rm];
instruction pattern STOREREF(maddrmode rm, wreg r1,   type t)
	means [(ref ref t) rm := ^(r1)]
	assembles ['movl 'r1',' rm];
instruction pattern STOREDW(maddrmode rm, reg r1, word64 t)
	means [(ref t) rm := ^(r1)]
	assembles ['movq 'r1',' rm];
pattern typeupto32	means[int32|int16|int8|uint8|uint16|uint32];
instruction pattern STORELIT(addrmode rm, typeupto32 t, int s)
	means [(ref t) rm := (t)const s]
	assembles ['mov't' $'s','rm];
instruction pattern EAXStore( wacc r1,wreg r2)
	means[r2 := ^(r1)]
	assembles['movl 'r1','r2];
instruction pattern CLEARREG(reg rm, type t, int s)
	means [(ref t) rm := (t)0]
	assembles ['xor 'rm','rm];
/*
\subsubsection{Register Arithmetic}
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
	assembles ['sh'op' 's','r];
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
instruction pattern RR32(logoperator op, ut32 r1, ut32 r2)
	means [r1 :=  op(^(r1), ^(r2))]
	assembles[op 'l 'r2','r1];
instruction pattern RR64(logoperator op, reg r1, reg r2)
	means [r1 :=  op(^(r1), ^(r2))]
	assembles[op 'q 'r2','r1];
instruction pattern RR(nonmultoperator op, anyreg r1, anyreg r2, int t)
	means [r1 := (t)op((t)^((ref t)r1),(t)^((ref t)r2))]
	assembles [op t' 'r2','r1];
instruction pattern RRM(operator op, pushreg r1, maddrmode rm, int t)
	means [r1 := (t)op((t)^(r1),(t)^(rm))]
	assembles [op t' 'rm','r1];
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
pattern qacc	means[EADX];
pattern acc32	means[EAX];
instruction pattern CDQ(qacc r1,acc32 r2)
	means[r1:=EXTEND(^(r2))]
	assembles['cdq'];
instruction pattern IDIV(acc32 r1, qacc r2, wnonacc r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['idiv 'r3];
instruction pattern IDIV2(wnonacc r1, wnonacc r2, wnonacc r3)
	means[r1:=div(^(r2),^(r3))]
	assembles['push %rdx\n push %rax\n movl 'r2',%eax \n cdq  \n idiv 'r3'\n movl %eax,'r1'\n pop %rax\n pop %rdx'];
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
/* Register Saturated Arithmetic */
instruction pattern ADDUSB(addrmode fm, bureg r1, bureg rm)
	means [ rm := +:((uint8)^(rm),^(r1))]
	assembles ['add 'rm', 'r1'\n'
     'jnc 0f\n'
     'mov $255,'rm'\n'
     '0:\n'
     'nop'];
instruction pattern ADDSSB(addrmode fm, bsreg r1, bsreg rm)
	means [ rm := +:((int8)^(rm),^(r1))]
	assembles ['add 'rm', 'r1'\n'
     'jno 0f\n'
     'jng 1f\n'
     'mov $-128,'rm'\n'
     'jng  0f\n'
     '1:mov $127,'rm'\n'
     '0:nop\n'
     'nop'];
instruction pattern SUBUSB(addrmode fm, bureg r1, bureg rm)
	means [  rm := -:((uint8)^(rm),^(r1))]
	assembles ['sub 'rm', 'r1'\n'
     'jnc 0f\n'
     'xor 'rm','rm'\n'
     '0:\n'
     'nop'];
instruction pattern SUBSSB(addrmode fm, bsreg r1, bsreg rm)
	means [ rm := -:((int8)^(rm),^(r1))]
	assembles ['sub 'rm', 'r1'\n'
     'jno 0f\n'
     'jg 1f\n'
     'mov  $-128,'rm'\n'
     'jng 0f\n'
     '1:mov $127,'rm'\n'
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
/* Maximum and Minimum Operations */
instruction pattern INTMAX(anyreg r1,anyreg r2, type t)
	means[ (ref t)r1:=MAX((t)^(r1),(t)^(r2))]
	assembles['cmp 'r1','r2'\n cmovg 'r2','r1];
instruction pattern INTMIN(anyreg r1,anyreg r2, type t)
	means[(ref t) r1:=MIN((t)^(r1),(t)^(r2))]
	assembles['cmp 'r1','r2'\n  cmovl 'r2','r1];
instruction pattern UINT8MAX(bureg r1,bureg r2)
	means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n ja $+4\n mov 'r2','r1];
instruction pattern UINT8MIN(bureg r1,bureg r2)
	means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jna $+4\n mov 'r2','r1];
instruction pattern INT8MAX(bsreg r1,bsreg r2)
	means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jg $+4\n mov 'r2','r1];
instruction pattern INT8MIN(bsreg r1,bsreg r2)
	means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n jl $+4\n mov 'r2','r1];
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
/*
\subsubsection{Control Transfers and Tests}
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
/*
*/
/*
\subsection{Intel fpu instructions}
*/
register stack(8)ieee64 ST	assembles[ 'ST'];
pattern fpuint	means[int32|int64];
operation fdiv	means div	assembles['div'];
operation frem	means MOD	assembles['prem'];
pattern foperator	means[add | sub|mul|fdiv];
pattern fcommuteoperator	means[add|mul];
pattern fputype	means[int32|int64|int16|ieee32|ieee64];
pattern fround(type t,fpuint i)	means [(i)ROUND((t)POP(ST))]	assembles['frndint'];
pattern fsqrt(real t,real t2)
	means[(t)SQRT((t2)POP(ST))]
	assembles ['fsqrt'];
pattern fsin(real t,real t2)
	means[(t)SIN((t2)POP(ST))]
	assembles ['fsin'];
pattern fcos(real t,real t2)
	means[(t)COS((t2)POP(ST))]
	assembles ['fcos'];
pattern fln(real t,real t2)
	means[(t)LN((t2)POP(ST))]
	assembles['fldln2\n fxch\n fyl2x'];
pattern fptan(real t,real t2)
	means[(t)TAN((t2)POP(ST))]
	assembles['fptan'];
pattern fabs(fputype t,fputype t2)
	means[(t)ABS((t2)POP(ST))]
	assembles['fabs'];
pattern fmoperator	means [fround|fsqrt|fsin|fcos|fptan|fln|fabs];
instruction pattern RDIVB(breg b1,baddrmode b2)
	means[b1:=div(^(b1),^(b2))]
	assembles['bytediv 'b1','b2];
instruction pattern RMULTB(breg b1,baddrmode b2)
	means[b1:=*(^(b1),^(b2))]
	assembles['bytemult 'b1','b2];
instruction pattern FISTB(breg b1)
	means[b1:=(octet)(int64)POP(ST)]
	assembles['fistb 'b1];
instruction pattern FILDB(baddrmode b2)
	means[PUSH(ST,(int8)^(b2))]
	assembles['fildb 'b2];
instruction pattern FPUSHI16(type t)
	means[PUSH(mainSTACK,(int16)POP(ST))]
	assembles['subq $2,%rsp\n fistpw (%rsp)'];
instruction pattern FPUSHI32(type t)
	means[PUSH(mainSTACK,(int32)POP(ST))]
	assembles['subq $4,%rsp\n fistpl (%rsp)'];
instruction pattern FPUSHI64T(type t)
	means[PUSH(mainSTACK,(int64)TRUNCATE((t)POP(ST)))]
	assembles['subq $8,%rsp\n fisttpq (%rsp)'];
instruction pattern FPUSHI64(type t)
	means[PUSH(mainSTACK,(int64)POP(ST))]
	assembles['subq $8,%rsp\n fistpq (%rsp)'];
instruction pattern FPUSHR64(type t)
	means[PUSH(mainSTACK,(ieee64)POP(ST))]
	assembles['subq $8,%rsp\n fstpl (%rsp)'];
instruction pattern FPOPI64(type t)
	means[PUSH(ST,(int64)POP(mainSTACK))]
	assembles['fildq (%rsp)\n addq $8,%rsp'];
instruction pattern FPOPI64FD(type t)
	means[PUSH(ST,(t)FLOAT((int64)POP(mainSTACK)))]
	assembles['fildq (%rsp)\n addq $8,%rsp'];
instruction pattern FPOPMS(fputype t)
	means[PUSH(ST,(ieee32)POP(mainSTACK))]
	assembles['flds  (%rsp)\n addq $8, %rsp'];
pattern anyreal	means[ieee32|ieee64];
instruction pattern FLOATLDR(int32reg r,anyreal t)
	means[PUSH(ST,(t)FLOAT((int32)^(r)))]
	assembles[' sub $8, %rsp\n'
    '  movl 'r', (%rsp)\n'
    '  fildl (%rsp)\n'
     '  add $8, %rsp ' ];
instruction pattern FILDR(int32reg r)
	means[PUSH(ST,(int32)^(r))]
	assembles[' sub $8, %rsp\n'
    '  movl 'r', (%rsp)\n'
    '  fildl (%rsp)\n'
     '  add $8, %rsp ' ];
instruction pattern FISTR(int32reg r)
	means[r:=(int32) POP(ST)]
	assembles['sub $8, %rsp\n fistpl (%rsp)\n movl (%rsp) , ' r'\n add $8, %rsp'];
instruction pattern FSTR(maddrmode a,fputype t)
	means[(ref ieee64) a:=(t) POP(ST)]
	assembles['fstpl ' a];
instruction pattern FSTRF(maddrmode a,fputype t)
	means[(ref ieee32) a:= (t)POP(ST)]
	assembles['fstps ' a];
instruction pattern EXTENDANY(fputype t)
	means[PUSH(ST,(ieee64)EXTEND((t)POP(ST)))]
	assembles[' '];
pattern fpuint	means [int32|int64];
instruction pattern FISTM(maddrmode m, fpuint i)
	means[(ref i )m:=(i )POP(ST)]
	assembles['fistp'i' ' m];
instruction pattern FISTMT(maddrmode m,real r,fpuint i)
	means[(ref i )m:=TRUNCATE((r )POP(ST))]
	assembles['fistp'i' ' m];
instruction pattern FISTMTR(wreg m,real r,fpuint i)
	means[(ref i )m:=TRUNCATE((r )POP(ST))]
	assembles[
 'sub 8, 'm
 '\n fistp'i' 0(%rsp)'
 '\n mov'i' 0(%rsp),'m
 '\nadd 8,'m];
instruction pattern FLD(maddrmode a)
	means[PUSH(ST,^((ref ieee64) a))]
	assembles['fldl ' a];
instruction pattern FLDF(maddrmode a)
	means[PUSH(ST,^((ref ieee32) a))]
	assembles['flds  ' a];
instruction pattern FILD(maddrmode a,real t, fpuint i)
	means[PUSH(ST,(i)^( a))]
	assembles['fild'i ' ' a];
instruction pattern FILDF(maddrmode a,real t, hiint i)
	means[PUSH(ST,(t)FLOAT((i)^((ref i) a)))]
	assembles['fild'i ' ' a];
instruction pattern FILDFt(maddrmode a,real t, fpuint i)
	means[PUSH(ST,(t)FLOAT((i)^((ref i) a)))]
	assembles['fild'i ' ' a];
instruction pattern FEXT(real t)
	means[PUSH(ST,(ieee64)EXTEND((t)POP(ST)))]
	assembles [ ' ']; /* null operation in the fpu */
operation flt	means <	assembles ['b'];
operation fgt	means >	assembles ['a'];
operation feq	means =	assembles ['z'];
operation fle	means <=	assembles ['na'];
operation fge	means >=	assembles ['ae'];
operation fne	means <>	assembles ['nz'];
pattern fcondition	means[fne|fge|fle|feq|fgt|flt];
instruction pattern FSET(fcondition c, breg r,fputype t)
	means[(ref int8)r:=(int8) c((t)POP(ST), (t)POP(ST))]
	assembles['fxch'
  '\n fcompp'
  '\n pushw %ax'
  '\n fstsw %ax'
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
instruction pattern FILOADLIT(hiint i)
	means[PUSH(ST, const i)]
	assembles['jmp 0f\n1:\n.quad 'i'\n0:fildq 1b'];
/*	assembles['db 0ebh,10\ndt ' i'.0\nfld tword  [$-10]'];*/
instruction pattern FOP(maddrmode a,foperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),^((ref ieee64)a)  )) ]
	assembles['f'op 'l  ' a];
instruction pattern FOPF(maddrmode a,foperator op,real t,fputype t2)
	means[PUSH(ST,(t)op((t2)POP(ST),(t)^((ref t)a)  )) ]
	assembles['f'op  t   ' ' a];
instruction pattern FOPI(maddrmode a,foperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),FLOAT((int32)^(a) ) )) ]
	assembles['fi'op 'l   ' a];
instruction pattern ReversePolishFOP(fcommuteoperator op,real t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)POP(ST)))]
	assembles['f'op'p']; /* looks like stack operand not needed in as */
instruction pattern ReversePolishFOPG(foperator op,fputype t,fputype t2,fputype t3)
	means[PUSH(ST,(t)op((t2)POP(ST),(t3)POP(ST)))]
	assembles['fxch\n f'op'p'];
/* this version only works on P6s and above comment out for now since fcmov not supported properly in gas
instruction pattern FMAXp6(maddrmode a, fputype t)
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)\n fcmovb %st(0),%st(1) \nfstp %st(1)'];
instruction pattern FMINp6(maddrmode a, fputytpe t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)\n fcmovnb %st(0),%st(1)  \nfstp %st(1)']; /* */
instruction pattern FMAX(maddrmode a, fputype t)
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)  \n  jnb 0f \n fxch \n0: fstp %st(1)\n'];
instruction pattern FMIN(maddrmode a, fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)  \n   jb 0f \n fxch \n0: fstp %st(1)\n'];
instruction pattern FPREM(fputype t)
	means[PUSH(ST,(t)MOD( (t)POP(ST),(t)POP(ST)))]
	assembles['fxch\n fprem\n fstp %st(1)'];
/* conditional instructions */
/*instruction pattern FIFGOTO(label l, maddrmode a,fcondition c,int t, fputype t2)
	means[if((t)c((t2)POP(ST), ^((ref ieee32)a)))goto l]
	assembles['fcompl  ' a ' \n push %ax\n fstsw %ax\n sahf\npop %ax\n j' c '    ' l];*/
instruction pattern FIFGOTOgeneral(label l,  fcondition c,int t, fputype t2)
	means[if((t)c((t2)POP(ST), (t2)POP(ST)))goto l]
	assembles['fxch\n fcompp \npush %ax  \n fstsw %ax\n sahf\n pop %ax\n j' c '   ' l];
instruction pattern IFLITGOTO(label l,addrmode r1,signed r2,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const r2))goto l]
	assembles[' cmp't'  $' r2 ',  '  r1 '\n j' c '   '  l];
instruction pattern BIFLITGOTO(label l,baddrmode r1,signed arg2,condition c,signed t)
	means[if(c((t) ^(r1),const arg2))goto l]
	assembles[' cmp't'  $' arg2 ',  '  r1 '\n j' c '   '  l];
instruction pattern IFGOTOB(label l,bsreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int8) r2))goto l]
	assembles['cmpb ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFGOTOW(label l,hwsreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int16) r2))goto l]
	assembles['cmpw ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFGOTODW(label l,wsreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int32) r2))goto l]
	assembles['cmpl ' r2 ',' '  '  r1 '\n j' c '   ' l];
instruction pattern IFGOTOQW(label l,sreg r1, regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c(^(r1),(int64)r2))goto l]
	assembles['cmpq 'r2',' ' 'r1'\n j'c' 'l];
instruction pattern IFASS(signedreg r1,regaddrimmediate r2,condition c,anyreg r3,addrmode rm, type t )
	means[if((int8)c((t) ^(r1),(t) r2))(ref t)rm:= (t)^(r3)]
	assembles['cmp't '  'r2 ',' '  '  r1 '\n mov't ' 'rm',' r1'\n cmov'c t' 'r3','r1'\n mov't ' 'r1 ',' rm];
instruction pattern ANDIFGOTO(label l,anyreg r1, reg r2,condition c,int t,int b,anyreg r3, reg r4, condition c2, int t2,int b)
	means[if((b)AND((b)c((t) ^(r1),(t) r2),(b)c2((t2)^(r3),(t2)r4)))goto l]
	assembles['andifgoto ' c','r1',' r2','c2','r3','  r4 ',' l','t','t2];
/*
*/
/* 32 bit push onto the stack should not be used on the opteron */
/*
\subsection{MMX registers and instructions}
\subsubsection{Registers}
*/
register doubleword MM0	assembles[ '%MM0'];
register doubleword MM1	assembles[ '%MM1'];
register doubleword MM2	assembles[ '%MM2'];
register doubleword MM3	assembles[ '%MM3'];
register doubleword MM4	assembles[ '%MM4'];
/* reserve for working space */
reserved register doubleword MM7	assembles[ '%MM7'];
reserved register doubleword MM5	assembles[ '%MM5'];
reserved register doubleword MM6	assembles[ '%MM6'];
/** used for operations using half registers */
alias register word MM0L=MM0(0:31)	assembles['%MM0'];
alias register word MM1L=MM1(0:31)	assembles['%MM1'];
alias register word MM2L=MM2(0:31)	assembles['%MM2'];
alias register word MM3L=MM3(0:31)	assembles['%MM3'];
alias register word MM4L=MM4(0:31)	assembles['%MM4'];
alias register word MM5L=MM5(0:31)	assembles['%MM5'];
/* used for 16 bit parallelism */
alias register int16 vector(4) MM016=MM0(0:63)	assembles['%MM0'];
alias register int16 vector(4) MM116=MM1(0:63)	assembles['%MM1'];
alias register int16 vector(4) MM216=MM2(0:63)	assembles['%MM2'];
alias register int16 vector(4) MM316=MM3(0:63)	assembles['%MM3'];
alias register int16 vector(4) MM416=MM4(0:63)	assembles['%MM4'];
alias register int16 vector(4) MM516=MM5(0:63)	assembles['%MM5'];
alias register int32 vector(2) MM032=MM0(0:63)	assembles['%MM0'];
alias register int32 vector(2) MM132=MM1(0:63)	assembles['%MM1'];
alias register int32 vector(2) MM232=MM2(0:63)	assembles['%MM2'];
alias register int32 vector(2) MM332=MM3(0:63)	assembles['%MM3'];
alias register int32 vector(2) MM432=MM4(0:63)	assembles['%MM4'];
alias register int32 vector(2) MM532=MM5(0:63)	assembles['%MM5'];
alias register int8 vector(8) MM08=MM0(0:63)	assembles['%MM0'];
alias register int8 vector(8) MM18=MM1(0:63)	assembles['%MM1'];
alias register int8 vector(8) MM28=MM2(0:63)	assembles['%MM2'];
alias register int8 vector(8) MM38=MM3(0:63)	assembles['%MM3'];
alias register int8 vector(8) MM48=MM4(0:63)	assembles['%MM4'];
alias register int8 vector(8) MM58=MM5(0:63)	assembles['%MM5'];
alias register uint8 vector(8) MM08u=MM0(0:63)	assembles['%MM0'];
alias register uint8 vector(8) MM18u=MM1(0:63)	assembles['%MM1'];
alias register uint8 vector(8) MM28u=MM2(0:63)	assembles['%MM2'];
alias register uint8 vector(8) MM38u=MM3(0:63)	assembles['%MM3'];
alias register uint8 vector(8) MM48u=MM4(0:63)	assembles['%MM4'];
alias register uint8 vector(8) MM58u=MM5(0:63)	assembles['%MM5'];
pattern im8reg	means[MM48|MM38|MM58|MM08|MM18|MM28];
pattern im8ureg	means[MM48u|MM38u|MM58u|MM08u|MM18u|MM28u];
pattern im4reg	means[MM416|MM316|MM516|MM016|MM116|MM216];
pattern im2reg	means[MM432|MM332|MM532|MM032|MM132|MM232];
pattern untypedmreg	means [MM1|MM3|MM4|MM5|MM2|MM0|MM7|MM6];
pattern wmreg	means[MM1L|MM3L|MM4L|MM2L|MM0L|MM5L];
pattern lmreg	means [MM1L|MM3L|MM4L| MM2L|MM0L| MM5L];
pattern mreg	means[im4reg|untypedmreg|im8reg|im8ureg|im2reg];
/*
 Addressing modes
*/
pattern mrmaddrmode	means[maddrmode|mreg];
/*
 MMX instructions
*/
instruction pattern PMULLW(im4reg m, mrmaddrmode ma)
	means[m := (int16 vector(4))*((int16 vector(4))^(m),(int16 vector(4))^(ma))]
	assembles['pmullw ' ma ',' m];
instruction pattern PMULLSSB(im8reg m1,  mrmaddrmode ma)
	means[m1:= (int8 vector(8))*:((int8 vector(8))^(m1),(int8 vector(8))^(ma))]
	assembles['pxor %MM7,%MM7'   /* clear regs mm5 and mm7*/
    '\n pxor %MM5,%MM5'
    '\n punpckhbw 'ma',%MM7' /* mm7 now has 4 words with the top 4 bytes of ma in them */
    '\n pxor %MM6,%MM6'
    '\n punpckhbw 'm1',%MM6'
    '\n punpcklbw 'ma',%MM5'
                  '\n pmulhw %MM6,%MM7'
                  '\n psraw $7,%MM7'
              '\n pxor %MM6,%MM6'
           '\n punpcklbw 'm1',%MM6'
                  '\n pmulhw %MM6,%MM5'
    '\n psraw $7,%MM5'
    '\n packsswb  %MM7,%MM5'
    '\n movq %MM5,'m1];
pattern doublemreg means[mreg|doublexmreg];
instruction pattern MMXPUSH(doublemreg m)
	means[PUSH(mainSTACK,m)]
	assembles['sub $8,%rsp\n movq 'm',(%rsp)'];
instruction pattern MMXPOP(doublemreg m )
	means[m:=(doubleword)POP(mainSTACK)]
	assembles['movq (%rsp),'m'\n add $8,%rsp'];
instruction pattern PADDD(mreg m, mrmaddrmode ma)
	means[(ref int32 vector(2))m := (int32 vector(2))+((int32 vector(2))^(m),(int32 vector(2))^(ma))]
	assembles ['paddd 'ma ',' m];
instruction pattern PSUBD(mreg m, mrmaddrmode ma)
	means[(ref int32 vector(2))m := (int32 vector(2))-((int32 vector(2))^(m),(int32 vector(2))^(ma))]
	assembles ['psubd 'ma ',' m];
instruction pattern PADDW(im4reg m, mrmaddrmode ma)
	means[(ref int16 vector(4))m := (int16 vector(4))+((int16 vector(4))^(m),(int16 vector(4))^(ma))]
	assembles ['paddw 'ma ',' m];
instruction pattern PADDB(im8reg m, mrmaddrmode ma)
	means[(ref int8 vector(8))m := (int8 vector(8))+((int8 vector(8))^(m),(int8 vector(8))^(ma))]
	assembles ['paddb 'ma ',' m];
instruction pattern CMPEQB(mreg m,mrmaddrmode ma)
	means[(ref octet vector(8))m:= (octet vector(8))=((octet vector(8))^(m),(octet vector(8))^(ma))]
	assembles['pcmpeqb 'ma','m];
instruction pattern CMPGTB(mreg m,mrmaddrmode ma)
	means[(ref octet vector(8))m:= (octet vector(8))>((octet vector(8))^(m),(octet vector(8))^(ma))]
	assembles['pcmpgtb 'ma','m];
instruction pattern CMPGTBR(mreg m,mreg ma)
	means[(ref octet vector(8))m:= (octet vector(8))<((octet vector(8))^(ma),(octet vector(8))^(m))]
	assembles['pcmpgtb 'ma','m];
instruction pattern CMPEQD(mreg m,mrmaddrmode ma)
	means[(ref int32 vector(2))m:= (int32 vector(2))EXTEND(=((int32 vector(2))^(m),(int32 vector(2))^(ma)))]
	assembles['pcmpeqd 'ma','m];
instruction pattern CMPGTD(mreg m,mrmaddrmode ma)
	means[(ref int32 vector(2))m:= (int32 vector(2))EXTEND(>((int32 vector(2))^(m),(int32 vector(2))^(ma)))]
	assembles['pcmpgtd 'ma','m];
instruction pattern CMPGTDR(mreg m,mreg ma)
	means[(ref int32 vector(2))m:= (int32 vector(2))EXTEND(<((int32 vector(2))^(ma),(int32 vector(2))^(m)))]
	assembles['pcmpgtd 'ma','m];
 instruction pattern PADDUB(mreg m, mrmaddrmode ma)
	means[(ref uint8 vector(8))m := (uint8 vector(8))+((uint8 vector(8))^(m),(uint8 vector(8))^(ma))]
	assembles ['paddb 'ma ',' m];
instruction pattern PADDSB(im8reg m, mrmaddrmode ma)
	means[m := (int8 vector(8))+:(^(m),(int8 vector(8))^(ma))]
	assembles ['paddsb 'ma ',' m];
instruction pattern PADDSB3(im8reg m,im8reg m2, mrmaddrmode ma)
	means[m := (int8 vector(8))+:(^(m2),(int8 vector(8))^(ma))]
	assembles ['movq 'm2','m'\n paddsb 'ma ',' m];
instruction pattern PADDUSB(mreg m, mrmaddrmode ma)
	means[(ref uint8 vector(8))m := (uint8 vector(8))+:((uint8 vector(8))^(m),(uint8 vector(8))^(ma))]
	assembles ['paddusb 'ma ',' m];
/* stack add instructions */
 instruction pattern SPADDUSB(mreg m )
	means[(ref uint8 vector(8))m := (uint8 vector(8))+:((uint8 vector(8))POP(mainSTACK),(uint8 vector(8))POP(mainSTACK))]
	assembles ['movq (%esp),'m
  '\n paddusb 8(%esp),'m
  '\n add $16,%esp'];
instruction pattern SPADDUB(mreg m )
	means[(ref uint8 vector(8))m := (uint8 vector(8))+((uint8 vector(8))POP(mainSTACK),(uint8 vector(8))POP(mainSTACK))]
	assembles ['movq (%esp),'m
  '\n paddb 8(%esp),'m
  '\n add $16,%esp'];
instruction pattern SPADDSB(im8reg m )
	means[m := (int8 vector(8))+:((int8 vector(8))POP(mainSTACK),(int8 vector(8))POP(mainSTACK))]
	assembles ['movq (%esp),'m
  '\n paddsb 8(%esp),'m
  '\n add $16,%esp'];
instruction pattern SPSUBD(mreg m )
	means[(ref int32 vector(2))m := (int32 vector(2))-((int32 vector(2))^(m),(int32 vector(2))POP(mainSTACK))]
	assembles ['psubd (%esp),'m '\n add $8,%esp' ];
instruction pattern PSUBW(im4reg m, mrmaddrmode ma)
	means[(ref int16 vector(4))m := (int16 vector(4))-((int16 vector(4))^(m),(int16 vector(4))^(ma))]
	assembles ['psubw 'ma ',' m];
instruction pattern PSUBB(im8reg m, mrmaddrmode ma)
	means[(ref int8 vector(8))m := (int8 vector(8))-((int8 vector(8))^(m),(int8 vector(8))^(ma))]
	assembles ['psubb 'ma ',' m];
instruction pattern PSUBUB(mreg m, mrmaddrmode ma)
	means[(ref uint8 vector(8))m := (uint8 vector(8))-((uint8 vector(8))^(m),(uint8 vector(8))^(ma))]
	assembles ['psubb 'ma ',' m];
instruction pattern PSUBSB(im8reg m, mrmaddrmode ma)
	means[(ref int8 vector(8))m := (int8 vector(8))-:((int8 vector(8))^(m),(int8 vector(8))^(ma))]
	assembles ['psubsb 'ma ',' m];
instruction pattern PSUBUSB(mreg m, mrmaddrmode ma)
	means[(ref uint8 vector(8))m := (uint8 vector(8))-:((uint8 vector(8))^(m),(uint8 vector(8))^(ma))]
	assembles ['psubusb 'ma ',' m];
instruction pattern PAND(mreg m, mrmaddrmode ma)
	means[m := AND(^(m),^(ma))]
	assembles ['pand 'ma ',' m];
instruction pattern PANDN(mreg m, mrmaddrmode ma)
	means[m := AND(^(ma),NOT(^(m)))]
	assembles ['pandn 'ma ',' m];
instruction pattern POR(mreg m, mrmaddrmode ma)
	means[m := OR(^(m),^(ma))]
	assembles ['por 'ma ',' m];
instruction pattern MOVDST(waddrmode rm, wmreg m)
	means[(ref word)rm:= ^(m)]
	assembles['movd 'm ','rm];
instruction pattern MOVDRX(reg r, doublexmreg x)
	means[r:=^(x)]
	assembles['movd 'x','r];
instruction pattern MOVDXR(reg x, doublexmreg r)
	means[r:=^(x)]
	assembles['movd 'x','r];
define(MOVDS,MOVDST)
instruction pattern MOVDL(waddrmode rm, wmreg m)
	means[m := (word)^(rm)]
	assembles['movd 'rm ','m];
instruction pattern MOVOCTUINTL(addrmode rm, mreg m)
	means[m := (uint8 vector(8))^(rm)]
	assembles['movq ' rm ',' m];
instruction pattern MOVQSR(mriscmode rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];
instruction pattern MOVQS(maddrmode rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];
instruction pattern MOVOCTUINTS(maddrmode rm,mreg m)
	means[(ref uint8 vector(8))rm:=^(m)]
	assembles['movq 'm','rm];
instruction pattern MOVQL(maddrmode rm, mreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' rm ',' m'\n prefetchnta 128+'rm];
instruction pattern MOVQLR(im8reg rm, im8reg m)
	means[m := ^(rm)]
	assembles['movq ' rm ',' m];
instruction pattern PACKSSDW(reg r, mreg m)
	means[(ref int16 vector(4))m:=^((ref int32 vector(4))mem(r))]
	assembles['movq ('r'),'m'\n packssdw 8('r'),'m];
instruction pattern PACKSSWB(reg r, im8reg m)
	means[(ref int8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq ('r'),'m'\n packsswb $8('r'),'m];
instruction pattern PACKUSWB(reg r, mreg m)
	means[(ref uint8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq ('r'),'m'\n packuswb $8('r'),'m];
instruction pattern INTMAX(reg r1,reg r2)
	means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n cmovg 'r2','r1];
instruction pattern INTMIN(reg r1,reg r2)
	means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n  cmovl 'r2','r1];
instruction pattern IIDIV(fputype t)
	means [PUSH(mainSTACK,(int64)div((t)POP(ST),(t)POP(ST)))]
	assembles['sub $8,%rsp \nfdivp\n fistpq (%rsp)'];
pattern innersmaddrmode(eaform f)
	means [mem(f)]
	assembles [f];
pattern smaddrmode	means[innersmaddrmode|sxmreg];
pattern rm	means [maddrmode|reg];
operation slt	means <	assembles ['lt'];
operation sle	means <=	assembles ['le'];
operation seq	means =	assembles ['eq'];
operation  rslt	means >	assembles ['lt'];
operation  rsle	means >=	assembles ['le'];
pattern scmp	means [ slt|sle|seq];
pattern rscmp	means [rslt|rsle];
pattern pcmp	means[seq|gt];
operation sdiv	means div	assembles ['div'];
operation min	means MIN	assembles ['MIN'];
operation max	means MAX	assembles ['MAX'];
operation addsat	means +:	assembles ['adds'];
operation subsat	means -:	assembles ['subs'];
pattern soperator	means[add|mul|sdiv|sub|min|max];
pattern coperator	means[min|max];
pattern nonlog	means [add|sub|min|max|addsat|subsat];
/*
 XMMX instructions
*/
instruction  pattern OPSD(soperator op, xmmr64m rm,xmmr64 r1)
	means[ (ref ieee64) r1 :=op( ( ieee64)^( r1),( ieee64)^(  rm))]
	assembles[op 'sd  '    rm ',' r1];
instruction  pattern OPSS(soperator op, smaddrmode rm,sxmreg r1)
	means[ (ref ieee32) r1 :=op(^ ( r1),( ieee32)^(  rm))]
	assembles[op 'ss  ' rm ',' r1];
instruction  pattern BOPSS(  sxmreg r1)
	means[ (ref ieee32) r1 :=SQR( ( ieee32)^(  r1))]
	assembles[  'mulss  ' r1 ',' r1];
instruction  pattern ADDSS( smaddrmode rm,sxmreg r1)
 /* this knows about + commuting OPSS does not */
	means[ (ref ieee32) r1 :=+( ( ieee32)^( r1),( ieee32)^(  rm))]
	assembles['addss  ' rm ',' r1];
instruction  pattern OPPS(soperator op, xmreg rm,xmreg r1)
	means[  (ref ieee32 vector(4))r1 :=op( (ieee32 vector(4))^( r1), (ieee32 vector(4))^(  rm))]
	assembles[op 'ps  '    rm ',' r1];
instruction  pattern OPPD(soperator op, xmreg rm,xmreg r1)
	means[  (ref ieee64 vector(2)) r1 :=op( (ieee64 vector(2)) ^( r1), (ieee64 vector(2))^(  rm))]
	assembles[op 'pd  '    rm ',' r1];
instruction  pattern OPPI8(nonlog op, bxmreg rm,bxmreg r1)
	means[  (ref int8 vector(16)) r1 :=op( (int8 vector(16)) ^( r1), (int8 vector(16))^(  rm))]
	assembles['p'op 'b  '    rm ',' r1];
instruction  pattern OPPI16(nonlog op, xmreg rm,xmreg r1)
	means[  (ref int16 vector(8)) r1 :=op( (int16 vector(8)) ^( r1), (int16 vector(8))^(  rm))]
	assembles['p'op 'w  '    rm ',' r1];
instruction  pattern STORUPI16( smaddrmode rm,xmreg r1)
	means[  (ref int16 vector(8)) rm := (int16 vector(8))^(r1)]
	assembles['movdqu  '    r1 ', ' rm  '#STORUPI16'];
instruction  pattern STORUDQ( smaddrmode rm,xmreg r1)
	means[    rm :=  ^(r1)]
	assembles['movdqu  '    r1 ', ' rm  '#STORUDQ'];
instruction pattern MOVDQS(smaddrmode rm,xmreg r1)
	means[ (ref quadword)rm := ^(r1)]
	assembles['movdqu 'r1','rm   '#MOVQDS'];
instruction pattern MOVDQL(smaddrmode rm,xmreg r1)
	means[ (ref quadword)r1 := ^(rm)]
	assembles['movdqu 'rm','r1   '#MOVQDL'];
instruction  pattern MOVUPI16( smaddrmode r1,xmreg rm)
	means[   rm := (int16 vector(8))^(r1)]
	assembles['movdqu  '    r1 ', ' rm '#MOVUPI16'];
instruction  pattern OPPI32(nonmultoperator op, xmreg rm,xmreg r1)
	means[  (ref int32 vector(4)) r1 :=op( (int32 vector(4)) ^( r1), (int32 vector(4))^(  rm))]
	assembles['p'op 'l  '    rm ',' r1];
instruction pattern PANDNx(xmreg m, xmreg ma,xmreg m2)
	means[m2 := AND(^(ma ),NOT( ^(m )))]
	assembles ['pandn 'ma ',' m '\n movdqa 'm','m2];
instruction  pattern STORUPI32( smaddrmode rm,xmreg r1)
	means[  (ref int32 vector(4)) rm := (int32 vector(4))^(r1)]
	assembles['movdqu  '    r1 ', ' rm  '#STORUPI32'];
instruction  pattern MOVUPI32( smaddrmode rm,xmreg r1)
	means[   r1 := (quadword)^(rm)]
	assembles['movdqu  '    rm ', ' r1 '#MOVUPI32\n  '];
instruction  pattern STORUPD( smaddrmode rm,xmreg r1)
	means[  (ref ieee64 vector(2)) rm := (ieee64 vector(2))^(r1)]
	assembles['movupd  '    r1 ', ' rm];
instruction  pattern MOVUPD( smaddrmode r1,xmreg rm)
	means[   rm := (ieee64 vector(2))^(r1)]
	assembles['movupd  '    r1 ', ' rm];
instruction  pattern STORUPS( maddrmode rm,xmreg r1)
	means[ (ref ieee32 vector(4))rm :=(ieee32 vector(4))^(r1)]
	assembles['movups  '    r1 ', ' rm];
instruction  pattern MOVAPS( xmreg rm,xmreg r1)
	means[ (ref ieee32 vector(4))rm :=(ieee32 vector(4))^(r1)]
	assembles['movaps  '    r1 ', ' rm];
instruction pattern SSQRT(sxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtss 'r','r];
instruction pattern SDSQRT(xmmr64 r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtsd 'r','r];
instruction  pattern MOVUPS( maddrmode rm,xmreg r1)
	means[   r1 :=(ieee32 vector(4))^(rm)]
	assembles['movups  '    rm ', ' r1];
instruction  pattern MOVRRPS( xmreg rm,xmreg r1)
	means[   r1 :=(ieee32 vector(4))^(rm)]
	assembles['movups  '    rm ', ' r1];
instruction  pattern MOVSS( smaddrmode rm,sxmreg r1)
	means[ (ref ieee32) r1 :=^((ref ieee32) rm)]
	assembles['movss  '    rm ', ' r1'#MOVSS'];
instruction  pattern POPSS( sxmreg r1)
	means[ (ref ieee32) r1 :=(ieee32)POP(ST)]
	assembles['subq $4,%rsp\n '
                  'fstps (%rsp)\n'
                  'movss  '   '(%rsp), ' r1'\n add $4,%rsp'];
instruction  pattern MOVSD( xmmr64m rm,xmmr64 r1)
	means[ (ref ieee64) r1 :=^((ref ieee64) rm)]
	assembles['movsd  '    rm ', ' r1];
instruction  pattern POPSD( xmmr64 r1)
	means[ (ref ieee64) r1 :=(ieee64)POP(ST)]
	assembles['subq $8,%rsp\n '
                  'fstpl (%rsp)\n '
                  'movsd  '    ' (%rsp), ' r1'\n addq $8,%rsp'];
instruction pattern MOVDl(rm src, lowreg dest)
	means[dest:= ^(src)]
	assembles['movd 'src', 'dest];
instruction pattern MOVDs(rm dest, lowreg src)
	means[dest:= ^(src)]
	assembles['movd 'src',  'dest];
/* Checking is required on exact procedure for loading in literals */
instruction pattern XRLOADLIT(float f,float t,sxmreg r1)
	means[ (ref ieee32)r1:=(t)const f]
	assembles['movss 0f,'r1
   '\n .section .data'
  ' \n 0:\n.float 'f
  '\n .section .text'
 ];
instruction pattern XRDLOADLIT(real f,real t,xmmr64 r1)
	means[ (ref ieee64)r1:=(t)const f]
	assembles['movsd 0f,'r1
   '\n jmp 1f'
  ' \n0:\n.double 'f
  '\n1:'];
instruction  pattern CVTSD2SI( xmmr64m rm,reg r1)
	means[ (ref int32) r1 :=(int32)ROUND((ieee64)^(  rm))]
	assembles['cvtsd2si  '    rm ', ' r1];
instruction  pattern CVTSS2SI( sxmregm rm,wreg r1)
	means[ (ref int32) r1 :=(int32)ROUND((ieee32)^(  rm))]
	assembles['cvtss2si  '    rm ', ' r1];
instruction  pattern CVTSI2SD( reg rm,xmmr64 r1)
	means[ (ref ieee64) r1 :=(ieee64)FLOAT((int32)^(  rm))]
	assembles['cvtsi2sd  '    rm ', ' r1];
instruction  pattern CVTSI2SS( waddrmode rm,sxmreg r1)
	means[ (ref ieee32) r1 :=(ieee32)FLOAT(^( (ref int32) rm))]
	assembles['cvtsi2ss  '    rm ', ' r1];
instruction  pattern CVTIR2SSQ( ireg r0,sxmreg r1)
	means[ (ref ieee32) r1 :=(ieee32)FLOAT(^(   r0))]
	assembles['cvtsi2ss  '    r0 ', ' r1];
instruction  pattern STORESS( smaddrmode rm,sxmreg r1)
	means[ (ref ieee32) rm :=( ieee32)^( r1)]
	assembles['movss  '    r1 ',' rm '#STORESS'];
instruction  pattern STORESD(smaddrmode rm,xmmr64 r1)
	means[ (ref ieee64) rm :=( ieee64)^( r1)]
	assembles['movsd  '    r1 ',' rm];
instruction pattern SSRPUSH(sxmreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['subq $4,%rsp\n movss 'r',(%rsp)'];
instruction pattern SSRPOP(sxmreg r)
	means[(ref ieee32)r:=(ieee32)POP(mainSTACK)]
	assembles[' movss (%rsp),'r '\n addq $4,%rsp #SSRPOP'];
instruction pattern SSRPOPI(sxmreg r)
	means[(ref ieee32)r:=(ieee32)FLOAT((int32)POP(mainSTACK))]
	assembles[' cvtsi2ss (%rsp),'r'\n addq $4,%rsp'];
instruction pattern COMISSIFGOTO(label l,sxmreg r1,sxmreg r2,fcondition c, type t)
	means[if((t)c(^(r1),^(r2)))goto l]
	assembles['comiss ' r2 ','  r1 '\n j' c ' ' l];
instruction  pattern CMPPS(scmp op, xmreg r1,xmreg r2,xmreg r )
	means[  (ref int32 vector(4)) r  :=EXTEND(op( (ieee32 vector(4)) ^( r2), (ieee32 vector(4))^(  r1)))]
	assembles['cmp'op 'ps  '    r1 ',' r2'\n movdqa ' r2','r ];
instruction  pattern RCMPPS(rscmp op, xmreg r1,xmreg r2,xmreg r )
	means[  (ref int32 vector(4)) r :=EXTEND(op( (ieee32 vector(4)) ^( r2), (ieee32 vector(4))^(  r1)))]
	assembles['cmp'op 'ps  '    r2 ',' r1'\n movdqa ' r1','r ];
instruction pattern CMPSS(scmp c,sxmreg r1,sxmreg r2, wreg r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['cmp'c'ss 'r1 ',' r2
    '\n movd 'r2', 'r];
instruction pattern CMPSD(scmp c,dxmreg r1,doublexmreg r2, wreg r)
	means[r2:=(int64)EXTEND( c(^(r2),^(r1)))]
	assembles['cmp'c'ss 'r1 ',' r2
     ];
instruction pattern XCMPEQD(xmreg m,xmreg ma,pcmp c)
	means[(ref int32 vector(4))m:= (int32 vector(4))EXTEND(c((int32 vector(4))^(m),(int32 vector(4))^(ma)))]
	assembles['pcmp'c'd 'ma','m];
instruction pattern XCMPGTD(xmreg m,xmreg ma)
	means[(ref int32 vector(4))m:= (int32 vector(4))EXTEND(>((int32 vector(4))^(m),(int32 vector(4))^(ma)))]
	assembles['pcmpgtd 'ma','m];
instruction pattern XCMPGTDR(xmreg m,xmreg ma)
	means[(ref int32 vector(4))m:= (int32 vector(4))EXTEND(<((int32 vector(4))^(ma),(int32 vector(4))^(m)))]
	assembles['pcmpgtd 'ma','m];
/*instruction pattern PCMPIDS(pcmp c,ixsmreg r1,ixsmreg r2, wreg r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['pcmp'c'd 'r1 ',' r2
    '\n movd 'r2', 'r];*/
instruction pattern RCMPSS(rscmp c,sxmreg r1,sxmreg r2, wreg r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['cmp'c'ss 'r2 ',' r1
    '\n movd 'r1', 'r];
instruction pattern COMISS(fcondition c,sxmreg r1,sxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['comiss 'r1 ',' r2
  '\n set'c ' ' r
  '\n not 'r
  '\n inc 'r];
instruction pattern FREP4(xmreg m, wreg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movups (%rsp),'m'\n add $16,%rsp'];
instruction pattern MOVQSD(maddrmode rm, dmreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];
instruction pattern MOVQLD(maddrmode rm, dmreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' rm ',' m];
instruction pattern PSQRT(xmreg r)
	means [(ref ieee32 vector(4))r:= SQRT((ieee32 vector(4))^(r))]
	assembles['sqrtps 'r','r];
/*
 AVX32
*/
/* define the groups of ymmreg and xmmreg types*/
pattern xmreg	means[ ubxmreg|sbxmreg|uwxmreg|swxmreg|ixmreg];
pattern ymreg	means[fymreg|dymreg ];
/* scalar registers */
pattern sxmreg	means[xmreg|fxmreg];
/* address and register modes */
pattern ymaddrmode	means[maddrmode|ymreg];
pattern dymaddrmode	means[maddrmode|dymreg];
pattern xmaddrmode	means[maddrmode|xmreg];
pattern smaddrmode	means[maddrmode|sxmreg];
pattern fmaddrmode	means[maddrmode|fxmreg];
pattern dmaddrmode	means[maddrmode|dxmreg];
pattern rmaddrmode	means [maddrmode|reg];
/* Operations */
operation sdiv	means div	assembles ['div'];
operation min	means MIN	assembles ['MIN'];
operation max	means MAX	assembles ['MAX'];
operation pand	means AND	assembles ['and'];
operation por	means OR	assembles['or'];
operation adds	means +:	assembles['adds'];
pattern soperator	means[add|mul|sdiv|sub|min|max];
pattern boperator	means[add|sub|adds|min|max|pand|por];
pattern coperator	means[min|max];
pattern loperator	means[por|pand];
pattern smoperator	means[coperator|nonmultoperator];
operation vlt	means <	assembles ['lt'];
operation veq	means =	assembles ['eq'];
operation vle	means <=	assembles ['le'];
pattern condoperator	means[ vle|veq| vlt];
/* AVX instructions */
pattern ybop	means[pand|por];
instruction pattern YBOOL(ybop op, ymreg rm,ymreg r1, ymreg r2)
	means[r1 :=op( ^( r2),^(  rm))]
	assembles['v' op 'ps  '    r1 ',' r2 ',' rm '; '];
instruction pattern XPANDNPS(ymreg m, ymaddrmode ma,ymreg m2)
	means[m := AND(NOT(^(m2)),^(ma))]
	assembles ['vandnps 'ma ','m2',' m];
instruction pattern XPANDNPD(ymreg m, ymaddrmode ma,ymreg m2)
	means[m := AND(NOT(^(m2)),^(ma))]
	assembles ['vandnpd 'ma ','m2',' m];
changequote(`<',`>')
define(oppat,
instruction  pattern OP$1$2($3operator op, $5mreg rm,$5mreg r1, $5mreg r2, type t)
	means[(ref t)r1 :=op((t) ^( r2),(t)^(  rm))]
	assembles['v$6' op '$1$2' ' '    rm <','> r2 <','> r1 '# OP$1$2'];
)
define(cmppat,
instruction  pattern CMP$1$2($3operator op, $4maddrmode rm,$7mreg r1, $5mreg r2 )
	means[    r1 :=EXTEND(op(  ^( r2), ^(  rm)))]
	assembles['v$6cmp'op '$1$2  '   rm <','> r2 <','> r1 '# CMP$1$2' ];
)
define(stpat,
instruction  pattern ST$1$2$3(maddrmode rm<,>$3mreg r1  )
	means[    rm :=  ^(  r1)]
	assembles['vmov$1$4  '   r1   <','> rm '# ST$1$2$3'];
)
define(ldpat,
instruction  pattern LD$1$2$3($2maddrmode rm<,>$3mreg r1  )
	means[    r1 :=   ^(  rm)]
	assembles['vmov$1$4  '   rm   <','> r1 '# LD$1$2$3'];
)
changequote()
oppat(s,d,s,s,dx)
ldpat(q,,dx,,doubleword)
stpat(q,,dx,)
oppat(s,s,s,s,fx)
ldpat(d,,fx,,word)
stpat(d,,fx,)
oppat(b, ,b,x,sbx,p)
oppat(w, ,b,x,swx,p)
oppat(d, ,s,x,ix,p)
 
oppat(b,u,b,x,ubx,p)
oppat(w,u,b,x,uwx,p) 
ldpat(dq,,x,u)
stpat(dq,,x,u)
oppat(p,s,s,y,fy)
cmppat(p,s,cond,y,fy,,y)
ldpat(dq,y,y,u)
stpat(dq,y,y,u)
oppat(p,d,s,y,dy)
cmppat(p,d,cond,y,dy,,y)
ldpat(dq,dy,y,u)
stpat(dq,dy,y,u)
instruction  pattern CMPsd(condoperator op, doublexmreg rm,doublexmreg r1, doublexmreg r2 )
	means[    r1 :=EXTEND(op(  ^( r2), ^(  rm)))]
	assembles['vcmp'op 'sd  '   rm ',' r2 ',' r1 '# CMPpd' ];
define(OPins, OPsd|OPss|/*OPw|OPd|OPb|OPbu|OPwu*/OPps|OPpd|CMPps|CMPpd|CMPsd)
define(LDins, LDqdx|LDdfx|LDdqx|LDdqyy|LDdqdyy)
define(STins, STqdx|STdfx|STdqx|STdqyy|STdqdyy)
operation slt	means <	assembles ['lt'];
operation sle	means <=	assembles ['le'];
operation seq	means =	assembles ['eq'];
pattern scmp	means [ slt|sle|seq];
pattern nonlog	means [add|sub|min|max];
instruction pattern SSQRT(fxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtss 'r','r];
instruction pattern SDSQRT(dxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtsd 'r','r];
instruction pattern PSSQRT(fymreg r,ymaddrmode m)
	means [ r:= SQRT((ieee32 vector(8))^(m))]
	assembles['vsqrtps 'r','m];
instruction pattern PDSQRT(dymreg r,ymaddrmode m)
	means [ r:= SQRT((ieee32 vector(8))^(m))]
	assembles['vsqrtpd 'r','m];
define(SQRTins,SSQRT|SDSQRT|PSSQRT|PDSQRT)
/* fma instructions */
instruction  pattern VFMADD132PS(  ymaddrmode ym2,fymreg y0, fymreg y1, type t)
	means[(ref t)y0 :=+(*((t) ^( y0),(t)^(  ym2)),^(y1))]
	assembles['VFMADD132PS  '    y0 ',' y1 ',' ym2 ];
instruction  pattern VFMADD213PS(  ymaddrmode ym2,fymreg y0, fymreg y1, type t)
	means[(ref t)y0 :=+(*((t) ^( y0),(t)^(  y1)),^(ym2))]
	assembles['VFMADD213PS  '    y0 ',' y1 ',' ym2 ];
instruction  pattern VFMADD231PS(  ymaddrmode ym2,fymreg y0, fymreg y1, type t)
	means[(ref t)y0 :=+(*((t) ^( y1),(t)^(  ym2)),^(y0))]
	assembles['VFMADD231PS  '    y0 ',' y1 ',' ym2 ];
define(FMAps, VFMADD213PS|VFMADD132PS|VFMADD231PS)
/* compares */
instruction pattern COMISSIFGOTO(label l,fxmreg r1,fxmreg r2,fcondition c,int t)
	means[if((t)c(^(r1),^(r2)))goto l]
	assembles['vcomiss ' r2 ','  r1 '\n j' c '   ' l];
instruction pattern COMISS(fcondition c,fxmreg r1,fxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['vcomiss 'r2 ',' r1 '\n set'c ' ' r];
instruction pattern COMISDIFGOTO(label l,dxmreg r1,dxmreg r2,fcondition c,int t)
	means[if((t)c(^(r1),^(r2)))goto l]
	assembles['vcomisd ' r2 ','  r1 '\n j' c '   ' l];
instruction pattern COMISD(fcondition c,dxmreg r1,dxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['vcomisd 'r2 ',' r1 '\n set'c ' ' r];
instruction pattern XRDLOADLIT(real f,real t,dxmreg r1)
	means[ (ref ieee64)r1:=(t)const f]
	assembles['xrdloadlit 'r1','f];
instruction pattern XRLOADLIT(float f,float t,sxmreg r1)
	means[ (ref ieee32)r1:=(t)const f]
	assembles['xrloadlit 'r1','f];
instruction  pattern CVTSS2SI( indexreg r1,fxmreg r0)
	means[ (ref int32) r1 :=(int32)ROUND((ieee32)^(  r0))]
	assembles['cvtss2si  '    r0 ', ' r1];
instruction  pattern CVTSD2SI( dxmreg rm,reg r1)
	means[ (ref int32) r1 :=(int32)ROUND((ieee64)^(  rm))]
	assembles['cvtsd2si  '    rm ', ' r1];
instruction  pattern CVTTSS2SI(wsreg r1,fxmreg r0)
	means[ (ref int32) r1 :=(int32)TRUNCATE((ieee32)^(  r0))]
	assembles['cvttss2si  '    r0 ', ' r1];
instruction  pattern CVTTSD2SI( dxmreg rm,reg r1)
	means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
	assembles['cvttsd2si  '    rm ', ' r1];
instruction  pattern CVTSI2SD( reg rm,dxmreg r1)
	means[ (ref ieee64) r1 :=(ieee64)FLOAT((int32)^(  rm))]
	assembles['cvtsi2sd  '    rm ', ' r1];
instruction  pattern CVTIR2SS( wsreg r0,fxmreg r1)
	means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  r0))]
	assembles['cvtsi2ss  '    r0 ', ' r1];
instruction pattern FREP8(fymreg r, maddrmode m)
	means[r:=rep((ieee32)^ (m),8)]
	assembles['vbroadcastss 'r ',' m];
instruction pattern FREP4(dymreg r, maddrmode m)
	means[r:=rep((ieee64)^ (m),4)]
	assembles['vbroadcastsd 'r ',' m];

instruction pattern SLOP(logoperator op)
	means [PUSH(mainSTACK,(doubleword)op((doubleword)POP(mainSTACK),(doubleword)POP(mainSTACK)))]
	 assembles['xchgq (%rsp),%rax \n 'op' 8(%rsp),%rax\n movq %rax,8(%rsp)  \n pop %rax'];
/* operates come before stores, come before moves, come before pushes */
define(YMMXcodes,
/* FMAps|*/
OPins|
SQRTins|
CVTTSS2SI|
CVTTSD2SI|
CVTSS2SI|
CVTSD2SI|
CVTSI2SD|
CVTSI2SS|
CVTSD2SI|
CVTIR2SS|
XRLOADLIT|
XRDLOADLIT|
FREP4|
FREP8|
XPANDNPS|
XPANDNPD|
YBOOL |
COMISDIFGOTO|
COMISD|
COMISSIFGOTO|
COMISS|
STins|
IIDIV|
LDins
 )
/*  */
instructionset [
SELECT|
BOPSS|
OPSS|
OPSD|
PSQRT|
ADDSS|
CVTSI2SD|
CVTSI2SS|
CVTSD2SI|
CVTSS2SI|
CVTIR2SS|
CVTIR2SSQ|
XRLOADLIT|
XRDLOADLIT|
MOVSS|
MOVSD|
SSRPUSH|
FREP4|
SSQRT|
SDSQRT|
PANDN|
OPPS|
OPPD|
STORUPD |
MOVUPD |
COMISSIFGOTO|
COMISS|
CMPSS|CMPSD|
CMPPS|
RCMPPS|
RCMPSS|
XCMPEQD|
XCMPGTD|
XCMPGTDR /*|PCMPIDS */|
OPPI8|/*OPPI8m|OPPI8muc|OPPI8msc|*/
STORUPS|
MOVQSD|
MOVQLD|
MOVDQL|
MOVUPS|
OPPI16|
/*OPPI16m|OPPI16muc|OPPI16msc|*/
MOVUPI16|
STORUPI16 |
OPPI32
|MOVUPI32|
MOVDQS|
STORUPI32|
STORUDQ|
MOVAPS|
STORESS|
STORESD|
POPSS|
POPSD|
MOVRRPS|
SSRPOPI|
SSRPOP|
CLTQ|
MOVDRX|
HWMOVSXB|
HWMOVZXB|
WMOVZXB|
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
FAIL|
GOTO|
SETI|
SETW|
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
BTS|
PLANTLABEL|
PLANTRCONST|
PLANTSCONST|
PLANTQWCONST|
PLANTDWCONST|
PLANTWCONST|
PLANTBCONST|
LOAD|
IMULLIT|
fastIMUL|
fastIMULW|
fastIMULHW|
BIMUL|
IMULLIT|
INC|
DEC|
SHIFT|
RMLIT|
RMR|
RMRB|
RRM|
RRINT64|
RRINT32|
RR32|
RR64|
RR|
/*LEA|*/
fastMUL|
fastMULW|
fastMULHW|
BMUL|
fastBIDIV|
BIDIV|
IDIV64|
CDQ|
IDIV|
IDIV2|
UINT8MAX|
UINT8MIN|
INT8MAX|
INT8MIN|
INTMIN|
INTMAX|
UDIV64|
UDIV32|/*
DIV16|*/
UDIV8|
IMOD64|
UMOD64|/*
MOD32|*/
UMOD32|
Negate|
MNegate|
NOTOP|
REPMOVQ|
REPMOVD|
REPMOVW|
REPMOVB|
STORELIT|
STOREB|
STOREHW|
/*EAXStore|*/STOREW|
STOREDW|
STOREREF|
CLEARREG|
ADDUSB|
ADDSSB|
SUBUSB|
SUBSSB|
MULTSSBAL|
MULTSSB|
FCHS|
FOPF|
/*FLOADLIT|*/
FILOADLIT|
/*FMINp6|FMAXp6|*/FMAX|
FMIN|
FLD|
FLDF|
FLOATLDR|
FILDF|
FILD|
FILDF|
FLOADDLIT|
FILDB|
ReversePolishFOP|
ReversePolishFOPG|
FMOP|
fround|
FPREM|
FOP|
FOPI|
RMULTB|
FISTR|
FSTR|
FSTRF|
FEXT|
EXTENDANY|
FPUSHI64T|
FISTMT|
FISTMTR|
FISTM|
FILDR|
EXTENDANY|
FIFGOTOgeneral|
FSET|
/*FISTB|*/FPUSHI16|
FPOPI64|
FPOPI64FD|
FPUSHR64|
FPOPMS|
LITPUSH|
MEMPUSH|
REFPUSH|
SDEREF|
HWPUSH |
RPUSH|
SMLIT|
SMRP|
SADD|
SMULIT|
SMRADD|
SOP|
SMR|
BSMR|
STACKDWSTORE|
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
HWPOP/*|LOADrui*/|
FPUSHI64|
MOVQS|
PADDD|
PADDW|
PADDB|
PADDSB|
PADDSB3|
PADDUSB|
PADDUB|
SPADDSB|
SPADDUSB|
SPADDUB|
PACKSSDW|
PACKSSWB|
PACKUSWB|
CMPEQB|
CMPGTB|
CMPGTBR|
CMPEQD|
CMPGTD|
CMPGTDR|
PSUBD|
SPSUBD|
PSUBW|
PSUBB|
PSUBSB|
PSUBUSB|
PSUBUB|
POR|
PAND|
PANDNx|
PMULLSSB|
PMULLW|
MOVDS|
MOVDL|
MOVQSR|
MOVQL|
MOVQLR|
MOVOCTUINTS|
MOVOCTUINTL|
MMXPUSH |
YMMXcodes| 
SLOP]
/*
*/
