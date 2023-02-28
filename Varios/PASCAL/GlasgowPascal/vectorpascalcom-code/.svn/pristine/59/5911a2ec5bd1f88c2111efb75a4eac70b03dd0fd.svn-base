unit vq;
interface
const patchsize =4;
      vectorlen = patchsize * patchsize;
      maxcode=255;
type codevec = array[0..vectorlen-1] of pixel;
     rcodevec= array[0..vectorlen-1] of real;
     codeword = 0..maxcode;
     book=record
	rows,cols:0..32000;
	tab: array [codeword] of codevec;
	end;
     codefileheader = record
	imwidth,imheight:0..32000;
        colourplanes:1..10;
        table:book;
     end;
var cbk:book; 
    rtab:array[codeword] of rcodevec;
function encode(var v:codevec):codeword;
 
implementation
 
function encode(var v:codevec):codeword;
var i,j,k:integer; d,least:real;
    rv:rcodevec;
    dv:codevec;
begin
	rv:=v;
	j:=0; least:= 2*vectorlen;
	for i:=0 to maxcode do
        begin
		d:=\+ (rv-rtab[i])*(rv-rtab[i]);
		if d<least then
		begin
			j:=i; 
			least:=d;
		end
	end;
	encode:=j;
end;
begin
cbk.rows:=maxcode+1; 
cbk.cols:=vectorlen+1;
cbk.tab:= -1 +iota 0 / 129;

rtab:=cbk.tab;
end.
