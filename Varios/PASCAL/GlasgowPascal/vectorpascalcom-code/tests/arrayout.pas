PROGRAM ARRAYOUT(OUTPUT);
CONST a:ARRAY[1..2,1..2,1..3] OF integer=
        ((( 1,2,3),
          ( 2,4,6)),
         (( 99,2,97),
          ( 98,4,94)));
BEGIN
	write(a);
END.
