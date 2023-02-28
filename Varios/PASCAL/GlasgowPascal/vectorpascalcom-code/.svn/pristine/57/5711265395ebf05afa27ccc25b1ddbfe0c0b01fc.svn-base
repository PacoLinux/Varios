UNIT vectors;
(*!	Implements \begin{bf}standard vector algebra\end{bf}
	and some \begin{bf}additional functions and procedures\end{bf} to deal with vectors.
	* 
	* Note this is obsolete since the language now has all this built in
	*)

INTERFACE
USES numerics; {Provides some basic trigonometric functions}

CONST
	Dim= 3; {The Dimensions that will be used for all the vectors.}

TYPE 
	Vector = array [0..Dim-1] OF Real;

(*! \begin{bf}Multiply\end{bf} v by the \begin{bf}scalar\end{bf} f 
	*)
FUNCTION scale (v: Vector; f: Integer) : Vector;
(*! \begin{bf}Add\end{bf} the vectors u and v 
	*)
FUNCTION plus (u, v: Vector) : Vector;
(*! \begin{bf}Subtract\end{bf} the vector v from the vector u 
	*)
FUNCTION minus (u, v: Vector) : Vector;
(*! Returns a \begin{bf}unit vector\end{bf} in the i$^{th}$ direction.\\
	The i$^{th}$ entry is set to 1.\\
	All other are set to 0.\\
	*)
FUNCTION unity(i : Integer) : Vector;
(*! Returns the \begin{bf}scalar (or dot-) product\end{bf} of u and v.
	*)
FUNCTION scalarProduct (u, v: Vector) : Real;
(*! Returns the \begin{bf}vector (or cross-) product\end{bf} of u and v.
	*)
FUNCTION vectorProduct (u, v: Vector) : Vector;
(*! Returns the \begin{bf}length\end{bf} of v.
	Must only be used when \begin{em}Dim = 3\end{em} (see above)
	*)
FUNCTION vectorLength (v: Vector) : Real;
(*! Returns the \begin{bf}angle between\end{bf} the vectors u and v.
	If either u or v has length 0, then returns \begin{em}error value -5.0\end{em}.
	*)
FUNCTION angleBetween(u, v: Vector) : Real;
(*! Displays v on the form "(v$_{1}$, ..., v$_{i}$, ..., v$_{Dim}$)".
	*)
PROCEDURE display (v: Vector);

IMPLEMENTATION

FUNCTION scale (v: Vector; f: Integer) : Vector;
BEGIN
	scale:= f * v; {Multiply each element of v by f.}
END;

FUNCTION plus (u, v: Vector) : Vector;
BEGIN
	plus:= u + v; {For all i, Add together each pair (u[i], v[i])}
END;

FUNCTION minus (u, v: Vector) : Vector;
BEGIN
	minus:= u - v; {For all i, subtract each pair (u[i], v[i])}
END;

function unity (i : Integer) : Vector;
begin
	unity:= if iota 0=i then 1 else 0; {Set the dimentiona given by i to 1 and all others to 0.}
end;

FUNCTION scalarProduct (u, v: Vector) : Real;
BEGIN
	scalarProduct:= \+ u * v; {First multiply each pair of entries in u and v. Then sum these values.}
END;

FUNCTION vectorProduct (u, v: Vector) : Vector;
VAR
	i, a, b: Integer;
	retVal : Vector;
BEGIN
	FOR i:= 0 TO Dim-1 DO
	BEGIN
		a:= (i+1) mod Dim; {Calculate the row-indeces that are used to calculate the ith index of the return value}
		b:= (i+2) mod Dim;
 		retVal[i]:= u[a] * v[b] - u[b] * v[a]; 
	END;
	vectorProduct:= retVal;
END;

FUNCTION vectorLength (v: Vector) : Real;
BEGIN
	vectorLength:= sqrt \+ v * v; {The length of a vector is the square-root of the sum of the squares of each entry in v. This is a generalisation of Pythagoras' theorem.}
END;

FUNCTION angleBetween(u, v: Vector) : Real;
{Calculate the angle between u and v using the dot product}
VAR
	prodLengths: Real;
CONST
	errorMarg = 0.00001;
BEGIN
	prodLengths := vectorLength(u) * vectorLength(v);
	angleBetween:= if prodLengths*prodLengths<errorMarg then -5.0 else arccos (scalarProduct(u,v) / prodLengths);{}
END;

PROCEDURE display (v: Vector);
VAR
	i: Integer;
BEGIN
	write('(');
	write(v[0]);{Display the first element of v}
	FOR i:= 1 TO Dim-1 DO
	BEGIN
			write(',');
			write(v[i]);{Display all the other elements of v}
	END;
	write(')');
END;

BEGIN
END.
