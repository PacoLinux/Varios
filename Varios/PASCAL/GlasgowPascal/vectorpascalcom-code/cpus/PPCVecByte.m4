

/*
\ PPC  machine description
*/

   
define(VECLEN,1024)
  
/* 
\section{SPE}
*/ 

 register byte vector(VECLEN)  NVB0  assembles[' 0'];
 register byte vector(VECLEN)  NVB1  assembles[' 1'];
 register byte vector(VECLEN)  NVB2  assembles[' 2'];
 register byte vector(VECLEN)  NVB3  assembles[' 3'];
 register byte vector(VECLEN)  NVB4  assembles[' 4'];
 register byte vector(VECLEN)  NVB5  assembles[' 5'];
 register byte vector(VECLEN)  NVB6  assembles[' 6'];
 register byte vector(VECLEN)  NVB7  assembles[' 7'];

pattern nreg means[NVB0|NVB1|NVB2|NVB3|NVB4|NVB5|NVB6|NVB7];
pattern nsrc means[swR22|swR23|swR24|swR25|swR26|swR27];
pattern naddrmode (nsrc r)
        means[ mem(^(r))]
        assembles [r];
instruction  pattern speLOAD( naddrmode rm, nreg r1)
        means[   r1 :=(byte vector(VECLEN))^(rm)]
        assembles['li 3, ' r1
				  '\n la  4,0(' rm ')'
				  '\n bl  speLoadVec'];


instruction  pattern speSTORE( naddrmode dest1, nreg r1)
        means[(ref byte vector(VECLEN))  dest1  := ^(r1)]
        assembles['li 3, ' r1
				  '\n la  4,0(' dest1 ')'
				   '\n bl  speStoreVec'];

 instruction pattern speBADD(nreg r0,nreg r1 )
        means[r0:= +(^(r0),^(r1))]
        assembles['li 3, ' r0
				  '\n li 4,' r1
				  '\n bl  speByteAdd'];

 instruction pattern speBSUB(nreg r0,nreg r1 )
        means[r0:= -(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speByteSub'];

 instruction pattern speBMUL(nreg r0,nreg r1 )
        means[r0:= *(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speByteMul'];


 instruction pattern speBDIV(nreg r0,nreg r1 )
        means[r0:= div(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li   4,' r1
				  '\n bl  speByteDiv'];

/*
\begin{verbatim}
*/





