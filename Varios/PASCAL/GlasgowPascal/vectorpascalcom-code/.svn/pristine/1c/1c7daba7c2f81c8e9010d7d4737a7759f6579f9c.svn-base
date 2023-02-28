{   Vector Pascal Acceptance Test    }
{ file  conf561 }
{:tests  that data hazzards are found in vectorised for loops }
{to work this should be compiled with the -opt2 option } 
program conf561;{$r-}
const len=17;
{$r- this is a test to see if simple for loops parallelise }
var a,b,c:array[1..len] of real;
    m:array[1..len,1..len] of real;
var i,j: integer;t:real; ok:boolean;
begin
    ok:=true;
        j:=2;
	    b:= j;
	    c:= 1;
		for i:= 1 to len do
		  a[i]:=b[i]+c[i];   { this can parallelise }
		t:=0;
		for i:= 1 to len do
		  t:= t+ a[i];       { this must not parallelise }
		if t<> (1+j)*len then ok:=false;
		m:=0;
		for i:= 1 to len do 
		  m[1,i]:=c[i];      { this can parallelise }
		for i:= 1 to len do 
		  m[i,1]:= c[i];     { this should not parallelise }
		t:=\+\+ m;
		if t<> (2*len-1) then ok:=false;
		for i:= 1 to len  do 
		   a[i]:=i;          { this should not parallelise }
		for i:= 1 to len do
		   if a[i]<> i then ok:=false;
		
	 if ok then writeln(' PASS...  parallel for loops')
    else writeln(' FAIL...  parallel for loops');
	 
end.
