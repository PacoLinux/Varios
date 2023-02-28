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
  bufdecls,lines;

type charclass=(star,bra,ket,cur,ley,
                operator,bracket,alpha,digits,exponent,dquote,
                quote,slash,separator,whitespace,singleop);
     car=array [0..127] of charclass;
const classtab:car =(

 { ^@} whitespace, { ^A} whitespace, { ^B} whitespace, { ^C} whitespace,
 { ^D} whitespace, { ^E} whitespace, { ^F} whitespace, { ^G} whitespace,
 { ^H} whitespace, { ^I} whitespace, { ^J} whitespace, { ^K} whitespace,
 { ^L} whitespace, { ^M} whitespace, { ^N} whitespace, { ^O} whitespace,
 { ^P} whitespace, { ^Q} whitespace, { ^R} whitespace, { ^S} whitespace,
 { ^T} whitespace, { ^U} whitespace, { ^V} whitespace, { ^W} whitespace,
 { ^X} whitespace, { ^Y} whitespace, { ^Z} whitespace, { ^[} whitespace,
 { ^\} whitespace, { ^]} whitespace, { ^^} whitespace, { ^_} whitespace,
 {  } whitespace, { !} whitespace, { "} dquote, { #} whitespace,
 { $} digits, { %} operator, { &} operator, { '} quote,
 { (} bra, { )} ket, { *} star, { +} operator,
 { ,} bracket, { -} operator, { .} operator, { /} slash,
 { 0} digits, { 1} digits, { 2} digits, { 3} digits,
 { 4} digits, { 5} digits, { 6} digits, { 7} digits,
 { 8} digits, { 9} digits, { :} operator, { ;} separator,
 { <} operator, { =} singleop, { >} operator, { ?} operator,
 { @} operator, { A} alpha, { B} alpha, { C} alpha,
 { D} alpha, { E} exponent, { F} alpha, { G} alpha,
 { H} alpha, { I} alpha, { J} alpha, { K} alpha,
 { L} alpha, { M} alpha, { N} alpha, { O} alpha,
 { P} alpha, { Q} alpha, { R} alpha, { S} alpha,
 { T} alpha, { U} alpha, { V} alpha, { W} alpha,
 { X} alpha, { Y} alpha, { Z} alpha, { [} bracket,
 { \} whitespace, { ]} bracket, { ^} bracket, { _} alpha,
 { `} operator, { a} alpha, { b} alpha, { c} alpha,
 { d} alpha, { e} exponent, { f} alpha, { g} alpha,
 { h} alpha, { i} alpha, { j} alpha, { k} alpha,
 { l} alpha, { m} alpha, { n} alpha, { o} alpha,
 { p} alpha, { q} alpha, { r} alpha, { s} alpha,
 { t} alpha, { u} alpha, { v} alpha, { w} alpha,
 { x} alpha, { y} alpha, { z} alpha, { {} cur,
 { |} operator, { closing bracket}ley, { ~} operator, { del}whitespace
);           { end of classtab }
const
      includedepth=2;
      listprog:boolean=false;
      maxbuf=3000000;
type
      language = (Clanguage,PascalLanguage);
      buffer= array[1..maxbuf] of char;
      textbuffer = record
              thetext: ^buffer;
            {  source : textstream;   }
              bufid:textline;
              start,finish: integer;
              still_in_comment:boolean;
              comment_end:string[3];
              linenumber,textlen  :integer;
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
                        strfilename:string;
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
{---------------------------------------------------------------}
{ PREVNEWLINE                                                   }
{ returns the position in the buffer of the newline before the  }
{ cursor                                                        }
{ ------------------------------------------------------------- }
function prevnewline(var b:textbuffer):integer;
{ ------------------------------------------------------------- }
{ CURRENTLINE                                                   }
{ return the current line as a string                           }
{ ------------------------------------------------------------- }
function currentline(var b:textbuffer):string;

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
function prevnewline(var b:textbuffer):integer;
var i:integer;
begin
      with b do begin
        i:=finish;
        while (i>0) and (thetext^[i]<>chr(10)) do i:=i-1;
        prevnewline:=i;
      end
end;
 function nextnewline(var b:textbuffer):integer;
var i:integer;
begin
      with b do begin
        i:=finish;
        while (i<textlen) and (thetext^[i]<>chr(10)) do i:=i+1;
        nextnewline:=i;
      end
end;
function currentline(var b:textbuffer):string;
var s:string;last,next:integer;
begin
     s:='';
     last:=prevnewline(b)+1;next:=nextnewline(b);
     with b do
     while last<next do begin s:=s+  thetext^[last]  ; last:=last+1 end    ;
     currentline:=s
end;
function nextline(var b:textbuffer):boolean;
begin
     with b do
     begin
          finish:=nextnewline(b)+1;
          nextline:= (finish<textlen)and( thetext^[finish-1] =  chr(10))
     end;
end;
procedure freebuffer;
begin
     dispose(the_buffer.thetext  );
end;
function openbuffer(var the_buffer:textbuffer;bufname:textline;
                        strfilename:string;
			l:language):boolean;
var size,sr:integer; f:file;
begin
     assign(  f, strfilename);
     reset(f,1);
     if ioresult=0 then begin
        size:=filesize(f);

          with the_buffer do begin
          bufid:=bufname;
          getmem(thetext,size+1);
          blockread(f,thetext^,size,sr);
          if sr<>size then begin
             writeln('tried to read ',size,' from ', strfilename,
                     ' but only got ', sr, ' bytes');
             openbuffer:=false;
          end
          else begin
               openbuffer:=true;
               close(f);
          end;
          still_in_comment:=false;
          textlen:=size;
          start:=0;
          finish:=0;
          stopline:=0;
	  lang:=l;
          linenumber:=0;
          list:=false;
          debug:=false;

          end
     end else openbuffer:=false;
end;
procedure rewind(var the_buffer:textbuffer);
begin
     with the_buffer do begin
          start:=textbuflo;
          finish:=textbuflo;
          linenumber:=0;
     end;
end;


function newlexeme(var T:textbuffer):fsmstate;
         type action = ( last,continue);
         label 1,2,3,4,99;
         var
            S:fsmstate;
            C:charclass;
            A:action;
            I:integer;
            hex:boolean;
         function nextchar:char;
         begin
              nextchar := T.thetext^[t.finish+1];
         end;
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
                      if I = 10 then t.linenumber:=t.linenumber+1;
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
         var isreal:boolean;
         begin

              isreal := false;
              1:
              t.start:=t.finish;
              {$ifdef debug}
              if t.debug then{} writeln('newlexeme:',t.bufid,' ',
                                      'in comment =',t.still_in_comment,
                                      'finish =' ,t.finish);
              {$endif}
              getch;
              if a = last then newlexeme:=newlinestate else
              if t.still_in_comment then
              begin
                    comment(t.comment_end);
                    newlexeme:=newlexeme(t);

              end
              else
              4:case C of
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
              singleop:newlexeme:=idstate;
              operator:if chr(i)='`' then Tag
                          else begin
                            2:getch;
                            3: if not( C in[singleop,operator] )then ungetch;
                            newlexeme:=idstate;
                       end;
              star: if t.lang=Clanguage then
                                      goto 2 else
                                      begin {just return this}newlexeme:=idstate end;
              alpha,exponent:begin
                             getch;
                             while (
                                   (C in [alpha,exponent,digits])

                                   )and
                                   (a<>last)  do getch;
                             if a<>last then ungetch;
                             if not isreal then
                                newlexeme:=idstate
                             else
                                 newlexeme:=numstate
                             end;
              digits: begin
                         hex:=chr(i)='$';
                         while ((C =digits)
                                or(hex and (chr(i) in ['a'..'f','A'..'F']))

                                or((chr(i)='.') and (nextchar <>'.'))
                               ) and (a<>last) do
                         begin
                               getch;
                               if chr(i)='.' then isreal := true;

                         end;
                         if (isreal and (chr(i) in ['e','E'])) then
                         begin
                              c:= exponent;
                              goto 4;
                         end;
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