program graphio;
uses bmp;
const source='grey1.bmp';
var im,outim:pimage; b:boolean;
    i:integer;v:array[1..8] of pixel;p:pixel;
begin
	p:=p*0.4;
	b:= loadbmpfile(source,im);
	if b then
	begin
        blur(im^);
	storebmpfile('greyblur.bmp',im^);
	end
	else writeln('failed');{}
	 
end.
