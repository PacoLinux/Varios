unit stacks ;
interface uses lists;
type
    stack = object(collection)
            head:list;
            constructor newstack;
            procedure push(c:cellpntr);
            function pop(var c:cellpntr):boolean;
            function empty:boolean;
            procedure show(var listing:text);virtual;
            destructor destroy;virtual;
            procedure map(
                   whichway:direction;
                   var s:cellpntr;
                   var m:action);virtual;
            end;
implementation

function stack.empty:boolean;
begin
     empty:=head=nil
end;
procedure stack.show;
begin
     if head<>nil then  head^.show(listing)
     else write(listing,'Empty');
end;
constructor stack.newstack;
begin
     newcollection;
     head:=nil;
end;
destructor stack.destroy;
begin
     if head<>nil then dispose(head,destroy);
     collection.destroy;
end;
procedure stack.push;
begin
     new(head,cons(c,head))
end;
function stack.pop;
var temp:list;
begin
     if head=nil then begin c:=nil;pop:=false; end
     else begin
          temp:=head;
          head:=head^.tl;
          temp^.tl:=nil;
          pop:=true;
          c:=temp^.hd;
          dispose(temp);
     end;
end;
procedure stack.map;
begin
     if head<>nil then head^.map(whichway,s,m);
end;
end.