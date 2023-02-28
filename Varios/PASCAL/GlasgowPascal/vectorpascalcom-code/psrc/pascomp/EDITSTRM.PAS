unit editstrm;
{ this is a unit thar provides a stream interface to the }
{ text stacks used in the editor                         }
interface uses editdecl,streams,lines;
type bufferstream= ^bufferobj;

     bufferobj= object(streamobj)
                buffer:textstack;
                line,offs:word;
                { Operations }
                function atendofstream:boolean;virtual;
                function getline(var buff:textline):boolean;virtual;
                destructor freestream;virtual;
                function linenum:word;virtual;
                function lineoffs:longint;virtual;
                constructor open(ts:textstack);
                end;
implementation

function bufferobj.atendofstream:boolean;
begin
      atendofstream:=offs >=buffer.top;
end;
function bufferobj.getline(var buff:textline):boolean;
var i:integer;

begin
     i:=0;
     if atendofstream then getline:=false else
     begin
       while (offs<buffer.top) and (ord(buffer.buf^[offs])<32 )
       do offs:=offs+1;
       while (i<linelen) and
             (offs<buffer.top) and
             (buffer.buf^[offs]<>chr(13))
       do begin
        i:=i+1;
        buff[i]:=buffer.buf^[offs];
        offs:=offs+1;
        end;
{$r-}       buff[0]:=chr(i);{$r+}
       line:=line+1;
       getline:=true;
     end;
 end;
 destructor bufferobj.freestream;
 { we do not want to dispose of the text stack so do nothing }
 begin end;
 function bufferobj.linenum:word;
 begin
      linenum:=line;
 end;
 function bufferobj.lineoffs:longint;
 begin
      lineoffs:=offs
 end;
 constructor bufferobj.open(ts:textstack);
 begin
      buffer:=ts;line:=0; offs:=textbuflo+1;
 end;
 end.

