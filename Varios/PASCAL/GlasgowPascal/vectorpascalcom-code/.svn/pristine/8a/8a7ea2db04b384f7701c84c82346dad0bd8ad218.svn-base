program mandelbrot2;
uses bmp,mandspec,mandbuffers;
{$r-} 

procedure buildpic( var p:picture);
var    iteration:integer; 
     
begin
	x := 0.0; y := 0.0;
	cx:=  xorigin+ xstep* iota[1];
        cy:= yorigin + ystep * iota[0];
        times:=0;
	for iteration:=1 to escapelimit do  
	begin
				xx := x*x-y*y+cx;          
				y := 2.0* x  *y+cy;
				x := xx;
			        times:= if times=0 then
				         if (x*x+y*y)>escapebound then iteration else 0   
					 else times; 
               
 
		 
	end;
	 
	p :=   times*pixelshift ;
end;		
procedure pictofile(S:string);
var p:^picture;pim:pimage;
begin
	 
	new(pim,2,imlim,imlim);
	new(p); 
	 
	buildpic(p^);
	writeln('picture built'); 
	pim^ :=p^;  
	storebmpfile(s,pim^) ;	 
end;
begin
	pictofile('mandel2.bmp');
end.
	
