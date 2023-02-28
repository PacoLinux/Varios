PROGRAM sort2;
USES calendar,datesort,intsort;
CONST a:ARRAY[1..5] OF integer=(2,8,3,4,7);
var b:ARRAY[1..5] OF integer;
    c:ARRAY[1..3] OF date;
    i,d:integer;
BEGIN
	  b:=a;
	  sort(b[1..4]);
	  WRITE(a,b);
          for i:= 1 to 3 DO
	  BEGIN
		read(d);c[i].day:=d; read(c[i].month,c[i].year);
	  END;
	  sort(c[1..3]);
          FOR i:= 1 TO 3 DO writeln(c[i].day,c[i].month,c[i].year);
END.
