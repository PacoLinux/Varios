PROGRAM sortf;
{ Program to sort a file of lines alphabetically }
CONST  maxsize=100;
TYPE   t=STRING[80];
       index=1..maxsize;
       dataarray=ARRAY[1..maxsize] OF t;
VAR buf:dataarray;
    count,i:integer;

PROCEDURE sort(	VAR a:dataarray; 
            n:index);
VAR i,j:integer;
    temp:t;
BEGIN
        FOR i:= 1 TO n-1 DO
         FOR j:= 1 TO n-1 DO
           IF a[j]>a[j+1] THEN 
           BEGIN
             temp := a[j]; a[j]:= a[j+1];
	     a[j+1]:=temp;
           END;
END;
{ Read lines up until a blank line }
PROCEDURE readdata(	VAR a:dataarray; 
	var n:integer) ;
LABEL 99;
VAR s:t;
BEGIN
      n:=0;
      REPEAT
       READLN(s);
       IF s<>'' THEN 
       BEGIN
         n:=SUCC(n);
         a[n]:=s;
       END
      UNTIL (s='') OR( n=maxsize);
END;

BEGIN
     readdata(buf,count);
     IF count>0 THEN sort(buf,count);
     FOR i:= 1 TO count DO WRITELN(buf[i]);

END.
