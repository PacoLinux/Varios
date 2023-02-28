/*
 [The "BSD licence"]
 Copyright (c) 2013 Sam Harwell
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/ 

/** C 2011 grammar built from the C11 Spec */
grammar C;
 
 
primaryExpression
    :   Identifier   #idexp
    |   constant     #constexp
    |   StringLiteral+   #stringexp
    |   '(' expression ')'  #bracketedexp
  /*  |   genericSelection   
    |   '__extension__'? '(' compoundStatement ')' // Blocks (GCC extension)
    |   '__builtin_va_arg' '(' unaryExpression ',' typeName ')' 
    |   '__builtin_offsetof' '(' typeName ',' unaryExpression ')' */
    ;


constant
locals[   String sort]
    :   IntegerConstant  {$sort="int";}
    |   FloatingConstant  {$sort="float";}
    |   enumerationConstant{$sort="endum";}
    |   CharacterConstant {$sort="char";}
    ;
genericSelection
    :   '_Generic' '(' assignmentExpression ',' genericAssocList ')'
    ;

genericAssocList
    :   genericAssociation
    |   genericAssocList ',' genericAssociation
    ;

genericAssociation
    :   typeName ':' assignmentExpression
    |   'default' ':' assignmentExpression 
    ;

 
    
postfixExpression
    :   primaryExpression#postprim
    |   postfixExpression '[' sectionOrElement ']'#postarraysubscript 
    |   postfixExpression '[' justone ']' #oldarraysyntax
    |   postfixExpression '(' argumentExpressionList ')'#postcall
    |   postfixExpression '(' ')'#nullparamcall
    |   postfixExpression '.' Identifier#postfieldsubscript
    |   postfixExpression '->' Identifier#postpointersubscript
    |   postfixExpression '++'#postinc
    |   postfixExpression '--' #postdec
    |   '(' typeName ')' '{' initializerList '}'#postinit
    |   '(' typeName ')' '{' initializerList ',' '}'#postinitindef
/*    |   '__extension__' '(' typeName ')' '{' initializerList '}'
    |   '__extension__' '(' typeName ')' '{' initializerList ',' '}'*/
    ;
 
justone
	:   expression								  	
	;
	
sectionOrElement
	:   expression ':' expression ':' expression  	#triple	  
	|   expression ':' expression 					#pair 
	|   ':' 									 	#thelot
    ; 
argumentExpressionList
    :   assignmentExpression#argexp1
    |   argumentExpressionList ',' assignmentExpression#argexp2
    ;

unaryExpression
    :   postfixExpression#postfix
    |   '++' unaryExpression#preinc
    |   '--' unaryExpression#predec
    |   '\\' reductionOperator unaryExpression#reduc
    |   unaryOperator castExpression#unaryop
    |   'sizeof' unaryExpression#sizeofval
    |   'sizeof' '(' typeName ')'#sizoftype
    |   '_Alignof' '(' typeName ')'#alignoftype
   // |   '&&' Identifier // GCC extension address of label
    ;

unaryOperator
    :   '&' | '*' | '+' | '-' | '~' | '!'
    ;
reductionOperator
    :   '%' | '*' | '+' | '-' | '/' | '&' |'^' | '|'
    ;

castExpression
    :   unaryExpression#unarycast
    |   '(' typeName ')' castExpression#typedcast
    |   '__extension__' '(' typeName ')' castExpression#extendedcast
    ;

multiplicativeExpression
    :   castExpression#mutcast
    |   multiplicativeExpression '*' castExpression#timesexp
    |   multiplicativeExpression '/' castExpression#divexp
    |   multiplicativeExpression '%' castExpression#modexp
    ; 

additiveExpression
    :   multiplicativeExpression #additivemult
    |   additiveExpression '+' multiplicativeExpression#additivesum
    |   additiveExpression '-:' multiplicativeExpression#satadditivesub
    |   additiveExpression '+:' multiplicativeExpression#satadditivesum
    |   additiveExpression '-' multiplicativeExpression#additivesub
    ;


shiftExpression
    :   additiveExpression #additiveshift
    |   shiftExpression '<<' additiveExpression#leftshift
    |   shiftExpression '>>' additiveExpression#rightshift
    ;

relationalExpression
    :   shiftExpression#relshift
    |   relationalExpression '<' shiftExpression#ltexp
    |   relationalExpression '>' shiftExpression#gtexp
    |   relationalExpression '<=' shiftExpression#leexp
    |   relationalExpression '>=' shiftExpression#geexp
    ;

equalityExpression
    :   relationalExpression#eqrelexp
    |   equalityExpression '==' relationalExpression#eqexp
    |   equalityExpression '!=' relationalExpression#neexp
    ;

andExpression
    :   equalityExpression
    |   andExpression '&' equalityExpression
    ;

exclusiveOrExpression
    :   andExpression
    |   exclusiveOrExpression '^' andExpression
    ;

inclusiveOrExpression
    :   exclusiveOrExpression
    |   inclusiveOrExpression '|' exclusiveOrExpression
    ;

logicalAndExpression
    :   inclusiveOrExpression
    |   logicalAndExpression '&&' inclusiveOrExpression
    ;

logicalOrExpression
    :   logicalAndExpression
    |   logicalOrExpression '||' logicalAndExpression
    ;

conditionalExpression
    :  logicalOrExpression #simcond
    | logicalOrExpression ('?' expression ':' conditionalExpression)#realcond
    ;

assignmentExpression
    :   conditionalExpression#condexp
    |   unaryExpression anassignment #fullassign
    ;
 
 anassignment
	:  assignmentOperator assignmentExpression
	;

assignmentOperator
    :   '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
    ;

expression
    :   assignmentExpression
    |   expression ',' assignmentExpression
    ;

constantExpression
    :   conditionalExpression
    ;

declaration
    :   declarationSpecifiers initDeclaratorList? ';'
    |   staticAssertDeclaration
    ;

declarationSpecifiers
    :   declarationSpecifier+
    ;

declarationSpecifiers2
    :   declarationSpecifier+
    ;

declarationSpecifier
    :   storageClassSpecifier
    |   typeSpecifier
    |   typeQualifier
//    |   functionSpecifier
    |   alignmentSpecifier
    ;

initDeclaratorList
    :   initDeclarator
    |   initDeclaratorList ',' initDeclarator
    ;

initDeclarator
    :   declarator #initd
    |   declarator '=' initializer#initializeddec
    ;

storageClassSpecifier
    :   'typedef'#typedefspec
    |   'extern'#externspec
    |   'static'#staticspec
 /*   |   '_Thread_local' */
    |   'auto'#autospec
    |   'register'#registerspec
    ;

typeSpecifier
    :   basetype #basetypespec
    |   issigned #signedspec
  //  |   '__extension__' '(' ('__m128' | '__m128d' | '__m128i') ')'#extension
    |   atomicTypeSpecifier#atomicspec
    |   structOrUnionSpecifier#structspec
    |   enumSpecifier#enumspec
    |   typedefName  #typename 
   // |   '__typeof__' '(' constantExpression ')'  // GCC extension
    ;
issigned 
    :   'signed'#signed
    |   'unsigned'#unsigned
    ;

basetype
	:   'void'
    |   'char'
    |   'short'
    |   'int'
    |   'long'
    |   'float'
    |   'double'
    |   '_Bool'
    |   '_Complex'
    |   '__m128'
    |   '__m128d'
    |   '__m128i'
    ;


structOrUnionSpecifier
    :   structOrUnion Identifier structBody #structtypedecl
    |   structOrUnion  structBody #anonymousstruct
    |   structOrUnion Identifier #structref
    ;
    
structBody
	:
	'{' structDeclarationList '}'
	;

structOrUnion
    :   'struct'
    |   'union'
    ;

structDeclarationList
    :   structDeclaration
    |   structDeclarationList structDeclaration
    ;

structDeclaration
    :   specifierQualifierList structDeclaratorList? ';'
    |   staticAssertDeclaration
    ;

specifierQualifierList
    :   typeSpecifier specifierQualifierList?
    |   typeQualifier specifierQualifierList?
    ;

structDeclaratorList
    :   structDeclarator
    |   structDeclaratorList ',' structDeclarator
    ;

structDeclarator
    :   declarator
    |   declarator? ':' constantExpression
    ;

enumSpecifier
    :   'enum' Identifier? '{' enumeratorList '}'
    |   'enum' Identifier? '{' enumeratorList ',' '}'
    |   'enum' Identifier
    ;

enumeratorList
    :   enumerator
    |   enumeratorList ',' enumerator
    ;

enumerator
    :   enumerationConstant#stdenum
    |   enumerationConstant '=' constantExpression#specenum
    ;

enumerationConstant
    :   Identifier
    ;

atomicTypeSpecifier
    :   '_Atomic' '(' typeName ')'
    ;

typeQualifier
    :   'const'
    |   '__restrict'
    |   'volatile'
    |   '_Atomic'
    ;

functionSpecifier
    :    '__declspec' '(' Identifier ')'
    |  ('inline'
        |   '_Noreturn'
        |   '__inline__' // GCC extension
            '__stdcall')
    |  gccAttributeSpecifier
    ;

alignmentSpecifier
    :   '_Alignas' '(' typeName ')'
    |   '_Alignas' '(' constantExpression ')'
    ;

declarator
    :  p= pointer? d=directDeclarator  gccDeclaratorExtension*
    ;

directDeclarator
    :   Identifier#IdDeclarator
    |   '(' declarator ')'#fnvarDeclarator
    |   directDeclarator '[' constantExpression   ']'#arrayDeclarator
      |   directDeclarator '['    ']'#unspecifiedarrayDeclarator
 //   |   directDeclarator '[' typeQualifierList? assignmentExpression? ']'
 //   |   directDeclarator '[' 'static' typeQualifierList? assignmentExpression ']'
 //   |   directDeclarator '[' typeQualifierList 'static' assignmentExpression ']'
 //   |   directDeclarator '[' typeQualifierList? '*' ']'
    |   directDeclarator bracketedansiparams#ansifnDeclarator
    |   directDeclarator '(' identifierList? ')' #krfnDeclarator
    ;
bracketedansiparams
    :'('ansiparams')'
    ;
ansiparams 
	:  parameterTypeList 
	;
gccDeclaratorExtension
    :   '__asm__' '(' StringLiteral+ ')'
    |   gccAttributeSpecifier
    ;

gccAttributeSpecifier
    :   '__attribute__' '(' '(' gccAttributeList ')' ')'
    ;

gccAttributeList
    :   gccAttribute (',' gccAttribute)*
    |   // empty
    ;

gccAttribute
    :   ~(',' | '(' | ')') // relaxed def for "identifier or reserved word"
        ('(' argumentExpressionList? ')')?
    |   // empty 
    ;

nestedParenthesesBlock
    :   (   ~('(' | ')')
        |   '(' nestedParenthesesBlock ')'
        )*
    ;

pointer
    :   '*' typeQualifierList? 
    |   '*' typeQualifierList? pointer
    |   '^' typeQualifierList? // Blocks language extension
    |   '^' typeQualifierList? pointer // Blocks language extension
    ;

typeQualifierList
    :   typeQualifier
    |   typeQualifierList typeQualifier
    ;

parameterTypeList
    :   parameterList
    |   parameterList ',' '...'
    ;

parameterList
    :   parameterDeclaration
    |   parameterList ',' parameterDeclaration
    ;

parameterDeclaration
    :   declarationSpecifiers declarator
    |   declarationSpecifiers2 abstractDeclarator?
    ;

identifierList
    :   Identifier
    |   identifierList ',' Identifier
    ;

typeName
    :   specifierQualifierList abstractDeclarator?
    ;

abstractDeclarator
    :   pointer
    |   pointer? directAbstractDeclarator gccDeclaratorExtension*
    ;

directAbstractDeclarator
    :   '(' abstractDeclarator ')' gccDeclaratorExtension*
    |   '[' typeQualifierList? assignmentExpression? ']'
    |   '[' 'static' typeQualifierList? assignmentExpression ']'
    |   '[' typeQualifierList 'static' assignmentExpression ']'
    |   '[' '*' ']'
    |   '(' parameterTypeList? ')' gccDeclaratorExtension*
    |   directAbstractDeclarator '[' typeQualifierList? assignmentExpression? ']'
    |   directAbstractDeclarator '[' 'static' typeQualifierList? assignmentExpression ']'
    |   directAbstractDeclarator '[' typeQualifierList 'static' assignmentExpression ']'
    |   directAbstractDeclarator '[' '*' ']'
    |   directAbstractDeclarator '(' parameterTypeList? ')' gccDeclaratorExtension*
    ;

typedefName
    :   Identifier
    ;

initializer
    :   assignmentExpression#initvalue
    |   '{' initializerList '}'#initlist
    |   '{' initializerList ',' '}'#initlists
    ;

initializerList
    :   designation? initializer#initializerelement
    |   initializerList ',' designation? initializer#initializerlist
    ;

designation
    :   designatorList '='
    ;

designatorList
    :   designator
    |   designatorList designator
    ;

designator
    :   '[' constantExpression ']'
    |   '.' Identifier
    ;

staticAssertDeclaration
    :   '_Static_assert' '(' constantExpression ',' StringLiteral+ ')' ';'
    ;

statement
    :   labeledStatement#labstat
    |   compoundStatement#compstat
    |   expressionStatement#expstat
    |   selectionStatement#selstat
    |   iterationStatement#itstat
    |   jumpStatement#jumpstat
 //   |   ('__asm' | '__asm__') ('volatile' | '__volatile__') '(' (logicalOrExpression (',' logicalOrExpression)*)? (':' (logicalOrExpression (',' logicalOrExpression)*)?)* ')' ';'#inlineasm
    ;

labeledStatement
    :   labelprefix statement#simplelab
    |   caseprefix  statement#caselab
    |   defaultprefix statement#defaultlab
    ;
defaultprefix :'default' ':' ;
labelprefix:Identifier ':' ;
caseprefix:   'case' constantExpression ':';
compoundStatement
    :   '{' blockItemList? '}'
    ;

blockItemList
    :   blockItem
    |   blockItemList blockItem
    ;

blockItem
    :  statement#blockstat  | declaration#blockdec
     
    ;

expressionStatement
    :  e= expression? ';'
    ;

selectionStatement
    :   'if' '(' expression ')' pstatement 'else' pstatement#ifelse
    |   'if' '(' expression ')' pstatement #ifthen
    |   'switch' '(' expression ')' pstatement#switchstat
    ;
    
pstatement// special case so we push statement on the stack
	: statement
	;

iterationStatement
    :   'while' '(' expression ')' pstatement#whilestatement
    |   'do' pstatement 'while' '(' expression ')' ';'#dostatement
    |   'for' '(' voidexp';' expression? ';' voidexp ')' pstatement#oldfor
    |   'for' '(' declaration expression? ';' expression? ')' statement#declfor
    ;
 
voidexp
	: e=expression?
	;
jumpStatement
    :   'goto' Identifier ';'#gotostatement
    |   'continue' ';'#continuestatement
    |   'break' ';'#breakstatement
    |   'return' expression ';'#returnvalue
    |   'return' ';' #returnstatement
//    |   'goto' unaryExpression ';'#gccgoto // GCC extension
    ;

compilationUnit
    :   translationUnit? EOF
    ;

translationUnit
    :   externalDeclaration
    |   translationUnit externalDeclaration
    ;

externalDeclaration
    :   functionDefinition
    |   declaration
    |   ';' // stray ;
    ;

functionDefinition
    :  // declarationSpecifiers? declarator declarationList? compoundStatement|
     declarationSpecifiers?  pointer? directDeclarator '(' ansiparams ')' compoundStatement#ansifndef
    |  declarationSpecifiers? pointer? directDeclarator '(' identifierList? ')'  krfndef#krdef
    ;
 krfndef:declarationList? compoundStatement;
declarationList
    :   declaration
    |   declarationList declaration
    ;

Auto : 'auto';
Break : 'break';
Case : 'case';
Char : 'char';
Const : 'const';
Continue : 'continue';
Default : 'default';
Do : 'do';
Double : 'double';
Else : 'else';
Enum : 'enum';
Extern : 'extern';
Float : 'float';
For : 'for';
Goto : 'goto';
If : 'if';
Inline : 'inline';
Int : 'int';
Long : 'long';
Register : 'register';
Restrict : '__restrict';
Return : 'return';
Short : 'short';
Signed : 'signed';
Sizeof : 'sizeof';
Static : 'static';
Struct : 'struct';
Switch : 'switch';
Typedef : 'typedef';
Union : 'union';
Unsigned : 'unsigned';
Void : 'void';
Volatile : 'volatile';
While : 'while';

Alignas : '_Alignas';
Alignof : '_Alignof';
Atomic : '_Atomic';
Bool : '_Bool';
Complex : '_Complex';
Generic : '_Generic';
Imaginary : '_Imaginary';
Noreturn : '_Noreturn';
StaticAssert : '_Static_assert';
ThreadLocal : '_Thread_local';

LeftParen : '(';
RightParen : ')';
LeftBracket : '[';
RightBracket : ']';
LeftBrace : '{';
RightBrace : '}';

Less : '<';
LessEqual : '<=';
Greater : '>';
GreaterEqual : '>=';
LeftShift : '<<';
RightShift : '>>';

Plus : '+';
PlusPlus : '++';
Minus : '-';
MinusMinus : '--';
Star : '*';
Div : '/';
Mod : '%';

And : '&';
Or : '|';
AndAnd : '&&';
OrOr : '||';
Caret : '^';
Not : '!';
Tilde : '~';

Question : '?';
Colon : ':';
Semi : ';';
Comma : ',';

Assign : '=';
// '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|='
StarAssign : '*=';
DivAssign : '/=';
ModAssign : '%=';
PlusAssign : '+=';
MinusAssign : '-=';
LeftShiftAssign : '<<=';
RightShiftAssign : '>>=';
AndAssign : '&=';
XorAssign : '^=';
OrAssign : '|=';

Equal : '==';
NotEqual : '!=';

Arrow : '->';
Dot : '.';
Ellipsis : '...';

Identifier
    :   IdentifierNondigit
        (   IdentifierNondigit
        |   Digit
        )*
    ;

fragment
IdentifierNondigit
    :   Nondigit
    |   UniversalCharacterName
    //|   // other implementation-defined characters...
    ;

fragment
Nondigit
    :   [a-zA-Z_]
    ;

fragment
Digit
    :   [0-9]
    ;

fragment
UniversalCharacterName
    :   '\\u' HexQuad
    |   '\\U' HexQuad HexQuad
    ;

fragment
HexQuad
    :   HexadecimalDigit HexadecimalDigit HexadecimalDigit HexadecimalDigit
    ;


	

//fragment
IntegerConstant
    :   DecimalConstant IntegerSuffix? 
    |   OctalConstant IntegerSuffix?
    |   HexadecimalConstant IntegerSuffix?
    ;
    
 
	
fragment
DecimalConstant
    :   NonzeroDigit Digit*
    ;

fragment
OctalConstant
    :   '0' OctalDigit*
    ;

fragment
HexadecimalConstant
    :   HexadecimalPrefix HexadecimalDigit+
    ;

fragment
HexadecimalPrefix
    :   '0' [xX]
    ;

fragment
NonzeroDigit
    :   [1-9]
    ;

fragment
OctalDigit
    :   [0-7]
    ;

fragment
HexadecimalDigit
    :   [0-9a-fA-F]
    ;

fragment
IntegerSuffix
    :   UnsignedSuffix LongSuffix?
    |   UnsignedSuffix LongLongSuffix
    |   LongSuffix UnsignedSuffix?
    |   LongLongSuffix UnsignedSuffix?
    ; 

fragment
UnsignedSuffix
    :   [uU]
    ;

fragment
LongSuffix
    :   [lL]
    ;

fragment
LongLongSuffix
    :   'll' | 'LL'
    ;

//fragment
FloatingConstant
    :   DecimalFloatingConstant
    |   HexadecimalFloatingConstant
    ;

fragment
DecimalFloatingConstant
    :   FractionalConstant ExponentPart? FloatingSuffix?
    |   DigitSequence ExponentPart FloatingSuffix?
    ;

fragment
HexadecimalFloatingConstant
    :   HexadecimalPrefix HexadecimalFractionalConstant BinaryExponentPart FloatingSuffix?
    |   HexadecimalPrefix HexadecimalDigitSequence BinaryExponentPart FloatingSuffix?
    ;

fragment
FractionalConstant
    :   DigitSequence? '.' DigitSequence
    |   DigitSequence '.'
    ;

fragment
ExponentPart
    :   'e' Sign? DigitSequence
    |   'E' Sign? DigitSequence
    ;

fragment
Sign
    :   '+' | '-'
    ;

fragment
DigitSequence
    :   Digit+
    ;

fragment
HexadecimalFractionalConstant
    :   HexadecimalDigitSequence? '.' HexadecimalDigitSequence
    |   HexadecimalDigitSequence '.'
    ;

fragment
BinaryExponentPart
    :   'p' Sign? DigitSequence
    |   'P' Sign? DigitSequence
    ;

fragment
HexadecimalDigitSequence
    :   HexadecimalDigit+
    ;

fragment
FloatingSuffix
    :   'f' | 'l' | 'F' | 'L'
    ;

//fragment
CharacterConstant
    :   '\'' CCharSequence '\''
    |   'L\'' CCharSequence '\''
    |   'u\'' CCharSequence '\''
    |   'U\'' CCharSequence '\''
    ;

fragment
CCharSequence
    :   CChar+
    ;

fragment
CChar
    :   ~['\\\r\n]
    |   EscapeSequence
    ;

fragment
EscapeSequence
    :   SimpleEscapeSequence
    |   OctalEscapeSequence
    |   HexadecimalEscapeSequence
    |   UniversalCharacterName
    ;

fragment
SimpleEscapeSequence
    :   '\\' ['"?abfnrtv\\]
    ;

fragment
OctalEscapeSequence
    :   '\\' OctalDigit
    |   '\\' OctalDigit OctalDigit
    |   '\\' OctalDigit OctalDigit OctalDigit
    ;

fragment
HexadecimalEscapeSequence
    :   '\\x' HexadecimalDigit+
    ;

StringLiteral
    :   EncodingPrefix? '"' (ESC | . )*? '"'
    ;

fragment
ESC
	: '\\"'
	;
fragment
EncodingPrefix
    :   'u8'
    |   'u'
    |   'U'
    |   'L'
    ;

fragment
SCharSequence
    :   SChar+
    ;

fragment
SChar
    :   ~["\\\r\n]
    |   EscapeSequence
    ;

LineDirective
    :   '#' Whitespace? DecimalConstant    Whitespace? StringLiteral ~[\r\n]* 
       {String s=getText();s=s.substring(1); 
       while(s.startsWith(" "))s=s.substring(1); setLine(Integer.parseInt(  s.substring(0,s.indexOf(' ')))-1);}   -> skip
    ;

PragmaDirective
    :   '#' Whitespace? 'pragma' Whitespace ~[\r\n]*
        -> skip
    ;

Whitespace
    :   [ \t]+
        -> skip
    ;

Newline
    :   (   '\r' '\n'?
        |   '\n'
        )
        -> skip
    ;

BlockComment
    :   '/*' .*? '*/'
        -> skip
    ;

LineComment
    :   '//' ~[\r\n]*
        -> skip
    ;
