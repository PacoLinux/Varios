
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)


(* PASLEX.L: lexical analyzer for Pascal, adapted to TP Lex, 2-28-89 AG *)


(*
 * lex input file for pascal scanner
 *
 * extensions: to ways to spell "external" and "->" ok for "^".
 *
 *)


(* Note: Keywords are determined by scanning a keyword table, rather
   than including the keyword patterns in the Lex source which is done
   in the original version of this file. I prefer this method, because
   it makes the grammar itself more readable (handling case-insensitive
   keywords in Lex is quite cumbersome, e.g., you will have to write
   something like [Aa][Nn][Dd] to match the keyword `and'), and also
   produces a more (space-) efficient analyzer (184 states and 375
   transitions for the keyword pattern version, against only 40 states
   and 68 transitions for the keyword table version). *)

procedure commenteof;
  begin
    writeln('unexpected EOF inside comment at line ', yylineno);
  end(*commenteof*);

function upper(str : String) : String;
  (* converts str to uppercase *)
  var i : integer;
  begin
    for i := 1 to length(str) do
      str[i] := upCase(str[i]);
    upper := str
  end(*upper*);

function is_keyword(id : string; var token : integer) : boolean;
  (* checks whether id is Pascal keyword; if so, returns corresponding
     token number in token *)
  const
    id_len = 20;
  type
    Ident = string[id_len];
  const
    (* table of Pascal keywords: *)
    no_of_keywords = 39;
    keyword : array [1..no_of_keywords] of Ident = (
      'AND',       'ARRAY',     'BEGIN',    'CASE',
      'CONST',     'DIV',       'DO',       'DOWNTO',
      'ELSE',      'END',       'EXTERNAL', 'EXTERN',
      'FILE',      'FOR',       'FORWARD',  'FUNCTION',
      'GOTO',      'IF',        'IN',       'LABEL',
      'MOD',       'NIL',       'NOT',      'OF',
      'OR',        'OTHERWISE', 'PACKED',   'PROCEDURE',
      'PROGRAM',   'RECORD',    'REPEAT',   'SET',
      'THEN',      'TO',        'TYPE',     'UNTIL',
      'VAR',       'WHILE',     'WITH');
    keyword_token : array [1..no_of_keywords] of integer = (
      _AND,        _ARRAY,      _BEGIN,     _CASE,
      _CONST,      _DIV,        _DO,        _DOWNTO,
      _ELSE,       _END,        _EXTERNAL,  _EXTERNAL,
                                (* EXTERNAL: 2 spellings (see above)! *)
      _FILE,       _FOR,        _FORWARD,   _FUNCTION,
      _GOTO,       _IF,         _IN,        _LABEL,
      _MOD,        _NIL,        _NOT,       _OF,
      _OR,         _OTHERWISE,  _PACKED,    _PROCEDURE,
      _PROGRAM,    _RECORD,     _REPEAT,    _SET,
      _THEN,       _TO,         _TYPE,      _UNTIL,
      _VAR,        _WHILE,      _WITH);
  var m, n, k : integer;
  begin
    id := upper(id);
    (* binary search: *)
    m := 1; n := no_of_keywords;
    while m<=n do
      begin
        k := m+(n-m) div 2;
        if id=keyword[k] then
          begin
            is_keyword := true;
            token := keyword_token[k];
            exit
          end
        else if id>keyword[k] then
          m := k+1
        else
          n := k-1
      end;
    is_keyword := false
  end(*is_keyword*);




function yylex : Integer;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)


var c  : char;
    kw : integer;


begin
  (* actions: *)
  case yyruleno of
  1:
                      	if is_keyword(yytext, kw) then
                          return(kw)
                        else
                          return(IDENTIFIER);

  2:
    			return(ASSIGNMENT);
  3:
                	return(CHARACTER_STRING);
  4:
   			return(COLON);
  5:
   			return(COMMA);
  6:
      			return(DIGSEQ);
  7:
   			return(DOT);
  8:
    			return(DOTDOT);
  9:
   			return(EQUAL);
  10:
    			return(GE);
  11:
   			return(GT);
  12:
   			return(LBRAC);
  13:
    			return(LE);
  14:
   			return(LPAREN);
  15:
   			return(LT);
  16:
   			return(MINUS);
  17:
    			return(NOTEQUAL);
  18:
   			return(PLUS);
  19:
   			return(RBRAC);
  20:
               		return(REALNUMBER);
  21:
   			return(RPAREN);
  22:
   			return(SEMICOLON);
  23:
   			return(SLASH);
  24:
   			return(STAR);
  25:
    			return(STARSTAR);
  26,
  27:
   			return(UPARROW);

  28,
  29:
   			begin
                          repeat
			    c := get_char;
			    case c of
			      '}' : ;
			      '*' : begin
				      c := get_char;
				      if c=')' then exit else unget_char(c)
				    end;
                              #0 : begin
                                     commenteof;
                                     exit;
                                   end;
			    end;
			  until false
                        end;
  30:
         		;

  31:
 			return(ILLEGAL);
  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 55;
yynmatches = 55;
yyntrans   = 68;
yynstates  = 40;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  1,
  31,
  { 3: }
  4,
  31,
  { 4: }
  31,
  { 5: }
  5,
  31,
  { 6: }
  6,
  31,
  { 7: }
  7,
  31,
  { 8: }
  9,
  31,
  { 9: }
  11,
  31,
  { 10: }
  12,
  31,
  { 11: }
  15,
  31,
  { 12: }
  14,
  31,
  { 13: }
  16,
  31,
  { 14: }
  18,
  31,
  { 15: }
  19,
  31,
  { 16: }
  21,
  31,
  { 17: }
  22,
  31,
  { 18: }
  23,
  31,
  { 19: }
  24,
  31,
  { 20: }
  27,
  31,
  { 21: }
  29,
  31,
  { 22: }
  30,
  { 23: }
  30,
  31,
  { 24: }
  31,
  { 25: }
  1,
  { 26: }
  2,
  { 27: }
  { 28: }
  { 29: }
  6,
  { 30: }
  { 31: }
  8,
  { 32: }
  10,
  { 33: }
  13,
  { 34: }
  17,
  { 35: }
  28,
  { 36: }
  26,
  { 37: }
  25,
  { 38: }
  3,
  { 39: }
  20
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
  1,
  31,
{ 3: }
  4,
  31,
{ 4: }
  31,
{ 5: }
  5,
  31,
{ 6: }
  6,
  31,
{ 7: }
  7,
  31,
{ 8: }
  9,
  31,
{ 9: }
  11,
  31,
{ 10: }
  12,
  31,
{ 11: }
  15,
  31,
{ 12: }
  14,
  31,
{ 13: }
  16,
  31,
{ 14: }
  18,
  31,
{ 15: }
  19,
  31,
{ 16: }
  21,
  31,
{ 17: }
  22,
  31,
{ 18: }
  23,
  31,
{ 19: }
  24,
  31,
{ 20: }
  27,
  31,
{ 21: }
  29,
  31,
{ 22: }
  30,
{ 23: }
  30,
  31,
{ 24: }
  31,
{ 25: }
  1,
{ 26: }
  2,
{ 27: }
{ 28: }
{ 29: }
  6,
{ 30: }
{ 31: }
  8,
{ 32: }
  10,
{ 33: }
  13,
{ 34: }
  17,
{ 35: }
  28,
{ 36: }
  26,
{ 37: }
  25,
{ 38: }
  3,
{ 39: }
  20
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #1..#8,#11,#13..#31,'!'..'&','?','@','\',
            '_','`','|'..#255 ]; s: 24),
  ( cc: [ #9,#12,' ' ]; s: 23),
  ( cc: [ #10 ]; s: 22),
  ( cc: [ '''' ]; s: 4),
  ( cc: [ '(' ]; s: 12),
  ( cc: [ ')' ]; s: 16),
  ( cc: [ '*' ]; s: 19),
  ( cc: [ '+' ]; s: 14),
  ( cc: [ ',' ]; s: 5),
  ( cc: [ '-' ]; s: 13),
  ( cc: [ '.' ]; s: 7),
  ( cc: [ '/' ]; s: 18),
  ( cc: [ '0'..'9' ]; s: 6),
  ( cc: [ ':' ]; s: 3),
  ( cc: [ ';' ]; s: 17),
  ( cc: [ '<' ]; s: 11),
  ( cc: [ '=' ]; s: 8),
  ( cc: [ '>' ]; s: 9),
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 2),
  ( cc: [ '[' ]; s: 10),
  ( cc: [ ']' ]; s: 15),
  ( cc: [ '^' ]; s: 20),
  ( cc: [ '{' ]; s: 21),
{ 1: }
  ( cc: [ #1..#8,#11,#13..#31,'!'..'&','?','@','\',
            '_','`','|'..#255 ]; s: 24),
  ( cc: [ #9,#12,' ' ]; s: 23),
  ( cc: [ #10 ]; s: 22),
  ( cc: [ '''' ]; s: 4),
  ( cc: [ '(' ]; s: 12),
  ( cc: [ ')' ]; s: 16),
  ( cc: [ '*' ]; s: 19),
  ( cc: [ '+' ]; s: 14),
  ( cc: [ ',' ]; s: 5),
  ( cc: [ '-' ]; s: 13),
  ( cc: [ '.' ]; s: 7),
  ( cc: [ '/' ]; s: 18),
  ( cc: [ '0'..'9' ]; s: 6),
  ( cc: [ ':' ]; s: 3),
  ( cc: [ ';' ]; s: 17),
  ( cc: [ '<' ]; s: 11),
  ( cc: [ '=' ]; s: 8),
  ( cc: [ '>' ]; s: 9),
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 2),
  ( cc: [ '[' ]; s: 10),
  ( cc: [ ']' ]; s: 15),
  ( cc: [ '^' ]; s: 20),
  ( cc: [ '{' ]; s: 21),
{ 2: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 25),
{ 3: }
  ( cc: [ '=' ]; s: 26),
{ 4: }
  ( cc: [ #1..'&','('..#255 ]; s: 27),
  ( cc: [ '''' ]; s: 28),
{ 5: }
{ 6: }
  ( cc: [ '.' ]; s: 30),
  ( cc: [ '0'..'9' ]; s: 29),
{ 7: }
  ( cc: [ '.' ]; s: 31),
{ 8: }
{ 9: }
  ( cc: [ '=' ]; s: 32),
{ 10: }
{ 11: }
  ( cc: [ '=' ]; s: 33),
  ( cc: [ '>' ]; s: 34),
{ 12: }
  ( cc: [ '*' ]; s: 35),
{ 13: }
  ( cc: [ '>' ]; s: 36),
{ 14: }
{ 15: }
{ 16: }
{ 17: }
{ 18: }
{ 19: }
  ( cc: [ '*' ]; s: 37),
{ 20: }
{ 21: }
{ 22: }
{ 23: }
{ 24: }
{ 25: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 25),
{ 26: }
{ 27: }
  ( cc: [ #1..'&','('..#255 ]; s: 27),
  ( cc: [ '''' ]; s: 38),
{ 28: }
  ( cc: [ '''' ]; s: 27),
{ 29: }
  ( cc: [ '.' ]; s: 30),
  ( cc: [ '0'..'9' ]; s: 29),
{ 30: }
  ( cc: [ '0'..'9' ]; s: 39),
{ 31: }
{ 32: }
{ 33: }
{ 34: }
{ 35: }
{ 36: }
{ 37: }
{ 38: }
  ( cc: [ '''' ]; s: 27),
{ 39: }
  ( cc: [ '0'..'9' ]; s: 39)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 5,
{ 5: } 6,
{ 6: } 8,
{ 7: } 10,
{ 8: } 12,
{ 9: } 14,
{ 10: } 16,
{ 11: } 18,
{ 12: } 20,
{ 13: } 22,
{ 14: } 24,
{ 15: } 26,
{ 16: } 28,
{ 17: } 30,
{ 18: } 32,
{ 19: } 34,
{ 20: } 36,
{ 21: } 38,
{ 22: } 40,
{ 23: } 41,
{ 24: } 43,
{ 25: } 44,
{ 26: } 45,
{ 27: } 46,
{ 28: } 46,
{ 29: } 46,
{ 30: } 47,
{ 31: } 47,
{ 32: } 48,
{ 33: } 49,
{ 34: } 50,
{ 35: } 51,
{ 36: } 52,
{ 37: } 53,
{ 38: } 54,
{ 39: } 55
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 4,
{ 4: } 5,
{ 5: } 7,
{ 6: } 9,
{ 7: } 11,
{ 8: } 13,
{ 9: } 15,
{ 10: } 17,
{ 11: } 19,
{ 12: } 21,
{ 13: } 23,
{ 14: } 25,
{ 15: } 27,
{ 16: } 29,
{ 17: } 31,
{ 18: } 33,
{ 19: } 35,
{ 20: } 37,
{ 21: } 39,
{ 22: } 40,
{ 23: } 42,
{ 24: } 43,
{ 25: } 44,
{ 26: } 45,
{ 27: } 45,
{ 28: } 45,
{ 29: } 46,
{ 30: } 46,
{ 31: } 47,
{ 32: } 48,
{ 33: } 49,
{ 34: } 50,
{ 35: } 51,
{ 36: } 52,
{ 37: } 53,
{ 38: } 54,
{ 39: } 55
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 3,
{ 4: } 5,
{ 5: } 6,
{ 6: } 8,
{ 7: } 10,
{ 8: } 12,
{ 9: } 14,
{ 10: } 16,
{ 11: } 18,
{ 12: } 20,
{ 13: } 22,
{ 14: } 24,
{ 15: } 26,
{ 16: } 28,
{ 17: } 30,
{ 18: } 32,
{ 19: } 34,
{ 20: } 36,
{ 21: } 38,
{ 22: } 40,
{ 23: } 41,
{ 24: } 43,
{ 25: } 44,
{ 26: } 45,
{ 27: } 46,
{ 28: } 46,
{ 29: } 46,
{ 30: } 47,
{ 31: } 47,
{ 32: } 48,
{ 33: } 49,
{ 34: } 50,
{ 35: } 51,
{ 36: } 52,
{ 37: } 53,
{ 38: } 54,
{ 39: } 55
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 2,
{ 3: } 4,
{ 4: } 5,
{ 5: } 7,
{ 6: } 9,
{ 7: } 11,
{ 8: } 13,
{ 9: } 15,
{ 10: } 17,
{ 11: } 19,
{ 12: } 21,
{ 13: } 23,
{ 14: } 25,
{ 15: } 27,
{ 16: } 29,
{ 17: } 31,
{ 18: } 33,
{ 19: } 35,
{ 20: } 37,
{ 21: } 39,
{ 22: } 40,
{ 23: } 42,
{ 24: } 43,
{ 25: } 44,
{ 26: } 45,
{ 27: } 45,
{ 28: } 45,
{ 29: } 46,
{ 30: } 46,
{ 31: } 47,
{ 32: } 48,
{ 33: } 49,
{ 34: } 50,
{ 35: } 51,
{ 36: } 52,
{ 37: } 53,
{ 38: } 54,
{ 39: } 55
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 24,
{ 2: } 47,
{ 3: } 48,
{ 4: } 49,
{ 5: } 51,
{ 6: } 51,
{ 7: } 53,
{ 8: } 54,
{ 9: } 54,
{ 10: } 55,
{ 11: } 55,
{ 12: } 57,
{ 13: } 58,
{ 14: } 59,
{ 15: } 59,
{ 16: } 59,
{ 17: } 59,
{ 18: } 59,
{ 19: } 59,
{ 20: } 60,
{ 21: } 60,
{ 22: } 60,
{ 23: } 60,
{ 24: } 60,
{ 25: } 60,
{ 26: } 61,
{ 27: } 61,
{ 28: } 63,
{ 29: } 64,
{ 30: } 66,
{ 31: } 67,
{ 32: } 67,
{ 33: } 67,
{ 34: } 67,
{ 35: } 67,
{ 36: } 67,
{ 37: } 67,
{ 38: } 67,
{ 39: } 68
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 23,
{ 1: } 46,
{ 2: } 47,
{ 3: } 48,
{ 4: } 50,
{ 5: } 50,
{ 6: } 52,
{ 7: } 53,
{ 8: } 53,
{ 9: } 54,
{ 10: } 54,
{ 11: } 56,
{ 12: } 57,
{ 13: } 58,
{ 14: } 58,
{ 15: } 58,
{ 16: } 58,
{ 17: } 58,
{ 18: } 58,
{ 19: } 59,
{ 20: } 59,
{ 21: } 59,
{ 22: } 59,
{ 23: } 59,
{ 24: } 59,
{ 25: } 60,
{ 26: } 60,
{ 27: } 62,
{ 28: } 63,
{ 29: } 65,
{ 30: } 66,
{ 31: } 66,
{ 32: } 66,
{ 33: } 66,
{ 34: } 66,
{ 35: } 66,
{ 36: } 66,
{ 37: } 66,
{ 38: } 67,
{ 39: } 68
);


var yyn : Integer;

label start, scan, action;

begin

start:

  (* initialize: *)

  yynew;

scan:

  (* mark positions and matches: *)

  for yyn := yykl[yystate] to     yykh[yystate] do yymark(yyk[yyn]);
  for yyn := yymh[yystate] downto yyml[yystate] do yymatch(yym[yyn]);

  if yytl[yystate]>yyth[yystate] then goto action; (* dead state *)

  (* get next character: *)

  yyscan;

  (* determine action: *)

  yyn := yytl[yystate];
  while (yyn<=yyth[yystate]) and not (yyactchar in yyt[yyn].cc) do inc(yyn);
  if yyn>yyth[yystate] then goto action;
    (* no transition on yyactchar in this state *)

  (* switch to new state: *)

  yystate := yyt[yyn].s;

  goto scan;

action:

  (* execute action: *)

  if yyfind(yyrule) then
    begin
      yyaction(yyrule);
      if yyreject then goto action;
    end
  else if not yydefault and yywrap then
    begin
      yyclear;
      return(0);
    end;

  if not yydone then goto start;

  yylex := yyretval;

end(*yylex*);

