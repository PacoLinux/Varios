
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
  const
    id_len = 20;
  type
    Ident = string[id_len];

  const
    (* table of Pascal keywords: *)
    no_of_keywords = 82;
    keyword : array [1..no_of_keywords] of Ident = (
      'ABS',
      'ADDR',
      'AND',
      'ARRAY',
      'BEGIN',
      'BYTE2PIXEL',
      'CASE',
      'CAST',
      'CHR',
      'CONST',
      'COS',
      'DIAG',
      'DIV',
      'DO',
      'DOWNTO',
      'ELSE',
      'END',
      'EXIT',
      'EXTERN',
      'EXTERNAL',
      'FALSE',
      'FILE',
      'FOR',
      'FORWARD',
      'FUNCTION',
      'GOTO',
      'IF',
      'IMPLEMENTATION',
      'IN',
      'INTERFACE',
      'IOTA',
      'LIBRARY',
      'LABEL',
      'LN',
      'MAX',
      'MIN',
      'MOD',
      'NAME',
      'NEW',
      'NIL',
      'NOT',
      'OF',
      'OPERATOR',
      'OR',
      'ORD',
      'OTHERWISE',
      'PACKED',
      'PERM',
      'PIXEL2BYTE',
      'POW',
      'PRED',
      'PROCEDURE',
      'PROGRAM',
      'PROTECTED',
      'READ',
      'READLN',
      'RECORD',
      'REPEAT',
      'ROUND',
      'SET',
      'SHL',
      'SHR',
      'SIN',
      'SIZEOF',
      'STRING',
      'SQRT',
      'SUCC',
      'TAN',
      'THEN',
      'TO',
      'TRANS',
      'TRUE',
      'TYPE',
      'UNIT',
      'UNTIL',
      'USES',
      'VAR',
      'WHILE',
      'WITH',
      'WRITE',
      'WRITELN',
      'XOR');
    keyword_token : array [1..no_of_keywords] of integer = (
      _ABS_,
      _ADDR_,
      _AND_,
      _ARRAY_,
      _BEGIN_,
      _BYTE2PIXEL_,
      _CASE_,
      _CAST_,
      _CHR_,
      _CONST_,
      _COS_,
      _DIAG_,
      _DIV_,
      _DO_,
      _DOWNTO_,
      _ELSE_,
      _END_,
      _EXIT_,
      _EXTERNAL_,
      _EXTERNAL_,
       _FALSE_,
      (* EXTERNAL: 2 spellings (see above)! *)
      _FILE_,
      _FOR_,        _FORWARD_,   _FUNCTION_,
      _GOTO_,       _IF_,         _IMPLEMENTATION_,
      _IN_,         _INTERFACE_,  _IOTA_,
      _LIBRARY_,
      _LABEL_,
      _LN_,
      _MAX_,
      _MIN_,
      _MOD_,
      _NAME_,
      _NEW_,
      _NIL_,
      _NOT_,
      _OF_,
      _OPERATOR_,
      _OR_,
      _ORD_,
      _OTHERWISE_,
      _PACKED_,
      _PERM_,
      _PIXEL2BYTE_,
      _POW_,      _PRED_,
      _PROCEDURE_,  _PROGRAM_,    _PROTECTED_,_READ_,
      _READLN_,     _RECORD_,     _REPEAT_,   _ROUND_,
      _SET_,        _SHL_,        _SHR_,      _SIN_,
      _SIZEOF_,     _STRING_,     _SQRT_,     _SUCC_,
      _TAN_,        _THEN_,       _TO_,       _TRANS_,
      _TRUE_,       _TYPE_,      _UNIT_ ,
      _UNTIL_,
      _USES_,
      _VAR_,        _WHILE_,      _WITH_,     _WRITE_,
      _WRITELN_,
      _XOR_);
function token2keyword(token:integer):string;
var i:integer;
begin
	token2keyword:=' undefined word ';
	for i:=1 to no_of_keywords do
	if keyword_token[i]=token then token2keyword:=keyword[i];
end;
function is_keyword(id : string; var token : integer) : boolean;
  (* checks whether id is Pascal keyword; if so, returns corresponding
     token number in token *)
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
      begin
        dlbtoken:=tokenof(UPPER(yytext));
                          return(ID);
      end;

  2:
          return(defeq);
  3:
                  return(string_const);
  4:
         return(ORD(':'));
  5:
         return(ORD(','));
  6:
            return(unsigned_integer);
  7:
         return(ord('.'));
  8:
          return(DOTDOT);
  9:
         return(ord('='));
  10:
          return(GEQ);
  11:
         return(ORD('>'));
  12:
         return(ORD('['));
  13:
          return(LEQ);
  14:
         return(ORD('('));
  15:
         return(ORD('<'));
  16:
         return(ORD('-'));
  17:
          return(NEQ);
  18:
         return(ORD('+'));
  19:
         return(ORD(']'));
  20:
                   return(UNSIGNED_REAL);
  21:
         return(ORD(')'));
  22:
         return(ORD(';'));
  23:
         return(ORD('/'));
  24:
                         return(ord('\'));
  25:
         return(ORD('*'));
  26:
          return(STARSTAR);
  27:
                        return(SETXOR);
  28:
                        return(SATPLUS);
  29:
                        return(SATMINUS);
  30,
  31:
         return(ord('^'));

  32,
  33:
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
  34:
          begin
		
	  end   ;
  35:
                   begin end;
  36:
       return(ILLEGAL);
  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 67;
yynmatches = 67;
yyntrans   = 81;
yynstates  = 47;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  1,
  36,
  { 3: }
  4,
  36,
  { 4: }
  36,
  { 5: }
  5,
  36,
  { 6: }
  6,
  36,
  { 7: }
  7,
  36,
  { 8: }
  9,
  36,
  { 9: }
  11,
  36,
  { 10: }
  12,
  36,
  { 11: }
  15,
  36,
  { 12: }
  14,
  36,
  { 13: }
  16,
  36,
  { 14: }
  18,
  36,
  { 15: }
  19,
  36,
  { 16: }
  21,
  36,
  { 17: }
  22,
  36,
  { 18: }
  23,
  36,
  { 19: }
  24,
  36,
  { 20: }
  25,
  36,
  { 21: }
  31,
  36,
  { 22: }
  33,
  36,
  { 23: }
  34,
  36,
  { 24: }
  34,
  35,
  36,
  { 25: }
  35,
  36,
  { 26: }
  34,
  35,
  { 27: }
  36,
  { 28: }
  1,
  { 29: }
  2,
  { 30: }
  { 31: }
  { 32: }
  6,
  { 33: }
  { 34: }
  8,
  { 35: }
  10,
  { 36: }
  27,
  { 37: }
  13,
  { 38: }
  17,
  { 39: }
  32,
  { 40: }
  29,
  { 41: }
  30,
  { 42: }
  28,
  { 43: }
  26,
  { 44: }
  35,
  { 45: }
  3,
  { 46: }
  20
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
  1,
  36,
{ 3: }
  4,
  36,
{ 4: }
  36,
{ 5: }
  5,
  36,
{ 6: }
  6,
  36,
{ 7: }
  7,
  36,
{ 8: }
  9,
  36,
{ 9: }
  11,
  36,
{ 10: }
  12,
  36,
{ 11: }
  15,
  36,
{ 12: }
  14,
  36,
{ 13: }
  16,
  36,
{ 14: }
  18,
  36,
{ 15: }
  19,
  36,
{ 16: }
  21,
  36,
{ 17: }
  22,
  36,
{ 18: }
  23,
  36,
{ 19: }
  24,
  36,
{ 20: }
  25,
  36,
{ 21: }
  31,
  36,
{ 22: }
  33,
  36,
{ 23: }
  34,
  36,
{ 24: }
  34,
  35,
  36,
{ 25: }
  35,
  36,
{ 26: }
  34,
  35,
{ 27: }
  36,
{ 28: }
  1,
{ 29: }
  2,
{ 30: }
{ 31: }
{ 32: }
  6,
{ 33: }
{ 34: }
  8,
{ 35: }
  10,
{ 36: }
  27,
{ 37: }
  13,
{ 38: }
  17,
{ 39: }
  32,
{ 40: }
  29,
{ 41: }
  30,
{ 42: }
  28,
{ 43: }
  26,
{ 44: }
  35,
{ 45: }
  3,
{ 46: }
  20
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #1..#8,#11,#14..#31,'!'..'&','?','@','_','`',
            '|'..#255 ]; s: 27),
  ( cc: [ #9,' ' ]; s: 24),
  ( cc: [ #10 ]; s: 26),
  ( cc: [ #12 ]; s: 23),
  ( cc: [ #13 ]; s: 25),
  ( cc: [ '''' ]; s: 4),
  ( cc: [ '(' ]; s: 12),
  ( cc: [ ')' ]; s: 16),
  ( cc: [ '*' ]; s: 20),
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
  ( cc: [ '\' ]; s: 19),
  ( cc: [ ']' ]; s: 15),
  ( cc: [ '^' ]; s: 21),
  ( cc: [ '{' ]; s: 22),
{ 1: }
  ( cc: [ #1..#8,#11,#14..#31,'!'..'&','?','@','_','`',
            '|'..#255 ]; s: 27),
  ( cc: [ #9,' ' ]; s: 24),
  ( cc: [ #10 ]; s: 26),
  ( cc: [ #12 ]; s: 23),
  ( cc: [ #13 ]; s: 25),
  ( cc: [ '''' ]; s: 4),
  ( cc: [ '(' ]; s: 12),
  ( cc: [ ')' ]; s: 16),
  ( cc: [ '*' ]; s: 20),
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
  ( cc: [ '\' ]; s: 19),
  ( cc: [ ']' ]; s: 15),
  ( cc: [ '^' ]; s: 21),
  ( cc: [ '{' ]; s: 22),
{ 2: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 28),
{ 3: }
  ( cc: [ '=' ]; s: 29),
{ 4: }
  ( cc: [ #1..'&','('..#255 ]; s: 30),
  ( cc: [ '''' ]; s: 31),
{ 5: }
{ 6: }
  ( cc: [ '.' ]; s: 33),
  ( cc: [ '0'..'9' ]; s: 32),
{ 7: }
  ( cc: [ '.' ]; s: 34),
{ 8: }
{ 9: }
  ( cc: [ '<' ]; s: 36),
  ( cc: [ '=' ]; s: 35),
{ 10: }
{ 11: }
  ( cc: [ '=' ]; s: 37),
  ( cc: [ '>' ]; s: 38),
{ 12: }
  ( cc: [ '*' ]; s: 39),
{ 13: }
  ( cc: [ ':' ]; s: 40),
  ( cc: [ '>' ]; s: 41),
{ 14: }
  ( cc: [ ':' ]; s: 42),
{ 15: }
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
  ( cc: [ '*' ]; s: 43),
{ 21: }
{ 22: }
{ 23: }
{ 24: }
  ( cc: [ #9,#10,#13,' ' ]; s: 44),
{ 25: }
  ( cc: [ #9,#10,#13,' ' ]; s: 44),
{ 26: }
  ( cc: [ #9,#10,#13,' ' ]; s: 44),
{ 27: }
{ 28: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 28),
{ 29: }
{ 30: }
  ( cc: [ #1..'&','('..#255 ]; s: 30),
  ( cc: [ '''' ]; s: 45),
{ 31: }
  ( cc: [ '''' ]; s: 30),
{ 32: }
  ( cc: [ '.' ]; s: 33),
  ( cc: [ '0'..'9' ]; s: 32),
{ 33: }
  ( cc: [ '0'..'9' ]; s: 46),
{ 34: }
{ 35: }
{ 36: }
{ 37: }
{ 38: }
{ 39: }
{ 40: }
{ 41: }
{ 42: }
{ 43: }
{ 44: }
  ( cc: [ #9,#10,#13,' ' ]; s: 44),
{ 45: }
  ( cc: [ '''' ]; s: 30),
{ 46: }
  ( cc: [ '0'..'9' ]; s: 46)
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
{ 23: } 42,
{ 24: } 44,
{ 25: } 47,
{ 26: } 49,
{ 27: } 51,
{ 28: } 52,
{ 29: } 53,
{ 30: } 54,
{ 31: } 54,
{ 32: } 54,
{ 33: } 55,
{ 34: } 55,
{ 35: } 56,
{ 36: } 57,
{ 37: } 58,
{ 38: } 59,
{ 39: } 60,
{ 40: } 61,
{ 41: } 62,
{ 42: } 63,
{ 43: } 64,
{ 44: } 65,
{ 45: } 66,
{ 46: } 67
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
{ 22: } 41,
{ 23: } 43,
{ 24: } 46,
{ 25: } 48,
{ 26: } 50,
{ 27: } 51,
{ 28: } 52,
{ 29: } 53,
{ 30: } 53,
{ 31: } 53,
{ 32: } 54,
{ 33: } 54,
{ 34: } 55,
{ 35: } 56,
{ 36: } 57,
{ 37: } 58,
{ 38: } 59,
{ 39: } 60,
{ 40: } 61,
{ 41: } 62,
{ 42: } 63,
{ 43: } 64,
{ 44: } 65,
{ 45: } 66,
{ 46: } 67
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
{ 23: } 42,
{ 24: } 44,
{ 25: } 47,
{ 26: } 49,
{ 27: } 51,
{ 28: } 52,
{ 29: } 53,
{ 30: } 54,
{ 31: } 54,
{ 32: } 54,
{ 33: } 55,
{ 34: } 55,
{ 35: } 56,
{ 36: } 57,
{ 37: } 58,
{ 38: } 59,
{ 39: } 60,
{ 40: } 61,
{ 41: } 62,
{ 42: } 63,
{ 43: } 64,
{ 44: } 65,
{ 45: } 66,
{ 46: } 67
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
{ 22: } 41,
{ 23: } 43,
{ 24: } 46,
{ 25: } 48,
{ 26: } 50,
{ 27: } 51,
{ 28: } 52,
{ 29: } 53,
{ 30: } 53,
{ 31: } 53,
{ 32: } 54,
{ 33: } 54,
{ 34: } 55,
{ 35: } 56,
{ 36: } 57,
{ 37: } 58,
{ 38: } 59,
{ 39: } 60,
{ 40: } 61,
{ 41: } 62,
{ 42: } 63,
{ 43: } 64,
{ 44: } 65,
{ 45: } 66,
{ 46: } 67
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 27,
{ 2: } 53,
{ 3: } 54,
{ 4: } 55,
{ 5: } 57,
{ 6: } 57,
{ 7: } 59,
{ 8: } 60,
{ 9: } 60,
{ 10: } 62,
{ 11: } 62,
{ 12: } 64,
{ 13: } 65,
{ 14: } 67,
{ 15: } 68,
{ 16: } 68,
{ 17: } 68,
{ 18: } 68,
{ 19: } 68,
{ 20: } 68,
{ 21: } 69,
{ 22: } 69,
{ 23: } 69,
{ 24: } 69,
{ 25: } 70,
{ 26: } 71,
{ 27: } 72,
{ 28: } 72,
{ 29: } 73,
{ 30: } 73,
{ 31: } 75,
{ 32: } 76,
{ 33: } 78,
{ 34: } 79,
{ 35: } 79,
{ 36: } 79,
{ 37: } 79,
{ 38: } 79,
{ 39: } 79,
{ 40: } 79,
{ 41: } 79,
{ 42: } 79,
{ 43: } 79,
{ 44: } 79,
{ 45: } 80,
{ 46: } 81
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 26,
{ 1: } 52,
{ 2: } 53,
{ 3: } 54,
{ 4: } 56,
{ 5: } 56,
{ 6: } 58,
{ 7: } 59,
{ 8: } 59,
{ 9: } 61,
{ 10: } 61,
{ 11: } 63,
{ 12: } 64,
{ 13: } 66,
{ 14: } 67,
{ 15: } 67,
{ 16: } 67,
{ 17: } 67,
{ 18: } 67,
{ 19: } 67,
{ 20: } 68,
{ 21: } 68,
{ 22: } 68,
{ 23: } 68,
{ 24: } 69,
{ 25: } 70,
{ 26: } 71,
{ 27: } 71,
{ 28: } 72,
{ 29: } 72,
{ 30: } 74,
{ 31: } 75,
{ 32: } 77,
{ 33: } 78,
{ 34: } 78,
{ 35: } 78,
{ 36: } 78,
{ 37: } 78,
{ 38: } 78,
{ 39: } 78,
{ 40: } 78,
{ 41: } 78,
{ 42: } 78,
{ 43: } 78,
{ 44: } 79,
{ 45: } 80,
{ 46: } 81
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

