program searchindex;
(*! Scans a bloom filter index for a word
    to find the files the contain it.
    The index is assumed to be in the file wordindex.ind. *)

uses bloomfilter;
label 99;
var index:file of filefilter; 
    entry:filefilter;
    theword:string; 
    i:integer;
begin
 
	if paramcount <2 then writeln('Usage searchindex word')
	else 
	begin
	
	assign(index,'wordindex.ind');
	{$i-}
	reset(index);
	if ioresult=0 then
	
	while not eof(index) do
	begin
		read(index,entry);
		if ioresult<>0 then goto 99;
		theword:=paramstr(1);
		if testfilter(theword,entry.wordset)
		then writeln(entry.filename);
 	end;
	99:close(index);
	end;
end.
