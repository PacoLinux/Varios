program dconv;    uses sysutils;
const m=255;repeats=2000;
type
    pixel = -128..127;
    tplain = array[0..m ,0..m] of pixel;
    function secs:double;
    begin secs:=now*24*3600; end;
var theim,theres:tplain;i:integer;oldtime,ops:real;
 procedure showtime;
	var sec,duration,rate:real;
	begin
		sec:=secs;
		duration:=sec-oldtime;
		writeln('duration ',duration,'  ');{}
		rate :=ops/duration;
		writeln( rate/1000000,'M ops per sec');
	        writeln(duration/repeats,'seconds per convolution');
		oldtime:=sec;
	end;
procedure conv(c1,c2,c3:real);
var tim:array[0..m,0..m]of pixel;
    quarter,half,temp:real;
    i,j:integer;
begin
        for i:=1 to m-1 do
        for j:= 0 to m do
	begin 
	           temp:= theim[i-1,j]*c1+theim[i,j]*c2+theim[i+1,j]*c3;
                if temp>127 then temp :=127 else
                if temp<-128 then temp:=-128;
                tim[i,j]:=round(temp);
        end;
	for j:= 0 to m do 
	  BEGIN
                tim[0,j]:=theim[0,j];
	        tim[m,j]:=theim[m,j];
        END;
        for i:=0 to m do
		begin
            for j:= 1 to m-1 do
			BEGIN
	        temp:= tim[i][j-1]*c1+ tim[i][j+1]*c3+ tim[i][j]*c2;
                if temp>127 then temp :=127 else
                if temp<-128 then temp:=-128;
                tim[i,j]:=round(temp);
            END;
            theim[i][0]:=tim[i][0];
            theim[i][m]:=tim[i][m];
        end;
end;

begin
 oldtime:=secs;ops:=12*(m+1)*(m+1)*repeats;
 for i:=1 to repeats do conv(0.2,0.6,0.2);
  showtime;
writeln('done',secs);
end.
