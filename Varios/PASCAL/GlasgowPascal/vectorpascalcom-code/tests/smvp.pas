program smvp;{$r-}
{Usage of the program 
  smvp digit
    where digit is 1, 2 , 3 or 4
    it will run the matrix vector product using one of 4 algorithms
    1 is the built in dot product operator
}
const cols = 4096;
      rows = 4096;
      alpha =1;
      beta =2;
      runs =20;
type t = real;
     tv = array[1..cols] of t;
     tv2= array[1..rows] of t;
     tm = array[1..rows,1..cols] of t;

var A:tm; B:tv;C:tv2;start,finish,delay:double;i:integer;
    
    s:string;
 

procedure mul4(var A:tm; var X:tv;var Y:tv2);
var tmp:t;i,j:integer;
begin
	for i:=1 to rows do
        begin
         tmp:=0;
	 for j:= 1 to cols do
	    tmp:=tmp +A[i,j]* X[j];
         Y[i]:=tmp*(alpha)+(Y[i]*beta);
	end;
end;
 
procedure init;
begin
       
	A:= (iota 0 * iota 1) AND 13;
 
        B:= 1;
end;
begin
	init;
 	 
	if paramcount<1 then s:='1'
	else s:=paramstr(1);
	writeln('method ',s);
	start:=secs;
	for i:= 1 to runs do
	case ord(s[1])-ord('0') of
        1:	C:=(A.B)*alpha + beta*C;
	2:	C:=(\+ A[iota 0]* B)*alpha+ beta*C;
	3:	C:= A[iota 0]. B*alpha+ beta*C;
	4:      mul4(A,B,c);
        end;
	finish:=secs;
	writeln (start,finish);
	delay:=finish - start;
	writeln('matrix size', rows*cols:8, ' average of ',runs :4,' runs ',1000*(delay)/runs,'ms ',(2*rows*cols)*(runs/delay)/1e6,' mflops');
end.
