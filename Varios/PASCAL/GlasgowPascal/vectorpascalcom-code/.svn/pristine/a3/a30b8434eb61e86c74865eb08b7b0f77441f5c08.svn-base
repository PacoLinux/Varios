unit pvecs(RT);
(*! This is a unit that provides vectors on the heap and supports
 arithmetic operations between such vectors.
  
  The implementation will use simd operations but since it involves
  allocation on the heap will not be as efficient as working with
  arrays that are explicitly allocated.
   
   There is also slightly less opportunity for the compiler to optimise
   complex array expressions this way.
   *)
 interface
 Type 
   gvector(cols:integer)=array[1..cols] of RT;
   pvector =^gvector;
 (*! special vectors you must not alter these*)
 var additiveIdentityPvector,multiplicativeIdentityPvector:pvector;
 (*!
 First we give specifications of the functions that operate on pvectors *)
 function newvector(  len:integer):pvector;{new vector  of specified length}
 function pvecadd(a,b:pvector):pvector;
 function pvecsub(a,b:pvector):pvector;
 function pvecmult(a,b:pvector):pvector;
 function pvecdiv(a,b:pvector):pvector;
 function scalar2vec(a:RT):pvector;
 function pvecprod(a,b:pvector):RT;
 (*! Next we specify the operations that work on pvectors.
 
 For this we must specify the symbol of the operator, the function that
 will perform it, and the identity element of the operator 
 
 		symbol		function		identity element  *)
 
 	
 operator +     =   pvecadd,        additiveIdentityPvector;
 operator -     =   pvecsub,        additiveIdentityPvector;
 operator *		=	Pvecmult,		multiplicativeIdentityPvector;
 operator /    =    pvecdiv,       multiplicativeIdentityPvector; 
 operator .    =    pvecprod;
 operator cast = 	scalar2vec;
 implementation
 
 function scalar2vec(a:RT):pvector;
 var p:pvector;
 begin
	new(p,1);p^[1]:=a;
	scalar2vec:=p
 end;
 function newvector(  len:integer):pvector;
 var p:pvector;
 begin
	new(p,len);
	newvector:=p
 end;
 
 function longestnew(var a,b:gvector):pvector;
 (*! return new vector the size of the longest of a or b *)
 begin
	longestnew:=newvector( a.cols max b.cols);
 end;	
 function clone(var v:gvector):pvector;
 var p:pvector;
 begin
	p:=newvector(v.cols);
	p^:=v;
    clone:=p
 end;
 function negate(var v:gvector):pvector;
 var p:pvector;
 begin
	p:=newvector(v.cols);
	p^:=-v;
    negate:=p
 end;
 function recip(var v:gvector):pvector;
 var p:pvector;
 begin
	p:=newvector(v.cols);
	p^:=1/v;
    recip:=p
 end;
 function vecadd(var a,b:gvector):pvector;
  var p:pvector;
 begin
	    p:=longestnew(a,b);
	    if(1=a.cols)then
	    p^:=a[1] + b
	    else if(b.cols=1)then
	    p^:=a+b[1]
	    else  p^:=a + b;
	    vecadd:=p
 end;
 
 function pvecprod(  a,b:pvector):RT;
 begin
	pvecprod:= \+ (a^ * b^);
 end;
 function vecmult(var a,b:gvector):pvector;
  var p:pvector;
 begin
	    p:=longestnew(a,b);
	   if(1=a.cols)then
	    p^:=a[1] * b
	    else if(b.cols=1)then
	    p^:=a*b[1]
	    else  p^:=a * b;
	    vecmult:=p
 end;
 function vecdiv(var a,b:gvector):pvector;
  var p:pvector;
 begin
	    p:=longestnew(a,b);
	   if(1=a.cols)then
	    p^:=a[1] / b
	    else if(b.cols=1)then
	    p^:=a/b[1]
	    else  p^:=a / b;
	    vecdiv:=p
 end;
 function vecsub(var a,b:gvector):pvector;
  var p:pvector;
 begin
	    p:=longestnew(a,b);
	    if(1=a.cols)then
	    p^:=a[1] - b
	    else if(b.cols=1)then
	    p^:=a-b[1]
	    else 
	    p^:=a -b;
	    vecsub:=p
 end;
 function pvecadd(a,b:pvector):pvector;
 begin
    if a=additiveIdentityPvector then pvecadd:=clone(b^)
    else if b=additiveIdentityPvector then pvecadd:=clone(a^)
    else pvecadd:=vecadd(a^,b^)
 end;
 function pvecmult(a,b:pvector):pvector;
 begin
    if a=multiplicativeIdentityPvector then pvecmult:=clone(b^)
    else if b=multiplicativeIdentityPvector then pvecmult:=clone(a^)
    else pvecmult:=vecmult(a^,b^)
 end;
 function pvecdiv(a,b:pvector):pvector;
 begin
    if a=multiplicativeIdentityPvector then pvecdiv:=clone(b^)
    else if b=multiplicativeIdentityPvector then pvecdiv:=recip(a^)
    else pvecdiv:=vecdiv(a^,b^)
 end;
function pvecsub(a,b:pvector):pvector;
 begin
    if a=additiveIdentityPvector then pvecsub:=negate(b^)
    else if b=additiveIdentityPvector then pvecsub:=clone(a^)
    else pvecsub:=vecsub(a^,b^)
 end;	
 {-------------} 
begin
	additiveIdentityPvector:=nil;{newvector(0);}
	multiplicativeIdentityPvector:=newvector(0);
end.
 
 
