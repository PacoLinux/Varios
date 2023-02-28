/*
\subsection{Streaming SIMD registers and instructions for Opteron}
Copyright University of Glasgow (c) 2002
\subsubsection{Registers}
\begin{verbatim}


*/

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

register quadword XMM8 assembles[ '%xmm8'];
alias register ieee32 XMM80=XMM8(0:31) assembles['%xmm8'] ;
alias register ieee64 XMM8R64=XMM8(0:63) assembles['%xmm8'] ;
alias register ieee32 vector (4) XMM8R324=XMM8(0:127) assembles ['%xmm8'];
alias register ieee64 vector (2) XMM8R642=XMM8(0:127) assembles ['%xmm8'];

register quadword XMM9 assembles[ '%xmm9'];
alias register ieee32 XMM90=XMM9(0:31) assembles['%xmm9'] ;
alias register ieee64 XMM9R64=XMM9(0:63) assembles['%xmm9'] ;
alias register ieee32 vector (4) XMM9R324=XMM9(0:127) assembles ['%xmm9'];
alias register ieee64 vector (2) XMM9R642=XMM9(0:127) assembles ['%xmm9'];

register quadword XMMA assembles[ '%xmm10'];
alias register ieee32 XMMA0=XMMA(0:31) assembles['%xmm10'] ;
alias register ieee64 XMMAR64=XMMA(0:63) assembles['%xmm10'] ;
alias register ieee32 vector (4) XMMAR324=XMMA(0:127) assembles ['%xmm10'];
alias register ieee64 vector (2) XMMAR642=XMMA(0:127) assembles ['%xmm10'];

register quadword XMMB assembles[ '%xmm11'];
alias register ieee32 XMMB0=XMMB(0:31) assembles['%xmm11'] ;
alias register ieee64 XMMBR64=XMMB(0:63) assembles['%xmm11'] ;
alias register ieee32 vector (4) XMMBR324=XMMB(0:127) assembles ['%xmm11'];
alias register ieee64 vector (2) XMMBR642=XMMB(0:127) assembles ['%xmm11'];

register quadword XMMC assembles[ '%xmm12'];
alias register ieee32 XMMC0=XMMC(0:31) assembles['%xmm12'] ;
alias register ieee64 XMMCR64=XMMB(0:63) assembles['%xmm12'] ;
alias register ieee32 vector (4) XMMCR324=XMMC(0:127) assembles ['%xmm12'];
alias register ieee64 vector (2) XMMCR642=XMMC(0:127) assembles ['%xmm12'];

register quadword XMMD assembles[ '%xmm13'];
alias register ieee32 XMMD0=XMMD(0:31) assembles['%xmm13'] ;
alias register ieee64 XMMDR64=XMMD(0:63) assembles['%xmm13'] ;
alias register ieee32 vector (4) XMMDR324=XMMD(0:127) assembles ['%xmm13'];
alias register ieee64 vector (2) XMMDR642=XMMD(0:127) assembles ['%xmm13'];

register quadword XMME assembles[ '%xmm14'];
alias register ieee32 XMME0=XMME(0:31) assembles['%xmm14'] ;
alias register ieee64 XMMER64=XMME(0:63) assembles['%xmm14'] ;
alias register ieee32 vector (4) XMMER324=XMME(0:127) assembles ['%xmm14'];
alias register ieee64 vector (2) XMMER642=XMME(0:127) assembles ['%xmm14'];

register quadword XMMF assembles ['%xmm15'];
alias register ieee32 XMMF0=XMMF(0:31) assembles ['%xmm15'];
alias register ieee64 XMMFR64=XMMF(0:63) assembles ['%xmm15'];
alias register ieee32 vector (4) XMMFR324=XMMF(0:127) assembles ['%xmm15'];
alias register ieee64 vector (2) XMMFR642=XMMF(0:127) assembles ['%xmm15'];

alias register int8 vector (16) XMM0I8=XMM0(0:127) assembles['%xmm0'];
alias register int8 vector (16) XMM1I8=XMM1(0:127) assembles['%xmm1'];
alias register int8 vector (16) XMM2I8=XMM2(0:127) assembles['%xmm2'];
alias register int8 vector (16) XMM3I8=XMM3(0:127) assembles['%xmm3'];
alias register int32 vector (4) XMM0I32=XMM0(0:127) assembles['%xmm0'];
alias register int32 vector (4) XMM1I32=XMM1(0:127) assembles['%xmm1'];
alias register int32 vector (4) XMM2I32=XMM2(0:127) assembles['%xmm2'];
alias register int32 vector (4) XMM3I32=XMM3(0:127) assembles['%xmm3'];
alias register int32 vector (4) XMM4I32=XMM4(0:127) assembles['%xmm4'];
alias register int32 vector (4) XMM5I32=XMM5(0:127) assembles['%xmm5'];
alias register int32 vector (4) XMM6I32=XMM6(0:127) assembles['%xmm6'];
alias register int32 vector (4) XMM7I32=XMM7(0:127) assembles['%xmm7'];
alias register int32 vector (4) XMM12I32=XMMC(0:127) assembles['%xmm12'];
alias register int32 vector (4) XMM13I32=XMMD(0:127) assembles['%xmm13'];
alias register int32 vector (4) XMM14I32=XMME(0:127) assembles['%xmm14'];
alias register int32 vector (4) XMM15I32=XMMF(0:127) assembles['%xmm15'];
 
alias register int32 iXMM00=XMM0(0:31) assembles['%xmm0'] ;
alias register int32 iXMM10=XMM1(0:31) assembles['%xmm1'] ;
alias register int32 iXMM20=XMM2(0:31) assembles['%xmm2'] ;
alias register int32 iXMM30=XMM3(0:31) assembles['%xmm3'] ;
alias register int32 iXMM40=XMM4(0:31) assembles['%xmm4'] ;
alias register int32 iXMM50=XMM5(0:31) assembles['%xmm5'] ;
alias register int32 iXMM60=XMM6(0:31) assembles['%xmm6'] ;
alias register int32 iXMM70=XMM7(0:31) assembles['%xmm7'] ;
alias register int32 iXMM80=XMM8(0:31) assembles['%xmm8'] ;
alias register int32 iXMM90=XMM9(0:31) assembles['%xmm9'] ;
alias register int32 iXMMA0=XMMA(0:31) assembles['%xmm10'] ;
alias register int32 iXMMB0=XMMB(0:31) assembles['%xmm11'] ;
alias register int32 iXMMC0=XMMC(0:31) assembles['%xmm12'] ;
alias register int32 iXMMD0=XMMD(0:31) assembles['%xmm13'] ;
alias register int32 iXMME0=XMME(0:31) assembles['%xmm14'] ;
alias register int32 iXMMF0=XMMF(0:31) assembles['%xmm15'] ;

pattern ixsmreg means[iXMM00|iXMM10|iXMM20|iXMM30|iXMM40|iXMM50|iXMM60|iXMM70|iXMMF0|iXMME0|iXMMD0|iXMMC0|iXMMB0|iXMMA0|iXMM90|iXMM80
]; 


pattern uxmreg  means [XMM1|XMM3|XMM4|XMM5|XMM6|XMM2|XMM0|XMM7|XMM8|XMM9|XMMA|XMMB|XMMC|XMMD|XMME|XMMF];
pattern sfxmreg means[XMM00|XMM10|XMM20|XMM30|XMM40|XMM50|XMM60|XMM70|XMMF0|XMME0|XMMD0|XMMC0|XMMB0|XMMA0|XMM90|XMM80];
pattern sxmreg  means[sfxmreg|ixsmreg];
pattern bxmreg  means[XMM0I8|XMM1I8|XMM2I8|XMM3I8] ;
pattern ixmreg  means[XMM0I32|XMM1I32|XMM2I32|XMM3I32|XMM4I32|XMM5I32|XMM6I32|XMM7I32|XMM12I32|XMM13I32|XMM15I32|XMM14I32] ;
pattern xmmr64  means[XMM0R64|XMM1R64|XMM2R64|XMM3R64|XMM4R64|XMM5R64|XMM6R64|XMM7R64|XMM8R64|XMM9R64|XMMAR64|XMMBR64|XMMCR64|XMMDR64|XMMER64|XMMFR64];
pattern dmreg   means[xmmr64];
pattern psxmreg means[XMMFR324|XMMER324|XMMDR324|XMMCR324|XMMBR324|XMMAR324|XMM9R324|XMM8R324|XMM7R324|XMM6R324|XMM5R324|XMM4R324|XMM3R324|XMM2R324|XMM1R324|XMM0R324];

pattern pdxmreg means[XMMFR642|XMMER642|XMMDR642|XMMCR642|XMMBR642|XMMAR642|XMM9R642|XMM8R642|XMM7R642|XMM6R642|XMM5R642|XMM4R642|XMM3R642|XMM2R642|XMM1R642|XMM0R642];
pattern xmreg means[psxmreg|pdxmreg|uxmreg|bxmreg|ixmreg];
/*pattern lowintreg means [ixmreg];*/
pattern lowreg means[sxmreg];
pattern xmmr64m means[maddrmode|xmmr64];
pattern sxmregm means[maddrmode|sxmreg];




pattern innersmaddrmode(eaform f)
	means [mem(f)]
	assembles [f];
pattern smaddrmode means[innersmaddrmode|sxmreg];
pattern rm means [maddrmode|reg];

/* define m4 macros to generate casts to the desired types */
define(singlequad, (ieee32 vector(4))$1)

define(shortquad, (int16 vector(4))$1)
define(refshortquad,(ref int16 vector(4))$1)
define(octoct,(int8 vector(8))$1)
define(octb,(octet vector(8))$1)
define(refoctb,(ref octet vector(8))$1)
define(octuint,(uint8 vector(8))$1)
define(refoctuint,(ref uint8 vector(8))$1)
define(refoctoct,(ref int8 vector(8))$1)
define(intpair, (int32 vector(2))$1)
define(refintpair,(ref int32 vector(2))$1)
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


/*\end{verbatim}
\subsubsection{Addressing modes}
\begin{verbatim}
*/





operation sdiv means div assembles ['div'];
operation min means MIN assembles ['MIN'];
operation max means MAX assembles ['MAX'];
pattern soperator means[add|mul|sdiv|sub|min|max];
pattern coperator means[min|max];

/*\end{verbatim}
\subsubsection{XMMX instructions}
\begin{verbatim}
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
        means[  refsinglequad( r1) :=op( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles[op 'ps  '    rm ',' r1];

instruction  pattern OPPD(soperator op, xmreg rm,xmreg r1)
        means[  (ref r64x2) r1 :=op( (r64x2) ^( r1), (r64x2)^(  rm))]
    	assembles[op 'pd  '    rm ',' r1];
operation addsat means +: assembles ['adds'];
operation subsat means -: assembles ['subs'];
pattern nonlog means [add|sub|min|max|addsat|subsat];
instruction  pattern OPPI8(nonlog op, bxmreg rm,bxmreg r1)
        means[  (ref i8x16) r1 :=op( (i8x16) ^( r1), (i8x16)^(  rm))]
    	assembles['p'op 'b  '    rm ',' r1];

instruction  pattern OPPI16(nonlog op, xmreg rm,xmreg r1)
        means[  (ref i16x8) r1 :=op( (i16x8) ^( r1), (i16x8)^(  rm))]
    	assembles['p'op 'w  '    rm ',' r1];

instruction  pattern STORUPI16( smaddrmode rm,xmreg r1)
        means[  (ref i16x8) rm := (i16x8)^(r1)]
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
        means[   rm := (i16x8)^(r1)]
    	assembles['movdqu  '    r1 ', ' rm '#MOVUPI16'];

instruction  pattern OPPI32(nonmultoperator op, xmreg rm,xmreg r1)
        means[  (ref i32x4) r1 :=op( (i32x4) ^( r1), (i32x4)^(  rm))]
    	assembles['p'op 'l  '    rm ',' r1];
instruction pattern PANDN(xmreg m, xmreg ma,xmreg m2)
	means[m := AND( NOT(  ^(m )),^(ma ))]
	assembles ['pandn 'ma ',' m  ];
instruction pattern PORX(xmreg m, xmreg ma )
	means[m := OR(^(m ),  ^(ma ))]
	assembles ['por 'ma ',' m  ];
instruction pattern PANDX(xmreg m, xmreg ma )
	means[m := AND(^(m ),  ^(ma ))]
	assembles ['pand 'ma ',' m  ];
	instruction pattern PANDNs(sxmreg m, sxmreg ma )
	means[m := AND( NOT(  ^(m )),^(ma ))]
	assembles ['pandn 'ma ',' m  ];
instruction pattern PORXs(sxmreg m, sxmreg ma )
	means[m := OR(^(m ),  ^(ma ))]
	assembles ['por 'ma ',' m  ];
instruction pattern PANDXs(sxmreg m, sxmreg ma )
	means[m := AND(^(m ),  ^(ma ))]
	assembles ['pand 'ma ',' m  ];
instruction  pattern STORUPI32( smaddrmode rm,xmreg r1)
        means[  (ref i32x4) rm := (i32x4)^(r1)]
    	assembles['movdqu  '    r1 ', ' rm  '#STORUPI32'];

instruction  pattern MOVUPI32( smaddrmode rm,xmreg r1)
        means[   r1 := (quadword)^(rm)]
    	assembles['movdqu  '    rm ', ' r1 '#MOVUPI32\n  '];

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
        means[  rm  :=  ^(r1) ]
    	assembles['movaps  '    r1 ', ' rm];

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

pattern incuntypedr means[rm|ut32r];
instruction pattern MOVDs(incuntypedr dest, lowreg src)
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

instruction  pattern CVTSD2SI( xmmr64m rm,wreg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
    	assembles['cvttsd2si  '    rm ', ' r1];
instruction  pattern CVTSS2SI( sxmregm rm,wreg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee32)^(  rm))]
    	assembles['cvttss2si  '    rm ', ' r1];
instruction  pattern CVTSI2SD( reg rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=(ieee64)FLOAT((int32)^(  rm))]
    	assembles['cvtsi2sd  '    rm ', ' r1];

instruction  pattern CVTSI2SS( waddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT(( int32)^(  rm))]
    	assembles['cvtsi2ss  '    rm ', ' r1];

instruction  pattern CVTIR2SS( reg r0,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((  int32)^(  r0))]
    	assembles['cvtsi2ss  '    r0 ', ' r1];
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
operation slt means < assembles ['lt'];
operation sle means <= assembles ['le'];
operation seq means = assembles ['eq'];
operation  rslt means > assembles ['lt'];
operation  rsle means >= assembles ['le'];
pattern scmp means [ slt|sle|seq];
pattern rscmp means [rslt|rsle];
pattern pcmp means[seq|gt];
instruction  pattern CMPPS(scmp op, xmreg r1,xmreg r2,ixmreg r )
	means[  (ref int32 vector (4)) r  :=EXTEND(op( (ieee32 vector (4)) ^( r), (ieee32 vector (4))^(  r1)))]
    	assembles['cmp'op 'ps  '    r1 ',' r' #CMPPS' ];
 
instruction pattern CMPSS(scmp c,sxmreg r1,sxmreg r2, ixsmreg r)
	means[r:=(int32)EXTEND( c(^(r),^(r1)))]
	assembles['cmp'c'ss 'r1 ',' r ' #CMPSS'];
	/*	  '\n movdqa 'r2', 'r'#CMPSS'];*/
define(intq, (int32 vector(4))$1)
define(refintq,(ref int32 vector(4))$1)
instruction pattern XCMPEQD(xmreg m,xmreg ma,pcmp c)
	means[refintq(m):= intq(EXTEND(c(intq(^(m)),intq(^(ma)))))]
	assembles['pcmp'c'd 'ma','m];
instruction pattern XCMPGTD(xmreg m,xmreg ma)
	means[refintq(m):= intq(EXTEND(>(intq(^(m)),intq(^(ma)))))]
	assembles['pcmpgtd 'ma','m];
instruction pattern XCMPGTDR(xmreg m,xmreg ma)
	means[refintq(m):= intq(EXTEND(<(intq(^(ma)),intq(^(m)))))]
	assembles['pcmpgtd 'ma','m];
/*instruction pattern PCMPIDS(pcmp c,ixsmreg r1,ixsmreg r2, wreg r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['pcmp'c'd 'r1 ',' r2
		  '\n movd 'r2', 'r];*/
instruction pattern RCMPSS(rscmp c,sxmreg r1,sxmreg r2, wreg r)
	means[r:=(int32)EXTEND( c(^(r2),^(r1)))]
	assembles['cmp'c'ss 'r2 ',' r1
		  '\n movd 'r1', 'r' #RCMPSS'];
instruction pattern COMISS(fcondition c,sxmreg r1,sxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['comiss 'r1 ',' r2
		'\n set'c ' ' r
		'\n not 'r
		'\n inc 'r];

instruction pattern FREP4(xmreg m, sxmreg r)
	means[m:=rep(^(r),4)]
	assembles[' shufps' r','m',0'];


instruction pattern MOVQSD(maddrmode rm, dmreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];


instruction pattern MOVQLD(maddrmode rm, dmreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' rm ',' m];
instruction pattern PSQRT(xmreg r)
	means [refsinglequad( r):= SQRT(singlequad(^(r)))]
	assembles['sqrtps 'r','r];
/*
\end{verbatim}
*/

define(XMMXcodes,BOPSS|
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
FREP4|
MOVSS|
MOVSD|
SSRPUSH|
SSQRT|
SDSQRT|
PANDNs|
PORXs|
PANDXs|
PANDN|
PORX|
PANDX|

OPPS|
OPPD|
STORUPD |
MOVUPD |
COMISSIFGOTO|  
COMISS|
CMPSS|
CMPPS|
/*RCMPPS|*/
RCMPSS|
XCMPEQD|
XCMPGTD|
XCMPGTDR /*|PCMPIDS */|
OPPI8|
/*OPPI8m|OPPI8muc|OPPI8msc|*/
STORUPS|
MOVQSD|
MOVQLD|
MOVDl|
MOVDQL|
MOVUPS|
MOVDs|
OPPI16|
	/*OPPI16m|OPPI16muc|OPPI16msc|*/
MOVUPI16|
STORUPI16 |
OPPI32|
MOVUPI32|
MOVDQS|
STORUPI32|
STORESS|
STORESD|
STORUDQ|
MOVAPS|
POPSS|
POPSD|
MOVRRPS|
SSRPOPI|
SSRPOP)



