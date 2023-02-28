unit bugunit;

interface

type
   Matrix_Real(rhi,chi:Integer) = array[0..rhi,0..chi] of Real;
   { Row LOw, Row HIgh, Column LOw and Column HIgh bounds. }
   
   pMatrix_Real                = ^Matrix_Real;
   
implementation

procedure Matrix_Add (var dest            : Matrix_Real;
              var source_a,source_b : Matrix_Real) ;
begin
   dest := source_a + source_b;
end; { Matrix_Add }

begin
end.
      
