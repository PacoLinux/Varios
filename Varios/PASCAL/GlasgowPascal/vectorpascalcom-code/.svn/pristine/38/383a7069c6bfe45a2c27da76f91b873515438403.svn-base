Unit genericsort(t);
interface

type dataarray(n,m:integer)=array[n..m] of t;
procedure sort(var a:dataarray);

implementation

procedure sort(var a:dataarray);
var i,j:integer;
    temp:t;
begin
        for i:= a.n to a.m-1 do
         for j:= a.n to a.m-1 do
           if a[j]>a[j+1] then begin	
             temp := a[j]; a[j]:= a[j+1];
	     a[j+1]:=temp;
           end;
end;
begin
end.
