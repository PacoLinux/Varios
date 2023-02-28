program fblurtime;
uses bmp;
 
var i:integer;
var inm,outm:pimage;
const source='grey1.bmp';
var     r,c:integer;
     c0,c1,c2:real;

 begin
	 if loadbmpfile(source,inm) then
	 begin
{		pconvp(inm^);}
     r:=inm^.maxrow;
     c:=inm^.maxcol;
     write(r,c);
     new(outm,3,r+3,c+3);
     c0:=0.25;
     c1:=0.5;
     c2:=0.25;
     outm^[2..r+1,2..c+1] :=  inm^[1..r,1..c];
     outm^[1]:=outm^[2];
     outm^[r+2]:=outm^[r]+1;
     inm^[1..r,1..c]:=outm^[2..r+1,2..c+1]*c1+outm^[1..r,2..c+1]*c0+outm^[3..r+2,1..c+1]* c2;
     outm^[2..r+1,2..c+1] :=  inm^[1..r,1..c];
     outm^[][1]:=outm^[][2];
     outm^[][r+1]:=outm^[][r];
     inm^[1..r,1..c]:=outm^[2..r+1,2..c+1]*c1+outm^[2..r+1,1..c]*c0+outm^[2..r+1,2..c+2]* c2;

		storebmpfile('mee.bmp',inm^);
	end
	else writeln('failed open file');
 end. 
