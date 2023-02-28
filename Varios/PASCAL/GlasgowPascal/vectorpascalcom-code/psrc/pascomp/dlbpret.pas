{

-----------------------------------------------------------------
Module      : DLBpret.pas
Used in     : Compiler toolbox
Uses        : Fsm.cmp
Author      : W P Cockshott
Date        : 9 Oct 1986
Version     : 3
Changes     : changed to unit 21 - 9 - 88
              changed to be more language independent march 1990e
Function    : This uses a de La Brandis tree to convert the
              lexemes to integer tokens
              next_symbol,have, and mustbe provide the basic
              entry points of the lexical analyser.

Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
{$r+}
UNIT dlbpret;

INTERFACE

USES
 errors,lines,
{  sections,}
  bufdecls,
  fsmpret,streams{,env};

type
    { predefined lexemes used for grammer definition }
    {$ifdef format}
    lexeme=(dummy_sy, { all valid lexemes > 0  so we put in a dummy }
            ARROW_SY,STAR_SY,LT_SY,EQ_SY,GT_SY,SEMI_SY,COMMENT_SY,vbar_sy,
            COMMA_SY,INT_LIT,REAL_LIT,STRING_LIT,IDENTIFIER,newline_sy,
            tag_,
            endofsource_sy,
    UNDEFINED);
    {$endif}
    {$ifdef ispascal}

    {$i plexemes.cmp}
    
const lexemefile='pascal.def';
    {$endif}

const
      initstring1=
'@@ ->  * < = >  ; Comment- | , int_ real_ string_ identifier_ cr_ tag_ eos_ ';
      maxvar = 80;
      maxtoken = 1000;
      maxstring=maxvar;
      maxpredefined=endofsource_sy;
      tab =9;
      newline = 10;
      cr  =13;
      bs = 8;
      vtab = 11;
{
     *****************
     *  TYPES        *
     *****************}
type
lextoken = 0..maxtoken;
stringv  = string[maxstring];
var
       symbol : lextoken;
       lexsymbol :lexeme;
       the_comment,the_string:stringv;
       the_real:double;
       the_integer: longint ;
       the_line:integer;

{
   *****************
   * PROCEDURES    *
   *****************

}
  function psym(l:lextoken): stringv;
  procedure mustbe(t : lexeme;var the_buffer :textbuffer  );
  function have( t: lexeme ;var the_buffer :textbuffer ) : boolean;
  function havetoken(t:lextoken;var the_buffer:textbuffer):boolean;
  function tokenof(s:stringv):lextoken;
  procedure next_symbol(var the_buffer :textbuffer );
  function currentid(var the_buffer :textbuffer) :stringv;
  procedure initlexanal;
  procedure errormsg(s:string;var the_buffer:textbuffer);
{---------------------------------------------------------------------- }
{ errcontext                                                            }
{  prints the position in the source at which error happened            }
{ --------------------------------------------------------------------- }
procedure errcontext(   var the_buffer : textbuffer);

IMPLEMENTATION
const
      minchar = #0;
      maxchar = #255;
{$ifdef small}
      poolsize=3000;
{$endif}
{$ifndef small}
      poolsize=35000;
{$endif}

type
    lexnode = ^delabrandis;
    lexarray = array[minchar..maxchar] of lexnode;
    delabrandis = record
                      final:integer;
                      pref:char;
                      follower,alternates:lexnode;
               end;
    poolpntr = 0..poolsize;
var    predefined:lexarray;
       linebuf:stringv;
       converted:string[255];
       lasttoken:lextoken;
       pool:array[poolpntr] of char;
       pooltop:poolpntr;
       printables:array[lextoken] of poolpntr;


procedure errormsg(s:string; var the_buffer: textbuffer);
begin
     errcontext(the_buffer);
     error(s);
end;


procedure addch(c:char);
begin
     if pooltop < poolsize then begin
       pool[pooltop]:=c;pooltop:=succ(pooltop);
     end
end;
       {
       ------------------------- de la brandis tree manipulation -------------}

 function displaydlb(p:lexnode; indent:byte;token :lextoken):boolean;
var i:byte;
begin
   if p<>nil then   begin
     converted[indent]:=p^.pref;
     converted[0]:=chr(0);

     if p^.final = token
     then begin displaydlb:=true;
                converted[0]:=chr(indent);
     end
     else if displaydlb(p^.follower,indent+1,token) then displaydlb:=true
     else
     if p^.alternates <>nil then begin
        displaydlb:=
        displaydlb(p^.alternates,indent,token);
     end else begin
       displaydlb:=false;
     end;
  end  else displaydlb:=false;
end;

{
       ****************
       * INSERT_TOKEN *
       ****************
       }
function insert_token(var B:textbuffer; var n:lexarray;
			caseinsensitive:boolean):lextoken;
{  inserts the string into the tree }
{$S-}
var p      : lexnode;
    charno : integer;
    c      : char;
    hit ,inserted   :boolean;
    function lower(c:char):char;
    begin
       if caseinsensitive then begin
	  if (c >='A')and(c<='Z') then c:=chr(ord(c)-ord('A')+ord('a'));
       end;
       lower:=c;
    end;
    procedure newnode(var next:lexnode;c:char);
    begin
        new(next);
        with next^ do begin
          pref:=c; final:=0;
          follower:=nil;
          alternates:=nil;
        end;
    end;
    procedure ins(var n:lexnode;charno: word );
    var t:lexnode;
        c:char;
    begin
       c:=lower(b.thetext[charno]);
       if charno <=B.finish then with B do
          if n=nil then begin
             newnode(t,c);

             n:=t;
             ins(n,charno)
          end
          else with  n ^ do
            if c = pref then begin
                 if charno=finish  then begin
                    { a  hit }
                    hit:=true;
                    if final = 0 then
		    { first time we have encountered this word}
                    begin
                       final:=lasttoken;
                       printables[final]:=pooltop;
                       for charno:=start+1 to finish do
                          addch(thetext[charno]);
                       addch(chr(0));
                       lasttoken:=succ(lasttoken);
                    end;
                    insert_token:=final;
                 end
                 else ins(follower,charno+1);
            end
            else if c< pref then ins(alternates,charno)
            else
            begin { char less than pref }
                  t:=n;
                  newnode(n,c);
                  n^.alternates:=t;
                  ins(n,charno);
            end ;
    end;

var chain:char;
begin
 {$r+}
 insert_token:=0;
 chain:=b.thetext[b.start+1];
 printables[lasttoken]:=pooltop;
 ins(  n[lower(chain)],
  B.start+1);

end;
function lexemeof(l:lextoken):lexeme;
    var coerce:record
        case boolean of
        true:(l1:lextoken);
        false:(l2:lexeme;dummy:byte);
        end;
    begin
         lexemeof:=lexeme(l)
    end;
{
        ***************
        * TokenOf     *
        ***************
}
 function tokenof(s:stringv):lextoken;
var B:textbuffer;
begin
  { create the symbol tree }
  B.thetext:=addr(s[1]);
  with B do begin
      start:=0;

      finish:=length(s)+start;
      tokenof:=insert_token(B,predefined,false);

  end;

end;
{ ------------------------------------------------------------------ }
{      NEXTSYMBOL                                                    }
{      reads the next lexeme, converts to token                      }
{      leaves results in symbol, the.integer, the.real, the.string   }
{ ------------------------------------------------------------------ }
procedure next_symbol(var the_buffer :textbuffer );
var S:fsmstate;
    function numconv:lexeme;
    var n:stringv;
        i,p:integer;
        isint:boolean;
        w:word;
    begin
        isint:=true;
        with the_buffer do begin
           n:='';
           for i:=start+1 to finish do begin
              n:=n+thetext[i];
              isint:=isint and (thetext[i] in ['0'..'9','$','a'..'f','A'..'F']);
           end;
           if isint then begin
                         val(n,the_integer,p);
                         numconv:=INT_LIT;
                         end
                    else begin
                         val(n,the_real,p);
                         numconv:=REAL_LIT
                         end;

       end;
    end;
    procedure printsymbol;
    var i:integer;
        c: char;
    begin
         if lexsymbol <> newline_sy then begin
            write(currentid(the_buffer));
            write(' ');
         end else
         begin
           writeln;
         end;
    end;

    function commentconv:lexeme;
    var n:stringv;
        i,p:integer;
        escape:boolean;
        c:char;

       procedure append(c:char);
       begin    if length(n)<MAXSTRING then n:=n+c; end;
    begin
        with the_buffer do begin
           n:='';
           for i:=start+1 to finish  do begin
              c:=thetext[i];append(c);
           end;
        the_comment:=n;
       end;
        commentconv:=comment_sy;
    end;

    function stringconv:lexeme;
    var n:stringv;
        i,p:integer;
        escape:boolean;
        c:char;

       procedure append(c:char);
       begin    if length(n)<MAXSTRING then n:=n+c; end;
    begin
        escape:=false;
        with the_buffer do begin
           n:='';
           for i:=start+2 to finish -1 do begin
              c:=thetext[i];
              if not escape then begin
                 escape:=classtab[ord(c) and 127]=quote;
                 if not escape then    append(c);

              end
              else begin
              { this implements the S-algol rules for control chars }
              { 'n = newline                                        }
              { 't = tab                                            }
                  case c of
                  'n' : append(chr(NEWLINE));
                  't' : append(chr(TAB));
                  'o' : append(chr(CR));
                  'b' : append(chr(BS));
                  'p' : append(chr(VTAB));
                  else append(c);
                  end ;
                  escape:=false;
              end;
           end;
        the_string:=n;
       end;
        stringconv:=string_lit;
    end;

begin
  S:=newlexeme(the_buffer);

  if s =idstate then begin
     symbol:=insert_token(the_buffer,predefined,
			  the_buffer.lang=pascallanguage) ;
  end
  else if s in[numstate]  then symbol:=ord(numconv)
  else if s=tagstate then begin
    symbol:=ord(stringconv);
    symbol:=ord(tag_)
  end
  else if s in [stringstate,charstate] then symbol:=ord(stringconv)
  else if s =commentstate then symbol:=ord(commentconv)
  else  begin
      if nextline(the_buffer) then
      lexsymbol:=newline_sy
      else lexsymbol:=endofsource_sy;
      symbol:=ord(lexsymbol);
  end;
  if the_buffer.list then printsymbol;
  if s= commentstate then next_symbol(the_buffer) else
  if symbol >ord(maxpredefined) then lexsymbol:=identifier
  else lexsymbol:=lexemeof(symbol);
  if the_buffer.stopline >0 then
      if lexsymbol=newline_sy then
             begin
                  if the_buffer.linenumber > the_buffer.stopline then
                  begin
                       with the_buffer do
                       writeln(stopline,' ',linenumber,' ',bufid);
                       if  errorfree then
                       error('Run time Error line');
		  end
	     end;

	  {$ifdef ispascal}

	  if (lexsymbol=newline_sy)or
             (lexsymbol=comment_sy) then next_symbol(the_buffer);

	  {$endif}
end;
{ -------------------------------------------------------------- }
{       CURRENTID                                                }
{       returns the identifier as a string                       }
{ -------------------------------------------------------------- }
function currentid(var the_buffer :textbuffer) :stringv;
    var n:stringv;
        i,p:integer;
    begin
        with the_buffer do begin
           n:='';
           for i:=start+1 to finish do begin
              n:=n+thetext[i];
           end;
        end;
        currentid:=n;
    end;
{ ------------------------------------------------------------------- }
{          PSYM                                                       }
{          print out a lexeme                                         }
{ ------------------------------------------------------------------- }
  function psym(l:lextoken): stringv;
  var
    f:text;
    s:string[30];
    i:integer;
    c:char;

  begin
     s:='';
     i:=printables[l];
     while pool[i]<>chr(0) do begin

        s:=s+pool[i];
        i:=i+1;
     end;
     psym:=s;
  end;
{ ------------------------------------------------------------------- }
{           HAVE                                                      }
{           conditionally matches a token                             }
{ ------------------------------------------------------------------- }
function have( t: lexeme;var the_buffer :textbuffer ) : boolean;
begin

     if t = lexsymbol then
       begin next_symbol(the_buffer);
             if listprog then write(currentid(the_buffer));
             have:=true
       end
     else  have:=false;
end;
function havetoken( t: lextoken;var the_buffer :textbuffer ) : boolean;
begin
     if t = symbol then
       begin next_symbol(the_buffer);
        if listprog then write(currentid(the_buffer));
             havetoken:=true
       end
     else  havetoken:=false;
end;
{---------------------------------------------------------------------- }
{ errcontext                                                            }
{  prints the position in the source at which error happened            }
{ --------------------------------------------------------------------- }
procedure errcontext(   var the_buffer : textbuffer);
var i:integer; s:string;
begin
     writeln;writeln('In module ',the_buffer.bufid);
     s:=    currentline(the_buffer);
     writeln(the_buffer.linenumber:8,': ',s);
     write(' ':10);
     compilercursor:=the_buffer.start-prevnewline(the_buffer);
     for  i:= 1 to compilercursor  do
     if s[i]=chr(tab) then write(chr(tab)) else  write(' ');
     writeln('^');
end;

{ ------------------------------------------------------------------- }
{          SYNTAX                                                     }
{          report error and stop                                      }
{ ------------------------------------------------------------------- }
procedure syntax( t : lexeme;var the_buffer :textbuffer );
var m :stringv; i:integer;
begin
     m:= currentid(the_buffer) +' found instead of '+ psym(ord(t));
     errormsg(m,the_buffer);
end;
{ ------------------------------------------------------------------- }
{           MUSTBE                                                    }
{           compulsorily matches a token                              }
{ ------------------------------------------------------------------- }
procedure mustbe(t : lexeme;var the_buffer :textbuffer  );
begin
     {writeln('must be ' ,psym(lextoken(t)));   }
     if not have(t,the_buffer) then  begin
     if have(newline_sy,the_buffer) then mustbe(t,the_buffer)
     else syntax(t,the_buffer);
     end;
end;
{
        ***************
        * INITLEXANAL *
        ***************
}
procedure initlexanal;
var B:textbuffer;
    i:integer;
    c:char;
    l:lexeme;
    t:lextoken;
    s:textstream;
    line:textline;
begin
 lasttoken:=0;
 pooltop:=0;
  { create the symbol tree }
  for c:=minchar to maxchar do begin
   new(predefined[c]);
   with predefined[c]^ do begin
       follower:=nil;
       alternates:=nil;
       pref:=chr(0)
       ;
   end;
  end;

  { load up the predefined variables }
  s:=openfilestream(lexemefile);
  while not s^.atendofstream do begin
         if s^.getline(line) then
         t:=tokenof(line);
         end;
   dispose(s,freestream);
end;


{-------------------------------------------------------------------- }
BEGIN
converted:='';
pooltop:=0;
clear_errors;

if errorfree then         initlexanal;

END.

