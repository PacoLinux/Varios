/*
 AMD64 with reduced number of base registers to allow compilation using 256 element sets
*/
define(havesse,1)
define(bit64, 1) 

include(`cpus/i386base.m4')
include(`cpus/ifpu.m4')
 
 include(`cpus/mmxsmall.m4')
include(`cpus/sse2small.m4') 
 
pattern fxmreg means[XMM00|XMM10|XMM20|XMM30 ];

pattern dxmreg means[ XMM3R64| XMM2R64| XMM1R64| XMM0R64];
 
 
   instruction  pattern CVTTSS2SI(int32reg r1,fxmreg r0)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee32)^(  r0))]
    	assembles['cvttss2si  '    r1 ', ' r0];
instruction  pattern CVTTSD2SI( dxmreg rm,int32reg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
    	assembles['cvttsd2si  '    r1 ', ' rm]; 
     
 
 

instructionset [ IA32codes
 |p6intcodes
 |XMMXcodes
 |CVTSS2SI|CVTSD2SI|CVTTSS2SI|CVTTSD2SI|CVTSI2SD|CVTSI2SS|CVTIR2SS 
 |FSTRF
 |FSTR
 |p6fpucodes
 |fpucodes
 |fpupushes
 |lastIA32codes
  |mmxcodes]

 
