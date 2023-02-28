program mosaic;
uses vq8,bmp;

const q=patchsize-1;
var i:integer;
    p:pimage;
    f:file;
procedure trainstep(var im:image);
var accum:array[codeword,0..vectorlen-1] of real;
    n:array[codeword] of integer;    
    i,j,k,l,l1,l2:integer;
    patch:codevec;
    index:codeword;
begin
	n:=1;	
	l1:=(p^.maxrow div patchsize) +(if p^.maxrow mod patchsize =0 then 0 else -1)-1;
	l2:=(p^.maxcol div patchsize )+(if p^.maxcol mod patchsize =0 then 0 else -1)-1;	
	accum:=cbk.tab;
	for i:=0 to im.maxplane  do
	for j:=0 to l1 do
	for k:=0 to l2 do
	begin
		patch:=im[i,j*patchsize +iota 0 div patchsize ,k*patchsize + iota 0 mod patchsize];
		index:=encode(patch);
		accum[index]:=accum[index]+patch;
		n[index]:=n[index]+1;
	end;
	cbk.tab:= accum/n[iota 0];	
	rtab:=cbk.tab;
end;

 
VAR 
    patch:codevec; j,k,index,l1,l2:integer;
begin
	writeln('Mosaic version 3');
	if paramcount<3 then
		writeln('usage: mosaic input.bmp output.bmp quality')
	else
	if loadbmpfile(paramstr(1),p) then
	begin
		if paramcount=4 then
		begin
			if paramstr(3)='poor' then cbk.rows:=8
			else
			if paramstr(3)='medium' then cbk.rows:=32
			else
			if paramstr(3)='fine' then cbk.rows:=128
			else
			if paramstr(3)<>'top' then
			writeln('valid qualities are: poor, medium, fine, top. Assuming you want top quality.');
		end;
		for i:= 1 to 17*round(sqrt(256 div cbk.rows)) do	 trainstep(p^);
		l1:=p^.maxrow div patchsize +(if p^.maxrow mod patchsize =0 then 0 else -1)-1;
		l2:=p^.maxcol div patchsize +(if p^.maxcol mod patchsize =0 then 0 else -1)-1;		 
		for i:=0 to p^.maxplane  do
		for j:=0 to l1 do	
		for k:=0 to l2 do
		begin 
			patch:=p^[i,j*patchsize +iota 0 div patchsize ,k*patchsize + iota 0 mod patchsize];
			index:=encode(patch);			 
			(* Copy codevector into patch *)
			p^[i,j*patchsize..j*patchsize+q,k*patchsize..k*patchsize +q]:=
			cbk.tab[index,iota 1* patchsize +iota 2];
		end;
		storebmpfile(paramstr(2),p^);
		writeln('result now in ',paramstr(2));
	end;
 	
end.
