{
This is a matrix transpose unit designed to maximise the number of
adjacent elements to be extracted from the array, to allow MMX-style
optimisations.
}

UNIT transpose(datum); {datum is the data type}

INTERFACE

TYPE
   row ( n : integer )	= Array[0..n] of datum;
   row4			= Array[0..3] of datum;
   row2			= Array[0..1] of datum;
   matrix (m,n:integer)	= Array[0..n, 0..m] of datum;
   matrixt(n,m:integer)	= Array[0..m, 0..n] of datum;
   matrix4		= Array[0..3, 0..3] of datum;
   matrix2		= Array[0..1, 0..1] of datum;

FUNCTION trans2x2(inputarray : matrix2) : matrix2;
FUNCTION trans4x4(inputarray : matrix4) : matrix4;
PROCEDURE transNxM(var inputarray  : matrix;
		   var outputarray : matrixt);

IMPLEMENTATION

FUNCTION trans4x4(inputarray  : matrix4) : matrix4;
VAR
   {The following need to be in registers for efficient implementation}
   rowbuf1, rowbuf2,
   rowbuf3, rowbuf4 : row4;
   outputarray	    : matrix4;
   temp		    : datum;
BEGIN
   {Inputarray data
   Note that these are contiguous areas of memory, and so can be read
   quickly using instructions like MOVQ, MOVD, MOVLPS, MOVHPS, MOVSS, MOVUPS
   }

   rowbuf1:= inputarray[0];
   rowbuf2:= inputarray[1];
   rowbuf3:= inputarray[2];
   rowbuf4:= inputarray[3];

   {
   Using repeated calls to a procedure would be neater,
   but these have to be inlined anyway.
   I have done this myself to try and help the optimiser...
   The idea is that this next section can be done entirely in registers
   (by moving the data between MMX/XMM and XMM/MMX/GP registers) using
   instructions like MOVD, MOVMSKPS, PMOVPSKB, MOVSS
   }
   temp := rowbuf2[0]; rowbuf2[0] := rowbuf1[1]; rowbuf1[1] := temp; {12,21}
   temp := rowbuf3[0]; rowbuf3[0] := rowbuf1[2]; rowbuf1[2] := temp; {13,31}
   temp := rowbuf2[2]; rowbuf2[2] := rowbuf3[1]; rowbuf3[1] := temp; {32,23}
   temp := rowbuf4[0]; rowbuf4[0] := rowbuf1[3]; rowbuf1[3] := temp; {14,41}
   temp := rowbuf2[3]; rowbuf2[3] := rowbuf4[1]; rowbuf4[1] := temp; {42,24}
   temp := rowbuf3[3]; rowbuf3[3] := rowbuf4[2]; rowbuf4[2] := temp; {43,34}

   {Write the result out again. Note that this is again continguous access
   per row, and can use instructions like MOVQ, MOVHPS, MOVLPS, MOVMSKPS,
   MOVSS, MOVUPS
   }
   outputarray[0] := rowbuf1;
   outputarray[1] := rowbuf2;
   outputarray[2] := rowbuf3;
   outputarray[3] := rowbuf4;

   trans4x4 := outputarray;
END; { trans4x4 }

FUNCTION trans2x2(inputarray : matrix2) : matrix2;
VAR
   {The following need to be in registers for efficient implementation}
   row1, row2  : row2;
   temp	       : datum;
   outputarray : matrix2;
BEGIN
   {Note that these rows are contiguous areas of memory, and so can be read
   quickly:
   }
   row1:= inputarray[0];
   row2:= inputarray[1];

   {
   The idea is that this next section can be done entirely in registers.
   }
   temp := row2[0]; row2[0] := row1[1]; row1[1] := temp; {12,21}

   {Write the result out again:}
   outputarray[0] := row1;
   outputarray[1] := row2;

   trans2x2 := outputarray;
END; { trans2x2 }

{Transpose an NxM matrix}
PROCEDURE transNxM (var inputarray  : matrix;
		    var outputarray : matrixt);
VAR
   i,j	       : integer; {loop counters}
   temp	       : matrix4;
   temp2       : matrix2;
BEGIN
   if inputarray.N >= 3 then
      for i := 0 to (((inputarray.N + 1) div 4) - 1) do
      begin
	 {Transpose main body}
	 if inputarray.M >= 3 then
	    for j := 0 to (((inputarray.M + 1) div 4) - 1) do
	    begin
	       {NB: Multiplication by 4 is left-shift by 2 (fast)}
	       temp := inputarray[4*i .. (4*i)+3][4*j .. (4*j)+3];
	       outputarray[4*j .. (4*j)+3][4*i .. (4*i)+3] := trans4x4(temp);
	    end;
	 {Copy the ends of the rows}
	 if (((inputarray.M + 1) mod 4) = 1) then
	    for j := 4*i to ((4*i)+3) do
	       outputarray[inputarray.M][j] := inputarray[j][inputarray.M];
	 if (((inputarray.M + 1) mod 4) = 2) then
	    for j := (4*i) to ((4*i)+3) do
	    begin
	       temp2 := inputarray[j..j+1][(inputarray.M - 1)..inputarray.M];
	       outputarray[(inputarray.M - 1)..inputarray.M][j..j+1] :=
	          trans2x2(temp2);
	       j:= j + 1; {make for loop be step 2}
	    end;
	 if (((inputarray.M + 1) mod 4) = 3) then
	 begin
	    for j := (4*i) to ((4*i)+3) do
	    begin
	       temp2 := inputarray[j..j+1]
	          [(inputarray.M - 2)..(inputarray.M - 1)];
	       outputarray[(inputarray.M - 2)..(inputarray.M - 1)][j .. j+1]:=
	          trans2x2(temp2);
	       j:= j + 1; {make for loop be step 2}
	    end;
	    for j := (4*i) to ((4*i)+3) do
	       outputarray[inputarray.M][j] := inputarray[j][inputarray.M];
	 end;
      end; {for i}
   {Copy the ends of the columns:}
   if (((inputarray.N + 1) mod 4) = 1) then
      for i := 0 to inputarray.M do
	 outputarray[i][inputarray.N] := inputarray[inputarray.N][i];
   if (((inputarray.N + 1) mod 4) = 2) then
   begin
      for i := 0 to (((inputarray.M + 1) div 2) - 1) do
      begin
	 temp2 := inputarray[(inputarray.N - 1)..inputarray.N][2*i..(2*i)+1];
	 outputarray[2*i .. (2*i)+1][(inputarray.N - 1)..inputarray.N] :=
	    trans2x2(temp2);
      end;
      if ((2*(((inputarray.M + 1) DIV 2)-1)) <> (inputarray.M + 1)) then
      begin;
	 outputarray[inputarray.M][(inputarray.N - 1)] :=
	    inputarray[(inputarray.N - 1)][inputarray.M];
	 outputarray[inputarray.M][inputarray.N] :=
	    inputarray[inputarray.N][inputarray.M];
      end;
   end;
   if (((inputarray.N + 1) mod 4) = 3) then
   begin
      for i := 0 to (((inputarray.M + 1) div 2) - 1) do
      begin
	 temp2 :=
	    inputarray[(inputarray.N - 2)..(inputarray.N - 1)][2*i..(2*i)+1];
	 outputarray[2*i..(2*i)+1][(inputarray.N - 2)..(inputarray.N - 1)] :=
	    trans2x2(temp2);
      end;
      if ((2*(((inputarray.M + 1) DIV 2)-1)) <> (inputarray.M + 1)) then
      begin;
	 outputarray[inputarray.M][(inputarray.N - 2)] :=
	    inputarray[(inputarray.N - 2)][inputarray.M];
	 outputarray[inputarray.M][(inputarray.N - 1)] :=
	    inputarray[(inputarray.N - 1)][inputarray.M];
      end;
      for i := 0 to inputarray.M do
	 outputarray[i][inputarray.N] := inputarray[inputarray.N][i];
   end;
END; { transNxM }

BEGIN
   {Any unit initialisation code goes here }
END.