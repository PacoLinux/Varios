program vqencode;
uses vq,bmp;
var i:integer;
    p:pimage;
    f:file;
procedure trainstep(var im:image);
var accum:array[codeword,0..vectorlen-1] of real;
    n:array[codeword] of integer;    
    i,j,k,l:integer;
    patch:codevec;
    index:codeword;
begin
	n:=1;
	accum:=cbk.tab;
	for i:=0 to im.maxplane  do
	for j:=0 to im.maxrow div patchsize do
	for k:=0 to im.maxrow div patchsize do
	begin
		patch:=im[i,j*patchsize +iota 0 div patchsize ,k*patchsize + iota 0 mod patchsize];
		index:=encode(patch);
		accum[index]:=accum[index]+patch;
		n[index]:=n[index]+1;
	end;
	cbk.tab:= accum/n[iota 0];	
	rtab:=cbk.tab;
end;

procedure encodeimage(var im:image; var f:file);
(*! Encode an image writing it out to the file with the
    appropriate header information.
    The file is writen out as a sequence of planes
    each of which is a sequence of rows, each of which is a sequence of codewords.
*)
  
var header:codefileheader;
    i,j,k,l:integer;
    patch:codevec;
    index:codeword;
begin
	header.imwidth:=im.maxcol+1;
	header.imheight:=im.maxrow+1;
	header.table:=cbk;
	header.colourplanes:=im.maxplane+1;
	blockwrite(f,header,sizeof(codefileheader),i);
	for i:=0 to im.maxplane  do
	for j:=0 to im.maxrow div patchsize do
	for k:=0 to im.maxrow div patchsize do
	begin
		patch:=im[i,j*patchsize +iota 0 div patchsize ,k*patchsize + iota 0 mod patchsize];
		index:=encode(patch);
		blockwrite(f,index,sizeof(codeword),l);
	end;
end;
 
begin
	if loadbmpfile(paramstr(1)+'.bmp',p) then
	begin
		for i:= 1 to 5 do
		 trainstep(p^);
		assign(f,paramstr(1)+'.vq');
		rewrite(f);
		encodeimage(p^,f);
		close(f);

	end;
 
end.
