
/* Vector Pascal 4.0 grammar (prototype) 5-1-91 AG

   This is an "almost complete" TP Yacc grammar for Turbo Pascal Version
   4.0. Although the grammar is incomplete, untested and I do not have a
   lexical analyzer for it yet, I decided to include it in the distribution
   for those of you who are planning to write a Turbo Pascal parser.

   You will notice that this is not an adaption of the Standard Pascal
   grammar in PAS.Y. Because of the many additional features in the
   Turbo Pascal language I decided to write a new grammar from scratch.

   Writing a Yacc grammar for Turbo Pascal is not as easy as it first
   seems to be, because the special language features often defy easy
   specification as an LALR(1) grammar. Taking the naive approach, you
   are bound to get a lot of parsing conflicts in your grammar, since
   some of the constructs just cannot be parsed unambigiously without
   making use of semantic information.

   One construct that causes trouble is the qualified identifier which,
   in many contexts, can also be interpreted as a record component
   designator. To fix this, I simply decided to treat both "ordinary" and
   qualified identifiers as a single ID token. Of course this means that
   the lexical analyzer will have to distinguish between ordinary and
   qualified identifiers (this can be done with some semantic processing
   to determine which identifiers are unit names).

   There is still one ambiguity left in the grammar (causing one shift/
   reduce conflict) which comes from type casts in variable designators.
   The construct in question has the form:

      ID ( variable )

   In certain contexts, this can both be interpreted as a variable and
   as a function or procedure call. At present, the generated parser
   will parse such a construct as a variable. This will not be any
   problem (at least I hope so) unless you actually do semantic processing
   in your parser.

   If you have any questions/comments/critizism concerning this grammar,
   direct them to ag@muwiinfa.geschichte.uni-mainz.de. Perhaps someone
   even extends the grammar towards Turbo Pascal 5.x/6.x (if you do, it
   would be kind if you let me have a copy of this grammar such that I can
   include it in the next distribution). */


%start compilation_unit

/* Lexical stuff: */

%token

/* The multiple character symbols below are used in the grammar for better
   readability; identifier synonyms are given for use in the lexical analyzer.
   These definitions must come before any other token definitions (note that
   TP Yacc starts counting user-defined literals at 257). */

'..' 257
':=' 258
'<=' 259
'<>' 260
'>=' 261
'**' 262
'+:' 263
'-:' 264
'><' 265
%{

const

DOTDOT = 257;
DEFEQ  = 258;

LEQ    = 259;
NEQ    = 260;
GEQ    = 261;
STARSTAR=262;
SATPLUS= 263;
SATMINUS=264;
SETXOR = 265;
PLUS   = ord('+');
MINUS  = ord('-');
STAR   = ord('*');
SLASH  = ord('/');
var theNumber:extended; 
    sucCess:integer;
    progid,unitid:lextoken;
    currentuselist:cell;
%}

%token

/* Keywords are stropped with underscores to prevent conflicts with Turbo
   Pascal keywords. */
_ABS_           _ADDR_
_AND_    _ABSOLUTE_  _ARRAY_      _BEGIN_
_BYTE2PIXEL_
_CASE_    _CAST_           _CHR_
_CONST_    _COS_            _DIAG_                 _DIV_
_DOWNTO_
_DO_    _ELSE_    _END_      _EXIT_
_EXTERNAL_      _FALSE_
_FILE_    _FORWARD_  _FOR_      _FUNCTION_
_GOTO_    _IF_    _IMPLEMENTATION_   _INTERFACE_
_IN_    _IOTA_          _LABEL_            _LIBRARY_
_LN_            _MAX_           _MIN_                   _MOD_
_NAME_          _NEW_           _NIL_
_NOT_    _OF_    _OPERATOR_              _OR_
_OTHERWISE_     _ORD_
_PACKED_        _PERM_          _PIXEL2BYTE_            _POW_
_PRED_
_PROCEDURE_  _PROGRAM_  _PROTECTED_             _READ_
_READLN_        _ROUND_         _RECORD_    _REPEAT_
_SIN_           _SIZEOF_
_SET_    _SHL_    _SHR_            _SQRT_
_STRING_        _SUCC_          _TAN_                   _TRANS_
_TRUE_
_THEN_    _TO_    _TYPE_      _UNIT_
_UNTIL_    _USES_    _VAR_      _WHILE_
_WITH_    _XOR_
_WRITELN_       _WRITE_         ILLEGAL

%right _THEN_ _ELSE_            /* resolve dangling else */
%left '-' '+'


%token

ID
UNSIGNED_INTEGER
UNSIGNED_REAL
STRING_CONST
DYADIC
MONADIC
UMINUS
UPLUS
%right UMINUS UPLUS

%%

compilation_unit
  : program
        | unit
        ;

/* Programs: */

program  : program_heading uses_clause block '.'
  ;

program_heading
  : /* empty */
        | _PROGRAM_ idtoken  ';'                 {progid:=$2;}
        | _PROGRAM_ idtoken  '(' id_list ')' ';' {progid:=$2;}
  ;

uses_clause
  : /* empty */
        | _USES_ id_list ';'  {currentuselist:=$2;}
        ;

id_list  : idtoken
  | id_list ',' idtoken       {$$:=cons($1,$3);}
        ;

        /* invoke the code generator here */
block  :  decl_sect_list compound_stmt   {$$:=$2;}
  ;

/* Units: */

unit  : unit_heading interface_part implementation_part
    initialization_part '.'
  | unit_heading interface_part implementation_part
    _IN_ idtoken '(' id_list ')' ';'
  ;

unit_heading
  : _UNIT_ idtoken ';'			{unitid:=$2;}
  | _UNIT_ idtoken '(' id_list ')' ';'
  ;

interface_part
  : _INTERFACE_ uses_clause int_decl_sect_list
        ;

implementation_part
  : _IMPLEMENTATION_ decl_sect_list
        ;

initialization_part
  : compound_stmt		 {translate($1,asmfile);}
        | _END_
        ;

/* Declaration sections: */

decl_sect_list
  : /* empty */
        | decl_sect_list decl_sect
        ;

decl_sect
  : label_decl_sect
  | const_decl_sect
  | type_decl_sect
  | var_decl_sect
  | proc_decl
  | func_decl
  ;

label_decl_sect
  : _LABEL_ label_list ';'
  ;

label_list
  : label
        | label_list ',' label
        ;

label  : UNSIGNED_INTEGER
    /* must be decimal integer in the range 0..9999 */
  | idtoken
        ;

const_decl_sect
  : _CONST_ const_decl
  | const_decl_sect const_decl
  ;

type_decl_sect
  : _TYPE_ type_decl
  | type_decl_sect type_decl
  ;

var_decl_sect
  : _VAR_ var_decl
  | var_decl_sect var_decl
  ;

/* Interface declaration sections: */

/* These appear instead of normal declaration sections in the interface
   part of a unit. The difference is that there are no label declarations
   and for procedures and functions only the headings are given. */

int_decl_sect_list
  : /* empty */
  | int_decl_sect_list int_decl_sect
  ;

int_decl_sect
  : const_decl_sect
  | type_decl_sect
  | var_decl_sect
  | proc_heading
  | func_heading
  ;

/* Constant declarations: */

const_decl
  : idtoken '=' const ';'
        | idtoken ':' type '=' typed_const ';'
        ;

const  : unsigned_number
  	| sign unsigned_number   {$$:= dyad(intlit(0),$1,$2);}
        | idtoken	   
        | sign idtoken          {$$:= dyad(intlit(0),$1,$2);}
        | STRING_CONST
  ;
uint
	: UNSIGNED_INTEGER      {val(yytext,theNumber,success);
                                        $$:=intlit(round(theNumber));
                                       }
	;
unsigned_number
                : uint
		| UNSIGNED_REAL         {val(yytext,theNumber,success);
                                        $$:=reallit(theNumber);
                                       }
        ;

sign  : '+' | '-'
  ;

typed_const
  : const
  | array_const
  | record_const
        | set_const
  ;

array_const
  : '(' typed_const_list ')'
  ;

typed_const_list
  : typed_const
  | typed_const_list ',' typed_const {$$:=cons($1,$3);}
  ;

record_const
  : '(' const_field_list ')'
  ;

const_field_list
  : const_field
  | const_field_list ',' const_field
  ;

const_field
  : idtoken ':' typed_const
  ;

set_const
  : '[' const_elem_list ']'
        ;

const_elem_list
  : /* empty */
        | const_elem_list1
        ;

const_elem_list1
  : const_elem
  | const_elem_list1 ',' const_elem
  ;

const_elem
  : const
  | const '..' const
  ;

/* Type declarations: */

type_decl
  : idtoken '=' type ';'  {newname($1,gettypefromcell($3),typename);}
  | idtoken '(' fp_list ')' '=' array_type ';'
  ;

type  : simple_type
  | pointer_type
        | structured_type                 {$$:=$1;}
        | string_type
        ;

simple_type
  : idtoken                              {$$:=(gettypefromcell($1));}
  | const '..' const  /* subrange */    {$$:=(mkrangetyperef($1,$3));}
  | '(' id_list ')'  /* enumeration */
  ;

pointer_type
  : '^' idtoken
  ;

structured_type
  : unpacked_structured_type                       {$$:=$1;}
        | _PACKED_ unpacked_structured_type
        ;

unpacked_structured_type
  : array_type                                     {$$:=$1;}
  | record_type
  | set_type
  | file_type
  ;

array_type
  : _ARRAY_ '[' simple_type_list ']' _OF_ type     {$$:= (mkarraytype($3,$6));}
  ;

simple_type_list
  : simple_type
  | simple_type_list ',' simple_type
  ;

record_type
  : _RECORD_ field_list _END_
  ;

field_list
  : fixed_part
  | variant_part
  | fixed_part ';' variant_part
  ;

fixed_part
  : record_section
  | fixed_part ';' record_section
  ;

record_section
  : /* empty */
  | id_list ':' type
  ;

variant_part
  : _CASE_ tag_field _OF_ variant_list
  ;

tag_field
  : idtoken
  | idtoken ':' idtoken
  ;
 
variant_list
  : variant
  | variant_list ';' variant
  ;

variant  : /* empty */
  | case_tag_list ':' '(' field_list ')'
  ;

case_tag_list
  : const
        | case_tag_list ',' const
        ;

set_type
  : _SET_ _OF_ simple_type
  ;

file_type
  : _FILE_ _OF_ type
  | _FILE_
  ;

string_type
  : _STRING_
  | _STRING_ '[' const ']'
  | _STRING_ '(' const ')'
  ;

/* Variable declarations: */

var_decl 
  : id_list ':' type absolute_clause ';'{declarevars($1,gettypefromcell($3));}
  ;

absolute_clause
  : /* empty */
        | _ABSOLUTE_ uint
        | _ABSOLUTE_ idtoken
        ;

/* Procedure and function declarations: */

proc_decl
  : proc_heading {enterlexlevel; } block ';' {exitlexlevel;exit_scope;}
  |  proc_heading  proc_suffix ';'{ exit_scope;}
  ;

func_decl
  : func_heading  {enterlexlevel;}block ';' {exitlexlevel;exit_scope;}
  | func_heading proc_suffix ';'{ exit_scope;}
  ;

proc_heading
  : _PROCEDURE_ idtoken {enter_scope;} fp_list ';' {$$:=mkfnhdr($2,$3,0);}
  ;

func_heading
  : _FUNCTION_ idtoken {enter_scope;} fp_list ':' fptype ';' {$$:=mkfnhdr($2,$3,$5);}
  ;

proc_suffix           /* omitted inline and interrupt */
  :  _EXTERNAL_
  | _EXTERNAL_ _NAME_ STRING_CONST
  | _FORWARD_
  ;

fp_list : /* empty */
  | '(' fp_sect_list ')'
  ;

fp_sect_list
  : fp_sect
  | fp_sect_list ';' fp_sect
  ;

fp_sect  : id_list ':' fptype
  | _VAR_ id_list ':' fptype
  | _VAR_ id_list
  | _PROTECTED_ fp_sect
  ;

fptype  : idtoken
  | _STRING_
  ;

/* Statements: */

stmt  : unlabelled_stmt
  | label ':' unlabelled_stmt	{$$:= cons($1,$3);}
        ;

unlabelled_stmt
  : /* empty */
  | assignment
  | proc_call
  | goto_stmt
  | compound_stmt
  | if_stmt
  | case_stmt
  | repeat_stmt
  | while_stmt
  | for_stmt
  | with_stmt
  ;

assignment
  : variable ':=' expr		{$$:= dyad($1,defeq,$3);}
  ;

proc_call
  : proc_id param_list		{$$:=monad($1,$2);}
  | built_in non_null_paramlist	{$$:=monad($1,$2);}
  | function_call  
  ;

built_in
  : _WRITE_		{$$:=_write_;}
  | _READ_		{$$:=_read_;}
  | _NEW_		{$$:=_new_;}
  ;

proc_id
  : _READLN_		{$$:=_readln_;}
  | _WRITELN_		{$$:=_writeln_;}
  | increment
  ;

param_list
  : /* empty */
  | non_null_paramlist
  ;

non_null_paramlist
  : '(' expr_list ')'		{$$:=$2;}
  ;

expr_list
  : expr
  | expr ',' expr_list		{$$:=cons($1,$3);}
  ;


goto_stmt
  : _GOTO_ label		{$$:=cons($1,$2);}
  ;

compound_stmt
  : _BEGIN_ stmt_list _END_	{$$:=$2;}
  ;

stmt_list
  : stmt
  | stmt_list ';' stmt		{$$:=cons($1,$3);}
  ;

if_stmt  : _IF_ expr _THEN_ stmt {$$:=mkifthenelse($2,$4,NULL);}
  | _IF_ expr _THEN_ stmt _ELSE_ stmt  {$$:=mkifthenelse($2,$4,$6); }
  ;

case_stmt
  : _CASE_ expr _OF_ case_list else_case _END_
                                 {$$:=mkcase($2,$4,$5);}
  ;

case_list
  : case
  | case_list ';' case				{$$:=CONS($1,$3);}
  ;

case  : /* empty */
  | case_label_list ':' stmt			{$$:=CONS($1,$3);}
  ;

case_label_list
  : case_label
        | case_label_list ',' case_label	{$$:=CONS($1,$3);}
        ;

case_label
  	: const
        | const '..' const			{$$:=dyad($1,$2,$3);}
        ;

else_case
  : /* empty */
  | else_sym stmt				{$$:=$2;}
  | else_sym stmt ';'				{$$:=$2;}
  ;
else_sym
  : _ELSE_
  | _OTHERWISE_
  ;

repeat_stmt
  : _REPEAT_ stmt_list _UNTIL_ expr		{$$:=mkrepeat($2,$4);}
  ;

while_stmt
  : _WHILE_ expr _DO_ stmt			{$$:=mkwhile($2,$4);}
  ;

for_stmt
  : _FOR_ idtoken ':=' expr _TO_ expr _DO_ stmt      {$$:=
                                                       mkfor($2,$4,$6,intlit(1),$8);
                                                     
						     }
  | _FOR_ idtoken ':=' expr _DOWNTO_ expr _DO_ stmt  {$$:=mkfor($2,$4,$6,intlit(-1),$8); 
						     }
  ;

with_stmt
  : _WITH_ variable_list _DO_ stmt		{$$:=cons(_with_,cons($2,$4));}
  ;

variable_list
  	: variable
        | variable_list ',' variable	{$$:=cons($1,$3);}
        ;

/* Variables: */

variable
  : idtoken
  | variable '[' elem_list ']'  {$$:=dyad($1,ord('['),$3);}/* array component */
  | term '.' factor     	{$$:=dyad($1,ord('.'),$3);}/* record field */
  | variable '^'         	{$$:=monad(ord('^'),$1);}  /* pointer value */
 /* | idtoken '(' variable ')'            /* type cast handle this in type checker */
  ;

/* Expressions: */

expr  : simple_expr
  | simple_expr relop simple_expr  { $$:=dyad($1,$2,$3);}
        ;

relop  : '=' 			{$$:=ord('=');}
	| '<>' 			{$$:=ord(NEq);}
	| '<' 			{$$:=ord('<');}
	| '>' 			{$$:=ord('>');}
	| '<=' 			{$$:=ord(leq);}
	| '>=' 			{$$:=ord(geq);}
	| _IN_			{$$:=ord(_in_);}
        ;

simple_expr
  	: term
        | sign term		  { $$:=dyad(intlit(0),$1,$2);}/* */
        | simple_expr addop term  { $$:=dyad($1,$2,$3);}
        ;

addop  : '+'			  {$$:=ord('+');} 
	| '-' 			  {$$:=ord('-');}
	| _OR_ 			  {$$:=ord(_OR_);}
	| _XOR_ 		  {$$:=ord(_XOR_);}
	| _MIN_ 		  {$$:=ord(_min_);}			
	| _MAX_ 		  {$$:=ord(_max_);}
	| SATPLUS 		  {$$:=ord(satplus);}
	| SATMINUS		  {$$:=ord(satminus);}
	| '><'		 	  {$$:=ord(setXOR);}
  ;

term  	: factor
  	| term mulop factor    { $$:=dyad($1,$2,$3);}
        ;

mulop  : '*'		{$$:=ord('*');} 
	| '/' 		{$$:=ord('/');}

	| _DIV_ 	{$$:=ord(_DIv_);}
	| _MOD_ 	{$$:=ord(_mod_);}
	| _SHL_ 	{$$:=ord(_shl_);}
	| _SHR_ 	{$$:=ord(_shr_);}
	| _AND_		{$$:=ord(_AND_);}
  ;

/* Parameterless function calls, and function calls looking like type
   casts are caught as variables. */

atom  	: unsigned_number
        | STRING_CONST
        | '[' elem_list ']'
        | _NIL_
        | '@' variable				{$$:=monad(ord('@'),$2);}
        | '(' expr_list ')'			{$$:=$2;}
   				
  	| _IF_ expr _THEN_ expr _ELSE_ expr	{$$:=mkifthenelse($2,$4,$6);}
  	| '\\' dyadicop term			{$$:=monad(cons(ord('\'),$2),$3);}
  	| _IOTA_ uint				{$$:=monad(_iota_,$2);}
	;
unary	: atom
  	| _PERM_ '[' int_list ']' unary 	{$$:=monad(cons(_PERM_,$3),$5);}
    	| '-' unary  %prec UMINUS       	{$$:= dyad(intlit(0),ord('-'),$2);}
	| '+' unary  %prec UPLUS		{$$:=$2;}	
  	| function_call
  	| monadicop unary			{$$:=monad($1,$2);}

  ;

function_call 
	: variable
	| variable '(' expr_list ')'		{$$:=monad($1,$3);}
	;

increment : _SUCC_ | _PRED_ ;

monadicop
  	: _ROUND_ 		{$$:=_round_;}
	| _TRANS_		{$$:=_TRANS_;}
	| _DIAG_		{$$:=_DIAG_;}
	| _SQRT_ 		{$$:=_sqrt_;}
	| _SIN_ 		{$$:=_sin_;}
	| _COS_ 		{$$:=_cos_;}
	| _TAN_ 		{$$:=_tan_;}
	| _NOT_			{$$:=_not_;}
  	| _ABS_ 		{$$:=_abs_;}
	| _LN_ 			{$$:=_ln_;}
	| _ORD_ 		{$$:=_ord_;}
	| _BYTE2PIXEL_		{$$:=_byte2pixel_;}
  	| _PIXEL2BYTE_ 		{$$:=_pixel2byte_;}
	| _CHR_ 		{$$:=_chr_;}
	| _SIZEOF_		{$$:=_sizeof_;}
 
  ;

int_list
  : uint
  | uint ',' int_list	{$$:=cons($1,$3);}
  ;

dyadicop
  : multop
  | addop
  | relop
  | _POW_		{$$:=ord(_pow_);}
  | STARSTAR		{$$:=ord(starstar);}
  ;

factor
  : unary
  | unary _POW_ factor     { $$:=dyad($1,$2,$3);}
  | unary STARSTAR factor   { $$:=dyad($1,$2,$3);}
        ;

elem_list
  : /* empty */
        | elem_list1
        ;

elem_list1
  : elem
  | elem_list1 ',' elem	{ $$:=cons($1,$3);}
  ;

idtoken
  : ID   { $$:=dlbtoken;}
  ;

elem  : expr
  | expr '..' expr      {$$:=dyad($1,$2,$3);}
  ;
