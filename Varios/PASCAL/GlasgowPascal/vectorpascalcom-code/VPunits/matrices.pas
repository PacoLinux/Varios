unit matrices;
(*! Implements some basic \begin{bf}matrix operations\end{bf} to do matrix algebra,
	some vector manipulation and display matrices.
	*)

interface

const
	DimM = 3;

type
	VectorM = array[0..DimM-1] of real;
	Matrix = array[0..DimM-1,0..DimM-1] of real;

(*! \begin{bf}Premultiply\end{bf} v by the \begin{bf}matrix\end{bf} M.\\
	Returns M x v where v is treated as a column matrix,
	and the return value is given as a vector.
	*)
function premultiply(M: Matrix; v: VectorM) : VectorM;
(*! \begin{bf}Add\end{bf} the matrices M and N.
	*)
function matrixAdd (M, N : Matrix) : Matrix;
(*! \begin{bf}Subtract\end{bf} the matrices M and N.
	*)
function matrixSub (M, N : Matrix) : Matrix;
(*! \begin{bf}Multiply\end{bf} the matrices M and N.
	Return the \begin{bf}matrix product\end{bf} M x N.
	*)
function matrixProd (M, N : Matrix) : Matrix;
(*! \begin{bf}Returns the Identity Matrix.\end{bf}
	dummy is a redundant variable used because pascal requires a parameter.
	*)
function identity(dummy : Boolean) : Matrix;
(*! \begin{bf}Rotation of the Point P through the angle $\phi$ about the 'Center'.\end{bf}
	*)
function dim2Rotation(P, Center: VectorM; phi : real) : VectorM;
(*! \begin{bf}Display\end{bf} the matrix M on the form:\\
	[M$_{0,0}$, M$_{0,1}$, ..., M$_{0,DimM}$]\\
	[M$_{1,0}$, M$_{1,1}$, ..., M$_{1,DimM}$]\\
	[..., ..., ..., ...., ...]\\
	[M$_{DimM,0}$, M$_{DimM,1}$, ..., M$_{DimM,DimM}$]
	*)
procedure displayMatrix (M : Matrix);

implementation
	
function premultiply(M: Matrix; v: VectorM) : VectorM;
begin
	premultiply := \+ trans (M * v);{Multiplies v by each row in M. Transpose that 2D matrix in order to reduce the right dimension. The sum the columns of that matrix to get a 1D matrix (VectorM).}
end;

function matrixAdd (M, N : Matrix) : Matrix;
begin
	matrixAdd:= M + N; {For all relevant i,j, add each pair of elements (M[i,j], N[i,j]).}
end;

function matrixSub (M, N : Matrix) : Matrix;
begin
	matrixSub:= M - N; {For all relevant i,j, subtract each pair of elements (M[i,j], N[i,j]).}
end;

function matrixProd (M, N : Matrix) : Matrix;
begin
	matrixProd := \+ trans (M * N[iota 0]); {Does the same as premultiply with each row of N corresponding to v.}
end;

function identity(dummy: Boolean) : Matrix;
begin
	identity := if iota 0 = iota 1 then 1 else 0; {Set all entries but the first diagonal to 0. Set the entries on the first diagonal to 1}
end;

function dim2Rotation(P, Center: VectorM; phi : real) : VectorM;
var
	retVal: VectorM;
	rotMatrix: Matrix;
begin
	rotMatrix := if iota 0=iota 1 then 1 else 0; {Generate an identity matrix.}
	rotMatrix[0..1][0..1] := if iota 0=iota 1 then cos phi else sin phi; {Set the topleft 2x2 slice of rotMatrix to be rotation through the given angle (continued...}
	rotMatrix[0,1] := -rotMatrix[0,1]; {Finalise rotMatrix to be a rotation matrix.}

	retVal:= P-Center;	{Translate the return value to make the origin the centre of rotation.}
	retVal:= premultiply(rotMatrix, retVal); {Perform the rotation.}
	dim2Rotation:= retVal+ Center; {Return retVal after translating it back (making Center the centre of rotation.)}
end;
	

procedure displayMatrix (M : Matrix);
var
	i, j: Integer;
begin
	for j:= 0 to DimM-1 do {Display each row of the Matrix M.}
	begin
		write('[');
		write(M[j,0]); {Display the first element of the jth row.}
		for i:= 1 to DimM-1 do
		begin
				write(',');
				write(M[j,i]);{Display the ith element of the jth row.}
		end;
		writeln(']');
	end;
end;

begin
end.
