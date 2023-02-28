program nest;
 var c:integer;
     v:string; 
 procedure s(l:string);
 begin
   c:=length(l);
 end;
 procedure a(p:integer);
  var x:integer;
  procedure b;
   var y:integer;
    procedure d(p:integer);
    begin
      y:=p;
      c:=x+y;
    end;{ of d }
   begin
     d(1);
   end; { of b }
  begin
  
   writeln(c);
   x:=p;
   b;
  end; { of a }
begin
  c:=0;
  v:='four';
  s(v);
  writeln(c);
  a(2);
  writeln(c);
end.
