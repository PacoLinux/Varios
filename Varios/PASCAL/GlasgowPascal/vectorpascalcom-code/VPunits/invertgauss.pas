UNIT invertgauss(datum);
{
This is a matrix inversion unit designed to maximise the number of
adjacent elements to be extracted from the array, to allow MMX-style
optimisations.

The inversion of any matrix for which its inversion exists is the
transpose of the adjunct of the matrix, divided by its determinant.

The adjunct of the matrix is the matrix found by replacing each element
by its cofactor.

No solution exists if the determinant of the original matrix is 0 (divide by
zero error).
}

INTERFACE

USES transpose(datum);

TYPE
   intarray (n:integer)   = array[0..N] of integer;
   matrixNxN (n,m:integer)= array[0..N,0..M] of datum; {TODO: Force n=m}

{Find the inverse:}
PROCEDURE invertMatrix (var a : matrixNxN);
{Find the transpose of the inverse:}
PROCEDURE invertTransposeMatrix (var a : matrixNxN);
{Premultiply a matrix b with the transpose of second matrix, c}
PROCEDURE matmul(var b,c,a : matrixNxN);
{Find c = a solve b}
PROCEDURE solve(var a,b,c : matrixNxN);

IMPLEMENTATION

{This function is based on the C program given in Intel's publication
AP-928 ``Streaming SIMD extensions : Inverse of 4x4 Matrix''
}
{FUNCTION invertMatrix(var a : matrixNxN) : matrixNxN;}
PROCEDURE invertMatrix(var a : matrixNxN);
LABEL 99;
VAR
   indxc, indxr, ipiv	       : ^intarray;
   big, dum, pivinv, temp, bb  : datum;
   i, icol, irow, j, ir, ic, k : integer;
BEGIN
   new(indxc,a.n);
   new(indxr,a.n);
   new(ipiv,a.n);
   ipiv^ := -1;
   {Preset other vars:}
   indxr^ := 0;
   indxc^ := 0;
   {Preset vars done}
   for i := 0 to a.N do
   begin
      big := 0;
      for j := 0 to a.N do
      begin
	 if ipiv^[j] <> 0 then
	 begin
	    for k := 0 to a.N do
	    begin
	       if ipiv^[k] > 0 then
		  goto 99;
	       if ipiv^[k] = -1 then
	       begin
		  bb := abs(a[j][k]);
		  if bb > big then
		  begin
		     big := bb;
		     irow := j;
		     icol := k;
		  end;
	       end; {ipiv^[k] = -1}
	    end;
	 end;
      end; {j 0 to a.N}
      ipiv^[icol] := ipiv^[icol] + 1;
      if irow <> icol then
	 for j := 0 to a.N do
	 begin
	    temp := a[irow][j];
	    a[irow][j] := a[icol][j];
	    a[icol][j] := temp;
	 end;
      indxr^[i] := irow;
      indxc^[i] := icol;
      if a[icol][icol] = 0 then
	 goto 99;
      pivinv := 1.0/(a[icol][icol]);
      a[icol][icol] := 1;
      a[icol] := a[icol] * pivinv;
      for j := 0 to a.N do
      begin
	 if icol <> j then
	 begin
	    dum := a[j][icol];
	    a[j][icol] := 0;
	    a[j] := a[j] - a[icol] * dum;
	 end;
      end;
   end; {i 0 to a.N}
   for i := 0 to a.N do
   begin
      j := a.N - i;
      if indxr^[j] <> indxc^[j] then
      begin
	 ir := indxr^[j];
	 ic := indxc^[j];
	 for k := 0 to a.N do
	 begin
	    temp := a[k][ir];
	    a[k][ir] := a[k][ic];
	    a[k][ic] := temp;
	 end;
      end;
   end;
   99: {invertMatrix := a;}
       dispose(indxr);
   dispose(indxc);
   dispose(ipiv);
END; { invertMatrix }

PROCEDURE invertTransposeMatrix(var a : matrixNxN);
VAR
   temp	: ^matrixNxN;
BEGIN
   new(temp,a.n,a.n);
   temp^ := a;
   invertMatrix(temp^);
   transNxM(temp^,a);
   dispose(temp);
END; { invertTransposeMatrix }

{ a = b \mul c^T }
PROCEDURE matmul(var b,c,a : matrixNxN );
BEGIN
   a := \+ (b[iota 0] * c[iota 1]);
END;

PROCEDURE solve(var a,b,c : matrixNxN);
VAR
   temp : ^matrixNxN;
BEGIN
   new(temp,b.n,b.n);
   temp^ := a;
   invertTransposeMatrix(temp^);

   c := \+ (b[iota 0] * (temp^[iota 1]));

   dispose(temp);
END;

BEGIN
END.
