PROGRAM Tsort2;
TYPE pnode=^node;
     textline=string[80];
     pline=^textline;
     node=RECORD line:pline; l,r:pnode END;
VAR  l:textline;
     t:pnode;
FUNCTION newnode(line:textline; l,r:pnode):pnode;
 VAR p:pnode;
 BEGIN
      NEW(p);
      getmem(p^.line,length(line)+1);
      p^.line^:=line;
      p^.l:=l;
      p^.r:=r;
      newnode:=p
 END;

PROCEDURE insert(s:textline; VAR p:pnode);
 BEGIN
     IF p=nil THEN p:=newnode(s,nil,nil)
     ELSE
       IF s< p^.line^ THEN insert(s,p^.l)
       ELSE insert(s,p^.r)

 END;
 procedure print(p:pnode);forward;
PROCEDURE print(p:pnode);
 BEGIN
      IF p<>nil THEN WITH p^ DO BEGIN
         print(l);
         writeln(line^:1);
         print(r);
      END;
 END;
BEGIN
     t:=nil; { an empty tree }
     REPEAT
           READLN(l);
           IF l<>'' THEN insert(l,t);
     UNTIL l='';



     print(t);  { output in sorted order }
     l:='a';
     while l<>'' do begin
          readln(l);
          insert(l,t);
     end;
     print(t);
END.