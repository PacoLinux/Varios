{library sumv;
interface{}
program sumv;{}
type intarray = array[0..7] of integer;
     binary= array[0..3,0..1] of integer;
     both = record
	case boolean of
        true:(single:intarray);
	false:(paired:binary);
    end;
{function myfunc(var v:intarray; len:integer):integer;
implementation{}
{$r-}
function pmyfunc(var v:both; len :integer):integer;
var x,z,i:integer;y:array[0..1] of integer;
const null:array[0..1] of integer=(0,0);
begin
	
	x:= (len shr 1)-1;
	y:=null;
	for i:=0 to x do 
          y:=y+v.paired[i];
	
	pmyfunc:= y[0]+y[1] +(len and 1) * v.single[len -1];
	  	
end;
{
function myfunc(var v:intarray; len:integer):integer;
begin
         myfunc:= \+ v[0..len-1] 

end;}
var v:both; i,j:integer;
begin
	v.single:= iota 0;
	
	{i:= myfunc(v.single,j);
	writeln(v.single,i);}
	i:= pmyfunc(v,5);
	writeln(v.paired,i);
	
end.
