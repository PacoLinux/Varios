program graphio;
uses bmp;
const source='grey1.bmp';
var im,outim:pimage; b:boolean;
    i:integer;v:array[1..8] of pixel;p:pixel;
begin
	 
	writeln('loading ',source);
	b:= loadbmpfile(source,im);
	writeln('loaded ',source);
	if b then
	begin 
              new(outim,im^.maxplane, im^.maxrow, im^.maxcol);
              outim^:=-1.0;
              outim^:= im^* -1.0;
              storebmpfile('neg.bmp',outim^);
	      writeln('stored neg.bmp');
	      outim^:=  im^*0.5;
	      storebmpfile('halfcontrast.bmp',outim^);
	      outim^:= im^+0.3;
	      storebmpfile('bright.bmp',outim^);
	      outim^:=im^;
	      adjustcontrast(2.0,outim^,outim^);
	      storebmpfile('doublecontrast.bmp',outim^);
	      
	end
	else writeln('failed');{}
	 
end.
