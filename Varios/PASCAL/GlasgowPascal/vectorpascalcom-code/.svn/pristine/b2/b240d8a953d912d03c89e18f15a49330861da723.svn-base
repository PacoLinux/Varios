program matmulperf;
const M=128 ;N=M;K=M;reps=500;
type t= double;
var a:array[1..m,1..k] of t;
    b:array[1..k,1..n] of t;
    c:array[1..m,1..n] of t;
    i:integer;
    time,ops,mips:double;
procedure mm;
begin
  c:=a.b
end;
begin
  if sizeof(t)=4 then writeln('32 bit real matrices')
  else writeln('64 bit double matrices');
  Writeln('use ',m,' by ',k,' matrices');
  time:=secs;
  for i:=1 to reps do mm;
  time:=secs-time;
  
  Writeln('duration ',time,'seconds');
  ops:=reps*M*M*M/time;
  mips:=ops/1000000;
  Writeln(mips:9:5 ,' million multiply accumulate ops per sec');
    
end.
