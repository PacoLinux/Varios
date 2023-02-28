// pascal lexical analyser
package ilcg.Pascal;
import java.io.*;
import java.util.*;
import ilcg.SyntaxError;


class Yylex {
	private final int YY_BUFFER_SIZE = 512;
	private final int YY_F = -1;
	private final int YY_NO_STATE = -1;
	private final int YY_NOT_ACCEPT = 0;
	private final int YY_START = 1;
	private final int YY_END = 2;
	private final int YY_NO_ANCHOR = 4;
	private final int YY_BOL = 65536;
	private final int YY_EOF = 65537;
	public final int YYEOF = -1;

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
    public boolean rcheck=true;
	public boolean rangechecks=true;
	public boolean parfor=false;
	public boolean blockpar=false;
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
			//	"ABS",
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
				"CLASS",
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
			//	"EXTERNAL",
			//	"FALSE",
				"FILE",
				"FOR",
			//	"FORWARD",
	  			"FUNCTION",
				"GOTO",
	  			"IF",
				"IMPLEMENTATION",
				"IN",
				"INTERFACE",
			//	"INTEGER",
				"IOTA",
				"IS",
				"LABEL",
				"LIBRARY",
				"LN",
			//	"MAX",isInteger(String type)
			//	"MIN",
	  			"MOD",
			//	"NDX",
			 //	"NAME",
	  		//	"NEW",
				"NOT",
				"OF",
			//	"OPERATOR",
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
				"PURE",
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
				"VIRTUAL",
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
         if (debug) System.out.print("have("+symbol.toLowerCase() +")? it is "+text.toLowerCase()+"\n");
	 if (text.equals(symbol) || text.toLowerCase().equals(symbol.toLowerCase())){
			if (token == TT_WORD)theId = theString;
				nextsymbol();
				return true;
	 }
	  return have(tokenOf(symbol));
	}
	/** if not symbol give error*/
	public void mustbe(int symbol)throws SyntaxError
	{
		if (!have(symbol))
 		throw new SyntaxError("Error  ("+totext(token)+") found when symbol  "+
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
	public boolean peek(String match){
	//if (text.equals(match) || text.toLowerCase().equals(match.toLowerCase())){
	//	return true;
	//	}
	return peek(tokenOf(match));
	}
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
	private java.io.BufferedReader yy_reader;
	private int yy_buffer_index;
	private int yy_buffer_read;
	private int yy_buffer_start;
	private int yy_buffer_end;
	private char yy_buffer[];
	private int yychar;
	private int yyline;
	private boolean yy_at_bol;
	private int yy_lexical_state;

	Yylex (java.io.Reader reader) {
		this ();
		if (null == reader) {
			throw (new Error("Error: Bad input stream initializer."));
		}
		yy_reader = new java.io.BufferedReader(reader);
	}

	Yylex (java.io.InputStream instream) {
		this ();
		if (null == instream) {
			throw (new Error("Error: Bad input stream initializer."));
		}
		yy_reader = new java.io.BufferedReader(new java.io.InputStreamReader(instream));
	}

	private Yylex () {
		yy_buffer = new char[YY_BUFFER_SIZE];
		yy_buffer_read = 0;
		yy_buffer_index = 0;
		yy_buffer_start = 0;
		yy_buffer_end = 0;
		yychar = 0;
		yyline = 0;
		yy_at_bol = true;
		yy_lexical_state = YYINITIAL;

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
	}

	private boolean yy_eof_done = false;
	private final int SKIP = 3;
	private final int YYINITIAL = 0;
	private final int COMMENT = 2;
	private final int STRSTAT = 1;
	private final int yy_state_dtrans[] = {
		0,
		229,
		150,
		243
	};
	private void yybegin (int state) {
		yy_lexical_state = state;
	}
	private int yy_advance ()
		throws java.io.IOException {
		int next_read;
		int i;
		int j;

		if (yy_buffer_index < yy_buffer_read) {
			return yy_buffer[yy_buffer_index++];
		}

		if (0 != yy_buffer_start) {
			i = yy_buffer_start;
			j = 0;
			while (i < yy_buffer_read) {
				yy_buffer[j] = yy_buffer[i];
				++i;
				++j;
			}
			yy_buffer_end = yy_buffer_end - yy_buffer_start;
			yy_buffer_start = 0;
			yy_buffer_read = j;
			yy_buffer_index = j;
			next_read = yy_reader.read(yy_buffer,
					yy_buffer_read,
					yy_buffer.length - yy_buffer_read);
			if (-1 == next_read) {
				return YY_EOF;
			}
			yy_buffer_read = yy_buffer_read + next_read;
		}

		while (yy_buffer_index >= yy_buffer_read) {
			if (yy_buffer_index >= yy_buffer.length) {
				yy_buffer = yy_double(yy_buffer);
			}
			next_read = yy_reader.read(yy_buffer,
					yy_buffer_read,
					yy_buffer.length - yy_buffer_read);
			if (-1 == next_read) {
				return YY_EOF;
			}
			yy_buffer_read = yy_buffer_read + next_read;
		}
		return yy_buffer[yy_buffer_index++];
	}
	private void yy_move_end () {
		if (yy_buffer_end > yy_buffer_start &&
		    '\n' == yy_buffer[yy_buffer_end-1])
			yy_buffer_end--;
		if (yy_buffer_end > yy_buffer_start &&
		    '\r' == yy_buffer[yy_buffer_end-1])
			yy_buffer_end--;
	}
	private boolean yy_last_was_cr=false;
	private void yy_mark_start () {
		int i;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i) {
			if ('\n' == yy_buffer[i] && !yy_last_was_cr) {
				++yyline;
			}
			if ('\r' == yy_buffer[i]) {
				++yyline;
				yy_last_was_cr=true;
			} else yy_last_was_cr=false;
		}
		yychar = yychar
			+ yy_buffer_index - yy_buffer_start;
		yy_buffer_start = yy_buffer_index;
	}
	private void yy_mark_end () {
		yy_buffer_end = yy_buffer_index;
	}
	private void yy_to_mark () {
		yy_buffer_index = yy_buffer_end;
		yy_at_bol = (yy_buffer_end > yy_buffer_start) &&
		            ('\r' == yy_buffer[yy_buffer_end-1] ||
		             '\n' == yy_buffer[yy_buffer_end-1] ||
		             2028/*LS*/ == yy_buffer[yy_buffer_end-1] ||
		             2029/*PS*/ == yy_buffer[yy_buffer_end-1]);
	}
	private java.lang.String yytext () {
		return (new java.lang.String(yy_buffer,
			yy_buffer_start,
			yy_buffer_end - yy_buffer_start));
	}
	private int yylength () {
		return yy_buffer_end - yy_buffer_start;
	}
	private char[] yy_double (char buf[]) {
		int i;
		char newbuf[];
		newbuf = new char[2*buf.length];
		for (i = 0; i < buf.length; ++i) {
			newbuf[i] = buf[i];
		}
		return newbuf;
	}
	private final int YY_E_INTERNAL = 0;
	private final int YY_E_MATCH = 1;
	private java.lang.String yy_error_string[] = {
		"Error: Internal error.\n",
		"Error: Unmatched input.\n"
	};
	private void yy_error (int code,boolean fatal) {
		java.lang.System.out.print(yy_error_string[code]);
		java.lang.System.out.flush();
		if (fatal) {
			throw new Error("Fatal Error.\n");
		}
	}
	private int[][] unpackFromString(int size1, int size2, String st) {
		int colonIndex = -1;
		String lengthString;
		int sequenceLength = 0;
		int sequenceInteger = 0;

		int commaIndex;
		String workString;

		int res[][] = new int[size1][size2];
		for (int i= 0; i < size1; i++) {
			for (int j= 0; j < size2; j++) {
				if (sequenceLength != 0) {
					res[i][j] = sequenceInteger;
					sequenceLength--;
					continue;
				}
				commaIndex = st.indexOf(',');
				workString = (commaIndex==-1) ? st :
					st.substring(0, commaIndex);
				st = st.substring(commaIndex+1);
				colonIndex = workString.indexOf(':');
				if (colonIndex == -1) {
					res[i][j]=Integer.parseInt(workString);
					continue;
				}
				lengthString =
					workString.substring(colonIndex+1);
				sequenceLength=Integer.parseInt(lengthString);
				workString=workString.substring(0,colonIndex);
				sequenceInteger=Integer.parseInt(workString);
				res[i][j] = sequenceInteger;
				sequenceLength--;
			}
		}
		return res;
	}
	private int yy_acpt[] = {
		/* 0 */ YY_NOT_ACCEPT,
		/* 1 */ YY_NO_ANCHOR,
		/* 2 */ YY_NO_ANCHOR,
		/* 3 */ YY_NO_ANCHOR,
		/* 4 */ YY_NO_ANCHOR,
		/* 5 */ YY_NO_ANCHOR,
		/* 6 */ YY_NO_ANCHOR,
		/* 7 */ YY_NO_ANCHOR,
		/* 8 */ YY_NO_ANCHOR,
		/* 9 */ YY_NO_ANCHOR,
		/* 10 */ YY_NO_ANCHOR,
		/* 11 */ YY_NO_ANCHOR,
		/* 12 */ YY_NO_ANCHOR,
		/* 13 */ YY_NO_ANCHOR,
		/* 14 */ YY_NO_ANCHOR,
		/* 15 */ YY_NO_ANCHOR,
		/* 16 */ YY_NO_ANCHOR,
		/* 17 */ YY_NO_ANCHOR,
		/* 18 */ YY_NO_ANCHOR,
		/* 19 */ YY_NO_ANCHOR,
		/* 20 */ YY_NO_ANCHOR,
		/* 21 */ YY_NO_ANCHOR,
		/* 22 */ YY_NO_ANCHOR,
		/* 23 */ YY_NO_ANCHOR,
		/* 24 */ YY_NO_ANCHOR,
		/* 25 */ YY_NO_ANCHOR,
		/* 26 */ YY_NO_ANCHOR,
		/* 27 */ YY_NO_ANCHOR,
		/* 28 */ YY_NO_ANCHOR,
		/* 29 */ YY_NO_ANCHOR,
		/* 30 */ YY_NO_ANCHOR,
		/* 31 */ YY_NO_ANCHOR,
		/* 32 */ YY_NO_ANCHOR,
		/* 33 */ YY_NO_ANCHOR,
		/* 34 */ YY_NO_ANCHOR,
		/* 35 */ YY_NO_ANCHOR,
		/* 36 */ YY_NO_ANCHOR,
		/* 37 */ YY_NO_ANCHOR,
		/* 38 */ YY_NO_ANCHOR,
		/* 39 */ YY_NO_ANCHOR,
		/* 40 */ YY_NO_ANCHOR,
		/* 41 */ YY_NO_ANCHOR,
		/* 42 */ YY_NO_ANCHOR,
		/* 43 */ YY_NO_ANCHOR,
		/* 44 */ YY_NO_ANCHOR,
		/* 45 */ YY_NO_ANCHOR,
		/* 46 */ YY_NO_ANCHOR,
		/* 47 */ YY_NO_ANCHOR,
		/* 48 */ YY_NO_ANCHOR,
		/* 49 */ YY_NO_ANCHOR,
		/* 50 */ YY_NO_ANCHOR,
		/* 51 */ YY_NO_ANCHOR,
		/* 52 */ YY_NO_ANCHOR,
		/* 53 */ YY_NO_ANCHOR,
		/* 54 */ YY_NO_ANCHOR,
		/* 55 */ YY_NO_ANCHOR,
		/* 56 */ YY_NO_ANCHOR,
		/* 57 */ YY_NO_ANCHOR,
		/* 58 */ YY_NO_ANCHOR,
		/* 59 */ YY_NO_ANCHOR,
		/* 60 */ YY_NO_ANCHOR,
		/* 61 */ YY_NO_ANCHOR,
		/* 62 */ YY_NO_ANCHOR,
		/* 63 */ YY_NO_ANCHOR,
		/* 64 */ YY_NO_ANCHOR,
		/* 65 */ YY_NO_ANCHOR,
		/* 66 */ YY_NO_ANCHOR,
		/* 67 */ YY_NO_ANCHOR,
		/* 68 */ YY_NO_ANCHOR,
		/* 69 */ YY_NO_ANCHOR,
		/* 70 */ YY_NO_ANCHOR,
		/* 71 */ YY_NO_ANCHOR,
		/* 72 */ YY_NO_ANCHOR,
		/* 73 */ YY_NO_ANCHOR,
		/* 74 */ YY_NO_ANCHOR,
		/* 75 */ YY_NO_ANCHOR,
		/* 76 */ YY_NO_ANCHOR,
		/* 77 */ YY_NO_ANCHOR,
		/* 78 */ YY_NO_ANCHOR,
		/* 79 */ YY_NO_ANCHOR,
		/* 80 */ YY_NO_ANCHOR,
		/* 81 */ YY_NO_ANCHOR,
		/* 82 */ YY_NO_ANCHOR,
		/* 83 */ YY_NO_ANCHOR,
		/* 84 */ YY_NO_ANCHOR,
		/* 85 */ YY_NO_ANCHOR,
		/* 86 */ YY_NO_ANCHOR,
		/* 87 */ YY_NO_ANCHOR,
		/* 88 */ YY_NO_ANCHOR,
		/* 89 */ YY_NO_ANCHOR,
		/* 90 */ YY_NO_ANCHOR,
		/* 91 */ YY_NO_ANCHOR,
		/* 92 */ YY_NO_ANCHOR,
		/* 93 */ YY_NO_ANCHOR,
		/* 94 */ YY_NO_ANCHOR,
		/* 95 */ YY_NO_ANCHOR,
		/* 96 */ YY_NO_ANCHOR,
		/* 97 */ YY_NO_ANCHOR,
		/* 98 */ YY_NO_ANCHOR,
		/* 99 */ YY_NO_ANCHOR,
		/* 100 */ YY_NO_ANCHOR,
		/* 101 */ YY_NO_ANCHOR,
		/* 102 */ YY_NO_ANCHOR,
		/* 103 */ YY_NO_ANCHOR,
		/* 104 */ YY_NO_ANCHOR,
		/* 105 */ YY_NO_ANCHOR,
		/* 106 */ YY_NO_ANCHOR,
		/* 107 */ YY_NO_ANCHOR,
		/* 108 */ YY_NO_ANCHOR,
		/* 109 */ YY_NO_ANCHOR,
		/* 110 */ YY_NO_ANCHOR,
		/* 111 */ YY_NO_ANCHOR,
		/* 112 */ YY_NO_ANCHOR,
		/* 113 */ YY_NO_ANCHOR,
		/* 114 */ YY_NO_ANCHOR,
		/* 115 */ YY_NO_ANCHOR,
		/* 116 */ YY_NO_ANCHOR,
		/* 117 */ YY_NO_ANCHOR,
		/* 118 */ YY_NO_ANCHOR,
		/* 119 */ YY_NO_ANCHOR,
		/* 120 */ YY_NO_ANCHOR,
		/* 121 */ YY_NO_ANCHOR,
		/* 122 */ YY_NO_ANCHOR,
		/* 123 */ YY_NO_ANCHOR,
		/* 124 */ YY_NO_ANCHOR,
		/* 125 */ YY_NO_ANCHOR,
		/* 126 */ YY_NO_ANCHOR,
		/* 127 */ YY_NO_ANCHOR,
		/* 128 */ YY_NO_ANCHOR,
		/* 129 */ YY_NO_ANCHOR,
		/* 130 */ YY_NO_ANCHOR,
		/* 131 */ YY_NO_ANCHOR,
		/* 132 */ YY_NO_ANCHOR,
		/* 133 */ YY_NO_ANCHOR,
		/* 134 */ YY_NO_ANCHOR,
		/* 135 */ YY_NO_ANCHOR,
		/* 136 */ YY_NO_ANCHOR,
		/* 137 */ YY_NO_ANCHOR,
		/* 138 */ YY_NO_ANCHOR,
		/* 139 */ YY_NO_ANCHOR,
		/* 140 */ YY_NO_ANCHOR,
		/* 141 */ YY_NO_ANCHOR,
		/* 142 */ YY_NO_ANCHOR,
		/* 143 */ YY_NO_ANCHOR,
		/* 144 */ YY_NO_ANCHOR,
		/* 145 */ YY_NO_ANCHOR,
		/* 146 */ YY_NO_ANCHOR,
		/* 147 */ YY_NO_ANCHOR,
		/* 148 */ YY_NO_ANCHOR,
		/* 149 */ YY_NO_ANCHOR,
		/* 150 */ YY_NO_ANCHOR,
		/* 151 */ YY_NO_ANCHOR,
		/* 152 */ YY_NO_ANCHOR,
		/* 153 */ YY_NO_ANCHOR,
		/* 154 */ YY_NO_ANCHOR,
		/* 155 */ YY_NOT_ACCEPT,
		/* 156 */ YY_NO_ANCHOR,
		/* 157 */ YY_NO_ANCHOR,
		/* 158 */ YY_NO_ANCHOR,
		/* 159 */ YY_NO_ANCHOR,
		/* 160 */ YY_NO_ANCHOR,
		/* 161 */ YY_NO_ANCHOR,
		/* 162 */ YY_NOT_ACCEPT,
		/* 163 */ YY_NO_ANCHOR,
		/* 164 */ YY_NO_ANCHOR,
		/* 165 */ YY_NO_ANCHOR,
		/* 166 */ YY_NO_ANCHOR,
		/* 167 */ YY_NOT_ACCEPT,
		/* 168 */ YY_NO_ANCHOR,
		/* 169 */ YY_NO_ANCHOR,
		/* 170 */ YY_NO_ANCHOR,
		/* 171 */ YY_NOT_ACCEPT,
		/* 172 */ YY_NO_ANCHOR,
		/* 173 */ YY_NOT_ACCEPT,
		/* 174 */ YY_NO_ANCHOR,
		/* 175 */ YY_NOT_ACCEPT,
		/* 176 */ YY_NO_ANCHOR,
		/* 177 */ YY_NOT_ACCEPT,
		/* 178 */ YY_NO_ANCHOR,
		/* 179 */ YY_NOT_ACCEPT,
		/* 180 */ YY_NO_ANCHOR,
		/* 181 */ YY_NOT_ACCEPT,
		/* 182 */ YY_NO_ANCHOR,
		/* 183 */ YY_NOT_ACCEPT,
		/* 184 */ YY_NO_ANCHOR,
		/* 185 */ YY_NOT_ACCEPT,
		/* 186 */ YY_NO_ANCHOR,
		/* 187 */ YY_NOT_ACCEPT,
		/* 188 */ YY_NO_ANCHOR,
		/* 189 */ YY_NOT_ACCEPT,
		/* 190 */ YY_NO_ANCHOR,
		/* 191 */ YY_NOT_ACCEPT,
		/* 192 */ YY_NO_ANCHOR,
		/* 193 */ YY_NOT_ACCEPT,
		/* 194 */ YY_NO_ANCHOR,
		/* 195 */ YY_NOT_ACCEPT,
		/* 196 */ YY_NO_ANCHOR,
		/* 197 */ YY_NOT_ACCEPT,
		/* 198 */ YY_NO_ANCHOR,
		/* 199 */ YY_NOT_ACCEPT,
		/* 200 */ YY_NO_ANCHOR,
		/* 201 */ YY_NOT_ACCEPT,
		/* 202 */ YY_NO_ANCHOR,
		/* 203 */ YY_NOT_ACCEPT,
		/* 204 */ YY_NO_ANCHOR,
		/* 205 */ YY_NOT_ACCEPT,
		/* 206 */ YY_NO_ANCHOR,
		/* 207 */ YY_NOT_ACCEPT,
		/* 208 */ YY_NO_ANCHOR,
		/* 209 */ YY_NOT_ACCEPT,
		/* 210 */ YY_NO_ANCHOR,
		/* 211 */ YY_NOT_ACCEPT,
		/* 212 */ YY_NO_ANCHOR,
		/* 213 */ YY_NOT_ACCEPT,
		/* 214 */ YY_NO_ANCHOR,
		/* 215 */ YY_NOT_ACCEPT,
		/* 216 */ YY_NO_ANCHOR,
		/* 217 */ YY_NOT_ACCEPT,
		/* 218 */ YY_NO_ANCHOR,
		/* 219 */ YY_NOT_ACCEPT,
		/* 220 */ YY_NO_ANCHOR,
		/* 221 */ YY_NOT_ACCEPT,
		/* 222 */ YY_NO_ANCHOR,
		/* 223 */ YY_NOT_ACCEPT,
		/* 224 */ YY_NO_ANCHOR,
		/* 225 */ YY_NOT_ACCEPT,
		/* 226 */ YY_NO_ANCHOR,
		/* 227 */ YY_NOT_ACCEPT,
		/* 228 */ YY_NO_ANCHOR,
		/* 229 */ YY_NOT_ACCEPT,
		/* 230 */ YY_NO_ANCHOR,
		/* 231 */ YY_NOT_ACCEPT,
		/* 232 */ YY_NO_ANCHOR,
		/* 233 */ YY_NOT_ACCEPT,
		/* 234 */ YY_NO_ANCHOR,
		/* 235 */ YY_NOT_ACCEPT,
		/* 236 */ YY_NO_ANCHOR,
		/* 237 */ YY_NOT_ACCEPT,
		/* 238 */ YY_NO_ANCHOR,
		/* 239 */ YY_NOT_ACCEPT,
		/* 240 */ YY_NO_ANCHOR,
		/* 241 */ YY_NOT_ACCEPT,
		/* 242 */ YY_NO_ANCHOR,
		/* 243 */ YY_NOT_ACCEPT,
		/* 244 */ YY_NO_ANCHOR,
		/* 245 */ YY_NOT_ACCEPT,
		/* 246 */ YY_NO_ANCHOR,
		/* 247 */ YY_NOT_ACCEPT,
		/* 248 */ YY_NO_ANCHOR,
		/* 249 */ YY_NO_ANCHOR,
		/* 250 */ YY_NO_ANCHOR,
		/* 251 */ YY_NO_ANCHOR,
		/* 252 */ YY_NO_ANCHOR,
		/* 253 */ YY_NO_ANCHOR,
		/* 254 */ YY_NO_ANCHOR,
		/* 255 */ YY_NO_ANCHOR,
		/* 256 */ YY_NO_ANCHOR,
		/* 257 */ YY_NO_ANCHOR,
		/* 258 */ YY_NO_ANCHOR,
		/* 259 */ YY_NO_ANCHOR,
		/* 260 */ YY_NO_ANCHOR,
		/* 261 */ YY_NOT_ACCEPT,
		/* 262 */ YY_NO_ANCHOR,
		/* 263 */ YY_NO_ANCHOR,
		/* 264 */ YY_NOT_ACCEPT,
		/* 265 */ YY_NO_ANCHOR,
		/* 266 */ YY_NO_ANCHOR,
		/* 267 */ YY_NOT_ACCEPT,
		/* 268 */ YY_NO_ANCHOR,
		/* 269 */ YY_NO_ANCHOR,
		/* 270 */ YY_NOT_ACCEPT,
		/* 271 */ YY_NO_ANCHOR,
		/* 272 */ YY_NOT_ACCEPT,
		/* 273 */ YY_NO_ANCHOR,
		/* 274 */ YY_NOT_ACCEPT,
		/* 275 */ YY_NO_ANCHOR,
		/* 276 */ YY_NOT_ACCEPT,
		/* 277 */ YY_NO_ANCHOR,
		/* 278 */ YY_NOT_ACCEPT,
		/* 279 */ YY_NO_ANCHOR,
		/* 280 */ YY_NOT_ACCEPT,
		/* 281 */ YY_NO_ANCHOR,
		/* 282 */ YY_NOT_ACCEPT,
		/* 283 */ YY_NOT_ACCEPT,
		/* 284 */ YY_NOT_ACCEPT,
		/* 285 */ YY_NOT_ACCEPT,
		/* 286 */ YY_NOT_ACCEPT,
		/* 287 */ YY_NOT_ACCEPT,
		/* 288 */ YY_NOT_ACCEPT,
		/* 289 */ YY_NO_ANCHOR,
		/* 290 */ YY_NOT_ACCEPT,
		/* 291 */ YY_NO_ANCHOR,
		/* 292 */ YY_NOT_ACCEPT,
		/* 293 */ YY_NO_ANCHOR,
		/* 294 */ YY_NOT_ACCEPT,
		/* 295 */ YY_NOT_ACCEPT,
		/* 296 */ YY_NOT_ACCEPT,
		/* 297 */ YY_NOT_ACCEPT,
		/* 298 */ YY_NOT_ACCEPT,
		/* 299 */ YY_NOT_ACCEPT,
		/* 300 */ YY_NOT_ACCEPT,
		/* 301 */ YY_NOT_ACCEPT,
		/* 302 */ YY_NOT_ACCEPT,
		/* 303 */ YY_NOT_ACCEPT,
		/* 304 */ YY_NOT_ACCEPT,
		/* 305 */ YY_NOT_ACCEPT,
		/* 306 */ YY_NOT_ACCEPT,
		/* 307 */ YY_NOT_ACCEPT,
		/* 308 */ YY_NOT_ACCEPT,
		/* 309 */ YY_NOT_ACCEPT,
		/* 310 */ YY_NOT_ACCEPT,
		/* 311 */ YY_NOT_ACCEPT,
		/* 312 */ YY_NOT_ACCEPT,
		/* 313 */ YY_NOT_ACCEPT,
		/* 314 */ YY_NOT_ACCEPT,
		/* 315 */ YY_NOT_ACCEPT,
		/* 316 */ YY_NOT_ACCEPT,
		/* 317 */ YY_NOT_ACCEPT,
		/* 318 */ YY_NOT_ACCEPT,
		/* 319 */ YY_NOT_ACCEPT,
		/* 320 */ YY_NOT_ACCEPT,
		/* 321 */ YY_NOT_ACCEPT,
		/* 322 */ YY_NOT_ACCEPT,
		/* 323 */ YY_NOT_ACCEPT,
		/* 324 */ YY_NOT_ACCEPT,
		/* 325 */ YY_NOT_ACCEPT
	};
	private int yy_cmap[] = unpackFromString(1,65538,
"13:9,4,2,13:2,3,13:18,1,28,13,175,6,116,13,59,22,11,12,26,45,27,34,23,21:10" +
",35,41,49,36,46,13,38,8,52,56,18,15,7,20:2,19,20,55,10,51,17,20,53,20,54,16" +
",9,57,20:5,43,40,44,42,20,13,8,52,56,18,15,7,20:2,19,20,55,10,51,17,20,53,2" +
"0,54,16,9,57,20:5,5,58,14,13:46,121,13:42,39,13:31,32,13:665,20:25,13:7,20:" +
"17,13,20:7,13:70,20:64,13:7488,37,13:119,33,13:6,30,13,29,13:8,31,13:12,24," +
"25,13:55,50,13:3,48,47,13:269,107,13:929,39,13:2347,20:84,13:12,20:90,13:74" +
"29,20:8,83,20:5,167,20:27,72,20:7,154,20:21,158,20:75,144,20:57,98,20:39,97" +
",20:86,149,20:11,77,20:37,173,20:93,134,20:94,62,20:146,71,20:115,171,20:33" +
",145,20:51,169,20:96,90,20:2,99,20:9,156,20:15,127,20,88,20:10,79,20:11,159" +
",20:28,129,20:263,170,20:130,162,20:10,106,20:15,150,20:20,147,20:4,117,155" +
",20:23,87,20:692,142,20:84,63,20:15,64,20:74,166,20:385,141,20:8,91,20:16,1" +
"14,20:90,101,20:72,68,20:395,69,20:70,103,20:90,61,20:7,124,20:13,115,20:47" +
"0,148,20:81,75,20:9,128,20:76,133,20:3,110,20:18,153,20:83,120,20:5,67,20:3" +
"7,78,20:44,168,20,139,20:84,81,20:761,135,20:189,163,20:47,126,20:18,105,20" +
":458,65,20:22,96,20:37,80,20:2,119,20:335,113,20:94,86,20:60,102,20:106,108" +
",20:64,73,20:794,151,20:1490,112,20:632,82,104,20:375,174,20:347,93,20:111," +
"172,20:42,164,20:720,118,20:10,130,20:15,132,20:282,74,20:87,109,20:24,123," +
"20:227,165,20:584,66,20:14,85,20:9,60,20:780,111,20:8,84,20:25,143,20:1598," +
"137,20:120,125,20:746,138,20:62,95,20:11,136,20:481,160,20:21,100,20:376,70" +
",20:99,122,20:10,131,20:36,89,20:162,157,20:68,92,20:228,140,20,76,20:868,9" +
"4,20:74,152,20:181,161,20:144,146,20:2361,13:24576,0:2")[0];

	private int yy_rmap[] = unpackFromString(1,326,
"0,1:2,2,3,1,4,5,6,7,1:2,8,9,1:6,10,11,1:10,12,1:2,13,1,3:2,1,3,1:2,3,14,3:5" +
",15,1,16,1,17,18,1:8,19,3:46,20,21,22,3:10,23,24,17,3:3,1:7,25,1:3,26,27,1," +
"28,1:5,29,1:4,30,16,31,28,32,33,34,35,1,36,37,38,39,40,41,42,22,43,40,44,23" +
",45,24,46,17,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67" +
",68,69,70,71,26,72,27,73,74,75,76,77,78,79,80,81,82,83,28,84,85,86,87,88,89" +
",90,91,92,93,94,42,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,1" +
"10,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128," +
"129,130,32,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146," +
"147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165" +
",166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,18" +
"4,185,186,187")[0];

	private int yy_nxt[][] = unpackFromString(188,176,
"1,2:4,3,156,4:4,5,6,163:2,4:6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22," +
"23,24,25,26,27,28,29,30,31,32,33,34,35,36,4:7,163,168,260,4:2,157,4,164,4,1" +
"69,4,172,4,263,174,4:2,176,4,178,4,180,4,182,4,184,4,186,4,188,4,190,4,266," +
"4,37,192,4,194,4,38,196,198,200,4,202,4,204,4,39,206,4,40,289,4,269,4:2,41," +
"208,4,210,4,42,271,4,212,4,214,4,43,216,4,218,220,4,222,4,44,4,224,4,226,4," +
"291,4:3,228,4,273,4,275,230,232,4,45,234,4,236,4,46,293,4,238,4,47,240,4,48" +
",49,50,242,4,244,246,4,163,-1:177,155:5,290,155:7,51,155:161,-1:7,4:4,-1:4," +
"4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:53,-1:13,53,-1:178,162,-1:5,7,-1" +
":12,167,-1:140,171,-1:12,54,-1:186,55,-1:187,56,-1:175,57,-1:174,58,-1:177," +
"59,-1:175,60,-1:12,61,-1:162,62,-1:9,63,-1:136,4:4,-1:4,4:7,-1:29,4:7,-1:2," +
"4:47,-1,4:8,-1,4:4,-1,4:15,96,4:37,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1" +
",4:8,-1,4:4,-1,4:15,107,4:37,-1:8,52:2,-1:6,52,-1:2,52,-1:2,52,-1:30,52,-1:" +
"3,52,-1:120,179,-1:2,179:8,181,179:163,-1,55,-1,55:173,-1:59,173,-1:137,111" +
",-1:169,197,-1:5,112,-1:161,113:4,-1:4,113:7,-1:29,113:7,-1:2,113:47,-1,113" +
":8,-1,113:4,-1,113:53,-1:22,124,-1:175,125,-1:175,137,-1:175,141,-1:175,142" +
",-1:155,219:11,221,219,144,219:161,1,160:4,262,160:6,233,160:9,265,160:153," +
"-1,155:13,51,155:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:4,65,4:42,-1,4:8,-1" +
",4:4,-1,4:53,-1:2,268,160:2,268:8,241,268:163,-1,160:11,235,160:163,-1,155:" +
"5,320,155:7,51,155:161,-1:21,111,-1:4,175,177,-1:155,4:4,-1:4,4:7,-1:29,4:7" +
",-1:2,4:6,66,4:40,-1,4:8,-1,4:4,-1,4:53,-1:2,268,160:2,268:7,159,241,268:16" +
"3,-1,152:10,-1,152:164,-1:21,112,-1:155,173:58,64,173:116,-1:7,4:4,-1:4,4:7" +
",-1:29,4:7,-1:2,4:8,67,4:38,-1,4:8,-1,4:4,-1,4:53,-1:13,179,-1:170,4:4,-1:4" +
",4:7,-1:29,4:7,-1:2,4:10,249,4:3,68,4:32,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:" +
"4,4:7,-1:29,4:7,-1:2,4:13,69,4:33,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-" +
"1:29,4:7,-1:2,4:16,70,4:30,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:29,4:" +
"7,-1:2,4:18,71,4:28,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2," +
"4:20,72,4:26,-1,4:8,-1,4:4,-1,4:53,-1:2,179,-1:2,179:7,126,181,179:163,-1:7" +
",4:4,-1:4,4:7,-1:29,4:7,-1:2,4:22,73,4:24,-1,4:8,-1,4:4,-1,4:53,-1:2,183:13" +
",130,183:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:24,74,4:22,-1,4:8,-1,4:4,-1" +
",4:53,-1:2,185:13,131,185:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:26,75,4:20" +
",-1,4:8,-1,4:4,-1,4:53,-1:2,187:13,132,187:161,-1:7,4:4,-1:4,4:7,-1:29,4:7," +
"-1:2,4:5,76,4:22,77,4:18,-1,4:8,-1,4:4,-1,4:53,-1:2,189:13,133,189:161,-1:7" +
",4:4,-1:4,4:7,-1:29,4:7,-1:2,4:30,78,4:16,-1,4:8,-1,4:4,-1,4:53,-1:2,191:13" +
",134,191:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:35,79,4:11,-1,4:8,-1,4:4,-1" +
",4:53,-1:2,193:13,135,193:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:37,80,4:9," +
"-1,4:8,-1,4:4,-1,4:53,-1:2,195:13,136,195:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-" +
"1:2,4:5,81,4:41,-1,4:8,-1,4:4,-1,4:53,-1:22,137,-1:4,205,207,-1:155,4:4,-1:" +
"4,4:7,-1:29,4:7,-1:2,4:10,82,4:36,-1,4:8,-1,4:4,-1,4:53,-1:2,199:13,138,199" +
":161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:42,83,4:4,-1,4:8,-1,4:4,-1,4:53,-1:" +
"2,201:13,139,201:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:5,84,4:38,85,4:2,-1" +
",4:8,-1,4:4,-1,4:53,-1:2,203:13,140,203:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:" +
"2,4:46,86,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4," +
"87,4:6,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4,88," +
"4:2,-1,4:53,-1:2,155:13,143,155:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-" +
"1,4:8,-1,4:3,89,-1,4:53,-1:2,211:11,213,211,144,211:161,-1:7,4:4,-1:4,4:7,-" +
"1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:3,90,4:49,-1:2,211:10,155,211:2,158,2" +
"11:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:5,91,4:47,-" +
"1:2,215:13,145,215:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4," +
"-1,4:8,92,4:44,-1:2,217:13,146,217:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:4" +
"7,-1,4:8,-1,4:4,-1,4:10,93,4:42,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:" +
"8,-1,4:4,-1,4:11,94,4:41,-1:2,219:10,-1,219:164,-1:7,4:4,-1:4,4:7,-1:29,4:7" +
",-1:2,4:47,-1,4:8,-1,4:4,-1,4:13,95,4:39,-1:2,223:13,147,223:161,-1:7,4:4,-" +
"1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:17,97,4:35,-1:2,225:13,148,2" +
"25:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:19,98,4:33," +
"-1:2,227:13,149,227:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4" +
",-1,4:25,99,4:27,-1,1,-1:4,155,-1:16,231,-1:160,4:4,-1:4,4:7,-1:29,4:7,-1:2" +
",4:18,100,4:28,-1,4:8,-1,4:4,-1,4:34,101,4:18,-1:8,4:4,-1:4,4:7,-1:29,4:7,-" +
"1:2,4:47,-1,4:8,-1,4:4,-1,4:31,102,4:21,-1:2,160:10,151,160:164,-1:7,4:4,-1" +
":4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:8,103,4:44,-1:2,160:10,-1,160" +
":164,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:36,104,4:16,-" +
"1:2,262:10,155,262:2,160,262:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:16,105," +
"4:30,-1,4:8,-1,4:4,-1,4:53,-1:2,268,160:2,268:7,179,165,268:163,-1:7,4:4,-1" +
":4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:44,106,4:8,-1:2,268,160:2,268" +
":7,126,165,268:163,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4" +
":49,108,4:3,-1,1,152:4,161,152:6,166,152:9,170,152:153,-1:7,4:4,-1:4,4:7,-1" +
":29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:37,109,4:15,-1:2,155:13,153,155:161,-1" +
":7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:52,110,-1:2,247:13,1" +
"54,247:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:2,114,4:44,-1,4:8,-1,4:4,-1,4" +
":53,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:5,115,4:5,116,4:35,-1,4:8,-1,4:4,-1," +
"4:53,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:9,117,4:37,-1,4:8,-1,4:4,-1,4:53,-1" +
":8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:33,118,4:13,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4" +
",-1:4,4:7,-1:29,4:7,-1:2,4:2,119,4:44,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4" +
":7,-1:29,4:7,-1:2,4:2,120,4:44,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:2" +
"9,4:7,-1:2,4:14,121,4:32,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:29,4:7," +
"-1:2,4:47,-1,4:8,-1,4:4,-1,4:8,122,4:44,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:" +
"47,-1,4:8,-1,4:4,-1,4:8,123,4:44,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:5,127,4" +
":41,-1,4:8,-1,4:4,-1,4:53,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4" +
":4,-1,4:23,128,4:29,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1," +
"4:41,129,4:11,-1:8,4:4,-1:4,4:7,-1:29,4:7,-1:2,4,248,4:45,-1,4:8,-1,4:4,-1," +
"4:53,-1:2,183,155:12,51,155:4,324,155:156,-1,262:11,237,262,160,262:161,-1:" +
"7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:10,250,4:36,-1,4:8,-1,4:4,-1,4:53,-1:2,185," +
"155:5,316,155:6,51,155:2,325,155:158,-1,160:11,239,160:163,-1:7,4:4,-1:4,4:" +
"7,-1:29,4:7,-1:2,4:32,251,4:14,-1,4:8,-1,4:4,-1,4:53,-1:2,155:13,51,155:11," +
"187,189,155:148,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:6,252,253,-1,4:4" +
",-1,4:53,-1:2,155:13,51,155:11,191,193,155:148,-1:7,4:4,-1:4,4:7,-1:29,4:7," +
"-1:2,4:47,-1,4:8,-1,4:4,-1,4,254,4:51,-1:2,195,155:12,51,155:161,-1:7,4:4,-" +
"1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:27,255,4:25,-1:2,155:13,51,1" +
"55:11,199,201,155:148,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-" +
"1,4:27,256,4:25,-1:2,155:13,51,155:39,203,155:121,-1:7,4:4,-1:4,4:7,-1:29,4" +
":7,-1:2,4,257,4:45,-1,4:8,-1,4:4,-1,4:53,-1:2,155:13,51,209,155:160,-1:7,4:" +
"4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:22,258,4:30,-1:2,155:9,21" +
"1,155:3,51,155:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4" +
":40,259,4:12,-1:2,155:13,51,215,155:160,-1,217,155:12,51,155:161,-1,223,155" +
":12,51,155:161,-1,225,155:12,51,155:161,-1,227,155:12,51,155:161,-1,155:13," +
"51,245,155:160,-1,155:6,247,155:6,51,155:161,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1" +
":2,4:47,-1,4:4,277,4:3,-1,4:4,-1,4:53,-1:2,155:6,313,155:2,261,155:3,51,304" +
",155:2,321,264,155:31,267,292,294,270,155,272,155,314,155:117,-1:7,4:4,-1:4" +
",4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:21,279,4:31,-1:2,155:13,51,155:" +
"38,274,155:122,-1:7,4:4,-1:4,4:7,-1:29,4:7,-1:2,4:47,-1,4:8,-1,4:4,-1,4:39," +
"281,4:13,-1:2,155:7,276,155:5,51,155:161,-1,155:13,51,155,278,155:159,-1,15" +
"5:7,280,155:5,51,155:161,-1,155:13,51,155:2,282,155:158,-1,155:6,283,155:6," +
"51,155:161,-1,155:6,284,155:6,51,155:161,-1,155:13,51,155:37,285,155:123,-1" +
",155:13,51,286,155:160,-1,155:13,51,155,287,155:159,-1,155:13,51,155:4,288," +
"155:156,-1,155:9,295,155:3,51,155:161,-1,155:8,296,155:4,51,155:161,-1,155:" +
"13,51,155:4,297,155:156,-1,155:13,51,298,155:160,-1,155:13,51,299,155:160,-" +
"1,155:13,51,155:4,300,155:156,-1,155:13,51,155:3,301,155:157,-1,155:9,302,1" +
"55:3,51,155:2,312,155:158,-1,155:13,51,155:3,303,155:157,-1,155:7,305,155:5" +
",51,155:161,-1,185,155:12,51,155:161,-1,155:6,306,155:6,51,155:161,-1,155:1" +
"3,51,155:2,317,307,155:157,-1,155:13,51,155:3,308,155:157,-1,155:9,309,155:" +
"3,51,155:161,-1,155:13,51,155:42,310,155:118,-1,155:13,51,311,155:160,-1,15" +
"5:13,51,315,155:160,-1,155:13,51,155:40,318,155:120,-1,155:9,319,155:3,51,1" +
"55:161,-1,155:13,51,155:2,322,155:158,-1,155:13,51,155:41,323,155:119");

	public int yylex ()
		throws java.io.IOException, 
SyntaxError

		{
		int yy_lookahead;
		int yy_anchor = YY_NO_ANCHOR;
		int yy_state = yy_state_dtrans[yy_lexical_state];
		int yy_next_state = YY_NO_STATE;
		int yy_last_accept_state = YY_NO_STATE;
		boolean yy_initial = true;
		int yy_this_accept;

		yy_mark_start();
		yy_this_accept = yy_acpt[yy_state];
		if (YY_NOT_ACCEPT != yy_this_accept) {
			yy_last_accept_state = yy_state;
			yy_mark_end();
		}
		while (true) {
			if (yy_initial && yy_at_bol) yy_lookahead = YY_BOL;
			else yy_lookahead = yy_advance();
			yy_next_state = YY_F;
			yy_next_state = yy_nxt[yy_rmap[yy_state]][yy_cmap[yy_lookahead]];
			if (YY_EOF == yy_lookahead && true == yy_initial) {
				return YYEOF;
			}
			if (YY_F != yy_next_state) {
				yy_state = yy_next_state;
				yy_initial = false;
				yy_this_accept = yy_acpt[yy_state];
				if (YY_NOT_ACCEPT != yy_this_accept) {
					yy_last_accept_state = yy_state;
					yy_mark_end();
				}
			}
			else {
				if (YY_NO_STATE == yy_last_accept_state) {
					throw (new Error("Lexical Error: Unmatched Input."));
				}
				else {
					yy_anchor = yy_acpt[yy_last_accept_state];
					if (0 != (YY_END & yy_anchor)) {
						yy_move_end();
					}
					yy_to_mark();
					switch (yy_last_accept_state) {
					case 1:
						
					case -2:
						break;
					case 2:
						{
		if(echo)System.out.print(yytext());
		 int i,j;
	     j=0;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i)if ('\n' == yy_buffer[i]  ) {
				j=1;
			}
		yy_mark_start();/* skip white space */
			if(j==1)yychar=0;
		}
					case -3:
						break;
					case 3:
						{System.out.println("Unmatched text <"+yytext()+"> line "+yyline);}
					case -4:
						break;
					case 4:
						{return TT_WORD;/* standard identifiers*/}
					case -5:
						break;
					case 5:
						{return (int) ')';}
					case -6:
						break;
					case 6:
						{return (int)'*';}
					case -7:
						break;
					case 7:
						{return TT_NUMBER;}
					case -8:
						break;
					case 8:
						{return (int) '(';}
					case -9:
						break;
					case 9:
						{return (int)'/';}
					case -10:
						break;
					case 10:
						{return (int) tokenOf("AND");}
					case -11:
						break;
					case 11:
						{return (int) tokenOf("OR");}
					case -12:
						break;
					case 12:
						{ return (int)'+';}
					case -13:
						break;
					case 13:
						{ return (int)'-';}
					case -14:
						break;
					case 14:
						{return (int)'!';}
					case -15:
						break;
					case 15:
						{ return TT_SUMATION;}
					case -16:
						break;
					case 16:
						{ return TT_PRODUCT;}
					case -17:
						break;
					case 17:
						{ return (int)tokenOf("SQRT");}
					case -18:
						break;
					case 18:
						{ return (int)tokenOf("DIV");}
					case -19:
						break;
					case 19:
						{ return (int)tokenOf("IN");}
					case -20:
						break;
					case 20:
						{return (int) '.';}
					case -21:
						break;
					case 21:
						{return (int) ':';}
					case -22:
						break;
					case 22:
						{return (int) '=';}
					case -23:
						break;
					case 23:
						{theString="\u2190";return TT_ASSIGN;}
					case -24:
						break;
					case 24:
						{return TT_ADDR;}
					case -25:
						break;
					case 25:
						{ return (int) '*';}
					case -26:
						break;
					case 26:
						{return (int)'\\';}
					case -27:
						break;
					case 27:
						{rangechecks=rcheck;return (int)';';}
					case -28:
						break;
					case 28:
						{return (int) '^';}
					case -29:
						break;
					case 29:
						{return (int) '[';}
					case -30:
						break;
					case 30:
						{return (int) ']';}
					case -31:
						break;
					case 31:
						{return (int) ',';}
					case -32:
						break;
					case 32:
						{return (int) '>';}
					case -33:
						break;
					case 33:
						{return TT_GE;}
					case -34:
						break;
					case 34:
						{return TT_LE;}
					case -35:
						break;
					case 35:
						{return (int) '<';}
					case -36:
						break;
					case 36:
						{return TT_NE;}
					case -37:
						break;
					case 37:
						{return (int) tokenOf("OF");}
					case -38:
						break;
					case 38:
						{return (int) tokenOf("FOR");}
					case -39:
						break;
					case 39:
						{return (int) tokenOf("IOTA");}
					case -40:
						break;
					case 40:
						{return (int) tokenOf("LIBRARY");}
					case -41:
						break;
					case 41:
						{return (int) tokenOf("MOD");}
					case -42:
						break;
					case 42:
						{return (int) tokenOf("NOT");}
					case -43:
						break;
					case 43:
						{return (int) tokenOf("POW");}
					case -44:
						break;
					case 44:
						{return (int) tokenOf("READ");}
					case -45:
						break;
					case 45:
						{return (int) tokenOf("STRING");}
					case -46:
						break;
					case 46:
						{return (int) tokenOf("TO");}
					case -47:
						break;
					case 47:
						{return (int) tokenOf("TRUE");}
					case -48:
						break;
					case 48:
						{return (int) tokenOf("WITH");}
					case -49:
						break;
					case 49:
						{return (int) tokenOf("WHILE");}
					case -50:
						break;
					case 50:
						{return (int) tokenOf("WRITE");}
					case -51:
						break;
					case 51:
						{/* skip comment */ }
					case -52:
						break;
					case 52:
						{return TT_NUMBER;}
					case -53:
						break;
					case 53:
						{return TT_EXP;}
					case -54:
						break;
					case 54:
						{ if(echo) System.out.print("(*");yybegin(COMMENT); comment_count = comment_count + 1; }
					case -55:
						break;
					case 55:
						{}
					case -56:
						break;
					case 56:
						{return TT_SATPLUS;}
					case -57:
						break;
					case 57:
						{return TT_SATMINUS;}
					case -58:
						break;
					case 58:
						{return TT_ELIPSIS;}
					case -59:
						break;
					case 59:
						{return TT_ASSIGN;}
					case -60:
						break;
					case 60:
						{return TT_GE;}
					case -61:
						break;
					case 61:
						{return TT_SETXOR;}
					case -62:
						break;
					case 62:
						{return TT_LE;}
					case -63:
						break;
					case 63:
						{return TT_NE;}
					case -64:
						break;
					case 64:
						{theString=yytext();return TT_STRING;}
					case -65:
						break;
					case 65:
						{return (int) tokenOf("ADDR");}
					case -66:
						break;
					case 66:
						{return (int) tokenOf("ARRAY");}
					case -67:
						break;
					case 67:
						{return (int) tokenOf("BEGIN");}
					case -68:
						break;
					case 68:
						{return (int) tokenOf("CHR");}
					case -69:
						break;
					case 69:
						{return (int) tokenOf("CASE");}
					case -70:
						break;
					case 70:
						{return (int) tokenOf("CONST");}
					case -71:
						break;
					case 71:
						{return (int) tokenOf("COS");}
					case -72:
						break;
					case 72:
						{return (int) tokenOf("DIAG");}
					case -73:
						break;
					case 73:
						{return (int) tokenOf("DO");}
					case -74:
						break;
					case 74:
						{return (int) tokenOf("DOWNTO");}
					case -75:
						break;
					case 75:
						{return (int) tokenOf("END");}
					case -76:
						break;
					case 76:
						{return (int) tokenOf("OTHERWISE");}
					case -77:
						break;
					case 77:
						{return (int) tokenOf("ELSE");}
					case -78:
						break;
					case 78:
						{return (int) tokenOf("EXIT");}
					case -79:
						break;
					case 79:
						{return (int) tokenOf("FALSE");}
					case -80:
						break;
					case 80:
						{return (int) tokenOf("FILE");}
					case -81:
						break;
					case 81:
						{return (int) tokenOf("FUNCTION");}
					case -82:
						break;
					case 82:
						{return (int) tokenOf("GOTO");}
					case -83:
						break;
					case 83:
						{return (int) tokenOf("IF");}
					case -84:
						break;
					case 84:
						{return (int) tokenOf("REAL");}
					case -85:
						break;
					case 85:
						{return (int) tokenOf("IMPLEMENTATION");}
					case -86:
						break;
					case 86:
						{return (int) tokenOf("INTERFACE");}
					case -87:
						break;
					case 87:
						{return (int) tokenOf("LABEL");}
					case -88:
						break;
					case 88:
						{return (int) tokenOf("NAME");}
					case -89:
						break;
					case 89:
						{return (int) tokenOf("NEW");}
					case -90:
						break;
					case 90:
						{return (int) tokenOf("PACKED");}
					case -91:
						break;
					case 91:
						{return (int) tokenOf("PERM");}
					case -92:
						break;
					case 92:
						{return (int) tokenOf("PRED");}
					case -93:
						break;
					case 93:
						{return (int) tokenOf("PROCEDURE");}
					case -94:
						break;
					case 94:
						{return (int) tokenOf("PROGRAM");}
					case -95:
						break;
					case 95:
						{return (int) tokenOf("PROTECTED");}
					case -96:
						break;
					case 96:
						{return (int) tokenOf("READLN");}
					case -97:
						break;
					case 97:
						{return (int) tokenOf("RECORD");}
					case -98:
						break;
					case 98:
						{return (int) tokenOf("REPEAT");}
					case -99:
						break;
					case 99:
						{return (int) tokenOf("SET");}
					case -100:
						break;
					case 100:
						{return (int) tokenOf("SIN");}
					case -101:
						break;
					case 101:
						{return (int) tokenOf("TAN");}
					case -102:
						break;
					case 102:
						{return (int) tokenOf("SIZEOF");}
					case -103:
						break;
					case 103:
						{return (int) tokenOf("SUCC");}
					case -104:
						break;
					case 104:
						{return (int) tokenOf("THEN");}
					case -105:
						break;
					case 105:
						{return (int) tokenOf("VAR");}
					case -106:
						break;
					case 106:
						{return (int) tokenOf("TYPE");}
					case -107:
						break;
					case 107:
						{return (int) tokenOf("WRITELN");}
					case -108:
						break;
					case 108:
						{return (int) tokenOf("UNIT");}
					case -109:
						break;
					case 109:
						{return (int) tokenOf("UNTIL");}
					case -110:
						break;
					case 110:
						{return (int) tokenOf("USES");}
					case -111:
						break;
					case 111:
						{return TT_REAL;}
					case -112:
						break;
					case 112:
						{return TT_REAL;}
					case -113:
						break;
					case 113:
						{return TT_NUMBER;}
					case -114:
						break;
					case 114:
						{return (int) tokenOf("ABS");/*chinese reserved words start */}
					case -115:
						break;
					case 115:
						{return (int) tokenOf("ORD");}
					case -116:
						break;
					case 116:
						{return (int) tokenOf("BYTE2PIXEL");}
					case -117:
						break;
					case 117:
						{return (int) tokenOf("PIXEL2BYTE");}
					case -118:
						break;
					case 118:
						{return (int) tokenOf("EXTERNAL");}
					case -119:
						break;
					case 119:
						{return (int) tokenOf("MAX");}
					case -120:
						break;
					case 120:
						{return (int) tokenOf("MIN");}
					case -121:
						break;
					case 121:
						{return (int) tokenOf("OPERATOR");}
					case -122:
						break;
					case 122:
						{return (int) tokenOf("SHL");}
					case -123:
						break;
					case 123:
						{return (int) tokenOf("SHR");}
					case -124:
						break;
					case 124:
						{return TT_REAL;}
					case -125:
						break;
					case 125:
						{return TT_REAL;}
					case -126:
						break;
					case 126:
						{/* skip comment */ }
					case -127:
						break;
					case 127:
						{return (int) tokenOf("LN");}
					case -128:
						break;
					case 128:
						{return (int) tokenOf("ROUND");}
					case -129:
						break;
					case 129:
						{return (int) tokenOf("TRANS");}
					case -130:
						break;
					case 130:
						{String filename = yytext().substring(4, yytext().length()-1);ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename;}
					case -131:
						break;
					case 131:
						{ filename = yytext().substring(4, yytext().length()-1).trim();
			//System.out.println("try to include "+filename);
			 return TT_INCLUDE;}
					case -132:
						break;
					case 132:
						{modularArithmetic=true;/* skip comment */ }
					case -133:
						break;
					case 133:
						{modularArithmetic=false; /* skip comment */ }
					case -134:
						break;
					case 134:
						{rangechecks=rcheck=true;/* skip comment */ }
					case -135:
						break;
					case 135:
						{rangechecks=rcheck=false; /* skip comment */ }
					case -136:
						break;
					case 136:
						{String filename = yytext().substring(4, yytext().length()-1);ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" "+filename;}
					case -137:
						break;
					case 137:
						{return TT_REAL;}
					case -138:
						break;
					case 138:
						{blockpar=true;/* skip comment */ }
					case -139:
						break;
					case 139:
						{blockpar=false; /* skip comment */ }
					case -140:
						break;
					case 140:
						{parfor=true;}
					case -141:
						break;
					case 141:
						{return TT_REAL;}
					case -142:
						break;
					case 142:
						{return TT_REAL;}
					case -143:
						break;
					case 143:
						{yybegin(SKIP);}
					case -144:
						break;
					case 144:
						{fatal=true;fatalmessage=yytext();}
					case -145:
						break;
					case 145:
						{String comm =yytext(); comm=comm.substring(9);comm=comm.substring(0,comm.length()-1).trim();defined.put(comm,comm);}
					case -146:
						break;
					case 146:
						{String comm =yytext();  comm=comm.substring(8);comm=comm.substring(0,comm.length()-1).trim();
             //System.out.println("had IFDEF "+comm);
			if(defined.get(comm)==null){yybegin(SKIP);
                                   if(echo) System.out.println(" skip on "+comm);
                        }
		     }
					case -147:
						break;
					case 147:
						{String comm =yytext();comm=comm.substring(9);comm=comm.substring(0,comm.length()-1).trim();
			if(defined.get(comm)!=null)yybegin(SKIP);
			}
					case -148:
						break;
					case 148:
						{String filename = yytext().substring(10, yytext().length()-1).trim();ilcg.tree.AsmLink.libs=ilcg.tree.AsmLink.libs+" -l"+filename;}
					case -149:
						break;
					case 149:
						{ filename = yytext().substring(10, yytext().length()-1).trim();
			//System.out.println("try to include "+filename);
			 return TT_INCLUDE;}
					case -150:
						break;
					case 150:
						{ if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
					case -151:
						break;
					case 151:
						{
               if(echo) System.out.print(yytext());
		yy_mark_start();
    		yybegin(YYINITIAL);
}
					case -152:
						break;
					case 152:
						{
       if(echo)System.out.print("("+yytext()+")");
	   int i,j;
	     j=0;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i)if ('\n' == yy_buffer[i]  ) {
				j=1;
			}
		yy_mark_start();
		if(j==1)yychar=0;
		}
					case -153:
						break;
					case 153:
						{yybegin(YYINITIAL);}
					case -154:
						break;
					case 154:
						{   if(echo)System.out.print("skip off");yybegin(YYINITIAL);}
					case -155:
						break;
					case 156:
						{System.out.println("Unmatched text <"+yytext()+"> line "+yyline);}
					case -156:
						break;
					case 157:
						{return TT_WORD;/* standard identifiers*/}
					case -157:
						break;
					case 158:
						{/* skip comment */ }
					case -158:
						break;
					case 159:
						{/* skip comment */ }
					case -159:
						break;
					case 160:
						{ if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
					case -160:
						break;
					case 161:
						{
       if(echo)System.out.print("("+yytext()+")");
	   int i,j;
	     j=0;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i)if ('\n' == yy_buffer[i]  ) {
				j=1;
			}
		yy_mark_start();
		if(j==1)yychar=0;
		}
					case -161:
						break;
					case 163:
						{System.out.println("Unmatched text <"+yytext()+"> line "+yyline);}
					case -162:
						break;
					case 164:
						{return TT_WORD;/* standard identifiers*/}
					case -163:
						break;
					case 165:
						{ if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
					case -164:
						break;
					case 166:
						{
       if(echo)System.out.print("("+yytext()+")");
	   int i,j;
	     j=0;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i)if ('\n' == yy_buffer[i]  ) {
				j=1;
			}
		yy_mark_start();
		if(j==1)yychar=0;
		}
					case -165:
						break;
					case 168:
						{System.out.println("Unmatched text <"+yytext()+"> line "+yyline);}
					case -166:
						break;
					case 169:
						{return TT_WORD;/* standard identifiers*/}
					case -167:
						break;
					case 170:
						{
       if(echo)System.out.print("("+yytext()+")");
	   int i,j;
	     j=0;
		for (i = yy_buffer_start; i < yy_buffer_index; ++i)if ('\n' == yy_buffer[i]  ) {
				j=1;
			}
		yy_mark_start();
		if(j==1)yychar=0;
		}
					case -168:
						break;
					case 172:
						{return TT_WORD;/* standard identifiers*/}
					case -169:
						break;
					case 174:
						{return TT_WORD;/* standard identifiers*/}
					case -170:
						break;
					case 176:
						{return TT_WORD;/* standard identifiers*/}
					case -171:
						break;
					case 178:
						{return TT_WORD;/* standard identifiers*/}
					case -172:
						break;
					case 180:
						{return TT_WORD;/* standard identifiers*/}
					case -173:
						break;
					case 182:
						{return TT_WORD;/* standard identifiers*/}
					case -174:
						break;
					case 184:
						{return TT_WORD;/* standard identifiers*/}
					case -175:
						break;
					case 186:
						{return TT_WORD;/* standard identifiers*/}
					case -176:
						break;
					case 188:
						{return TT_WORD;/* standard identifiers*/}
					case -177:
						break;
					case 190:
						{return TT_WORD;/* standard identifiers*/}
					case -178:
						break;
					case 192:
						{return TT_WORD;/* standard identifiers*/}
					case -179:
						break;
					case 194:
						{return TT_WORD;/* standard identifiers*/}
					case -180:
						break;
					case 196:
						{return TT_WORD;/* standard identifiers*/}
					case -181:
						break;
					case 198:
						{return TT_WORD;/* standard identifiers*/}
					case -182:
						break;
					case 200:
						{return TT_WORD;/* standard identifiers*/}
					case -183:
						break;
					case 202:
						{return TT_WORD;/* standard identifiers*/}
					case -184:
						break;
					case 204:
						{return TT_WORD;/* standard identifiers*/}
					case -185:
						break;
					case 206:
						{return TT_WORD;/* standard identifiers*/}
					case -186:
						break;
					case 208:
						{return TT_WORD;/* standard identifiers*/}
					case -187:
						break;
					case 210:
						{return TT_WORD;/* standard identifiers*/}
					case -188:
						break;
					case 212:
						{return TT_WORD;/* standard identifiers*/}
					case -189:
						break;
					case 214:
						{return TT_WORD;/* standard identifiers*/}
					case -190:
						break;
					case 216:
						{return TT_WORD;/* standard identifiers*/}
					case -191:
						break;
					case 218:
						{return TT_WORD;/* standard identifiers*/}
					case -192:
						break;
					case 220:
						{return TT_WORD;/* standard identifiers*/}
					case -193:
						break;
					case 222:
						{return TT_WORD;/* standard identifiers*/}
					case -194:
						break;
					case 224:
						{return TT_WORD;/* standard identifiers*/}
					case -195:
						break;
					case 226:
						{return TT_WORD;/* standard identifiers*/}
					case -196:
						break;
					case 228:
						{return TT_WORD;/* standard identifiers*/}
					case -197:
						break;
					case 230:
						{return TT_WORD;/* standard identifiers*/}
					case -198:
						break;
					case 232:
						{return TT_WORD;/* standard identifiers*/}
					case -199:
						break;
					case 234:
						{return TT_WORD;/* standard identifiers*/}
					case -200:
						break;
					case 236:
						{return TT_WORD;/* standard identifiers*/}
					case -201:
						break;
					case 238:
						{return TT_WORD;/* standard identifiers*/}
					case -202:
						break;
					case 240:
						{return TT_WORD;/* standard identifiers*/}
					case -203:
						break;
					case 242:
						{return TT_WORD;/* standard identifiers*/}
					case -204:
						break;
					case 244:
						{return TT_WORD;/* standard identifiers*/}
					case -205:
						break;
					case 246:
						{return TT_WORD;/* standard identifiers*/}
					case -206:
						break;
					case 248:
						{return TT_WORD;/* standard identifiers*/}
					case -207:
						break;
					case 249:
						{return TT_WORD;/* standard identifiers*/}
					case -208:
						break;
					case 250:
						{return TT_WORD;/* standard identifiers*/}
					case -209:
						break;
					case 251:
						{return TT_WORD;/* standard identifiers*/}
					case -210:
						break;
					case 252:
						{return TT_WORD;/* standard identifiers*/}
					case -211:
						break;
					case 253:
						{return TT_WORD;/* standard identifiers*/}
					case -212:
						break;
					case 254:
						{return TT_WORD;/* standard identifiers*/}
					case -213:
						break;
					case 255:
						{return TT_WORD;/* standard identifiers*/}
					case -214:
						break;
					case 256:
						{return TT_WORD;/* standard identifiers*/}
					case -215:
						break;
					case 257:
						{return TT_WORD;/* standard identifiers*/}
					case -216:
						break;
					case 258:
						{return TT_WORD;/* standard identifiers*/}
					case -217:
						break;
					case 259:
						{return TT_WORD;/* standard identifiers*/}
					case -218:
						break;
					case 260:
						{return TT_WORD;/* standard identifiers*/}
					case -219:
						break;
					case 262:
						{ if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
					case -220:
						break;
					case 263:
						{return TT_WORD;/* standard identifiers*/}
					case -221:
						break;
					case 265:
						{ if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
					case -222:
						break;
					case 266:
						{return TT_WORD;/* standard identifiers*/}
					case -223:
						break;
					case 268:
						{ if(echo)System.out.print("<"+yytext()+">");
	yybegin(COMMENT);
}
					case -224:
						break;
					case 269:
						{return TT_WORD;/* standard identifiers*/}
					case -225:
						break;
					case 271:
						{return TT_WORD;/* standard identifiers*/}
					case -226:
						break;
					case 273:
						{return TT_WORD;/* standard identifiers*/}
					case -227:
						break;
					case 275:
						{return TT_WORD;/* standard identifiers*/}
					case -228:
						break;
					case 277:
						{return TT_WORD;/* standard identifiers*/}
					case -229:
						break;
					case 279:
						{return TT_WORD;/* standard identifiers*/}
					case -230:
						break;
					case 281:
						{return TT_WORD;/* standard identifiers*/}
					case -231:
						break;
					case 289:
						{return TT_WORD;/* standard identifiers*/}
					case -232:
						break;
					case 291:
						{return TT_WORD;/* standard identifiers*/}
					case -233:
						break;
					case 293:
						{return TT_WORD;/* standard identifiers*/}
					case -234:
						break;
					default:
						yy_error(YY_E_INTERNAL,false);
					case -1:
					}
					yy_initial = true;
					yy_state = yy_state_dtrans[yy_lexical_state];
					yy_next_state = YY_NO_STATE;
					yy_last_accept_state = YY_NO_STATE;
					yy_mark_start();
					yy_this_accept = yy_acpt[yy_state];
					if (YY_NOT_ACCEPT != yy_this_accept) {
						yy_last_accept_state = yy_state;
						yy_mark_end();
					}
				}
			}
		}
	}
}
