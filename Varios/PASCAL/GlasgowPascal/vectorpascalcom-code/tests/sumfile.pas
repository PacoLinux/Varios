PROGRAM sumfile(input,output);
VAR total,x:integer;
BEGIN
  total:=0;
  REPEAT
    READ(x);
    total:=total+x;
  UNTIL x=0;
  WRITE(total)
END.
