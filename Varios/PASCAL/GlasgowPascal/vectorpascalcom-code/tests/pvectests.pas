program pvectest;
uses pvecs(real);

var p,Q,r,s,t,u:pvector;v:real;
begin
	P:= newvector(5);
	p^:= sqrt(iota(0));
	writeln('p');write (p^);
	p:=p+1;
	writeln('p=p+1');write(P^);
	t:=-p;
	writeln('t=-p');write(t^);
	q:=p+p;
	writeln('q=p+p');write (q^);
	r:= q-p;
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
	writeln(q^.cols);
end.
