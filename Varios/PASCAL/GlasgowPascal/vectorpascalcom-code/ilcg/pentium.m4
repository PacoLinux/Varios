/*
\section{Pentium}
*/
include(`\cpus\i386base.m4')
include(`\cpus\ifpu.m4')
include(`\cpus\mmx.m4')
/* \begin{verbatim}*/
instructionset [NULMOV|LOAD|MOVZXB|MOVZXW|FSTR|STORELIT|INC|Negate|FSTRR|
		RMLIT|RLIT|RRM|LEA|RR|IDIV|IMOD|
		FOP|ReversePolishFOP|PLANT|FLD|
		IFLITGOTO |IFGOTO|GOTO|RMR|STORER|PLANTRCONST]

/*

\end{verbatim}
*/
