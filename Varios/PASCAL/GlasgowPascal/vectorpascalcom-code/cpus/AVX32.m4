/*
 AVX32
*/
define(havesse,1)

define(Rvec,8)
define(addrtype,int32)
include(`cpus/i386base.m4') 
include(cpus/ifpu.m4)
include(cpus/mmx.m4)
include(cpus/AVX.m4) 
include(cpus/floattrans.m4)

instructionset [ IA32codes|p6intcodes
|mmxcodes|YMMXcodes|FSTRF|FSTR
|p6fpucodes|fpucodes|fpupushes|lastIA32codes| XBOOL|XDBOOL|FPU2XMMb32]

/* 

\end{verbatim}                 g
*/
