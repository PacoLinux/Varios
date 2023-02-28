program testsets;
uses genericset(real);

type ts=set of byte;


var s1,s2,s3:pointer;

    t1,t2,t3:ts;
procedure ts2gs(var gs:pointer; s1:ts);
var b:byte;
begin

	for b in s1 do begin

		 addtoset(gs,b*1.0);
	end;
end;
var b:byte; r:real;
begin
	t1:=[3,2,4,8,16];
	t2:=[1,2,3,4];
	s1:=nil;s2:=nil;s3:=nil;
	ts2gs(s1,t1);
	ts2gs(s2,t2);
	t3:=t1+t2;
	s3:=setunion(s1,s2);
	writeln(t1=t2);
	writeln(seteq(s1,s2),setle(s1,s2));
	for b in t3 do write(b);writeln;
	if not isemptyset(s3) then
	begin
		r:=getfirst(s3);
		write(r);
		while r <> getlast(s3) do begin
			r:=getnext(r,s3);
			write(r);
		end;
		writeln;
	end;
	writeln(2 in t2, isin(s2,2));
	t3:=t1-t2;
	s3:=setdifference(s1,s2);

	for b in t3 do write(b);writeln;
	if not isemptyset(s3) then
	begin
		r:=getfirst(s3);
		write(r);
		while r <> getlast(s3) do begin
			r:=getnext(r,s3);
			write(r);
		end;
		writeln;
	end;

	t3:=t1><t2;
	s3:=setsymetricdifference(s1,s2);
	for b in t3 do write(b);writeln;
	if not isemptyset(s3) then
	begin
		r:=getfirst(s3);
		write(r);
		while r <> getlast(s3) do begin
			r:=getnext(r,s3);
			write(r);
		end;
		writeln;
	end;

	t3:=t1*t2;
	s3:=setintersection(s1,s2);
	for b in t3 do write(b);writeln;
	if not isemptyset(s3) then
	begin
		r:=getfirst(s3);
		write(r);
		while r <> getlast(s3) do begin
			r:=getnext(r,s3);
			write(r);
		end;
		writeln;
	end;
end.
