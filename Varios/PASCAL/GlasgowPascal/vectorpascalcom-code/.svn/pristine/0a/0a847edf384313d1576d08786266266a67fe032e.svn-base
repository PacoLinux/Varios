unit lists;
interface  uses fsm,dlb{vp}{,lexlib{,idtypes};
const nullcell = 0;firstcell = 5000;
      
	  firsttoken=1; firststring = 1000;
      lasttoken = firststring -1; laststring = firstcell-1;
      lastcell  =30000;
type cell = integer; 
listcell = firstcell..lastcell;
    { typerec=cell;   }
var     
     typemap : array[listcell] of cell;
function cons(car,cdr:cell):cell;
procedure append(l,r:cell);
function car(l:cell):cell;
function cdr(l:cell):cell;
function head(l:cell):cell;
procedure sethead(l,r:cell);
procedure settail(l,r: cell);
function tail(l:cell):cell;
function reallit(d:double):cell;
function intlit(l:INT64):cell;
function pntrlit(p:pointer):cell;
function getpntr(c:cell):pointer;
function ispntr(c:cell):boolean; 
function findkeyvalpair(key:integer; list:cell):cell;
procedure udatevalue(key:integer; value,list:cell);
function getreal(c:cell):double;
function getint(c:cell):int64;
function isrealcell(c:cell):boolean;
function isint(c:cell):boolean;
function istoken(c:cell):boolean;        { in firsttoken..lasttoken}
function isstring(c:cell):boolean;
function ispair(c:cell):boolean;
function getline(c:cell):integer;
function getcol(c:cell):integer;
function gettag(c:cell):integer;
function iscell(c:cell):boolean;
procedure initialise;




var zerocell:cell;
type
    sort = ( pair, rlit, ilit,plit);
    list = record
     lineno:0..50000;
     colno:0..200;
     case tag:sort of
     pair :(hd,tl:cell);
     rlit :(r:double);
     ilit :(i:int64);
     plit :(p:pointer);
     end;

implementation




var freepnt:cell;
    store:array[listcell] of list;

    function newcell:cell;
    begin
          newcell:=freepnt;
          with store[freepnt] do
          begin
               lineno:=the_line;
               colno:=1;
          end;
          freepnt:=freepnt+1;
          if freepnt >lastcell then
          writeln('list cell store full');
    end;
    function getline(c:cell):integer; begin getline:=store[c].lineno end;
    function getcol(c:cell):integer; begin getcol:=store[c].colno end;
    procedure initialise;
    begin freepnt:=firstcell;
          zerocell:=intlit(0);
    end;
    function cons(car,cdr :cell):cell;
    var t:cell;
    begin
         t:=newcell;
         with store[t] do
         begin tag:=pair;
               hd:=car;
               tl:=cdr;
         end;
         cons:=t;
    end;
procedure validate(l:integer);
begin
     if (l<firstcell) or (l>lastcell)
     then writeln(l ,' is not a cell id');
end;
function car(l:cell):cell;
begin validate(l);
     car:=store[l].hd
end;
function cdr(l:cell):cell;
begin validate(l);cdr:=store[l].tl end;
procedure append(l,r:cell);
begin
    validate(l);
    if tail(l)=nullcell then
    store[l].tl:=cons(r,nullcell)
    else append(tail(l),r);
end;
function head(l:cell):cell;  begin head:=car(l) end;
function tail(l:cell):cell;  begin tail:=cdr(l) end;
procedure sethead(l,r:cell); begin validate(l);store[l].hd:=r end;
procedure settail(l,r: cell);begin validate(l);store[l].tl:=r end;
function findkeyvalpair(key:integer; list:cell):cell;
begin
  if list =nullcell then   findkeyvalpair:=nullcell
  else if head(head(list))=key then  findkeyvalpair:=head(list)
       else findkeyvalpair:=findkeyvalpair( key,tail(list));
end;
procedure udatevalue(key:integer; value,list:cell);
var t:cell;
begin
  t:=findkeyvalpair(key,list);
  if t<>nullcell then  store[t].tl:=value
  else writeln('key ',key, ' is invalid list');
  
end;

function reallit(d:double):cell;
var t:cell;
begin
     t:=newcell;
     with store [t] do
     begin tag:=rlit;
           r:=d;
     end;
     reallit:=t;
end;

function intlit(l:INT64):cell;
var t:cell;
begin
     t:=newcell;
     with store [t] do
     begin tag:=ilit;
           i:=l;
     end;
     intlit:=t;
end;
function pntrlit(p:pointer):cell;
var t:cell;
begin
     t:=newcell;
     store [t].tag:=plit;  
     store [t].p :=p;
     pntrlit:=t;
end;


function getpntr(c:cell):pointer;begin getpntr:=store[c].p end;
function getreal(c:cell):double;begin getreal:=store[c].r end;
function getint(c:cell):int64;begin getint:=store[ c].i end;
function ispntr(c:cell):boolean;begin ispntr:= iscell( c) and (store[c].tag=plit )end;
function gettag(c:cell):integer;
begin
  if iscell(c) then  gettag:=ord(store[c].tag)
  else gettag:=-1;
end;
function isrealcell(c:cell):boolean;begin isrealcell:= iscell( c) and( store[c].tag=rlit) end;
function isint(c:cell):boolean;begin isint:= iscell( c) and (store[c].tag=ilit )end;
function istoken(c:cell):boolean;begin istoken := (c >=firsttoken)and(c<=lasttoken) end;
function isstring(c:cell):boolean;begin isstring :=( c >=firststring)and(c<=laststring) end;
function iscell(c:cell):boolean;begin iscell:= c>firstcell end;
function ispair(c:cell):boolean;begin ispair:= iscell(c) and (store[c].tag=pair) end;
begin
     initialise;
end.
