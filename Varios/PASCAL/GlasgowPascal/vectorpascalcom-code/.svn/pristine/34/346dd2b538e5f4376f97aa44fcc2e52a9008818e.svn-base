program pmattests;
uses pmats(real);
const a:array[1..2,1..3]of real=((1,2,3),(4,2,1));
      b:array[1..3,1..2]of real=((1,0),(0,1),(0,2));
var p,pa,Q,r,s,t,u,v,v2:pmatrix;
    c:array[1..2,1..2] of real;
    d:array[1..3,1..3] of real;
    

    
begin
	 P:= newmatrix(3,2);
	 pa:=newmatrix(2,3);
	 pa^:=a;
	p^:= b;
	writeln('p');write (p^);writeln('pa');write (pa^);
	writeln('transpose(p) ');s:=transpose(p);
	write(s^);
	c:= a.b;
	writeln('c',c);
	v:=pa . p;
	writeln('v' ,v^); 
	v2:=p.pa;
	writeln('v2=p.pa');write( v2^);
	d:=b.a;
	writeln ('d=b.a');write(d);
	writeln('t=-p');t:= -p;write(t^);
	q:=p+p;
	writeln('q=p+p');write (q^);
	r:= q-p;
	writeln('r=q-p');write(r^);
	s:=q*q;
	writeln('s=q*q');write(s^);
	u:=s/q;
	writeln('u=s/q');write(u^);
	p:=p+1;
	writeln('p=p+1');write(P^);
	
	
	writeln('u=u-1');u:=u-1;write(u^);
	writeln('u*2');u:=u*2;write(u^);
	
 	q:=2.0; 
	writeln(q^,q^.cols); 
end.
