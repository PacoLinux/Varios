program dirlist;
(*! This program takes a single parameter: a dirctory name. It 
traverses the directory tree listing all of the file-names found. *) 
const above='..';  
      this='.';
(*! The constants are used to refer to the Unix and Windows representations
   of the current and superior directory. *)
var 
    s:string;
    procedure intodir(s:string; level:integer);
    (*! This procedure recursively traverses the directory whose
        name is passed as a parameter. All files encountered are listed
        to the standard output stream. 
        A major complication is the need to convert between unicode strings
        used internally and the ascii filenames used by Linux.
    *)
    var buf:array[0..100] of ascii;
        n:pchar;       
        un:string;
	thedir:pdir;
    	theentry:pdirentry;
    (*! Type ascii is an internal representation of ascii characters, stored one
        per byte. It is declared in the system unit. The type pchar is a pointer
        to an ascii character. This is the standard way in which strings are
        passed in C and it is needed to converse with the Linux or Windows
        file system. Types pdir and pdirentry are types declared in the
        system unit for traversing operating system directories.
	The function also makes use of a group of system procedures or functions.

        The procedure unicodestring2ascii takes a Vector Pascal string and
        copies it into an array of ascii characters, appending the requisite
        null character expected by C.

	The function opendir must be passed the address of an ascii string
	and returns a directory handle.

	The chdir procedure changes the current directory to the one specified
        by the ascii string provided in its parameter.

	The function readdir reads the next directory entry from the directory
        directory specified by the handle passed to it.

	The function entryname returns a pointer to an ascii string which
	has to be converted to a pascal string using the function strpas.
     *)
    begin
	unicodestring2ascii(s,buf[0]);
	thedir:=opendir(@buf);
	if thedir <> nil then
        begin
		chdir(@buf);
		theentry:= readdir(thedir);
		while (theentry <> nil) do
		begin
			n:=entryname(theentry);
			un:=strpas(n);
			writeln(un);
			if isdir(n) then 
			  if un<>above then
			    if un<> this then 
				intodir(un,level+1);
			theentry:=readdir(thedir);
		end;
		unicodestring2ascii(above,buf[0]);
		chdir(@buf);
	end;
    end;
begin
	s:=paramstr(1);
	intodir(s,0);
end.
