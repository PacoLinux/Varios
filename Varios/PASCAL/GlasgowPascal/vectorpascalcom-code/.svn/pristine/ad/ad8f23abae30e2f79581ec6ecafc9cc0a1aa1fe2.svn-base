program mandelbrot1a;
uses bmp,mandspec;
 
 
 
function escapebrightness(cx,cy:real ):real;
label 99;
var xx,y,x:real;
    iteration: integer;
begin
	x := 0.0; y := 0.0;
	for iteration:=1 to escapelimit do  begin
				xx := sqr(x)-sqr(y)+cx;
				y := 2.0*x*y+cy;
				x := xx;
				 
				if (sqr(x)+ sqr(y)>escapebound)then
			 	begin	  
			 		escapebrightness:=iteration*pixelshift*2-1;
			 		goto 99;
			 	end;
		 
	end;
	escapebrightness:= -0.99;
	99:;

end;



procedure buildpic( var p:picture);
var x,y :integer; 
begin
	for x:= 0 to imlim do
	 for y:= 0 to imlim do
		p[y,x]:=  escapebrightness( xorigin+ xstep*x,yorigin+ystep*y )     ;
end;		
procedure pictofile(S:string);
var p:^picture;pim:pimage;
begin
	 
	new(pim,2,imlim,imlim);
	new(p); 
	 
	buildpic(p^);
	 
	pim^ :=p^;
	 
         
	storebmpfile(s,pim^) ;	 
end;
begin
	pictofile('mandel1a.bmp');
end.
	
