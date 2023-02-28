program aind;
{ test indexing by an array}
type point=array[1..2] of integer;
var  a,k:array[1..6,1..5] of real;
     i:array[1..5] of integer;
     P,p2:point;
     v:real;
     function translate(x,y:integer):point;
     var r:point;
     begin
	r[1]:=((x+2)mod 6)+1;
	r[2]:=y{((y+3)mod 5)+1};
	
	translate:=r;
     end;
begin
	p[1]:=2;
	p[2]:=3;
	a:=iota 0 * iota 1;{}
	v:=a[!p];
	writeln(v);	
	a[1,2]:=99;
	a[3,3..4]:=8;
	a[1..2,3..4]:=0;
	writeln(a);
	p2:=p+1;
	a[!p..!p2]:=11;
	i:=6-iota 0;

	
	writeln(a);{}
	k:=a[!translate(iota[0],iota[1])];
	
	writeln(k);
	a:=k[!translate];
	
	writeln(a,k);
	
	
end.
