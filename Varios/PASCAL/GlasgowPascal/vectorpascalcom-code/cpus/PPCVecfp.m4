

/*
\ PPC  machine description
*/

   
define(VECLEN,1024)
  
/* 
\section{SPE}
*/ 

register ieee32 vector(VECLEN)  NV0  assembles[' 0'];
register ieee32 vector(VECLEN)  NV1  assembles[' 1'];
register ieee32 vector(VECLEN)  NV2  assembles[' 2'];
register ieee32 vector(VECLEN)  NV3  assembles[' 3'];
register ieee32 vector(VECLEN)  NV4  assembles[' 4'];
register ieee32 vector(VECLEN)  NV5  assembles[' 5'];
register ieee32 vector(VECLEN)  NV6  assembles[' 6'];
register ieee32 vector(VECLEN)  NV7  assembles[' 7'];

pattern nregf means[NV0|NV1|NV2|NV3|NV4|NV5|NV6|NV7];
pattern nsrcf means[swR22|swR23|swR24|swR25|swR26|swR27];
pattern naddrmodef (nsrcf r)
        means[ mem(^(r))]
        assembles [r];
instruction  pattern speLOAD( naddrmodef rm, nregf r1)
        means[   r1 :=(ieee32 vector(VECLEN))^(rm)]
        assembles['li 3, ' r1
				  '\n la  4,0(' rm ')'
				  '\n bl  speLoadVec'];


instruction  pattern speSTORE( naddrmodef dest1, nregf r1)
        means[(ref ieee32 vector(VECLEN))  dest1  := ^(r1)]
        assembles['li 3, ' r1
				  '\n la  4,0(' dest1 ')'
				   '\n bl  speStoreVec'];

 instruction pattern speADDFLT(nregf r0,nregf r1 )
        means[r0:= +(^(r0),^(r1))]
        assembles['li 3, ' r0
				  '\n li 4,' r1
				  '\n bl  speAddVec'];

 instruction pattern speSUBFLT(nregf r0,nregf r1 )
        means[r0:= -(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speSubVec'];

 instruction pattern speMULFLT(nregf r0,nregf r1 )
        means[r0:= *(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speMulVec'];


 instruction pattern speDIVFLT(nregf r0,nregf r1 )
        means[r0:= div(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li   4,' r1
				  '\n bl  speDivVec'];

instruction pattern speSQRTFLT(nregf r0)
	means		[r0:=SQRT(^(r0))]
       assembles['li 3,' r0
				  '\n li 4,' r0
				  '\n bl  speSQRTFVec'];

instruction  pattern speREPFLT( nregf r0, sfreg r1)
        means[   r0:=rep(^(r1),VECLEN)]
        assembles['li 3, ' r0
				  '\n fmr 1,' r1
				  '\n bl  speRepVec'];


/*
\begin{verbatim}
*/





