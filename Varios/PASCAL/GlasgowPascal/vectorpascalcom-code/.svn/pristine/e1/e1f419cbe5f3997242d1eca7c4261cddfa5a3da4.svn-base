unit graphics;
interface

type timageplane(lowy,highy,lowx,highx:integer)=array[lowy..highy,lowx..highx]of pixel;
     t1dkernel(lo,hi:integer)=array[lo..hi] of real;
     timageline(lo,hi:integer)=array[lo..hi]of pixel;

procedure conv1d(var src:timageplane;var kernel:t1dkernel;var dest:timageplane);

implementation


procedure conv1d(var src:timageline;var k:t1dkernel;var d:timageline);
begin
	d:=\+ kernel * trans (src[(k.lowk+iota 0)..(k.lowk+iota 0+d.highx)]);
end;

begin
end.
