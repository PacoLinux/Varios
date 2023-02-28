program modul;
const p=5;
var k:integer;
function floor(a:real):integer;
begin
	if a <0 then floor:= - trunc(- a)-1 else floor:= trunc(a)
end;
function modulus(a,b:integer):integer; 
var x,c,d:integer;
begin
        modulus := a-floor(a / b)*b     
end;	
begin
	k:=p;
	writeln('rem',33 rem k,(-33) rem k, (-33 ) rem -k, 33 rem -k);
	writeln('mod',33 mod k,(-33) mod k, (-33 )mod -k, 33 mod -k);
	
	writeln('modulus',modulus(33,k),modulus(-33,k),modulus(-33,-k), modulus(33,-k));
        writeln(' k', 'k/3', 'trunc','round', 'floor');
	for k:= -4 to 6 do 
	writeln(k, k/3, trunc(k/3), round(k/3), floor(k/3));
end.
