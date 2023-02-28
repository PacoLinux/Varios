program permute;
const p:array[0..3] of integer=(3,1,2,0);
      m0:array[0..3] of integer=(10,11,12,13);
var   ma:array[0..3] of integer; 
      j:integer;
begin
   {$r-}
   ma:=m0[p]; 
   writeln('ma:=m0[p]=',ma);
   for j:=0 to 3 do write(ma[j]);
   writeln;
end.
 
