{
-----------------------------------------------------------------
Module      : FSM.pas
Used in     : Compiler toolbox
Author      : W P Cockshott
Date        : 3 Oct 1986
Version     : 3 Modified for language F April 2000

Function    : Finite State Transducer to perform first level lexical
              analysis.
	      Splits up text in a buffer into lexemes

Copyright (C) WP Cockshott & P Balch
----------------------------------------------------------------
}
UNIT fsm;
INTERFACE
USES
  fglobals;
  const
  TextBufLo     =  0;            { lower bound of text buffer array }
  TextSize      = 100000;         { number of chars in text buffer array }
  type  
	BufIndex = TextBufLo..TextSize;
  	CharSeq = array [BufIndex] of char; { text buffer type }
  	pCharSeq= ^CharSeq;
  	{
  	The Finite State machine first maps characters to character
        classes in order that the machines jump tables are smaller
  	}
 type fsmstate =(startstate,
                opstate,		{ state entered for .alpha. operators }
                idstate,                { state for identifier and reserve words}
                numstate,               { state for digit strings }
                expstate,               { state for exponent parts of reals }
                commentstate,           { state for comments }
                stringstate,            { state when parsing strings }
                escapestate,            { state when parsing the "" in a string}
                lastquotestate,         { state on ending strings }
                sepstate ,              { state on recognising a newline }
                Continuationstate , 	{ recognising & nelwine sequence }
                compoundopstate,        { for operators that are two symbols long}
                unitaryopstate,		{ for operators with one symbol }
                errorstate
                );
     charclass=(operator1,              { operators that can be part of a pair }
                alpha,                  { letters  except for lower case e }
                digits,                 { decimal digits }
                exponent,               { lower case e }
                dquote,			{ " }
                shriek,			{ ! }
                separator,              { end of line not preceded by continuer}
                whitespace,             { anything ignored }
                illegal,                { not allowed }
                dot,                    { full stop }
                operator2,		{ operators that are unitary }
                underbar,		{ the under bar character }
                continuer);             { & }
const classtab:array[0..127] of charclass =(
 { ^ @} whitespace, 	{ ^ A} whitespace, { ^ B} whitespace, { ^ C} whitespace,
 { ^D} whitespace, 	{ ^E} whitespace, { ^F} whitespace, { ^G} whitespace,
 { ^H} whitespace, 	{ ^I} whitespace, { ^J} whitespace, { ^K} whitespace,
 { ^L} whitespace, 	{ ^M} separator,  { ^N} whitespace, { ^O} whitespace,
 { ^P} whitespace, 	{ ^Q} whitespace, { ^R} whitespace, { ^S} whitespace,
 { ^T} whitespace, 	{ ^U} whitespace, { ^V} whitespace, { ^W} whitespace,
 { ^X} whitespace, 	{ ^Y} whitespace, { ^Z} whitespace, { ^[} whitespace,
 { ^\} whitespace, 	{ ^]} whitespace, { ^^} whitespace, { ^_} whitespace,
 {  } whitespace, 	{ !} shriek, 	{ "} dquote, 	{ #} illegal,
 { $} illegal, 		{ %} operator2, { &} continuer, { '} illegal,
 { (} operator1, 	{ )} operator1, { *} operator1, { +} operator2,
 { ,} operator2, 	{ -} operator2, { .} dot, 	{ /} operator1,
 { 0} digits, 		{ 1} digits, 	{ 2} digits, 	{ 3} digits,
 { 4} digits, 		{ 5} digits, 	{ 6} digits, 	{ 7} digits,
 { 8} digits, 		{ 9} digits, 	{ :} operator1, { ;} illegal,
 { <} operator1, 	{ =} operator1, { >} operator1, { ?} illegal,
 { @} illegal, 		{ A} alpha, 	{ B} alpha, 	{ C} alpha,
 { D} alpha, 		{ E} exponent, 	{ F} alpha, 	{ G} alpha,
 { H} alpha, 		{ I} alpha, 	{ J} alpha, 	{ K} alpha,
 { L} alpha, 		{ M} alpha, 	{ N} alpha, 	{ O} alpha,
 { P} alpha, 		{ Q} alpha, 	{ R} alpha, 	{ S} alpha,
 { T} alpha, 		{ U} alpha, 	{ V} alpha, 	{ W} alpha,
 { X} alpha, 		{ Y} alpha, 	{ Z} alpha, 	{ [} illegal,
 { \} illegal, 		{ ]} illegal, 	{ ^} illegal, 	{ _} underbar,
 { `} illegal, 		{ a} alpha, 	{ b} alpha, 	{ c} alpha,
 { d} alpha, 		{ e} exponent, 	{ f} alpha, 	{ g} alpha,
 { h} alpha, 		{ i} alpha, 	{ j} alpha, 	{ k} alpha,
 { l} alpha, 		{ m} alpha, 	{ n} alpha, 	{ o} alpha,
 { p} alpha, 		{ q} alpha, 	{ r} alpha, 	{ s} alpha,
 { t} alpha, 		{ u} alpha, 	{ v} alpha, 	{ w} alpha,
 { x} alpha, 		{ y} alpha, 	{ z} alpha, 	{ {} illegal,
 { |} illegal, 		{ closing bracket}illegal, { ~} illegal, { del}whitespace
);           { end of classtab }


const
      includedepth=2;
type  textbuffer = record
              thetext: pCharSeq;
              start,finish,textlen: integer;
              linenumber :integer;
              {point at the start and finish of lexeme and give length of buffer }
             end;

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
{  skips start and finish to point at new lexeme                }
{  returns type of lexeme                                       }
{ ------------------------------------------------------------- }
function newlexeme(var B:textbuffer):fsmstate;

IMPLEMENTATION {---------------------------------------------------}

var
       include_sp 	: integer ;
       NEWSTATE	  	: fsmstate;
       buffstack 	: array[1..includedepth] of textbuffer;

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
       { with the_buffer do 	freemem(thetext,textlen); }
        the_buffer:=buffstack[include_sp];
        include_sp:=include_sp-1;
     end else pop_buffer:=false;
end;
function newlexeme(var B:textbuffer):fsmstate;
         const transtable:array [fsmstate,charclass] of fsmstate =
         (
         {startstate}(
		compoundopstate	{operator1},
                idstate		{alpha},
                numstate	{digits},
                idstate		{exponent},
                stringstate	{dquote},	{ " }
                commentstate	{shriek},	{ ! }
                sepstate	{separator},    { cr }
                startstate	{whitespace},   { anything ignored }
                startstate	{illegal},
                opstate		{dot},          { parse things like .eq. }
                unitaryopstate	{operator2},	{ operators that are unitary }
                unitaryopstate	{underbar},	{ must be a numeric qualifier }
                continuationstate{continuer}),  { & }


         {opstate}   (
		compoundopstate	{operator1},
                opstate		{alpha},  	{ expect alpha in this state }
                numstate	{digits},
                opstate		{exponent},     { expect alpha in this state }
                stringstate	{dquote},	{ " }
                commentstate	{shriek},	{ ! }
                sepstate	{separator},    { cr }
                startstate	{whitespace},   { anything ignored }
                startstate	{illegal},
                startstate	{dot},          { this is the end of op }
                unitaryopstate	{operator2},	{ operators that are unitary }
                unitaryopstate	{underbar},	{ must be a numeric qualifier }
                continuationstate{continuer}),  { & }

         {idstate}   (
		compoundopstate	{operator1},
                idstate		{alpha},
                idstate		{digits},
                idstate		{exponent},
                stringstate	{dquote},	{ " }
                commentstate	{shriek},	{ ! }
                sepstate	{separator},    { cr }
                startstate	{whitespace},   { anything ignored }
                startstate	{illegal},
                opstate		{dot},          { parse things like .eq. }
                unitaryopstate	{operator2},	{ operators that are unitary }
                idstate		{underbar},	{ must be a numeric qualifier }
                continuationstate{continuer}),  { & }

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
         label 1,99;
         var
            S:fsmstate;
            C:charclass;
            A:action;
            T:textbuffer absolute the_buffer;
            I:integer;
         begin
              1:
              t.start:=t.finish;
	      if listing in options then
              { put the condition outside the loop to prevent things
                being slowed down too much }
              repeat
                 S:=NEWSTATE;
                 t.finish := t.finish+1;
                 I:=ord(T.thetext^[t.finish] );
                 write(listfile,chr(i));
                 if I= 10 then begin
                     t.linenumber:=t.linenumber+1;
                 end ;
                 C:=classtab[I and 127];
                 NEWSTATE:= transtable[S,C];
                 A:=emit[S,C];
                 if A= skip then t.start:=t.finish ;   { mark start of lexeme }
                 if t.finish >= t.textlen then begin
                 { HANDLE RUNNING OUT OF THE BUFFER }
                    if pop_buffer then goto 1 ;
                    a:=last;
                 end;
              until( A=last)
              else
              repeat
                 S:=NEWSTATE;
                 t.finish := t.finish+1;
                 I:=ord(T.thetext^[t.finish] );
                 if I= 10 then begin
                     t.linenumber:=t.linenumber+1;
                 end ;
                 C:=classtab[I and 127];
                 NEWSTATE:= transtable[S,C];
                 A:=emit[S,C];
                 if A= skip then t.start:=t.finish ;   { mark start of lexeme }
                 if t.finish >= t.textlen then begin
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
       NEWSTATE:=startstate;
       listprog:=false;
       include_sp := 0;
end.
