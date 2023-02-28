/* instructions that use the fpu and modify main stack */
instruction pattern FPOPMS32(type t)
	means[PUSH(ST,(ieee32)POP(mainSTACK))]
	assembles[' fld dword [esp]\n add esp,4'];
instruction pattern FPOPMSI6432(type t)
	means[PUSH(ST,(int64)POP(mainSTACK))]
	assembles['fild qword [esp]\n add esp,8'];
instruction pattern DPOPMS32(type t)
	means[PUSH(ST,(ieee64)POP(mainSTACK))]
	assembles['fld qword [esp]\n add esp,8'];
instruction pattern FPUSHD32(type t)
	means[PUSH(mainSTACK,(ieee64)POP(ST))]
	assembles['sub esp,8\n fstp qword [esp]'];
instruction pattern FPUSHF32(type t)
	means[PUSH(mainSTACK,(ieee32)POP(ST))]
	assembles['sub esp,4\n fstp dword [esp]'];
instruction pattern FPUSHI32(type t)
	means[PUSH(mainSTACK,(int32)ROUND((t)POP(ST)))]
	assembles['sub esp,4\n fistp dword [esp]'];
instruction pattern FOPIIMS32(maddrmode a,fioperator op,signed t)
	means[PUSH(mainSTACK,(int32)op((t)POP(ST),(t)^(a)  )) ]
	assembles['fi'op '  dword  ' a'\n sub esp,4\n fistp dword[esp]'];
instruction pattern FPUSHIT32(type t)
	means[PUSH(mainSTACK,(int32)TRUNCATE((t)POP(ST)))]
	assembles['sub esp,4\n fisttp dword [esp]'];
instruction pattern FPUSHI232(type t)
	means[PUSH(mainSTACK,(int32) POP(ST) )]
	assembles['sub esp,4\n fistp dword [esp]'];
instruction pattern FILDIP32(real t)
	means[PUSH(ST, (int32)POP(mainSTACK))]
	assembles['fild dword[esp]\n add esp,4'];

instruction pattern FMAX32(maddrmode a,fputype t)		 
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcom st0,st1  \npush ax\n fstsw ax\n sahf\n pop ax\n jnb $+4 \n fxch \nfstp st1'];
instruction pattern FMIN32(maddrmode a,fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcom st0,st1  \n push ax\n fstsw ax\n sahf\n pop ax\n jb $+4 \n fxch \nfstp st1'];

instruction pattern FIMIN32(maddrmode a,fputype t)
	means[PUSH(mainSTACK,(int32)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcom st0,st1  \n push ax\n fstsw ax\n sahf\n pop ax\n jb $+4 \n fxch \nfstp st1\n sub esp,4\n fistp dword[esp]'];
instruction pattern FIFGOTO32(label l, maddrmode a,fcondition c,int t,fpuval t2)
	means[if((t)c((t2)POP(ST), ^((ref ieee32)a)))goto l]
	assembles['fcomp dword ' a ' \npush ax\n fstsw ax\n sahf\n pop ax\n j' c ' near  ' l];
instruction pattern FIFGOTOgeneral32(label l,  fcondition c,int t,fpuval t2)
	means[if((t)c((t2)POP(ST), (t2)POP(ST)))goto l]
	assembles['fxch\n fcompp \npush ax  \n fstsw ax\n sahf\n pop ax\n j' c ' near ' l];
instruction pattern FSET32(fcondition c, breg r,fpuval t2)
	means[(ref int8)r:=(int8) c((t2)POP(ST), (t2)POP(ST))]
	assembles['fxch\n fcompp\n push ax\n fstsw ax\n sahf\n pop ax\n set'c ' ' r'\nnot 'r'\n inc 'r];
	
	
	
	instruction pattern EXTENDMS32(type t)
	means[PUSH(ST,(int64)EXTEND((int32)POP(mainSTACK)))]
	assembles['fild dword [esp]\n add esp,4'];

instruction pattern FLOATMS32(anyreal t,hiint t2)
	means[PUSH(ST,(t)FLOAT((t2)POP(mainSTACK)))]
	assembles['fild dword [esp]\n add esp,4'];
