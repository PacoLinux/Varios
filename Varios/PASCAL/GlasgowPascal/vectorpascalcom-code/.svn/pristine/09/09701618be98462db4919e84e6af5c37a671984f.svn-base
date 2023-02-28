define(`forloop',
            `pushdef(`$1', `$2')_forloop(`$1', `$2', `$3', `$4')popdef(`$1')')
define(`_forloop',
            `$4`'ifelse($1, `$3', ,
                   `define(`$1', incr($1))_forloop(`$1', `$2', `$3', `$4')')')





/*-----------------------------------------------------------*/
/* define the set of ieee32 vector registers */
define(ymmr,`register ieee32 vector (8) YMM$1 assembles[ ' `'' `YMM$1'`''`];
')
forloop(`i',0,6,`ymmr(i)')

reserved register ieee32 vector (8) YMM7 assembles[  ' YMM7'];
define(fymregp,`YMM$1|')
pattern fymreg means [ forloop(`i',0,6,`fymregp(i)') YMM7];
/*-------------------------------------------------------------*/
/* define the set of 256 bit int32 mask vector registers */

define(iymmr,`alias register  int32 vector (8) iYMM$1=YMM$1(0:255) assembles[ ' `'' `yMM$1'`''`];
')
forloop(`i',0,7,`iymmr(i)')
define(iymregp,`iYMM$1|')
pattern iymreg means [ forloop(`i',0,6,`iymregp(i)') iYMM7];
pattern indy means [ forloop(`i',4,6,`iymregp(i)') iYMM7];
pattern destiy means [ forloop(`i',0,3,`iymregp(i)') iYMM4];
pattern destfy means [ forloop(`i',0,3,`fymregp(i)') YMM4];
/*-------------------------------------------------------------*/
/* define the set of 256 bit int64 mask vector registers */

define(qymmr,`alias register  int64 vector (4) qYMM$1=YMM$1(0:255) assembles[ ' `'' `YmM$1'`''`];
')
forloop(`i',0,7,`qymmr(i)')
define(qymregp,`qYMM$1|')
pattern qymreg means [ forloop(`i',0,6,`qymregp(i)') qYMM7];

/*-------------------------------------------------------------*/
/* define the set of ieee64 vector registers */

define(dymmr,`alias register  ieee64 vector (4) dYMM$1=YMM$1(0:255) assembles[ ' `'' `YMm$1'`''`];
')
forloop(`i',0,7,`dymmr(i)')
define(dymregp,`dYMM$1|')
pattern dymreg means [ forloop(`i',0,6,`dymregp(i)') dYMM7];

/*-------------------------------------------------------------*/
define(xmmr,`alias register  quadword XMM$1=YMM$1(0:127) assembles[ ' `'' `XMM$1'`''`];
')
forloop(`i',0,7,`xmmr(i)')

/*-------------------------------------------------------------*/
/* define the set of int32 scalar registers */
define(isxmmr,`alias register  int32 isXMM$1=YMM$1(0:31) assembles[ ' `'' `xmm$1'`''`];
')
forloop(`i',0,7,`isxmmr(i)')
define(isxmregp,`isXMM$1|')
pattern isxmreg means [ forloop(`i',0,6,`isxmregp(i)') isXMM7];


/*-------------------------------------------------------------*/
/* define the set of ieee32 scalar registers */
define(fxmmr,`alias register  ieee32 fXMM$1=YMM$1(0:31) assembles[ ' `'' `xmm$1'`''`];
')
forloop(`i',0,7,`fxmmr(i)')
define(fxmregp,`fXMM$1|')
pattern fxmreg means [ forloop(`i',0,6,`fxmregp(i)') fXMM7];

/*-------------------------------------------------------------*/
/* define the set of ieee64 scalar registers */
define(dxmmr,`alias register  ieee64 dXMM$1=YMM$1(0:63) assembles[ ' `'' `xMM$1'`''`];
')
forloop(`i',0,7,`dxmmr(i)')
define(dxmregp,`dXMM$1|')
pattern dxmreg means [ forloop(`i',0,6,`dxmregp(i)') dXMM7];
/*-------------------------------------------------------------*/
/* define the set of 64 bit untyped scalar registers */
define(duxmmr,`alias register  doubleword duXMM$1=YMM$1(0:63)	assembles[ ' `'' `xmm$1'`''`];
')
forloop(`i',0,7,`duxmmr(i)')
define(duxmregp,`duXMM$1|')
pattern duxmreg	means [ forloop(`i',0,6,`duxmregp(i)') duXMM7];
pattern doublexmreg means[dxmreg|duxmreg];
/*-------------------------------------------------------------*/
/* define the set of int32 vector  registers */
define(ixmmr,`alias register  int32 vector (4) iXMM$1=YMM$1(0:127) assembles[ ' `'' `XmM$1'`''`];
')
forloop(`i',0,7,`ixmmr(i)')
define(ixmregp,`iXMM$1|')
pattern ixmreg means [ forloop(`i',0,6,`ixmregp(i)') iXMM7];

/*-------------------------------------------------------------*/
/* define the set of int16 vector  registers */
define(sxmmr,`alias register  int16 vector (8) sXMM$1=YMM$1(0:127) assembles[ ' `'' `XMm$1'`''`];
')
forloop(`i',0,7,`sxmmr(i)')
define(sxmregp,`sXMM$1|')
pattern swxmreg means [ forloop(`i',0,6,`sxmregp(i)') sXMM7];

/*-------------------------------------------------------------*/
/* define the set of uint16 vector  registers */
define(usxmmr,`alias register  uint16 vector (8) usXMM$1=YMM$1(0:127) assembles[ ' `'' `xmM$1'`''`];
')
forloop(`i',0,7,`usxmmr(i)')
define(usxmregp,`usXMM$1|')
pattern uwxmreg means [ forloop(`i',0,6,`usxmregp(i)') usXMM7];

/*-------------------------------------------------------------*/
/* define the set of byte vector  registers */
define(sbxmmr,`alias register  int8 vector (16) bXMM$1=YMM$1(0:127) assembles[ ' `'' `xMm$1'`''`];
')
forloop(`i',0,7,`sbxmmr(i)')
define(sbxmregp,`bXMM$1|')
pattern sbxmreg means [ forloop(`i',0,6,`sbxmregp(i)') bXMM7];

/*-------------------------------------------------------------*/
/* define the set of unsigned byte vector  registers */

define(ubxmmr,`alias register  uint8 vector (16) ubXMM$1=YMM$1(0:127) assembles[ ' `'' ` XMM$1'`''`];
')
forloop(`i',0,7,`ubxmmr(i)')
define(ubxmregp,`ubXMM$1|')
pattern ubxmreg means [ forloop(`i',0,6,`ubxmregp(i)') ubXMM7];

/* define the groups of ymmreg and xmmreg types*/

pattern xmreg means[ ubxmreg|sbxmreg|uwxmreg|swxmreg|ixmreg];
pattern ymreg means[fymreg|dymreg|iymreg];

/* scalar registers */
pattern sxmreg means[xmreg|fxmreg];
/* address and register modes */
pattern ymaddrmode means[maddrmode|ymreg];
pattern dymaddrmode means[maddrmode|dymreg];
pattern xmaddrmode means[maddrmode|xmreg];
pattern smaddrmode means[maddrmode|sxmreg];
pattern fmaddrmode means[maddrmode|fxmreg];
pattern dmaddrmode means[maddrmode|dxmreg];
pattern rmaddrmode means [maddrmode|reg];

/* Operations */

operation sdiv means div assembles ['div'];
operation min means MIN assembles ['MIN'];
operation max means MAX assembles ['MAX'];
operation pand means AND assembles ['and'];
operation por means OR assembles['or'];
operation adds means +: assembles['adds'];

operation mull means * assembles['mull'];
pattern soperator means[add|mul/*|sdiv*/|sub|min|max];/* div seems to give wrong answer so exclude it from this set */
pattern boperator means[add|sub|adds|min|max|pand|por];

 
pattern coperator means[min|max ];
pattern loperator means[por|pand];
pattern smoperator means[coperator|nonmultoperator];
operation vlt means < assembles ['lt'];
operation veq means = assembles ['eq'];
operation vle means <= assembles ['le'];

pattern condoperator means[ vle|veq| vlt];
/* AVX instructions */
pattern ybop means[pand|por];
instruction pattern XDBOOL(ybop op, doublexmreg rm,doublexmreg r1, doublexmreg r2)
    means[r1 :=op( ^( r2),^(  rm))]
    assembles['vp' op '  '    r1 ',' r2 ',' rm '; '];
 
instruction pattern XBOOL(ybop op,  xmreg rm, xmreg r1,  xmreg r2)
    means[r1 :=op( ^( r2),^(  rm))]
    assembles['vp' op '  '    r1 ',' r2 ',' rm '; '];
instruction pattern XPANDNSD(doublexmreg m, doublexmreg ma,doublexmreg m2)
	means[m := AND(NOT(^(m2)),^(ma))]
	assembles ['vpandn 'm ','m2',' ma];

instruction pattern XPANDNPD(xmreg m, dxmreg ma, xmreg m2)
	means[m := AND(NOT(^(m2)),^(ma))]
	assembles ['vpandn 'm ','m2',' ma];

instruction pattern XPANDNP(xmreg m, xmreg ma, xmreg m2)
        means[m := AND(NOT(^(m2)),^(ma))]
        assembles ['vpandn 'm ','m2',' ma];


changequote(`<',`>')

define(cmppat,
instruction  pattern CMP$1$2($3operator op, $4maddrmode rm,$7mreg r1, $5mreg r2 )
	means[    r1 :=EXTEND(op(  ^( r2), ^(  rm)))]
    assembles['v$6cmp'op '$1$2  '   r1 <','> r2 <','> rm '; CMP$1$2' ];
)

define(stpat,
instruction  pattern ST$1$2$3(maddrmode rm<,>$3mreg r1  )
	means[    rm :=  ^(  r1)]
    assembles['vmov$1$4  '   rm   <','> r1 '; ST$1$2$3'];
)
define(ldpat,
instruction  pattern LD$1$2$3($2maddrmode rm<,>$3mreg r1  )
	means[    r1 :=   ^(  rm)]
    assembles['vmov$1$4  '   r1   <','> rm '; LD$1$2$3'];
)
define(oppat,
instruction  pattern OP$1$2($3operator op, $4maddrmode rm,$5mreg r1, $5mreg r2, type t)
    means[(ref t)r1 :=(t)op((t) ^( r2),(t)^(  rm))]
    assembles['v$6' op '$1$2  '    r1 <','> r2 <','> rm '; OP$1$2'];
)
define(loppat,
instruction  pattern OP$1$2($3operator op, $4maddrmode rm,$5mreg r1, $5mreg r2, type t)
    means[(ref t)r1 :=(t)op((t) ^( r2),(t)^(  rm))]
    assembles['v$6' op '  '    r1 <','> r2 <','> rm '; OP$1$2'];
)
changequote()
instruction  pattern LDqdx(maddrmode rm,doublexmreg r1,type t   )
	means[   (ref ieee64)  r1 :=    ^(  rm)]
    assembles['vmovq  '   r1   ',' rm '; LDqdx'];

instruction  pattern STqdx(maddrmode rm,doublexmreg r1 ,type t )
	means[ (ref ieee64)   rm := (ieee64) ^(  r1)]
    assembles['vmovq  '   rm   ',' r1 '; STqdx'];
oppat(s,s,s,s,fx)
oppat(s,d,s,d,dx)
oppat(b, ,b,x,sbx,p)
oppat(w, ,b,x,swx,p)
oppat(d, ,s,x,ix,p)
/* avx2 */ instruction  pattern OPd2(nonmultoperator op, ymaddrmode rm,iymreg r1, iymreg r2, type t)
    means[(ref t)r1 :=(t)op((t) ^( r2),(t)^(  rm))]
    assembles['vp' op 'd  '    r1 ',' r2 ',' rm '; OPd2'];

loppat(b,lu,l,x,ubx,p)
oppat(b,u,b,x,ubx,p)
oppat(w,u,b,x,uwx,p)
oppat(p,d,s,y,dy)
oppat(p,s,s,y,fy)

ldpat(d,,fx,,word)
stpat(d,,fx,)
ldpat(dq,,x,u)
stpat(dq,,x,u)
cmppat(p,s,cond,y,fy,,y)

/* avx2 */cmppat(p,l,cond,y,iy,,iy)
ldpat(dq,y,y,u)
stpat(dq,y,y,u)
cmppat(p,d,cond,y,dy,,y)
instruction  pattern CMPsd(condoperator op, doublexmreg rm,doublexmreg r1, dxmreg r2 )
	means[    r1 :=EXTEND(op(  ^( r2), ^(  rm)))]
    assembles['vcmp'op 'sd  '   r1 ',' r2 ',' rm '; CMPsd' ];
ldpat(dq,dy,y,u)
stpat(dq,dy,y,u)

define(OPins, OPsd|OPss|OPb|OPw|OPd|OPbu|OPwu|OPps|OPpd|CMPps|CMPpd|CMPsd|OPblu|OPbu)
define(LDins, LDqdx|LDdfx|LDdqx|LDdqyy|LDdqdyy)

define(STins, STqdx|STdfx|STdqx|STdqyy|STdqdyy)

operation slt means < assembles ['lt'];
operation sle means <= assembles ['le'];
operation seq means = assembles ['eq'];
pattern scmp means [ slt|sle|seq];


pattern nonlog means [add|sub|min|max];
instruction pattern SSQRT(fxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtss 'r','r];
instruction pattern SDSQRT(dxmreg r)
	means [ r:= SQRT(^(r))]
	assembles['sqrtsd 'r','r];
instruction pattern PSSQRT(fymreg r,ymaddrmode m)
	means [ r:= SQRT((ieee32 vector(8))^(m))]
	assembles['vsqrtps 'r','m];
instruction pattern PDSQRT(dymreg r,ymaddrmode m)
	means [ r:= SQRT((ieee32 vector (8))^(m))]
	assembles['vsqrtpd 'r','m];
define(SQRTins,SSQRT|SDSQRT|PSSQRT|PDSQRT)

/* fma instructions */

instruction  pattern VFMADD132PS(  ymaddrmode ym2,fymreg y0, fymreg y1, type t)
    means[(ref t)y0 :=+(*((t) ^( y0),(t)^(  ym2)),^(y1))]
    assembles['VFMADD132PS   '    y0 ',' y1 ',' ym2 ];
instruction  pattern VFMADD213PS(  ymaddrmode ym2,fymreg y0, fymreg y1, type t)
    means[(ref t)y0 :=+(*((t) ^( y0),(t)^(  y1)),^(ym2))]
    assembles['VFMADD213PS   '    y0 ',' y1 ',' ym2 ];
instruction  pattern VFMADD231PS(  ymaddrmode ym2,fymreg y0, fymreg y1, type t)
    means[(ref t)y0 :=+(*((t) ^( y1),(t)^(  ym2)),^(y0))]
    assembles['VFMADD231PS   '    y0 ',' y1 ',' ym2 ];

define(FMAps, VFMADD213PS|VFMADD132PS|VFMADD231PS)
/* compares */
instruction pattern COMISSIFGOTO(label l,fxmreg r1,fxmreg r2,fcondition c,int t)
	means[if((t)c(^(r1),^(r2)))goto l]
	assembles['vcomiss ' r1 ','  r2 '\n j' c '  near  ' l];
instruction pattern COMISS(fcondition c,fxmreg r1,fxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['vcomiss  'r1 ',' r2 '\n set'c ' ' r];

instruction pattern COMISDIFGOTO(label l,dxmreg r1,dxmreg r2,fcondition c,int t)
	means[if((t)c(^(r1),^(r2)))goto l]
	assembles['vcomisd  ' r1 ','  r2 '\n j' c ' near  ' l];
instruction pattern COMISD(fcondition c,dxmreg r1,dxmreg r2, breg r)
	means[(ref uint8)r:=(uint8) c(^(r1),^(r2))]
	assembles['vcomisd 'r1 ',' r2 '\n set'c ' ' r];


instruction pattern XRDLOADLIT(real f,real t,dxmreg r1)
	means[ (ref ieee64)r1:=(t)const f]
	assembles['xrdloadlit 'r1','f];
instruction pattern XRLOADLIT(float f,float t,sxmreg r1)
	means[ (ref ieee32)r1:=(t)const f]
	assembles['xrloadlit 'r1','f];
instruction  pattern CVTSS2SI( int32reg r1,fxmreg r0)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee32)^(  r0))]
    	assembles['vcvtss2si  '    r1 ', ' r0];
instruction  pattern CVTSD2SI( dxmreg rm,int32reg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
    	assembles['vcvtsd2si  '    r1 ', ' rm];
    	instruction  pattern CVTTSS2SI(int32reg r1,fxmreg r0)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee32)^(  r0))]
    	assembles['vcvttss2si  '    r1 ', ' r0];
instruction  pattern CVTTSD2SI( dxmreg rm,int32reg r1)
        means[ (ref int32) r1 :=(int32)TRUNCATE((ieee64)^(  rm))]
    	assembles['vcvttsd2si  '    r1 ', ' rm];
instruction  pattern CVTSI2SD( int32reg rm,dxmreg r1)
        means[ (ref ieee64) r1 :=(ieee64)FLOAT((int32)^(  rm))]
    	assembles['vcvtsi2sd  '    r1 ', dword ' rm];
instruction  pattern CVTSI2SS( maddrmode rm,fxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  rm))]
    	assembles['vcvtsi2ss  '    r1 ',dword ' rm];
instruction  pattern CVTIR2SS( int32reg r0,fxmreg r1)
        means[ (ref ieee32) r1 :=(ieee32)FLOAT((int32)^(  r0))]
    	assembles['vcvtsi2ss  '    r1 ', ' r0];
pattern ixmaddrmode means[maddrmode|isxmreg];
instruction pattern IREP8(iymreg r, ixmaddrmode m)
	means[r:=rep((int32)^ (m),8)]
	assembles['vpbroadcastd 'r ',' m];
instruction pattern xMOVD(isxmreg r1, int32reg  r2)
	means[r1:= ^(r2)]
	assembles['movd ' r1 ',' r2];

instruction pattern FREP8(fymreg r, maddrmode m)
	means[r:=rep((ieee32)^ (m),8)]
	assembles['vbroadcastss 'r ',' m];
instruction pattern FREP4(dymreg r, maddrmode m)
	means[r:=rep((ieee64)^ (m),4)]
	assembles['vbroadcastsd 'r ',' m];
instruction pattern FPU2XMMb32( fxmreg r1, type t)
	means[(ref ieee32) r1:= (ieee32)POP(ST)]
	assembles['sub esp,4\n fstp dword [esp] \n vmovd 'r1',[esp]\n add esp,4'];
instruction pattern FPU2XMMb64( fxmreg r1, type t)
	means[(ref ieee32) r1:= (ieee32)POP(ST)]
	assembles['sub rsp,8\n fstp dword [rsp] \n vmovd 'r1',[rsp]\n add rsp,8'];
 
instruction pattern VGATHERDPS(destfy v0, indy v1, basereg rm)
        means  [v0:=(ieee32 vector ( 8 ))
             ^(mem(+(*((int32 vector ( 8 ))^(v1),4) , ^(rm))))]
        assembles[ ' vpcmpeqw YMM7, YMM7, YMM7\n'
                  '  vgatherdps ' v0 ',[' rm '+' v1 '*4 ] ,YMM7'];
instruction pattern VGATHERPAIRDPS(destfy v0, indy v1,indy v2, basereg rm)
        means  [v0:=(ieee32 vector ( 8 ))
             ^(mem(+(*((int32 vector ( 8 ))^(v1),4),+(*((int32 vector ( 8 ))^(v2),4) , ^(rm)))))]
        assembles[' vpaddd 'v1 ', '  v1', 'v2'\n vpcmpeqw YMM7, YMM7, YMM7\n'
                  '  vgatherdps ' v0 ',[' rm '+' v1 '*4 ] ,YMM7'];
instruction pattern VGATHERDPSnobase(destfy v0, indy v1 )
        means  [v0:=(ieee32 vector ( 8 ))
             ^(mem( *((int32 vector ( 8 ))^(v1),4)  ))]
        assembles[ ' vpcmpeqw YMM7, YMM7, YMM7\n'
					' push eax\n xor eax,eax\n'
                  '  vgatherdps ' v0 ',[  eax+' v1 '*4 ] ,YMM7\n pop eax'];
instruction pattern VGATHERD(destiy v0, indy v1, basereg rm)
        means  [v0:=
        ^(mem(+(*((int32 vector ( 8))^(v1),4) , ^(rm))))]
        assembles[' vpcmpeqw YMM7, YMM7, YMM7\n'
                  '  vgatherdps ' v0 ',[' rm '+' v1 '*4 ] ,YMM7'
                  ];

pattern vioperator means[add|sub|mull];
instruction pattern VPDOP( iymreg r1, iymreg r2,iymreg r3,vioperator op)
	means [r1:=op(^(r2),^(r3))]
	assembles['vp'op'd 'r1','r2','r3' ;#VPDOP'];
	
instruction pattern LDRANGE0to7(iymreg r)
	means [ r:= RANGE(0,7)]
	assembles['LDRANGE0to7 'r
	];
 define(gathers,VGATHERD|VGATHERDPS|VGATHERDPSnobase|VPDOP|VGATHERPAIRDPS|LDRANGE0to7)
/* operates come before stores, come before moves, come before pushes */
define(YMMXcodes,
/* YMMX codes*/ 


STins|
OPins|
SQRTins|
CVTTSS2SI|
CVTTSD2SI|
CVTSS2SI|
CVTSD2SI|
CVTSI2SD|
CVTSI2SS|
CVTSD2SI|
CVTIR2SS|
XRLOADLIT|
XRDLOADLIT|
FREP4|
XPANDNPD|
XPANDNP|
XPANDNSD|
COMISDIFGOTO|
COMISSIFGOTO|
COMISD|
COMISS|
LDins  
	)



