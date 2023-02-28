
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG *)

(* global definitions: *)
 


 const
    id_len = 20;
  type
    Ident = string[id_len];
const
    (* table of Pascal keywords: *)
    no_of_keywords = 81;
    keyword : array [1..no_of_keywords] of Ident = (
'ABS',{return(ABS_);}
'address',{return(address_);}
'alias',{return(alias_);}
'AND',{return(AND_);}
'APPLY',{return(call_);}
'assembles',{return(assembles_);}
'begin',
'calleepopsargs',
'const',{return(const_);}
'COS',{return(COS_);}
'div',{return(divide_);}
'do',{return(do_);}
'doubleword',{return(doubleword_);}
'EMPTY',{return(EMPTY);}
'end',
'exported',
'EXTEND',{return(extend_);}
'fail',{return(interrupt);}
'flag',{return(flag);}
'FLOAT',{return(FLOAT_);}
'for',{return(for);}
'FULL',{return(FULL_);}
'function',{return(function_);}
'goto',{return(goto);}
'halfword',{return(halfword);}
'ieee32',{return(ieee32_);}
'ieee64',{return(ieee64_);}
'if',{return(if_);}
'imported',
'instruction',{return(instruction_);}
'instructionset',{return(instructionset_);}
'int16',{return(int16_);}
'int32',{return(int32_);}
'int64',{return(int64_);}
'int8',{return(int8_);}
'label',{return(label);}
'lefttoright',
'level',
'LN',{return(LN_);}
'location',{return(loc);}
'MAX',{return(MAX_);}
'means',{return(means_);}
'MIN',{return(MIN_);}
'MOD',{return(remainder_);}
'NOT',{return(NOT_);}
'null',
'octet',{return(octet_);}
'operation',{return(operation_);}
'OR',{return(OR_);}
'pattern',{return(pattern_);}
'pop',{return(POP_);}
'precondition',{return(precondition_);}
'procedure',{return(instruction);}
'program',
'PUSH',{return(PUSH_);}
'quadword',{return(quadword_);}
'ref',{return(ref_);}
'reg',{return(register_);}
'rep',{return(replicate_);}
'reserved',{return(reserved_);}
'returns',{return(returns);}
'ROUND',{return(ROUND_);}
'seq',
'sideeffect',{return(sideeffect_);}
'SIN',{return(SIN_);}
'SQRT',{return(SQRT_);}
'stack',{return(stack_);}
'step',{return(step_);}
'SUBSCRIPT',{return(SUBSCRIPT_);}
'tan',{return(TAN_);}
'to',{return(to_);}
'TRUNCATE',{return(TRUNC_);}
'uint16',{return(uint16_);}
'uint32',{return(uint32_);}
'uint64',{return(uint64_);}
'uint8',{return(uint8_);}
'var',
'vector',{return(vector_);}
'void',{return(void_);}
'word',{return(word_);}
'XOR'{return(XOR_);}
);
    keyword_token : array [1..no_of_keywords] of integer = (
      {ABS} ABS_,
{address} address_,
{alias} alias_,
{AND} AND_,
{APPLY} call_,
{assembles} assembles_,
begin_,
calleepopsargs_,
{const} const_,
{COS} COS_,
{div} divide_,
{do} do_,
{doubleword} doubleword_,
{EMPTY} EMPTY,
end_,
exported_,
{EXTEND} extend_,
{fail} interrupt_,
{flag} flag_,
{FLOAT} FLOAT_,
{for} for_,
{FULL} FULL_,
{function} function_,
{goto} goto_,
{halfword} halfword_,
{ieee32} ieee32_,
{ieee64} ieee64_,
{if} if_,
imported_,
{instruction} instruction_,
{instructionset} instructionset_,
{int16} int16_,
{int32} int32_,
{int64} int64_,
{int8} int8_,
{label} label_,
lefttoright_,
level_,
{LN} LN_,
{location} loc_,
{MAX} MAX_,
{means} means_,
{MIN} MIN_,
{MOD} remainder_,
{NOT} NOT_,
null_,
{octet} octet_,
{operation} operation_,
{OR} OR_,
{pattern} pattern_,
{pop} POP_,
{precondition} precondition_,
{procedure} instruction,
program_,
{PUSH} PUSH_,
{quadword} quadword_,
{ref} ref_,
{reg} register_,
{rep} replicate_,
{reserved} reserved_,
{returns} returns,
{ROUND} ROUND_,
seq_,
{sideeffect} sideeffect_,
{SIN} SIN_,
{SQRT} SQRT_,
{stack} stack_,
{step} step_,
{SUBSCRIPT} SUBSCRIPT_,
{tan} TAN_,
{to} to_,
{TRUNCATE} TRUNC_,
{uint16} uint16_,
{uint32} uint32_,
{uint64} uint64_,
{uint8} uint8_,
{vector} vector_,
var_,
{void} void_,
{word} word_,
{XOR} XOR_
);
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
  var m, n, k : integer;
  begin
   
    id := upper(id);
    (* binary search: *)
    m := 1; n := no_of_keywords;
    while m<=n do
      begin
        k := m+(n-m) div 2;
        if id=upper(keyword[k]) then
          begin
            is_keyword := true;
            token := keyword_token[k];
            exit
          end
        else if id>upper(keyword[k]) then
          m := k+1
        else
          n := k-1
      end;
    is_keyword := false
  end(*is_keyword*);
var c  : char;
    kw : integer;
    res:integer;


function yylex : Integer;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)

begin
  (* actions: *)
  case yyruleno of
  1:
                                                                                                          begin
						 val(yytext,thenum,res);return(floating_constant);
						end;

  2:
  return(colon_);
  3:
   return(semicolon_);
  4:
   return(comma_);
  5:
   return(dot_);
  6:
   return(bra_);
  7:
   return(ket_);
  8:
   return(plus_);
  9:
     return(satplus_);
  10:
     return(satminus_);
  11:
     return(satmult_);
  12:
     return(map_);
  13:
   return(equals_);
  14:
     return(le_);
  15:
     return(ge_);
  16:
     return(ne_);
  17:
     return(shl_);
  18:
     return(shr_);
  19:
   return(lt_);
  20:
   return(gt_);
  21:
   return(minus_);
  22:
   return(times_);
  23:
     return(exponentiate_);
  24:
     return(store_);
  25:
   return(deref_);
  26:
          begin val(yytext,thenum,res);  return(intlit_); end;
  27:
    return(vbar_);
  28:
    return(sket_);
  29:
   return(sbra_);
  30:
    return(end_);
  31:
     return(typetoken_);
  32:
    return(mem_);
  33:
                       return(string_);
 
  34:
                     begin 
			
    			theid:=yytext;
			
			if is_keyword(theid, kw) then
                          return(kw)
                        else begin
			  
                          return(identifier);
			end;
		     end;
      
  35:
                   begin end;
  36:
          begin end;
 
  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of Char;
                s  : Integer;
              end;

const

yynmarks   = 51;
yynmatches = 51;
yyntrans   = 104;
yynstates  = 59;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  1,
  { 1: }
  1,
  { 2: }
  26,
  { 3: }
  5,
  { 4: }
  1,
  34,
  { 5: }
  2,
  { 6: }
  3,
  { 7: }
  4,
  { 8: }
  6,
  { 9: }
  7,
  { 10: }
  8,
  { 11: }
  21,
  { 12: }
  22,
  { 13: }
  13,
  { 14: }
  19,
  { 15: }
  20,
  { 16: }
  25,
  { 17: }
  27,
  { 18: }
  28,
  { 19: }
  29,
  { 20: }
  34,
  { 21: }
  34,
  { 22: }
  34,
  { 23: }
  { 24: }
  34,
  { 25: }
  35,
  { 26: }
  { 27: }
  { 28: }
  { 29: }
  1,
  { 30: }
  24,
  { 31: }
  9,
  { 32: }
  10,
  { 33: }
  12,
  { 34: }
  11,
  { 35: }
  23,
  { 36: }
  14,
  { 37: }
  16,
  { 38: }
  17,
  { 39: }
  15,
  { 40: }
  18,
  { 41: }
  34,
  { 42: }
  34,
  { 43: }
  34,
  { 44: }
  { 45: }
  { 46: }
  { 47: }
  { 48: }
  { 49: }
  30,
  34,
  { 50: }
  34,
  { 51: }
  32,
  34,
  { 52: }
  33,
  { 53: }
  { 54: }
  { 55: }
  1,
  { 56: }
  31,
  34,
  { 57: }
  { 58: }
  36
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
  1,
{ 1: }
  1,
{ 2: }
  26,
{ 3: }
  5,
{ 4: }
  1,
  34,
{ 5: }
  2,
{ 6: }
  3,
{ 7: }
  4,
{ 8: }
  6,
{ 9: }
  7,
{ 10: }
  8,
{ 11: }
  21,
{ 12: }
  22,
{ 13: }
  13,
{ 14: }
  19,
{ 15: }
  20,
{ 16: }
  25,
{ 17: }
  27,
{ 18: }
  28,
{ 19: }
  29,
{ 20: }
  34,
{ 21: }
  34,
{ 22: }
  34,
{ 23: }
{ 24: }
  34,
{ 25: }
  35,
{ 26: }
{ 27: }
{ 28: }
{ 29: }
  1,
{ 30: }
  24,
{ 31: }
  9,
{ 32: }
  10,
{ 33: }
  12,
{ 34: }
  11,
{ 35: }
  23,
{ 36: }
  14,
{ 37: }
  16,
{ 38: }
  17,
{ 39: }
  15,
{ 40: }
  18,
{ 41: }
  34,
{ 42: }
  34,
{ 43: }
  34,
{ 44: }
{ 45: }
{ 46: }
{ 47: }
{ 48: }
{ 49: }
  30,
  34,
{ 50: }
  34,
{ 51: }
  32,
  34,
{ 52: }
  33,
{ 53: }
{ 54: }
{ 55: }
  1,
{ 56: }
  31,
  34,
{ 57: }
{ 58: }
  36
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #9,#10,#13,' ' ]; s: 25),
  ( cc: [ '''' ]; s: 23),
  ( cc: [ '(' ]; s: 8),
  ( cc: [ ')' ]; s: 9),
  ( cc: [ '*' ]; s: 12),
  ( cc: [ '+' ]; s: 10),
  ( cc: [ ',' ]; s: 7),
  ( cc: [ '-' ]; s: 11),
  ( cc: [ '.' ]; s: 3),
  ( cc: [ '/' ]; s: 26),
  ( cc: [ '0'..'9' ]; s: 2),
  ( cc: [ ':' ]; s: 5),
  ( cc: [ ';' ]; s: 6),
  ( cc: [ '<' ]; s: 14),
  ( cc: [ '=' ]; s: 13),
  ( cc: [ '>' ]; s: 15),
  ( cc: [ 'A'..'E','G'..'K','M'..'Z','a'..'d','f'..'k',
            'n'..'s','u'..'z' ]; s: 24),
  ( cc: [ 'F','L','l' ]; s: 4),
  ( cc: [ '[' ]; s: 19),
  ( cc: [ ']' ]; s: 18),
  ( cc: [ '^' ]; s: 16),
  ( cc: [ 'e' ]; s: 20),
  ( cc: [ 'm' ]; s: 22),
  ( cc: [ 't' ]; s: 21),
  ( cc: [ '|' ]; s: 17),
{ 1: }
  ( cc: [ #9,#10,#13,' ' ]; s: 25),
  ( cc: [ '''' ]; s: 23),
  ( cc: [ '(' ]; s: 8),
  ( cc: [ ')' ]; s: 9),
  ( cc: [ '*' ]; s: 12),
  ( cc: [ '+' ]; s: 10),
  ( cc: [ ',' ]; s: 7),
  ( cc: [ '-' ]; s: 11),
  ( cc: [ '.' ]; s: 3),
  ( cc: [ '/' ]; s: 26),
  ( cc: [ '0'..'9' ]; s: 2),
  ( cc: [ ':' ]; s: 5),
  ( cc: [ ';' ]; s: 6),
  ( cc: [ '<' ]; s: 14),
  ( cc: [ '=' ]; s: 13),
  ( cc: [ '>' ]; s: 15),
  ( cc: [ 'A'..'E','G'..'K','M'..'Z','a'..'d','f'..'k',
            'n'..'s','u'..'z' ]; s: 24),
  ( cc: [ 'F','L','l' ]; s: 4),
  ( cc: [ '[' ]; s: 19),
  ( cc: [ ']' ]; s: 18),
  ( cc: [ '^' ]; s: 16),
  ( cc: [ 'e' ]; s: 20),
  ( cc: [ 'm' ]; s: 22),
  ( cc: [ 't' ]; s: 21),
  ( cc: [ '|' ]; s: 17),
{ 2: }
  ( cc: [ '.' ]; s: 27),
  ( cc: [ '0'..'9' ]; s: 2),
  ( cc: [ 'E','e' ]; s: 28),
{ 3: }
  ( cc: [ '0'..'9' ]; s: 29),
{ 4: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 24),
{ 5: }
  ( cc: [ '=' ]; s: 30),
{ 6: }
{ 7: }
{ 8: }
{ 9: }
{ 10: }
  ( cc: [ ':' ]; s: 31),
{ 11: }
  ( cc: [ ':' ]; s: 32),
  ( cc: [ '>' ]; s: 33),
{ 12: }
  ( cc: [ '*' ]; s: 35),
  ( cc: [ ':' ]; s: 34),
{ 13: }
{ 14: }
  ( cc: [ '<' ]; s: 38),
  ( cc: [ '=' ]; s: 36),
  ( cc: [ '>' ]; s: 37),
{ 15: }
  ( cc: [ '=' ]; s: 39),
  ( cc: [ '>' ]; s: 40),
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
  ( cc: [ '0'..'9','A'..'Z','a'..'m','o'..'z' ]; s: 24),
  ( cc: [ 'n' ]; s: 41),
{ 21: }
  ( cc: [ '0'..'9','A'..'Z','a'..'x','z' ]; s: 24),
  ( cc: [ 'y' ]; s: 42),
{ 22: }
  ( cc: [ '0'..'9','A'..'Z','a'..'d','f'..'z' ]; s: 24),
  ( cc: [ 'e' ]; s: 43),
{ 23: }
  ( cc: [ #1..'&','('..#255 ]; s: 44),
{ 24: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 24),
{ 25: }
  ( cc: [ #9,#10,#13,' ' ]; s: 25),
{ 26: }
  ( cc: [ '*' ]; s: 45),
{ 27: }
  ( cc: [ '0'..'9' ]; s: 29),
  ( cc: [ 'E','e' ]; s: 46),
{ 28: }
  ( cc: [ '+','-' ]; s: 47),
  ( cc: [ '0'..'9' ]; s: 48),
{ 29: }
  ( cc: [ '0'..'9' ]; s: 29),
{ 30: }
{ 31: }
{ 32: }
{ 33: }
{ 34: }
{ 35: }
{ 36: }
{ 37: }
{ 38: }
{ 39: }
{ 40: }
{ 41: }
  ( cc: [ '0'..'9','A'..'Z','a'..'c','e'..'z' ]; s: 24),
  ( cc: [ 'd' ]; s: 49),
{ 42: }
  ( cc: [ '0'..'9','A'..'Z','a'..'o','q'..'z' ]; s: 24),
  ( cc: [ 'p' ]; s: 50),
{ 43: }
  ( cc: [ '0'..'9','A'..'Z','a'..'l','n'..'z' ]; s: 24),
  ( cc: [ 'm' ]; s: 51),
{ 44: }
  ( cc: [ #1..'&','('..#255 ]; s: 44),
  ( cc: [ '''' ]; s: 52),
{ 45: }
  ( cc: [ #1..#9,#11..#255 ]; s: 53),
{ 46: }
  ( cc: [ '+','-','0'..'9' ]; s: 54),
  ( cc: [ 'f' ]; s: 55),
{ 47: }
  ( cc: [ '0'..'9' ]; s: 48),
{ 48: }
  ( cc: [ '0'..'9' ]; s: 48),
  ( cc: [ 'f' ]; s: 55),
{ 49: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 24),
{ 50: }
  ( cc: [ '0'..'9','A'..'Z','a'..'d','f'..'z' ]; s: 24),
  ( cc: [ 'e' ]; s: 56),
{ 51: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 24),
{ 52: }
{ 53: }
  ( cc: [ '*' ]; s: 57),
{ 54: }
  ( cc: [ '0'..'9' ]; s: 54),
  ( cc: [ 'f' ]; s: 55),
{ 55: }
{ 56: }
  ( cc: [ '0'..'9','A'..'Z','a'..'z' ]; s: 24),
{ 57: }
  ( cc: [ '/' ]; s: 58)
{ 58: }
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 4,
{ 4: } 5,
{ 5: } 7,
{ 6: } 8,
{ 7: } 9,
{ 8: } 10,
{ 9: } 11,
{ 10: } 12,
{ 11: } 13,
{ 12: } 14,
{ 13: } 15,
{ 14: } 16,
{ 15: } 17,
{ 16: } 18,
{ 17: } 19,
{ 18: } 20,
{ 19: } 21,
{ 20: } 22,
{ 21: } 23,
{ 22: } 24,
{ 23: } 25,
{ 24: } 25,
{ 25: } 26,
{ 26: } 27,
{ 27: } 27,
{ 28: } 27,
{ 29: } 27,
{ 30: } 28,
{ 31: } 29,
{ 32: } 30,
{ 33: } 31,
{ 34: } 32,
{ 35: } 33,
{ 36: } 34,
{ 37: } 35,
{ 38: } 36,
{ 39: } 37,
{ 40: } 38,
{ 41: } 39,
{ 42: } 40,
{ 43: } 41,
{ 44: } 42,
{ 45: } 42,
{ 46: } 42,
{ 47: } 42,
{ 48: } 42,
{ 49: } 42,
{ 50: } 44,
{ 51: } 45,
{ 52: } 47,
{ 53: } 48,
{ 54: } 48,
{ 55: } 48,
{ 56: } 49,
{ 57: } 51,
{ 58: } 51
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 4,
{ 4: } 6,
{ 5: } 7,
{ 6: } 8,
{ 7: } 9,
{ 8: } 10,
{ 9: } 11,
{ 10: } 12,
{ 11: } 13,
{ 12: } 14,
{ 13: } 15,
{ 14: } 16,
{ 15: } 17,
{ 16: } 18,
{ 17: } 19,
{ 18: } 20,
{ 19: } 21,
{ 20: } 22,
{ 21: } 23,
{ 22: } 24,
{ 23: } 24,
{ 24: } 25,
{ 25: } 26,
{ 26: } 26,
{ 27: } 26,
{ 28: } 26,
{ 29: } 27,
{ 30: } 28,
{ 31: } 29,
{ 32: } 30,
{ 33: } 31,
{ 34: } 32,
{ 35: } 33,
{ 36: } 34,
{ 37: } 35,
{ 38: } 36,
{ 39: } 37,
{ 40: } 38,
{ 41: } 39,
{ 42: } 40,
{ 43: } 41,
{ 44: } 41,
{ 45: } 41,
{ 46: } 41,
{ 47: } 41,
{ 48: } 41,
{ 49: } 43,
{ 50: } 44,
{ 51: } 46,
{ 52: } 47,
{ 53: } 47,
{ 54: } 47,
{ 55: } 48,
{ 56: } 50,
{ 57: } 50,
{ 58: } 51
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 4,
{ 4: } 5,
{ 5: } 7,
{ 6: } 8,
{ 7: } 9,
{ 8: } 10,
{ 9: } 11,
{ 10: } 12,
{ 11: } 13,
{ 12: } 14,
{ 13: } 15,
{ 14: } 16,
{ 15: } 17,
{ 16: } 18,
{ 17: } 19,
{ 18: } 20,
{ 19: } 21,
{ 20: } 22,
{ 21: } 23,
{ 22: } 24,
{ 23: } 25,
{ 24: } 25,
{ 25: } 26,
{ 26: } 27,
{ 27: } 27,
{ 28: } 27,
{ 29: } 27,
{ 30: } 28,
{ 31: } 29,
{ 32: } 30,
{ 33: } 31,
{ 34: } 32,
{ 35: } 33,
{ 36: } 34,
{ 37: } 35,
{ 38: } 36,
{ 39: } 37,
{ 40: } 38,
{ 41: } 39,
{ 42: } 40,
{ 43: } 41,
{ 44: } 42,
{ 45: } 42,
{ 46: } 42,
{ 47: } 42,
{ 48: } 42,
{ 49: } 42,
{ 50: } 44,
{ 51: } 45,
{ 52: } 47,
{ 53: } 48,
{ 54: } 48,
{ 55: } 48,
{ 56: } 49,
{ 57: } 51,
{ 58: } 51
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 2,
{ 2: } 3,
{ 3: } 4,
{ 4: } 6,
{ 5: } 7,
{ 6: } 8,
{ 7: } 9,
{ 8: } 10,
{ 9: } 11,
{ 10: } 12,
{ 11: } 13,
{ 12: } 14,
{ 13: } 15,
{ 14: } 16,
{ 15: } 17,
{ 16: } 18,
{ 17: } 19,
{ 18: } 20,
{ 19: } 21,
{ 20: } 22,
{ 21: } 23,
{ 22: } 24,
{ 23: } 24,
{ 24: } 25,
{ 25: } 26,
{ 26: } 26,
{ 27: } 26,
{ 28: } 26,
{ 29: } 27,
{ 30: } 28,
{ 31: } 29,
{ 32: } 30,
{ 33: } 31,
{ 34: } 32,
{ 35: } 33,
{ 36: } 34,
{ 37: } 35,
{ 38: } 36,
{ 39: } 37,
{ 40: } 38,
{ 41: } 39,
{ 42: } 40,
{ 43: } 41,
{ 44: } 41,
{ 45: } 41,
{ 46: } 41,
{ 47: } 41,
{ 48: } 41,
{ 49: } 43,
{ 50: } 44,
{ 51: } 46,
{ 52: } 47,
{ 53: } 47,
{ 54: } 47,
{ 55: } 48,
{ 56: } 50,
{ 57: } 50,
{ 58: } 51
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 26,
{ 2: } 51,
{ 3: } 54,
{ 4: } 55,
{ 5: } 56,
{ 6: } 57,
{ 7: } 57,
{ 8: } 57,
{ 9: } 57,
{ 10: } 57,
{ 11: } 58,
{ 12: } 60,
{ 13: } 62,
{ 14: } 62,
{ 15: } 65,
{ 16: } 67,
{ 17: } 67,
{ 18: } 67,
{ 19: } 67,
{ 20: } 67,
{ 21: } 69,
{ 22: } 71,
{ 23: } 73,
{ 24: } 74,
{ 25: } 75,
{ 26: } 76,
{ 27: } 77,
{ 28: } 79,
{ 29: } 81,
{ 30: } 82,
{ 31: } 82,
{ 32: } 82,
{ 33: } 82,
{ 34: } 82,
{ 35: } 82,
{ 36: } 82,
{ 37: } 82,
{ 38: } 82,
{ 39: } 82,
{ 40: } 82,
{ 41: } 82,
{ 42: } 84,
{ 43: } 86,
{ 44: } 88,
{ 45: } 90,
{ 46: } 91,
{ 47: } 93,
{ 48: } 94,
{ 49: } 96,
{ 50: } 97,
{ 51: } 99,
{ 52: } 100,
{ 53: } 100,
{ 54: } 101,
{ 55: } 103,
{ 56: } 103,
{ 57: } 104,
{ 58: } 105
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 25,
{ 1: } 50,
{ 2: } 53,
{ 3: } 54,
{ 4: } 55,
{ 5: } 56,
{ 6: } 56,
{ 7: } 56,
{ 8: } 56,
{ 9: } 56,
{ 10: } 57,
{ 11: } 59,
{ 12: } 61,
{ 13: } 61,
{ 14: } 64,
{ 15: } 66,
{ 16: } 66,
{ 17: } 66,
{ 18: } 66,
{ 19: } 66,
{ 20: } 68,
{ 21: } 70,
{ 22: } 72,
{ 23: } 73,
{ 24: } 74,
{ 25: } 75,
{ 26: } 76,
{ 27: } 78,
{ 28: } 80,
{ 29: } 81,
{ 30: } 81,
{ 31: } 81,
{ 32: } 81,
{ 33: } 81,
{ 34: } 81,
{ 35: } 81,
{ 36: } 81,
{ 37: } 81,
{ 38: } 81,
{ 39: } 81,
{ 40: } 81,
{ 41: } 83,
{ 42: } 85,
{ 43: } 87,
{ 44: } 89,
{ 45: } 90,
{ 46: } 92,
{ 47: } 93,
{ 48: } 95,
{ 49: } 96,
{ 50: } 98,
{ 51: } 99,
{ 52: } 99,
{ 53: } 100,
{ 54: } 102,
{ 55: } 102,
{ 56: } 103,
{ 57: } 104,
{ 58: } 104
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


