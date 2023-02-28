PROGRAM PrintPowers;
CONST powers:ARRAY[1..2,1..2,1..2] OF integer=(((1,2),
                                           (2,4)),
                                          ((2,4),
                                           (4,8)));                        
VAR v:array[1..2,1..2,1..2]of integer;
    t:array [1..2,1..2] of integer;
BEGIN
	write(powers);
	v:=3 pow powers;
        t:=\+v;
        write(v,t);
END.

