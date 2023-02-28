program Konv;
const m=255;repeats=2000;
      qrt:pixel=0.25;
type tplain = array[0..m ,0..m] of pixel;

var theim,theres:tplain;i:integer;oldtime,ops:real;
 procedure showtime;
	var sec,duration,rate:real;d:double;
	begin
		d:=rate;
		sec:=secs;
		duration:=sec-oldtime;
		writeln(duration,'  ');{}
		rate :=ops/duration;
		writeln( rate/1000000,'M ops per sec');
	        writeln(duration/repeats,'seconds per convolution');
		oldtime:=sec;
	end;
procedure pconv(var theim:tplain;c1,c2,c3:real);
var tim:array[0..m,0..m]of pixel;
    p1,p2,p3:  pixel;
begin	
	p1:=c1;
	p2:=c2;
	p3:=c3;
	tim [1..m-1] := theim[0..m-2]*p1 +theim[1..m-1]*p2+theim[2..m]*p3;
	tim[0]:=theim[0];
	tim[m]:=theim[m];{}
	theim[0..m][1..m-1]:=tim[0..m][0..m-2]*p1+tim[0..m][2..m]*p3+tim[0..m][1..m-1]*p2;
	theim[0..m][0]:=tim[0..m][0];
	theim[0..m][m]:=tim[0..m][m];
end;


begin
 writeln('start',secs);
 oldtime:=secs;ops:=12*(m+1)*(m+1)*repeats; 
  i:=1;
 while i<repeats do begin 
	pconv(theim,0.2,0.6,0.2);
	i:=i+1 
 end;
  
  showtime;
writeln('done',secs);
end.
