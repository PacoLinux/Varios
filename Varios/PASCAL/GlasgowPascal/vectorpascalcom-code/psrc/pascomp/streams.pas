unit STREAMS;
{ used to provide an abstraction from the source of text }
{ this is a debugging implementation that obtains the text }
{ from the terminal }
interface uses lines;
type textstream= ^streamobj;
     bi_stream=^bi_obj;
     streamobj= object
                { Operations }
		constructor open;

                function atendofstream:boolean;virtual;
                function getline(var buf:textline):boolean;virtual;
                destructor freestream;virtual;
                function linenum:word;virtual;
                function lineoffs:longint;virtual;

		end;

     bi_obj    = object(streamobj)
		 outputstream:boolean;
		 function putline(var buf:textline):boolean;virtual;
		 end;

     function openfilestream(n:textline):textstream;
     function openoutputfilestream(n:textline):bi_stream;
     procedure copystream(src:textstream;dest:bi_stream);
implementation
type     filestreamobj= object(bi_obj)
                  src:text;
                  line,offs:longint;
                  valid:boolean;
		  constructor open(n:textline);
		  constructor openoutput(n:textline);
                  function atendofstream:boolean;virtual;
		  function getline(var buf:textline):boolean;virtual;
		  function putline(var buf:textline):boolean;virtual;
                  destructor freestream;virtual;
                  function linenum:word;virtual;
                  function lineoffs:longint;virtual;
                  end;
          filestreamptr = ^ filestreamobj;
destructor filestreamobj.freestream;
begin
          if valid then close(src);
end;
function openfilestream(n:textline):textstream;
var s :filestreamptr;
begin
     new(s,open(n));
     openfilestream := s
end;
function openoutputfilestream(n:textline):bi_stream;
var s:filestreamptr;
begin
	new(s,openoutput(n));
	openoutputfilestream:=s;
end;
procedure copystream(src:textstream;dest:bi_stream);
var l:textline;
begin
	while src^.getline(l)do
              if dest^.putline(l) then;
end;
function filestreamobj.getline(var buf:textline):boolean;
begin
     if outputstream then getline:=false else
     if  not atendofstream then
     begin
        readln(src,buf);
        getline:=true
     end
     else getline:=false ;
end;
function filestreamobj.putline(var buf:textline):boolean;
begin
     if not outputstream then putline:=false else
     begin
	writeln(src,buf);
	putline:=true
     end
end;
function filestreamobj.atendofstream;
begin
        if valid then
           atendofstream:=eof(src)
        else
           atendofstream:=true
end;
function filestreamobj.linenum:word;begin linenum:=line end;
function filestreamobj.lineoffs:longint;begin lineoffs:=offs end;

constructor filestreamobj.open(n:textline);
begin
	 assign(src,n);
	 outputstream:=false;
         valid:=true;
         {$i-}
         reset(src);
         if ioresult<>0 then begin
            valid:=false;
         end;
         {$i+}
         line:=0;offs:=0;
end;

constructor filestreamobj.openoutput(n:textline);
begin    self.open(n);
	 outputstream:=true;
	 rewrite(src);
         valid:=true;
end;

{ put in dummy virtual functions for the ordinary stream }
                function streamobj.atendofstream:boolean;
                begin
                     atendofstream:=true;
                end;
                function streamobj.getline(var buf:textline):boolean;
                begin
                     getline:=false;
		end;
		function bi_obj.putline(var buf:textline):boolean;
                begin
		     putline:=false;
                end;
                destructor streamobj.freestream;begin end;
                function streamobj.linenum:word;begin linenum:=0 end;
                function streamobj.lineoffs:longint;begin lineoffs:=0 end;
                constructor streamobj.open;begin end;

end.

