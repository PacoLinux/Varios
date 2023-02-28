/*
\section{Pentium}
*/
 define(havesse,1)
define(bit64, 1) 

include(`cpus/i386base.m4')
include(`cpus/ifpu.m4')
include(`cpus/mmx.m4') 
 
include(`cpus/sse2.m4') 
 
 
 
pattern fxmreg means[XMM00|XMM10|XMM20|XMM30|XMM70|XMM60|XMM50|XMM40];

pattern dxmreg means[ XMM3R64| XMM2R64| XMM1R64| XMM0R64];
 
 
   instruction  pattern CVTTSS2SI(int32reg r1,fxmreg r0)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee32)^(  r0))]
    	assembles['cvttss2si  '    r1 ', ' r0];
instruction  pattern CVTTSD2SI( dxmreg rm,int32reg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
    	assembles['cvttsd2si  '    r1 ', ' rm]; 
     
 
define(VECLEN,256)
/*
\section{SPE}
*/

register ieee32 vector(VECLEN)  NV0  assembles[' 0'];
register ieee32 vector(VECLEN)  NV1  assembles[' 1'];
register ieee32 vector(VECLEN)  NV2  assembles[' 2'];
register ieee32 vector(VECLEN)  NV3  assembles[' 3'];
pattern nreg means[NV0|NV1|NV2|NV3];
 pattern ptreg means[
  R8|R9|R10|R11|R12|R13|R14|R15 ];
instruction  pattern speLOAD(ptreg i1 , nreg r1)
        means[   r1 :=(ieee32 vector(VECLEN))^(mem(^(i1)))]
        /* c equiv simdldop ( i1, r1) */
        assembles[  '\tmov RDI,' i1 
					'\n \tmov RSI,' r1 
				  '\n \textern\tsimdldop \n \tcall  \tsimdldop'
				  ];
instruction pattern SPEREP(nreg m )
	means[m:=rep((ieee32)POP(mainSTACK),VECLEN)]
	/* c equiv sprep(m,pop) */
	assembles['mov \tRDI, ' m ' \n pop \trdi\n \textern\tsperep\ncall \tsperep '];

instruction  pattern speSTORE( nreg r1)
        means[(ref ieee32 vector(VECLEN))mem((int64)POP(mainSTACK)):=^(r1)]
        /* c equiv simdstop(dest,r1) */
        assembles[  
					'\n pop \trdi'
					'\n mov \tRSI,' r1 
				  '\n \textern \tsimdstop\n\tcall  \tsimdstop'
				   ];
 operation simdadd means  +  assembles [ '1'];
 operation simdsub means  -  assembles [ '2'];
 operation simdmul means  *  assembles [ '0'];
 operation simddiv means div assembles [ '3'];
 pattern simdop means[simdadd|simdsub|simddiv|simdmul];
 instruction pattern speFOP(nreg reg0,nreg reg1, simdop sop )
        means[reg0:= sop(^(reg0),^(reg1))]
        /* c equiv genop(reg0,reg1,sop) */
        assembles[ 'mov \tRDX,' sop 
					'\n mov \tRSI,' reg1 
					'\n mov \tRDI,' reg0 
				  '\n \textern\tgenop\n\tcall  \tgenop'
				   ];
instruction pattern speFMROP(nreg reg0, ptreg i1, simdop sop )
        means[reg0:= sop(^(reg0),(ieee32 vector(VECLEN))^(mem(^(i1))))]
        /* c equiv mfop(reg0,i1,sop) */
        assembles[ 
					'\n mov \tRDX,' sop 
					'\n mov \tRSI,' i1 
					'\n mov \tRDI,' reg0 
				  '\n \textern\tmfop\n\tcall  \tmfop'
				  ];

 instruction pattern SPESQRT(nreg r)
	means [ r:= SQRT(^(r))]
	assembles['mov \tRDI,'r' \n\textern\tspesqrt\t \n\tcall \tspesqrt '];  
  

/*
\begin{verbatim}
*/

define( SPEfloatcodes,
		speLOAD|speSTORE|speFMROP|speFOP|SPESQRT|SPEREP
	)
 

/* \begin{verbatim}*/
instructionset [ SPEfloatcodes|IA32codes
 |p6intcodes
 |XMMXcodes
 |CVTSS2SI|CVTSD2SI|CVTTSS2SI|CVTTSD2SI|CVTSI2SD|CVTSI2SS|CVTIR2SS 
 |FSTRF
 |FSTR
 |p6fpucodes
 |fpucodes
 |fpupushes
 |lastIA32codes 
 | mmxcodes
]
/*

\end{verbatim}
*/
  
