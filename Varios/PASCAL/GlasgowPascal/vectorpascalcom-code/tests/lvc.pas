program lvc;
(*! evaluate the perfomance of a system by iterative solution
   of the equation $v =Av+\lambda$ the standard definition
   of labour values where A is a technology matrix, v the per
   unit value vector, and $\lambda$ a vector of direct
   labour inputs. This is a particular case of a Jacobi solution
   to matrix equations. *)
const n=2000; {number of products}
      iter=100;
type matrix = array[1..n,1..n] of real;
var v,lambda:array[1..n] of real;
    A:^matrix;
    j:integer;
    t0,t1:double;
    procedure polysolve;forward;
procedure polysolve;
  (* this solves it using multicore calculations *)
  var nv:array[1..n,1..1] of real;
  (*! nv is a column vector used to compute next value vector *)
  begin
	nv:= (\+ A^[iota 0,iota 2]*v[iota 2])+lambda[iota 0];
	v:= nv[iota 0,1];
  end;
procedure unisolve;
   (* this solves using a single thread and SIMD *)
   var nv:array[1..n] of real;
   begin
	nv:=( \+ A^[iota 0]*v) +lambda;
	v:=nv;
   end;
procedure init;
	var i:integer;
	begin
		new(A);
		A^:=-1/(n*(iota 0 +iota 1));
		for i:=1 to n do A^[i,i]:=1;
		lambda:=10;
		v:=1;
	end;
begin
    t0:=secs;
	init;
	if paramstr(1)='UNI' then
	begin
		for j:=1 to iter do unisolve
	end
	else for j:=1 to iter do polysolve;
	 writeln(((iter*((n*n*2.0)+n))+n*n)/(secs -t0),' FLOPSv');
end.p
		
	
