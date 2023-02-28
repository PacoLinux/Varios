/*
\section{Pentium}
*/

define(Rvec,4)
define(addrtype,int32)
include(`cpus/i386gas.m4')
 
define(SCALEDSUB, subl)
define(SCALEDADD, addl)
define(SPTR,%esp)
define(ADDRSIZE, 4 )

include(`cpus/gnusse2.m4')
 
include(`cpus/floattrans.m4')
/* \begin{verbatim}*/
instructionset [IA32codes| 
XMMXcodes |
RPUSH|
INTMIN|
INTMAX |
FSET|
fpucodes|
fpupushes |
lastIA32codes|
mmxcodes
 ]

/*

\end{verbatim}
*/

