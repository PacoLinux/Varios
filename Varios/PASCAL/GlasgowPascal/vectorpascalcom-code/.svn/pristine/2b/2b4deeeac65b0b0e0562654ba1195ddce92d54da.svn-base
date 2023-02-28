unit syntaxtree;

interface
uses lexemes;
   type ppnode = ^pnode;
     pnode = record
             tag:lexeme;
             nodes:array[1..4] of ppnode;
             end;
implementation


     function mknode(t:lexeme):ppnode;   overload;
     var p:ppnode;
     begin
          new(p);
          p^.tag:=t;
          mknode:=p
     end;
     function mknode(t:lexeme;i:ppnode):ppnode;   overload;
     var p:ppnode;
     begin
          p:=mknode(t);
          p^.nodes[1]:=i;
          mknode:=p;
     end;
     function mknode(t:lexeme;i,j:ppnode):ppnode;   overload;
     var p:ppnode;
     begin
          p:=mknode(t,i);
          p^.nodes[2]:=j;
          mknode:=p;
     end;
     function mknode(t:lexeme;i,j,k:ppnode):ppnode;   overload;
     var p:ppnode;
     begin
          p:=mknode(t,i,j);
          p^.nodes[3]:=k;
          mknode:=p;
     end;
     function mknode(t:lexeme;i,j,k,l:ppnode):ppnode;   overload;
     var p:ppnode;
     begin
          p:=mknode(t,i,j,k);
          p^.nodes[4]:=l;
          mknode:=p;
     end;

end.
