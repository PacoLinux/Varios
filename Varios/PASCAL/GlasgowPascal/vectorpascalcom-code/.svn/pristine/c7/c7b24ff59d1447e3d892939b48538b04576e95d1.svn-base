program quant;
type range=0..15;
var 
    h:array[0..255]of real;{histogram}
    t:array[range] of real;{quantisor}
    procedure q(pos,fac,d:range;i,j:integer); 
    var n,m,mu:real;x:integer;
    begin
	
	n:=\+ j-i +1;
	m:=\+ (h[i..j]);
	writeln(round(h[i..j]));
	mu:=m/n;
	for x:=1 to d do write(' ');
	writeln(pos:4,fac:4,i:4,j:4,round(n):8,' ',round(m):8,' ',mu);
	if fac<=0 then t[pos]:=mu
	else
	 begin
		q(pos ,fac div 2,d+1,i , round(mu) );
		q(pos+fac, fac div 2,d+1, (round(mu)+1) ,j);
	end;
     end;
begin
	h:=iota 0;   
	q(0,8,0,0,255);
	writeln(t:6:1);
end.
