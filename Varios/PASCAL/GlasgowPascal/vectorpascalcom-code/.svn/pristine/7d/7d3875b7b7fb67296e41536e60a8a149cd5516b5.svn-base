

/*
\ PPC  machine description
*/

   
define(VECLEN,1024)
  
/* 
\section{SPE}
*/ 

register int32 vector(VECLEN)  NVI0  assembles[' 0'];
register int32 vector(VECLEN)  NVI1  assembles[' 1'];
register int32 vector(VECLEN)  NVI2  assembles[' 2'];
register int32 vector(VECLEN)  NVI3  assembles[' 3'];
register int32 vector(VECLEN)  NVI4  assembles[' 4'];
register int32 vector(VECLEN)  NVI5  assembles[' 5'];
register int32 vector(VECLEN)  NVI6  assembles[' 6'];
register int32 vector(VECLEN)  NVI7  assembles[' 7'];

pattern nregi means[NVI0|NVI1|NVI2|NVI3|NVI4|NVI5|NVI6|NVI7];
pattern nsrci means[swR22|swR23|swR24|swR25|swR26|swR27];
pattern naddrmodei (nsrci r)
        means[ mem(^(r))]
        assembles [r];
instruction  pattern speLOADINT( naddrmodei rm, nregi r1)
        means[   r1 :=(int32 vector(VECLEN))^(rm)]
        assembles['li 3, ' r1
				  '\n la  4,0(' rm ')'
				  '\n bl  speLoadIntVec'];


instruction  pattern speSTOREINT( naddrmodei dest1, nregi r1)
        means[(ref int32 vector(VECLEN))  dest1  := ^(r1)]
        assembles['li 3, ' r1
				  '\n la  4,0(' dest1 ')'
				   '\n bl  speStoreIntVec'];

 instruction pattern speADDINT(nregi r0,nregi r1 )
        means[r0:= +(^(r0),^(r1))]
        assembles['li 3, ' r0
				  '\n li 4,' r1
				  '\n bl  speAddIntVec'];

 instruction pattern speSUBINT(nregi r0,nregi r1 )
        means[r0:= -(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speSubIntVec'];

 instruction pattern speMULINT(nregi r0,nregi r1 )
        means[r0:= *(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speMulIntVec'];


 instruction pattern speDIVINT(nregi r0,nregi r1 )
        means[r0:= div(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li   4,' r1
				  '\n bl  speDivIntVec'];

instruction pattern speREPINT(nregi vr, wreg r)
	means[vr:=rep(^(r),VECLEN)]
	assembles['li 3,' vr
			  '\n mr 4,' r
				  '\n bl  speRepIntVec'];

/*
\begin{verbatim}
*/





