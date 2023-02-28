program mandelbrot1;
uses bmp,mandspec;
 
 
function escaped(c:complex):boolean;
begin
	escaped :=  ((im(c)*im(c))+ (re(c)*re(c)))> escapebound;
end;
function escapebrightness(c: complex ):real;
label 99;
var z: complex;
    i: integer;
begin
	z:=0.0;
	for i:= escapelimit downto 1 do
	begin
		z:= z*z + c;
		if escaped(z) then
		begin
			 escapebrightness:=i*pixelshift;
			 goto 99;
		end;
	end;
	escapebrightness:=0;
	99:;
end;
procedure buildpic( var p:picture);
var x,y :integer; 
begin
	for x:= 0 to imlim do
	 for y:= 0 to imlim do
		p[y,x]:=  escapebrightness(cmplx(xorigin+ xstep*x,yorigin+ystep*y))     ;
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
	pictofile('mandel1.bmp');
end.
	
