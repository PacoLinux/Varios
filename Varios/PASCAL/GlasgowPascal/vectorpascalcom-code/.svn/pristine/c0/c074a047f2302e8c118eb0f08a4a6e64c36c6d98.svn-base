program dotproduct;
type vec=array[0..1] of real;
     
const
  v1:vec=(1.0,1.0);
  v2:vec=(1.0,2.0);
  x:vec=(1.0,0.0);
  y:vec=(0.0,1.0);
var dx,dy,dd,l:real;n:vec;
begin
	dx:=v2.x;
	writeln('project',v2,'against x =',dx);
	dy:=v2.y;
	writeln('project',v2,'against y =',dy); 
	l:=sqrt(v1.v1);
	dd:=(v2.v1)/l;
	
        writeln('length',v2,'in direction',v1,' = ',dd);
	n:=(dd*v1);
	n:= n/sqrt(v1.v1);
	writeln(n);
end.
