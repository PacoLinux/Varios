unit matrices_real;

interface

type
   Matrix_Real(rhi,chi:Integer) = array[0..rhi,0..chi] of Real;
   { Row HIgh bound, Column HIgh bound. }
   
   pMatrix_Real                = ^Matrix_Real;
   
procedure Matrix_Add (var dest            : Matrix_Real;
              var source_a,source_b : Matrix_Real);

procedure Matrix_Product (var dest               : Matrix_Real;
              var source_left,source_right : Matrix_Real);

procedure Write_Matrix (var source : Matrix_Real);

implementation

procedure Matrix_Add (var dest            : Matrix_Real;
              var source_a,source_b : Matrix_Real);
begin
   dest := source_a + source_b;
end; { Matrix_Add }

procedure Matrix_Product (var dest               : Matrix_Real;
              var source_left,source_right : Matrix_Real);
{ dest should have as many rows as source_left and as many columns
as source_right. }

begin
   dest := \+ (source_left[iota 0,iota 2]*source_right[iota 2,iota 1]);
end; { Matrix_Product }

procedure Matrix_Print (var source : Matrix_Real);

var
   r,c : Integer;

begin
   Write('[');
   
   for c:=0 to source.chi do begin
      Write(source[0,c]);
   end;
   
   for r:=1 to source.rhi do begin
      WriteLn('');
      for c:=0 to source.chi do begin
     Write(source[r,c]);
      end;
   end;

   Writeln(']');
end; { Matrix_Print }

begin
end.
      
