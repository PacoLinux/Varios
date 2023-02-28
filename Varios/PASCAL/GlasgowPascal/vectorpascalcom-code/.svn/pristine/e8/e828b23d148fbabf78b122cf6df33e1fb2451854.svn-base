

/*
\ PPE  machine description
*/
/*
include(`cpus/PPCint.m4')
include(`cpus/PPCfp.m4')
include(`cpus/PPCnew.m4')
*/
define(VECLEN,256)
/*
\section{SPE}
*/

register ieee32 vector(VECLEN)  NV0  assembles[' 0'];
register ieee32 vector(VECLEN)  NV1  assembles[' 1'];
register ieee32 vector(VECLEN)  NV2  assembles[' 2'];
register ieee32 vector(VECLEN)  NV3  assembles[' 3'];
pattern nreg means[NV0|NV1|NV2|NV3];
pattern nsrc means[r22];
pattern naddrmode (nsrc r)
        means[ mem(^(r))]
        assembles [r];
instruction  pattern speLOAD( naddrmode rm, nreg r1)
        means[   r1 :=(ieee32 vector(VECLEN))^(rm)]
        assembles['lqx ' r1 ',r22 '
				  '\n call  speLOAD'];


instruction  pattern speSTORE( sreg dest,nreg r1)
        means[(ref ieee32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles[' lwz r22,0(SP)'
				   '\n addi SP,SP,4'
				   '\n mr r3',' r1
				   '\n call  speStoreVec' ];

 instruction pattern speFADD(nreg reg0,nreg reg1 )
        means[reg0:= +(^(reg0),^(reg1))]
        assembles['mr r3  ,' reg0
				  '\n mr r4  ,' reg1
				  '\n call  speAddVec'];

 instruction pattern speFSUB(nreg reg0,nreg reg1 )
        means[reg0:= -(^(reg0),^(reg1))]
        assembles['mr r3  ,' reg0
				  '\n mr r4  ,' reg1
				  '\n call  speSubVec'];

 instruction pattern speFMUL(nreg reg0,nreg reg1 )
        means[reg0:= *(^(reg0),^(reg1))]
        assembles['mr r3  ,' reg0
				  '\n mr r4  ,' reg1
				  '\n call  speMulVec'];


 instruction pattern speFDIV(nreg reg0,nreg reg1 )
        means[reg0:= div(^(reg0),^(reg1))]
        assembles['mr r3  ,' reg0
				  '\n mr r4  ,' reg1
				  '\n call  speDivVec'];

/*
\begin{verbatim}
*/

define( SPEfloatcodes,
		speLOAD|speSTORE|speFADD|speFSUB|speFMUL|speFDIV 
	)
/*
\|STACKPUSH|AMD64Codes|XMMXcodes|lastAMD64Codes|fpucodes]
*/

/*
\end{verbatim}
*/




