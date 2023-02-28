PROGRAM setcomp ( output);
TYPE chs=SET OF char;
(* Print the set s*)
PROCEDURE pset(VAR s:chs); 
VAR c:char;
BEGIN
     FOR c IN s DO WRITE(c);
END;
{ print s1 op s2 '=' }
PROCEDURE ptrip(VAR s1,s2:chs;op:string);
BEGIN
  pset(s1);WRITE(op:3);pset(s2);WRITE('= ':3);
END;
VAR v,v1,v2,v3:chs;
BEGIN
  v:=['a'..'f']; v1:=['A'..'M'];v2:=v+v1;
  WRITE('v =':12);pset(v);WRITELN;
  WRITE('v1=':12);pset(v1);WRITELN;
  WRITE('v2=':12);pset(v2);WRITELN;
  v3:=v2-v1;
  WRITE('v2-v1=':12);pset(v3);WRITELN;      
  v3:=(v2)*['A'..'c'];
  WRITE('v2*[ A..c]=':12);pset(v3);WRITELN;
  ptrip(v1,v2,' =');WRITELN(v1=v2:6);
  ptrip(v1,v2,'<>'); WRITELN(v1<>v2:6);
  ptrip(v1,v2,' <=');WRITELN(v1<=v2:6);
  ptrip(v1,v2,' >='); WRITELN(v1>=v2:6); 
  v3:= v2 >< v;
  ptrip(v2,v,' ><');  pset(v3);WRITELN;
END.
