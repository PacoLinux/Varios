/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
 	Floating-Point Instructions Definitions - PowerPC-base Architecture
	2007/2008
	Youssef Gdura & Dr. Paul Cockshoot    
	Computer Science Dep. Glagsow Unievrsity
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/



/* Floating Point Registers */

/* Signed double-precision 64-bit registers */
define(fStart, `0')
define(fEnd, `29')
define(fgpr,`register ieee64 F$1 assembles['`''`f$1'`''`];
')
forloop(`i',fStart,fEnd,`fgpr(i)') 

reserved register ieee64 f30 assembles['f30'];  
reserved register ieee64 f31 assembles['f31']; 

/* Signed floating point 32-bit registers */
define(sStart, `0')
define(sEnd, `15')
define(sreg,`alias register ieee32 sF$1=F$1(0:31) assembles['`''`f$1'`''`];
')
forloop(`i',sStart,sEnd,`sreg(i)') 
/*
\define(fr,`F$1|') 
\define(fr_noslash,`F$1') 
\pattern freg means[forloop(`i',fStart,eval(fEnd-1),`fr(i)')fr_noslash(fEnd)];
\define(sr,`sF$1|') 
\define(sr_noslash,`sF$1') 
\pattern sfreg means[forloop(`i',sStart,eval(sEnd-1),`sr(i)')sr_noslash(sEnd)];
*/
pattern freg means[F0|F1|F2|F3|F4|F5|F6|F7|F8|F9|F10|F11|F12|F13|F14|F15|F16|F17|F18|F19|F20|F21|F22|F23|F24|F25|F26|F27|F28|F29];
 
 
pattern sfreg means[sF0|sF1|sF2|sF3|sF4|sF5|sF6|sF7|sF8|sF9|sF10|sF11|sF12|sF13|sF14|sF15];

pattern anyfreg means [ freg | sfreg ]; 

/* \subsection{fpu instructions} 

\begin{verbatim}
*/  

register stack(32)ieee64 ST assembles[ 'ST']; 
operation fml	  	means 	* 	assembles ['mul'];
operation fdv		means	div assembles ['div'];

pattern		foperator	means[ add|sub|fml|fdv ];
pattern 	anyreal 	means[ieee32|ieee64];
pattern 	fptype 	means[anyreal|int64|int32];
pattern 	fpuint 		means[int32|int16|int64];


pattern 	fimmediate(real s)
			means  	[const s] 	
			assembles 	[s];


/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			LOAD instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
/*
instruction pattern LOADFS(maddrmode rm, anyfreg f1, real t)
    means		[(ref ieee32)f1:= (ieee32)^((ref t) rm)]  
	assembles	['lfs ' f1 ',' rm ]; */ 
	
instruction pattern LOADFD(maddrmode rm, anyfreg f1, real t)
    means		[(ref ieee64)f1:= (ieee64)^((ref t) rm)]  
	assembles	['lfd ' f1 ',' rm ]; 

instruction pattern LOADLITSF(fimmediate s, sfreg r)
		means		[r:= s]
		assembles	['sloadr ' r ',' s ]; 

instruction pattern LOADLITDF(fimmediate s, freg r)
		means		[r:= s]
		assembles	['dloadr ' r ',' s]; 

instruction pattern MOVEREGTREG(anyfreg f1, anyfreg f2, real t)
    means		[(ref t)f2:= (t)^((ref t) f1)]  
	assembles	['fmr ' f2 ',' f1 ]; 

instruction pattern LOADFS(maddrmode rm, anyfreg f1, real t)
    means		[(ref ieee32)f1:= (ieee32)^((ref t) rm)]  
	assembles	['lfs ' f1 ',' rm ]; 

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			STORE instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction pattern STOREFS(maddrmode rm, anyfreg f1, float t)
    means		[ (ref ieee32) rm:= (t)^(f1) ]
	assembles	['stfs 'f1','rm];
	
instruction pattern STOREFD(maddrmode rm, anyfreg f1, double t)
    means		[ (ref ieee64) rm:= (t)^(f1) ]
	assembles	['stfd 'f1','rm];	


/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					Arithmetic Opertaions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

		 	 
instruction pattern DOPERATION(foperator op, freg f1, freg f2)
	means 		[f1:=op( ^(f1),^(f2) )]
	assembles	['f'op ' 'f1','f1','f2];

instruction pattern SOPERATION(foperator op, sfreg sf1, sfreg sf2)
	means		[sf1:=(ieee32)op( (ieee32)^(sf1),(ieee32)^(sf2) )]
	assembles	['f'op's 'sf1','sf1','sf2];


/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					Trigeomatric Functions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/


instruction pattern FSIND(freg f, freg f1 )
				means[f:= SIN(^(f1))]   
				assembles ['FSIND ' f1 ', f31'];

instruction pattern FSINSCONS(sfreg f, fimmediate s )
				means[f:= SIN(s)]   
				assembles ['fsins ' s
					       '\n fmr ' f ', f1'];
instruction pattern FSINS(sfreg f, sfreg reg )
				means[f:= SIN(^(reg))]   
				assembles ['fsins ' reg
					       '\n fmr ' f ', f1'];
								
instruction pattern FCOSD(freg f, freg f1 )
				means[f:= COS(^(f1))]   
				assembles ['FCOSD ' f ',  f1'];

instruction pattern FCOSS(sfreg f, sfreg f1 )
				means[f:= COS(^(f1))]   
				assembles ['fcoss ' f2
							'\n fmr ' f ', f1'];

instruction pattern FTANS(freg f, freg f1)
				means[f:= TAN(^(f1))]   
				assembles ['ftans ' f1
							'\n fmr ' f ', f1'];

instruction pattern FTAND(freg f, freg f1)
				means[f:= TAN(^(f1))]   
				assembles ['FTAND ' f ', f'];

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					Geomatric Functions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/


instruction pattern SQRTS(freg f)
	means		[f:=SQRT(^(f))]
	assembles	['fsqrt 'f','f];
	
instruction pattern SQRTD(freg f, sfreg sf)
	means		[sf:=(ieee32)SQRT(^(f))]
	assembles	['fsqrts 'sf','f];	

instruction pattern FABS(anyfreg f1, anyfreg f2 )
				means[f1:= ABS(^(f2))]   
				assembles ['fabs ' f1 ', ' f2];




/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
						Comparesion Opertaions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/



instruction pattern FSET(condition c,anyfreg f1,anyfreg f2, breg r,byte b)  
	means[r:=(b) c( ^((ref ieee32)f1), (ieee32)^(f2) )]
	assembles  ['fcmpo 0,' f1 ', ' f2     
				'\n li ' r ',0'
				'\n b'c ' 1f' 
				'\n b 1f' 
				'\n 1: not ' r ',' r 
				'\n 2: nop'];


/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			Conditional Opertaions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction pattern FIFGOTO(condition c, label l, anyfreg f1, anyfreg f2, real t)
	means		[if( c( (t)^(f1) , (t)^(f2) ) ) goto l]
	assembles	['fcmpo    2,' f1 ',' f2
				 '\n b'c ' 2,' l ];

instruction pattern IFEQUALGOTO(condition c,label l, anyfreg f1,int t, real t1,anyfreg f2) 
	means		[if( (t) c ( (t1)^( f1) , (t1)^(f2) ) ) goto l] 
	assembles  ['fcmpo  0,' f1  ','  f2
				'\n beq ' l];  


instruction pattern FIFEQUALCONSTGOTO (condition c,label l, anyfreg f1,int t, real t1,fimmediate s) 
	means		[if( (t) c ( (t1)^((ref t1)f1) , s ) ) goto l] 
	assembles  ['floadr  ' s
				'\n fcmpo 0, 'f1 ', f30'
				'\n beq ' l];  
			 
			 
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
						Miscellaneous Opertaions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
			 
instruction pattern FMAX(anyfreg f1,anyfreg f2, real t)
	means		[ (ref t)f1:=MAX((t)^(f1),(t)^(f2))]
	assembles	['fcmpo 0, 'f1','f2'\n bgt $+8\n fmr 'f1','f2]; 

instruction pattern FMIN(anyfreg f1,anyfreg f2, real t)
	means		[ (ref t)f1:=MIN((t)^(f1),(t)^(f2))]
	assembles	['fcmpo 0, 'f1','f2'\n blt $+8\n fmr 'f1','f2]; 

instruction pattern FNEG(anyfreg f, real t)
		means	[(ref t)f:= -((t)0.0,(t)^((ref t)f))]
		assembles ['fneg ' f ',' f];

instruction pattern PLANTSCONST( float  r,fptype t)
	means[loc (ieee32) r]
	assembles[ '.float ' r];
	
instruction pattern PLANTDCONST( double r,type t)
	means[loc (ieee64)r]
	assembles[ '.double ' r];
	
			 
/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					STACK-REGISTER instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction pattern PUSHDFREG(freg f) 
	means		[PUSH(mainSTACK,^(f))] 
	assembles	['stfdu ' f ', -8(SP)']; 
	
instruction pattern POPDFREG(freg f)
	means		[f:=(ieee64)POP(mainSTACK)] 
	assembles	['lfdu 'f', 8(SP)']; 
	
instruction pattern PUSHSFREG(sfreg f) 
	means		[PUSH(mainSTACK,^(f))] 
	assembles	['stfsu 'f', -4(SP)']; 

instruction pattern POPSFREG(sfreg f)
	means		[f:=(ieee32)POP(mainSTACK)] 
	assembles	['lfsu 'f', 4(SP)']; 


/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
					STACK-STACK instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

				
instruction pattern CONVINTtoSP(anyreal t,wreg r, freg f0, sfreg f1) 
	means[PUSH(mainSTACK,(ieee32)FLOAT((int32)POP(mainSTACK)))]
        assembles [ 'lwa ' r ', 0(SP)'
					'\n std	' r  ', -8(SP)'
					'\n lfd	' f0 ', 8(SP)'
					'\n fcfid	' f0 ',' f0
					'\n frsp ' f1 ',' f0
					'\n stfs ' f1 ', 0(SP)'];

instruction pattern CONVINTtoDP(freg f1) 
	means[PUSH(mainSTACK,(ieee64)FLOAT((int64)POP(mainSTACK)))]
        assembles [ 'lfd	' f1 ', 0(SP)'
					'\n fcfid	' f1 ',' f1
					'\n stfd ' f1 ', 0(SP)'];


instruction pattern CONVSPtoD(sfreg f1,anyfreg f2) 
		means [PUSH(mainSTACK,(int64)ROUND((ieee32)POP(mainSTACK)))] 
		assembles [	'flsu		' f1 ',4(SP)' 
					'\n fctid ' f2 ',' f1 
					'\n stfdu	' f2 ',-8(SP)'];

instruction pattern CONVSPtoW(sfreg f1, anyfreg f2) 
		means [PUSH(mainSTACK,(int32)ROUND((ieee32)POP(mainSTACK)))] 
		assembles [	'fls		' f1 ',0(SP)' 
					'\n fctiw	' f2 ',' f1 
					'\n stfs	' f2 ',0(SP)'];

instruction pattern CONVDPtoD(freg f1,freg f2) 
		means [PUSH(mainSTACK,(int64)ROUND((ieee64)POP(mainSTACK)))] 
		assembles [	'fld		' f1 ',0(SP)' 
					'\n fctid ' f2 ',' f1 
					'\n stfd	' f2 ',0(SP)'];

instruction pattern CONVDPtoW(freg f1, anyfreg f2) 
		means [PUSH(mainSTACK,(int32)ROUND((ieee64)POP(mainSTACK)))] 
		assembles [	'fldu		' f1 ',8(SP)' 
					'\n fctiw	' f2 ',' f1 
					'\n frsp    ' f2 ',' f2
					'\n stfsu	' f2 ',-4(SP)'];

instruction pattern ROUNDSPtoD(sfreg f1,anyfreg f2,reg r) 
		means [r:=(int64)ROUND((ieee32)^(f1))] 
		assembles [	'fctid  ' f2 ',' f1 
					'\n stfd  ' f2 ',-8(SP)'
					'\n ld    ' r  ', 8(SP)'];

instruction pattern ROUNDSPtoW(sfreg f1, anyfreg f2,wreg r) 
		means [r:=(int32)ROUND((ieee32)^(f1))] 
		assembles [	'fctiw  ' f1 ',' f1 
					'\n stfd  ' f1 ',-8(SP)'
					'\n lwa   ' r  ', 4(SP)'];

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			CONVERT instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/
 

instruction pattern CONVFToINTW(anyfreg f2,anyfreg f1, wreg r) 
 	means 	[r:=(int32)^((ref ieee32)f1)]
	assembles ['fctiw  ' f2 ',' f1 
		       '\n stfd ' f2 ', -8(SP)'
		       '\n lwa  ' r ', -4(SP)']; 

instruction pattern CONVFToINTD(anyfreg f2, anyfreg f1, reg r) 
 	means 	[r:=(int64)^((ieee32)f1)]
 	assembles ['fctid ' f2 ',' f1 
		       '\n stfd ' f2 ', -8(SP)'
		       '\n ld  ' r ', 8(SP)']; 

/*XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
			EXTEND & ROUNDING instructions
XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX*/

instruction pattern EXTENDSTD(freg f1,sfreg f2)
	means[f1:=(ieee64)EXTEND(^(f2))]
	assembles['	stfs ' f2 ', 0(SP)'
	          '\n	lfs  ' f1 ', 0(SP)'];
	

instruction pattern EXTENDSToD(anyfreg f1)  
	means[PUSH(mainSTACK,(ieee64)EXTEND((ieee32)POP(mainSTACK)))]
	assembles [ 'lfsu		' f1 ', 4(SP)'
				'\n stfdu	' f1 ', -8(SP)'];


instruction pattern ROUNDDTS(sfreg f1,freg f2)
	means[f1:=(ieee32)^(f2)]
	assembles['frsp ' f1 ', ' f2];

			
instruction pattern CONVINT32TSP(anyfreg f1,wreg r)
	means[f1:=(ieee32)FLOAT((int32)^(r))]
	assembles['extsw ' r ',' r 
			'\n std ' r ',-8(SP)' 
			'\n lfd ' f1 ',8(SP)'
			'\n fcfid ' f1 ',' f1
			'\n frsp ' f1 ',' f1];

instruction pattern CONVINT32TDP(freg f1,wreg r)
	means[f1:=(ieee64)FLOAT((int32)^(r))]
	assembles['extsw ' r ',' r
			'\n std ' r ',-8(SP)'
			'\n lfd ' f1 ',8(SP)'
			'\n fcfid ' f1',' f1];


instruction pattern CONVINT64TSP(anyfreg f1,reg r)
	means[f1:=(ieee32)FLOAT((int64)^(r))]
	assembles['std ' r ',-8(SP)' 
		    '\n lfd ' f1 ',8(SP)'
			'\n fcfid ' f1 ',' f1
			'\n frsp ' f1 ',' f1];

instruction pattern CONVINT64TDP(anyfreg f1,reg r)
	means[f1:=(ieee64)FLOAT((int64)^(r))]
	assembles['std ' r ',-8(SP)'
			'\n lfd ' f1',8(SP)'
			'\n fcfid ' f1',' f1];
				

instruction pattern LOADSPLIT(float fs, sfreg f) 
		means[f :=const fs]
		assembles['sloadr ' f ',' fs ];

instruction pattern LOADDPLIT(float fs, freg f) 
		means[f :=const fs]
		assembles['dloadr ' f ',' fs ];		
		
