program point;
uses bmp;
var p:pimage;
begin
	new(p,2,19,19);
	p^:=0;
	p^[][10,9..11]:=0.8;
	storebmpfile('point.bmp',p^);
	pconv(p^,0.25,0.5,0.25);
	storebmpfile('blurpoint.bmp',p^);
	p^:=0;
	p^[][10,9..11]:=0.8;
	pconv(p^,-0.25,2,-0.25);
	storebmpfile('sharppnt.bmp',p^);
	adjustcontrast(4.0,p^,p^);
	storebmpfile('brightsharppnt.bmp',p^);	
end.
