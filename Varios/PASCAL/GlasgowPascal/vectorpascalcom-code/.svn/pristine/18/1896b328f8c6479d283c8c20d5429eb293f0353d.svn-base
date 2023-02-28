
PROGRAM Shannon;
VAR P:ARRAY [char] OF real;
    valid:boolean;
FUNCTION H(PROTECTED VAR P:ARRAY[char] OF real):real;
     FUNCTION Log2( x: real): real;
       CONST
         Log2e = 1.442695;   
       BEGIN  
		Log2 := ln(x)* log2e; 
       END;
   BEGIN
     H:= \+ (-P*Log2(P));
   END ;
PROCEDURE ReadAndValidate(VAR P:ARRAY[char] OF real);
   CONST tolerance = 0.005;
   VAR low,high,sum:real;
   BEGIN
       read(P);
       low:= \MIN P;  
       high:= \MAX P;
       sum:= \+ P;
       valid:= (low>0) AND (high<=1) AND (sum < 1+tolerance) AND  ( sum >1-tolerance);
       IF NOT valid THEN WRITE('data invalid');
       P:= P/sum; {renormalise}
   END  ;
BEGIN
   ReadAndValidate(P);
   IF valid THEN WRITE(H(P)) ;
END.
