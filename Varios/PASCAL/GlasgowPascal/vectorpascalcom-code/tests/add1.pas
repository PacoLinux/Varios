(*
Program to Add 1 to every element of an array
*)
PROGRAM Add1;
TYPE    vec=ARRAY[ 1.. 4 ] OF integer;
CONST   c:ARRAY[ 1.. 4 ] OF integer=(1,2,3,5);
var i:integer;
BEGIN
        i:=c[2];
        write(i);
   write(c,c+1,1+2*c);
END.
	


