program matvmult;
type vec=array[0..3] of real;
     mat=array[0..3] of vec; 
const
   rr2= 0.7071067 ;             { 1/sqrt(2) }
   M:mat=(( rr2,-rr2,0.0,0.0) , { 45degree spiral matrix }
          (rr2,rr2,0.0,0.0),
          (0.0,0.0,1.0,0.2),
          (0.0,0.0,0.0,1.0));
  v:vec=(1.0,0.0,0.0,1.0);
var v1,v2:vec; i:integer;
    
begin
  write (M,v);
  v1:=v;
  (* perform 8 45degree rotations *)
  for i:=1 to 8 do begin
     v2:=M.v1;
     v1:=v2;
     write(v1);
  end;  
end.
