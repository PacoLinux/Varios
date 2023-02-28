PROGRAM seive(output);
(*! Program to compute the first maxlim primes using an algorithm due
to Erastostenes. It is included as a test of set operations. 
I makes use of aribitrary sized sets, with the set size given
by the constant maxlim. *)
LABEL 99;
CONST maxlim=40000;
      iter=300;
TYPE range= 1..maxlim;
     intset=SET OF range;
VAR primes:intset;
    i,k,j,c:integer;l :real;
BEGIN
	primes:=[2..maxlim];
	k:=1;
	l:=sqrt(maxlim);
	{writeln(l);}
	for c:= 1 to iter do
	FOR i IN primes DO
	 BEGIN
		IF i>l THEN GOTO 99;
		j:=i*(k+1);k:=i;
		WHILE j<= maxlim DO BEGIN
			primes:=primes-[j];
			j:=j+i;
		END;
	 END;
	99:primes:=primes+[1];
	{FOR  i IN primes DO WRITELN(i);}
	writeln('first ',maxlim,' primes computed ',iter,' times');
END.
{
speed for 300 iterations 
		                        vpc        prospero
Maxlim 10000        0.56           20.2
Maxlim 15000        0.61           42
Maxlim 20000        0.73           41.79
Maxlim 25000        0.91           63
Maxlim 40000        1.30           315
}
