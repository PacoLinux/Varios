
/*
\section{AMD 64}
*/
include(`cpus/amd64base.m4')
 
pattern indexreg means[RBX|RDI|RSI|RBP|RSP|RAX|RCX|RDX];
define(SCALEDSUB, subq)
define(SCALEDADD, addq)
define(SPTR,%rsp)
define(ADDRSIZE, 8 )
define(Rvec,4)
define(addrtype,int64)
/* define the position independent suffix */
define(PIS,'(%rip)')

include(`cpus/ifpu-gas.m4')
include(`cpus/gnusse2.m4')
include(cpus/floattrans.m4)
 

/*
\begin{verbatim}
*/

instructionset [
 AMD64Codes|
 XMMXcodes |
 RPUSH|
 INTMIN|
 INTMAX |
 FSET|
 lastAMD64Codes|
 genfpucodes|
 FPUSHI64|FISTMs| 
 
 mmxcodes|MOVDs  ]

/*
\end{verbatim}
*/

