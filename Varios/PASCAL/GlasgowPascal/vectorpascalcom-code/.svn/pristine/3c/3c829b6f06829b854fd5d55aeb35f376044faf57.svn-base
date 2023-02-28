
import java_cup.runtime.*;
import java.io.*;
import java.util.Vector;
parser code{:
//------------------------------------ code added to the parser
public static void main(String[] args)
{
	if (args.length<1)
	{
		System.out.println("java matlab.matlabc sourcefile");
		System.exit(1);
	}
	try{
		try{
			Yylex lexer=new Yylex(    new FileInputStream(args[0]));
			matlabc compiler=new matlabc(lexer);
			Object parsetree=compiler.parse();
			System.out.println("parsed ok");
			
		}
		catch(FileNotFoundException fn)
		{	
			System.out.println("File error "+fn);
		}
	}
	catch(Exception eee)
	{
		System.out.println("Parse error "+eee); 
	}
}
:};
/* Preliminaries to set up and use the scanner.  */
init with {:   
	            
:};
/*scan with {: MatlabTree t; return scanner.next_token(); :};
*/
/* Terminals (tokens returned by the scanner). */

terminal IDENTIFIER, CONSTANT, STRING_LITERAL;
terminal ARRAYMUL, ARRAYPOW, ARRAYDIV, ARRAYRDIV; 
terminal LE_OP, GE_OP, EQ_OP, NE_OP;
terminal BRA, KET, LBRACE,RBRACE, COMMA,STAR,LT,GT,VBAR,
         SLASH,BACKSLASH,HAT,COLON, PLUS,MINUS, TILDA,
         AMPERSAND,EQ, SEMICOLON;

terminal IF, ELSE, ELSEIF, WHILE, FOR ,BREAK ,RETURN, END; 
terminal FUNCTION ,TRANSPOSE, NCTRANSPOSE ,CR ,GLOBAL, CLEAR;
 
/* 
  known bugs:
  (1) Cannot distinguish 'function' from 'array' (need symbol table)
  (2) Multidimentional array accepted, i.e., a(:,:,:) (ver. 5.0 support :-)
  (3) Some commands, such as 'hold on', 'load m.txt' cannot be checked.
      (need symbol table to identify functions)
*/
non terminal primary_expression, postfix_expression,index_expression,array_list;
non terminal index_expression_list, array_expression, unary_expression, unary_operator, 
             additive_expression, relational_expression, equality_expression, and_expression,
	     or_expression, expression,multiplicative_expression,
	     assignment_expression, eostmt, statement,
	     global_statement, clear_statement, assignment_statement,
	     expression_statement, selection_statement, iteration_statement,
	     jump_statement, statement_list, identifier_list, array_element,
	     elseif_clause, translation_unit, function_declare, func_ident_list, 
	     func_return_list, function_declare_lhs, function_list, function_text;


precedence left PLUS, MINUS, COMMA, SEMICOLON, CR;
precedence right LBRACE;

start with translation_unit;

 

translation_unit
        ::= statement_list:s		{: RESULT=s; :}
        | function_list:s		{: RESULT=s; :}
        ;

function_list
	::= function_text:t				{:
								Vector<MatlabFunction> v=new Vector<MatlabFunction>();
								v.add((MatlabFunction)t);
								RESULT=v;
						//	System.out.println("->"+ t);
							:}
	| function_text:t function_list:v			{:((Vector<MatlabFunction>) v).add((MatlabFunction)t);
								RESULT=v;
						//	System.out.println("->"+ t);
							:}	
	;

function_text
	::= FUNCTION function_declare:f eostmt statement_list:b {:
									
									((MatlabFunction)f).text=(MatlabTree)b;
									RESULT = f;
								:}
	;

primary_expression
        ::= IDENTIFIER:i                              {: RESULT = new MatlabVar((String)i);:}                 
        | CONSTANT:c                                  {: RESULT = new MatlabConst(c);:}
        | STRING_LITERAL:s                            {: RESULT = new MatlabConst(s ); :}        
        | LBRACE expression:e RBRACE                  {: RESULT = e; :}
        | BRA KET                                     {: RESULT = new MatlabArrayList(new Vector<MatlabTree>()); :}
        | BRA array_list:l KET                        {: RESULT = l; :}
        ;

postfix_expression
        ::= primary_expression:e                      {: RESULT = e; :}
        | array_expression:e                          {: RESULT = e; :}
        | postfix_expression:e TRANSPOSE	      {: RESULT = new MatlabUnaryExp("TRANSPOSE",e); :}
        | postfix_expression:e NCTRANSPOSE            {: RESULT = new MatlabUnaryExp("NCTRANSPOSE",e); :}
        ;

index_expression
        ::= COLON                                           {: RESULT = null; :}
        | expression:e					    {: RESULT = e; :}
        ;

index_expression_list
        ::= index_expression:e                              {: 
								Vector<MatlabTree> t=new Vector<MatlabTree>();
								t.add((MatlabTree)e);
								RESULT = t; 
							    :}
        | index_expression:e COMMA index_expression_list:l  {:
								MatlabTree t=(MatlabTree)e;
								((Vector<MatlabTree>)l).insertElementAt(t,0);
								 RESULT = l; 
							    :}
        ;

array_expression
        ::= IDENTIFIER:i LBRACE index_expression_list:l RBRACE  {: RESULT = new MatlabArrayExpression(i,l); :}
        ;

unary_expression
        ::= postfix_expression:s				 {: RESULT=s; :}
        | unary_operator:o postfix_expression:e                  {: RESULT = new MatlabUnaryExp(o.toString(),e); :}
        ;

unary_operator
        ::= PLUS		                                 {: RESULT = "+"; :}
        | MINUS							 {: RESULT = "-"; :}
        | TILDA	                                                 {: RESULT = "~"; :}
        ;

multiplicative_expression
        ::= unary_expression:s		{: RESULT=s; :}
        | multiplicative_expression:l STAR      unary_expression:r         {: RESULT = new MatlabExp(l,"*",r);  :}  
        | multiplicative_expression:l SLASH     unary_expression:r         {: RESULT = new MatlabExp(l,"/",r);  :} 
        | multiplicative_expression:l BACKSLASH unary_expression:r         {: RESULT = new MatlabExp(l,"\\",r);  :}
        | multiplicative_expression:l HAT       unary_expression:r         {: RESULT = new MatlabExp(l,"^",r);  :}
        | multiplicative_expression:l ARRAYMUL  unary_expression:r         {: RESULT = new MatlabExp(l,".*",r);  :}
        | multiplicative_expression:l ARRAYDIV  unary_expression:r         {: RESULT = new MatlabExp(l,"./",r);  :}
        | multiplicative_expression:l ARRAYRDIV unary_expression:r         {: RESULT = new MatlabExp(l,".\\",r);  :}
        | multiplicative_expression:l ARRAYPOW  unary_expression:r         {: RESULT = new MatlabExp(l,".^",r);  :}
        ;

additive_expression
        ::= multiplicative_expression:s					{: RESULT=s; :}
        | additive_expression:l PLUS    multiplicative_expression:r     {: RESULT = new MatlabExp(l,"+",r);  :}
        | additive_expression:l MINUS   multiplicative_expression:r     {: RESULT = new MatlabExp(l,"-",r);  :}
        ;

relational_expression
        ::= additive_expression:s					{: RESULT=s; :}
        | relational_expression:l LT additive_expression:r           	{: RESULT = new MatlabExp(l,"<",r);  :}
        | relational_expression:l GT additive_expression:r           	{: RESULT = new MatlabExp(l,">",r);  :}
        | relational_expression:l LE_OP additive_expression:r        	{: RESULT = new MatlabExp(l,"<=",r);  :}
        | relational_expression:l GE_OP additive_expression:r        	{: RESULT = new MatlabExp(l,">=",r);  :}
        ;

equality_expression
        ::= relational_expression:s					{: RESULT=s; :}
        | equality_expression:l EQ_OP relational_expression:r        	{: RESULT = new MatlabExp(l,"==",r);  :}
        | equality_expression:l NE_OP relational_expression:r        	{: RESULT = new MatlabExp(l,"~=",r);  :}
        ;

and_expression
        ::= equality_expression:s					{: RESULT=s; :}
        | and_expression:l AMPERSAND equality_expression:r          	{: RESULT = new MatlabExp(l,"&",r);  :}
        ;

or_expression
        ::= and_expression:s						{: RESULT=s; :}
        | or_expression:l VBAR and_expression:r                     	{: RESULT = new MatlabExp(l,"|",r);  :}
        ;

expression
        ::= or_expression:s						{: RESULT=s; :}
	| expression:l COLON or_expression:r         		   	{: RESULT = new MatlabExp(l,":",r);  :}
	;

assignment_expression
        ::= postfix_expression:l EQ expression:r        		{: RESULT = new MatlabAssign(l,r);  :}
	;

eostmt
        ::=  COMMA			{: RESULT = "," ; :}
        |  SEMICOLON			{: RESULT = ";" ; :}
        |  CR				{: RESULT = "\n"; :}
        ;

statement
        ::= global_statement:s		{: RESULT=s; :}
        | clear_statement:s		{: RESULT=s; :}
        | assignment_statement:s	{: RESULT=s; :}
        | expression_statement:s	{: RESULT=s; :}
        | selection_statement:s		{: RESULT=s; :}
        | iteration_statement:s		{: RESULT=s; :}
        | jump_statement:s		{: RESULT=s; :}
        ;

statement_list
        ::= statement:i 			{: 
							Vector<MatlabTree> t=new Vector<MatlabTree>(1);
							t.add((MatlabTree)i);
							RESULT=new MatlabStatementList(t); 
						:}
        | statement_list:l statement:n		{: Vector<MatlabTree> t=((MatlabStatementList)l).list;
						   t.add((MatlabTree)n);
				                   RESULT = l; 
						:}
        ;
	
identifier_list
        ::= IDENTIFIER:i                        {: Vector<String> t=new Vector<String>(1);
							t.add((String)i);
							RESULT =t ; 
						:}
        | identifier_list:l IDENTIFIER:i	{: Vector<String> t=(Vector<String>)l; 
							t.add((String)i); 
							RESULT =t ;
						 :}	
        ;

global_statement
        ::= GLOBAL identifier_list eostmt
        ;

clear_statement
        ::= CLEAR identifier_list eostmt
        ;

expression_statement
        ::= eostmt
        | expression:s eostmt:t				{: RESULT=new MatlabStatement((MatlabTree)s,(String)t); :}
        ;

assignment_statement
        ::= assignment_expression:s eostmt:t		{: RESULT=new MatlabStatement((MatlabTree)s,(String)t); :}
        ;

array_element
        ::= expression:s			{: RESULT=s; :}
        | expression_statement:s		{: RESULT=s; :}
        ;

array_list
        ::= array_element:e		{:
						Vector<MatlabTree>t=new Vector<MatlabTree>();
						t.add((MatlabTree)e);
						RESULT = new MatlabArrayList(t);
					:}
        | array_list:l array_element:e	{:
						Vector<MatlabTree>t= ((MatlabArrayList)l).list;
						t.add((MatlabTree)e);
						RESULT = l;
					:}	
        ;
 
selection_statement
        ::= IF expression:e statement_list:l END eostmt				{: RESULT=new MatlabIf(e,l,null); :}
        | IF expression:e statement_list:l ELSE statement_list:k END eostmt	{: RESULT=new MatlabIf(e,l,k); :}	
        | IF expression:e statement_list:l elseif_clause:k END eostmt		{: RESULT=new MatlabIf(e,l,k); :}
      
        ;

elseif_clause
        ::= ELSEIF expression:e statement_list:l			{: RESULT=new MatlabIf(e,l,null); :}
        | ELSEIF expression:e statement_list:l  ELSE statement_list:k  	{: RESULT=new MatlabIf(e,l,k); :}
	| ELSEIF expression:e statement_list:l elseif_clause:k 		{: RESULT=new MatlabIf(e,l,k); :}
        ;
	
iteration_statement
        ::= WHILE expression:e statement_list:l END eostmt		{: RESULT = new MatlabWhile((MatlabTree)e,(MatlabTree)l); :}
        | FOR IDENTIFIER:i EQ expression:e statement_list:l END eostmt	{: RESULT = new MatlabFor((String)i,(MatlabTree)e,(MatlabTree)l); :}
        | FOR LBRACE IDENTIFIER:i EQ expression:e RBRACE statement_list:l END eostmt {: RESULT = new MatlabFor((String)i,(MatlabTree)e,(MatlabTree)l); :}
        ;

jump_statement
        ::= BREAK eostmt						{: RESULT = new MatlabJump("break"); :}
        | RETURN eostmt							{: RESULT = new MatlabJump("return"); :}
        ;



func_ident_list
        ::= IDENTIFIER:i						{: 
											Vector<String>t= new Vector<String>();
											t.add((String)i);
											RESULT=t;
									:}
        | func_ident_list:l COMMA IDENTIFIER:i				{: 		
											Vector<String>t=  (Vector<String>)(l);
											t.add((String)i);
											RESULT=t;
									:}
        ;

func_return_list
        ::= IDENTIFIER:i						{: 
											Vector<String>t= new Vector<String>();
											t.add((String)i);
											RESULT=t;
									:}
        | BRA func_ident_list:l KET					{: RESULT =l; :}
        ;

function_declare_lhs
        ::= IDENTIFIER:i						{: 
										RESULT=new MatlabFunction(new Vector<String>(),new Vector<String>(),null,i.toString());
									:}
										
        | IDENTIFIER:i LBRACE RBRACE					{: 
										RESULT=new MatlabFunction(new Vector<String>(),new Vector<String>(),null,i.toString());
									:}
        | IDENTIFIER:i LBRACE func_ident_list:l RBRACE			{: 
										RESULT=new MatlabFunction(new Vector<String>(),(Vector<String>)l,null,i.toString());
									:}
        ;

function_declare
        ::= function_declare_lhs :f 					{: RESULT=f; :}
        | func_return_list:l EQ function_declare_lhs:r			{:
										((MatlabFunction)r).result=(Vector<String>)l;
										RESULT=r;
									:}
        ;



