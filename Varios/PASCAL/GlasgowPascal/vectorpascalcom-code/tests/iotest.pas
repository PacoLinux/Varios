unit iotest;
interface
procedure iotests;
implementation
type enum=(zero,one,two,three);
procedure iotests;
var r:real;
	i:integer;
	c:char;
	s:string;
	b:boolean;
	t:text;
	z:enum;
	f:file;
begin
	writeln('testing output of an enumerated type');
	writeln('ord(z)','z');
	for z:= zero to three do writeln(ord(z),z);
	writeln('testing input of an enumerated type');
	write('input the number 2 in english');readln(z);
	writeln(z);
	write('enter a real ');readln(r);
	writeln(r);
	write('enter an integer then a boolean');readln(i,b);
	writeln(i,b);
        writeln('i:4 r r:14:1 r:6:2');
	writeln(i:4,r,r:8:1,r:6:2);
	s:='a file name';
	write(s);readln(s);
	write(s);
	assign(t,s);
	rewrite(t);
	writeln(t,s,i,b);
	close(t);
	assign(f,s);
	seek(f,1,0);
	blockread(f,c,1,i);
	write('char 1=',c); 
end;
begin
end.
