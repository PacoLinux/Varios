PROGRAM STRINGS(OUTPUT);
VAR S,B:STRING[80];
BEGIN
   S:='SAMMY SNAKE';B:='Billy King';
   WRITE(S[1],S[3],LENGTH(S));
   S[2]:='I';
   S[3]:='L';
   S[4]:='L';
   WRITELN(S);
   writeln(s[1..4]);
   s[1..4]:=b[1..4];

   write(s);
   s:=substring(b,6,10);
   write(s);
END.
