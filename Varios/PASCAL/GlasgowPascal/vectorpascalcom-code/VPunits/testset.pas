program testsets;
uses genericset(real);
type ts=set of byte;
var s1,s2,s3:genset;
    t1,t2,t3:ts;
procedure ts2gs(var gs:genset; s1:ts);
var b:byte;
begin
	for b in s1 do begin
		 addtogenericset(gs,b*1.0);
	end;
end;
var b:byte; r:real;
     ok:boolean;
begin
	emptygenericset(s1);
	emptygenericset(s2);
	emptygenericset(s3);

	t1:=[3,2,4,17];
	t2:=[2,3,4,5];
	
	ts2gs(s1,t1);
	ts2gs(s2,t2);
	writeln(t1=t2);

	ok:=genericseteq(s1,s2);
	writeln(ok);
	writeln(t1<=t2,t1>=t2);

	ok:=genericsetle(s1,s2);
	writeln(ok,genericsetge(s1,s2));

	s3:=genericsetunion(s1,s2);
	t3:=t1+t2;




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
	writeln(2 in t2, isin(s2,2));
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
