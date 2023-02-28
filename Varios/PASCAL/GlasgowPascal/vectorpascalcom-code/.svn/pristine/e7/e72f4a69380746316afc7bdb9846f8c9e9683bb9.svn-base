letter  [A-Za-z]
digit  [0-9]
alphanum  ({letter}|{digit})
cr  \r
lf  \n
tab  \t
digit_sequence  {digit}+
fractional_constant  {digit_sequence}?\.{digit_sequence}|{digit_sequence}\.
sign  (\+|\-)
exponent_part  (e|E){sign}?{digit_sequence}
floating_suffix  f|F|l|L
eol {cr}{lf}|{cr}|{lf}        /*This takes care of different platforms*/
not_cr_lf  [^\n\r]
exponent  (e|E)
quote  \'
schar [^\']
not_star [^\*]
not_star_slash [^\*\/]
%{

(* PASLEX.L: lexical analyzer for Pascal, adapted to TP Lex, 2-28-89 AG *)

%}

%{
(*
 * lex input file for pascal scanner
 *
 * extensions: to ways to spell "external" and "->" ok for "^".
 *
 *)
%}

%{

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

%}

NQUOTE    [^']

%%

%{

var c  : char;
    kw : integer;

%}

[a-zA-Z]([a-zA-Z0-9])*  if is_keyword(yytext, kw) then
                          return(kw)
                        else
      begin
        dlbtoken:=tokenof(UPPER(yytext));
                          return(ID);
      end;

":="      return(defeq);
'({NQUOTE}|'')+'  return(string_const);
":"      return(ORD(':'));
","      return(ORD(','));
[0-9]+      return(unsigned_integer);
"."      return(ord('.'));
".."      return(DOTDOT);
"="      return(ord('='));
">="      return(GEQ);
">"      return(ORD('>'));
"["      return(ORD('['));
"<="      return(LEQ);
"("      return(ORD('('));
"<"      return(ORD('<'));
"-"      return(ORD('-'));
"<>"      return(NEQ);
"+"      return(ORD('+'));
"]"      return(ORD(']'));
[0-9]+"."[0-9]+    return(UNSIGNED_REAL);
")"      return(ORD(')'));
";"      return(ORD(';'));
"/"      return(ORD('/'));
"\\"                     return(ord('\'));
"*"      return(ORD('*'));
"**"      return(STARSTAR);
"><"                    return(SETXOR);
"+:"                    return(SATPLUS);
"-:"                    return(SATMINUS);
"->"              |
"^"      return(ord('^'));

"(*"              |
"{"      begin
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
[ \n\t\f] begin
		
	  end   ;
(\ |{cr}|{lf}|\t)+ begin end;
.      return(ILLEGAL);
