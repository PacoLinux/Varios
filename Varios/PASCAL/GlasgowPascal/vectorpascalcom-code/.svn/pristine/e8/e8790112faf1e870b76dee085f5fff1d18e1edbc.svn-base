/* instructions that use the fpu and modify main stack */
instruction pattern FPOPMS64(type t)
	means[PUSH(ST,(ieee32)POP(mainSTACK))]
	assembles['fld dword PTRMACRO[rsp]\n add rsp,8 ;#FPOPMS64']; 
instruction pattern FPOPMSI6464(type t)
	means[PUSH(ST,(int64)POP(mainSTACK))]
	assembles['fild qword PTRMACRO[rsp]\n add rsp,8 ;#FPOPMSI6464'];
instruction pattern DPOPMS64(type t)
	means[PUSH(ST,(ieee64)POP(mainSTACK))]
	assembles['fld qword PTRMACRO[rsp]\n add rsp,8;#DPOPMS64'];
instruction pattern FPUSHD64(type t)
	means[PUSH(mainSTACK,(ieee64)POP(ST))]
	assembles['sub rsp,8\n fstp qword PTRMACRO[rsp];#FPUSHD64'];
instruction pattern FPUSHF64(type t)
	means[PUSH(mainSTACK,(ieee32)POP(ST))]
	assembles['sub rsp,8\n fstp dword PTRMACRO[rsp] ;#FPUSHF64'];
pattern finttype means[int32|int64];	
instruction pattern FPUSHI64(type t)
	means[PUSH(mainSTACK,(int64)ROUND((t)POP(ST)))]
	assembles['sub rsp,8\n fistp qword PTRMACRO [rsp] ;#FPUSHI64'];
instruction pattern FtoRR(int32reg r,type t)
	means[r:=ROUND((t)POP(ST))]
	assembles['sub rsp,8\n fistp dword PTRMACRO [rsp] \n mov ' r ',[rsp]\n add rsp,8;#FtoR'];
instruction pattern FtoR(int32reg r,type t)
	means[r:=(int32)(t)POP(ST)]
	assembles['sub rsp,8\n fistp dword PTRMACRO [rsp] \n mov ' r ',[rsp]\n add rsp,8;#FtoR'];
instruction pattern FOPIIMS64(maddrmode a,fioperator op,signed t)
	means[PUSH(mainSTACK,(t)op((t)POP(ST),(t)^(a)  )) ]
	assembles['fi'op '  dword  ' a'\n sub rsp,8\n fistp dword  PTRMACRO [rsp] ;#FOPIIMS64'];
instruction pattern FPUSHIT64(type t)
	means[PUSH(mainSTACK,(int64)TRUNCATE((t)POP(ST)))]
	assembles['sub rsp,8\n fisttp qword PTRMACRO [rsp]'];
instruction pattern FPUSHI264(type t)
	means[PUSH(mainSTACK,(int32) POP(ST) )]
	assembles['sub rsp,8\n fistp dword PTRMACRO[rsp]'];
instruction pattern FILDIP64(real t)
	means[PUSH(ST, (int32)POP(mainSTACK))]
	assembles['fild dword  PTRMACRO [rsp]\n add rsp,8'];
instruction pattern FMAX64(maddrmode a,fputype t)		/* this version only works on P6s and above*/
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	 assembles['fcom st0,st1  \npush rax\n fstsw ax\n sahf\n pop rax\n jnb $+4 \n fxch \nfstp st1']; 
instruction pattern FMIN64(maddrmode a,fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
 	assembles['fcom st0,st1  \n push rax\n fstsw ax\n sahf\n pop rax\n jb $+4 \n fxch \nfstp st1'];

instruction pattern FIMIN64(maddrmode a,fputype t)
	means[PUSH(mainSTACK,(int32)MIN((t)POP(ST),(t)POP(ST)))]
 	assembles['fcom st0,st1  \n push rax\n fstsw ax\n sahf\n pop rax\n jb $+4 \n fxch \nfstp st1\n sub rsp,4\n fistp dword  PTRMACRO [rsp]']; 

instruction pattern FLOATLDR64(indexreg r,anyreal t)
	means[PUSH(ST,(t)FLOAT((int64)^(r)))]
	assembles[' sub rsp,8\n'
		  '  mov qword [rsp],'r' \n'
		  '  fild qword[rsp]\n'
		   '  add rsp,8 ' ];

instruction pattern FLOATLDR32(int32reg r,anyreal t)
	means[PUSH(ST,(t)FLOAT((int32)^(r)))]
	assembles[' sub rsp,8\n'
		  '  mov dword [rsp],'r' \n'
		  '  fild dword[rsp]\n'
		   '  add rsp,8 ' ];
instruction pattern FMAX64g(maddrmode a,fputype t)		 
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcom  st(1) \npush rax\n fstsw ax\n sahf\n pop rax\n jnb $+4 \n fxch \n1:fstp st(1)'];
 
instruction pattern FMIN64g(maddrmode a,fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
assembles['fcom  st(1) \n push rax\n fstsw ax\n sahf\n pop rax\n jb $+4\n fxch \n1:fstp st(1)']; 

instruction pattern FIMIN64g(maddrmode a,fputype t)
	means[PUSH(mainSTACK,(int32)MIN((t)POP(ST),(t)POP(ST)))]
assembles['fcom  st(1)\n push rax\n fstsw ax\n sahf\n pop rax\n jb $+4 \n fxch \n1:fstp st(1)\n sub rsp,4\n fistp dword PTRMACRO[rsp]'];
 
instruction pattern FIFGOTO64(label l, maddrmode a,fcondition c,int t,fpuval t2)
	means[if((t)c((t2)POP(ST), ^((ref ieee32)a)))goto l]
	assembles['fcomp dword ' a ' \npush rax\n fstsw ax\n sahf\n pop rax\n j' c ' NEARMACRO  ' l ';FIFGOT64'];
instruction pattern FIFGOTOgeneral64(label l,  fcondition c,int t,fpuval t2)
	means[if((t)c((t2)POP(ST), (t2)POP(ST)))goto l]
	assembles['fxch\n fcompp \npush rax  \n fstsw ax\n sahf\n pop rax\n j' c ' NEARMACRO ' l';FIFGOTgeneral64'];
instruction pattern FSET64(fcondition c, breg r,fpuval t2)
	means[(ref int8)r:=(int8) c((t2)POP(ST), (t2)POP(ST))]
	assembles['fxch\n fcompp\n push rax\n fstsw ax\n sahf\n pop rax\n set'c ' ' r'\nnot 'r'\n inc 'r];
	
	
instruction pattern EXTENDMS64(type t)
	means[PUSH(ST,(int64)EXTEND((int32)POP(mainSTACK)))]
	assembles['fild dword PTRMACRO[rsp]\n add esp,8'];

instruction pattern FLOATMS64(anyreal t,hiint t2)
	means[PUSH(ST,(t)FLOAT((t2)POP(mainSTACK)))]
	assembles['fild dword PTRMACRO[rsp]\n add esp,8 ;#FLOATMS64'];

