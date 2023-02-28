/*
 AVX2
*/  
define(havesse,1)

define(Rvec,8)
define(addrtype,int32)
include(`cpus/i386base.m4') 
include(cpus/ifpu.m4)
 
include(cpus/AVX.m4) 

	
include(cpus/fgathertrans.m4)

instructionset [ 

 LEA|gathers|OPd2|IREP8|LDRANGE0to7|
  YMMXcodes|
IA32codes|p6intcodes
|FSTRF|FSTR
 
|fpucodes|fpupushes|lastIA32codes| XBOOL|XDBOOL|FPU2XMMb32
|CMPpl|xMOVD
 
]

 
