
/* 
 


Basic ia32 processor description int ilcg
 copyright(c) Paul Cockshott, University of Glasgow
 Feb 2000


\subsection{Declare types to correspond to internal ilcg types }
\begin{verbatim}
*/

type word=DWORD;
type uint32=DWORD;
type int32=DWORD;
type ieee64=QWORD;
type octet=BYTE; 
type int16=WORD;
type int8=BYTE;
type halfword=WORD;

/* \end{verbatim}
\subsection{compiler configuration flags }
\begin{verbatim}
*/
flag realLitSupported = 0;
/* \end{verbatim}
\subsection{Register declarations}

\begin{verbatim}
*/
register word EAX assembles['eax'] ;
register word ECX assembles['ecx'] ;
register word EBX assembles['ebx'] ;
register word EBP assembles['ebp'] ;
alias register word FP = EBP(0:31) assembles ['ebp'];
reserved register word ESP assembles['esp'];
register word ESI assembles['esi'] ;
register word EDI assembles['edi'] ;
register word EDX assembles['edx'];

 alias register octet AL = EAX(0:7) assembles['al']; 
 alias register octet BL = EBX(0:7) assembles['bl'];
 alias register octet CL = ECX(0:7) assembles['cl'];
 alias register octet DL = EDX(0:7) assembles['dl'];

 alias register octet AH = EAX(8:15) assembles['ah']; 
 alias register octet BH = EBX(8:15) assembles['bh'];
 alias register octet CH = ECX(8:15) assembles['ch'];
 alias register octet DH = EDX(8:15) assembles['dh'];


 
pattern freg means[ST0]; 
pattern reg means [ EBP| EBX|ESI|EDI|ECX |EAX|EDX|ESP]  ;
pattern breg means[ AL|AH|BL|BH|CL|CH|DL|DH];
pattern anyreg means[ breg|reg];
pattern acc means[EAX];
pattern modreg means [EDX];
/*\end{verbatim}

\subsection{Operator definition}
This section defines operations that can be used to parameterise
functions.
\begin{verbatim}

*/
operation add means  +  assembles [ 'add'];
/* */operation and means  AND  assembles[ 'and'];
operation or means OR assembles['or'];
operation xor means XOR assembles['xor'];/* */
operation sub means  -  assembles [ 'sub']; 
operation mul means * assembles ['mul'];
operation imul means * assembles ['imul '];
operation lt means < assembles ['l'];
operation gt means > assembles ['g'];
operation eq means = assembles ['z'];
operation le means <= assembles ['le'];
operation ge means >= assembles ['ge'];
operation ne means <> assembles ['nz'];

pattern condition means[ne|ge|le|eq|gt|lt];
pattern operator means[add | sub|imul|and|or|xor];

/*

\end{verbatim}
\subsection{Data formats}
Here we define ilcg symbols for the types that
can be used as part of instructions.
\begin{verbatim}
*/
pattern unsigned means[uint32|uint8|uint16];
pattern signed means[int32 |   int8 |   int16 ];
pattern int means[signed|unsigned];
pattern double means[ieee64] ;
pattern float  means[ieee32];
pattern real means [ieee64|float];

pattern dataformat means[octet|word];
pattern longint means [int32|uint32];
pattern two(type t)means[2] assembles['2'];
pattern four(type t)means[4] assembles['4'];
pattern eight(type t)means[8] assembles['8'];

pattern scale means[two|four|eight];

/** \end{verbatim}
Define the address forms used in lea instructions
these differ from the address forms used in other instructions as the
semantics includes no memory reference.
Also of course register and immediate modes are not present.

\begin{verbatim} */
pattern regindirf(reg r) 
	means[^(r) ]
	assembles[ r ];
pattern baseplusoffsetf(reg r, signed s) 
	means[+(  ^(r) ,const s)]
	assembles[  r '+' s ];
pattern scaledIndexPlusOffsetf(reg r1, scale s, signed offs)
	means[+(*(^(r1),s),const offs)]
	assembles[r1 '*' s '+' offs];
address pattern basePlusScaledIndexf(reg r1,reg r2,scale s)
	means[+(^(r1),*(^(r2),s))]
        assembles[  r1 '+' r2 '*'  s   ];
address pattern basePlusScaledIndexPlusOffsetf(reg r1,reg r2,scale s,signed off)
	means[+(^(r1),+(*(^(r2),s),const off))]
        assembles[  r1 '+' r2 '*'  s '+'off  ];
address pattern basePlusIndexPlusOffsetf(reg r1,reg r2,signed off)
	means[+(^(r1),+(^(r2),const off))]
        assembles[  r1 '+' r2 '*'  s '+'off  ];

address pattern basePlusIndexf(reg r1,reg r2)
	means [+(^(r1),^(r2))]
	assembles[  r1 '+' r2   ];
pattern directf(unsigned s) 
	means[const s] 
	assembles[  s  ];
pattern labelf(label l)
	means [l]
	assembles[l];
 
/* the useful formats for load effective address regindirf excluded here as it adds nothing
   we do not have already from mov instructions*/
pattern eaform means[directf  |
	labelf|
        scaledIndexPlusOffsetf|
	basePlusScaledIndexf|
	basePlusScaledIndexPlusOffsetf| 
	basePlusIndexPlusOffsetf|
	baseplusoffsetf | 
	basePlusIndexf];
/* the formats for all memory addresses */
pattern addrform means[eaform| regindirf];

 
/** define the address patterns used in other instructions */



pattern maddrmode(addrform f) means[mem(f) ] assembles[ '[' f ']' ];
pattern addrmode means[maddrmode|anyreg];

instruction pattern STORER(addrmode rm, anyreg r1, type t)
        means[  (ref t) rm:=^(r1) ]
	assembles['mov ' rm ',' r1];
instruction  pattern NULMOV(reg r3, type t)
	means[(ref t)r3:=^((ref t)r3)]
        assembles[';nulmov ' r3  r3];
instruction  pattern STORELIT(addrmode rm,  type t, signed s)
        means[ (ref t) rm:= (t)const s  ]
	assembles['mov ' rm ',' t ' ' s];
instruction  pattern RMLIT(operator op,addrmode rm,  type t, signed sm)
        means[  (ref t) rm:= op(^((ref t)rm),(t)const sm)  ]
	assembles[op '  ' t ' ' rm ',' sm];
instruction  pattern INC(addrmode rm,type t)
	means[(ref t)rm:=   + (^((ref t)rm),1)]
	assembles['inc ' t ' ' rm];

instruction  pattern RMR( operator op,addrmode rm,reg r1,int t)
        means[ (ref t) rm :=op( ^((ref t) rm),^((ref t) r1))]
    	assembles[op '  '   t ' ' rm ',' r1]; 
instruction  pattern LOAD(maddrmode rm, anyreg r1, type t)
        means[  r1:= ^((ref t)rm )]
	assembles['mov ' r1 ',' t ' ' rm];
instruction pattern MOVZXB(reg r1, addrmode rm)
	means[  r1:=(int32)^((ref octet)rm)]
	assembles['movzx ' r1 ', BYTE 'rm];
instruction pattern MOVZXW(reg r1, addrmode rm)
	means[  r1:=(int32)^((ref halfword)rm)]
	assembles['movzx ' r1 ', WORD 'rm];
instruction pattern LEA(reg r1, eaform ea)
	means [r1:=ea]
        assembles ['lea ' r1 ',[' ea ']' ];
instruction pattern Negate(reg r1,type t)
	means[r1:= -((t)0,^((ref t)r1))]
	assembles ['neg ' r1];
instruction  pattern RLIT(operator op,reg r0,  type t, signed sm)
        means[r0:=  op(^( r0), const sm)  ]
	assembles[op '  '  r0 ',' sm];

instruction pattern RR( operator op, anyreg r1, anyreg r2, int t)
        means[r1:=(t) op( ^((ref t) r1),^((ref t) r2))]    
	assembles[op ' ' r1 ',' r2];
instruction  pattern RRM(operator op, reg r1, maddrmode rm, int t)
        means [r1:=(t) op( ^((ref t)r1),^((ref t) rm))]
        assembles[op ' ' r1 ',' rm ] ;

instruction pattern IDIV(reg r1,reg r2)
        means[r1:= div(^(r1),^( r2)) ]
	
	assembles['push edx\nxchg eax,' r1 '\ncdq\ndiv   ' r2 '\npop edx\nxchg eax,' r1];
instruction pattern PLANT(label l)
	means[l]
	assembles[l ':'];  
instruction pattern PLANTRCONST( double r)
	means[loc r]
	assembles[ 'dq ' r];
instruction pattern GOTO(label l)
	means[goto l]
	assembles['jmp ' l];

instruction pattern IFGOTO(label l,reg r1,reg r2,condition c)
	means[if(c(^(r1),^(r2)))goto l]
	assembles['cmp ' r1 ','  r2 '\n j' c ' ' l]; 

instruction pattern IFLITGOTO(label l,addrform a,signed r2,condition c, type t)
	means[if(c( ^((ref t) mem(a)),const r2))goto l]
	assembles['cmp ' t '[' a ']'   ','  r2 '\n j' c ' ' l];


instruction pattern IMOD( modreg r1,reg r2)
        means[r1:= mod(^(r1),^( r2)) ]
	assembles['push eax\nmov eax,' r1 '\ncdq\ndiv   ' r2 '\npop eax']

/* \end{verbatim} */

