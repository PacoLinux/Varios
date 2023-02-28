type pp=procedure(i:integer);
var p:pp;
procedure p1(i:integer);
begin write(i); end;
procedure p2(ppp:pp);
begin ppp (2) end;
procedure nest;
 procedure nested(i:integer);
 begin
   write (i+1);
 end;
 begin
     p2(nested)
 end;
end;
begin
   p:=p1;
   p(1);
   p2(p1);
end.