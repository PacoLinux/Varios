unit pmatsv(RT);
(*! This is a unit that provides matrixs on the heap and supports
 arithmetic operations between such matrixs.
  
  The implementation will use simd operations but since it involves
  allocation on the heap will not be as efficient as working with
  arrays that are explicitly allocated.
   
   There is also slightly less opportunity for the compiler to optimise
   complex array expressions this way.
   *)
 interface  
 Type 
   gmatrix(rows,cols:integer)=array[1..rows,1..cols] of RT;
   pmatrix =^gmatrix;
 (*! special matrixs you must not alter these*)
 var additiveIdentityPmatrix,multiplicativeIdentityPmatrix:pmatrix;
 (*!
 First we give specifications of the functions that operate on pmatrixs *)
 function newmatrix(  rows,cols:integer):pmatrix;{new matrix  of specified length}
 function pmatadd(a,b:pmatrix):pmatrix;
 function pmatsub(a,b:pmatrix):pmatrix;
 function pmatmult(a,b:pmatrix):pmatrix;
 function pmatdiv(a,b:pmatrix):pmatrix;
 function scalar2mat(a:RT):pmatrix;
 function pmatprod(a,b:pmatrix):pmatrix;
 function transpose(a:pmatrix):pmatrix;
 (*! Next we specify the operations that work on pmatrixs.
 
 For this we must specify the symbol of the operator, the function that
 will perform it, and the identity element of the operator 
 
 		symbol		function		identity element  *)
 
 	
 operator +     =   pmatadd,        additiveIdentityPmatrix;
 operator -     =   pmatsub,        additiveIdentityPmatrix;
 operator *		=	Pmatmult,		multiplicativeIdentityPmatrix;
 operator /    =    pmatdiv,       multiplicativeIdentityPmatrix; 
 operator .    =    pmatprod;
 operator cast = 	scalar2mat;
 implementation
 
 function scalar2mat(a:RT):pmatrix;
 var p:pmatrix;
 begin
	new(p,1,1);
	p^[1,1]:=a;
	scalar2mat:=p
 end;
 function newmatrix(  row,col:integer):pmatrix;
 var p:pmatrix;
 begin
	new(p,row,col);
	newmatrix:=p
 end;
 function transpose(a:pmatrix):pmatrix;
 var p:pmatrix;
 begin
    p:=newmatrix(a^.cols,a^.rows);
    p^ := trans (a^);
    transpose:=p
 end;
 function longestnew(var a,b:gmatrix):pmatrix;
 (*! return new matrix the size of the longest of a or b *)
 begin
	longestnew:=newmatrix(a.rows max b.rows, a.cols max b.cols);
 end;	
 function clone(var v:gmatrix):pmatrix;
 var p:pmatrix;
 begin
	p:=newmatrix(v.rows,v.cols);
	p^:=v;
    clone:=p
 end;
 function negate(var v:gmatrix):pmatrix;
 var p:pmatrix;
 begin
	p:=newmatrix(v.rows,v.cols);
	p^:=-v;
    negate:=p
 end;
 function recip(var v:gmatrix):pmatrix;
 var p:pmatrix;
 begin
	p:=newmatrix(v.rows,v.cols);
	p^:=1/v;
    recip:=p
 end;
 function issingle(var a:gmatrix):boolean;
 begin if a.rows >1 then issingle:=false
       else if a.cols>1 then issingle:=false
       else issingle:=true
 end;
 function matadd(var a,b:gmatrix):pmatrix;
  var p:pmatrix;
 begin
	    p:=longestnew(a,b);
	    if issingle(A)then
	    p^:=a[1,1] + b
	    else if issingle(b)  then
	    p^:=a+b[1,1]
	    else  p^:=a + b;
	    matadd:=p
 end;
 
 function fmatprod(a,b:pmatrix):pmatrix;
 { should make better use of simd since it reorganises b to
   have elements accessible in the right order }
   type vector(cols:integer) = array[1..cols] Of  rt;
 var p,c:pmatrix;i,j:integer;
     
 begin
	p:=newmatrix(a^.rows,b^.cols);
	c:=newmatrix(b^.cols,b^.rows);
	c^:= trans b^;
	{$par}
	for i:= 1 to a^.rows do
	for j:= 1 to b^.cols do
	p^[i,j]:= \+( a^[i] * c^[j] );
	dispose(c);
	fmatprod:=p;
 end;
 function pmatprod(a,b:pmatrix):pmatrix;
 var p:pmatrix;
 begin
    if a^.rows*b^.cols>10000 then pmatprod:=fmatprod(a,b)
    else begin
		p:=newmatrix(a^.rows,b^.cols);
		p^:= a^ . b^;
		pmatprod:=p;
	end;
 end;
 function matmult(var a,b:gmatrix):pmatrix;
  var p:pmatrix;
 begin
	    p:=longestnew(a,b);
	   if  issingle(a)then
	    p^:=a[1,1] * b
	    else if(issingle(b))then
	    p^:=a*b[1,1]
	    else  p^:=a * b;
	    matmult:=p
 end;
 function matdiv(var a,b:gmatrix):pmatrix;
  var p:pmatrix;
 begin
	    p:=longestnew(a,b);
	   if(issingle(a))then
	    p^:=a[1,1] / b
	    else if(issingle(b))then
	    p^:=a/b[1,1]
	    else  p^:=a / b;
	    matdiv:=p
 end;
 function matsub(var a,b:gmatrix):pmatrix;
  var p:pmatrix;
 begin
	    p:=longestnew(a,b);
	    if(issingle(a))then
	    p^:=a[1,1] - b
	    else if(issingle(b))then
	    p^:=a-b[1,1]
	    else 
	    p^:=a -b;
	    matsub:=p
 end;
 function pmatadd(a,b:pmatrix):pmatrix;
 begin
      pmatadd:=matadd(a^,b^)
 end;
 function pmatmult(a,b:pmatrix):pmatrix;
 begin
     pmatmult:=matmult(a^,b^)
 end;
 function pmatdiv(a,b:pmatrix):pmatrix;
 begin
      pmatdiv:=matdiv(a^,b^)
 end;
function pmatsub(a,b:pmatrix):pmatrix;
 begin
    if a=nil then pmatsub:=negate(b^) { compiler plants 0 =nil for unary - left operator }
    else
    pmatsub:=matsub(a^,b^)
 end;	
 {-------------} 
begin
	additiveIdentityPmatrix:= newmatrix(1,1);additiveIdentityPmatrix^[1,1]:=0;
	multiplicativeIdentityPmatrix:=newmatrix(1,1);multiplicativeIdentityPmatrix^[1,1]:=1;
end.
 
 
