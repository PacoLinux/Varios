program indexfiles;
uses bloomfilter;
const dirsep='\';
      wordmax=25;
      above='..';
      this='.';
type lexeme=string;
var index:file of filefilter;  

procedure loadset(var f:text;var words:bloom);
(*! This procedure finds all the unique words in a file
    and returns them in lexset. 
    This module is responsible for all of the parsing of
    the input files.
    It declares the set \textsf{letters} used in discriminating words
    from other text.
*)
const a='a';z='z';
var letters:set of char ;
	
type state = (inword, skipping);
var  c: char;
     s: state;
     theword:lexeme;
  function getch:char;
  (*! Read in a character from the current file, return the null
      character on end of file.
    This function has to deal with the problems of 
	\begin{enumerate}
	\item End of lines, which in Pascal are detected by the \textsf{{eoln}\ } function.
	These are dealt with by returning the ASCII CR character 13.
	\item End of file, detected by the \textsf{{eof}\ } function. This is
	dealt with by returning the ASCII NUL character 0. The occurence of 
        NUL characters is dealt with at the next higher level of processing to
	ensure that termination occurs.
	\end{enumerate}
  *)
  var local:char;
  begin
	if eoln(f) then 
	begin 
		readln(f); 
		getch:=chr(13); 
	end
	else
        begin
	if eof(f) then 
	begin
		getch:=chr(0);
	end
	else 
	begin
		read(f,local);
		getch:=local;
	end;
	end;
  end{ of getch};
  procedure getlex(var l:lexeme);
  (*! This procedure parses the input stream for the next word.
      It then returns it in l. It operates as a simple finite
      state machine that can be in one of two states:
	\begin{enumerate}
	\item \textsf{skipping} : the machine is in this state between words
	whilst it moves over non letter characters.
	\item \textsf{inword} : the machine is in this state whilst it parses
	a word.
	\end{enumerate}
	The special case of the occurence of the null character
	causes a branch to label 99 ensuring that a null string
	is returned by the procedure. This is used at the
	next higher level as a termination condition.
	Labels, though deprecated in structured programming remain
	a useful construct for escaping from loops.

	Note that membership of the character in the set of letters
	is used to switch between the two states of the parser.
	This is an entirely orthodox use of sets in Pascal.
  *)
  label 99;
  begin
	l:='';
	while s= skipping do
	begin
		c:=getch;
		if c in letters then s:=inword;
		if c = chr(0) then goto 99;
	end;
	while s= inword do
	begin	
		if length(l)=wordmax
		then goto 99;
		l:=l+c;
		c:=getch;
		
		if c in letters then s:=inword else s:= skipping;
		if c = chr(0) then goto 99;
	end;
	99:
  end{ of getlex};

begin
	s:=skipping;
	
	letters:=['a'..'z','A'..'Z'];
	repeat 		
		getlex(theword);
		setfilter(theword,words);	
	until theword='';
end{ of loadset};
procedure processfile(fn,path:string);
(*! this builds an index for file fn and adds it to the index *)
var ff:filefilter;
    f:text;
begin
	writeln(path);
	assign(f,fn);
	{$i-}
	reset(f);
	if ioresult =0 then 
	begin 
	{$i+}
		ff.wordset:=[];
		loadset(f,ff.wordset);
		ff.filename:=path;
		write(index,ff);
	end
	else writeln('cant open ',fn,':', path);
	close(f);
	
end;
procedure intodir(s:string; prefix:string);
    var buf:array[0..100] of ascii;
        n:pchar;
        un,path:string;
	thedir:pdir;
    	theentry:pdirentry;
begin
	unicodestring2ascii(s,buf[0]);
	thedir:=opendir(@buf);
	if thedir <> nil then begin
		chdir(@buf);
		theentry:= readdir(thedir);
		while (theentry <> nil) do
		begin			
			n:=entryname(theentry);
			un:=strpas(n);
			path:=prefix+dirsep+un;
			if isdir(n) then begin
			  if un<>above then
			    if un<> this then 
				intodir(un,path);
			end else processfile (un,path);
			theentry:=readdir(thedir);
		end;
		unicodestring2ascii(above,buf[0]);
		if s<>'.' then	chdir(@buf);
	end;
end;
begin
	assign(index,'wordindex.ind');
	rewrite(index);
	intodir('.','.');
	close(index);
end.
