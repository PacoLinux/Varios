program maketest;
uses bmp;
var pic, half:^image;
    i,j,k,step:integer;
    r:real;
    procedure halftone(var src,dest:image);
    var temp:^image;i,j,k :integer;
        black,white:pixel;
	e1,e2,e3 :real;
        r1,r2:integer;
    const amplitude=0.3;
          divisor = 111;
    begin
 	black:=-1.0; white :=1.0;
	new(temp, src.maxplane, src.maxrow,src.maxcol);
	dest := if src >0 then 1.0 else -1.0;
        temp^:=src ;
	for k:=0 to src.maxplane do  
        for i:=1 to src.maxrow-1 do for j:= 1 to src.maxcol-1 do
        begin
		r1:= random; r2:=random;
                e3:=if r1>r2 then 0.2 else -0.2;
		dest[k][i][j]:=if temp^[k,i,j]>0.0 then white else black;
		e1:= dest[k,i,j]-temp^[k,i,j];
		temp^[k,i,j+1]:= temp^[k,i,j+1]-(0.45-e3)*e1 ;
		
		temp^[k,i+1,j]:= temp^[k,i+1,j]-(e3+0.375)*e1;
		temp^[k,i+1,j-1]:= temp^[k,i+1,j-1]-(0.125)*e1 ;
	end;
	writeln('dest initialised ');
  
 
	dispose(temp);
    end;
	
begin
(*	new(pic,2,255,255);
	new(half,2,255,255);
	pic^:=0;
       	i:=0;
        
	step:=15;
	while i<pic^.maxrow-2*step do begin
	   for j:=1 to step do begin
		i:=i+1;
		for k:=0 to 254 do 
			pic^[0..1,i,k]:= -0.99 +  k/128;
	   end;
	   for j:=1 to step do begin
		i:=i+1;
		for k:=0 to 250 do 
			pic^[1..2,i,k]:= 0.99 -  k/128;
	   end;
	   if step >1 then step := step-1;
	end;
        for i:=1 to 100 do pic^[2,i,i]:=0.95;
	storebmpfile('grey1.bmp',pic^);
        *)
	loadbmpfile('tp.bmp',pic);
	NEW(HALF, PIC^.MAXPLANE,PIC^.MAXROW,PIC^.MAXCOL);
	halftone(pic^,half^);
	storebmpfile('half.bmp',half^); 
end.
