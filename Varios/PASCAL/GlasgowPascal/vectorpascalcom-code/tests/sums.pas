Program sums;
CONST maximum=10;
VAR a:ARRAY[1..maximum] OF real;

{ typical Vector Pascal }
FUNCTION newsum:real; 
BEGIN 
	newsum := \+ a 
END;

{ typical Pascal }
FUNCTION oldsum:real;
VAR i:integer;
    t:real;
BEGIN
   t:=0;
   FOR i:= 1 TO maximum DO 
      t:= t+ a[i];
   oldsum:=t;
END;
begin
end.

