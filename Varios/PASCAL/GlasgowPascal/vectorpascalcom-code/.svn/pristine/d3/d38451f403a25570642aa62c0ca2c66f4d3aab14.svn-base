 program fmattests;
uses pmats(real);
const a:array[1..2,1..3]of real=((1,2,3),(4,2,1));
      b:array[1..3,1..2]of real=((1,0),(0,1),(0,2));
      n=1024;
var p,pa,Q,r,s,t,u,v,v2:pmatrix;
	t1,t2,t3 :double;
	ops,pmips,amips:double;
	i,j,k:integer;
    c:array[1..2,1..2] of real;
    d:array[1..3,1..3] of real;
 function fmatprod(a,b:pmatrix):pmatrix;
 { should make better use of simd since it reorganises b to
   have elements accessible in the right order }
 var p,c:pmatrix;i,j:integer;
 begin
	p:=newmatrix(a^.rows,b^.cols);
	c:=newmatrix(b^.cols,b^.rows);
	c^:= trans b^;
	p^:= \+(a^[iota[0]] * c^[iota[1]]);
	dispose(c);
	fmatprod:=p;
 end;
 begin
    P:= newmatrix(3,2);
	 pa:=newmatrix(2,3);
	 pa^:=a;
	p^:= b;
	writeln('p');write (p^);writeln('pa');write (pa^);
	c:= a.b;
	writeln('c',c);
	v:=pa . p;
	writeln('v' ,v^); 
 
	 
	r:=fmatprod(pa,p);
	write('fast mult pa p');write(r^);
	{ now do large matrices }
	i:=64;j:=32;
	writeln('comparative timings');
	writeln('N ':16, 'pmat ':16, 'arrays':16,'mpat mips':16,'array mips':16);
	while i<=n do
	begin
	r:=newmatrix(i,i);
	r^:=iota[0]*iota[1];
	t1:=secs;
	s:=r.r;
	t2:=secs;
	
	s^:=r^ .r^;
	t3:=secs;
	ops:=i*i*i*2;
	pmips:=(ops/(t2-t1))/1000000 ;
	amips:=(ops/(t3-t2) )/1000000;
	writeln(i:16, t2-t1:16,t3-t2:16,pmips:16,amips :16);
	dispose(t);dispose(s);dispose(r);
	k:=i;
	i:=i+j;
	j:=k;
	end;
	
end.
