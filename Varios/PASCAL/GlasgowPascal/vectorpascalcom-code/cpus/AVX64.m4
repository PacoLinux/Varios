/*
 AVX64
*/
define(havesse,1)
define(bit64, 1) 

include(`cpus/i386base.m4')
include(`cpus/ifpu.m4')
include(`cpus/mmx.m4') 
include(`cpus/AVX.m4')
 
instructionset [ IA32codes|p6intcodes
|YMMXcodes|FSTRF|FSTR  
|p6fpucodes|fpucodes|fpupushes|lastIA32codes| mmxcodes|XBOOL|XDBOOL|FPU2XMMb64]

 
