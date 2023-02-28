program addpix; 
var 
    d,e,f,g:array[0..7] of pixel;
    r,s,t,u:real;
   procedure rp(c1,c2,c3:real);
   begin
	writeln(c1,c2,c3);
   end;
begin
	s:=0.3;t:=-0.5;
	u:= 0.1;
	e:=s;e[3]:=0.7; e[4]:=-0.2;
	f:=t;
	g:=u;
	d:=e*f;
	writeln(d,ord(d));
	d:=e*g+e*f+g*e;
	write(e,g,f,d);
	rp(0.1,-0.5,0.2);
	rp(s,t,u);
end.
