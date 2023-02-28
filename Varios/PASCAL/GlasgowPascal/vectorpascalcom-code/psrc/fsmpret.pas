{
-----------------------------------------------------------------
Module      : FSM.cmp
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 3 Oct 1986,March 90
Version     : 2
Function    : Finite State Transducer to perform first level lexical
              analysis.
              Splits up text in a buffer into lexemes
              Handles C or Pascal
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
{$r+}
UNIT fsmpret;
INTERFACE  USES
  bufdecls,lines,streams;

{$i pretexclasstab.cmp }
const
      includedepth=2;

type
      language = (Clanguage,PascalLanguage);

      textbuffer = record
              thetext: textline;
              source : textstream;
              bufid:textline;
              start,finish,textlen: 0..linelen;
              still_in_comment:boolean;
              comment_end:string[3];
              linenumber :integer;
              stopline  :integer;
              debug,list:boolean;
              lang :language;
              {point at the start and finish of lexeme and give length of buffer }
             end;
      string80= string[80];
      fsmstate = (newlinestate,
                  charstate, tagstate,
                  idstate,numstate,stringstate,commentstate);

{ ------------------------------------------------------------- }
{ REWIND                                                        }
{ go back to the start of the line                              }
{ ------------------------------------------------------------- }
procedure rewind(var the_buffer:textbuffer);


{ ------------------------------------------------------------- }
{ OPENBUFFER                                                    }
{ Open a named buffer   true on success                         }
{ ------------------------------------------------------------- }
function openbuffer(var the_buffer:textbuffer;
                        bufname:textline;
                        str:textstream;
			l:language):boolean;
{ ------------------------------------------------------------- }
{ FREEBUFFER                                                    }
{ Free a  buffer                                                }
{ ------------------------------------------------------------- }
procedure freebuffer(var the_buffer:textbuffer);

{ ------------------------------------------------------------- }
{ NEXTLINE                                                      }
{ move the  buffer onto the next line of input                  }
{ ------------------------------------------------------------- }
function nextline(var b:textbuffer):boolean;
{-------------------------------------------------------------- }
{  NEWLEXEME                                                    }
{  skips start and finish to point at new lexeme             }
{  returns type of lexeme                                       }
{ ------------------------------------------------------------- }
function newlexeme(var T:textbuffer):fsmstate;

IMPLEMENTATION {---------------------------------------------------}

var
       include_sp :integer ;
       buffstack : array[1..includedepth] of textbuffer;

function nextline(var b:textbuffer):boolean;
begin
     with b do
     begin
          nextline:=source^.getline(thetext);
          rewind(b);
     end;
end;
procedure freebuffer;
begin
     the_buffer.source^.freestream;
end;
function openbuffer(var the_buffer:textbuffer;bufname:textline;
                        str:textstream;
			l:language):boolean;
begin
     with the_buffer do begin
          bufid:=bufname;
          source:=str;
          still_in_comment:=false;
          thetext:='';
          stopline:=0;
	  lang:=l;
          linenumber:=0;   list:=false;debug:=false;
          openbuffer:=nextline(the_buffer);
     end;
end;
procedure rewind(var the_buffer:textbuffer);
begin
     with the_buffer do begin
          start:=textbuflo;
          finish:=textbuflo;
          textlen:= length(thetext);
     end;
end;


function newlexeme(var T:textbuffer):fsmstate;
         type action = ( last,continue);
         label 1,2,3,99;
         var
            S:fsmstate;
            C:charclass;
            A:action;
            I:integer;
            hex:boolean;
         procedure getch;
         { get a character and its class }
         begin
                 if t.finish >= t.textlen then begin
                 { HANDLE RUNNING OUT OF THE BUFFER }
                    t.finish:=t.textlen;
                    a:=last;
                    I:=ord(' ');
                    C:=classtab[I];
                 end
                 else begin
                      t.finish := t.finish+1;
                      A:=continue;
                      I:=ord(T.thetext[t.finish] );
                      C:=classtab[I and 127];
                 end;
         end;
         procedure ungetch;
         begin
           if a<>last then t.finish:=t.finish-1;
           I:=ord(T.thetext[t.finish] );
           C:=classtab[I and 127];
         end;
         procedure comment(ends:textline);
         var i:integer;
         label 1,99;
         begin
              T.comment_end:=ends;

              getch;
              while A <> last do begin
                 i:=0;
                 while i<length(ends) do begin
                   if T.thetext[t.finish+i]<>ends[i+1] then goto 1;
                   i:=i+1;
                 end;
                 t.finish:=t.finish+i-1;
                 t.still_in_comment:=false;
                 goto 99;   { end of comment }
                 1:getch;
              end;  { we have hit last }
              t.still_in_comment:=true;
              99:
         end;
         procedure Tag;
         begin
              repeat
                    t.start:=t.finish;
                    getch
              until (chr(i)='`')OR (A=LAST);
              repeat getch until (chr(i)='`')or (a=last);

            newlexeme:=tagstate;
         end;
         begin
              1:
              t.start:=t.finish;
              if t.debug then writeln('newlexeme:',t.bufid,' ',
                                      'in comment =',t.still_in_comment,
                                      'finish =' ,t.finish);

              getch;
              if a = last then newlexeme:=newlinestate else
              if t.still_in_comment then
              begin
                    comment(t.comment_end);
                    newlexeme:=commentstate;
              end
              else
              case C of
              bra:  if t.lang= Clanguage then newlexeme:=idstate
                    else begin  { this can start a pascal comment }
                       getch;
                       if C <>star then begin
                          ungetch ;
                          newlexeme:=idstate;
                       end else begin
                          comment('*)');
                          newlexeme:=commentstate;
                       end
                    end;
              cur:  if t.lang= Clanguage then newlexeme:=idstate
                    else begin  { this can start a pascal comment }
                          comment('}');
                          newlexeme:=commentstate;
                    end;
              operator:if chr(i)='`' then Tag
                          else begin
                            2:getch;
                            3: if C<>operator then ungetch;
                            newlexeme:=idstate;
                       end;
              star: if t.lang=Clanguage then
                                      goto 2 else
                                      begin {just return this}newlexeme:=idstate end;
              alpha,exponent:begin
                             getch;
                             while (C in [alpha,exponent,digits])and
                                   (a<>last)  do getch;
                             if a<>last then ungetch;
                             newlexeme:=idstate
                             end;
              digits: begin
                         hex:=chr(i)='$';
                         while ((C =digits)or
                                (hex and (chr(i) in ['a'..'f','A'..'F']))
                               ) and (a<>last) do getch;
                         if a<> last then ungetch;
                         newlexeme:=numstate;
                      end;
              dquote: begin  { C STRING  }
                         getch;
                         while (c<>dquote) and(a<>last) do begin
                               if I = ord('\') then getch;
                               if a<>last then getch;
                         end;
                         newlexeme:=stringstate;
                      end;
              quote: begin  { C CHAR OR PASCAL STRING }
                         repeat begin
                                getch;
                                if c=quote then
                                begin
                                  getch;
                                  if c=quote then getch
                                  else ungetch;
                                end;
                         end; { terminate on closing quote }
                         until (c=quote) or(a=last) ;
                         newlexeme:=charstate;
                      end;
              bracket,ket ,separator:newlexeme:=idstate;
              slash:if t.lang=Pascallanguage then goto 2 else
                    if t.lang = Clanguage then begin
                      getch;
                      if (a <> last) then
                      begin
                       if (C=star) then       { C comment }
                       begin
                        comment('*/');
                        newlexeme:=commentstate;
                       end   { of C = star }
                       else   goto 3;
                      end;    { at last }

                     end;     { of C language case }
              else  goto 1;
              end;


              99:

         end;

var i:integer;

begin
       listprog:=false;
       include_sp := 0;
end.