/*
\section{PowerPC}
*/

/*
PowerPC Microprocessor Family: The Programming Environments for 32-Bit Microprocessors 

Associated Product Family(ies): PowerPC
Associated Product(s): PowerPC 603e Microprocessor, PowerPC 740 Microprocessor (300MHz to 550MHz), 
PowerPC 740 Microprocessor (up to 266MHz), PowerPC 750 Microprocessor (300MHz to 550MHz), PowerPC 750 
Microprocessor (up to 266MHz), PowerPC EM603e Microprocessor, PowerPC 750FX Microprocessor, 
PowerPC 750CX and 750CXe Microprocessor

Software Reference Manual 
The primary objective of this manual is to help programmers provide software that is compatible across 
the family of 32-bit PowerPC(TM) processors. Because the PowerPC architecture is designed to be flexible 
to  support a broad range of both 32 and 64-bit processors, this book provides a general description 
of features that are common to PowerPC processors and indicates those features that are optional or 
that may be implemented differently in the design of each processor. 

Topics include PowerPC register set, operand conventions, addressing modes and instruction set summary, 
cache model and memory coherency, exceptions, memory management, instruction set, PowerPC instruction 
set listings, architecture cross reference, multiple-precision shifts, floating-point models, synchronization 
programming examples, simplified mnemonics and a glossary of terms and abbreviations.

Publication Number: G522-0290-01 
p~~~~~~~~~~~~~6Y A#A #
=
Q]

Link: http://www-3.ibm.com/chips/techlib/techlib.nsf/techdocs/852569B20050FF778525699600719DF2/$file/6xx_pem.pdf

File: 6xx_pem.pdf 

*/
include(`cpus/PPCint.m4') 
include(`cpus/PPCfp.m4')
include(`cpus/PPCNew.m4')
include(`cpus/PPCVecfp.m4')
include(`cpus/PPCVecInt.m4')


/* \begin{verbatim}*/
/*instructionset [ PPCintcodes | PPCfpucodes  | PPCnewfpucodes |lastPPCintcodes | SPEfloatcodes ]*/
 
/*
\end{verbatim}
*/ 
