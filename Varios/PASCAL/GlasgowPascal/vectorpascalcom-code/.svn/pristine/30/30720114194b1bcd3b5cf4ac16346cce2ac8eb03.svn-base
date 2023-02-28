{  Vector Pascal Acceptance Test
 vec019 tests  that arithmetic on pixels saturates with an upper bound of 1 }
program vec019;
var  
    white, black, grey:pixel;
    count:integer;
    procedure inc;begin count:=count+1; end;
   var bb,wb:byte;
   function pixel2real(p:pixel):real;begin pixel2real:=p end;
   function real2pixel(r:real):pixel;begin real2pixel:=r end;
begin
	count:=0;
	bb:=0;wb:=255;
	white:=byte2pixel(wb); 
	black := byte2pixel(bb);
	grey := white-white;
    writeln(pixel2real(white),real2pixel(1),pixel2byte(real2pixel(1)),pixel2byte(white));
	if real2pixel(pixel2real(white))= white then inc else writeln('convesion to real and back gives different result');
	if pixel2byte(white)=wb then inc else writeln('white not 255', pixel2byte(white));
	if pixel2byte(black)=0 then inc else writeln('black not 0');
	if white+white = white then inc else writeln('white+white not white');;
	if black+black = black then inc else writeln('black+black not black');
	if white+grey = white then inc else writeln('white + gery not white');
	if grey + grey = grey then inc else writeln('grey + gey not grey');
	if count=7 then
	writeln('PASS conf519 section 1.5.2b')
        else
	writeln('FAIL conf519 section 1.5.2b', white,black,grey);

end.
