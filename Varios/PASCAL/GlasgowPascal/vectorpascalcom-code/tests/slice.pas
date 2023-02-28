(* Demonstrate array slicing *)
PROGRAM slice;
CONST dataset:ARRAY[1..5,1..5] OF integer=
              (( 1, 2, 3, 5, 7),
               (11,13,17,19,23),
               (12,15,20,24,30),
               (23,28,37,43,53),
               (35,43,57,67,83));
VAR a:ARRAY[1..5,1..5] OF integer;
BEGIN
  WRITELN('dataset'); WRITE(dataset:3);
  WRITELN('dataset[2..3]'); WRITE(dataset[2..3]:3);
  WRITELN('dataset[][3..5]'); WRITE(dataset[][3..5]:3);
  WRITELN('dataset[2..3][3..5]'); WRITE(dataset[2..3][3..5]:3);
  WRITELN('dataset[][2]'); WRITE(dataset[][2]:3);
  WRITELN('dataset[2]');WRITE(dataset[2]:3);
  WRITELN('dataset[2,3]');writeln(dataset[2,3]:3);
  a:= iota 0 + 3* iota 1;
  writeln(a);
  a:=-1;
  a[2]:=iota 0 ;
  writeln(a,a[2]);a:=-1;

  a[][2]:=iota 0 + 3* iota 1 ;
  writeln(a);write(a[][2]);a:=-1;

  a[][3..5]:=iota 0 + 3*iota 1;

  writeln(a);a:=-1;

   a[2..4][3..5]:= iota 0 + 3* iota 1;
  writeln(a,a[2..4][3..5]);
  a:=-1;
  a[][2]:=iota 0 + 3* iota 1;
  writeln(a);
END. 
