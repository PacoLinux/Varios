program b;
type byteimage(maxrow,maxcol,maxpix:integer)=array[0..maxrow,0..maxcol,0..maxpix] of byte;
var f:file of byte; fsize,i,index,j,k,m,row,res:integer; 
	la: ^byteimage;  bb:byte;
begin
new(la,255,255,2); 
for i:=0 to 3 do
begin
{$r-}
bb:=la^[i,0,0];
end;
end.
