/* 
 MIC Xeon Phi 
*/ 
define(havesse,1)
define(mic,1)
define(bit64, 1)
define(gas,1)  /* for now we have to use a gnu assembler with the intel syntax enabled */
include(`cpus/i386base.m4')
include(`cpus/ifpu.m4') 
define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')





/*-----------------------------------------------------------*/
/* define the set of ieee32 vector registers */
define(zmmr,`register ieee32 vector (16) ZMM$1 assembles[ ' `'' `ZMM$1'`''`];
')
forloop(`i',0,7,`zmmr(i)')
define(fzmregp,`ZMM$1|')
pattern fzmreg means [ forloop(`i',0,6,`fzmregp(i)') ZMM7];

/*-------------------------------------------------------------*/
/* define the set of 512 bit int64   vector registers */

define(qzmmr,`alias register  int64 vector (8) qZMM$1=ZMM$1(0:511) assembles[ ' `'' `ZmM$1'`''`];
')
forloop(`i',0,7,`qzmmr(i)')
define(qzmregp,`qZMM$1|')
pattern qzmreg means [ forloop(`i',0,6,`qzmregp(i)') qZMM7];

 

/*-------------------------------------------------------------*/
/* define the set of ieee64 vector registers */

define(dzmmr,`alias register  ieee64 vector (8) dZMM$1=ZMM$1(0:511) assembles[ ' `'' `YMm$1'`''`];
')
forloop(`i',0,7,`dzmmr(i)')
define(dzmregp,`dZMM$1|')
pattern dzmreg means [ forloop(`i',0,6,`dzmregp(i)') dZMM7];

 

/*-------------------------------------------------------------*/
/* define the set of ieee32 scalar registers */
define(fxmmr,`alias register  ieee32 fXMM$1=ZMM$1(0:31) assembles[ ' `'' `zmm$1'`''`];
')
forloop(`i',0,7,`fxmmr(i)')
define(fxmregp,`fXMM$1|')
pattern fxmreg means [ forloop(`i',0,6,`fxmregp(i)') fXMM7];

/*-------------------------------------------------------------*/
/* define the set of int32 scalar registers */
define(fixmmr,`alias register  int32 fiXMM$1=ZMM$1(0:31) assembles[ ' `'' `zmm$1'`''`];
')
forloop(`i',0,7,`fixmmr(i)')
define(fixmregp,`fiXMM$1|')
pattern fixmreg means [ forloop(`i',0,6,`fixmregp(i)') fiXMM7];

pattern scalar32reg means[ fxmreg|fixmreg];
/*-------------------------------------------------------------*/
/* define the set of ieee64 scalar registers */
define(dxmmr,`alias register  ieee64 dXMM$1=ZMM$1(0:63) assembles[ ' `'' `zMM$1'`''`];
')
forloop(`i',0,7,`dxmmr(i)')
define(dxmregp,`dXMM$1|')
pattern dxmreg means [ forloop(`i',0,6,`dxmregp(i)') dXMM7];
/*-------------------------------------------------------------*/
/* define the set of 64 bit untyped scalar registers */
define(duxmmr,`alias register  doubleword duXMM$1=ZMM$1(0:63)	assembles[ ' `'' `zmm$1'`''`];
')
forloop(`i',0,7,`duxmmr(i)')
define(duxmregp,`duXMM$1|')
pattern duxmreg	means [ forloop(`i',0,6,`duxmregp(i)') duXMM7];
pattern doublexmreg means[dxmreg|duxmreg];
/*-------------------------------------------------------------*/

define(izmmr,` register  int32 vector (16) iZMM$1  assembles[ ' `'' `zmm$1'`''`];
')
forloop(`i',8,15,`izmmr(i)')
        define(izmregp,`iZMM$1|')
pattern i32zmreg means [ forloop(`i',8,15,`izmregp(i)') iZMM15]; 



define(bzmmr,` register  uint8 vector (64) bZMM$1  assembles[ ' `'' `zmm$1'`''`];
')
forloop(`i',8,15,`bzmmr(i)')
        define(bzmregp,`bZMM$1|')
pattern bzmreg means [ forloop(`i',8,15,`bzmregp(i)') bZMM15]; 

pattern izmreg means[i32zmreg| bzmreg]; 
pattern lizmreg means [ iZMM8|iZMM9|iZMM10|iZMM11|iZMM12 ]; 
pattern hizmreg means [  iZMM13|iZMM14|iZMM15]; 
/* define the groups of zmmreg and xmmreg types*/

 
pattern zmreg means[fzmreg|dzmreg/*|izmreg*/];

/* scalar registers */
pattern sxmreg means[dxmreg|fxmreg];
/* address and register modes */
pattern ymaddrmode means[maddrmode|zmreg];
pattern dymaddrmode means[maddrmode|dzmreg]; 
pattern smaddrmode means[maddrmode|sxmreg];
pattern fmaddrmode means[maddrmode|fxmreg];
pattern dmaddrmode means[maddrmode|dxmreg];
pattern rmaddrmode means [maddrmode|reg];
/*----------------------------------------------------------*/
/* define the k registers as being made up of 8 8 bit integers and 8 32 bit registers
this enables us to give an ilcg meaning to their semantics
and the difference in length does not matter since we will
provide on instructions to load or store them. */
define(kvr,`  register  int32 vector (16) kr$1  assembles[ ' `'' `k$1'`''`];
')
forloop(`i',2,7,`kvr(i)')
        define(kregp,`kr$1|')
        pattern kregl means [ forloop(`i',2,6,`kregp(i)') kr7];

define(kvrs,` alias register  int8 vector (16) krs$1=kr$1(0 : 127)  assembles[ ' `'' `k$1'`''`];
')
forloop(`i',2,7,`kvrs(i)')
        define(kregps,`krs$1|')
        pattern kregs means [ forloop(`i',2,6,`kregps(i)') krs7];
pattern kreg means[ kregl|kregs];

/* Operations */

operation sdiv means div assembles ['div'];
operation min means MIN assembles ['MIN'];
operation max means MAX assembles ['MAX'];
operation pand means AND assembles ['and'];
operation por means OR assembles['or'];
operation mull means * assembles['mull'];
operation adds means +: assembles['adds'];
pattern soperator means[add|mul|sdiv|sub|min|max];
pattern boperator means[add|sub|adds|min|max|pand|por];
pattern voperator means[add|sub|mul];
pattern vioperator means[add|sub|mull];
pattern coperator means[min|max];
pattern loperator means[por|pand];
pattern smoperator means[coperator|nonmultoperator];
/* these are the immediate comparison fields used in vcmpps instructions */
operation vlt means < assembles ['1'];
operation vgt means > assembles ['6'];
operation vge means >= assembles [ '5'];
operation vne means <> assembles['4'];
operation veq means = assembles ['0'];
operation vle means <= assembles ['2'];

pattern condoperator means[ vle|veq|  vge| vgt|vne|vlt];
/* Phi instructions */
/* assume register k1 permananetly used for scalar mask */
pattern ybop means[pand|por];
 instruction pattern FREP16(fzmreg r, riscaddr m)
	means[r:=rep((ieee32)^ (mem(m)),16)]
	assembles['vbroadcastss 'r ',[ ' m '];#FREP16'];
instruction pattern FREP16C(fzmreg r, float  f,type t)
	means[r:=rep( const f,16)]
	assembles[ '.data\n1:.float ' f'\n.text\n vbroadcastss 'r ',[ 1b];#FREP16C'];
  instruction pattern FREP16SP(fzmreg r)
	means[r:=rep((ieee32)POP(mainSTACK),16)]
	assembles[' vbroadcastss 'r ',[ rsp];#FREP16\n add rsp,8'];
 instruction  pattern LDqdx(basereg rm,doublexmreg r1,type t   )
    means[     r1 :=  ^(mem(  ^(  rm)))]
    assembles['vbroadcastsd  '   r1   ',  [' rm ']; #LDqdx'];

instruction  pattern STqdx(basereg rm,doublexmreg r1 ,type t )
    means[ (ref ieee64) mem(^(  rm)) := (ieee64) ^(  r1)]
    assembles['push rax\n mov	eax,1\n kmov k1,eax\n pop rax\n vpackstorelpd  ['   rm   ']{k1},' r1  ';# STqdx'];
 
 instruction  pattern LDdfx(basereg rm,scalar32reg r1  )
    means[    r1 := ^(mem(  ^(  rm)))]
    assembles['vbroadcastss  '   r1   ',  [' rm '];# LDdfx']; 
 instruction pattern LDps( addrform rm, fzmreg r1)
        means[  r1:= (ieee32 vector (16)) ^(mem(    rm))]  
        assembles[
        '\nvprefetch0 ['rm'+256]' 
        
        '\nvloadunpacklps 'r1',['rm']# LDps\nvprefetch1 ['rm'+1024]'
        '\n vloadunpackhps 'r1',['rm'+64]'
        
 

];


 pattern vreg means[fzmreg ];	
 instruction pattern STp(addrform rm,vreg r1)
        means[ (ref ieee32 vector(16))mem(   rm):= ^(r1)]
      /*  assembles['vmovaps ['rm'],'r1];*/
          assembles['vpackstorelps ['rm'],'r1' #STp\n vpackstorehps ['rm'+64],'r1];
instruction pattern STpi(addrform rm,izmreg r1)
          means[ mem(   rm):= ^(r1)]
          
          assembles['vpackstoreld ['rm'],'r1' #STpi\n vpackstorehd ['rm'+64],'r1];         
          
 
instruction  pattern STdfx(addrform rm,scalar32reg r1 ,word32 t )
	means[  (ref t) mem(rm) :=  ^(  r1)]
    assembles['mov	r11d,1\n kmov k1,r11d\n vpackstorelps  ['  rm   ']{k1},' r1';# STdfx'];

instruction pattern VTRUNCS(fxmreg r1, fxmreg r2)
	means[ r1:=(ieee32)FLOAT(TRUNCATE(^(r2)))]
	assembles['vrndfxpntps 'r1','r2',3']; 
 instruction pattern VTRUNCS2(fixmreg r1, fxmreg r2)
	means[ r1:=(int32)TRUNCATE(^(r2))]
	assembles['vcvtfxpntps2dq  'r1','r2',3'];
 instruction pattern VFLOATS2(fixmreg r1, fxmreg r2)
	means[ r2:= FLOAT(^(r1))]
	assembles['vcvtfxpntdq2ps  'r1','r2',0'];
instruction pattern VTRUNCS4(  dxmreg r2)
	means[ PUSH(mainSTACK,(int32)TRUNCATE(^(r2)))]
	assembles['vcvtfxpntpd2dq  'r2','r2',3\n'    
	          
	          '\n mov	r11d,1'
	          '\n kmov k1,r11d'  
	          '\n sub	rsp,    8'
	          '\n vpackstorelps  [rsp]{k1},' r2';# VTRUNCS3'];
 instruction pattern VTRUNCS3(  fxmreg r2)
	means[ PUSH(mainSTACK,(int32)TRUNCATE(^(r2)))]
	assembles['vcvtfxpntps2dq  'r2','r2',3\n'    
	          
	          '\n mov	r11d,1'
	          '\n kmov k1,r11d'  
	          '\n sub	rsp,    8'
	          '\n vpackstorelps  [rsp]{k1},' r2';# VTRUNCS3'];
instruction pattern CLOADSS( scalar32reg r, addrform rm)
	means[r:= (ieee32 ) ^(mem(     rm))]
	assembles['vbroadcastss 'r',['rm'] ;# CLOADSS'];
 
instruction pattern CPOPSS(scalar32reg r,type t)
	means[(ref t)r:=(t)POP(mainSTACK)]
	assembles['vbroadcastss ' r', [rsp];#CPOPSS\n add rsp,8'];
instruction pattern CPOPSD(dxmreg r,type t)
	means[(ref t)r:=(t)POP(mainSTACK)]
	assembles['vbroadcastsd ' r', [rsp];#CPOPSD\n add rsp,8'];
instruction  pattern CPUSHSS( scalar32reg r1  )
	means[   PUSH(mainSTACK, (ieee32)  ^(  r1))]
    assembles['push rax     \t#CPUSHSS\n mov	eax,1\n kmov k1,eax\nmov rax,[rsp]\n vpackstorelps  [rsp]{k1},' r1';\t# cpushssend'];
instruction pattern VSSOP( scalar32reg r1, scalar32reg r2,scalar32reg r3,voperator op)
	means [r1:=op(^(r2),^(r3))]
	assembles['v'op'ps 'r1','r2','r3' ;#VSSOP'];
instruction pattern VPSOP( fzmreg r1, fzmreg r2,fzmreg r3,voperator op)
	means [r1:=op(^(r2),^(r3))]
	assembles['v'op'ps 'r1','r2','r3' ;#VPSOP'];
instruction pattern VPSDIV( fzmreg r1, fzmreg r2,fzmreg r3,voperator op)
	means [r1:=div(^(r2),^(r3))]
	assembles[
	'vrcp23ps 'r1','r3' \n' /* use reciprocals as there is no divide */
	'vmulps 'r1','r2','r1' ;#VPSDIV'];
instruction pattern VSMIN(fxmreg r1, fxmreg r2, fxmreg r3) 
	means[r1:= MIN(^(r2),^(r3))]
	assembles['vcmpps k1,'r2','r3',1;;#compare less than\n'
	           ' vblendmps 'r1'{k1},'r3','r2';#VSMIN'];
instruction pattern VSMAX(fxmreg r1, fxmreg r2, fxmreg r3) 
	means[r1:= MAX(^(r2),^(r3))]
	assembles['vcmpps k1,'r2','r3',1;;#compare less than\n'
	           ' vblendmps 'r1'{k1},'r2','r3';#VSMAX'];
		   
instruction pattern VPSMIN(fzmreg r1, fzmreg r2, fzmreg r3) 
	means[r1:= MIN(^(r2),^(r3))]
	assembles['vcmpps k1,'r2','r3',1;;#compare less than\n'
	           ' vblendmps 'r1'{k1},'r3','r2';#VPSMIN'];
instruction pattern VPSMAX(fzmreg r1, fzmreg r2, fzmreg r3) 
	means[r1:= MAX(^(r2),^(r3))]
	assembles['vcmpps k1,'r2','r3',1;;#compare less than\n'
	           ' vblendmps 'r1'{k1},'r2','r3';#VPSMAX'];
instruction pattern VFMADDPS2(fzmreg r1, fzmreg r2, fzmreg r3) 
	means[r1:= +(*(^(r1),^(r2)),^(r3))]
	assembles['vfmadd213ps ' r1 ',' r2 ',' r3];
instruction pattern VFMADDPS(fzmreg r1, fzmreg r2, fzmreg r3) 
	means[r1:= +(^(r1),*(^(r2),^(r3)) )]
	assembles['vfmadd231ps ' r1 ',' r2 ',' r3];
 
instruction pattern VSDOP( doublexmreg r1, doublexmreg r2,doublexmreg r3,voperator op)
	means [r1:=op(^(r2),^(r3))]
	assembles['v'op'pd 'r1','r2','r3];
instruction pattern VBLENDMPS(fzmreg r1, fzmreg r2, fzmreg r3, kreg k)
        means[r1:=OR(AND(^(r3),^(k)),AND(NOT(^(k)),^(r2)))]
        assembles['vblendmps 'r1' {'k'},'r2','r3];
instruction pattern VCMPPS(fzmreg r1, fzmreg r2,  kreg k,condoperator compare)
	means[k:=(int32 vector (16))EXTEND(compare(^(r1),^(r2)))]
	assembles ['vcmpps 'k','r1','r2','compare];
instruction pattern VCMPPSne(fzmreg r1, fzmreg r2,  kreg k,condoperator compare)
	means[k:= compare(^(r1),^(r2))]
	assembles ['vcmpps 'k','r1','r2','compare];
instruction pattern KNOT(kreg k, kreg k2)
        means[k:=NOT(^(k2))]
        assembles['knot ' k','k2];
 instruction pattern KAND(kreg k, kreg k2)
        means[k:=AND(^(k),^(k2))]
        assembles['kand ' k','k2];
instruction pattern KOR(kreg k, kreg k2)
        means[k:=OR(^(k),^(k2))]
        assembles['kor ' k','k2];
instruction pattern KXOR(kreg k, kreg k2)
        means[k:=XOR(^(k),^(k2))]
        assembles['kxor ' k','k2];
instruction pattern KXT(kreg k, kreg k2)/* remove spurious extends in frount of k reg expressions */
        means[k:=EXTEND( ^(k2))]
        assembles['kmov ' k ',' k2  ];
        
instruction pattern VMOVDQAR32(izmreg r0,izmreg r1)
        means[ r0:=^(r1)]
        assembles['vmovdqa32 'r0','r1];
instruction pattern DREP16(izmreg r, riscaddr m)
	means[r:=rep((int32)^ (mem(m)),16)]
	assembles[ 'vbroadcastss 'r ',[ ' m '];#DREP16'];
instruction pattern LDRANGE0to15(izmreg r)
	means [ r:= RANGE(0,15)]
	assembles[
	'.data\n.align 64\n'
	'2: .long 0\n .long 1\n .long 2\n .long 3\n .long 4\n .long 5\n .long 6 \n .long 7\n '
	' .long 8\n .long 9\n .long 10\n .long 11\n .long 12\n .long 13\n .long 14 \n .long 15\n '
	'.text\n'
	'\nvmovaps 'r',[2b]'];
instruction pattern DREPR16(izmreg r, int32reg r2) 
	means[r:=rep((int32)^ (r2),16)]
	assembles['sub rsp,8\n   \n mov [rsp],'r2' \n vbroadcastss 'r ',[ rsp]\n add rsp,8;#DREPR16'];
instruction pattern DREPR16C(izmreg r, intupto32 r2) 
	means[r:=rep(  const r2,16)]
	assembles['.data\n2:.long 'r2 '\n.text\n \n vbroadcastss 'r ',[ 2b]#DREPR16C'];
instruction pattern DREPF16C(zmreg r, real r2) 
	means[r:=rep(  const r2,16)]
	assembles['.data\n2:.float 'r2 '\n.text\n \n vbroadcastss 'r ',[ 2b]#DREPR16C'];
	
instruction pattern VPDOP( i32zmreg r1, i32zmreg r2,i32zmreg r3,vioperator op)
	means [r1:=op(^(r2),^(r3))]
	assembles['vp'op'd 'r1','r2','r3' ;#VPDOP'];
instruction pattern VPDOPL( izmreg r1, izmreg r2,izmreg r3,loperator op)
	means [r1:=op(^(r2),^(r3))]
	assembles['vp'op'd 'r1','r2','r3' ;#VPDOPl'];
	
instruction pattern VPANDND( izmreg r1, izmreg r2,izmreg r3)
	means [r1:=AND(^(r3),NOT(^(r2)))]
	assembles['vpandnd 'r1','r2','r3' ;#VPDOP'];
instruction pattern VGATHERDPS(fzmreg v0, izmreg v1, basereg rm)
        means  [v0:=(ieee32 vector ( 16 ))
             ^(mem(+(*((int32 vector ( 16 ))^(v1),4) , ^(rm))))]
        assembles[' knot k1,k0 \n 1:vgatherdps ' v0 '{k1},[' rm '+' v1 '*4 ]\n' 
                  '  jkzd k1, 2f\n'
                  '  vgatherdps ' v0 '{k1},[' rm '+' v1 '*4 ]\njknzd k1,1b#VGATHERDPS\n2:'];
instruction pattern VGATHERD(lizmreg v0, hizmreg v1, basereg rm)
        means  [v0:=
        ^(mem(+(*((int32 vector ( 16 ))^(v1),4) , ^(rm))))]
        assembles[' knot k1,k0 \n 1:vgatherdps ' v0 '{k1},[' rm '+' v1 '*4 ]\njknzd k1,1b#VGATHERD'];
instruction pattern VGATHERPAIRDPS(fzmreg v0, izmreg v1,izmreg v2, basereg rm)
        means  [v0:=(ieee32 vector ( 16 ))
             ^(mem(+(*((int32 vector ( 16 ))^(v1),4),+(*((int32 vector ( 16 ))^(v2),4) , ^(rm)))))]
             assembles[' vpaddd 'v1 ', '  v1', 'v2'\n knot k1,k0 \n 1:vgatherdps ' v0 '{k1},[' rm '+' v1 '*4 ]\n' 
             '  jkzd k1, 2f\n'
             '  vgatherdps ' v0 '{k1},[' rm '+' v1 '*4 ]\njknzd k1,1b#VGATHERPAIRDPS \n2:'];
instruction pattern LDpdw( addrform rm, izmreg r1,type t)
        means[ (ref t)r1:= (t)  ^(mem(     rm))]      
        assembles['vloadunpackld 'r1',['rm']# LDpdw\n vloadunpackhd 'r1',['rm'+64]'  '\nvprefetch1 ['rm'+256]' '\nvprefetch0 ['rm'+128]'  ];
       
 define(ZINTcodes,VPDOPL|VPANDND| VPDOP|DREPR16C|DREPF16C|  DREP16| DREPR16|LDRANGE0to15| VGATHERDPS|VGATHERPAIRDPS| VGATHERD| LDpdw |VMOVDQAR32)



/* ------------------------------------------------------------------------------------------------------
                                          tree transformation rules 
   ------------------------------------------------------------------------------------------------------*/
pattern val32 means[int32|ieee32];
pattern scalarint means[int32];
transformer pattern repscalar ( any i,any v, val32 t)
        /* this specifies that any scalar must be replicated 16 times in the parallel version */
		means[(t) v]
		returns[rep( v.in,16)] 
		precondition [ NOT( CONTAINS(v.in, i.in))];
transformer pattern indbare(any i)means[^(i)]returns[^(i.in)];
transformer pattern ind64 (any i, indbare ib)means[EXTEND(ib[i])] returns[EXTEND(ib.out)];
pattern optext means[indbare|ind64];
transformer pattern ind32(any i,any a)/* removes extends from any int32s */
	means[EXTEND(a)] returns[a.in];
transformer pattern not4index(any i ,ind32 b, scalarint s)
	means[*(b[i],   s)]
	returns [ *(*(+(rep(b.out,16),RANGE(0,15)),rep((int32)div(s.in,4),16)),4)]
	precondition[CONTAINS(b.in,i.in)];
transformer pattern bscaledindex(any i,optext b)
	means[*(b[i],4)]
	returns[*(b.in,4)];
transformer pattern escaledindex(any i, bscaledindex b)
	means[EXTEND(b[i])]
	returns[EXTEND(b.in)]; 
pattern vscaledindex; /* declared forward here */
transformer pattern indexplusreg(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[+( j[i],r)]
        returns[+(  j.out,r.in)]
        precondition [ NOT( CONTAINS(r.in, i.in))];
  
pattern vscaledindex means[escaledindex|bscaledindex|indexplusreg]/*|revindexdyad]*/;
transformer pattern vecdesti(any i,any r, vscaledindex j)
/* this rule recognises addresses that can be readily converted to vector addresses */
means[(ref int32)mem((int64)+(r, j[i]))]
returns[mem(+(  j.in,r.in),  int32 vector(16))]
precondition [ NOT( CONTAINS(r.in, i.in))];
 
transformer pattern vecdestr(any i,any r, vscaledindex j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[(ref ieee32)mem((int64)+(r, j[i]))]
        returns[mem(+(  j.out,r.in),  ieee32 vector(16))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
pattern vecdest means[vecdestr  | vecdesti];
pattern gatheralt;
transformer pattern  gatherindex(any i, any r)
		/* this recognises indices that are themselves vectors */
	means[(int32)^(mem((int64)+(r, *(EXTEND(^(i)),4))))]
	returns[ ^(mem(+(   *(^(i.in),4),r.in), int32 vector(16)))]
	precondition [ NOT( CONTAINS(r.in, i.in))];
transformer pattern gatherdyad(any i,any r, gatheralt j)
		/* this rule recognises addresses that can be readily converted to vector addresses */
        means[+( j[i],(int32)r)]
        returns[+(  j.out,rep(r.in,16))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
        
transformer pattern vectorisablalternatives;
pattern gatheralt means[gatherindex| gatherdyad|vectorisablalternatives ];
transformer pattern gatherreca (any i, gatheralt j)
        means[*((int64)EXTEND(j[i]),4)]
        returns[*(  j.out ,4)];
pattern gatherrecb;
transformer pattern gatherrecc(any i, any r, gatherrecb j)
	means[+(j[i],r)]
	returns[+(j.out,r.in)]
	precondition [ NOT( CONTAINS(r.in, i.in))];
pattern gatherrecb means[gatherrecc | gatherreca|not4index];
transformer pattern gatheredsrcr(any i , any r, gatherrecb j)
        means[(ieee32)^(mem(+(j[i],r)))]
        returns[^(mem(+(r.in,   j.out),ieee32 vector(16)))]
	precondition [ NOT( CONTAINS(r.in, i.in))];
transformer pattern gatheredsrcrev(any i , any r, gatherrecb j)
        means[(ieee32)^(mem(+(r,j[i])))]
        returns[^(mem(+(r.in,   j.out),ieee32 vector(16)))]
	precondition [ NOT( CONTAINS(r.in, i.in))];      
transformer pattern gatheredsrci(any i , any r, gatherrecb j)
        means[(int32)^(mem(+(j[i],r)))]
        returns[^(mem(+(r.in,   j.out),int32 vector(16)))]
        precondition [ NOT( CONTAINS(r.in, i.in))];
        pattern gatheredsrc means[gatheredsrcr|gatheredsrcrev|gatheredsrci];
transformer pattern  vecsrcr(any i,vecdest d)
	means[(ieee32)^(d[i])]
	returns [(ieee32 vector (16))^(d.out)];
transformer pattern  vecsrci(any i,vecdest d)
        means[(int32)^(d[i])]
        returns [(int32 vector (16))^(d.out)];
pattern vecsrc means [vecsrcr |vecsrci];
transformer pattern vectorisabledyad(any i,vectorisablalternatives a,vectorisablalternatives b,operator op)
	means[op(a[i],b[i])]
	returns [op.in(a.out,b.out)];
transformer pattern vectorisablemonad(any i,vectorisablalternatives a, operator op)
	means[function op(a[i])]
	returns [function op.in(a.out)];
        
transformer pattern castalternativer(any i, vectorisabledyad a)
        means[(ieee32) a[i]]
        returns [(ieee32 vector (16))a.out];
transformer pattern castalternativei(any i, vectorisablalternatives a)
	means[(int32) a[i]]
	returns [(int32 vector (16))a.out];

       
pattern castalternative means[castalternativer | castalternativei];

pattern vectorisablalternatives means[vecsrc|vectorisabledyad|vectorisablemonad|repscalar|castalternativer| gatheredsrc];
transformer pattern vectorisablefor ( any i, any  start, any   finish,   vecdest lhs,vectorisablalternatives rhs)
	means[for (ref int32)i:=start to finish step 1 do
              lhs[  i   ] := rhs[ i ] ]
    returns[statement(for i.in:=  +(+(-(*(div(+(1,-(finish.in,start.in)), 16), 16  ),1), start.in),1)  
                      to finish.in step 1 do lhs.in := rhs.in ,
                for i.in:= start.in to +(-(*(div(+(1,-(finish.in,start.in)), 16), 16  ),1), start.in) step 16 do
                lhs.out := rhs.out 
    )]; 
  
transformer pattern accumulatorfor ( any i, any  start, any   finish,   any lhs,vectorisablalternatives rhs)
	means[for (ref int32)i:=start to finish step 1 do 
    (ref ieee32)  lhs :=(ieee32) +((ieee32)^(lhs),rhs[ i ])]
    returns[statement(
    for i.in:=  +(+(-(*(div(+(1,-(finish.in,start.in)), 16), 16  ),1), start.in),1)  
                      to finish.in step 1 do lhs.in := +(^(lhs.in
                      ),rhs.in ),
              statement(/*initialise temporary vector on stack */
                 statement( RSP:=-(^(RSP),64), 
                   statement(i.in := start.in, mem(^(RSP),ieee32 vector(16)):=rhs.out)),
                                 
               statement( /* do the main vector arithmetic */
                 for i.in:= +(start.in,16)to +(-(*(div(+(1,-(finish.in,start.in)), 16), 16  ),1), start.in) step 16 do
                    mem(^(RSP),ieee32 vector(16)):= +((ieee32 vector (16))^(mem(^(RSP),ieee32 vector(16))),rhs.out) ,
                         
                statement(
                 for i.in:= 0 to 60 step 4 do /* add up the temporary vector */
                  lhs.in:=+(^(mem(+(^(i.in),^(RSP)),ieee32)),^(lhs.in))
                 ,
                RSP:=+(^(RSP),64)
               ))))]; 
 
transformer [vectorisablefor/*| accumulatorfor*/ ]; 

/* operates come before stores, come before moves, come before pushes */
define(ZMMXcodes,
/* ZMMX codes*/ 

FREP16C| 
FREP16| 
STp| 
VSSOP|
KNOT|
KAND|
KOR|
KXOR|
VPSDIV|
VFMADDPS|
VFMADDPS2|
VPSOP| 
VCMPPS| 
VCMPPSne|
VBLENDMPS|
CLOADSS|
LDps| 
VSDOP| 
VPSMIN|
VPSMAX|
VTRUNCS|
VFLOATS2  |
VTRUNCS2|
VTRUNCS3| 
VTRUNCS4|  
STqdx|  
STpi| 
STdfx|
CPUSHSS | 
CPOPSD  |
FREP16SP|KXT|
CPOPSS
	)
 




instructionset [

 LEA|
LDps| 
ZINTcodes|
STp| 
VFMADDPS| 
IA32codes 
 
 |NONNULMOV
 |STdfx
 /*|ZLOADLIT*/
 |INTMIN
 |INTMAX
 |FSTRF
 |FSTR
 |FSET64
 |VTRUNCS3
 |lastIA32codes  
 |fpucodes |fpupushes

 |CPUSHSS/*s goes here to make sure we have a quick way of transfering a scalar z reg into the fpu*/
 |fpupushes
  |VSSOP
  |STqdx |ZMMXcodes 
]

 
