unit Rollback;

(*! Part of the ILCP cocde generator toolbox
    Copyright (C) University of Glasgow 2003

    Function is to provide a datatype that
    can be used to write text, but can allow
    rolling back to an earlier phase. This is provided
    in order to allow backtracking in the code generator.
    *)

interface
     const maxrollback = 900000;
     type buffvec = array[0..maxrollback] of char;
          pbuffvec = ^ buffvec;
          rollbackbuffer = record
                         buf:pbuffvec;
                         freepos,buflen:integer;
                         end;
     { append string s to buffer b return false if not enough room}
     function appendstr(var b:rollbackbuffer; s:string):boolean;
     { gets a rollback point from the buffer }
     function getmark(var b:rollbackbuffer):integer;
     { rolls back to a mark }
     procedure setmark(var b:rollbackbuffer;mark:integer);
     { write the buffer to the text file }
     procedure writerollback(var b:rollbackbuffer; var f:text);
     { initialise buffer to the given size}
     procedure initbuf(var b:rollbackbuffer;size:integer);
     { release space used by buffer }
     procedure freebuf(var b:rollbackbuffer);

implementation
     { append string s to buffer b return false if not enough room}
     function appendstr(var b:rollbackbuffer; s:string):boolean;
     var i:integer;
     begin
          with b do
               if freepos+length(s)<buflen then begin
                  for i:=1 to length (s) do begin
                      buf^[freepos]:=s[i];
                      freepos:=freepos+1;
                  end ;
                  appendstr:=true
               end
               else appendstr:=false;
     end;
     { gets a rollback point from the buffer }
     function getmark(var b:rollbackbuffer):integer;
     begin
          getmark:=b.freepos;
     end;
     { rolls back to a mark }
     procedure setmark(var b:rollbackbuffer;mark:integer);
     begin
          b.freepos:=mark;
     end;
     { write the buffer to the text file }
     procedure writerollback(var b:rollbackbuffer; var f:text);
     var i:integer;
     begin
          i:=0;
          while i<=b.freepos  -1 do begin

           if (b.buf^[i]='\') and
              (b.buf^[i+1]='n')
           then begin
                writeln(f);
                i:=i+1;
           end
           else
               write ( f,b.buf^[i]);
           i:=i+1;
          end;
     end;
     { initialise buffer to the given size}
     procedure initbuf(var b:rollbackbuffer;size:integer);
     begin
          with b do begin
               getmem(buf,size);
               buflen:=size;
               freepos:=0;
          end;
     end;
     { release space used by buffer }
     procedure freebuf(var b:rollbackbuffer);
     begin
          freemem(b.buf,b.buflen);
     end;

end.