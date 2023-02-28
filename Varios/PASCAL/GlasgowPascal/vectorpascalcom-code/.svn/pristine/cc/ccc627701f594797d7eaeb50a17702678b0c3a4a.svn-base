program scale;
uses bmp,expand;
const source='barbara.bmp';
var im,outim:pimage; b:boolean;
    i:integer;v:array[1..8] of pixel;p:pixel;
begin
	p:=p*0.4;
	b:= loadbmpfile(source,im);
	if b then
	begin 
 	  new(outim,im^.maxplane, 600  , 760 );        
		resize(im^,outim^);     
              storebmpfile('big.bmp',outim^);
		writeln('big done');
              new(outim,im^.maxplane, im^.maxrow div 2, im^.maxcol div 3);  
	      resize(im^,outim^);          
              storebmpfile('small.bmp',outim^);	     
          
	end
	else writeln('failed');{}
	 
end.
