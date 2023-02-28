program matmulti;
type
     short=-1000..1000;
     vec=array[0..3] of short;
     mat=array[0..3] of vec;
     dmat(top:integer)=array[0..top,0..3] of short;


const
   rr2= 2 ;
   m:mat=(( rr2,-rr2,0,0) ,
          (rr2,rr2,0,0),
          (0,0,1,0),
          (0,0,0,1));
  v1:vec=(1,0,0,0);
var v:vec;m1,m2:mat;i:integer;dm,dm2:^dmat;r:real;  v2: array[1..3] of real;s:string;
begin
 new(dm,3);
 new(dm2,3);

 for i:= 0 to 3 do
 begin 	
	
	dm2^[i]:= m.(m[i]); 	
	
 end;
writeln(dm2^);
end.
