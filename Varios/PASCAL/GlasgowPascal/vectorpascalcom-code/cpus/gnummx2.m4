
/*
\end{verbatim}
\subsection{MMX registers and instructions}
\subsubsection{Registers}
\begin{verbatim}
*/

register doubleword MM0 assembles[ '%MM0'];
register doubleword MM1 assembles[ '%MM1'];  
register doubleword MM2 assembles[ '%MM2'];  
register doubleword MM3 assembles[ '%MM3'];  
register doubleword MM4 assembles[ '%MM4'];  
/* reserve for working space */
reserved register doubleword MM7 assembles[ '%MM7']; 
reserved register doubleword MM5 assembles[ '%MM5'];  
reserved register doubleword MM6 assembles[ '%MM6']; 
/** used for operations using half registers */ 
alias register word MM0L=MM0(0:31) assembles['%MM0'];
alias register word MM1L=MM1(0:31) assembles['%MM1'];
alias register word MM2L=MM2(0:31) assembles['%MM2'];
alias register word MM3L=MM3(0:31) assembles['%MM3'];
alias register word MM4L=MM4(0:31) assembles['%MM4'];
alias register word MM5L=MM5(0:31) assembles['%MM5'];
/* used for 16 bit parallelism */
alias register int16 vector (4) MM016=MM0(0:63) assembles['%MM0'];
alias register int16 vector (4) MM116=MM1(0:63) assembles['%MM1'];
alias register int16 vector (4) MM216=MM2(0:63) assembles['%MM2'];
alias register int16 vector (4) MM316=MM3(0:63) assembles['%MM3'];
alias register int16 vector (4) MM416=MM4(0:63) assembles['%MM4'];
alias register int16 vector (4) MM516=MM5(0:63) assembles['%MM5'];

alias register int8 vector (8) MM08=MM0(0:63) assembles['%MM0'];
alias register int8 vector (8) MM18=MM1(0:63) assembles['%MM1'];
alias register int8 vector (8) MM28=MM2(0:63) assembles['%MM2'];
alias register int8 vector (8) MM38=MM3(0:63) assembles['%MM3'];
alias register int8 vector (8) MM48=MM4(0:63) assembles['%MM4'];
alias register int8 vector (8) MM58=MM5(0:63) assembles['%MM5'];

pattern im8reg means[MM48|MM38|MM58|MM08|MM18|MM28];

pattern im4reg means[MM416|MM316|MM516|MM016|MM116|MM216];
pattern untypedmreg means [MM1|MM3|MM4|MM5|MM2|MM0|MM7|MM6];
pattern wmreg means[MM1L|MM3L|MM4L|MM2L|MM0L|MM5L];
pattern lmreg means [MM1L|MM3L|MM4L| MM2L|MM0L| MM5L];
pattern mreg means[im4reg|untypedmreg|im8reg];

 
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

/*\end{verbatim}
\subsubsection{MMX instructions}
\begin{verbatim}
*/
instruction pattern PMULLW(im4reg m, mrmaddrmode ma)
	means[m := shortquad(*(shortquad(^(m)),shortquad(^(ma))))]
	assembles['pmullw ' ma ',' m];
instruction pattern PMULLSSB(im8reg m1,mrmaddrmode m2, mrmaddrmode ma)
	means[m1:= octoct(*:(octoct(^(m2)),octoct(^(ma))))]
	assembles['pxor %MM7,%MM7'   /* clear regs mm5 and mm7*/
		  '\n pxor %MM5,%MM5'
		  '\n punpckhbw 'ma',%MM7' /* mm7 now has 4 words with the top 4 bytes of ma in them */
		  '\n pxor %MM6,%MM6'
		  '\n punpckhbw 'm2',%MM6'
		  '\n pxor 'm1','m1
                  '\n punpcklbw 'ma','m1
                  '\n pmulhw %MM6,%MM7'
                  '\n psraw $7,%MM7'
                  '\n punpcklbw 'm2',%MM6'
                  '\n pmulhw %MM6,'m1
		  '\n psraw $7,'m1
		  '\n packsswb  %MM7,'m1];
instruction pattern MMXPUSH(mreg m)
	means[PUSH(mainSTACK,m)]
	assembles['sub $8,%esp\n movq 'm',(%esp)'];
instruction pattern MMXPOP(mreg m )
	means[m:=POP(mainSTACK)]
	assembles['movq (%esp),'m'\n add $8,%esp'];
instruction pattern PADDD(mreg m, mrmaddrmode ma)
	means[refintpair(m) := intpair(+(intpair(^(m)),intpair(^(ma))))]
	assembles ['paddd 'ma ',' m];
instruction pattern PADDW(im4reg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(+(shortquad(^(m)),shortquad(^(ma))))]
	assembles ['paddw 'ma ',' m];
instruction pattern PADDB(im8reg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(+(octoct(^(m)),octoct(^(ma))))]
	assembles ['paddb 'ma ',' m];
instruction pattern CMPEQB(mreg m,mrmaddrmode ma)
	means[refoctb(m):= octb(=(octb(^(m)),octb(^(ma))))]
	assembles['pcmpeqb 'ma','m];
instruction pattern CMPGTB(mreg m,mrmaddrmode ma)
	means[refoctb(m):= octb(>(octb(^(m)),octb(^(ma))))]
	assembles['pcmpgtb 'ma','m];
instruction pattern CMPGTBR(mreg m,mrmaddrmode ma)
	means[refoctb(m):= octb(<(octb(^(ma)),octb(^(m))))]
	assembles['pcmpgtb 'ma','m];

 instruction pattern PADDUB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(+(octuint(^(m)),octuint(^(ma))))]
	assembles ['paddb 'ma ',' m];
instruction pattern PADDSB(im8reg m, mrmaddrmode ma)
	means[m := octoct(+:(^(m),octoct(^(ma))))]
	assembles ['paddsb 'ma ',' m];
instruction pattern PADDSB3(im8reg m,im8reg m2, mrmaddrmode ma)
	means[m := octoct(+:(^(m2),octoct(^(ma))))]
	assembles ['movq 'm2','m'\n paddsb 'ma ',' m];
instruction pattern PADDUSB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(+:(octuint(^(m)),octuint(^(ma))))]
	assembles ['paddusb 'ma ',' m];
/* stack add instructions */
 instruction pattern SPADDUSB(mreg m )
	means[refoctuint(m) := octuint(+:(octuint(POP(mainSTACK)),octuint(POP(mainSTACK))))]
	assembles ['movq (%esp),'m
		'\n paddusb 8(%esp),'m
		'\n add $16,%esp'];
instruction pattern SPADDUB(mreg m )
	means[refoctuint(m) := octuint(+(octuint(POP(mainSTACK)),octuint(POP(mainSTACK))))]
	assembles ['movq (%esp),'m
		'\n paddb 8(%esp),'m
		'\n add $16,%esp'];
instruction pattern SPADDSB(im8reg m )
	means[m := octoct(+:(octoct(POP(mainSTACK)),octoct(POP(mainSTACK))))]
	assembles ['movq (%esp),'m
		'\n paddsb 8(%esp),'m
		'\n add $16,%esp'];



instruction pattern SPSUBD(mreg m )
	means[refintpair(m) := intpair(-(intpair(^(m)),intpair(POP(mainSTACK))))]
	assembles ['psubd (%esp),'m '\n add $8,%esp' ];
instruction pattern PSUBW(im4reg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(-(shortquad(^(m)),shortquad(^(ma))))]
	assembles ['psubw 'ma ',' m];
instruction pattern PSUBB(im8reg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(-(octoct(^(m)),octoct(^(ma))))]
	assembles ['psubb 'ma ',' m];
instruction pattern PSUBUB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(-(octuint(^(m)),octuint(^(ma))))]
	assembles ['psubb 'ma ',' m];
instruction pattern PSUBSB(im8reg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(-:(octoct(^(m)),octoct(^(ma))))]
	assembles ['psubsb 'ma ',' m];
instruction pattern PSUBUSB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(-:(octuint(^(m)),octuint(^(ma))))]
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
instruction pattern MOVDS(waddrmode rm, wmreg m)
	means[(ref word)rm:= ^(m)]
	assembles['movd 'm ','rm];
instruction pattern MOVDL(waddrmode rm, wmreg m)
	means[m := (word)^(rm)]
	assembles['movd 'rm ','m];
instruction pattern MOVOCTUINTL(addrmode rm, mreg m)
	means[m := octuint(^(rm))]
	assembles['movq ' rm ',' m];
instruction pattern MOVQS(maddrmode rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'm ','rm];
instruction pattern MOVOCTUINTS(maddrmode rm,mreg m)
	means[(ref uint8 vector(8))rm:=^(m)]
	assembles['movq 'm','rm];
instruction pattern MOVQL(maddrmode rm, mreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' rm ',' m];
instruction pattern MOVQLR(im8reg rm, im8reg m)
	means[m := ^(rm)]
	assembles['movq ' rm ',' m];

instruction pattern REP2(mreg m, reg r)
	means[m:=rep(^(r),2)]
	assembles['push 'r'\n push 'r'\n movq (%esp),'m'\n add $8,(%esp)'];

instruction pattern REP4(mreg m, wreg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movq (%esp),'m'\n add $8,%esp'];

instruction pattern REP8(mreg m, breg r)
	means[m:=rep(^(r),8)]
	assembles['sub $2,%esp\n movb 'r',(%esp)\n movb 'r',1(%esp)  '
	'\n xchg (%esp),%ax\npush %ax\npush %ax\n push %ax\nxchg 6(%esp),%ax\n movq (%esp),'m'\n add $8,%esp'];
instruction pattern PACKSSDW(reg r, mreg m)
	means[(ref int16 vector(4))m:=^((ref int32 vector(4))mem(r))]
	assembles['movq ('r'),'m'\n packssdw 8('r'),'m];

instruction pattern PACKSSWB(reg r, im8reg m)
	means[(ref int8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq ('r'),'m'\n packsswb $8('r'),'m];
instruction pattern PACKUSWB(reg r, mreg m)
	means[(ref uint8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq ('r'),'m'\n packuswb $8('r'),'m];



define(mmxcodes,PADDD|PADDW|PADDB|PADDSB|PADDSB3|PADDUSB|PADDUB|SPADDSB|SPADDUSB|SPADDUB|PACKSSDW|PACKSSWB|PACKUSWB|
		CMPEQB|CMPGTB|CMPGTBR|
		SPSUBD|PSUBW|PSUBB|PSUBSB|PSUBUSB|PSUBUB|POR|PAND|PANDN|PMULLSSB|
               PMULLW|MOVDS|MOVDL|MOVQS|MOVQL|MOVQLR|MOVOCTUINTS|MOVOCTUINTL|REP2|REP4|REP8|
		MMXPUSH)








define(athloncodes,PF2IW)


