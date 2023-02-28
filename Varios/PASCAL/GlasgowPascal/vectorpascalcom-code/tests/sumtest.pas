program sumtest;
var a:array[1..50] of real;
    b:array[1..34,1..2] of real;
function s:real;
var t:real; i,j:integer;
begin
  t:= a[1];
  for i:= 2 to 50 do t:= t+a[i];
  for j:= 1 to 2 do 
  for i:= 1 to 34 do t:=t+b[i,j];
  s:=t;
end;
begin
 a:=2;b:=1;
 writeln(s);
 if s <>168 then writeln('error should have been 168');
end.
