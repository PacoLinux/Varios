/*
\end{verbatim}
\subsection{Streaming SIMD registers and instructions ver 2}
\subsubsection{Registers}
this is a version that only has a smaller set of registers to allow compilation
using 256 element sets, this is because the register set phase of the code generator
keeps bitmaps to track use of registers
\begin{verbatim}


*/

register quadword XMM0 assembles[ 'XMM0'];
alias register ieee32 XMM00=XMM0(0:31) assembles['xmm0'] ;
alias register ieee64 XMM0R64=XMM0(0:63) assembles['xmm0'] ;
alias register ieee32 vector (4) XMM0R324=XMM0(0:127) assembles['XMM0'];

alias register ieee64 vector (2) XMM0R642=XMM0(0:127) assembles['XMM0'];
register quadword XMM1 assembles[ 'XMM1']; 
alias register ieee32 XMM10=XMM1(0:31) assembles['xmm1'] ;
alias register ieee64 XMM1R64=XMM1(0:63) assembles['xmm1'] ;
alias register ieee32 vector (4) XMM1R324=XMM1(0:127) assembles['XMM1'];
alias register ieee64 vector (2) XMM1R642=XMM1(0:127) assembles['XMM1'];
register quadword XMM2 assembles[ 'XMM2']; 
alias register ieee32 XMM20=XMM2(0:31) assembles['xmm2'] ;
alias register ieee64 XMM2R64=XMM2(0:63) assembles['xmm2'] ;
alias register ieee32 vector (4) XMM2R324=XMM2(0:127) assembles['XMM2'];
alias register ieee64 vector (2) XMM2R642=XMM2(0:127) assembles['XMM2'];
register quadword XMM3 assembles[ 'XMM3']; 
alias register  ieee32 XMM30=XMM3(0:31) assembles['xmm3'] ;
alias register ieee64 XMM3R64=XMM3(0:63) assembles['xmm3'] ;
alias register ieee32 vector (4) XMM3R324=XMM3(0:127) assembles['XMM3'];
alias register ieee64 vector (2) XMM3R642=XMM3(0:127) assembles['XMM3'];




register quadword XMM4 assembles[ 'XMM4'];
alias register ieee32 XMM40=XMM4(0:31) assembles['xmm4'] ;
alias register ieee64 XMM4R64=XMM4(0:63) assembles['xmm4'] ;
 



alias register int32 vector (4) XMM0I324=XMM0(0:127) assembles['Xmm0'];
alias register int32 vector (4) XMM1I324=XMM1(0:127) assembles['Xmm1'];
alias register int32 vector (4) XMM2I324=XMM2(0:127) assembles['Xmm2'];
alias register int32 vector (4) XMM3I324=XMM3(0:127) assembles['Xmm3'];
alias register int16 vector (8) XMM0I16=XMM0(0:127) assembles['Xmm0'];
alias register int16 vector (8) XMM1I16=XMM1(0:127) assembles['Xmm1'];
alias register int16 vector (8) XMM2I16=XMM2(0:127) assembles['Xmm2'];
alias register int16 vector (8) XMM3I16=XMM3(0:127) assembles['Xmm3'];
alias register uint16 vector (8) XMM0U16=XMM0(0:127) assembles['Xmm0'];
alias register uint16 vector (8) XMM1U16=XMM1(0:127) assembles['Xmm1'];
alias register uint16 vector (8) XMM2U16=XMM2(0:127) assembles['Xmm2'];
alias register uint16 vector (8) XMM3U16=XMM3(0:127) assembles['Xmm3'];
alias register int8 vector (16) XMM0I8=XMM0(0:127) assembles['Xmm0'];
alias register int8 vector (16) XMM1I8=XMM1(0:127) assembles['Xmm1'];
alias register int8 vector (16) XMM2I8=XMM2(0:127) assembles['Xmm2'];
alias register int8 vector (16) XMM3I8=XMM3(0:127) assembles['Xmm3'];

alias register uint8 vector (16) XMM0U8=XMM0(0:127) assembles['Xmm0'];
alias register uint8 vector (16) XMM1U8=XMM1(0:127) assembles['Xmm1'];
alias register uint8 vector (16) XMM2U8=XMM2(0:127) assembles['Xmm2'];
alias register uint8 vector (16) XMM3U8=XMM3(0:127) assembles['Xmm3'];

/* low order bits of xmm regs treated as integers */
/*
Dont use these as they are no use for addressing which is main use of integer registers
alias register int32 iXMM00=XMM0(0:31) assembles['xmm0'] ;
alias register int32 iXMM10=XMM1(0:31) assembles['xmm1'] ;
alias register int32 iXMM20=XMM2(0:31) assembles['xmm2'] ;
alias register int32 iXMM30=XMM3(0:31) assembles['xmm3'] ; 

pattern ixmreg means[iXMM00|iXMM10|iXMM20|iXMM30 ];
*/
/* low order bits of MM regs treated as integers -- again do not use
alias register int32 iMM00=MM0(0:31) assembles['MM0'] ;
alias register int32 iMM10=MM1(0:31) assembles['MM1'] ;
alias register int32 iMM20=MM2(0:31) assembles['MM2'] ;
alias register int32 iMM30=MM3(0:31) assembles['MM3'] ;
alias register int32 iMM40=MM4(0:31) assembles['MM4'] ;
alias register int32 iMM50=MM5(0:31) assembles['MM5'] ;
alias register int32 iMM60=MM6(0:31) assembles['MM6'] ;
alias register int32 iMM70=MM7(0:31) assembles['MM7'] ;

pattern imreg means[iMM00|iMM10|iMM20|iMM30 ];
pattern lowintreg means [ixmreg|imreg];
*/

alias register int32 iXMM00=XMM0(0:31) assembles['xmm0'] ;
alias register int32 iXMM10=XMM1(0:31) assembles['xmm1'] ;
alias register int32 iXMM20=XMM2(0:31) assembles['xmm2'] ;
alias register int32 iXMM30=XMM3(0:31) assembles['xmm3'] ;
alias register int32 iXMM40=XMM4(0:31) assembles['xmm4'] ; 
pattern uxmreg means [XMM1|XMM3| XMM2|XMM0 ];
pattern sfxmreg means[XMM00|XMM10|XMM20|XMM30 ]; 
pattern sixmreg means[iXMM00|iXMM10|iXMM20|iXMM30];
pattern sxmreg means[sfxmreg|sixmreg];
/*pattern sxmreg means[XMM00|XMM10|XMM20|XMM30  ];*/
pattern xmregi324 means[XMM0I324|XMM3I324|XMM2I324|XMM1I324];
pattern revxmregi324 means[XMM1I324|XMM2I324|XMM0I324|XMM3I324];
pattern xmmr64 means[XMM0R64|XMM1R64|XMM2R64|XMM3R64 ];
pattern psxmreg means[ XMM3R324| XMM2R324| XMM1R324| XMM0R324 ];
pattern pdxmreg means[ XMM3R642| XMM2R642| XMM1R642| XMM0R642];
pattern xmreg8 means[XMM0I8|XMM3I8|XMM1I8|XMM2I8];
pattern xmregu8 means[XMM0U8|XMM3U8|XMM1U8|XMM2U8];
pattern xreg8 means[xmreg8|xmregu8];
pattern xmreg16 means[XMM0I16|XMM3I16|XMM1I16|XMM2I16];
pattern xmregu16 means[XMM0U16|XMM3U16|XMM1U16|XMM2U16];

pattern xmreg means[xmregi324|uxmreg|psxmreg|pdxmreg|revxmregi324|xmreg16|xmregu16|xmreg8|xmregu8];

pattern lowreg means[/*lowintreg|*/sxmreg];
pattern xmmr64m means[maddrmode|xmmr64]; 
pattern lmaddrmode means[maddrmode|xmreg];
/* define m4 macros to generate casts to the desired types */
define(singlequad, (ieee32 vector(4))$1)

define(refsinglequad,(ref ieee32 vector(4))$1)
define(i8x16, int8 vector(16))
define(u8x16, uint8 vector(16))
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
pattern smaddrmode means[maddrmode|sxmreg];
pattern rm means [maddrmode|reg];


/*\end{verbatim}
\subsubsection{Operations}
\begin{verbatim}
*/

operation sdiv means div assembles ['div'];
operation min means MIN assembles ['MIN'];

operation max means MAX assembles ['MAX'];
operation pand means AND assembles ['and'];
operation por means OR assembles['or'];
pattern soperator means[add|mul|sdiv|sub|min|max];
pattern coperator means[min|max];
pattern loperator means[por|pand];
pattern smoperator means[coperator|nonmultoperator];

/*\end{verbatim}
\subsubsection{XMMX instructions}
\begin{verbatim}
*/

instruction pattern XPANDN(xmreg m, xmreg ma)
	means[m := AND(NOT(^(m)),^(ma))]
	assembles ['pandn 'm ',' ma];
 
instruction  pattern OPSD(soperator op, xmmr64m rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=op( ( ieee64)^( r1),( ieee64)^(  rm))]
    	assembles[op 'sd  '    r1 ',' rm];
instruction pattern PADDSBX(xmreg8 m, xmreg8 ma)
	means[m := +:(^(m),^(ma))]
	assembles ['paddsb 'm ',' ma];
 instruction pattern PADDX(xreg8 m, xreg8 ma)
	means[m:= +(^(m),^(ma))]
	assembles ['paddb 'm ',' ma];
instruction  pattern OPSS(soperator op, smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=op( ( ieee32)^( r1),( ieee32)^(  rm))]
    	assembles[op 'ss  '    r1 ',' rm];
instruction  pattern ADDSS( smaddrmode rm,sxmreg r1)/* this knows about + commuting OPSS does not */
        means[ (ref ieee32) r1 :=+( ( ieee32)^( r1),( ieee32)^(  rm))]
    	assembles['addss  '    r1 ',' rm];
instruction  pattern OPPS(soperator op, xmreg rm,xmreg r1)
	means[  refsinglequad( r1) :=op( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles[op 'ps  '    r1 ',' rm];

instruction  pattern ADDPS( xmreg rm,xmreg r1)
        means[  refsinglequad( r1) :=+( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles['addps  '    r1 ',' rm];
operation slt means < assembles ['lt'];
operation sle means <= assembles ['le'];
operation seq means = assembles ['eq'];
pattern scmp means [ slt|sle|seq];
instruction  pattern CMPPS(scmp op, xmreg rm,xmreg r1)
	means[  (ref int32 vector (4)) r1 :=EXTEND(op( singlequad( ^( r1)), singlequad(^(  rm))))]
    	assembles[op 'ps  '    r1 ',' rm];

pattern nonlog means [add|sub|min|max];
instruction  pattern OPPD(soperator op, pdxmreg rm,pdxmreg r1)
        means[  (ref r64x2) r1 :=op( (r64x2) ^( r1), (r64x2)^(  rm))]
    	assembles[op 'pd  '    r1 ',' rm];
instruction  pattern OPPI8m(nonlog op, mreg rm,mreg r1)
        means[  (ref i8x8) r1 :=op( (i8x8) ^( r1), (i8x8)^(  rm))]
    	assembles['p'op 'b  '    r1 ',' rm];
instruction  pattern OPPI16m(nonlog op, mreg rm,mreg r1)
        means[  (ref i16x4) r1 :=op( (i16x4) ^( r1), (i16x4)^(  rm))]
    	assembles['p'op 'w  '    r1 ',' rm];
instruction pattern XCMPPD(xmregi324 m,xmregi324 ma,mcondition cond)
	means[(ref i32x4)m:= EXTEND((int8 vector (4))cond((i32x4)^(m),(i32x4)^(ma)))]
	assembles['pcmp' cond 'd 'm','ma];
 
 instruction pattern XCMPPDR(xmreg m,xmreg ma,mcondition cond)
	means[(ref i32x4)m:= (i32x4)EXTEND((int8 vector (4))<((i32x4)^(ma),(i32x4)^(m)))]
	assembles['pcmpgtd 'm','ma];
instruction  pattern OPPI8msc(coperator op, mreg rm,mreg r1)
        means[  (ref i8x8) r1 :=op( (i8x8) ^( r1), (i8x8)^(  rm))]
    	assembles['p'op 'sb  '    r1 ',' rm'; OPPI8msc'];
instruction  pattern OPPI16msc(coperator op, mreg rm,mreg r1)
        means[  (ref i16x4) r1 :=op( (i16x4) ^( r1), (i16x4)^(  rm))]
    	assembles['p'op 'sw  '    r1 ',' rm'; OPPI16msc'];
instruction  pattern OPPI8muc(coperator op, mreg rm,mreg r1)
        means[  (ref u8x8) r1 :=op( (u8x8) ^( r1), (u8x8)^(  rm))]
    	assembles['p'op 'ub  '    r1 ',' rm];
instruction  pattern OPPI16muc(coperator op, mreg rm,mreg r1)
        means[  (ref u16x4) r1 :=op( (u16x4) ^( r1), (u16x4)^(  rm))]
    	assembles['p'op 'uw  '    r1 ',' rm];
instruction  pattern OPPI8(nonlog op, xmreg rm,xmreg r1)
        means[  (ref i8x16) r1 :=op( (i8x16) ^( r1), (i8x16)^(  rm))]
    	assembles['p'op 'b  '    r1 ',' rm];
instruction  pattern OPPI16(nonlog op, xmreg16 rm,xmreg16 r1)
        means[  (ref i16x8) r1 :=op( (i16x8) ^( r1), (i16x8)^(  rm))]
    	assembles['p'op 'w  '    r1 ',' rm];
instruction  pattern STORUPI8( smaddrmode rm,xmreg r1)
        means[  (ref i8x16) rm := (i8x16)^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern STORUPU8( smaddrmode rm,xmreg r1)
        means[  (ref u8x16) rm := (u8x16)^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern STORUPI16( smaddrmode rm,xmreg r1)
        means[  (ref i16x8) rm := (i16x8)^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern MOVUPI16( smaddrmode r1,xmreg rm)
        means[   rm := (i16x8)^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern OPPI32(loperator op, xmregi324 rm,xmregi324 r1)
        means[  (ref i32x4) r1 :=op( (i32x4) ^( r1), (i32x4)^(  rm))]
    	assembles[op 'ps  '    r1 ',' rm';OPPI32'];
instruction  pattern PORSS(  smaddrmode rm,sxmreg r1)
        means[   r1 :=OR(  ^( r1), ^(  rm))]
    	assembles[ 'por '    r1 ',' rm];
instruction  pattern PANDSS(  smaddrmode rm,sxmreg r1)
        means[   r1 :=AND(  ^( r1), ^(  rm))] 
    	assembles[ 'pand '    r1 ',' rm];
instruction  pattern PANDNSS(  smaddrmode src,sxmreg dest)
        means[   dest :=AND(  ^( src),NOT( ^(  dest)))]
    	assembles[ 'pandn '   dest ',' src];
instruction  pattern OPPI32m(smoperator op, xmregi324 rm,xmregi324 r1)
        means[   r1 :=op(  ^( r1), ^(  rm))]
    	assembles['p'op 'd  '    r1 ',' rm '; OPPI32m'];
instruction  pattern STORUPI32( smaddrmode rm,xmregi324 r1)
        means[  (ref i32x4) rm := ^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern MOVUPI32( lmaddrmode r1,xmreg rm)
        means[   rm := (i32x4)^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern MOVDQU( lmaddrmode r1,xmreg rm)
        means[   rm := (quadword)^(r1)]
    	assembles['movdqu  '    rm ', ' r1];
instruction  pattern STORUPD( smaddrmode rm,xmreg r1)
        means[  (ref r64x2) rm := (r64x2)^(r1)]
    	assembles['movupd  '    rm ', ' r1];
instruction  pattern MOVUPD( smaddrmode r1,xmreg rm)
        means[   rm := (r64x2)^(r1)]
    	assembles['movupd  '    rm ', ' r1];
instruction  pattern STORUPS( smaddrmode rm,psxmreg r1) 
        means[ refsinglequad( rm) :=singlequad( ^(r1))]
    	assembles['movups  '    rm ', ' r1];

instruction  pattern MOVAPS( xmreg rm,xmreg r1)
        means[ refsinglequad( rm) :=singlequad( ^(r1))]
    	assembles['movaps  '    rm ', ' r1];
instruction pattern SSQRT(sxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtss 'r','r]; 
instruction pattern SDSQRT(xmmr64 r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtsd 'r','r]; 
instruction  pattern CVTSS2SI( reg r1,sxmreg r0)
        means[ (ref int32) r1 :=(int32)ROUND(^(  r0))]
    	assembles['cvtss2si  '    r1 ', ' r0];
instruction  pattern CVTSS2SIr( reg r1,sxmreg r0)
        means[ (ref int32) r1 :=(int32)ROUND(^(  r0))]
    	assembles['cvtss2si  '    r1 ', ' r0];
pattern psmaddrmode means[maddrmode|psxmreg];
instruction  pattern MOVUPSL( addrform rm,xmreg r1)
        means[   r1 :=singlequad( ^(mem(rm)))]
    	assembles['movups  '    r1 ', [' rm ']\n prefetcht0 [128+'rm']'];
instruction  pattern MOVUPS( psmaddrmode rm,xmreg r1)
        means[   r1 :=singlequad( ^(rm))]
    	assembles['movups  '    r1 ', ' rm];
instruction  pattern MOVSS( smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=^((ref ieee32) rm)]
    	assembles['movss  '    r1 ', ' rm];
instruction  pattern MOVSD( xmmr64m rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=(ieee64)^( rm)]
    	assembles['movsd  '    r1 ', ' rm'; MOVSD'];
instruction  pattern MOVSDl( maddrmode rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=(ieee64)^( rm)]
    	assembles['movsd  '    r1 ', ' rm'; MOVSDl'];
instruction pattern MOVDl(reg src, lowreg dest)
	means[dest:= ^(src)]
	assembles['movd 'dest', dword 'src];
instruction pattern MOVDs(reg dest, lowreg src)
	means[dest:= ^(src)]
	assembles['movd dword 'dest',  'src];

instruction pattern XRLOADLIT(float f,float t,sxmreg r1)
	means[ (ref ieee32)r1:=(t)const f]
	assembles['xrloadlit 'r1','f];
instruction pattern XRDLOADLIT(real f,real t,xmmr64 r1)
	means[ (ref ieee64)r1:=(t)const f]
	assembles['xrdloadlit 'r1','f];
instruction  pattern CVTSD2SI( xmmr64m rm,reg r1)
        means[ (ref int32) r1 :=(int32)ROUND((ieee64)^(  rm))]
    	assembles['cvtsd2si  '    r1 ', ' rm];
instruction  pattern CVTSI2SD( reg rm,xmmr64 r1)
        means[ (ref ieee64) r1 :=(ieee64)FLOAT((int32)^(  rm))]
    	assembles['cvtsi2sd  '    r1 ', ' rm];

instruction  pattern CVTSI2SS( maddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  rm))]
    	assembles['cvtsi2ss  '    r1 ', ' rm];
instruction  pattern CVTIR2SS( reg r0,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  r0))]
    	assembles['cvtsi2ss  '    r1 ', ' r0]; 
     
instruction  pattern STORESS( maddrmode rm,sxmreg r1)
        means[ (ref ieee32) rm :=( ieee32)^( r1)]
    	assembles['movss  '    rm ',' r1];
instruction  pattern STORESD( maddrmode rm,xmmr64 r1)
        means[ (ref ieee64) rm :=( ieee64)^( r1)]
    	assembles['movsd  '    rm ',' r1'; STORESD'];
instruction pattern SSRPUSH(sxmreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['sub  esp ,4\n movss [ esp ],'   r];
instruction pattern SSRPOP(sxmreg r)
	means[(ref ieee32)r:=(ieee32)POP(mainSTACK)]
	assembles[' movss 'r  ',[ esp ]\n add  esp , 4'];
instruction pattern SSRPOPI(sxmreg r)
	means[(ref ieee32)r:=(ieee32)FLOAT((int32)POP(mainSTACK))]
	assembles[' cvtsi2ss 'r ',[ esp ]\n add  esp , 4'];	
	
	
 
 
instruction pattern SSRPUSH64(sxmreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['sub  rsp ,8\n movss [ rsp ],'   r];
instruction pattern SSRPOP64(sxmreg r)
	means[(ref ieee32)r:=(ieee32)POP(mainSTACK)]
	assembles[' movss 'r  ',[ rsp ]\n add  rsp , 8'];
instruction pattern SSRPOPI64(sxmreg r)
	means[(ref ieee32)r:=(ieee32)FLOAT((int32)POP(mainSTACK))]
	assembles[' cvtsi2ss 'r ',[ rsp ]\n add  rsp , 8'];
instruction pattern COMISSIFGOTO(label l,sxmreg r1,sxmreg r2,fcondition c,int t) 
	means[if((t)c(^(r1),^(r2)))goto l] 
	assembles['comiss ' r1 ','  r2 '\n j' c ' near  ' l];  
instruction pattern COMISS(fcondition c,sxmreg r1,sxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['comiss 'r1 ',' r2 '\n set'c ' ' r];
instruction pattern FREP4(xmreg m, reg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movups 'm',[ esp ]\n add  esp ,16'];
/* operates come before stores, come before moves, come before pushes */

define(XMMXcodes,ADDSS|CVTSI2SD|CVTSI2SS|CVTSD2SI|CVTIR2SS|XRLOADLIT|XRDLOADLIT| 
    CVTSS2SI|CVTSS2SIr   
	|FREP4|SSQRT|SDSQRT|OPSS|PANDNSS|
	XPANDN| 
	OPSD|OPPI32|OPPI32m|PORSS|PANDSS|PANDNSS|
        OPPS| OPPD|COMISSIFGOTO|  
	COMISS|OPPI8|OPPI8m|OPPI8muc|OPPI8msc|PADDSBX|PADDX|ADDPS|
	OPPI16|OPPI16m|OPPI16muc|OPPI16msc|
	STORUPS|STORUPI16 |STORUPI32|STORUPD|STORUPI8 |STORUPU8|STORESS|STORESD| 
        
	MOVUPD|MOVDl |MOVSS|MOVSDl|MOVSD|MOVUPSL|MOVAPS|MOVUPS|MOVUPD |MOVUPI16| MOVUPI32|MOVDQU|  
	ifdef(`bit64', SSRPOPI64|SSRPOP64, 
	 SSRPOPI|SSRPOP )
	
	|XCMPPD|XCMPPDR|CMPPS
	)







