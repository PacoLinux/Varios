program mandelbrot1b;
uses bmp,mandspec;



pure function escapebrightness(cx,cy:real ):real;
label 99 ,100;
var xx,y,x,x2,y2:real;
    iteration: integer;

begin
	x := 0.0; y := 0.0;
	iteration:=1  ;
         while iteration < escapelimit do
         begin
	100:			xx := sqr(x)-sqr(y)+cx;
				y := 2.0*x*y+cy;
				x := xx;
				if ((sqr(x)+ sqr(y))>escapebound)  then
			 		goto 99;

				iteration:=iteration+1;

	end;

	99:if iteration < escapelimit then escapebrightness:= iteration*pixelshift
           else escapebrightness:=0.0;
end;
procedure buildpic( var p:picture);
var x,y :integer;
begin

		p:=  escapebrightness( xorigin+ xstep*iota[1],yorigin+ystep*iota[0] )     ;
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
	pictofile('mandel1b.bmp');
end.
	
