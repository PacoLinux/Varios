unit vectors_real;

interface

type
   Vector_Real(high:Integer) = array[0..high] of Real;
   pVector_Real = ^Vector_Real;

procedure Vector_Add (var dest : Vector_Real;
                      var source_a,source_b : Vector_Real);

procedure Vector_Negate (var dest   : Vector_Real;
                         var source : Vector_Real);

function Scalar_Product (var source_left,source_right : Vector_Real):Real;

procedure Vector_Print(var v : Vector_Real);

implementation

procedure Vector_Add (var dest		    : Vector_Real;
		      var source_a,source_b : Vector_Real);
begin
   dest := source_a + source_b;
end; { Vector_Add }

procedure Vector_Negate (var dest   : Vector_Real;
			 var source : Vector_Real);
begin
   dest := -source;
end; { Vector_Negate }

function Scalar_Product (var source_left,source_right : Vector_Real):Real;
begin
   Scalar_Product := \+ source_left * source_right;
end; { Scalar_Product }

procedure Vector_Print(var v:vector_real);
   var
      i:integer;
   begin
      Write('[');
      for i:=0 to v.high-1 do begin
         Write(v[i],',');
      end;
      Writeln(v[v.high],']');
   end;

begin

end.
