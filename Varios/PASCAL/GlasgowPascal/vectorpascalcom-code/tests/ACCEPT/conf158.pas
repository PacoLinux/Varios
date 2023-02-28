{                Pascal Validation Suite  Version 5.7                }
{                                                                    }
{          (C) Copyright 1982, British Standards Institution         }
{                                                                    }
{ TEST 6.7.2.4-5, FILE=CONF158, CLASS=CONFORMANCE, LEVEL=0           }
{                                                                    }
{:This test checks the set operators, with all patterns possible.    }
{                                                                    }
{ There are 32 (2 to 5th power) set values, so 2048 tests are made,  }
{ which may be long (esp for bigger sets).  Another test provided in }
{ the suite is more economical, but less exhaustive.                 }
{                                                                    }
{ Modification History :                                             }
{   V4.0: Size of set decreased to lower the execution time.         }
{   V5.2: File header comments reformatted and file name added to    }
{         TEST line and output lines.                                }
{                                                                    }

program CONF158(output);
const
   Limit    = 32; { 2 to power of  cardinality of ET }
type
   ET       = (A,B,C,D,E);
   esetType = set of ET;
   erayType = array[ET] of boolean;
   Range    = 1..Limit;
var
   ev       : ET;
   s1,s2    : esetType;
   mt,
   vr,v1,v2 : erayType;
   r1,r2    : Range;
   error    : boolean;
   
      procedure printset(s:esetType);
     var cheat:record 
		case boolean of
		true:(s: esetType);
		false:(j:0..100);
		end;
      begin
		cheat.s:=s;
		write(cheat.j);
      end;

   procedure DoIt;
   { Do all operations and check them for this pair of values. }
      var uf,fi,df:esetType;
      
      procedure Union(var aa:erayType; ab,ac:erayType);
      var i:ET;
      begin
         for i:=A to E do aa[i]:=ab[i] or ac[i]
      end;

      procedure Intersection(var aa:erayType; ab,ac:erayType);
      var i:ET;
      begin
         for i:=A to E do aa[i]:=ab[i] and ac[i]
      end;

      procedure Difference(var aa:erayType; ab,ac:erayType);
      var i:ET;
      begin
         for i:=A to E do aa[i]:=ab[i] and not ac[i]
      end;

      procedure Check(SetOfE:esetType; VecOfE:eraytype);
      var i:ET;
        
      begin

	 
 
         for i:=A to E do
            if VecOfE[i] then
               begin
                  if not (i in SetOfE) then
		  begin
			 error:=true;
			 
		         
		  end
               end
            else
               if (i in SetOfE) then
			begin
				 error:=true; 
			end
      end;

   begin { of body of DoIt }
      	uf:=s1+s2;
	fi:= s1*s2; 
	df:=s1-s2; 
      Union       (vr,v1,v2); Check(uf,vr);
      Intersection(vr,v1,v2); Check(fi,vr);
      Difference  (vr,v1,v2); Check(df,vr);
   end;

   procedure Permute(k:Range; var sp:esetType; var vp:erayType);
   { Produce all permutations of sp and vp according to k }
   var x:ET;
   begin
      { What member to alter }
      x:=A;
      while not odd(k) do begin
         x:=succ(x); k:=k div 2
      end;
      { Alter the inclusion status of that value }
      
      if x in sp then
	begin
	 
	 sp:=sp-[x];
	end
	 else 
	begin
		
		sp:=sp+[x];
	end;
      
      vp[x]:=not vp[x]
   end;

begin { of body of main program }
   error:=false;
   for ev:=A to E do mt[ev]:=false;

   s1:=[]; v1:=mt;
   r1:=1;
   while r1 <> Limit do begin
      s2:=[]; v2:=mt;
      r2:=1;
      while r2 <> Limit do begin
	 
         DoIt;
	 
         Permute(r2,s2,v2);
         r2:=succ(r2)
      end;
      Permute(r1,s1,v1);
      r1:=succ(r1)
   end;

   if not error then
      writeln(' PASS...6.7.2.4-5 (CONF158)')
   else
      writeln(' FAIL...6.7.2.4-5 (CONF158)')
end.
