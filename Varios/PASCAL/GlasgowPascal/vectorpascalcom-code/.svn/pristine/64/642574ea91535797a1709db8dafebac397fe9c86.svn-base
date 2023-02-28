unit heaptest;


{ unit to test the new and dispose code }

interface
procedure doheaptest;
procedure gctest;
implementation
type    plist = ^list;
	list = record 
		next:plist;
		val:integer;
		end;
	var p:plist;
            q:pchar;
procedure gctest;
const size=1000000;
type buf=array[1..size] of char;
     pbuf=^buf;
var b:pbuf;i,j:integer;
begin
	for i:=1 to 2000 do begin
		new(b);
		j:=i mod 10  ;
		if j =0 then writeln (i,'M bytes allocated');
	end;
end;
procedure doheaptest;
var i:integer;
	temp:plist;
begin
	p:=nil;
       
{	writeln('build list');    }
	for i:=1 to 5 do begin
		new(temp);
		temp^.next:=p;
		temp^.val:=i;
		p:=temp;
		write(i);
	end;
	writeln('traverse list');
	while p<> nil do
	begin
		temp:=p;
		with p^ do 
		begin
			write(val);
			 
		end;
		p:=temp^.next;
		writeln(' moved to next');
		dispose(temp);
		writeln(' disposed');
	end;
	writeln('heaptest done');
end;

begin
end.
