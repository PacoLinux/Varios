program graphio;
uses bmp;

var im,outim:pimage;
var i:integer;v:array[1..8] of pixel;p:pixel;
begin
	p:=p*0.4;
	if loadbmpfile('scribble.bmp',im)
        then
	begin 
              new(outim,im^.maxplane, im^.maxrow, im^.maxcol);
              outim^:=-1.0;
              outim^:= im^* -1.0;
              storebmpfile('neg.bmp',outim^);
	      outim^:=  im^*0.5;
	      storebmpfile('half.bmp',outim^);
	      outim^:= im^+0.3;
		pconv(outim^,0.3,0.4,0.3);
	      storebmpfile('bright.bmp',outim^);
	end
	else writeln('failed');{}
	 
end.
