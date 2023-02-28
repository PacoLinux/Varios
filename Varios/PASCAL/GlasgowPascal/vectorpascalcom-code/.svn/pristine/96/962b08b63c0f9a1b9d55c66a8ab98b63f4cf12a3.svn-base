unit stacks ;
interface uses conslists;
type
    stack = record
            head:list;

            end;
           procedure newstack(var st:stack);
            procedure push(var st:stack;c:cellpntr);
            function pop(var st:stack;var c:cellpntr):boolean;
            function empty(var st:stack):boolean;
            procedure show(var st:stack;var listing:text);
            procedure destroy(var st:stack);
                procedure map(var st:stack;
                   whichway:direction;
                   var s:cellpntr;
                   var m:action);
implementation

function empty:boolean;
begin
with st do
     empty:=head=nil
end;
procedure  show;
begin
with st do
     if head<>nil then  head^.show(listing)
     else write(listing,'Empty');
end;
procedure  newstack;
begin
  with st do
     head:=nil;
end;
procedure  destroy;
begin with st do
     if head<>nil then dispose(head );

end;
procedure  push;
begin
   with st do begin
     head:= cons(c,head);
  end
end;
function pop;
var temp:list;
begin
with st do
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
procedure  map;
begin
 with st do
     if head<>nil then map( head^,whichway,s,m);
end;
end.
