{
-----------------------------------------------------------------
Module      : Reader.cmp
Used in     : Compiler toolbox
Uses        : fsm.cmp
Author      : W P Cockshott
Date        : 6 Oct 1986
Version     : 2
Changes     : Changed to Unit 21-9-88
Function    : Provides ability to read a file into a buffer
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
UNIT reader;

INTERFACE USES bufdecls,fsm,errors;
procedure loadtext(var B:textbuffer;  n:string80;main:boolean);
{procedure freetext(var b:textbuffer);}

IMPLEMENTATION
{ ----------------------------------------------------------- }
{   LOAD TEXT                                                 }
{   loads a file into a text buffer                           }
{ ----------------------------------------------------------- }
procedure loadtext(var B:textbuffer;  n:string80;main:boolean);
var f:file of byte; i,result:integer; c:byte;
begin
   Assign(f,n);
   {$i-}
   reset(f);
   if ioresult = 0 then
   {$i+}
   with B do begin

     textlen:=filesize(f)+2;
     
     linenumber:=1;
     if textlen>textsize then error('file too big') else
     begin
          finish:=0;
          getmem(thetext,textlen);

          {for i:=1 to textlen-2 do begin read(f,c);thetext^[i]:=chr(c); end;}
          blockread(f,thetext^[1],textlen-2,result);

          if main then
             thetext^[textlen-1]:='?'    { end of program marker }
          else
             thetext^[textlen-1]:=' ';
          thetext^[textlen]:=' ';        { end of program marker }
     end;
     start:=0;finish:=0;
     close(f);
   end
   else error('Cant open   file '+n);
end;
{ ----------------------------------------------------------------- }
{        FREE TEXT                                                  }
{ releases the storage space associated with a text buffer          }
{ ----------------------------------------------------------------- }
procedure freetext(var b:textbuffer);
begin
   with b do begin
     freemem(thetext,textlen);
   end;
end;
 BEGIN
 END.


