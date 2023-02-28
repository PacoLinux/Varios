PROGRAM increment;
TYPE 
     decimalchar = '0'..'9';
     decimalint  =  0..9;
VAR line:string;
FUNCTION s2int(s:string):integer;

LABEL 99;
VAR c:char; i,t:integer;

FUNCTION toint( d:decimalchar):decimalint;
BEGIN
	toint:= ord(d)-ord('0')
END;
BEGIN
    i:=1; t:=0;
    WHILE i<=length(s) DO
    BEGIN
        c:=s[i];
	IF (c<'0') OR (c>'9') THEN GOTO 99;
        t:=10*t+toint(c);
	i:= i+1;
    END;
    99: s2int:=t
END;
BEGIN
   READLN(line);
   WRITELN( s2int(line)+1);
END.

