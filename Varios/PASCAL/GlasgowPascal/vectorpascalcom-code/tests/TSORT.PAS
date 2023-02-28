PROGRAM Tsort;
TYPE pnode=^node;
     textline=string[80];
     node=RECORD line:textline; l,r:pnode END;
VAR  l:textline;
     t:pnode;
FUNCTION newnode(line:textline; l,r:pnode):pnode;
 VAR p:pnode;
 BEGIN
      NEW(p);
      p^.line:=line; p^.l:=l; p^.r:=r;
      newnode:=p
 END;
PROCEDURE insert(s:textline; VAR p:pnode);
 BEGIN
     IF p=nil THEN p:=newnode(s,nil,nil)
     ELSE IF s<p^.line THEN insert(s,p^.l)
     ELSE insert(s,p^.r)
 END;
PROCEDURE print(p:pnode);
 BEGIN
      IF p<>nil THEN WITH p^ DO BEGIN
         print(l);writeln(line);print(r);
      END;
 END;
BEGIN
     t:=nil; { an empty tree }
     REPEAT
           READLN(l);
           IF l<>'' THEN insert(l,t);
     UNTIL l='';
     print(t);  { output in sorted order }
END.