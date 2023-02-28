

/*
\ PPC  machine description
*/

   
define(VECLEN,1024)
  
/* 
\section{SPE}
*/ 

 register short vector(VECLEN)  NVS0  assembles[' 0'];
 register short vector(VECLEN)  NVS1  assembles[' 1'];
 register short vector(VECLEN)  NVS2  assembles[' 2'];
 register short vector(VECLEN)  NVS3  assembles[' 3'];
 register short vector(VECLEN)  NVS4  assembles[' 4'];
 register short vector(VECLEN)  NVS5  assembles[' 5'];
 register short vector(VECLEN)  NVS6  assembles[' 6'];
 register short vector(VECLEN)  NVS7  assembles[' 7'];

pattern nregs means[NVS0|NVS1|NVS2|NVS3|NVS4|NVS5|NVS6|NVS7];
pattern nsrcs means[swR22|swR23|swR24|swR25|swR26|swR27];
pattern naddrmodes (nsrcs r)
        means[ mem(^(r))]
        assembles [r];
instruction  pattern speLOAD( naddrmodes rm, nregs r1)
        means[   r1 :=(short vector(VECLEN))^(rm)]
        assembles['li 3, ' r1
				  '\n la  4,0(' rm ')'
				  '\n bl  speLoadVec'];


instruction  pattern speSTORE( naddrmodes dest1, nregs r1)
        means[(ref short vector(VECLEN))  dest1  := ^(r1)]
        assembles['li 3, ' r1
				  '\n la  4,0(' dest1 ')'
				   '\n bl  speStoreVec'];

 instruction pattern speSADD(nregs r0,nregs r1 )
        means[r0:= +(^(r0),^(r1))]
        assembles['li 3, ' r0
				  '\n li 4,' r1
				  '\n bl  speshortAdd'];

 instruction pattern speSSUB(nregs r0,nregs r1 )
        means[r0:= -(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speshortSub'];

 instruction pattern speSMUL(nregs r0,nregs r1 )
        means[r0:= *(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li 4,' r1
				  '\n bl  speshortMul'];


 instruction pattern speSDIV(nregs r0,nregs r1 )
        means[r0:= div(^(r0),^(r1))]
        assembles['li 3,' r0
				  '\n li   4,' r1
				  '\n bl  speshortDiv'];

/*
\begin{verbatim}
*/





