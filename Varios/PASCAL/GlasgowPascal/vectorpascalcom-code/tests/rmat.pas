program rmat;
const sz=511;
      rmod = $7fffffff;
      rset = $79d99e99;
      rk=    $33a7833f;
type range =0..sz;
     mat=array[range,range] of integer;
     ten=array[1..4,range,range]of integer;
var a:mat;t:double;b:ten;
begin
    t:=secs; 
	b:= ((rk+iota(1))*(iota(2)+rset)*iota(0))and rmod;
	a:= b[1]+b[2]+b[3]+b[4];
	writeln(secs-t);
end.
