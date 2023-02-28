{  Vector Pascal Acceptance Test    }
{ file  conf556 }
{:tests  that 4 variants of matrix vector product are identical }
program conf557;{$r-}

const rows = 4;
      cols = rows;

type t = real;
     tv = array[1..cols] of t;
     tm = array[1..rows,1..cols] of t;

var A:tm; B,C1,C2,C3,C4:tv;start,finish:double;i:integer;ok:boolean;
    
    s:string;
procedure mul1(var A:tm; var X,Y:tv);
begin
	Y:=A.X;
end;

procedure mul2(var A:tm; var X,Y:tv);
begin
	Y:=\+ A[iota 0]* X;
end;

procedure mul3(var A:tm; var X,Y:tv);
begin
	Y:= A[iota 0]. X;
end;

procedure mul4(var A:tm; var X,Y:tv);
var tmp:t;i,j:integer;
begin
	for i:=1 to rows do
        begin
         tmp:=0;
	 for j:= 1 to cols do
	    tmp:=tmp +A[i,j]* X[j];
         Y[i]:=tmp;
	end;
end;
procedure init;
begin
	A:= (iota 0 * iota 1) mod 13;
        B:= 1;
end;
begin
	init;
		mul1(A,B,C1);
		mul2(A,B,C2);
	 
		mul3(A,B,C3);
	 
		mul4(A,B,C4);
       ok:=true;
       for i:= 1 to cols do
       if not( (c1[i]=c2[i])and(c3[i]=c4[i]) and (c1[i]=c3[i]) ) then ok:=false;
       if ok 
	then
        writeln('PASS CONF557 matrix vector product implementation') 
	else
	begin
        	writeln('FAIL CONF557 matrix vector product implementation');
	 
	end
		 
 
 
end.
