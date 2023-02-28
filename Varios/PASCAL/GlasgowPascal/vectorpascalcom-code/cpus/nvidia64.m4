/*
nvidia 64 GPU machine description

Scott McCorkell - 2014

\section{nvidia}
\begin{verbatim}
*/
define(havesse,1)
define(bit64, 1) 

include(`cpus/i386base.m4')
include(`cpus/ifpu.m4')
 
 
 
 

define(VECLEN,4096)
define(VECBITS32, 131071)
define(VECBITS64, 262143)
define(VECBITS16, 65535)
define(VECBITS8, 32767)

/*
end{verbatim}
\section{vectors}
begin{verbatim}
*/

register int64 vector(VECLEN)  NV0  assembles['0'];
register int64 vector(VECLEN)  NV1  assembles['1'];
register int64 vector(VECLEN)  NV2  assembles['2'];
register int64 vector(VECLEN)  NV3  assembles['3'];

alias register uint64 vector(VECLEN) NV4 = NV0(0:VECBITS64) assembles['0'];
alias register uint64 vector(VECLEN) NV5 = NV1(0:VECBITS64) assembles['1'];
alias register uint64 vector(VECLEN) NV6 = NV2(0:VECBITS64) assembles['2'];
alias register uint64 vector(VECLEN) NV7 = NV3(0:VECBITS64) assembles['3'];

alias register ieee64 vector(VECLEN) NV8 = NV0(0:VECBITS64) assembles['0'];
alias register ieee64 vector(VECLEN) NV9 = NV1(0:VECBITS64) assembles['1'];
alias register ieee64 vector(VECLEN) NV10 = NV2(0:VECBITS64) assembles['2'];
alias register ieee64 vector(VECLEN) NV11 = NV3(0:VECBITS64) assembles['3'];

alias register int32 vector(VECLEN) NV12 = NV0(0:VECBITS32) assembles['0'];
alias register int32 vector(VECLEN) NV13 = NV1(0:VECBITS32) assembles['1'];
alias register int32 vector(VECLEN) NV14 = NV2(0:VECBITS32) assembles['2'];
alias register int32 vector(VECLEN) NV15 = NV3(0:VECBITS32) assembles['3'];

alias register uint32 vector(VECLEN) NV16 = NV0(0:VECBITS32) assembles['0'];
alias register uint32 vector(VECLEN) NV17 = NV1(0:VECBITS32) assembles['1'];
alias register uint32 vector(VECLEN) NV18 = NV2(0:VECBITS32) assembles['2'];
alias register uint32 vector(VECLEN) NV19 = NV3(0:VECBITS32) assembles['3'];

alias register ieee32 vector(VECLEN) NV20 = NV0(0:VECBITS32) assembles['0'];
alias register ieee32 vector(VECLEN) NV21 = NV1(0:VECBITS32) assembles['1'];
alias register ieee32 vector(VECLEN) NV22 = NV2(0:VECBITS32) assembles['2'];
alias register ieee32 vector(VECLEN) NV23 = NV3(0:VECBITS32) assembles['3'];

alias register int16 vector(VECLEN) NV24 = NV0(0:VECBITS16) assembles['0'];
alias register int16 vector(VECLEN) NV25 = NV1(0:VECBITS16) assembles['1'];
alias register int16 vector(VECLEN) NV26 = NV2(0:VECBITS16) assembles['2'];
alias register int16 vector(VECLEN) NV27 = NV3(0:VECBITS16) assembles['3'];

alias register uint16 vector(VECLEN) NV28 = NV0(0:VECBITS16) assembles['0'];
alias register uint16 vector(VECLEN) NV29 = NV1(0:VECBITS16) assembles['1'];
alias register uint16 vector(VECLEN) NV30 = NV2(0:VECBITS16) assembles['2'];
alias register uint16 vector(VECLEN) NV31 = NV3(0:VECBITS16) assembles['3'];

alias register int8 vector(VECLEN) NV32 = NV0(0:VECBITS8) assembles['0'];
alias register int8 vector(VECLEN) NV33 = NV1(0:VECBITS8) assembles['1'];
alias register int8 vector(VECLEN) NV34 = NV2(0:VECBITS8) assembles['2'];
alias register int8 vector(VECLEN) NV35 = NV3(0:VECBITS8) assembles['3'];

alias register uint8 vector(VECLEN) NV36 = NV0(0:VECBITS8) assembles['0'];
alias register uint8 vector(VECLEN) NV37 = NV1(0:VECBITS8) assembles['1'];
alias register uint8 vector(VECLEN) NV38 = NV2(0:VECBITS8) assembles['2'];
alias register uint8 vector(VECLEN) NV39 = NV3(0:VECBITS8) assembles['3'];


pattern gpureg64 means[NV0|NV1|NV2|NV3];
pattern gpureg64u means[NV4|NV5|NV6|NV7];
pattern gpureg64fp means[NV8|NV9|NV10|NV11];
pattern gpureg means[NV12|NV13|NV14|NV15];
pattern gpuregu means[NV16|NV17|NV18|NV19];
pattern gpuregfp means[NV20|NV21|NV22|NV23];
pattern gpureg16 means[NV24|NV25|NV26|NV27];
pattern gpureg16u means[NV28|NV29|NV30|NV31];
pattern gpureg8 means[NV32|NV33|NV34|NV35];
pattern gpureg8u means[NV36|NV37|NV38|NV39];



/*
end{verbatim}
\section{instructions}
begin{verbatim}
*/


/*
loads
*/

instruction  pattern gpuLoad(gpureg r1, indexreg i1)
        means[   r1 :=(int32 vector(VECLEN))^(mem(^(i1)))]
        assembles[
         
			
		';	void gpuLoad(int reg, int* source)\n'
		 '\tmov RDI,' r1 '; first param of fn'
		'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload \n \tcall  \tgpuload' ];

instruction  pattern gpuLoadu(gpuregu r1, indexreg i1)
        means[   r1 :=(uint32 vector(VECLEN))^(mem(^(i1)))]
        assembles[';	void gpuLoad(int reg, int* source)\n'
		 '\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuloadu \n \tcall  \tgpuloadu' 
			];

instruction  pattern gpuLoadfp(gpuregfp r1, indexreg i1)
        means[   r1 :=(ieee32 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoadfp(int reg, float* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuloadfp \n \tcall  \tgpuloadfp'];

instruction  pattern gpuLoad64(gpureg64 r1, indexreg i1)
        means[   r1 :=(int64 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad64(int reg, long long int* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload64 \n \tcall  \tgpuload64'];

instruction  pattern gpuLoad64u(gpureg64u r1, indexreg i1)
        means[   r1 :=(uint64 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad64u(int reg, unsigned long long int* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload64u \n \tcall  \tgpuload64u'];

instruction  pattern gpuLoad64fp(gpureg64fp r1, indexreg i1)
        means[   r1 :=(ieee64 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad64fp(int reg, double* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload64fp \n \tcall  \tgpuload64fp'];

instruction  pattern gpuLoad16(gpureg16 r1, indexreg i1)
        means[   r1 :=(int16 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad16(int reg, short int* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload16 \n \tcall  \tgpuload16'];

instruction  pattern gpuLoad16u(gpureg16u r1, indexreg i1)
        means[   r1 :=(uint16 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad16u(int reg, unsigned short int* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload16u \n \tcall  \tgpuload16u'];

instruction  pattern gpuLoad8(gpureg8 r1, indexreg i1)
        means[   r1 :=(int8 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad8(int reg, signed char* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload8 \n \tcall  \tgpuload8'];

instruction  pattern gpuLoad8u(gpureg8u r1, indexreg i1)
        means[   r1 :=(uint8 vector(VECLEN))^(mem(^(i1)))]
        assembles[';void gpuLoad8u(int reg, unsigned char* source) \n'  
			'\tmov RDI,' r1 '; first param of fn'
					'\n \tmov RSI,' i1 '; second param of fn'
				  '\n \textern\tgpuload8u \n \tcall  \tgpuload8u'];


pattern gpuloads means[gpuLoad|gpuLoadu|gpuLoadfp|gpuLoad64|gpuLoad64u|gpuLoad64fp|gpuLoad16|gpuLoad16u|gpuLoad8| gpuLoad8u];




/*
stores
*/


instruction  pattern gpuStore( gpureg r1)
        means[(ref int32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles[';void gpuStore(int reg, int* results)\n'
        'extern gpuStore \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore \n'
			 ];

instruction  pattern gpuStoreu( gpuregu r1)
        means[(ref uint32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStoreu \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStoreu \n'];

instruction  pattern gpuStorefp( gpuregfp r1)
        means[(ref ieee32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStorefp \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStorefp \n'];

instruction  pattern gpuStore64( gpureg64 r1)
        means[(ref int64 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore64 \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore64 \n'];

instruction  pattern gpuStore64u( gpureg64u r1)
        means[(ref uint64 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore64u \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore64u \n'];

instruction  pattern gpuStore64fp( gpureg64fp r1)
        means[(ref ieee64 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore64fp \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore64fp \n'];

instruction  pattern gpuStore16( gpureg16 r1)
        means[(ref int16 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore16 \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore16 \n'];

instruction  pattern gpuStore16u( gpureg16u r1)
        means[(ref uint16 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore16u \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore16u \n'];

instruction  pattern gpuStore8( gpureg8 r1)
        means[(ref int8 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore8 \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore8 \n'];

instruction  pattern gpuStore8u( gpureg8u r1)
        means[(ref uint8 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore8u \n'  
            ' mov RDI,'r' \t; first param of fn\n'
			' pop RSI\t; second param \n'
			' call  gpuStore8u \n'];


pattern gpustores means[gpuStore|gpuStoreu|gpuStorefp|gpuStore64|gpuStore64u|gpuStore64fp|gpuStore16|gpuStore16u|gpuStore8|gpuStore8u];





/*
replicate -- left out for now
 

instruction pattern gpuRep(gpureg r1 )
	means[r1:=rep((int32)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep \n'
			'\n mov \tRDI,' r1 
			' call gpuRep \n'
			 ];

instruction pattern gpuRepu(gpuregu r1 )
	means[r1:=rep((uint32)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRepu \n'
			'\n mov \tRDI,' r1 
			' call gpuRepu \n'
			 ];

instruction pattern gpuRepfp(gpuregfp r1 )
	means[r1:=rep((ieee32)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRepfp \n'
			'\n mov \tRDI,' r1 
			' call gpuRepfp \n'
			 ];

instruction pattern gpuRep64(gpureg64 r1 )
	means[r1:=rep((int64)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep64 \n'
			'\n mov \tRDI,' r1 
			' call gpuRep64 \n'
			 ];

instruction pattern gpuRep64u(gpureg64u r1 )
	means[r1:=rep((uint64)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep64u \n'
			'\n mov \tRDI,' r1 
			' call gpuRep64u \n'
			 ];

instruction pattern gpuRep64fp(gpureg64fp r1 )
	means[r1:=rep((ieee64)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep64fp \n'
			'\n mov \tRDI,' r1 
			' call gpuRep64fp \n'
			 ];

instruction pattern gpuRep16(gpureg16 r1 )
	means[r1:=rep((int16)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep16 \n'
			'\n mov \tRDI,' r1 
			' call gpuRep16 \n'
			 ];

instruction pattern gpuRep16u(gpureg16u r1 )
	means[r1:=rep((uint16)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep16u \n'
			'\n mov \tRDI,' r1 
			' call gpuRep16u \n'
			 ];

instruction pattern gpuRep8(gpureg8 r1 )
	means[r1:=rep((int8)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep8 \n'
			'\n mov \tRDI,' r1 
			' call gpuRep8 \n'
			 ];

instruction pattern gpuRep8u(gpureg8u r1 )
	means[r1:=rep((uint8)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep8u \n'
			'\n mov \tRDI,' r1 
			' call gpuRep8u \n'
			 ];


pattern gpureps means[gpuRep|gpuRepu|gpuRepfp|gpuRep64|gpuRep64u|gpuRep64fp|gpuRep16|gpuRep16u|gpuRep8|gpuRep8u];


*/


/*
operation list
*/

operation gpuadd means  +  assembles [ '0'];
operation gpusub means  -  assembles [ '1'];
operation gpumul means  *  assembles [ '2'];
operation gpudiv means div assembles [ '3'];
operation gpuand means AND assembles ['4'];
operation gpuor means OR assembles ['5'];
operation gpuxor means XOR assembles ['6'];


pattern gpuinst means[gpuadd|gpusub|gpumul|gpudiv|gpuand|gpuor|gpuxor];





/*
register-register operations
*/

instruction pattern gpuOP(gpureg r1, gpureg r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles[  'extern gpuVVops \n' 
					'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 		 
			        '\n call gpuVVops \n'
		 ];

instruction pattern gpuOPu(gpuregu r1, gpuregu r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVopsu \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVopsu \n'
			 ];

instruction pattern gpuOPfp(gpuregfp r1, gpuregfp r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVopsfp \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVopsfp \n'
			  ];

instruction pattern gpuOP64(gpureg64 r1, gpureg64 r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops64 \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVops64 \n'
			  ];

instruction pattern gpuOP64u(gpureg64u r1, gpureg64u r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops64u \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVops64u \n'
		  ];

instruction pattern gpuOP64fp(gpureg64fp r1, gpureg64fp r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops64fp \n' 
					'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVops64fp \n'
			  ];

instruction pattern gpuOP16(gpureg16 r1, gpureg16 r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops16 \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVops16 \n'
			  ];

instruction pattern gpuOP16u(gpureg16u r1, gpureg16u r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops16u \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVops16u \n'
			  ];

instruction pattern gpuOP8(gpureg8 r1, gpureg8 r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops8 \n' 
			'mov \tRDX,' sop 
					'\n mov \tRSI,' r2 
					'\n mov \tRDI,' r1 	
			' call gpuVVops8 \n'
			  ];

instruction pattern gpuOP8u(gpureg8u r1, gpureg8u r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops8u \n' 
			 'mov \tRDX,' sop 
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuVVops8u \n'
			  ];


pattern gpuvvops means[gpuOP|gpuOPu|gpuOPfp|gpuOP64|gpuOP64u|gpuOP64fp|gpuOP16|gpuOP16u|gpuOP8|gpuOP8u];





/*
additional bitwise instructions (non-fp only)
*/


instruction pattern gpuNOT(gpureg r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT \n'
			  ];


instruction pattern gpuNOTu(gpuregu r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOTu \n'
			'\n mov \tRDI,' r1 
			' call gpuNOTu \n'
			  ];

instruction pattern gpuNOT64(gpureg64 r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT64 \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT64 \n'
			  ];

instruction pattern gpuNOT64u(gpureg r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT64u \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT64u \n'
			  ];

instruction pattern gpuNOT16(gpureg16 r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT16 \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT16 \n'
			  ];

instruction pattern gpuNOT16u(gpureg16u r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT16u \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT16u \n'
			  ];

instruction pattern gpuNOT8(gpureg8 r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT8 \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT8 \n'
			  ];

instruction pattern gpuNOT8u(gpureg r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT8u \n'
			'\n mov \tRDI,' r1 
			' call gpuNOT8u \n'
			  ];


pattern gpunots means[gpuNOT|gpuNOTu|gpuNOT64|gpuNOT64u|gpuNOT16|gpuNOT16u|gpuNOT8|gpuNOT8u];





/*
AND-NOT instructions
*/


instruction pattern gpuANDNOT(gpureg r1, gpureg r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot \n'
			  ];

instruction pattern gpuANDNOTu(gpuregu r1, gpuregu r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNotu \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNotu \n'
			  ];

instruction pattern gpuANDNOT64(gpureg64 r1, gpureg64 r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot64 \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot64 \n'
			  ];

instruction pattern gpuANDNOT64u(gpureg64u r1, gpureg64u r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot64u \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot64u \n'
			  ];

instruction pattern gpuANDNOT16(gpureg16 r1, gpureg16 r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot16 \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot16 \n'
			  ];

instruction pattern gpuANDNOT16u(gpureg16u r1, gpureg16u r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot16u \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot16u \n'
			  ];

instruction pattern gpuANDNOT8(gpureg8 r1, gpureg8 r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot8 \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot8 \n'
			  ];

instruction pattern gpuANDNOT8u(gpureg8u r1, gpureg8u r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot8u \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuAndNot8u \n'
			  ];


pattern gpuandnot means [gpuANDNOT|gpuANDNOTu|gpuANDNOT64|gpuANDNOT64u|gpuANDNOT16|gpuANDNOT16u|gpuANDNOT8|gpuANDNOT8u];




/*
trig instructions (fp only)
*/


instruction pattern gpuSIN(gpuregfp r1)
	means[r1:= SIN(^(r1))]
	assembles['extern gpuSIN \n'
			'\n mov \tRDI,' r1 
			' call gpuSIN \n'
			  ];

instruction pattern gpuSIN64(gpureg64fp r1)
	means[r1:= SIN(^(r1))]
	assembles['extern gpuSIN64 \n'
			'\n mov \tRDI,' r1 
			' call gpuSIN64 \n'
			  ];



instruction pattern gpuCOS(gpuregfp r1)
	means[r1:= COS(^(r1))]
	assembles['extern gpuCOS64 \n'
			'\n mov \tRDI,' r1 
			' call gpuCOS \n'
			  ];

instruction pattern gpuCOS64(gpureg64fp r1)
	means[r1:= COS(^(r1))]
	assembles['extern gpuCOS64 \n'
			'\n mov \tRDI,' r1 
			' call gpuCOS64 \n'
			  ];



instruction pattern gpuTAN(gpuregfp r1)
	means[r1:= TAN(^(r1))]
	assembles['extern gpuTAN \n'
			'\n mov \tRDI,' r1 
			' call gpuTAN \n'
			  ];

instruction pattern gpuTAN64(gpureg64fp r1)
	means[r1:= TAN(^(r1))]
	assembles['extern gpuTAN64 \n'
			'\n mov \tRDI,' r1 
			' call gpuTAN64 \n'
			  ];


pattern gputrig means[gpuSIN|gpuSIN64|gpuCOS|gpuCOS64|gpuTAN|gpuTAN64];






/*
multiply accumulate instructions
*/


instruction pattern gpuMA(gpureg r1, gpureg r2, gpureg r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc \n'
			  ];

instruction pattern gpuMAu(gpuregu r1, gpuregu r2, gpuregu r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAccu \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAccu \n'
			  ];

instruction pattern gpuMAfp(gpuregfp r1, gpuregfp r2, gpuregfp r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAccfp \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAccfp \n'
			  ];


instruction pattern gpuMA64(gpureg64 r1, gpureg64 r2, gpureg64 r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc64 \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc64 \n'
			  ];

instruction pattern gpuMA64u(gpureg64u r1, gpureg64u r2, gpureg64u r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc64u \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc64u \n'
			  ];

instruction pattern gpuMA64fp(gpureg64fp r1, gpureg64fp r2, gpureg64fp r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc64fp \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc64fp \n'
			  ];

instruction pattern gpuMA16(gpureg16 r1, gpureg16 r2, gpureg16 r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc16 \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc16 \n'
			  ];

instruction pattern gpuMA16u(gpureg16u r1, gpureg16u r2, gpureg16u r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc16u \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc16u \n'
			  ];

instruction pattern gpuMA8(gpureg8 r1, gpureg8 r2, gpureg8 r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc8 \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc8 \n'
			  ];

instruction pattern gpuMA8u(gpureg8u r1, gpureg8u r2, gpureg8u r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc8u \n'
			' push ' r3 ' \n'
			'\n mov \tRSI,' r2
			'\n mov \tRDI,' r1 
			' call gpuMulAcc8u \n'
			  ];

pattern gpumacc means[gpuMA|gpuMAu|gpuMAfp|gpuMA64|gpuMA64u|gpuMA64fp|gpuMA16|gpuMA16u|gpuMA8|gpuMA8u];





define( gpucodes, gpumacc|gpuandnot|gpunots/*|gpureps*/|gpuloads|gpustores|gpuvvops|gputrig)
 
instructionset [IA32codes|gpucodes|FSET32|fpucodes|fpupushes|lastIA32codes]
 
/*

\end{verbatim}
*/
  
