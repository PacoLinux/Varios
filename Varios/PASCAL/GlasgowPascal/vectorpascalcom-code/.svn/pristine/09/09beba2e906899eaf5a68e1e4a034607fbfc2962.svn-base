 

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

%}
%%

{fractional_constant}{exponent_part}?{floating_suffix}?|{digit_sequence}{exponent_part}{floating_suffix}? begin
						 val(yytext,thenum,res);return(floating_constant);
						end;

: return(colon_);
\; return(semicolon_);
\, return(comma_);
\. return(dot_);
\( return(bra_);
\) return(ket_);
\+ return(plus_);
\+\: return(satplus_);
\-\: return(satminus_);
\*\: return(satmult_);
\-\> return(map_);
\= return(equals_);
\<\= return(le_);
\>\= return(ge_);
\<\> return(ne_);
\<\< return(shl_);
\>\> return(shr_);
\< return(lt_);
\> return(gt_);
\- return(minus_);
\* return(times_);
\*\* return(exponentiate_);
\:\= return(store_);
\^ return(deref_);
{digit}+  begin val(yytext,thenum,res);  return(intlit_); end;
\|  return(vbar_);
\]  return(sket_);
\[ return(sbra_);
end return(end_);
type return(typetoken_);
mem return(mem_);
{quote}{schar}+{quote} return(string_);
 
{letter}{alphanum}*  begin 
			
    			theid:=yytext;
			
			if is_keyword(theid, kw) then
                          return(kw)
                        else begin
			  
                          return(identifier);
			end;
		     end;
      
(\ |{cr}|{lf}|\t)+ begin end;
\/\*.\*\/ begin end;
 
%%
