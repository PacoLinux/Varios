program testrealset;

type ts=set of byte;
     realset = set of real;
var s1,s2,s3:realset;
    t1,t2,t3:ts;
procedure ts2gs(var gs:realset; s1:ts);
var b:byte; rs:realset;
begin
	for b in s1 do begin
		rs:=[];
		rs:=[1.0*b];
		gs:=gs+ rs;
	end;
end;
procedure printrs(rs:realset);
var r:real;
begin
	for r in rs do write(r);writeln;
end;
procedure printbs(bs:ts);
var b:byte;
begin
	for b in bs do write(b);writeln;
end;
var b:byte; r:real;
     ok:boolean;
begin


	t1:=[3,2,4,17];
	t2:=[2,3,5];
	
	ts2gs(s1,t1);
	s2:=[2.0,3.0,5.001];
	writeln(t1=t2);
	WRITELN(S1=S2);


	writeln(t1<=t2,t1>=t2);
	writeln(s1<=s2,s1>=s2);
	printrs(s1);writeln;


	s3:=(s1+s2);
	t3:=t1+t2;
	printrs(s3);printbs(t3);

	s3:=(s1-s2);
	t3:=t1-t2;
	printrs(s3);printbs(t3);
	s3:=(s1*s2);
	t3:=t1*t2;
	printrs(s3);printbs(t3);
	s3:=(s1><s2);
	t3:=t1><t2;
	printrs(s3);printbs(t3);
	writeln(2 in t2, 2.0 in s2);
	writeln(4 in t2, 4.0 in s2);
	printrs(s1);printrs(s2);
	s3:=s1+s2;
	printrs(s1);printrs(s2);printrs(s3);
	s3:=s1-[2.0];
	printrs(s1);printrs(s2);printrs(s3);
end.


	writeln(2 in t2, 2.0 in s2);
	t3:=t1-t2;
	s3:=genericsetdifference(s1,s2);

	for b in t3 do write(b);writeln;
	if not isemptygenericset(s3) then
	begin
		r:=genericsetfirst(s3);
		write(r);
		while r <> genericsetlast(s3) do begin
			r:=genericsetnext(r,s3);
			write(r);
		end;
		writeln;
	end;

	t3:=t1><t2;
	s3:=genericsetsymetricdifference(s1,s2);
	for b in t3 do write(b);writeln;
	if not isemptygenericset(s3) then
	begin
		r:=genericsetfirst(s3);
		write(r);
		while r <> genericsetlast(s3) do begin
			r:=genericsetnext(r,s3);
			write(r);
		end;
		writeln;
	end;

	t3:=t1*t2;
	s3:=genericsetintersection(s1,s2);
	for b in t3 do write(b);writeln;
	if not isemptygenericset(s3) then
	begin
		r:=genericsetfirst(s3);
		write(r);
		while r <> genericsetlast(s3) do begin
			r:=genericsetnext(r,s3);
			write(r);
		end;
		writeln;
	end;
end.
