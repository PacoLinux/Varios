{

-----------------------------------------------------------------
Module      : DLB.pas
Used in     : Compiler toolbox
Uses        : Fsm.cmp
Author      : W P Cockshott
Date        : 9 Oct 1986
Version     : 2
Changes     : changed to unit 21 - 9 - 88
Function    : This uses a de La Brandis tree to convert the
              lexemes to integer tokens
              next_symbol,have, and mustbe provide the basic
              entry points of the lexical analyser.
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
{$r+}
UNIT dlb;

INTERFACE

USES
  errors,
  bufdecls,  fsm;

type

lexeme=(dummy_sy, { all valid lexemes > 0  so we put in a dummy }
BRACE_SY,
RBRACE_SY,
STAR_SY,
DOLLAR_SY,
PLUS_SY,
DPLUS_SY,
MINUS_SY,
ARROW_SY,
up_arrow_sy,
LT_SY,
LE_SY,
EQ_SY,
GT_SY,
GE_SY,
BRA_SY,
KET_SY,
DOT_SY,
DDOT_SY,
ABORT_SY,
ADDRESS_SY,
ALIEN_SY,
AND_SY,
array_sy,
B_AND_SY,
BASETYPE_SY,
B_OR_SY,
BEGIN_SY,
CBOOL_SY,
BOOL_SY,
BY_SY,
CASE_SY,
CHAR_SY,
CHR_SY,
CLASS_SY,
CLAUSE_SY,
COLOUR_SY,
COMMENT_SY,
CONDITION_SY,
const_sy,
DEFAULT_SY,
DIV_SY,
DO_SY,
ELSE_SY,
END_SY,
EOi_SY,
EXP1_SY,
EXP2_SY,
EXP3_SY,
EXP4_SY,
EXP5_SY,
EXPORT_SY,
EXPRESSION_SY,
FALSE_SY,
CFILE_SY,
FILE_SY,
FOR_SY,
forward_sy,
FROM_SY,
FUNCTION_SY,
IF_SY,
IMPORT_SY,
IMPLEMENTATION_SY,
IN_SY,
INCLUDE_SY,
CINT_SY,
INT_SY,
INTERFACE_SY,
IS_SY,
ISNT_SY,
LENGTH_SY,
LET_SY,
LISTON_SY,
LISTOFF_SY,
LWB_SY,
NIL_SY,
OF_SY,
opcode_sy,
OR_SY,
ORD_SY,
OUT_BYTE_SY,
OUTPUT_SY,
PEEK_SY,
PID_SY,
CPNTR_SY,
PNTR_SY,
CPROC_SY,
PROC_SY,
CPROCEDURE_SY,
PROCEDURE_SY,
program_sy,
ptr_sy,
READ_SY,
READ_A_LINE_SY,
READ_BYTE_SY,
READ_NAME_SY,
READB_SY,
READI_SY,
READP_SY,
READR_SY,
READS_SY,
CREAL_SY,
REAL_SY,
RECORD_SY,
rem_SY,
REPEAT_SY,
ROTATE_SY,
SCALE_SY,
SEGMENT_SY,
SET_SY,
SHIFT_SY,
SHIFT_L_SY,
SHIFT_R_SY,
CSTRING_SY,
STRING_SY,
SUBSCRIPT_SY,
TAB_SY,
TAG_,
TEXT_SY,
THEN_SY,
TO_SY,
TRACEON_SY,
TRACEOFF_SY,
TRUE_SY,
type_sy,
until_sy,
UPB_SY,
USES_SY,
var_sy,
VECTOR_SY,
WHILE_SY,
WORD_SY,
WRITE_SY,
CUR_SY,
LEY_SY,
TILDE_SY,
NEQ_SY,
SLASH_SY,
INT_LIT,
REAL_LIT,
STRING_LIT,
IDENTIFIER,
newline_sy,
bar_sy,
semicolon_sy,
colon_sy,
dcolon_sy,
assign_sy,
comma_sy,
at_sy,
question_sy,
void_sy,
call_sy,
seq_sy,
UNDEFINED
);
const endofsource_sy = UNDEFINED;
const lexemefile='pascal.def';

const maxvar = 200;
      maxtoken = 1000;
      maxstring=maxvar;
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
       the_string:stringv;
       the_real:real;
       the_integer:integer;
       psdir:string[80];
{
   *****************
   * PROCEDURES    *
   *****************

}
  function psym(l:lextoken): stringv;
  procedure mustbe(t : lexeme;var the_buffer:textbuffer );
  function have( t: lexeme;var the_buffer:textbuffer) : boolean;
  function tokenof(s:stringv):lextoken;
  procedure next_symbol(var the_buffer:textbuffer);
  function currentid(var the_buffer:textbuffer):stringv;
  procedure initlexanal;


IMPLEMENTATION
const
      minchar = ' ';
      maxchar = '~';
      poolsize=4000;
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

procedure addch(c:char);
begin
     if pooltop < poolsize then begin
       pool[pooltop]:=c;pooltop:=succ(pooltop);
     end
end;

var
       maxpredefined:lextoken;
       {
       ------------------------- de la brandis tree manipulation -------------}

{
       ****************
       * INSERT_TOKEN *
       ****************
       }
function insert_token(var B:textbuffer; var n:lexarray):lextoken;
{  inserts the string into the tree }
{$S-}
var p      : lexnode;
    charno : integer;
    c      : char;
    hit ,inserted   :boolean;
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
       c:=b.thetext^[charno];
       if charno <B.finish then with B do
          if n=nil then begin
             newnode(t,c);
             n:=t;
             ins(n,charno)
          end
          else with  n ^ do
            if c = pref then begin
                 if charno=finish -1 then begin
                    { a  hit }
                    hit:=true;
                    if final = 0 then { first time we have encountered this word}
                    begin
                       final:=lasttoken;
                       printables[final]:=pooltop;
                       for charno:=start to finish-1 do
                          addch(thetext^[charno]);
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
begin
 {$r-}
 ins(  n[B.thetext^[B.start]], B.start);

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
    s:string[90];
    f:text;
begin
 lasttoken:=0;

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
  B.thetext:=addr(s[1]);
  { load up the predefined variables }
  {$i-}
  assign(f,PSDIR+lexemefile);
  reset(f);
  if ioresult<>0 then begin
      writeln(PSDIR+lexemefile,' not found');
      error(PSDIR+lexemefile+' not found');
  end else begin
  {$i+}
    with B do repeat
      linenumber:=1;
      start:=textbuflo; readln(f,s);
      finish:=length(s)+start;
      maxpredefined:=insert_token(B,predefined);
    until  eof(f);
    close(f);
   end;
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
      start:=textbuflo;
      finish:=length(s)+start;
      tokenof:=insert_token(B,predefined);
  end;

end;
{ ------------------------------------------------------------------ }
{      NEXTSYMBOL                                                    }
{      reads the next lexeme, converts to token                      }
{      leaves results in symbol, the.integer, the.real, the.string   }
{ ------------------------------------------------------------------ }
procedure next_symbol(var the_buffer:textbuffer);
var S:fsmstate;
    function numconv:lexeme;
    var n:stringv;
        i,p:integer;
        isint:boolean;
    begin
        isint:=true;
        with the_buffer do begin
           n:='';
           for i:=start to finish-1 do begin
              n:=n+thetext^[i];
              isint:=isint and (thetext^[i] in ['0'..'9']);
           end;
           if isint then begin val(n,the_integer,p); numconv:=INT_LIT end
                    else begin val(n,the_real,p);  numconv:=REAL_LIT end;

       end;
    end;
    procedure printsymbol;
    var i:integer;
        c: char;
    begin
         with the_buffer  do
         if lexsymbol <> newline_sy then begin
            for i:=start to finish -1 do write(thetext^[i]);
            write(' ');
         end else
         begin
           writeln;
         end;
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
           for i:=start+1 to finish -2 do begin
              c:=thetext^[i];
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
        stringconv:=string_lit;
       end;
    end;
var coerce:record
        case boolean of
        true:(l1:lextoken);
        false:(l2:lexeme;dummy:byte);
        end;
begin
  coerce.dummy:=0;
  compilercursor:=the_buffer.start;
  S:=newlexeme(the_buffer);
  with coerce do
  if s in [opstate,brackstate,idstate,dots] then
     l1:=insert_token(the_buffer,predefined)
  else if s in[numstate,expstate]  then l2:=numconv
  else if s in [strings,lastquotestate] then l2:=stringconv
  else
      l2:=newline_sy;
  symbol:=coerce.l1;
  if symbol >maxpredefined then lexsymbol:=identifier
  else lexsymbol:=coerce.l2;
  if stopline >0 then
      if coerce.l2=newline_sy then
             begin
                  if the_line > stopline then
                  begin
                       if  errorfree then
                       error('Run time Error');
                  end
             end;
end;
{ -------------------------------------------------------------- }
{       CURRENTID                                                }
{       returns the identifier as a string                       }
{ -------------------------------------------------------------- }
function currentid(var the_buffer:textbuffer):stringv;
    var n:stringv;
        i,p:integer;
    begin
        with the_buffer do begin
           n:='';
           for i:=start to finish-1 do begin
              n:=n+thetext^[i];
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
function have( t: lexeme;var the_buffer:textbuffer) : boolean;
begin
     if t = lexsymbol then
       begin next_symbol(the_buffer);
             have:=true

       end
     else  have:=false;
end;
{ ------------------------------------------------------------------- }
{          SYNTAX                                                     }
{          report error and stop                                      }
{ ------------------------------------------------------------------- }
procedure syntax( t : lexeme;var the_buffer:textbuffer);
var m :stringv;
begin
     m:= currentid(the_buffer) +' found instead of '+ psym(ord(t));
     Error(m);
end;
{ ------------------------------------------------------------------- }
{           MUSTBE                                                    }
{           compulsorily matches a token                              }
{ ------------------------------------------------------------------- }
procedure mustbe(t : lexeme;var the_buffer:textbuffer );
begin
     if not have(t, the_buffer) then  begin
     if have(newline_sy,the_buffer) then
      mustbe(t,the_buffer)
      else syntax(t, the_buffer);
     end;
end;


{-------------------------------------------------------------------- }
BEGIN
     converted:='';
     pooltop:=0;
     psdir:='';
     stopline:=0;

END.