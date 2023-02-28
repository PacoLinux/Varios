/* \subsection{Intel fpu instructions}
\Copyright (c) University of Glasgow 2003
\begin{verbatim}
*/

register stack(8)ieee64 ST assembles[ 'ST'];

pattern anyreal means[ieee32|ieee64];
pattern fputype means[anyreal|int64|int32];
pattern fpuint means[int32|int16|int64];
operation fdiv means div assembles['div'];
operation frem means MOD assembles['prem'];
pattern foperator means[add | sub|mul ];

pattern fioperator means[add | sub|mul];
instruction pattern FPUSHI32T(type t)
	means[PUSH(mainSTACK,(int32)TRUNCATE((t)POP(ST)))]
	assembles['sub esp,4\n fisttpl [esp]'];
 
pattern fround(type t,fpuint i) means [(i)ROUND((t)POP(ST))] assembles['frndint'];
pattern fsqrt(real t,real t2) means[(t)SQRT((t2)POP(ST))]   assembles ['fsqrt'];
pattern fsin(real t,real t2) means[(t)SIN((t2)POP(ST))]  assembles ['fsin'];
pattern fcos(real t,real t2) means[(t)COS((t2)POP(ST))]   assembles ['fcos'];
pattern fextend(type t) means[(int64)EXTEND((int32)POP(ST))] assembles [';# fextend '];
pattern fln(real t,real t2)means[(t)LN((t2)POP(ST))] assembles['fldln2\n fxch\n fyl2x'];
pattern fptan(real t,real t2) means[(t)TAN((t2)POP(ST))]assembles['fsincos\nfdivp ;#st1'];
pattern fabs(type t) means[(t)ABS((t)POP(ST))]assembles['fabs'];
pattern fmoperator means [fround|fsqrt|fsin|fcos|fptan|fln|fabs|fextend  ];
/*
instruction pattern RDIVB(breg b1,baddrmode b2)
	means[b1:=div(^(b1),^(b2))]
	assembles['bytediv 'b1','b2];
instruction pattern RMULTB(breg b1,baddrmode b2)
	means[b1:=*(^(b1),^(b2))]
	assembles['bytemult 'b1','b2];

instruction pattern FISTB(breg b1,type t)
	means[b1:=(int8)(int32)ROUND((t)POP(ST))]
	assembles['fistb 'b1];
instruction pattern FILDB(baddrmode b2)
	means[PUSH(ST,(int8)^(b2))]
	assembles['fildb 'b2];*/

instruction pattern FSTR(memrisc a)
	means[(ref ieee64) a:= (ieee64)POP(ST)]
	assembles['fstp qword  ' a ' ;#FSTR'];
	instruction pattern FSTRs(memrisc a)
	means[(ref ieee64) a:= (ieee32)POP(ST)]
	assembles['fstp qword  ' a ' ;#FSTR'];
instruction pattern FSTRF(memrisc a)
	means[(ref ieee32) a:= (ieee32)POP(ST)]
	assembles['fstp dword  ' a ';#FSTRF'];
	
instruction pattern FSTRFl(memrisc a)
	means[(ref ieee32) a:= (ieee64)POP(ST)]
	assembles['fstp dword  ' a ';#FSTRF'];
instruction pattern FLOATST(anyreal t,hiint t2)
	means[PUSH(ST,(t)FLOAT((t2)POP(ST)))]
	assembles[' ;# -- assume ST a float'];


instruction pattern EXTENDANY(type t)
	means[PUSH(ST,(ieee64)EXTEND((t)POP(ST)))]
	assembles[';# extend fpu stack'];
instruction pattern FISTR(maddrmode m, hiint i, type t)
	means[(ref i )m:=(i )POP(ST)]
	assembles['fistp 'i' ' m];
instruction pattern FISTP(maddrmode m, hiint i, type t)
	means[(ref i )m:=(i )POP(ST)]
	assembles['fistp 'i' ' m];
instruction pattern FEX(hiint i)
	means[PUSH(ST,(int64)EXTEND((i)POP(ST)))]
	assembles[';# treat st0 as int64'];

instruction pattern FLD(maddrmode a)
	means[PUSH(ST,(ieee64)^(  a))]
	assembles['fld qword   ' a';#FLD'];
instruction pattern FLDF(maddrmode a)
	means[PUSH(ST,(ieee32)^(  a))]
	assembles['fld dword  ' a ';#FLDF'];
instruction pattern FILD(wmemdummy a,real t, hiint i)
	means[PUSH(ST,^((ref i) a))]
	assembles['fild 'i '  ' a' '  ';#FILD'];
instruction pattern FILDF(maddrmode a,real t, hiint i)
	means[PUSH(ST,FLOAT((i)^( a)))]
	assembles['fild 'i '  ' a';#FILDF '];



operation flt means < assembles ['b'];
operation fgt means > assembles ['a'];
operation feq means = assembles ['z'];
operation fle means <= assembles ['na'];
operation fge means >= assembles ['ae'];
operation fne means <> assembles ['nz'];
pattern fcondition means[fne|fge|fle|feq|fgt|flt];
pattern fpuval means[ieee32|ieee64|int32|int64];
/*
instruction pattern p6FIFGOTO(label l, maddrmode a,fcondition c,int t,fpuval t2)
	means[if((t)c((t2)POP(ST),(t2)POP(ST)))goto l]
	assembles['fxch\nfcomip st0,st1 \n  fincstp\n j' c ' NEARMACRO ' l];

instruction pattern p6FSET(fcondition c, breg r,fpuval t2)
	means[(ref int8)r:=(int8) c((t2)POP(ST), (t2)POP(ST))]
	assembles['fxch\n fcomip st0,st1\n \n  fincstp\n   set'c ' ' r'\nnot 'r'\n inc 'r];
*/


instruction pattern FMOP(fmoperator op)
	means[PUSH(ST,op)]
	assembles[op];
instruction pattern FCHS(real t)
	means[PUSH(ST,(t)-((t)0,(t)POP(ST)))]
	assembles['fchs'];

instruction pattern FLOADLITg(real f)
	means[PUSH(ST,const f)]
	assembles['.data\n1:.double 'f'\n.text\n fld qword ptr 1b'];
instruction pattern FLOADLITn(real f)
	means[PUSH(ST,const f)]
	assembles['floadlit 'f];

/*	assembles['db 0ebh,4\ndd 'f'\n fld dword   [$-4]'];*/
/* this handles any length of real and should come last in the set of codes */
instruction pattern FLOADDLIT(real f,anyreal t)
	means[PUSH(ST,(t)const f)]
	assembles['floadlit 'f];
/*	assembles['db 0ebh,8\ndq ' f'\nfld qword   [$-8]'];*/
instruction pattern FILOADLITn(hiint i,fputype t)
	means[PUSH(ST,(t) const i)]
	assembles['filoadlit 'i];
	instruction pattern FILOADLITg(hiint i,fputype t)
	means[PUSH(ST,(t) const i)]
	assembles['.section .data\n1:.quad 'i'\n.section .text\n0:fild qword ptr 1b']; 

instruction pattern FOP(maddrmode a,foperator op)
	means[PUSH(ST,op((ieee64)POP(ST),^((ref ieee64)a)  )) ]
	assembles['f'op '  qword   ' a];
instruction pattern FOPF(maddrmode a,foperator op,real t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)^((ref t)a)  )) ]
	assembles['f'op ' ' t   '   ' a];
instruction pattern FOPI(maddrmode a,fioperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),FLOAT(^(a) ) )) ]
	assembles['fi'op '  dword   ' a]; 
instruction pattern FOPII(maddrmode a,fioperator op,fputype t)
	means[PUSH(ST,op((t)POP(ST),^(a)  )) ]
	assembles['fi'op '  dword   ' a];
instruction pattern RPFOP(foperator op,fputype t)
	means[PUSH(ST,(t)op((t)POP(ST),(t)POP(ST)))]
	assembles['f'op'p' ';# st1'];
 instruction pattern RPDIV(foperator op,anyreal t)
	means[PUSH(ST,(t)div((t)POP(ST),(t)POP(ST)))]
	assembles['fdivp' ';# st1'];
	instruction pattern FIDIV(foperator op,fpuint t)
	means[PUSH(ST,(t)div((t)POP(ST),(t)POP(ST)))]
	assembles['fdivp' ';# st1\n fldcw word  [roundzero]\n frndint\n fldcw word  [roundnear]'];

instruction pattern FMAXp6(maddrmode a,type t)		/* this version only works on P6s and above*/
	means[PUSH(ST,(t)MAX((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi st0,st1\n fcmovb st0,st1 \nfstp st1 ;#FPMAXp6'];
instruction pattern MAXp6(reg r1,reg r2)
	means[r1:=  MAX(^(r1),^(r2))]
	assembles['cmp 'r1','r2'\ncmovl 'r1','r2];
instruction pattern MINp6(int32reg r1,int32reg r2)
	means[r1:=  MIN(^(r1),^(r2))]
	assembles['cmp 'r2','r1'\ncmovl 'r1','r2];

instruction pattern FMINp6(maddrmode a,type t)
	means[PUSH(ST,(t)MIN((t)POP(ST),(t)POP(ST)))]
	assembles['fcomi st0,st1\n fcmovnb st0,st1 \nfstp st1; #FPMINp6'];
instruction pattern FPREM(fputype t)
	means[PUSH(ST,(t)MOD((t) POP(ST),(t)POP(ST)))]
	assembles['fxch \n fprem\n fstp st1'];
instruction pattern FPREMu(int t) 
	means[PUSH(ST,(t)MOD( (t)POP(ST),(t)POP(ST)))]
	assembles['fxch \n fprem\n fstp st1 ;#FPREMu'];
 include(`cpus/ifpums64.m4')
 include(`cpus/ifpums32.m4')
define(p6intcodes,MINp6|MAXp6|IFASSp6)
define(p6fpucodes,FMINp6|FMAXp6    /* |p6FIFGOTO|p6FSET  */)
define(fpucodes,/* fpu codes */
FCHS|
FOPF|
/* FLOATF|*/ 
FLD|
FLDF|
FILDF|
FILD| 
RPFOP|RPDIV|
FMOP|  
FPREM| 
FOP|
FOPI|
FOPII|  
FISTR|
FSTR|FSTRs|
FSTRF| FSTRFl|
EXTENDANY|   
FLOATST|
FPREM|
FIDIV|
FISTP) 

		 
define(fpupushes,/* fpu pushes make sure pushes before pops*/
ifdef(`bit64',
  EXTENDMS64|
  FLOATMS64| 
  FIFGOTOgeneral64|
  ifdef(`gas',
      FLOADLITg| 
      FILOADLITg|
      FMAX64g|
      FMIN64g|
      FIMIN64g| 
    ,/* non gas */
      FMAX64|
      FLOADLITn| 
      FILOADLITn|
    
      FMIN64|
      FIMIN64|
  )  FLOATLDR64   |
  FOPIIMS64|
  FILDIP64|
  FIFGOTO64 |
  FSET64  |
  FPUSHI64 | 
  
  FPUSHI264 |
  FPUSHD64 |
  FPUSHF64 |
  DPOPMS64  |
  FPOPMSI6464|
  FPOPMS64 
,
  /* 32 bit */
  EXTENDMS32|
  FLOATMS32| 
  FIFGOTOgeneral32|
  FMAX32|
  FMIN32|
  FLOADLITn| 
  FILOADLITn|
  FOPIIMS32|
  FPOPMSI6432|
  FIMIN32|
  FILDIP32|
  FIFGOTO32 |
  FSET32  |
  DPOPMS32  |
  FPUSHIT32 |
  FPUSHI32T|
  FPUSHI32 | 
  FPUSHD32 |
  FPUSHF32 |
  FPOPMS32 
)
)
  

