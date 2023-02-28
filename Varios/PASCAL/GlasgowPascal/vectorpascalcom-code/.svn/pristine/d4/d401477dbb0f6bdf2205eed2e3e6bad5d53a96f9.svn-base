program gotodemo;
CONST maximum=10;
VAR a:ARRAY[1..maximum] OF real;

{ find number with biggest integer absolute reciprocal}
FUNCTION recipmax:integer;
LABEL 99;
VAR i,r:integer;
    ok:boolean;
BEGIN
   r:=0; ok:=false;
   FOR i:=1 TO maximum DO
   BEGIN
        IF A[i]=0 THEN GOTO 99;
        r:= r MAX ROUND( 1 / abs( a[i] ) );
   END;
   recipmax:=r;
   ok:=true;
99:IF NOT ok THEN recipmax:=maxint;
END;
begin
  a:= iota 0;a[maximum]:=0;
  if recipmax = maxint then writeln ('PASS gotodemo') else writeln('FAIL gotodemo'); 
end.
