program scale;
uses bmp,expand;
const source='dline.bmp';
var im,outim:pimage; b:boolean;
    i:integer;v:array[1..8] of pixel;p:pixel;
begin
	p:=p*0.4;
	b:= loadbmpfile(source,im);
	if b then
	begin 
 	storebmpfile('original.bmp',im^);  
	new(outim,im^.maxplane, 24  ,29  );
		writeln('alloc');
		resize(im^,outim^);     
	writeln('resized big');
              storebmpfile('bigdline.bmp',outim^);
              new(outim,im^.maxplane, 4,7);  
	      resize(im^,outim^);          
              storebmpfile('smalldline.bmp',outim^);	     
          
	end
	else writeln('failed');{}
	 
end.
