/*
\subsection{Intel fpu instructions}
\begin{verbatim}
*/

register stack(8)ieee64 ST assembles[ 'ST'];

pattern fshort means[int16];
instruction pattern fint16( fshort t)
means [t]
assembles['s']; 
pattern fpuint means[int32|fint16|int64];
operation fdiv means div assembles['div'];
operation frem means MOD assembles['prem'];
pattern foperator means[add | sub|mul|fdiv];
pattern fcommuteoperator means[add|mul];
pattern fputype means[int32|int64|int16|ieee32|ieee64];


pattern fround(type t,fpuint i) means [(i)ROUND((t)POP(ST))] assembles['frndint'];
pattern fsqrt(real t,real t2)
	means[(t)SQRT((t2)POP(ST))]
	assembles ['fsqrt'];

pattern fsin(real t,real t2)
	means[(t)SIN((t2)POP(ST))]
	assembles ['fsin'];

pattern fcos(real t,real t2)
	means[(t)COS((t2)POP(ST))]
	assembles ['fcos'];

pattern fln(real t,real t2)
	means[(t)LN((t2)POP(ST))]
	assembles['fldln2\n fxch\n fyl2x'];

pattern fptan(real t,real t2)
	means[(t)TAN((t2)POP(ST))]
	assembles['fptan'];

pattern fabs(fputype t,fputype t2)
	means[(t)ABS((t2)POP(ST))]
	assembles['fabs'];

pattern fmoperator means [fround|fsqrt|fsin|fcos|fptan|fln|fabs];

instruction pattern RDIVB(breg b1,baddrmode b2)
	means[b1:=div(^(b1),^(b2))]
	assembles['bytediv 'b1','b2];

instruction pattern RMULTB(breg b1,baddrmode b2)
	means[b1:=*(^(b1),^(b2))]
	assembles['bytemult 'b1','b2];


instruction pattern FISTB(breg b1)
	means[b1:=(octet)(int64)POP(ST)]
	assembles['fistb 'b1];

instruction pattern FILDB(baddrmode b2)
	means[PUSH(ST,(int8)^(b2))]
	assembles['fildb 'b2];

instruction pattern FPUSHI16(type t)
	means[PUSH(mainSTACK,(int16)POP(ST))]
	assembles['subq $2,%rsp\n fistps (%rsp)'];

instruction pattern FPUSHI32(type t)
	means[PUSH(mainSTACK,(int32)POP(ST))]
	assembles['subq $4,%rsp\n fistpl (%rsp)'];
instruction pattern FPUSHI32T(type t)
	means[PUSH(mainSTACK,(int32)TRUNCATE((t)POP(ST)))]
	assembles['subq $4,%rsp\n fisttpl (%rsp)'];
instruction pattern FPUSHI64(type t)
	means[PUSH(mainSTACK,(int64)POP(ST))]
	assembles['subq $8,%rsp\n fistpq (%rsp)'];
instruction pattern FPUSHR64(type t)
	means[PUSH(mainSTACK,(ieee64)POP(ST))]
	assembles['subq $8,%rsp\n fstpl (%rsp)'];
instruction pattern FPOPI64(type t)
	means[PUSH(ST,(int64)POP(mainSTACK))]
	assembles['fildq (%rsp)\n addq $8,%rsp'];
instruction pattern FPOPI64FD(type t)
	means[PUSH(ST,(t)FLOAT((int64)POP(mainSTACK)))]
	assembles['fildq (%rsp)\n addq $8,%rsp'];
instruction pattern FPOPMS(fputype t)
	means[PUSH(ST,(ieee32)POP(mainSTACK))]
	assembles['flds  (%rsp)\n addq $8, %rsp'];
pattern anyreal means[ieee32|ieee64];
instruction pattern FLOATLDR(int32reg r,anyreal t)
	means[PUSH(ST,(t)FLOAT((int32)^(r)))]
	assembles[' sub $8, %rsp\n'
		  '  movl 'r', (%rsp)\n'
		  '  fildl (%rsp)\n'
		   '  add $8, %rsp ' ];
instruction pattern FILDR(int32reg r)
	means[PUSH(ST,(int32)^(r))]
	assembles[' sub $8, %rsp\n'
		  '  movl 'r', (%rsp)\n'
		  '  fildl (%rsp)\n'
		   '  add $8, %rsp ' ];
instruction pattern FISTR(int32reg r)
	means[r:=(int32) POP(ST)]
	assembles['sub $8, %rsp\n fistpl (%rsp)\n movl (%rsp) , ' r'\n add $8, %rsp'];

instruction pattern FRSTR(ut32r r)
	means[r:=(ieee32) POP(ST)]
	assembles['sub $8, %rsp\n fistpl (%rsp)\n movl (%rsp) , ' r'\n add $8, %rsp'];
instruction pattern FSTR(maddrmode a,fputype t)
	means[(ref ieee64) a:=(t) POP(ST)]
	assembles['fstpl ' a];

instruction pattern FSTRF(maddrmode a,fputype t)
	means[(ref ieee32) a:= (t)POP(ST)]
	assembles['fstps ' a];

instruction pattern EXTENDANY(fputype t)
	means[PUSH(ST,(ieee64)EXTEND((t)POP(ST)))]
	assembles[' '];
 
instruction pattern FISTM(maddrmode m, fpuint i)
	means[(ref i )m:=(i )POP(ST)]
	assembles['fistp'i' ' m];
instruction pattern FISTMs(maddrmode m, fpuint i)
	means[(ref int16 )m:=(int16 )POP(ST)]
	assembles['fistps' ' ' m];
instruction pattern FLD(maddrmode a)
	means[PUSH(ST,^((ref ieee64) a))]
	assembles['fldl ' a];

instruction pattern FLDF(maddrmode a)
	means[PUSH(ST,^((ref ieee32) a))]
	assembles['flds  ' a];
pattern flongi means[int32|int64];
instruction pattern FILDm(maddrmode a,real t, flongi i)
	means[PUSH(ST,(i)^( a))]
	assembles['fild'i ' ' a];
instruction pattern FILDs(maddrmode a,real t)
	means[PUSH(ST,(int16)^( a))]
	assembles['filds' ' ' a];
instruction pattern FILDF(maddrmode a,real t, fpuint i)
	means[PUSH(ST,(t)FLOAT((i)^((ref i) a)))]
	assembles['fild'i ' ' a];

define(FILD,FILDs|FILDm)
 

instruction pattern FEXT(real t)
	means[PUSH(ST,(ieee64)EXTEND((t)POP(ST)))]
	assembles [ ' ']; /* null operation in the fpu */
operation flt means < assembles ['b'];
operation fgt means > assembles ['a'];
operation feq means = assembles ['z'];
operation fle means <= assembles ['na'];
operation fge means >= assembles ['ae'];
operation fne means <> assembles ['nz'];

pattern fcondition means[fne|fge|fle|feq|fgt|flt];
instruction pattern FSET(fcondition c, breg r,fputype t)
	means[(ref int8)r:=(int8) c((t)POP(ST), (t)POP(ST))]
	assembles['fxch'
		'\n fcompp'
		'\n pushw %ax'
		'\n fstsw %ax'
		'\n sahf'
		'\n popw %ax'
		'\n set'c ' ' r
		'\n not 'r
		'\n inc 'r
		];
instruction pattern FMOP(fmoperator op)
	means[PUSH(ST,op)]
	assembles[op];

instruction pattern FCHS(real t)
	means[PUSH(ST,(t)-((t)0,(t)POP(ST)))]
	assembles['fchs'];

instruction pattern RFLOADLIT(float f,reg r)
	means[r:=const f]
	assembles['jmp 0f\n1:.float 'f'\n0:movl 1b  ' PIS ','r];


/* this handles any length of real and should come last in the set of codes */

instruction pattern FLOADDLIT(real f)
	means[PUSH(ST,const f)]
	assembles['jmp 0f\n1:.double 'f'\n0:fldl 1b ' PIS];

instruction pattern FILOADLIT(hiint i)
	means[PUSH(ST, const i)]
	assembles['jmp 0f\n1:\n.quad 'i'\n0:fildq 1b ' PIS ];
/*	assembles['db 0ebh,10\ndt ' i'.0\nfld tword  [$-10]'];*/

instruction pattern FOP(maddrmode a,foperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),^((ref ieee64)a)  )) ]
	assembles['f'op 'l  ' a];

instruction pattern FOPF(maddrmode a,foperator op,real t,fputype t2)
	means[PUSH(ST,(t)op((t2)POP(ST),(t)^((ref t)a)  )) ]
	assembles['f'op  t   ' ' a];

instruction pattern FOPI(maddrmode a,foperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),FLOAT((int32)^(a) ) )) ]
	assembles['fi'op 'l   ' a];

instruction pattern ReversePolishFOP(fcommuteoperator op,real t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)POP(ST)))]
	assembles['f'op'p']; /* looks like stack operand not needed in as */

instruction pattern ReversePolishFOPG(foperator op,fputype t,fputype t2,fputype t3)
	means[PUSH(ST,(t)op((t2)POP(ST),(t3)POP(ST)))]
	assembles['fxch\n f'op'p'];


/* this version only works on P6s and above comment out for now since fcmov not supported properly in gas

instruction pattern FMAXp6(maddrmode a, fputype t)
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)\n fcmovb %st(0),%st(1) \nfstp %st(1)'];

instruction pattern FMINp6(maddrmode a, fputytpe t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)\n fcmovnb %st(0),%st(1)  \nfstp %st(1)']; /* */

instruction pattern FMAX(maddrmode a, fputype t)
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)  \n  jnb 0f \n fxch \n0: fstp %st(1)\n'];

instruction pattern FMIN(maddrmode a, fputype t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi %st(1)  \n   jb 0f \n fxch \n0: fstp %st(1)\n'];

instruction pattern FPREM(fputype t)
	means[PUSH(ST,(t)MOD( (t)POP(ST),(t)POP(ST)))]
	assembles['fxch\n fprem\n fstp %st(1)'];

/* conditional instructions */


/*instruction pattern FIFGOTO(label l, maddrmode a,fcondition c,int t, fputype t2)
	means[if((t)c((t2)POP(ST), ^((ref ieee32)a)))goto l]
	assembles['fcompl  ' a ' \n push %ax\n fstsw %ax\n sahf\npop %ax\n j' c '    ' l];*/

instruction pattern FIFGOTOgeneral(label l,  fcondition c,int t, fputype t2)
	means[if((t)c((t2)POP(ST), (t2)POP(ST)))goto l]
	assembles['fxch\n fcompp \npush %ax  \n fstsw %ax\n sahf\n pop %ax\n j' c '   ' l];

instruction pattern IFLITGOTO(label l,addrmode r1,signed r2,condition c,signed t,int b)
	means[if((b)c((t) ^(r1),const r2))goto l]
	assembles[' cmp't'  $' r2 ',  '  r1 '\n j' c '   '  l];

instruction pattern BIFLITGOTO(label l,baddrmode r1,signed arg2,condition c,signed t)
	means[if(c((t) ^(r1),const arg2))goto l]
	assembles[' cmp't'  $' arg2 ',  '  r1 '\n j' c '   '  l];

instruction pattern IFGOTOB(label l,bsreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int8) r2))goto l]
	assembles['cmpb ' r2 ',' '  '  r1 '\n j' c '   ' l];

instruction pattern IFGOTOW(label l,hwsreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int16) r2))goto l]
	assembles['cmpw ' r2 ',' '  '  r1 '\n j' c '   ' l];

instruction pattern IFGOTODW(label l,wsreg r1,regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c( ^(r1),(int32) r2))goto l]
	assembles['cmpl ' r2 ',' '  '  r1 '\n j' c '   ' l];

instruction pattern IFGOTOQW(label l,sreg r1, regaddrimmediate r2,condition c,signed t,int b)
	means[if((int8)c(^(r1),(int64)r2))goto l]
	assembles['cmpq 'r2',' ' 'r1'\n j'c' 'l];

instruction pattern IFASS(signedreg r1,regaddrimmediate r2,condition c,anyreg r3,addrmode rm, type t )
	means[if((int8)c((t) ^(r1),(t) r2))(ref t)rm:= (t)^(r3)]
	assembles['cmp't '  'r2 ',' '  '  r1 '\n mov't ' 'rm',' r1'\n cmov'c t' 'r3','r1'\n mov't ' 'r1 ',' rm];

instruction pattern ANDIFGOTO(label l,anyreg r1, reg r2,condition c,int t,int b,anyreg r3, reg r4, condition c2, int t2,int b)
	means[if((b)AND((b)c((t) ^(r1),(t) r2),(b)c2((t2)^(r3),(t2)r4)))goto l]
	assembles['andifgoto ' c','r1',' r2','c2','r3','  r4 ',' l','t','t2];

/*
\end{verbatim}
*/
define(genfpucodes,FCHS|FOPF|/*FLOADLIT|*/FILOADLIT|/*FMINp6|FMAXp6|*/FMAX|FMIN|FLD|FLDF|FLOATLDR|FISTM
                |FILDF|FILD|FILDF|FLOADDLIT|FILDB|FILDR|ReversePolishFOP|ReversePolishFOPG|FMOP|
                FPREM|FOP|FOPI|RMULTB|FISTR|FSTR|FSTRF|FEXT|EXTENDANY|FPUSHI32T|
                EXTENDANY|FIFGOTOgeneral|FSET|/*FISTB|*/FPUSHI16|FPOPI64|FPOPI64FD|FPUSHR64|FPOPMS|FRSTR)
/* 32 bit push onto the stack should not be used on the opteron */
define(fpucodes,genfpucodes|FPUSHI64|FPUSHI32)



