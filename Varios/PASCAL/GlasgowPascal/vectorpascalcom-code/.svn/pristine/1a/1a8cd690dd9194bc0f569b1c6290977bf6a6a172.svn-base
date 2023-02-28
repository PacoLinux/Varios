// pascal lexical analyser
package ilcg.Pascal;
import java.io.*;
import java.util.*;
import ilcg.SyntaxError;
%%
%line

%yylexthrow{
SyntaxError
%yylexthrow}
%char
%ignorecase
%unicode
%{
public String theString,theId,temps;
	/** true if succ and pred operate in a modular fashion */
	public boolean modularArithmetic=true;
	private String filename;
        private Yylex link=null;
	/** if we encounter an include file command we create a new lexer and
	     replace the current lexer with it, but chain the current one to the
	     new one so that when the file is ended this one steps back in. */
	private void redirect(String filename)throws SyntaxError
	{
		try{
		Yylex newone = new Yylex(new FileInputStream(filename));
		link=newone;

		newone.nextsymbol();
		if(echo)System.out.println("include "+filename);
		}
		catch (Exception e){
			throw new SyntaxError(e.toString(),yyline);
		}
	}
	private int token,c,state;
	public double theNumber;
        private boolean rcheck=true;
	public boolean rangechecks=true;
	private Hashtable reserved=new Hashtable();
	private Hashtable defined=new Hashtable();
	private String[] symbols = new String[1000];
	private int lastSymbol=-1;
	private Reader inp;
	static int unknown=0;
	boolean fatal=false;
	String fatalmessage="";
	static boolean debug=false;
	String strlit="";
	boolean echo=false;
        int comment_count=0;
	/** Symbol returned when an integer literal is recognised */
	public final static int TT_NUMBER=-2;
	/** Symbol returned when a floating point number is recognised */
	public final static int TT_REAL=-3;
	/** Symbol returned when an string is recognised */
	public final static int TT_STRING=-4;
	public final static int TT_CHARLIT=-5;
        public int TT_EOF=YYEOF;
	public final static int TT_INCLUDE=-7;
	/** Symbol returned when an identifier is recongnised */
	public final static int TT_WORD=-8;
	/** indicates a semicolon has been recognised, has the value of the char ';'. This
	is generally the case for all single character symbols recognised by the lexer.*/
	public final static int TT_SEMICOLON=';';
	public final static int TT_IDENTIFIER=TT_WORD;
	public final static int TT_FULLSTOP='.';
	public  static int TT_ELIPSIS;
	public  static int TT_ASSIGN;
	public  static int TT_NE;
	public  static int TT_LE;
	public  static int TT_GE; 
	public  static int TT_SETXOR;
	public static int TT_EXP;

	/** Returned when the word 'type' is recognised */
	public  static int TT_TYPE;
	/** Returned when the operator '+:' is recognised */
	public  static int TT_SATPLUS;
	/** Returned when the operator '-:' is recognised */
	public  static int TT_SATMINUS;
	public static int TT_ADDR;
	public static int TT_SQRT,TT_DIV, TT_SUMATION, TT_PRODUCT, TT_IN;	

  	public  String reservedWords[]={
				"ABS",
				"ADDR",
	  			"AND",
				"ARRAY",
	  			"BEGIN",
			//	"BOOLEAN",
				"BYTE2PIXEL",
				"CASE",
				"CAST",
				"CDECL",
			//	"CHAR",
				"CHR",
				"CONST",
				"COS",
				"DIAG",
			//	"DISPOSE",
	  			"DIV",
				"DO",
				"DOWNTO",
	  			"END",
	  			"ELSE",
	  			"EXIT",
				"EXTERNAL",
			//	"FALSE",
				"FILE",
				"FOR",
				"FORWARD",
	  			"FUNCTION",
				"GOTO",
	  			"IF",
				"IMPLEMENTATION",
				"IN",
				"INTERFACE",
			//	"INTEGER",
				"IOTA",
				"LABEL",

				"LIBRARY",

				"LN",
				"MAX",
				"MIN",
	  			"MOD",
			//	"NDX",
			//	"NAME",
	  		//	"NEW",
				"NOT",
				"OF",
				"OPERATOR",
	  			"OR",
				"ORD",
				"OTHERWISE",
				"PACKED",
				"PERM",
				"PIXEL2BYTE",
				"POW",
			//	"POINTER",
				"PRED",
	  			"PROCEDURE",

	  			"PROGRAM",
				"PROTECTED",
			//	"RDU",
			//	"READ",
			//	"READLN",
			//	"REAL",
				"RECORD",
				"REM",
				"REPEAT",
				"ROUND",
				"SET",
				"SHL",
				"SHR",
				"SIN",
				"SIZEOF",
				"STRING",
				"SQRT",
				"SUCC",

				"TAN",
			//	"TEXT",
				"THEN",
				"TO",
				"TRANS",

			//	"TRUE",

				"TYPE",
				"VAR",
				"WITH",
				"WHILE",
			//	"WRITE",
			//	"WRITELN",
				"UNIT",
				"UNTIL",
				"USES"};
	public void reserveWords(String [] reserved){
		for(int i=0 ;i<reserved.length;i++)reserveWord(reserved[i]);


	}
	public void excludeWord(String s)
	{
		reserved.put(s,new Integer(TT_WORD));
	}
	String strip(String s){
		int len = s.length();
		if (len>=3)s=s.substring(1,s.length()-1);
		else s="";
		len=s.length();
		String newstr="";
		for(int i=0;i<len;i++)
		   if(s.charAt(i)=='\'' ){
			newstr=newstr+"'";
			i++ ;
			}
		   else newstr=newstr+s.charAt(i);
		return newstr;
	}
	
	/* define a preprocessor symbol */
	public void defineSymbol(String symbol)
	{
		defined.put(symbol, symbol);
	}
	/* define multiple preprocessor symbols */
	public void defineSymbols(Vector symbols)
	{
		for (int i = 0; i < symbols.size(); i++)
		{
			defineSymbol(symbols.get(i).toString());
		}
	}
	
/** associate a string with a token in the reserved word table */
	public void reserveWord(String s )
	{   s=s.toLowerCase();
	    if(reserved.get(s)==null){
		lastSymbol++;
	        if (lastSymbol>=symbols.length) symbols = lengthen(symbols);
	    	symbols[lastSymbol]=s;
	//	System.out.println("reserve "+s+"="+lastSymbol);
	    	reserved.put(s,new Integer(lastSymbol));
		}
	}
	String [] lengthen(String [] v)
	{
		int nl = v.length+100;
		String [] nv = new String[nl];
		int i;
		for(i=0;i<nl;i++)nv[i]= "............. undefined string ";
		for(i=0;i<v.length;i++)nv[i]=v[i];
		return nv;
	}
	int tokenOf(String s)
	{
		Object n=reserved.get(s.toLowerCase());
		if(n==null) return -1;
		if(n instanceof Integer) return ((Integer)n).intValue();
		return -1;
	}
	String totext(int token)// convert token to prinatable form
	{ 

	  if (token ==TT_NUMBER) return ".number.";
	  if (token ==TT_REAL) return "real_lit";
	  if (token ==TT_WORD)return "identifier";
	  if (token ==TT_STRING) return "string";
          if (token ==TT_EOF) return "end of file";  
	  if (token>0){
	  	return symbols[token];

          }
	  
	  return " "+token;
	}

	public boolean have(int symbol)throws SyntaxError
	{		
			if(fatal)throw new SyntaxError(fatalmessage,yyline);
			if(token==symbol){
				if(debug){

					System.out.print("have("+totext(token)+")\n");
				}
				if (token == TT_WORD)
		        	theId = theString;
				nextsymbol();

				return true;
			}
			if(debug){
					String sym;
					sym=totext(symbol);
					System.out.print("!have("+sym+")");
				        sym=totext(token);
					System.out.println("but "+sym);
				}
			return false;
		}



	/** if not symbol give error*/
	public void mustbe(String symbol)	throws SyntaxError
	{
		 if (!have(symbol))	
 		throw new SyntaxError("Error  ("+text+") found when symbol  "+
		                       "(" +symbol+") expected ",
		                       yyline)     ;
	}
	 /** checks for the symbol and eats it up if found */
	public boolean have(String symbol)throws SyntaxError
	{
	 String s;
	 int t=tokenOf(s=symbol.toLowerCase());
	 if (t==TT_WORD){if(peek(t)){if(!s.equals(theString))return false;}}
	 return have(t);
	}
	/** if not symbol give error*/
	public void mustbe(int symbol)throws SyntaxError
	{
		if (!have(symbol))
 		throw new SyntaxError("Error  ("+totext(token)+" = "+token+") found when symbol  "+
		                       "("+totext(symbol)+ ") expected ",
		                       yyline)     ;
	}
	/** returns current source line number */
	public int lineno(){return yyline+1;}

	public int charno(){return yychar;}


   


/** true if the next token matches match, does not read the following token. */
	public boolean peek(int match)
	{
		if(debug)System.out.println("peek("+totext(match)+") token = "+totext(token));
		return match == token;
	}
	public boolean peek(String match){return peek(tokenOf(match));}
	public String text;
	/** Move the analyser on by one token.*/
	public void nextsymbol() throws SyntaxError
	{
		try{
			if(link==null)
			{
				token = yylex();
				text=yytext();
			}
			else {
				token=link.yylex(); text=link.yytext();
				if(token==TT_EOF){
					if(echo)System.out.print("EOF :"+token);
					link=null;
					nextsymbol();
					if(echo)System.out.print(" next token ="+token+"="+text);
					return;
					}
			}


			if(echo)System.out.print(text+" ");
			if(debug)System.out.println("text <"+text+"> token = "+token +
				 " symbolic value " + totext(token)+
				"theString="+theString);
		}
    		catch(IOException e){
      		token=(int)'.';
      		}
		if(token==TT_INCLUDE){
			redirect (filename);
			token=link.token;
			text=link.text;

		}
 		if(token==TT_NUMBER){
 		      if(text.startsWith("$")){
 		        //System.out.println(text);
 		        String root = text.substring(1);
 		       // System.out.println(root);
 		      	theNumber=  Long.parseLong(root,16) ;
			    if(root.length()<9){ long templ = (long) theNumber; theNumber=(int) templ;}
 		      	}
 		      else
			if(text.indexOf('#')==-1)theNumber= Long.parseLong(text,10) ;
		        else {
				int pos =text.indexOf('#');
				String b= text.	substring(0,pos);
				String val = text.substring(pos+1);
				int base;
				theNumber=Long.parseLong(val,base=Integer.parseInt(b,10));
				if(base==16&&val.length()<9){ long templ = (long) theNumber; theNumber=(int) templ;}
			}
	 	}
		if(token == TT_REAL){
			//System.out.println("Convert "+text);
                        theNumber = (new Double(text)).doubleValue();
		//	System.out.println(theNumber);
		}
		if(token ==TT_STRING){theString=strip(text);}
	 	if (token==TT_WORD){
	 		theString=text;
	 		String lower = theString.toLowerCase();
	 		if( text.length()>1){
				Object t=reserved.get( lower);
			//	if(debug)System.out.println(lower+"="+t);
	 			if (t!=null)token=((Integer)t).intValue();
	 		}
			theString=lower;

	 	}

	 //	if(debug)System.out.println(" "+token);
	}

%}
%init{


		//c=getchar();
		theString="";
		theNumber=0;
		token=0;

		for (int i=0;i<128;i++)
		 	reserveWord(new Character((char)i).toString());
		reserveWords(reservedWords);
	//	TT_BOOLEAN=tokenOf("BOOLEAN");
	//	TT_CHAR=tokenOf("CHAR");
	//	TT_REALTYPE=tokenOf("REAL");
	//	TT_INTEGER=tokenOf("INTEGER");
                TT_TYPE=tokenOf("TYPE");
		TT_DIV=tokenOf("DIV");
		TT_SQRT=tokenOf("SQRT");
		TT_IN=tokenOf("IN");
		reserveWord("$product");TT_PRODUCT=tokenOf("$product");
		reserveWord("$sum");TT_SUMATION=tokenOf("$sum");
		reserveWord(":=");TT_ASSIGN=tokenOf(":=");
		reserveWord("..");TT_ELIPSIS=tokenOf("..");
		reserveWord("<>");TT_NE=tokenOf("<>");
		reserveWord("<=");TT_LE=tokenOf("<=");
		reserveWord(">=");TT_GE=tokenOf(">=");
 		reserveWord("+:");TT_SATPLUS=tokenOf("+:");
		reserveWord("-:");TT_SATMINUS=tokenOf("-:");
		reserveWord("**");TT_EXP=tokenOf("**");
		reserveWord("><");TT_SETXOR=tokenOf("><");
		reserved.put("rdu",new Integer('\\'));
		reserved.put("ndx",new Integer(tokenOf("iota")));
		TT_ADDR=tokenOf("ADDR");
//\(\*[^*|\*]*\*\) {/* skip */ }	       

%init}

%integer
latin=[a-zA-Z_]
greek=[\u0391-\u03a9]
cyrillic=[\u0410-\u042f]
hiragana=[\u3041-\u3094]
katakana=[\u30a1-\u30fa]
cjk=[\u4e00-\u9fff]
hanguljamo=[\u1100-\u11ff]
alpha=({latin}|{greek}|{cyrillic}|{katakana}|{hiragana}|{cjk})
digit=[0-9]
in=\u2208
and=\u2227
or=\u2228
iota=\u2373
leftarrow=\u2190
naryproduct=\u220f
divide=\u00f7
multiply=\u2715
multiplication=\u00d7
narysum=\u2211
sqrt=\u221a
lessthanorequal=\u2264
notequal=\u2260
greaterthanorequal=\u2265
not=\u00ac
cabs=\u7edd\u5bf9\u503c
hexdigit=[0-9a-fA-F]
alphanumeric=({alpha}|{digit})
whitespace=(" "|\n|\r|\t)
exp=(e|E)
COMMENT_TEXT=(\n|\r|\t|[^*]|\*[^)])
LINECOMMENT_TEXT=[^\n]*
%state STRSTAT,COMMENT,SKIP
%%
<YYINITIAL> {whitespace} {
		if(echo)System.out.print(yytext());
		yy_mark_start();/* skip white space */
		}
<YYINITIAL> \{\$FATAL({COMMENT_TEXT})*\} {fatal=true;fatalmessage=yytext();}
<YYINITIAL> \{\$ELSE\} {yybegin(SKIP);}
<SKIP> \{\$ELSE\} {yybegin(YYINITIAL);}
<SKIP> \{\$ENDIF([^}])*\} {   if(echo)System.out.print("skip off");yybegin(YYINITIAL);}
<SKIP> ({whitespace}|{alphanumeric}|{COMMENT_TEXT}|.) {if(echo)System.out.print("("+yytext()+")");yy_mark_start();}
\(\*.*\*\) {/* skip comment */ }
<YYINITIAL> "(*" { if(echo) System.out.print("(*");yybegin(COMMENT); comment_count = comment_count + 1; }
<COMMENT> "*)" {
               if(echo) System.out.print(yytext());
		yy_mark_start();
    		yybegin(YYINITIAL);

}
<COMMENT> ({COMMENT_TEXT})* { if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
<YYINITIAL> \/\/{LINECOMMENT_TEXT} {}
<YYINITIAL> {and} {return (int) tokenOf("AND");}
<YYINITIAL> {or} {return (int) tokenOf("OR");}
<YYINITIAL> \+ { return (int)'+';}
<YYINITIAL> - { return (int)'-';}
<YYINITIAL> \! {return (int)'!';}
<YYINITIAL> {narysum} { return TT_SUMATION;}
<YYINITIAL> {naryproduct} { return TT_PRODUCT;}
<YYINITIAL> {sqrt} { return (int)tokenOf("SQRT");}
<YYINITIAL> {divide} { return (int)tokenOf("DIV");}
<YYINITIAL> {in} { return (int)tokenOf("IN");}
<YYINITIAL> \.\. {return TT_ELIPSIS;}
<YYINITIAL> := {return TT_ASSIGN;}
<YYINITIAL> {leftarrow} {return TT_ASSIGN;}
<YYINITIAL> \+: {return TT_SATPLUS;}
<YYINITIAL> \-: {return TT_SATMINUS;}
<YYINITIAL> @ {return TT_ADDR;}
<YYINITIAL> \*\* {return TT_EXP;}
<YYINITIAL> \* {return (int)'*';}
<YYINITIAL> {multiply}|{multiplication} { return (int) '*';}
<YYINITIAL> \\ {return (int)'\\';}
<YYINITIAL> / {return (int)'/';}
<YYINITIAL> \. {return (int) '.';}
<YYINITIAL> ; {rangechecks=rcheck;return (int)';';}
<YYINITIAL> \x5e  {return (int) '^';}
<YYINITIAL> \) {return (int) ')';}
<YYINITIAL> \[ {return (int) '[';}
<YYINITIAL> \] {return (int) ']';}
<YYINITIAL> : {return (int) ':';}
<YYINITIAL> , {return (int) ',';}
<YYINITIAL> = {return (int) '=';}
<YYINITIAL> \>= {return TT_GE;}
<YYINITIAL> {greaterthanorequal} {return TT_GE;}
<YYINITIAL> {lessthanorequal} {return TT_LE;}
<YYINITIAL> \<= {return TT_LE;}
<YYINITIAL> \<\> {return TT_NE;}
<YYINITIAL> {notequal} {return TT_NE;}
<YYINITIAL> \>\< {return TT_SETXOR;}
<YYINITIAL> \> {return (int) '>';} 
<YYINITIAL> \< {return (int) '<';}
<YYINITIAL> \{\$IFDEF\ ([^}])*\} {String comm =yytext(); comm=comm.substring(8);comm=comm.substring(0,comm.length()-1).trim();
			if(defined.get(comm)==null){yybegin(SKIP);
                                   if(echo) System.out.println(" skip on "+comm);
                        }
		     }
<YYINITIAL> \{\$IFNDEF\ ([^}])*\}  {String comm =yytext();comm=comm.substring(9);comm=comm.substring(0,comm.length()-1).trim();
			if(defined.get(comm)!=null)yybegin(SKIP);
			}
<YYINITIAL> \{\$DEFINE([^}])*\} {String comm =yytext(); comm=comm.substring(9);comm=comm.substring(0,comm.length()-1).trim();defined.put(comm,comm);}
<YYINITIAL> \{\$[mM]\+([^}])*\} {modularArithmetic=true;/* skip comment */ }
<YYINITIAL> \{\$[mM]\-([^}])*\} {modularArithmetic=false; /* skip comment */ }
<YYINITIAL> \{\$[rR]\+([^}])*\} {rangechecks=rcheck=true;/* skip comment */ }
<YYINITIAL> \{\$[rR]\-([^}])*\} {rangechecks=rcheck=false; /* skip comment */ }
<YYINITIAL> \{\$linklib\ ([^}])*\} {String filename = yytext().substring(10, yytext().length()-1).trim();ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename;}
<YYINITIAL> \{\$INCLUDE\ ([^}])*\} { filename = yytext().substring(10, yytext().length()-1).trim();
			//System.out.println("try to include "+filename);
			 return TT_INCLUDE;}
<YYINITIAL> \{\$include\ ([^}])*\} { filename = yytext().substring(10, yytext().length()-1).trim();
			//System.out.println("try to include "+filename);
			 return TT_INCLUDE;}
<YYINITIAL> \{\$[i|I]\ ([^}])*\} { filename = yytext().substring(4, yytext().length()-1).trim();
			//System.out.println("try to include "+filename);
			 return TT_INCLUDE;}


<YYINITIAL> \{\$[cC]\ ([^}])*\} {String filename = yytext().substring(4, yytext().length()-1);ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" "+filename;}


<YYINITIAL> \{\$l\ ([^}])*\} {String filename = yytext().substring(4, yytext().length()-1);ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename;}
<YYINITIAL> \{\$L\ ([^}])*\} {String filename = yytext().substring(4, yytext().length()-1);ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename;}
\{([^}])*\} {/* skip comment */ }
<YYINITIAL> '(''|[^'])*' {theString=yytext();return TT_STRING;}
<YYINITIAL> \( {return (int) '(';}
<YYINITIAL> {cabs}  {return (int) tokenOf("ABS");/*chinese reserved words start */}
<YYINITIAL> \u5730\u5740 {return (int) tokenOf("ADDR");}
<YYINITIAL> \u6570\u7ec4 {return (int) tokenOf("ARRAY");}
<YYINITIAL> \u5f00\u59cb {return (int) tokenOf("BEGIN");}
<YYINITIAL> \u5b57\u8f6c\u50cf {return (int) tokenOf("BYTE2PIXEL");}
<YYINITIAL> \u4e2a\u6848 {return (int) tokenOf("CASE");}
<YYINITIAL> \u5b57\u7b26 {return (int) tokenOf("CHR");}
<YYINITIAL> \u5e38\u91cf {return (int) tokenOf("CONST");}
<YYINITIAL> \u4f59\u5f26 {return (int) tokenOf("COS");}
<YYINITIAL> \u5224\u65ad {return (int) tokenOf("DIAG");}
<YYINITIAL> \u5faa\u73af {return (int) tokenOf("DO");}
<YYINITIAL> \u4e08\u81f3 {return (int) tokenOf("DOWNTO");}
<YYINITIAL> \u7ed3\u675f  {return (int) tokenOf("END");}
<YYINITIAL> \u5426\u5219  {return (int) tokenOf("ELSE");}
<YYINITIAL> \u9000\u51fa  {return (int) tokenOf("EXIT");}
<YYINITIAL> \u5916\u90e8\u7684  {return (int) tokenOf("EXTERNAL");}
<YYINITIAL> \u9534\u8bef  {return (int) tokenOf("FALSE");}
<YYINITIAL> \u6587\u4ef6  {return (int) tokenOf("FILE");}
<YYINITIAL> \u4ece  {return (int) tokenOf("FOR");}
<YYINITIAL> \u51fd\u6570  {return (int) tokenOf("FUNCTION");}
<YYINITIAL> \u8df3\u8f6c  {return (int) tokenOf("GOTO");}
<YYINITIAL> \u5982\u679c  {return (int) tokenOf("IF");}
<YYINITIAL> \u5b9e\u73b0  {return (int) tokenOf("IMPLEMENTATION");}
<YYINITIAL> \u2208  {return (int) tokenOf("IN");}
<YYINITIAL> \u63a5\u53e3  {return (int) tokenOf("INTERFACE");}
<YYINITIAL> {iota}  {return (int) tokenOf("IOTA");}
<YYINITIAL> \u6807\u7b7e  {return (int) tokenOf("LABEL");}
<YYINITIAL> \u5e93  {return (int) tokenOf("LIBRARY");}
<YYINITIAL> \u81ea\u7136\u5bf9\u6570  {return (int) tokenOf("LN");}
<YYINITIAL> \u6700\u5927\u503c  {return (int) tokenOf("MAX");}
<YYINITIAL> \u6700\u5c0f\u503c  {return (int) tokenOf("MIN");}
<YYINITIAL> \u0025  {return (int) tokenOf("MOD");}
<YYINITIAL> \u540d\u79f0  {return (int) tokenOf("NAME");}
<YYINITIAL> \u65b0\u5efa  {return (int) tokenOf("NEW");}
<YYINITIAL> \u00ac  {return (int) tokenOf("NOT");}
<YYINITIAL> \u7684  {return (int) tokenOf("OF");}
<YYINITIAL> \u8fd0\u7b97\u7b26  {return (int) tokenOf("OPERATOR");}
<YYINITIAL> {or}  {return (int) tokenOf("OR");}
<YYINITIAL> \u5b57\u8f6c\u6570  {return (int) tokenOf("ORD");}
<YYINITIAL> \u5426\u6570  {return (int) tokenOf("OTHERWISE");}
<YYINITIAL> \u5c01\u88c5  {return (int) tokenOf("PACKED");}
<YYINITIAL> \u6392\u5217  {return (int) tokenOf("PERM");}
<YYINITIAL> \u50cf\u8f6c\u5b57  {return (int) tokenOf("PIXEL2BYTE");}
<YYINITIAL> \u5e42 {return (int) tokenOf("POW");}
<YYINITIAL> \u524d\u79fb {return (int) tokenOf("PRED");}
<YYINITIAL> \u8fdb\u7a0b {return (int) tokenOf("PROCEDURE");}
<YYINITIAL> \u7a0b\u5e8f {return (int) tokenOf("PROGRAM");}
<YYINITIAL> \u4fdd\u62a4 {return (int) tokenOf("PROTECTED");}
<YYINITIAL> \u8bfb {return (int) tokenOf("READ");}
<YYINITIAL> \u8bfb\u884c  {return (int) tokenOf("READLN");}
<YYINITIAL> \u5b9e\u6570  {return (int) tokenOf("REAL");}
<YYINITIAL> \u8bb0\u5f55  {return (int) tokenOf("RECORD");}
<YYINITIAL> \u91cd\u590d  {return (int) tokenOf("REPEAT");}
<YYINITIAL> \u56db\u820d\u4e94\u5165  {return (int) tokenOf("ROUND");}
<YYINITIAL> \u96c6\u5408  {return (int) tokenOf("SET");}
<YYINITIAL> \u5de6\u4f4d\u79fb  {return (int) tokenOf("SHL");}
<YYINITIAL> \u53f3\u4f4d\u79fb  {return (int) tokenOf("SHR");}
<YYINITIAL> \u6b63\u5f26  {return (int) tokenOf("SIN");}
<YYINITIAL> \u957f\u5ea6  {return (int) tokenOf("SIZEOF");}
<YYINITIAL> \u4e32 {return (int) tokenOf("STRING");}
<YYINITIAL> \u221a {return (int) tokenOf("SQRT");}
<YYINITIAL> \u540e\u79fb {return (int) tokenOf("SUCC");}
<YYINITIAL> \u6b63\u5207  {return (int) tokenOf("TAN");}
<YYINITIAL> \u90a3\u4e48  {return (int) tokenOf("THEN");}
<YYINITIAL> \u5230 {return (int) tokenOf("TO");}
<YYINITIAL> \u8ddd\u9635\u53d8\u6362  {return (int) tokenOf("TRANS");}
<YYINITIAL> \u771f {return (int) tokenOf("TRUE");}
<YYINITIAL> \u7c7b\u578b {return (int) tokenOf("TYPE");}
<YYINITIAL> \u53d8\u91cf {return (int) tokenOf("VAR");}
<YYINITIAL> \u4e0e  {return (int) tokenOf("WITH");}
<YYINITIAL> \u5f53  {return (int) tokenOf("WHILE");} 
<YYINITIAL> \u5199  {return (int) tokenOf("WRITE");}
<YYINITIAL> \u5199\u884c  {return (int) tokenOf("WRITELN");}
<YYINITIAL> \u5355\u5143  {return (int) tokenOf("UNIT");}
<YYINITIAL> \u76f4\u5230  {return (int) tokenOf("UNTIL");}
<YYINITIAL> \u4f7f\u7528  {return (int) tokenOf("USES");}

<YYINITIAL> {alpha}{alphanumeric}* {return TT_WORD;/* standard identifiers*/}
<YYINITIAL> {alpha} {return TT_WORD;}
<YYINITIAL> {cjk} {return TT_WORD;}
<YYINITIAL> {digit}+\.{digit}+ {return TT_REAL;}
<YYINITIAL> {digit}+\.{digit}+{exp}{digit}+ {return TT_REAL;}
<YYINITIAL> {digit}+\.{digit}+{exp}-{digit}+ {return TT_REAL;}
<YYINITIAL> {digit}+\.{digit}+{exp}\+{digit}+ {return TT_REAL;}
<YYINITIAL> {digit}+{exp}{digit}+ {return TT_REAL;}
<YYINITIAL> {digit}+{exp}-{digit}+ {return TT_REAL;}
<YYINITIAL> {digit}+{exp}\+{digit}+ {return TT_REAL;}
<YYINITIAL> \${hexdigit}+ {return TT_NUMBER;}
<YYINITIAL> {digit}+ {return TT_NUMBER;}
<YYINITIAL> {digit}+#{alphanumeric}+ {return TT_NUMBER;}
<YYINITIAL> . {System.out.println("Unmatched text <"+yytext()+"> line "+yyline);}

