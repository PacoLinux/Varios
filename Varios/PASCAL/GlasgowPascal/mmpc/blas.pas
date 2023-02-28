unit BLAS;

interface

type
   transpose_op = (None,Transpose,Conj);
   uplo = (Upper,Lower);
   diag_flag = (NonUnit,IsUnit);
   op_side = (LeftOp,RightOp);
   
procedure BLAS_Error(N:String);

implementation

procedure BLAS_Error(N:String);
   begin
      writeln(N);
      halt(-1);
   end;

begin
end.
