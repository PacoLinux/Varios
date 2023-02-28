program vq8decode;
uses vq,bmp;
const q=patchsize-1;
var 
    p:pimage;
    f:file;
    header:codefileheader;
    i,j,k,l:integer;
    index:codeword;
begin
	assign(f,paramstr(1)+'.vq8');
	{$i-}
	reset(f);
	if ioresult = 0 then 
	begin
		blockread(f,header,sizeof(codefileheader),l);
		cbk:=header.table;
		new(p,header.colourplanes-1,header.imheight-1, header.imwidth-1);
		for i:=0 to p^.maxplane  do
		for j:=0 to p^.maxrow div patchsize do
		for k:=0 to p^.maxrow div patchsize do
		begin 
			blockread(f,index,sizeof(codeword),l);
			(* Copy codevector into patch *)
			p^[i,j*patchsize..j*patchsize+q,k*patchsize..k*patchsize +q]:=
			cbk.tab[index,iota 1* patchsize +iota 2];
		end;
		storebmpfile(paramstr(2),p^);
	end
	else writeln('cant open ',paramstr(1)+'.vq');
end.
