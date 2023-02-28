/*
\end{verbatim}
\subsection{MMX registers and instructions}
\subsubsection{Registers}
\begin{verbatim}
*/

register doubleword MM0 assembles[ 'MM0']; 
alias register word MM0L=MM0(0:31) assembles['MM0'];
register doubleword MM1 assembles[ 'MM1'];  
alias register word MM1L=MM1(0:31) assembles['MM1'];
register doubleword MM2 assembles[ 'MM2'];  
alias register word MM2L=MM2(0:31) assembles['MM2'];
alias register int16 vector (4) MM216=MM2(0:63) assembles['MM2'];
register doubleword MM3 assembles[ 'MM3'];  
alias register word MM3L=MM3(0:31) assembles['MM3'];
alias register int16 vector (4) MM316=MM3(0:63) assembles['MM3'];
register doubleword MM4 assembles[ 'MM4'];  
alias register word MM4L=MM4(0:31) assembles['MM4'];
alias register int16 vector (4) MM416=MM4(0:63) assembles['MM4'];
reserved register doubleword MM5 assembles[ 'MM5'];  
alias register word MM5L=MM5(0:31) assembles['MM5'];
alias register int16 vector (4) MM516=MM5(0:63) assembles['MM5'];
reserved register doubleword MM6 assembles[ 'MM6'];  

/* reserve for working space */
reserved register doubleword MM7 assembles[ 'MM7']; 

pattern wm4reg means[MM416|MM316|MM516];
pattern mreg means [MM1|MM3|MM4|MM5|MM2|MM0|MM7|MM6];
pattern wmreg means[MM1L|MM3L|MM4L|MM2L|MM0L|MM5L];
pattern lmreg means [MM1L|MM3L|MM4L| MM2L|MM0L| MM5L];

 
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
instruction pattern PMULLW(mreg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(*(shortquad(^(m)),shortquad(^(ma))))]
	assembles['pmullw ' m ',' ma];
instruction pattern PMULLSSB(mreg m1,maddrmode m2, maddrmode ma)
	means[refoctoct(m1):= octoct(*:(octoct(^(m2)),octoct(^(ma))))]
	assembles['pxor MM5,MM5'
		  '\n punpckhbw MM7,'ma
		  '\n pxor MM6,MM6'
		  '\n punpckhbw MM6,'m2
                  '\n movq 'm1','ma
                  '\n punpcklbw 'm1',MM5' 
                  '\n pmulhw MM7,MM6'
                  '\n psraw MM7,7'
		  '\n movq MM6,'m2
                  '\n punpcklbw MM6,MM5'
                  '\n pmullw 'm1',MM6'
		  '\n psraw 'm1',7'
		  '\n packsswb 'm1',MM7'];
instruction pattern MMXPUSH(mreg m)
	means[PUSH(mainSTACK,m)]
	assembles['sub esp,8\n movq [esp],'m];
instruction pattern MMXPOP(mreg m )
	means[m:=POP(mainSTACK)]
	assembles['movq 'm',[esp]\n add esp,8'];
instruction pattern PADDD(mreg m, mrmaddrmode ma)
	means[refintpair(m) := intpair(+(intpair(^(m)),intpair(^(ma))))]
	assembles ['paddd 'm ',' ma];
instruction pattern PADDW(mreg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(+(shortquad(^(m)),shortquad(^(ma))))]
	assembles ['paddw 'm ',' ma];
instruction pattern PADDB(mreg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(+(octoct(^(m)),octoct(^(ma))))]
	assembles ['paddb 'm ',' ma];
instruction pattern CMPEQB(mreg m,mrmaddrmode ma)
	means[refoctb(m):= octb(=(octb(^(m)),octb(^(ma))))]
	assembles['pcmpeqb 'm','ma];
instruction pattern CMPGTB(mreg m,mrmaddrmode ma)
	means[refoctb(m):= octb(>(octb(^(m)),octb(^(ma))))]
	assembles['pcmpgtb 'm','ma];
instruction pattern CMPGTBR(mreg m,mrmaddrmode ma)
	means[refoctb(m):= octb(<(octb(^(ma)),octb(^(m))))]
	assembles['pcmpgtb 'm','ma];

 instruction pattern PADDUB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(+(octuint(^(m)),octuint(^(ma))))]
	assembles ['paddb 'm ',' ma];
instruction pattern PADDSB(mreg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(+:(octoct(^(m)),octoct(^(ma))))]
	assembles ['paddsb 'm ',' ma];
instruction pattern PADDUSB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(+:(octuint(^(m)),octuint(^(ma))))]
	assembles ['paddusb 'm ',' ma];
/* stack add instructions */
 instruction pattern SPADDUSB(mreg m )
	means[refoctuint(m) := octuint(+:(octuint(POP(mainSTACK)),octuint(POP(mainSTACK))))]
	assembles ['movq 'm',[esp]\n paddusb 'm ',[esp]\n add esp,16'];
instruction pattern SPADDUB(mreg m )
	means[refoctuint(m) := octuint(+(octuint(POP(mainSTACK)),octuint(POP(mainSTACK))))]
	assembles ['movq 'm',[esp]\n paddb 'm ',[esp]\n add esp,16' ];
instruction pattern SPADDSB(mreg m )
	means[refoctoct(m) := octoct(+:(octoct(POP(mainSTACK)),octoct(POP(mainSTACK))))]
	assembles ['movq 'm',[esp]\n paddsb 'm ',[esp+8]\n add esp,16'];
 

instruction pattern SPSUBD(mreg m )
	means[refintpair(m) := intpair(-(intpair(^(m)),intpair(POP(mainSTACK))))]
	assembles ['psubd 'm ',[esp]\n add esp,8' ];
instruction pattern PSUBW(mreg m, mrmaddrmode ma)
	means[refshortquad(m) := shortquad(-(shortquad(^(m)),shortquad(^(ma))))]
	assembles ['psubw 'm ',' ma];
instruction pattern PSUBB(mreg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(-(octoct(^(m)),octoct(^(ma))))]
	assembles ['psubb 'm ',' ma];
instruction pattern PSUBUB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(-(octuint(^(m)),octuint(^(ma))))]
	assembles ['psubb 'm ',' ma];
instruction pattern PSUBSB(mreg m, mrmaddrmode ma)
	means[refoctoct(m) := octoct(-:(octoct(^(m)),octoct(^(ma))))]
	assembles ['psubsb 'm ',' ma];
instruction pattern PSUBUSB(mreg m, mrmaddrmode ma)
	means[refoctuint(m) := octuint(-:(octuint(^(m)),octuint(^(ma))))]
	assembles ['psubusb 'm ',' ma];
instruction pattern PAND(mreg m, mrmaddrmode ma)
	means[m := AND(^(m),^(ma))]
	assembles ['pand 'm ',' ma];
instruction pattern PANDN(mreg m, mrmaddrmode ma)
	means[m := AND(^(ma),NOT(^(m)))]
	assembles ['pandn 'm ',' ma];
instruction pattern POR(mreg m, mrmaddrmode ma)
	means[m := OR(^(m),^(ma))]
	assembles ['por 'm ',' ma];
instruction pattern MOVDS(waddrmode rm, wmreg m)
	means[(ref word)rm:= ^(m)]
	assembles['movd 'rm ','m];
instruction pattern MOVDL(waddrmode rm, wmreg m)
	means[m := (word)^(rm)]
	assembles['movd 'm ','rm];
instruction pattern MOVOCTUINTL(addrmode rm, mreg m)
	means[m := octuint(^(rm))]
	assembles['movq ' m ',' rm];
instruction pattern MOVQS(maddrmode rm, mreg m)
	means[(ref doubleword)rm:= ^(m)]
	assembles['movq 'rm ','m];
instruction pattern MOVOCTUINTS(maddrmode rm,mreg m)
	means[(ref uint8 vector(8))rm:=^(m)]
	assembles['movq 'rm','m];
instruction pattern MOVQL(maddrmode rm, mreg m)
	means[m := (doubleword)^(rm)]
	assembles['movq ' m ',' rm];
instruction pattern REP2(mreg m, reg r)
	means[m:=rep(^(r),2)]
	assembles['push 'r'\n push 'r'\n movq 'm',[esp]\n add esp,8'];

instruction pattern REP4(mreg m, wreg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movq 'm',[esp]\n add esp,8'];

instruction pattern REP8(mreg m, breg r)
	means[m:=rep(^(r),8)]
	assembles['sub esp,2\n mov [esp], 'r'\n mov [esp+1], 'r'\n xchg [esp],ax\npush ax\npush ax\n push ax\nxchg [esp],ax\n movq 'm',[esp]\n add esp,8'];
instruction pattern PACKSSDW(reg r, mreg m)
	means[(ref int16 vector(4))m:=^((ref int32 vector(4))mem(r))]
	assembles['movq 'm',['r']\n packssdw 'm',['r'+8]'];

instruction pattern PACKSSWB(reg r, mreg m)
	means[(ref int8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq 'm',['r']\n packsswb 'm',['r'+8]'];

instruction pattern PACKUSWB(reg r, mreg m)
	means[(ref uint8 vector(8))m:=^((ref int16 vector(8))mem(r))]
	assembles['movq 'm',['r']\n packuswb 'm',['r'+8]'];



define(mmxcodes,PADDD|PADDW|PADDB|PADDSB|PADDUSB|PADDUB|SPADDSB|SPADDUSB|SPADDUB|PACKSSDW|PACKSSWB|PACKUSWB|
		CMPEQB|CMPGTB|CMPGTBR|
		SPSUBD|PSUBW|PSUBB|PSUBSB|PSUBUSB|PSUBUB|POR|PAND|PANDN|PMULLSSB|
               PMULLW|MOVDS|MOVDL|MOVQS|MOVQL|MOVOCTUINTS|MOVOCTUINTL|REP2|REP4|REP8|
		MMXPUSH)








define(athloncodes,PF2IW)


