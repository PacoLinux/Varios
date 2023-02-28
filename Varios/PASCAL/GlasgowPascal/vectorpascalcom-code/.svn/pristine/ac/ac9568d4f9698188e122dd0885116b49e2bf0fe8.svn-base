unit lists;
interface

    type
    direction = (normal,reversed);
    cellpntr = ^ cell;

    cell     =  object
                constructor newcell;
                procedure show(var listing:text);virtual;
                destructor destroy;virtual;
                end;
    action   =  procedure(var c,s:cellpntr; var continue:boolean);
    collection= object(cell)
                constructor newcollection;
                procedure map(
                   whichway:direction;
                   var s:cellpntr;
                   var m:action);virtual;
                end;
    list     = ^conscell;
    conscell = object(collection)
                tl:list;
                hd:cellpntr;
                constructor cons(h:cellpntr;l:list);
                destructor destroy;     virtual;
                procedure map(
                   whichway:direction;
                   var s:cellpntr;var m:action);virtual;

                procedure show(var listing:text);virtual;
               end;
implementation
constructor conscell.cons(h:cellpntr;l:list);
begin collection.newcollection;
     tl:=l;  hd:=h;
end;
constructor collection.newcollection;begin cell.newcell end;
procedure collection.map;begin end;
procedure conscell.map;
var l:list; continue:boolean;
begin
  if whichway = normal then begin
     m(hd,s,continue);
     l:=tl;
     while continue and (l<>nil) do begin
           m(l^. hd,s,continue);
           l:=l^.tl;
     end;
  end else begin
      if tl<>nil then tl^.map(reversed,s,m);
      m(hd,s,continue);
  end;
end;
procedure conscell.show(var listing:text);
begin
     write(listing,' ');
     if hd<> nil then hd^.show(listing);
     if tl<> nil then tl^.show(listing);
end;

destructor conscell.destroy;
begin

     if hd<>nil then dispose(hd,destroy);
     if tl<> nil then dispose(tl,destroy);
end;
procedure cell.show(var listing:text);begin end;
destructor cell.destroy;begin end;
constructor cell.newcell;begin end;

end.