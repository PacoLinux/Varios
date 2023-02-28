/*
\section{Pentium}
*/
include(`cpus/i386gas.m4')
 
define(SCALEDSUB, subl)
define(SCALEDADD, addl)
define(SPTR,%esp)
define(ADDRSIZE, 4 )
include(`cpus/gnusse2.m4')
define(VECLEN,1024)
/*
\section{SPE}
*/

register ieee32 vector(VECLEN)  NV0  assembles[' $0'];
register ieee32 vector(VECLEN)  NV1  assembles[' $1'];
register ieee32 vector(VECLEN)  NV2  assembles[' $2'];
register ieee32 vector(VECLEN)  NV3  assembles[' $3'];
pattern nreg means[NV0|NV1|NV2|NV3];
 
instruction  pattern speLOAD(indexreg i1 , nreg r1)
        means[   r1 :=(ieee32 vector(VECLEN))^(mem(^(i1)))]
        assembles[  'pushl ' i1
					'\n pushl ' r1
				  '\n.extern simdldop\n call  _simdldop'
				  '\n addl $8,%esp'];
instruction pattern SPEREP(nreg m )
	means[m:=rep((ieee32)POP(mainSTACK),VECLEN)]
	assembles['pushl ' m '\n call _sperep \n addl $8,%esp'];

instruction  pattern speSTORE( nreg r1)
        means[(ref ieee32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles[  
					'\n pushl ' r1
				  '\n.extern _simdstop\n call  _simdstop'
				  '\n addl $8,%esp' ];
 operation simdadd means  +  assembles [ '$1'];
 operation simdsub means  -  assembles [ '$2'];
 operation simdmul means  *  assembles [ '$0'];
 operation simddiv means div assembles [ '$3'];
 pattern simdop means[simdadd|simdsub|simddiv|simdmul];
 instruction pattern speFOP(nreg reg0,nreg reg1, simdop sop )
        means[reg0:= sop(^(reg0),^(reg1))]
        assembles[ 'pushl ' sop
					'\n pushl ' reg1
					'\n pushl ' reg0
				  '\n \n call  _genop'
				  '\n addl $12,%esp' ];
instruction pattern speFMROP(nreg reg0, indexreg i1, simdop sop )
        means[reg0:= sop(^(reg0),(ieee32 vector(VECLEN))^(mem(^(i1))))]
        assembles[ 
					'\n pushl ' i1
					'\n pushl ' reg0
					'\n pushl ' sop
				  '\n \n call  _mfop'
				  '\n addl $12,%esp' ];

 instruction pattern SPESQRT(nreg r)
	means [ r:= SQRT(^(r))]
	assembles['pushl 'r'\n call _spesqrt \n addl $4,%esp'];  
  

/*
\begin{verbatim}
*/

define( SPEfloatcodes,
		speLOAD|speSTORE|speFMROP|speFOP|SPESQRT|SPEREP
	)
 

/* \begin{verbatim}*/
instructionset [ SPEfloatcodes|
	STORUPS
	 |IA32codes|INTMIN|INTMAX |FSET|STORESS|
	COMISSIFGOTO|lastIA32codes|XMMXcodes|fpucodes|fpupushes]
 
/*

\end{verbatim}
*/
  
