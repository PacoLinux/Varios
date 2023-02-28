
program uniquewords;


const wordmax=20;
type lexeme=string[wordmax];
     lexset= set of lexeme; 

var  
    files:array[1..2] of text;
    words:array[1..2] of lexset;
    i:integer;
    commonwords:lexset;
    aword:lexeme;
function openfiles:boolean;
(*! This returns true if it has suceeded in opening both files. 
Two possible error conditions can arise:
\begin{enumerate}
	\item The number of filenames supplied to the program may be wrong.
		This is tested using the integer valued function \textsf{{paramcount}\ }
	which is provided in the System Unit. This returns the number of parameters
	provided to the program on the command line.
	\item The names provided may not  correspond to  valid files.
	This is tested by attempting to \textsf{{reset}\ } the files for writing
	and then testing the ioresult function. To use this one must disable the
	automatic i/o checks provided on reseting a file which would otherwise
	cause the program to abort with a run time error. This is done with
	the compiler directive \{\$i-\}.
	The previous presence of this directive allows the \textsf{ ioresult \ } function
	to be used to test whether file opening failed.
\end{enumerate}
*)
label 99;
var i:integer;
begin 
	openfiles:=false;
	if paramcount <2 
	then goto 99;
	for i:=1 to 2 do 
	begin
		assign(files[i],paramstr(i));
		{$i- checks off}
		reset(files[i]);
		if ioresult<>0 
		then goto 99;
		{$i+ checks on}
	end;
	openfiles:=true;
	99:
end;	
		
procedure loadset(var f:text;var words:lexset);
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
	words:=[];
	letters:=['a'..'z','A'..'Z'];
	repeat 
		getlex(theword);
		words:=words+[theword];		
	until theword='';
end{ of loadset};



    
(*! The main program reads in the files to sets, intersects them
    and then lists the result. 
   For instance the command:
\begin{verbatim}
D:\WPC\documents\ilcg\book\tests>uniquewords norm.pas roman.pas 
\end{verbatim}
produces the list of words
\begin{verbatim}
      array
       begin
         end
          of
     program
         var
     writeln
\end{verbatim}
The contents of the two files can be determined
by using the cat command
\begin{verbatim}
D:\WPC\documents\ilcg\book\tests>cat roman.pas norm.pas 
program roman;
const rom:array[0..4] of string[1]=('C','L','X','V','I');
      numb:array[0..4] of integer=(2,1,1,0,3);
var s:string;
begin
	s:= numb . rom;
	writeln(s);
end.

program norm;
type vec=array[0..3] of real;
function n(var v:vec):real;
begin
  n:= sqrt(\+ (v*v));
end;
var v:vec;    r:real;
begin
  v:=iota 0;
  r:=n(v);
  writeln(v,r);
end.
\end{verbatim}
On the other hand we can find all of the unique words in a single
file by intersecting it with itself thus:
\begin{verbatim}
D:\WPC\documents\ilcg\book\tests>uniquewords norm.pas norm.pas 
       array
       begin
         end
    function
        iota
           n
        norm
          of
     program
           r
        real
        sqrt
        type
           v
         var
         vec
     writeln
\end{verbatim}
*)

begin
	if openfiles
	then
	begin
		for i:=1 to 2 do loadset(files[i], words[i]);
		commonwords:= words[1]*words[2];
		for aword in commonwords do
		 	writeln(aword);
	end
	else writeln('Usage : uniquewords file1 file2');
end.
