program HelloUser;{$r-}
const veclen=5;
type vector = array[1..veclen] of real;
     matrix = array[1..veclen,1..veclen] of real;

const v1:vector=(1,2,3,5,7 );

var v2:vector;
    m:matrix;
    scalar:real;
begin

	writeln('Hi there you have just got vpc going!');

	writeln('Lets do some vector arithmetic');
	writeln(' Here is the vector v1');
	writeln(v1);
	writeln(' we will make v2 the inverse of this');
	v2:= 1/ v1;
	writeln(v2);
	writeln('Now lets compute the inner and outer products of v1 and v2 ');
	writeln(' the inner product is written v1.v2 and gives the result ');
	scalar := v1. v2;
	writeln(scalar);
	writeln(' we initialise a matrix m to the outer product');
	m:= v1 * trans v2;
	writeln(' and here is the result');
	writeln(m);
	writeln('finally we form the sum of elements of v1 which is ',\+ v1);
end.
	
