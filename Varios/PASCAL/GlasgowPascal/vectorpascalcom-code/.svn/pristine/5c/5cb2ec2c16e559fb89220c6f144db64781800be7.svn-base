/*
\subsection{Streaming SIMD registers and instructions for Opteron}
Copyright University of Glasgow (c) 2002
\subsubsection{Registers}
\begin{verbatim}


*/

include(`cpus/gnummx.m4')

register quadword XMM0 assembles[ '%xmm0'];
alias register ieee32 XMM00=XMM0(0:31) assembles['%xmm0'] ;
alias register ieee64 XMM0R64=XMM0(0:63) assembles['%xmm0'] ;
alias register ieee32 vector (4) XMM0R324=XMM0(0:127) assembles['%xmm0'];
alias register ieee64 vector (2) XMM0R642=XMM0(0:127) assembles['%xmm0'];

register quadword XMM1 assembles[ '%xmm1'];
alias register ieee32 XMM10=XMM1(0:31) assembles['%xmm1'] ;
alias register ieee64 XMM1R64=XMM1(0:63) assembles['%xmm1'] ;
alias register ieee32 vector (4) XMM1R324=XMM1(0:127) assembles['%xmm1'];
alias register ieee64 vector (2) XMM1R642=XMM1(0:127) assembles['%xmm1'];

register quadword XMM2 assembles[ '%xmm2'];
alias register ieee32 XMM20=XMM2(0:31) assembles['%xmm2'] ;
alias register ieee64 XMM2R64=XMM2(0:63) assembles['%xmm2'] ;
alias register ieee32 vector (4) XMM2R324=XMM2(0:127) assembles['%xmm2'];
alias register ieee64 vector (2) XMM2R642=XMM2(0:127) assembles['%xmm2'];

register quadword XMM3 assembles[ '%xmm3'];
alias register  ieee32 XMM30=XMM3(0:31) assembles['%xmm3'] ;
alias register ieee64 XMM3R64=XMM3(0:63) assembles['%xmm3'] ;
alias register ieee32 vector (4) XMM3R324=XMM3(0:127) assembles['%xmm3'];
alias register ieee64 vector (2) XMM3R642=XMM3(0:127) assembles['%xmm3'];

register quadword XMM4 assembles[ '%xmm4'];
alias register ieee32 XMM40=XMM4(0:31) assembles['%xmm4'] ;
alias register ieee64 XMM4R64=XMM4(0:63) assembles['%xmm4'] ;
alias register ieee32 vector (4) XMM4R324=XMM4(0:127) assembles['%xmm4'];
alias register ieee64 vector (2) XMM4R642=XMM4(0:127) assembles['%xmm4'];

reserved register quadword XMM5 assembles[ '%xmm5'];
alias register ieee32 XMM50=XMM5(0:31) assembles['%xmm5'] ;
alias register ieee64 XMM5R64=XMM5(0:63) assembles['%xmm5'] ;
alias register ieee32 vector (4) XMM5R324=XMM5(0:127) assembles ['%xmm5'];
alias register ieee64 vector (2) XMM5R642=XMM5(0:127) assembles ['%xmm5'];

reserved register quadword XMM6 assembles[ '%xmm6'];
alias register  ieee32 XMM60=XMM6(0:31) assembles['%xmm6'] ;
alias register ieee64 XMM6R64=XMM6(0:63) assembles['%xmm6'] ;
alias register ieee32 vector (4) XMM6R324=XMM6(0:127) assembles ['%xmm6'];
alias register ieee64 vector (2) XMM6R642=XMM6(0:127) assembles ['%xmm6'];

reserved register quadword XMM7 assembles[ '%xmm7'];
alias register ieee32 XMM70=XMM7(0:31) assembles['%xmm7'] ;
alias register ieee64 XMM7R64=XMM7(0:63) assembles['%xmm7'] ;
alias register ieee32 vector (4) XMM7R324=XMM7(0:127) assembles ['%xmm7'];
alias register ieee64 vector (2) XMM7R642=XMM7(0:127) assembles ['%xmm7'];
/*
alias register doubleword MM0=XMM0(0:63) assembles['%xmm0'] ;
alias register doubleword MM1=XMM1(0:63) assembles['%xmm1'] ;
alias register doubleword MM2=XMM2(0:63) assembles['%xmm2'] ;
alias register doubleword MM3=XMM3(0:63) assembles['%xmm3'] ;
alias register doubleword MM4=XMM4(0:63) assembles['%xmm4'] ;
alias register doubleword MM5=XMM5(0:63) assembles['%xmm5'] ;
alias register doubleword MM6=XMM6(0:63) assembles['%xmm6'] ;
alias register doubleword MM7=XMM7(0:63) assembles['%xmm7'] ; */
 /* low order bits of xmm regs treated as integers */
alias register int32 iXMM00=XMM0(0:31) assembles['%xmm0'] ;
alias register int32 iXMM10=XMM1(0:31) assembles['%xmm1'] ;
alias register int32 iXMM20=XMM2(0:31) assembles['%xmm2'] ;
alias register int32 iXMM30=XMM3(0:31) assembles['%xmm3'] ;
alias register int32 iXMM40=XMM4(0:31) assembles['%xmm4'] ;
alias register int32 iXMM50=XMM5(0:31) assembles['%xmm5'] ;
alias register int32 iXMM60=XMM6(0:31) assembles['%xmm6'] ;
alias register int32 iXMM70=XMM7(0:31) assembles['%xmm7'] ;
pattern isxmreg means[iXMM00|iXMM10|iXMM20|iXMM30|iXMM40|iXMM50];
alias register int32 vector (4) XMM0I324=XMM0(0:127) assembles['%xmm0'];
alias register int32 vector (4) XMM1I324=XMM1(0:127) assembles['%xmm1'];
alias register int32 vector (4) XMM2I324=XMM2(0:127) assembles['%xmm2'];
alias register int32 vector (4) XMM3I324=XMM3(0:127) assembles['%xmm3'];

alias register int32 vector (4) XMM4I324=XMM4(0:127) assembles['%xmm4'];
alias register int32 vector (4) XMM5I324=XMM5(0:127) assembles['%xmm5'];
alias register int32 vector (4) XMM6I324=XMM6(0:127) assembles['%xmm6'];
alias register int32 vector (4) XMM7I324=XMM7(0:127) assembles['%xmm7'];

alias register int16 vector (8) XMM0I16=XMM0(0:127) assembles['%xmm0'];
alias register int16 vector (8) XMM1I16=XMM1(0:127) assembles['%xmm1'];
alias register int16 vector (8) XMM2I16=XMM2(0:127) assembles['%xmm2'];
alias register int16 vector (8) XMM3I16=XMM3(0:127) assembles['%xmm3'];
alias register uint16 vector (8) XMM0U16=XMM0(0:127) assembles['%xmm0'];
alias register uint16 vector (8) XMM1U16=XMM1(0:127) assembles['%xmm1'];
alias register uint16 vector (8) XMM2U16=XMM2(0:127) assembles['%xmm2'];
alias register uint16 vector (8) XMM3U16=XMM3(0:127) assembles['%xmm3'];

alias register int8 vector (16) XMM0I8=XMM0(0:127) assembles['%xmm0'];
alias register int8 vector (16) XMM1I8=XMM1(0:127) assembles['%xmm1'];
alias register int8 vector (16) XMM2I8=XMM2(0:127) assembles['%xmm2'];
alias register int8 vector (16) XMM3I8=XMM3(0:127) assembles['%xmm3'];
alias register int8 vector (16) XMM4I8=XMM4(0:127) assembles['%xmm4'];
alias register int8 vector (16) XMM5I8=XMM5(0:127) assembles['%xmm5'];
alias register int8 vector (16) XMM6I8=XMM6(0:127) assembles['%xmm6'];
alias register int8 vector (16) XMM7I8=XMM7(0:127) assembles['%xmm7'];

alias register uint8 vector (16) XMM0U8=XMM0(0:127) assembles['%xmm0'];
alias register uint8 vector (16) XMM1U8=XMM1(0:127) assembles['%xmm1'];
alias register uint8 vector (16) XMM2U8=XMM2(0:127) assembles['%xmm2'];
alias register uint8 vector (16) XMM3U8=XMM3(0:127) assembles['%xmm3'];

pattern xmregi324 means[XMM0I324|XMM3I324|XMM2I324|XMM1I324|XMM4I324|XMM5I324|XMM6I324|XMM7I324];
pattern uxmreg means [XMM1|XMM3|XMM4|XMM5|XMM6|XMM2|XMM0|XMM7];
pattern sxmreg means[XMM00|XMM10|XMM20|XMM30|XMM40|XMM50|XMM60|XMM70];

pattern ixmreg means[iXMM00|iXMM10|iXMM20|iXMM30|iXMM40|iXMM50|iXMM60|iXMM70];
pattern xmmr64 means[XMM0R64|XMM1R64|XMM2R64|XMM3R64|XMM4R64|XMM5R64|XMM6R64|XMM7R64];

pattern psxmreg means[XMM7R324|XMM6R324|XMM5R324|XMM4R324|XMM3R324|XMM2R324|XMM1R324|XMM0R324];
pattern plx means[psxmreg|xmregi324];
pattern pdxmreg means[XMM7R642|XMM6R642|XMM5R642|XMM4R642|XMM3R642|XMM2R642|XMM1R642|XMM0R642];

pattern xmreg8 means[XMM0I8|XMM3I8|XMM1I8|XMM2I8|XMM4I8|XMM5I8|XMM6I8|XMM7I8];
pattern xmregu8 means[XMM0U8|XMM3U8|XMM1U8|XMM2U8];
pattern xreg8 means[xmreg8|xmregu8];
pattern xmreg16 means[XMM0I16|XMM3I16|XMM1I16|XMM2I16];
pattern xmregu16 means[XMM0U16|XMM3U16|XMM1U16|XMM2U16];
pattern xreg16 means[xmreg16|xmregu16];
pattern xmreg means[psxmreg|pdxmreg|xmregi324|xreg8|xmreg16|uxmreg|xmregu16];
pattern lowintreg means [ixmreg];  
pattern lowreg means[lowintreg| sxmreg];
pattern xmmr64m means[maddrmode|xmmr64];
/* emulate some of the mmx operations using the low quadwords of the xmm regs 
pattern  mreg means [MM1|MM3|MM4|MM5|MM2|MM0|MM7|MM6]; */
/* define m4 macros to generate casts to the desired types */
define(singlequad, (ieee32 vector(4))$1)

define(refsinglequad,(ref ieee32 vector(4))$1)
define(i8x16, int8 vector(16))
define(i16x8, int16 vector(8))
define(i32x4, int32 vector(4))
define(r64x2, ieee64 vector(2))
define(i8x16, int8 vector(16))
define(i16x8, int16 vector(8))
define(i32x4, int32 vector(4))

define(i8x8, int8 vector(8))
define(i16x4, int16 vector(4))
define(i32x2, int32 vector(2))

define(u8x8, uint8 vector(8))
define(u16x4, uint16 vector(4))

define(xshortquad, (int16 vector(8))$1)
define(xrefshortquad,(ref int16 vector(8))$1)
define(xoctoct,(int8 vector(16))$1)
define(xoctb,(octet vector(16))$1)
define(xrefoctb,(ref octet vector(16))$1)
define(xoctuint,(uint8 vector(16))$1)
define(xrefoctuint,(ref uint8 vector(16))$1)
define(xrefoctoct,(ref int8 vector(16))$1)
define(xintpair, (int32 vector(4))$1)
define(xrefintpair,(ref int32 vector(4))$1)
/*\end{verbatim}
\subsubsection{Addressing modes}
\begin{verbatim}
*/

pattern innersmaddrmode(eaform f)
	means [mem(f)]
	assembles [f];
pattern smaddrmode means[innersmaddrmode|sxmreg];
pattern rm means [maddrmode|reg];

/*\end{verbatim}
\subsubsection{Operations}
\begin{verbatim}
*/

operation sdiv means div assembles ['div'];
operation min means MIN assembles ['MIN'];
operation max means MAX assembles ['MAX'];
operation sadd means  +:  assembles [ 'adds'];
operation ssub means -: assembles ['subs'];
pattern soperator means[add|mul|sdiv|sub|min|max ];
pattern xlop means[and|or];
pattern coperator means[min|max];
pattern poperator means[nonmultoperator|ssub|sadd];

/*\end{verbatim}
\subsubsection{XMMX instructions}
\begin{verbatim}
*/
instruction  pattern OPSD(soperator op, xmmr64m rm,xmmr64 r1)
	means[ (ref ieee64) r1 :=op( ( ieee64)^( r1),( ieee64)^(  rm))]
    	assembles[op 'sd  '    rm ',' r1];
instruction pattern PMULLSSBl(xmreg8 m1,  xmreg8 ma)
	means[m1:= xoctoct(*:(xoctoct(^(m1)),xoctoct(^(ma))))]
	assembles['pxor %xMM7,%xMM7'   /* clear regs mm5 and mm7*/
		  '\n pxor %xMM5,%xMM5'
		  '\n punpckhbw 'ma',%xMM7' /* mm7 now has 8 words with the top 8 bytes of ma in them */
		  '\n pxor %xMM6,%xMM6'
		  '\n punpckhbw 'm1',%xMM6'
		  '\n punpcklbw 'ma',%xMM5'
          '\n pmulhw %xMM6,%xMM7'
          '\n psraw $7,%xMM7'
          '\n pxor %xMM6,%xMM6'
	      '\n punpcklbw 'm1',%xMM6'
          '\n pmulhw %xMM6,%xMM5'
		  '\n psraw $7,%xMM5'
		  '\n packsswb  %xMM7,%xMM5'
		  '\n movdqu %xMM5,'m1]; 
/*instruction pattern MOVQS(maddrmode rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];
instruction pattern MOVQL(maddrmode rm, mreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' rm ',' m'\n prefetchnta 128+'rm];*/
instruction  pattern OPSS(soperator op, smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=op( ( ieee32)^( r1),( ieee32)^(  rm))]
    	assembles[op 'ss  ' rm ',' r1];

pattern lx means [sxmreg|isxmreg];
instruction  pattern LOPSS(xlop op, lx rm,lx r1)
        means[   r1 :=op(  ^( r1), ^(  rm))]
    	assembles[op 'ps  ' rm ',' r1];
instruction  pattern LOPPS(xlop op, plx rm,plx r1)
        means[   r1 :=op(  ^( r1), ^(  rm))]
    	assembles[op 'ps  ' rm ',' r1];
instruction  pattern ADDSS( smaddrmode rm,sxmreg r1)
	/* this knows about + commuting OPSS does not */
        means[ (ref ieee32) r1 :=+( ( ieee32)^( r1),( ieee32)^(  rm))]
    	assembles['addss  ' rm ',' r1];
        
instruction pattern PORX(xmreg m, xmreg ma,type t)
        means[m := OR(^((ref t)m),^((ref t)ma))]
        assembles ['por 'ma ',' m];

        
instruction pattern PXORX(xmreg m, xmreg ma,type t)
        means[m := XOR(^((ref t)m),^((ref t)ma))]
        assembles ['pxor 'ma ',' m]; 
instruction pattern PANDX(xmreg m, xmreg ma,type t)
        means[m := AND((t)^( m),(t)^( ma))]
        assembles ['pand ' ma ',' m];
        
instruction  pattern OPPS(soperator op, xmreg rm,xmreg r1)
        means[  refsinglequad( r1) :=op( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles[op 'ps  '    rm ',' r1];
instruction  pattern ADDPS(soperator op, xmreg rm,xmreg r1)
        means[  refsinglequad( r1) :=+( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles[ 'addps  '    rm ',' r1];
instruction  pattern OPPD(soperator op, xmreg rm,xmreg r1)
        means[  (ref r64x2) r1 :=op( (r64x2) ^( r1), (r64x2)^(  rm))]
    	assembles[op 'pd  '    rm ',' r1];

instruction  pattern OPPDADD(soperator op, xmreg rm,xmreg r1)
        means[  (ref r64x2) r1 :=+( (r64x2) ^( r1), (r64x2)^(  rm))]
    	assembles[ 'addpd  '    rm ',' r1];

instruction  pattern OPPIQ(poperator op, xmreg rm,xmreg r1)
        means[  (ref quadword) r1 :=op( (quadword) ^( r1), (quadword)^(  rm))]
    	assembles['p'op 'd  '    rm ',' r1];

instruction pattern PANDNX(xmreg dest, xmreg src)
	means[dest := AND(NOT(^(dest)),^(src))]
	assembles ['pandn 'src ',' dest];
 
instruction pattern PANDNSS(lx m, lx ma)
	means[m := AND(NOT(^(m)),^(ma))]
	assembles ['pandn 'ma ',' m];
instruction  pattern OPPI8(poperator op, xmreg rm,xmreg r1)
        means[  (ref i8x16) r1 :=op( (i8x16) ^( r1), (i8x16)^(  rm))]
    	assembles['p'op 'b  '    rm ',' r1];
instruction  pattern OPPI16(poperator op, xmreg rm,xmreg r1)
        means[  (ref i16x8) r1 :=op( (i16x8) ^( r1), (i16x8)^(  rm))]
    	assembles['p'op 'w  '    rm ',' r1];

instruction  pattern STORUPI16( smaddrmode rm,sxmreg r1)
        means[  (ref i16x8) rm := (i16x8)^(r1)]
    	assembles['movdqu  '    r1 ', ' rm  '#STORUPI16'];

instruction pattern MOVDQS(maddrmode rm,xmreg r1)
	means[ (ref quadword)rm := ^(r1)]
	assembles['movdqu 'r1','rm   '#MOVQDS'];
instruction pattern MOVDQB(maddrmode rm,xmregu8 r1)
        means[ (ref quadword)rm := ^(r1)]
        assembles['movdqu 'r1','rm   '#MOVQDB'];
instruction pattern MOVDQSR(xmreg rm,xmreg r1)
	means[ (ref quadword)rm := ^(r1)]
	assembles['movdq 'r1','rm   '#MOVQDSR'];

instruction  pattern MOVUPI16( smaddrmode r1,xmreg rm)
        means[   rm := (i16x8)^(r1)]
    	assembles['movdqu  '    r1 ', ' rm '#MOVUPI16'];

instruction  pattern OPPI32(nonmultoperator op, xmreg rm,xmreg r1)
        means[  (ref i32x4) r1 :=op( (i32x4) ^( r1), (i32x4)^(  rm))]
    	assembles['p'op 'd  '    rm ',' r1];

instruction  pattern STORUPI32( smaddrmode rm,xmreg r1)
        means[  (ref i32x4) rm := (i32x4)^(r1)]
    	assembles['movdqu  '    r1 ', ' rm  '#STORUPI32'];

instruction  pattern MOVUPI32( smaddrmode rm,xmreg r1)
        means[   r1 := (i32x4)^(rm)]
    	assembles['movdqu  '    rm ', ' r1 '#MOVUPI32'];

instruction  pattern STORUPD( smaddrmode rm,xmreg r1)
        means[  (ref r64x2) rm := (r64x2)^(r1)]
    	assembles['movupd  '    r1 ', ' rm];

instruction  pattern MOVUPD( smaddrmode r1,xmreg rm)
        means[   rm := (r64x2)^(r1)]
    	assembles['movupd  '    r1 ', ' rm];

instruction  pattern STORUPS( maddrmode rm,xmreg r1)
        means[ refsinglequad( rm) :=singlequad( ^(r1))]
    	assembles['movups  '    r1 ', ' rm];

instruction  pattern MOVAPS( xmreg rm,xmreg r1)
        means[ refsinglequad( rm) :=singlequad( ^(r1))]
    	assembles['movaps  '    r1 ', ' rm];
instruction pattern PSQRT(psxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtps 'r','r];

instruction pattern PDSQRT(pdxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtpd 'r','r];
instruction pattern SSQRT(sxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtss 'r','r];

instruction pattern SDSQRT(xmmr64 r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtsd 'r','r];

instruction  pattern MOVUPS( maddrmode rm,xmreg r1)
        means[   r1 :=singlequad( ^(rm))]
    	assembles['movups  '    rm ', ' r1];
instruction  pattern MOVRRPS( xmreg rm,xmreg r1)
        means[   r1 :=singlequad( ^(rm))]
    	assembles['movups  '    rm ', ' r1];

instruction  pattern MOVSS( smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=^((ref ieee32) rm)]
    	assembles['movss  '    rm ', ' r1 '#MOVSS'];
    	instruction  pattern LDSS( maddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=^((ref ieee32) rm)]
    	assembles['movss  '    rm ', ' r1 '#LDSS'];



instruction  pattern POPSS( sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)POP(ST)]
    	assembles['SCALEDSUB  $ ADDRSIZE  ,SPTR\n '
                  'fstps (SPTR)\n'
                  'movss  '   '(SPTR), ' r1'\n add  $ ADDRSIZE  ,SPTR'];

instruction  pattern MOVSD( xmmr64m rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=^((ref ieee64) rm)]
    	assembles['movsd  '    rm ', ' r1];

instruction  pattern POPSD( xmmr64 r1)
        means[ (ref ieee64) r1 :=(ieee64)POP(ST)]
    	assembles['SCALEDSUB $8,SPTR\n '
                  'fstpl (SPTR)\n '
                  'movsd  '    ' (SPTR), ' r1'\n SCALEDADD $8,SPTR'];

instruction pattern MOVDl(dwreg src, lowreg dest)
	means[dest:= ^(src)]
	assembles['movd 'src', 'dest];

instruction pattern MOVDs(dwreg dest, lowreg src)
	means[dest:= ^(src)]
	assembles['movd 'src',  'dest];

/* Checking is required on exact procedure for loading in literals */

instruction pattern XRLOADLIT(float f,float t,sxmreg r1)
	means[ (ref ieee32)r1:=(t)const f]
	assembles['movss 0f ' PIS ' ,' r1
		 '\n .data '
		' \n 0:\n.float 'f
		'\n.text \n '
	];
instruction pattern XMMNOT(xmreg r)
	means[r := NOT(^(r))]
	assembles['pxor 0f ' PIS ' ,' r'\n jmp 1f \n .align 16\n0: .long -1\n .long -1 \n .long -1 \n .long -1\n.text \n 1:\n '];

instruction pattern XRDLOADLIT(real f,real t,xmmr64 r1)
	means[ (ref ieee64)r1:=(t)const f]
	assembles['movsd 0f ' PIS ' ,' r1
		 '\n .data '
		' \n0:\n.double 'f
		'\n.text \n '];
/* rounding */
pattern truncreg means[EAX|EBX|ECX|EDX|ESI|EDI];
instruction  pattern CVTSD2SI( xmmr64m rm,truncreg r1)
        means[ (ref int32) r1 :=(int32)ROUND((ieee64)^(  rm))]
    	assembles['cvtsd2si  '    rm ', ' r1];

instruction  pattern CVTSS2SI( sxmreg rm,truncreg r1)
        means[ (ref int32) r1 :=(int32)ROUND( (ieee32)^(  rm))]
    	assembles['cvtss2si  '    rm ', ' r1];

/* truncating */
instruction  pattern CVTTSD2SI( xmmr64m rm,truncreg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
    	assembles['cvttsd2si  '    rm ', ' r1];

instruction  pattern CVTTSS2SI( sxmreg rm,truncreg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE( (ieee32)^(  rm))]
    	assembles['cvttss2si  '    rm ', ' r1];
instruction  pattern CVTSI2SD( truncreg rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=(ieee64)FLOAT((int32)^(  rm))]
    	assembles['cvtsi2sd  '    rm ', ' r1];

instruction  pattern CVTSI2SS( truncreg rm,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  rm))]
    	assembles['cvtsi2ss  '    rm ', ' r1];

instruction  pattern CVTIR2SS( reg r0,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT(^( (ref int32) r0))]
    	assembles['cvtsi2ss  '    r0 ', ' r1];
instruction  pattern STORESS(  maddrmode rm,sxmreg r1)
        means[ (ref ieee32) rm :=( ieee32)^( r1)]
    	assembles['movss  '    r1 ',' rm'#STORESS'];
instruction  pattern STORESSGEN( smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) rm :=( ieee32)^( r1)]
    	assembles['movss  '    r1 ',' rm'#STORESSGEN'];

instruction  pattern STORESD(innersmaddrmode rm,xmmr64 r1)
        means[ (ref ieee64) rm :=( ieee64)^( r1)]
    	assembles['movsd  '    r1 ',' rm];

instruction  pattern STORESDGEN(smaddrmode rm,xmmr64 r1)
        means[ (ref ieee64) rm :=( ieee64)^( r1)]
    	assembles['movsd  '    r1 ',' rm];

instruction pattern SSRPUSH(sxmreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['SCALEDSUB  $ ADDRSIZE  ,SPTR\n movss 'r',(SPTR)'];

instruction pattern SSRPOP(sxmreg r)
	means[(ref ieee32)r:=(ieee32)POP(mainSTACK)]
	assembles[' movss (SPTR),'r '\n SCALEDADD  $ ADDRSIZE  ,SPTR'];

instruction pattern SSRPOPI(sxmreg r)
	means[(ref ieee32)r:=(ieee32)FLOAT((int32)POP(mainSTACK))]
	assembles[' cvtsi2ss (SPTR),'r'\n SCALEDADD  $ ADDRSIZE  ,SPTR'];

instruction pattern COMISSIFGOTO(label l,sxmreg r1,sxmreg r2,fcondition c,int t)
	means[if((t)c(^(r2),^(r1)))goto l]
	assembles['comiss ' r1 ','  r2 '\n j' c ' ' l];

instruction pattern COMISS(fcondition c,sxmreg r1,sxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r2),^(r1))]
	assembles['comiss 'r1 ',' r2
		'\n set'c ' ' r
		'\n not 'r
		'\n inc 'r];

instruction pattern SHUFFPS(xmreg m, sxmreg r)
	means[m:=rep(^(r),4)]
	assembles['movss 'r',' m '\n shufps $0,' r ',' m ];
instruction pattern FREP4(xmreg m, reg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movups (SPTR),'m'\n add $16,SPTR'];

instruction pattern MOVQS2(maddrmode rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];
instruction pattern MOVDQL(maddrmode rm,xmreg r1)
	means[ (ref quadword)r1 := ^(rm)]
	assembles['movdqu 'rm','r1   '#MOVQDL'];
 instruction pattern MOVDQLPREF(maddrmode rm,xmreg r1)
	means[ (ref quadword)r1 := ^(rm)]
	assembles['movdqu 'rm','r1   '#MOVQDLPREF\n prefetcht0 128+'rm];

instruction pattern MOVQL2(maddrmode rm, mreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' rm ',' m '#MOVQL2'];
instruction pattern INTMAX(reg r1,reg r2)
	means[ r1:=MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n cmovg 'r2','r1];
instruction pattern INTMIN(reg r1,reg r2)
  	means[ r1:=MIN(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\n  cmovl 'r2','r1];
operation slt means < assembles ['lt'];
operation sle means <= assembles ['le'];
operation seq means = assembles ['eq'];
operation  rslt means > assembles ['lt'];
operation  rsle means >= assembles ['le'];
pattern scmp means [ slt|sle|seq];
pattern rscmp means [rslt|rsle];
pattern pcmp means[seq|gt];
instruction  pattern CMPPS(scmp op, xmreg r1,xmreg r2,xmreg r )
	means[  (ref int32 vector (4)) r  :=EXTEND(op( (ieee32 vector (4)) ^( r2), (ieee32 vector (4))^(  r1)))]
    	assembles['cmp'op 'ps  '    r1 ',' r2'\n movdqa ' r2','r ];
instruction  pattern RCMPPS(rscmp op, xmreg r1,xmreg r2,xmreg r )
	means[  (ref int32 vector (4)) r :=EXTEND(op( (ieee32 vector (4)) ^( r2), (ieee32 vector (4))^(  r1)))]
    	assembles['cmp'op 'ps  '    r2 ',' r1'\n movdqa ' r1','r ];
instruction pattern CMPSS(scmp c,sxmreg r1,sxmreg r2, wreg r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['cmp'c'ss 'r1 ',' r2
		  '\n movd 'r2', 'r];
instruction pattern CMPSSv(scmp c,sxmreg r1,sxmreg r2, lx r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['cmp'c'ss 'r1 ',' r2
	'\n movss 'r2', 'r	  ];
instruction pattern CMPSSrv(rscmp c,sxmreg r1,sxmreg r2, lx r)
	means[r:=(int32)EXTEND( c(^(r1),^(r2)))]
	assembles['cmp'c'ss 'r1 ',' r2
	'\n movss 'r2', 'r	  ];

instruction pattern CMPEQBl(xmreg m,xmreg ma)
	means[xrefoctb(m):= xoctb(=(xoctb(^(m)),xoctb(^(ma))))]
	assembles['pcmpeqb 'ma','m];
instruction pattern CMPGTBl(xmreg m,xmreg ma)
	means[xrefoctb(m):= xoctb(>(xoctb(^(m)),xoctb(^(ma))))]
	assembles['pcmpgtb 'ma','m];
instruction pattern CMPGTBRl(xmreg m,xmreg ma)

	means[xrefoctb(m):= xoctb(<(xoctb(^(ma)),xoctb(^(m))))]
	assembles['pcmpgtb 'ma','m];
instruction pattern CMPEQDl(xmreg m,xmreg ma)
	means[xrefintpair(m):= xintpair(EXTEND(=(xintpair(^(m)),xintpair(^(ma)))))]
	assembles['pcmpeqd 'ma','m];
instruction pattern CMPGTDl(xmreg m,xmreg ma)
	means[xrefintpair(m):= xintpair(EXTEND(>(xintpair(^(m)),xintpair(^(ma)))))]
	assembles['pcmpgtd 'ma','m];
instruction pattern CMPGTDRl(xmreg m,xmreg ma)
	means[xrefintpair(m):= xintpair(EXTEND(<(xintpair(^(ma)),xintpair(^(m)))))]
	assembles['pcmpgtd 'ma','m];
operation addsat means +: assembles ['adds'];
operation subsat means -: assembles ['subs'];
pattern nonlog means [add|sub|min|max|addsat|subsat];


define(oldmcomp,CMPEQBl|CMPGTBl|CMPGTBRl|CMPEQDl|CMPGTDl|CMPGTDRl|OPPI8|OPPI16)
/*
\end{verbatim}
*/

define(XMMXcodes,OPPDADD
|MOVDQB|LDSS
	|oldmcomp
	|MOVDQL
	|ADDPS
	|PANDNSS
	
	|STORESS
	|STORESD
	|PANDNX
	|PANDX
	|PXORX
	|PORX
 
	|OPSS
	|LOPSS
	|LOPPS
	|OPSD
	|CMPPS
	|CMPSSv
	|CMPSSrv
	|RCMPPS
	|CMPSS
	|ADDSS
	|XMMNOT
	|CVTSI2SD
	|CVTSS2SI
	|CVTTSD2SI
	|CVTTSS2SI
	|CVTSD2SI
	|CVTSI2SS
	|CVTSD2SI
	|CVTIR2SS
	|XRLOADLIT
	|XRDLOADLIT
	|SSRPUSH
	|PMULLSSBl
        |SHUFFPS

	|FREP4
	|PSQRT
	|PDSQRT
	|SSQRT
	|SDSQRT
	|OPPS
	| OPPD
	|STORUPD
	|MOVUPD
	|COMISSIFGOTO
	|  COMISS
	|PANDNX
	|PANDX
	|PXORX
	|PORX
	|OPPI8
/*	|OPPIQ*/
	|STORUPS
	|MOVQS
	|MOVDQL
	|MOVDQLPREF
	|MOVQL
	|MOVDl
	|MOVUPS
	|OPPI16
	|INTMAX
	|INTMIN
	|MOVUPI16
	|STORUPI16
	|OPPI32
	|MOVUPI32
	|MOVDQS
	|MOVDQB
	|STORUPI32
	|MOVAPS
	|MOVRRPS
	|MOVSS
	|MOVSD
	|STORESDGEN
	|STORESSGEN
        |MOVDQSR
        |SSRPOPI
	|SSRPOP
	|POPSS
	|POPSD)



