program clvectest;
uses  pvecs(real), clvecmat(real);
var p,Q,r,s,t,u:cl_vec;
    v:real;
    x:pvector;
   
    
begin
  writeln('test clvecs');setupgpu;
 
	 x:=newvector( 8);
	x^:= pi;
 	writeln('x');write (x^);
	x^:=x^+1;
 	writeln('x');write (x^);
	
	p:= x;
	writeln('p initialised');
	{ copy back }
	x:=p;
	write('x copied to and from gpu x=');writeln(x^);
	(*
	p:=p+1.0;
	writeln('p=p+1');write(P^);
	t:=-p;
	writeln('t=-p');write(t^);*)
	q:=p+p;
	writeln('q initialised');
	x:=(q);
	writeln(' q copied to local store');
	writeln('q=p+p');write (x^);
	(*r:= q-p;
	writeln('r=q-p');write(r^);
	s:=q*q;
	writeln('s=q*q');write(s^);
	u:=s/q;
	writeln('u=s/q');write(u^);
	
	writeln('u=u-1');u:=u-1;write(u^);
	writeln('u*2');u:=u*2;write(u^);
	v:=q . p;
	writeln('v',v);
	q:=2;
	writeln(q^.cols);*)
 cleanupgpu;
 writeln('cleared gpu resources');
end.
