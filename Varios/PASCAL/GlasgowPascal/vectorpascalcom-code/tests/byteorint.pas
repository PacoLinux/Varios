program byteorint;
var flags:byte;
    pos :0..7;
    lookpup:array[0..7,byte] of integer;
    i,count:integer;
    
begin{$r-}
  i:=lookpup[pos,flags];
  if( flags and 1)<>0 then begin 
    for count :=1 to 7 do begin
      if (flags and 128) <>0 then i:=i+1;
      flags := flags +flags;
    end
  end;
 
   
end.