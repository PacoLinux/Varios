/*
\end{verbatim}
\subsection{Streaming SIMD registers and instructions}
Copyright University of Glasgow (c) 2002
\subsubsection{Registers}
\begin{verbatim}

*/

register quadword XMM0 assembles[ 'XMM0'];
alias register ieee32 XMM00=XMM0(0:31) assembles['xmm0'] ; 
register quadword XMM1 assembles[ 'XMM1']; 
alias register ieee32 XMM10=XMM1(0:31) assembles['xmm1'] ;
register quadword XMM2 assembles[ 'XMM2']; 
alias register ieee32 XMM20=XMM2(0:31) assembles['xmm2'] ;
register quadword XMM3 assembles[ 'XMM3']; 
alias register  ieee32 XMM30=XMM3(0:31) assembles['xmm3'] ;
register quadword XMM4 assembles[ 'XMM4']; 
alias register ieee32 XMM40=XMM4(0:31) assembles['xmm4'] ;
register quadword XMM5 assembles[ 'XMM5']; 
alias register ieee32 XMM50=XMM5(0:31) assembles['xmm5'] ;
register quadword XMM6 assembles[ 'XMM6']; 
alias register  ieee32 XMM60=XMM6(0:31) assembles['xmm6'] ;
register quadword XMM7 assembles[ 'XMM7'];
alias register ieee32 XMM70=XMM7(0:31) assembles['xmm7'] ;

alias register int32 iXMM00=XMM0(0:31) assembles['xmm0'] ;
alias register int32 iXMM10=XMM1(0:31) assembles['xmm1'] ;
alias register int32 iXMM20=XMM2(0:31) assembles['xmm2'] ;
alias register int32 iXMM30=XMM3(0:31) assembles['xmm3'] ;
alias register int32 iXMM40=XMM4(0:31) assembles['xmm4'] ;
alias register int32 iXMM50=XMM5(0:31) assembles['xmm5'] ;
alias register int32 iXMM60=XMM6(0:31) assembles['xmm6'] ;
alias register ieee32 vector(4) SXMM0=XMM0(0:127) assembles['Xmm0'];
alias register ieee32 vector(4) SXMM1=XMM1(0:127) assembles['Xmm1'];
alias register ieee32 vector(4) SXMM2=XMM2(0:127) assembles['Xmm2'];
alias register ieee32 vector(4) SXMM3=XMM3(0:127) assembles['Xmm3'];
alias register ieee32 vector(4) SXMM4=XMM4(0:127) assembles['Xmm4'];

alias register ieee32 vector(4) SXMM5=XMM5(0:127) assembles['Xmm5'];

pattern oxmreg means [XMM1|XMM3|XMM4|XMM5|XMM6|XMM2|XMM0|XMM7];
pattern sxxmreg means[SXMM0|SXMM1|SXMM2|SXMM3|SXMM4|SXMM5];
pattern xmreg means[sxxmreg|oxmreg];
pattern sfxmreg means[XMM00|XMM10|XMM20|XMM30|XMM70|XMM60|XMM50|XMM40]; 
pattern sixmreg means[iXMM00|iXMM10|iXMM20|iXMM30| iXMM60|iXMM50|iXMM40];
pattern sxmreg means[sfxmreg|sixmreg];
/* define m4 macros to generate casts to the desired types */
define(singlequad, (ieee32 vector(4))$1)
define(refsinglequad,(ref ieee32 vector(4))$1)


/*\end{verbatim}
\subsubsection{Addressing modes}
\begin{verbatim}
*/
pattern smaddrmode means[maddrmode|sxmreg];
pattern psmaddrmode means[maddrmode|sxxmreg];



/*\end{verbatim}
\subsubsection{Operations}
\begin{verbatim}
*/

operation sdiv means div assembles ['div'];
operation min means MIN assembles ['MIN'];
operation max means MAX assembles ['MAX'];
pattern soperator means[add|mul|sdiv|sub|min|max];
/*\end{verbatim}
\subsubsection{XMMX instructions}
\begin{verbatim}
*/
instruction  pattern OPSS(soperator op, smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=op( ( ieee32)^( r1),( ieee32)^(  rm))]
    	assembles[op 'ss  '    r1 ',' rm];
instruction  pattern PORSS(  smaddrmode rm,sxmreg r1)
        means[   r1 :=OR(  ^( r1), ^(  rm))]
    	assembles[ 'por '    r1 ',' rm];
instruction  pattern PANDSS(  smaddrmode rm,sxmreg r1)
        means[   r1 :=AND(  ^( r1), ^(  rm))]
    	assembles[ 'pand '    r1 ',' rm];
instruction  pattern PANDNSS(  smaddrmode rm,sxmreg r1)
        means[   r1 :=AND(  ^( r1),NOT( ^(  rm)))]
    	assembles[ 'pand '    r1 ',' rm];
instruction  pattern ADDSS( smaddrmode rm,sxmreg r1)/* this knows about + commuting OPSS does not */
        means[ (ref ieee32) r1 :=+( ( ieee32)^( r1),( ieee32)^(  rm))]
    	assembles['addss  '    r1 ',' rm];
instruction  pattern OPPS(soperator op, xmreg rm,xmreg r1)
        means[  refsinglequad( r1) :=op( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles[op 'ps  '    r1 ',' rm];
instruction  pattern ADDPS( xmreg rm,xmreg r1)
        means[  refsinglequad( r1) :=+( singlequad( ^( r1)), singlequad(^(  rm)))]
    	assembles['addps  '    r1 ',' rm];
instruction  pattern STORUPS( smaddrmode rm,xmreg r1)
        means[ refsinglequad( rm) :=singlequad( ^(r1))]
    	assembles['movups  '    rm ', ' r1];
instruction  pattern MOVUPS( psmaddrmode rm,xmreg r1)
        means[   r1 :=singlequad( ^(rm))]
    	assembles['movups  '    r1 ', ' rm];
instruction  pattern MOVSS( smaddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=^((ref ieee32) rm)]
    	assembles['movss  '    r1 ', ' rm];
instruction pattern XRLOADLIT(float f,sxmreg r1)
	means[ (ref ieee32)r1:=const f]
	assembles['xrloadlit 'r1','f];

instruction  pattern CVTSI2SS( maddrmode rm,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^( rm))]
    	assembles['cvtsi2ss  '    r1 ', ' rm];
instruction  pattern CVTIR2SS( reg r0,sxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  r0))]
    	assembles['cvtsi2ss  '    r1 ', ' r0]; 
instruction  pattern CVTSS2SI( reg r1,sxmreg r0)
        means[ (ref int32) r1 :=(int32)ROUND(^(  r0))]
    	assembles['cvtss2si  '    r1 ', ' r0]; 
    	/*assembles['push ' r0
    	       '\n cvtsi2ss  '    r1 ',  [esp] \n add esp,4'];
*/instruction  pattern STORESS( maddrmode rm,sxmreg r1)
        means[ (ref ieee32) rm :=( ieee32)^( r1)]
    	assembles['movss  '    rm ',' r1];
instruction pattern SSRPUSH(sxmreg r)
	means[PUSH(mainSTACK,^(r))]
	assembles['sub esp,4\n movss [esp],'  r];
instruction pattern SSRPOP(sxmreg r)
	means[(ref ieee32)r:=(ieee32)POP(mainSTACK)]
	assembles[' movss 'r ',[esp]\n add esp,4'];
instruction pattern SSRPOPI(sxmreg r)
	means[(ref ieee32)r:=(ieee32)FLOAT((int32)POP(mainSTACK))]
	assembles[' cvtsi2ss 'r ',[esp]\n add esp,4'];
instruction pattern COMISSIFGOTO(label l,sxmreg r1,sxmreg r2,fcondition c) 
	means[if(c(^(r1),^(r2)))goto l] 
	assembles['comiss ' r1 ','  r2 '\n j' c ' near  ' l];  
instruction pattern COMISS(fcondition c,sxmreg r1,sxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['comiss 'r1 ',' r2 '\n set'c ' ' r];


instruction pattern FREP4(xmreg m, reg r)
	means[m:=rep(^(r),4)]
	assembles['push 'r'\n push 'r'\n push 'r'\n push 'r'\n movups 'm',[esp]\n add esp,16'];

define(XMMXcodes,ADDSS|CVTSI2SS|CVTIR2SS| /* CVTSS2SI| */ XRLOADLIT|
 OPPS| OPSS|PORSS|PANDSS|PANDNSS| COMISSIFGOTO|  COMISS|	STORUPS|MOVUPS |
       STORESS| MOVSS|SSRPOPI|SSRPOP|FREP4|ADDPS)

