{
-----------------------------------------------------------------
Module      :FSM.cmp
Used in     :Compiler toolbox
Author      :W P Cockshott
Date        :3 Oct 1986
Version     :1
Function    :Finite State Transducer to perform first level lexical
              analysis.
              Splits up text in a buffer into lexemes
Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
UNIT fsm;
INTERFACE   USES
  bufdecls;

type fsmstate =(startstate,opstate,idstate,numstate,
                expstate,commentstate,stringstate,escapestate,
                lastquotestate,sepstate,brackstate);
     charclass=(operatorsym,bracket,alpha,digits,exponent,dquote,
                quote,shriek,separator,whitespace);
const classtab:array[0..127] of charclass =(

 { ^@} whitespace, { ^A} whitespace, { ^B} whitespace, { ^C} whitespace,
 { ^D} whitespace, { ^E} whitespace, { ^F} whitespace, { ^G} whitespace,
 { ^H} whitespace, { ^I} whitespace, { ^J} whitespace, { ^K} whitespace,
 { ^L} whitespace, { ^M} separator, { ^N} whitespace, { ^O} whitespace,
 { ^P} whitespace, { ^Q} whitespace, { ^R} whitespace, { ^S} whitespace,
 { ^T} whitespace, { ^U} whitespace, { ^V} whitespace, { ^W} whitespace,
 { ^X} whitespace, { ^Y} whitespace, { ^Z} whitespace, { ^[} whitespace,
 { ^\} whitespace, { ^]} whitespace, { ^^} whitespace, { ^_} whitespace,
 {  } whitespace, { !} shriek, { "} dquote, { #} whitespace,
 { $} operatorsym, { %} operatorsym, { &} operatorsym, { '} quote,
 { (} bracket, { )} bracket, { *} bracket, { +} operatorsym,
 { ,} bracket, { -} operatorsym, { .} digits, { /} operatorsym,
 { 0} digits, { 1} digits, { 2} digits, { 3} digits,
 { 4} digits, { 5} digits, { 6} digits, { 7} digits,
 { 8} digits, { 9} digits, { :} operatorsym, { ;} separator,
 { <} operatorsym, { =} operatorsym, { >} operatorsym, { ?} operatorsym,
 { @} operatorsym, { A} alpha, { B} alpha, { C} alpha,
 { D} alpha, { E} exponent, { F} alpha, { G} alpha,
 { H} alpha, { I} alpha, { J} alpha, { K} alpha,
 { L} alpha, { M} alpha, { N} alpha, { O} alpha,
 { P} alpha, { Q} alpha, { R} alpha, { S} alpha,
 { T} alpha, { U} alpha, { V} alpha, { W} alpha,
 { X} alpha, { Y} alpha, { Z} alpha, { [} bracket,
 { \} whitespace, { ]} bracket, { ^} operatorsym, { _} operatorsym,
 { `} operatorsym, { a} alpha, { b} alpha, { c} alpha,
 { d} alpha, { e} exponent, { f} alpha, { g} alpha,
 { h} alpha, { i} alpha, { j} alpha, { k} alpha,
 { l} alpha, { m} alpha, { n} alpha, { o} alpha,
 { p} alpha, { q} alpha, { r} alpha, { s} alpha,
 { t} alpha, { u} alpha, { v} alpha, { w} alpha,
 { x} alpha, { y} alpha, { z} alpha, {   } bracket,
 { |} operatorsym, { closing bracket}bracket, { ~} operatorsym, { del}whitespace
);           { end of classtab }
      includedepth=2;

 type
  ColCnt  = 0..PhyScrCols;

 const
  TextBufLo     =  0;            { lower bound of text buffer array }

  syndebug  :boolean = false;
  trace     :boolean = false;
  TxtColour:integer =11;       { Light cyan on black}
  CmdColour:integer =48;       { Black on cyan}
  BlkColour:integer =32;       { Black on blue}
  AutoIndent:boolean = true;
  InsertMode:boolean = true;
  Tab_8:boolean = false;
  AutoSave:boolean = true;
  defextension= ' ';
  defParameters= '';
  defHelpFile= 'Help.msg';
  deflexemefile= 'lexemes.def';
  deflistfilename ='s.lis';
  defASMfn= 's.asm';
  defMACROLIB= '';
  defPASS2PROG= '';
  defPSDIR= './';
  var
   extension, Parameters,  HelpFile,  lexemefile,  listfilename,  ASMfn,
   MACROLIB,  PASS2PROG,  PSDIR:    textline  ;
   listprog  :boolean  ;

{=================================================================
 above here is for the configuration file
=================================================================}

var
  FileName:TextLine;          { name of file being Edited }
  ShortName:TextLine;         { shortenned version of FileName }
  Listfile :text;             { listing file for errors }       InCompiler:         { doing compilation ? }
    boolean;

type
  BufIndex = TextBufLo..TextSize;

  textbuffer = record
              thetext:pCharSeq;
              start,finish,textlen:integer;
              linenumber :integer;
              {point at the start and finish of lexeme and give length of buffer }
             end;
      string80= string[80];
var
       the_buffer:textbuffer;
       stopline  :integer;
{-------------------------------------------------------------- }
{   THE_LINE                                                    }
{   return the current line number                              }
{-------------------------------------------------------------- }
function the_line:integer;
{-------------------------------------------------------------- }
{    REWIND                                                     }
{    moves the finite state recogniser back to the start        }
{    of the text buffer                                         }
{-------------------------------------------------------------- }
procedure rewind;
{-------------------------------------------------------------- }
{      Push and Pop buffers                                     }
{      this is used to implement include files                  }
{      push_buffer saves old text buffer                        }
{      pop_buffer restores old text buffer                      }
{---------------------------------------------------------------}
function push_buffer:boolean;
function pop_buffer:boolean;
{-------------------------------------------------------------- }
{  NEWLEXEME                                                    }
{  skips start and finish to point at new lexeme             }
{  returns type of lexeme                                       }
{ ------------------------------------------------------------- }
function newlexeme(var B:textbuffer):fsmstate;

IMPLEMENTATION {---------------------------------------------------}

var
       include_sp :integer ;
       NEWSTATE:fsmstate;
       buffstack :array[1..includedepth] of textbuffer;
procedure setdefaults;
begin
  extension:=defextension;
  Parameters:=defParameters;
  HelpFile:=defHelpFile;
  lexemefile:=deflexemefile;
  listfilename:=deflistfilename;
  ASMfn:=defASMfn;
  MACROLIB:=defMACROLIB;
  PASS2PROG:=defPASS2PROG;
  PSDIR:=defPSDIR;
end;
procedure rewind;
begin
     NEWSTATE:=startstate;
     the_buffer.start:=textbuflo;
     the_buffer.finish:=textbuflo;
     include_sp:=0;
end;

function the_line:integer;
begin
     the_line:=the_buffer.linenumber;
end;
function push_buffer:boolean;
begin
     if include_sp<includedepth then begin
        push_buffer:=true;
        include_sp:=include_sp+1;
        buffstack[include_sp]:=the_buffer;
     end else push_buffer:=false;
end;
function pop_buffer:boolean;
begin
     if include_sp>0 then begin
        pop_buffer:=true;
        with the_buffer do freemem(thetext,textlen);
        the_buffer:=buffstack[include_sp];
        include_sp:=include_sp-1;
     end else pop_buffer:=false;
end;
function newlexeme(var B:textbuffer):fsmstate;
  label 1,99;
  const transtable:array [fsmstate,charclass] of fsmstate =
         (
         {startstate}
            {operator bracket    alpha    digits   exponen}
            (opstate, brackstate, idstate, numstate,idstate,
            {  "          '          !             ;          whitespace}
             stringstate, startstate,commentstate, sepstate, startstate),

         {opstate}
            {operator bracket    alpha    digits   exponen}
            (opstate, brackstate, idstate,numstate,idstate,
            {  "          '          !             ;          whitespace}
             stringstate, startstate,commentstate, sepstate, startstate),

         {idstate}
            {operator   bracket    alpha    digits   exponen}
            (opstate, brackstate, idstate, idstate, idstate,
            {  "          '          !             ;          whitespace}
             stringstate, startstate,commentstate, sepstate, startstate),

         {numstate}
            {operator   bracket    alpha      digits   exponen}
            (opstate,   brackstate,idstate, numstate, expstate,
            {  "          '            !             ;          whitespace}
             stringstate, startstate,  commentstate, sepstate, startstate),

         {expstate}
            {operator   bracket    alpha      digits     exponen}
            (numstate,  brackstate, idstate, numstate, idstate,
            {  "          '          !             ;          whitespace}
             stringstate, startstate,  commentstate, sepstate, startstate),

         {commentstate}
            {operator      bracket       alpha         digits       exponen}
            (commentstate, commentstate, commentstate, commentstate,commentstate,
            {  "           '            !             ;          whitespace}
             commentstate, commentstate,commentstate, sepstate, commentstate),


         {stringstate}
            {operator      bracket       alpha         digits       exponen}
            (stringstate, stringstate, stringstate, stringstate,stringstate,
            {  "             '              !             ;          whitespace}
             lastquotestate, escapestate,stringstate, stringstate, stringstate),


         {escapestate}
            {operator      bracket       alpha         digits       exponen}
            (stringstate, stringstate, stringstate, stringstate,stringstate,
            {  "             '              !             ;          whitespace}
              stringstate, stringstate,stringstate, stringstate, stringstate),

         {lastquotestate}
            {operator      bracket    alpha    digits       exponen}
            (opstate, brackstate,   idstate,  numstate,   idstate,
            {  "             '              !             ;          whitespace}
              stringstate, startstate,commentstate, sepstate, startstate),

         {sepstate}
            {operator bracket    alpha    digits   exponen}
            (opstate, brackstate, idstate, numstate,idstate,
            {  "          '          !             ;     whitespace}
             stringstate, startstate,commentstate, sepstate, startstate),

         {brackstate}
            {operator bracket    alpha    digits   exponen}
            (opstate, brackstate, idstate, numstate,idstate,
            {  "          '          !             ;     whitespace}
             stringstate, startstate,commentstate, sepstate, startstate)
         );
         type action =(last,skip,include);
         const emit:array [fsmstate,charclass] of action =
         (
         {startstate}
            {operator bracket    alpha    digits   exponen}
            (skip,   skip,     skip,   skip,   skip,
            {  "          '          !          ;          whitespace}
             skip,   skip,      skip,           skip,     skip),

         {opstate}
            {operator bracket    alpha    digits   exponen}
            (include,   last,     last,   last,   last,
            {  "          '          !     ;          whitespace}
             last,   last,      last,     last,     last),

         {idstate}
            {operator bracket    alpha    digits   exponen}
            (last ,   last,      include,    include,    include,
            {  "          '          !  ;          whitespace}
             last,   last,      last,     last,     last),

         {numstate}
            {operator bracket    alpha    digits   exponen}
            (last,   last,      last,      include,    include,
            {  "          '          !  ;          whitespace}
             last,   last,      last,   last,     last),

         {expstate}
            {operator bracket    alpha    digits   exponen}
            (include,   last,      last,      include,    last,
            {  "          '          !  ;          whitespace}
             last,   last,      last,   last,     last),

         {commentstate}
            {operator bracket    alpha    digits   exponen}
            (skip,   skip,     skip,   skip,   skip,
            {  "          '      !     ;          whitespace}
             skip,   skip,      skip,  last,     skip),

         {stringstate}
            {operator bracket    alpha    digits   exponen}
            (include,   include,     include,   include,   include,
            {  "          '          !     ;          whitespace}
             include,   include,      include,   include,     include),


         {escapestate}
            {operator bracket    alpha    digits   exponen}
            (include,   include,     include,   include,   include,
            {  "          '          !     ;          whitespace}
             include,   include,      include,   include,     include),

         {lastquotestate}
            {operator bracket    alpha    digits   exponen}
            (last,   last,      last,      last,    last,
            {  "          '          !  ;          whitespace}
             last,   last,      last,   last,     last),

         {sepstate}
            {operator bracket    alpha    digits   exponen}
            (last,   last,      last,      last,    last,
            {  "          '          !  ;          whitespace}
             last,   last,      last,   last,     last),

         {brackstate}
            {operator bracket    alpha    digits   exponen}
            (last,   last,      last,      last,    last,
            {  "          '          !   ;          whitespace}
             last,   last,      last,    last,     last)
         );

         var
            S:fsmstate;
            C:charclass;
            A:action;

            I:integer;
         begin
              1:

              the_buffer.start:=the_buffer.finish;
              if listprog then
              { put the condition outside the loop to prevent things
                being slowed down too much }
              repeat
                 S:=NEWSTATE;
                 the_buffer.finish := the_buffer.finish+1;
                 I:=ord(the_buffer.thetext^[the_buffer.finish] );
                 write(listfile,chr(i));
                 if I= 10 then begin
                     the_buffer.linenumber:=the_buffer.linenumber+1;

                 end ;

                 C:=classtab[I and 127];
                 NEWSTATE:= transtable[S,C];
                 A:=emit[S,C];
                 if A= skip then the_buffer.start:=the_buffer.finish ;   { mark start of lexeme }
                 if the_buffer.finish >= the_buffer.textlen then begin
                 { HANDLE RUNNING OUT OF THE BUFFER }
                    if pop_buffer then goto 1 ;
                    a:=last;
                 end;
              until( A=last)
              else
              repeat
                 S:=NEWSTATE;
                 the_buffer.finish := the_buffer.finish+1;
                 I:=ord(the_buffer.thetext^[the_buffer.finish] );
                 if I= 10 then begin
                     the_buffer.linenumber:=the_buffer.linenumber+1;
                 end ;

                 C:=classtab[I and 127];
                 NEWSTATE:= transtable[S,C];
                 A:=emit[S,C];
                 if A= skip then the_buffer.start:=the_buffer.finish ;   { mark start of lexeme }
                 if the_buffer.finish >= the_buffer.textlen then begin
                 { HANDLE RUNNING OUT OF THE BUFFER }
                    if pop_buffer then goto 1 ;
                    a:=last;
                 end;
              until( A=last) ;
              99:

              newlexeme:=S;
         end;

var i:integer;

begin
	   setdefaults;
       NEWSTATE:=startstate;
       listprog:=false;
       include_sp := 0;
end.

