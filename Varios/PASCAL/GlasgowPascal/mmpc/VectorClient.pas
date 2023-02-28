PROGRAM VectorClient;
(*! Demonstrates basic \begin{bf}vector manipulation\end{bf} outputs the results to the screen. 
	This program is quite overcommented in order to \begin{em}illustrate the use of VPTeX.\end{em}
	*)
USES vectors; {Gives access the Vector type and a number of vector operations}

var
	u, v: Vector; {Will represent vectors throughout the program}
	phi: real; {Represents an angle}

BEGIN
	u:= unity(0);	v:= -u; {Initialise u and v.}
	write('The vector u:  '); display(u); writeln(', which has length ', vectorLength(u)); {Display u and it's length}
	write('The vector v:  ');	 display(v); writeln(', which has length ', vectorLength(v)); {Display v and it's length}
	phi := angleBetween(u, v); {Calculate the angle between u and v}
	writeln('The angle between them is: ', phi); {Display the angle between u and v.}
	write('u + v = '); display(plus(u, v)); writeln(''); {Display the sum of u and v.}
	write('u - v = '); display(minus(u, v)); writeln(''); {Display the difference u - v.}
	writeln('u . v = ', scalarProduct(u, v)); {Display the scalar product of u and v.}
	write('u x v = '); display(vectorProduct(u, v)); writeln(''); {Display the vector product of u and v.}
END.
