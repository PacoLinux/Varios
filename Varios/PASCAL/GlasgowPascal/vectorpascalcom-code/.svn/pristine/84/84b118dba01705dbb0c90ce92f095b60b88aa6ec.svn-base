/*

\subsection{MMX registers and instructions}
\subsubsection{Registers}
\begin{verbatim}
*/

register doubleword MM0 assembles[ 'MM0'];
register doubleword MM1 assembles[ 'MM1'];
register doubleword MM2 assembles[ 'MM2'];
register doubleword MM3 assembles[ 'MM3'];
register doubleword MM4 assembles[ 'MM4'];
pattern MMXREGS means[MM0|MM1|MM2|MM3|MM4];
alias register uint64 MM1U=MM1(0:63) assembles ['MM1'];
alias register int64 MM1I=MM1(0:63) assembles ['MM1'];

/* reserve for working space */
reserved register doubleword MM7 assembles[ 'MM7'];
reserved register doubleword MM5 assembles[ 'MM5'];
reserved register doubleword MM6 assembles[ 'MM6'];
/** used for operations using half registers */
alias register word MM0L=MM0(0:31) assembles['MM0'];
alias register word MM1L=MM1(0:31) assembles['MM1'];
alias register word MM2L=MM2(0:31) assembles['MM2'];
alias register word MM3L=MM3(0:31) assembles['MM3'];
alias register word MM4L=MM4(0:31) assembles['MM4'];
alias register word MM1LU=MM1U(0:31) assembles['MM1'];
alias register word MM1LI=MM1I(0:31) assembles['MM1'];


alias register word MM5L=MM5(0:31) assembles['MM5'];
/* used for 16 bit parallelism */
alias register int16 vector (4) MM016=MM0(0:63) assembles['MM0'];
alias register int16 vector (4) MM116=MM1(0:63) assembles['MM1'];
alias register int16 vector (4) MM216=MM2(0:63) assembles['MM2'];
alias register int16 vector (4) MM316=MM3(0:63) assembles['MM3'];
alias register int16 vector (4) MM416=MM4(0:63) assembles['MM4'];
alias register int16 vector (4) MM516=MM5(0:63) assembles['MM5'];
alias register uint16 vector (4) MM0u16=MM0(0:63) assembles['MM0'];
alias register uint16 vector (4) MM1u16=MM1(0:63) assembles['MM1'];
alias register uint16 vector (4) MM2u16=MM2(0:63) assembles['MM2'];
alias register uint16 vector (4) MM3u16=MM3(0:63) assembles['MM3'];
alias register uint16 vector (4) MM4u16=MM4(0:63) assembles['MM4'];
alias register uint16 vector (4) MM5u16=MM5(0:63) assembles['MM5'];

alias register int32 vector (2) MM032=MM0(0:63) assembles['MM0'];
alias register int32 vector (2) MM132=MM1(0:63) assembles['MM1'];
alias register int32 vector (2) MM232=MM2(0:63) assembles['MM2'];
alias register int32 vector (2) MM332=MM3(0:63) assembles['MM3'];
alias register int32 vector (2) MM432=MM4(0:63) assembles['MM4'];
alias register int32 vector (2) MM532=MM5(0:63) assembles['MM5'];

alias register int8 vector (8) MM08=MM0(0:63) assembles['MM0'];
alias register int8 vector (8) MM18=MM1(0:63) assembles['MM1'];
alias register int8 vector (8) MM28=MM2(0:63) assembles['MM2'];
alias register int8 vector (8) MM38=MM3(0:63) assembles['MM3'];
alias register int8 vector (8) MM48=MM4(0:63) assembles['MM4'];
alias register int8 vector (8) MM58=MM5(0:63) assembles['MM5'];
alias register uint8 vector (8) MM08u=MM0(0:63) assembles['MM0'];
alias register uint8 vector (8) MM18u=MM1(0:63) assembles['MM1'];
alias register uint8 vector (8) MM28u=MM2(0:63) assembles['MM2'];
alias register uint8 vector (8) MM38u=MM3(0:63) assembles['MM3'];
alias register uint8 vector (8) MM48u=MM4(0:63) assembles['MM4'];
alias register uint8 vector (8) MM58u=MM5(0:63) assembles['MM5'];

alias register octet vector (8) MM08o=MM0(0:63) assembles['MM0'];
alias register octet vector (8) MM18o=MM1(0:63) assembles['MM1'];
alias register octet vector (8) MM28o=MM2(0:63) assembles['MM2'];
alias register octet vector (8) MM38o=MM3(0:63) assembles['MM3'];
alias register octet vector (8) MM48o=MM4(0:63) assembles['MM4'];
alias register octet vector (8) MM58o=MM5(0:63) assembles['MM5'];
pattern im8reg means[MM48|MM38|MM58|MM08|MM18|MM28];
pattern um16reg means[ MM0u16|MM1u16|MM2u16];

pattern um8reg means[MM48u|MM38u|MM58u|MM08u|MM18u|MM28u];
pattern om8reg means[MM48o|MM38o|MM58o|MM08o|MM18o|MM28o];
pattern im2reg means[MM432|MM332|MM532|MM032|MM132|MM232];
pattern im4reg means[MM416|MM316|MM516|MM016|MM116|MM216];
pattern untypedmreg means [MM1|MM3|MM4|MM5|MM2|MM0|MM7|MM6];
pattern lmreg means [MM1L|MM3L|MM4L| MM2L|MM0L| MM5L];
pattern umreg means[MM1U];
pattern iMreg means[MM1I];
pattern ilmreg means[MM1LI];
pattern ulmreg means[MM1LU];
pattern wmreg means[lmreg|ulmreg|ilmreg];
pattern mreg means[im2reg|untypedmreg|umreg|im4reg|im8reg|iMreg|um8reg|MMXREGS|om8reg|um16reg];
pattern typedmreg means[im2reg| umreg|im4reg|im8reg|iMreg|um8reg|MMXREGS|om8reg|um16reg];

/* define m4 macros to generate casts to the desired types */
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
/*\end{verbatim}
\subsubsection{Addressing modes}
\begin{verbatim}
*/
pattern mrmaddrmode means[maddrmode|mreg];
pattern mriscaddrmode means[memrisc|mreg];
/*\end{verbatim}
\subsubsection{MMX instructions}
\begin{verbatim}
*/
instruction pattern PMULLW(im4reg m, im4reg ma)
	means[m := *(^(m),^(ma))]
	assembles['pmullw ' m ',' ma];
instruction pattern PMULLSSB(im8reg m1,mreg m2, mrmaddrmode ma)
	means[m1:= octoct(*:(octoct(^(m1)),octoct(^(ma))))]
	assembles['pxor MM7,MM7'   /* clear regs mm5 and mm7 */
		  '\n pxor MM5,MM5'
		  '\n punpckhbw MM7,'ma /* mm7 now has 4 words with the top 4 bytes of ma in them */
		  '\n pxor MM6,MM6'
		  '\n punpckhbw MM6,'m1
                  '\n punpcklbw MM5,'ma
                  '\n pmulhw MM7,MM6'
                  '\n psraw MM7,7'
		  '\n pxor MM6,MM6'
                  '\n punpcklbw MM6,'m1
                  '\n pmulhw MM5,MM6'
		  '\n psraw MM5,7'
		  '\n packsswb MM5,MM7'
		  '\n movq 'm1',MM5'];
instruction pattern MMXPUSH(mreg m)
	means[PUSH(mainSTACK,m)]
	assembles['sub stackp,8\n movq [stackp],'m';MMXPUSH'];
instruction pattern MMXPOP(mreg m )
	means[m:=(doubleword)POP(mainSTACK)]
	assembles['movq  'm',[stackp]\n add stackp,8;MMXPOP'];
instruction pattern PADDD(mreg m, mrmaddrmode ma)
	means[refintpair(m) := intpair(+(intpair(^(m)),intpair(^(ma))))]
	assembles ['paddd 'm ',' ma];
instruction pattern PADDW(im4reg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(+(shortquad(^(m)),shortquad(^(ma))))]
	assembles ['paddw 'm ',' ma];
instruction pattern PADDB(im8reg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(+(octoct(^(m)),octoct(^(ma))))]
	assembles ['paddb 'm ',' ma];

operation meq means = assembles ['eq'];
operation mgt means > assembles ['gt'];
pattern mcondition means[meq|mgt];
instruction pattern CMPPB(im8reg m,im8reg ma,mcondition cond)
	means[refoctb(m):= octb(cond(octb(^(m)),octb(^(ma))))]
	assembles['pcmp' cond 'b 'm','ma];
instruction pattern CMPPBR(im8reg m, im8reg ma,mcondition cond)
	means[refoctoct(m):= octoct(<(octoct(^(ma)),octoct(^(m))))]
	assembles['pcmpgtb 'm','ma];

 instruction pattern CMPPW(im4reg m,im4reg ma,mcondition cond)
	means[m:= EXTEND((int8 vector (4))cond(^(m),^(ma)))]
	assembles['pcmp' cond 'w 'm','ma];

 instruction pattern CMPPWR(im4reg m,im4reg ma,mcondition cond)
	means[ma:= EXTEND((int8 vector (4))<(^(ma),^(m)))]
	assembles['pcmpgtw 'm','ma
             '\n movq 'ma','m];


 instruction pattern CMPPD(im2reg m,im2reg ma,mcondition cond)
	means[m:= EXTEND((int8 vector (2))cond(^(m),^(ma)))]
	assembles['pcmp' cond 'd 'm','ma];

 instruction pattern CMPPDR(im2reg m,im2reg ma,im2reg m3)
	means[m3:= EXTEND((int8 vector (2))<(^(ma),^(m)))]
	assembles['pcmpgtd 'm','ma'\n movq 'm3','m];

 instruction pattern PADDUB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(+(octuint(^(m)),octuint(^(ma))))]
	assembles ['paddb 'm ',' ma];
instruction pattern PADDSB(im8reg m, mrmaddrmode ma)
	means[m := octoct(+:(^(m),octoct(^(ma))))]
	assembles ['paddsb 'm ',' ma];
instruction pattern PADDSB3(im8reg m,im8reg m2, mrmaddrmode ma)
	means[m := octoct(+:(^(m2),octoct(^(ma))))]
	assembles ['movq 'm','m2'\n paddsb 'm ',' ma];

instruction pattern PADDUSB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(+:(octuint(^(m)),octuint(^(ma))))]
	assembles ['paddusb 'm ',' ma];
/* stack add instructions */
 instruction pattern SPADDUSB(mreg m )
	means[refoctuint(m) := octuint(+:(octuint(POP(mainSTACK)),octuint(POP(mainSTACK))))]
	assembles ['movq 'm',[stackp]\n paddusb 'm ',[stackp+8]\n add stackp,16'];
instruction pattern SPADDUB(mreg m )
	means[refoctuint(m) := octuint(+(octuint(POP(mainSTACK)),octuint(POP(mainSTACK))))]
	assembles ['movq 'm',[stackp]\n paddb 'm ',[stackp+8]\n add stackp,16' ];
instruction pattern SPADDSB(im8reg m )
	means[m := octoct(+:(octoct(POP(mainSTACK)),octoct(POP(mainSTACK))))]
	assembles ['movq 'm',[stackp]\n paddsb 'm ',[stackp+8]\n add stackp,16'];

instruction pattern PABSB(im8reg m)
	means[m:=ABS(^(m))]
	assembles['pabsb 'm','m];
instruction pattern SPSUBD(mreg m )
	means[refintpair(m) := intpair(-(intpair(^(m)),intpair(POP(mainSTACK))))]
	assembles ['psubd 'm ',[stackp]\n add stackp,8' ];
instruction pattern PSUBW(im4reg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(-(shortquad(^(m)),shortquad(^(ma))))]
	assembles ['psubw 'm ',' ma];
instruction pattern PSUBB(im8reg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(-(octoct(^(m)),octoct(^(ma))))]
	assembles ['psubb 'm ',' ma];
instruction pattern PSUBUB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(-(octuint(^(m)),octuint(^(ma))))]
	assembles ['psubb 'm ',' ma];
instruction pattern PSUBSB(im8reg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(-:(octoct(^(m)),octoct(^(ma))))]
	assembles ['psubsb 'm ',' ma];
instruction pattern PSUBUSB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(-:(octuint(^(m)),octuint(^(ma))))]
	assembles ['psubusb 'm ',' ma];
instruction pattern PAND(typedmreg m, mrmaddrmode ma, type t)
	means[(ref t)m := (t)AND(^(m),^(ma))]
	assembles ['pand 'm ',' ma];
instruction pattern PANDN(typedmreg m, mrmaddrmode ma,type t)
	means[(ref t)m := (t)AND(^(ma),NOT(^(m)))]
	assembles ['pandn 'm ',' ma];
instruction pattern POR(typedmreg m, mrmaddrmode ma)
	means[m := OR(^(m),^(ma))]
	assembles ['por 'm ',' ma];
instruction pattern PNOT(typedmreg m)
	means[m:= NOT(^(m))]
	assembles['pnotm 'm];
instruction pattern MOVDS(waddrmode rm, wmreg m)
	means[(ref word)rm:= ^(m)]
	assembles['movd 'rm ','m];
instruction pattern MOVDL(waddrmode rm, wmreg m)
	means[m := (word)^(rm)]
	assembles['movd 'm ','rm];
instruction pattern MOVOCTUINTL(memrisc rm, mreg m)
	means[m := octuint(^(rm))]
	assembles['movq ' m ',' rm];
instruction pattern MOVQS(memrisc rm, mreg m)
	means[(ref doubleword)rm:= ^((ref doubleword)m)]
	assembles['movq 'rm ','m];
instruction pattern MOVQSGEN(memrisc rm, mreg m)
	means[ rm:= ^(m)]
	assembles['movq 'rm ','m];
instruction pattern MOVQR(mreg rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'rm ','m];

instruction pattern MOVOCTUINTS(memrisc rm,mreg m)
	means[(ref uint8 vector(8))rm:=^(m)]
	assembles['movq 'rm','m];
instruction pattern MOVQL(mrmaddrmode rm, mreg m)
	means[m :=  ^(rm)]
	assembles['movq ' m ',' rm];
instruction pattern MOVQLR(im8reg rm, im8reg m)
	means[m := ^(rm)]
	assembles['movq ' m ',' rm];


instruction pattern REP2(mreg m, reg r)
	means[m:=rep(^(r),2)]
	assembles['push 'r'\n push 'r'\n movq 'm',[stackp]\n add stackp,8'];

instruction pattern REP4(mreg m, wreg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movq 'm',[stackp]\n add stackp,8'];

instruction pattern REP8(mreg m, breg r)
	means[m:=rep(^(r),8)]
	assembles['sub stackp,2\n mov [stackp], 'r'\n mov [stackp+1], 'r'\n xchg [stackp],ax\npush ax\npush ax\n push ax\nxchg [stackp+6],ax\n movq 'm',[stackp]\n add stackp,8'];
instruction pattern PACKSSDW(reg r, mreg m)
	means[(ref int16 vector(4))m:=^((ref int32 vector(4))mem(r))]
	assembles['movq 'm',['r']\n packssdw 'm',['r'+8]'];

instruction pattern PACKSSWB(reg r, im8reg m)
	means[(ref int8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq 'm',['r']\n packsswb 'm',['r'+8]'];

instruction pattern PACKUSWB(reg r, mreg m)
	means[(ref uint8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq 'm',['r']\n packuswb 'm',['r'+8]'];



define(mmxcodes,MOVQSGEN|PADDD|PADDW|PADDB|PADDSB|PADDSB3|PADDUSB|PADDUB|SPADDSB|SPADDUSB|SPADDUB|PACKSSDW|PACKSSWB|PACKUSWB|
		CMPPB|CMPPBR|CMPPD|CMPPDR|CMPPW|CMPPWR|
		SPSUBD|PSUBW|PSUBB|PSUBSB|PSUBUSB|PSUBUB|POR|PANDN|PAND|PMULLSSB|PABSB|PNOT|
               PMULLW|MOVDS|MOVDL|MOVQS|MOVQL|MOVQLR|MOVOCTUINTS|MOVOCTUINTL|REP2|REP4|REP8|
		MMXPUSH|MOVQR)








define(athloncodes,PF2IW)
/* \end{verbatim} */
