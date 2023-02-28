program matmult;
type vec=array[0..3] of real;
     mat=array[0..3] of vec;
     dmat(top:integer)=array[0..top] of vec;
     
procedure mvmul(var m:mat; var v:vec);
var t:vec;
begin
  t:= \+ m*v;
  v:=t;
end;
(*! two alternative implementations of matrix multiplication, both work *)
procedure mm(var mout,m1,m2:mat);
begin
	mout:=trans  \+ (m1 * perm[1,2,0]m2);
end;
procedure mm2(var mout,m1,m2:mat);
begin
	mout:= \+( perm[1,0,2]m1 * perm[0,2,1]m2);
end;
const
   rr2= 0.7071067 ;
   m:mat=(( rr2,-rr2,0.0,0.0) ,
          (rr2,rr2,0.0,0.0),
          (0.0,0.0,1.0,0.0),
          (0.0,0.0,0.0,1.0));
  v1:vec=(1.0,0.0,0.0,0.0);
var v:vec;m1,m2:mat;i:integer;dm:^dmat;r:real;  v2: array[1..3] of real;
begin
  new(dm,3);
  write(dm^.top);
  v:=v1;
  write (m,v);
  for i:=1 to 4 do begin
  mvmul(m,v);
  write(v);
  end;
  writeln;
  mm(m1,m,m);mm2(m2,m,m);
  v:=v1; mvmul(m1,v); writeln(m1,v);
  v:=v1;
  mvmul(m2,v);
 writeln(m2,v);
 r:= v1.v1;
 writeln(r);{}
 v2:=iota 0;
 v:=iota 0;
 r:=v.v;
 writeln(v,v2,r);
{ v:= m.v1;
writeln(v);{}
{ v:=\+ m*v1;
 writeln(v);{}
{ m1:=m.m;
 writeln(m1) ;{}
end.
