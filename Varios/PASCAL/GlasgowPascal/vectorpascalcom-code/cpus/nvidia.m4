/*
nvidia GPU machine description

Scott McCorkell - 2014

\section{nvidia}
\begin{verbatim}
*/
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
        assembles['extern gpuLoad \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad \n'
			' add esp, byte 8'];

instruction  pattern gpuLoadu(gpuregu r1, indexreg i1)
        means[   r1 :=(uint32 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoadu \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoadu \n'
			' add esp, byte 8'];

instruction  pattern gpuLoadfp(gpuregfp r1, indexreg i1)
        means[   r1 :=(ieee32 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoadfp \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoadfp \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad64(gpureg64 r1, indexreg i1)
        means[   r1 :=(int64 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad64 \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad64 \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad64u(gpureg64u r1, indexreg i1)
        means[   r1 :=(uint64 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad64u \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad64u \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad64fp(gpureg64fp r1, indexreg i1)
        means[   r1 :=(ieee64 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad64fp \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad64fp \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad16(gpureg16 r1, indexreg i1)
        means[   r1 :=(int16 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad16 \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad16 \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad16u(gpureg16u r1, indexreg i1)
        means[   r1 :=(uint16 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad16u \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad16u \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad8(gpureg8 r1, indexreg i1)
        means[   r1 :=(int8 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad8 \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad8 \n'
			' add esp, byte 8'];

instruction  pattern gpuLoad8u(gpureg8u r1, indexreg i1)
        means[   r1 :=(uint8 vector(VECLEN))^(mem(^(i1)))]
        assembles['extern gpuLoad8u \n'  
			' push ' i1 ' \n'
			' push ' r1 ' \n'
			' call  gpuLoad8u \n'
			' add esp, byte 8'];


pattern gpuloads means[gpuLoad|gpuLoadu|gpuLoadfp|gpuLoad64|gpuLoad64u|gpuLoad64fp|gpuLoad16|gpuLoad16u|gpuLoad8| gpuLoad8u];




/*
stores
*/


instruction  pattern gpuStore( gpureg r1)
        means[(ref int32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore \n'  
			' push ' r1 ' \n'
			' call  gpuStore \n'
			' add esp, byte 8'];

instruction  pattern gpuStoreu( gpuregu r1)
        means[(ref uint32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStoreu \n'  
			' push ' r1 ' \n'
			' call  gpuStoreu \n'
			' add esp, byte 8'];

instruction  pattern gpuStorefp( gpuregfp r1)
        means[(ref ieee32 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStorefp \n'  
			' push ' r1 ' \n'
			' call  gpuStorefp \n'
			' add esp, byte 8'];

instruction  pattern gpuStore64( gpureg64 r1)
        means[(ref int64 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore64 \n'  
			' push ' r1 ' \n'
			' call  gpuStore64 \n'
			' add esp, byte 8'];

instruction  pattern gpuStore64u( gpureg64u r1)
        means[(ref uint64 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore64u \n'  
			' push ' r1 ' \n'
			' call  gpuStore64u \n'
			' add esp, byte 8'];

instruction  pattern gpuStore64fp( gpureg64fp r1)
        means[(ref ieee64 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore64fp \n'  
			' push ' r1 ' \n'
			' call  gpuStore64fp \n'
			' add esp, byte 8'];

instruction  pattern gpuStore16( gpureg16 r1)
        means[(ref int16 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore16 \n'  
			' push ' r1 ' \n'
			' call  gpuStore16 \n'
			' add esp, byte 8'];

instruction  pattern gpuStore16u( gpureg16u r1)
        means[(ref uint16 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore16u \n'  
			' push ' r1 ' \n'
			' call  gpuStore16u \n'
			' add esp, byte 8'];

instruction  pattern gpuStore8( gpureg8 r1)
        means[(ref int8 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore8 \n'  
			' push ' r1 ' \n'
			' call  gpuStore8 \n'
			' add esp, byte 8'];

instruction  pattern gpuStore8u( gpureg8u r1)
        means[(ref uint8 vector(VECLEN))mem((int32)POP(mainSTACK)):=^(r1)]
        assembles['extern gpuStore8u \n'  
			' push ' r1 ' \n'
			' call  gpuStore8u \n'
			' add esp, byte 8'];


pattern gpustores means[gpuStore|gpuStoreu|gpuStorefp|gpuStore64|gpuStore64u|gpuStore64fp|gpuStore16|gpuStore16u|gpuStore8|gpuStore8u];





/*
replicate
*/

instruction pattern gpuRep(gpureg r1 )
	means[r1:=rep((int32)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep \n'
			' push ' r1 ' \n'
			' call gpuRep \n'
			' add esp, byte 8'];

instruction pattern gpuRepu(gpuregu r1 )
	means[r1:=rep((uint32)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRepu \n'
			' push ' r1 ' \n'
			' call gpuRepu \n'
			' add esp, byte 8'];

instruction pattern gpuRepfp(gpuregfp r1 )
	means[r1:=rep((ieee32)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRepfp \n'
			' push ' r1 ' \n'
			' call gpuRepfp \n'
			' add esp, byte 8'];

instruction pattern gpuRep64(gpureg64 r1 )
	means[r1:=rep((int64)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep64 \n'
			' push ' r1 ' \n'
			' call gpuRep64 \n'
			' add esp, byte 12'];

instruction pattern gpuRep64u(gpureg64u r1 )
	means[r1:=rep((uint64)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep64u \n'
			' push ' r1 ' \n'
			' call gpuRep64u \n'
			' add esp, byte 12'];

instruction pattern gpuRep64fp(gpureg64fp r1 )
	means[r1:=rep((ieee64)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep64fp \n'
			' push ' r1 ' \n'
			' call gpuRep64fp \n'
			' add esp, byte 12'];

instruction pattern gpuRep16(gpureg16 r1 )
	means[r1:=rep((int16)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep16 \n'
			' push ' r1 ' \n'
			' call gpuRep16 \n'
			' add esp, byte 8'];

instruction pattern gpuRep16u(gpureg16u r1 )
	means[r1:=rep((uint16)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep16u \n'
			' push ' r1 ' \n'
			' call gpuRep16u \n'
			' add esp, byte 8'];

instruction pattern gpuRep8(gpureg8 r1 )
	means[r1:=rep((int8)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep8 \n'
			' push ' r1 ' \n'
			' call gpuRep8 \n'
			' add esp, byte 8'];

instruction pattern gpuRep8u(gpureg8u r1 )
	means[r1:=rep((uint8)POP(mainSTACK),VECLEN)]
	assembles['extern gpuRep8u \n'
			' push ' r1 ' \n'
			' call gpuRep8u \n'
			' add esp, byte 8'];


pattern gpureps means[gpuRep|gpuRepu|gpuRepfp|gpuRep64|gpuRep64u|gpuRep64fp|gpuRep16|gpuRep16u|gpuRep8|gpuRep8u];





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
        assembles['extern gpuVVops \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops \n'
			' add esp, byte 12' ];

instruction pattern gpuOPu(gpuregu r1, gpuregu r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVopsu \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVopsu \n'
			' add esp, byte 12' ];

instruction pattern gpuOPfp(gpuregfp r1, gpuregfp r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVopsfp \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVopsfp \n'
			' add esp, byte 12' ];

instruction pattern gpuOP64(gpureg64 r1, gpureg64 r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops64 \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops64 \n'
			' add esp, byte 12' ];

instruction pattern gpuOP64u(gpureg64u r1, gpureg64u r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops64u \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops64u \n'
			' add esp, byte 12' ];

instruction pattern gpuOP64fp(gpureg64fp r1, gpureg64fp r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops64fp \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops64fp \n'
			' add esp, byte 12' ];

instruction pattern gpuOP16(gpureg16 r1, gpureg16 r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops16 \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops16 \n'
			' add esp, byte 12' ];

instruction pattern gpuOP16u(gpureg16u r1, gpureg16u r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops16u \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops16u \n'
			' add esp, byte 12' ];

instruction pattern gpuOP8(gpureg8 r1, gpureg8 r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops8 \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops8 \n'
			' add esp, byte 12' ];

instruction pattern gpuOP8u(gpureg8u r1, gpureg8u r2, gpuinst sop )
        means[r1:= sop(^(r1),^(r2))]
        assembles['extern gpuVVops8u \n' 
			' push ' sop ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuVVops8u \n'
			' add esp, byte 12' ];


pattern gpuvvops means[gpuOP|gpuOPu|gpuOPfp|gpuOP64|gpuOP64u|gpuOP64fp|gpuOP16|gpuOP16u|gpuOP8|gpuOP8u];





/*
additional bitwise instructions (non-fp only)
*/


instruction pattern gpuNOT(gpureg r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT \n'
			' push ' r1 ' \n'
			' call gpuNOT \n'
			' add esp, byte 4' ];


instruction pattern gpuNOTu(gpuregu r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOTu \n'
			' push ' r1 ' \n'
			' call gpuNOTu \n'
			' add esp, byte 4' ];

instruction pattern gpuNOT64(gpureg64 r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT64 \n'
			' push ' r1 ' \n'
			' call gpuNOT64 \n'
			' add esp, byte 4' ];

instruction pattern gpuNOT64u(gpureg r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT64u \n'
			' push ' r1 ' \n'
			' call gpuNOT64u \n'
			' add esp, byte 4' ];

instruction pattern gpuNOT16(gpureg16 r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT16 \n'
			' push ' r1 ' \n'
			' call gpuNOT16 \n'
			' add esp, byte 4' ];

instruction pattern gpuNOT16u(gpureg16u r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT16u \n'
			' push ' r1 ' \n'
			' call gpuNOT16u \n'
			' add esp, byte 4' ];

instruction pattern gpuNOT8(gpureg8 r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT8 \n'
			' push ' r1 ' \n'
			' call gpuNOT8 \n'
			' add esp, byte 4' ];

instruction pattern gpuNOT8u(gpureg r1)
        means[r1:= NOT(^(r1))]
        assembles['extern gpuNOT8u \n'
			' push ' r1 ' \n'
			' call gpuNOT8u \n'
			' add esp, byte 4' ];


pattern gpunots means[gpuNOT|gpuNOTu|gpuNOT64|gpuNOT64u|gpuNOT16|gpuNOT16u|gpuNOT8|gpuNOT8u];





/*
AND-NOT instructions
*/


instruction pattern gpuANDNOT(gpureg r1, gpureg r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOTu(gpuregu r1, gpuregu r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNotu \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNotu \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOT64(gpureg64 r1, gpureg64 r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot64 \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot64 \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOT64u(gpureg64u r1, gpureg64u r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot64u \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot64u \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOT16(gpureg16 r1, gpureg16 r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot16 \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot16 \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOT16u(gpureg16u r1, gpureg16u r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot16u \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot16u \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOT8(gpureg8 r1, gpureg8 r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot8 \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot8 \n'
			' add esp, byte 8' ];

instruction pattern gpuANDNOT8u(gpureg8u r1, gpureg8u r2)
	means[r1:= AND(^(r1), NOT(^(r2)))]
	assembles['extern gpuAndNot8u \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuAndNot8u \n'
			' add esp, byte 8' ];


pattern gpuandnot means [gpuANDNOT|gpuANDNOTu|gpuANDNOT64|gpuANDNOT64u|gpuANDNOT16|gpuANDNOT16u|gpuANDNOT8|gpuANDNOT8u];




/*
trig instructions (fp only)
*/


instruction pattern gpuSIN(gpuregfp r1)
	means[r1:= SIN(^(r1))]
	assembles['extern gpuSIN \n'
			' push ' r1 ' \n'
			' call gpuSIN \n'
			' add esp, byte 4' ];

instruction pattern gpuSIN64(gpureg64fp r1)
	means[r1:= SIN(^(r1))]
	assembles['extern gpuSIN64 \n'
			' push ' r1 ' \n'
			' call gpuSIN64 \n'
			' add esp, byte 4' ];



instruction pattern gpuCOS(gpuregfp r1)
	means[r1:= COS(^(r1))]
	assembles['extern gpuCOS64 \n'
			' push ' r1 ' \n'
			' call gpuCOS \n'
			' add esp, byte 4' ];

instruction pattern gpuCOS64(gpureg64fp r1)
	means[r1:= COS(^(r1))]
	assembles['extern gpuCOS64 \n'
			' push ' r1 ' \n'
			' call gpuCOS64 \n'
			' add esp, byte 4' ];



instruction pattern gpuTAN(gpuregfp r1)
	means[r1:= TAN(^(r1))]
	assembles['extern gpuTAN \n'
			' push ' r1 ' \n'
			' call gpuTAN \n'
			' add esp, byte 4' ];

instruction pattern gpuTAN64(gpureg64fp r1)
	means[r1:= TAN(^(r1))]
	assembles['extern gpuTAN64 \n'
			' push ' r1 ' \n'
			' call gpuTAN64 \n'
			' add esp, byte 4' ];


pattern gputrig means[gpuSIN|gpuSIN64|gpuCOS|gpuCOS64|gpuTAN|gpuTAN64];






/*
multiply accumulate instructions
*/


instruction pattern gpuMA(gpureg r1, gpureg r2, gpureg r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc \n'
			' add esp, byte 12' ];

instruction pattern gpuMAu(gpuregu r1, gpuregu r2, gpuregu r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAccu \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAccu \n'
			' add esp, byte 12' ];

instruction pattern gpuMAfp(gpuregfp r1, gpuregfp r2, gpuregfp r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAccfp \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAccfp \n'
			' add esp, byte 12' ];


instruction pattern gpuMA64(gpureg64 r1, gpureg64 r2, gpureg64 r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc64 \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc64 \n'
			' add esp, byte 12' ];

instruction pattern gpuMA64u(gpureg64u r1, gpureg64u r2, gpureg64u r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc64u \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc64u \n'
			' add esp, byte 12' ];

instruction pattern gpuMA64fp(gpureg64fp r1, gpureg64fp r2, gpureg64fp r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc64fp \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc64fp \n'
			' add esp, byte 12' ];

instruction pattern gpuMA16(gpureg16 r1, gpureg16 r2, gpureg16 r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc16 \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc16 \n'
			' add esp, byte 12' ];

instruction pattern gpuMA16u(gpureg16u r1, gpureg16u r2, gpureg16u r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc16u \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc16u \n'
			' add esp, byte 12' ];

instruction pattern gpuMA8(gpureg8 r1, gpureg8 r2, gpureg8 r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc8 \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc8 \n'
			' add esp, byte 12' ];

instruction pattern gpuMA8u(gpureg8u r1, gpureg8u r2, gpureg8u r3)
	means[r1:= +(^(r1), *(^(r2), ^(r3)))]
	assembles['extern gpuMulAcc8u \n'
			' push ' r3 ' \n'
			' push ' r2 ' \n'
			' push ' r1 ' \n'
			' call gpuMulAcc8u \n'
			' add esp, byte 12' ];

pattern gpumacc means[gpuMA|gpuMAu|gpuMAfp|gpuMA64|gpuMA64u|gpuMA64fp|gpuMA16|gpuMA16u|gpuMA8|gpuMA8u];





define( gpucodes, gpumacc|gpuandnot|gpunots|gpureps|gpuloads|gpustores|gpuvvops|gputrig)
 
instructionset [IA32codes|gpucodes|FSET32|fpucodes|fpupushes|lastIA32codes]
 
/*

\end{verbatim}
*/
  
