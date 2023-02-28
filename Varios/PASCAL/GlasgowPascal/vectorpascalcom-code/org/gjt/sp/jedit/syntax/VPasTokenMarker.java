/* *  VPasTokenMarker.java - Vector Pascal token marker  */ package org.gjt.sp.jedit.syntax;import javax.swing.text.Segment;/** * Vector Pascal token marker. * */public class VPasTokenMarker extends TokenMarker{    /** Default constructor */    public VPasTokenMarker()    {	this(false,getKeywords());    }        /** Constructor */    public VPasTokenMarker(boolean doc, KeywordMap keywords)    {	this.doc = doc;	this.keywords = keywords;    }        /** Marks the tokens in a line of text */    public byte markTokensImpl(byte token, Segment line, int lineIndex)    {	char[] array = line.array;	int offset = line.offset;	lastOffset = offset;	lastKeyword = offset;	int length = line.count + offset;	boolean backslash = false; // Used to check for special string and character symbols, \", \', etc.	boolean inComment= false; // Used to mark if current position in the line array is in a comment	// Declarations required or dealing with LaTeX commands	boolean inLatexCommand= false;	boolean inMathMode= false;	boolean inOptionsTag= false;	boolean inContentTag= false;		// Loop through the line of text loop:		for(int i = offset; i < length; i++)		{		    int i1 = (i+1); // The character following the current character in the line		    		    char c = array[i];		    if(c == '\\') {			// If the current character is a backslash, set backslash to true			backslash = true;			continue;		    }		    // Switch statement to deal with string literals, character literals, documentation comments		    // and normal comments		    switch(token) {		    case Token.NULL:			// If the token has not been assigned as a keyword			switch(c) {			case '\'':			    // Start of a string literal, stored as LITERAL1			    doKeyword(line,i,c);			    // If backslash, character is part of character command \'				// or if character is in a comment, ignore it			    // Otherwise, character is start of a string 			    if(backslash || inComment)				backslash = false;			    else {				// Add the token preceding this to the token list				addToken(i - lastOffset,token);				token= Token.LITERAL1;				lastKeyword= i;				lastOffset= i;			    }			    break;			case '(': 			    // Check for (* and (** comments, stored as COMMENT2 ands KEYWORD2 			    backslash= false;			    doKeyword(line,i,c);			    if(length-i > 1)				{				    // If (* is found, deal with start of comments				    if (array[i1]=='*') {					inComment= true;						// If (*! is found, deal with start of documentation comments						if(array[i1+1]=='!'){							addToken(i- lastOffset, token);							lastKeyword= i;							lastOffset= i;							token= Token.KEYWORD2;						}						else {							// Add the token preceding this to the token list							addToken(i - lastOffset,token);							lastKeyword= i;							lastOffset= i;							token= Token.COMMENT2;						}				    }				}			    break;			case '{':			    // Deal with { comments, stored as COMMENT1.			    backslash= false;			    inComment= true;			    doKeyword(line,i,c);			    if(length-i > 1) {					addToken(i - lastOffset,token);					lastKeyword= i;					lastOffset= i;					// Set the token to COMMENT1, reserved for normal comments					token= Token.COMMENT1;			    }			    break;			default:			    backslash = false;			    if(!Character.isLetterOrDigit(c) && c != '_')				doKeyword(line,i,c);			    break;			}			break;		    case Token.COMMENT1:						// Check for the closing of LaTeX tags			if( c == ']' && inOptionsTag) {			    inOptionsTag= false;			    // Add the string to the token list			    addToken(i1 - lastOffset,token);			    token= Token.KEYWORD2;			    lastKeyword= i1;			    lastOffset= i1;			}				// Check for closing of } comments			backslash= false;			// If } deal with closing of comments			if (c=='}'){				inComment= false;			    i++;			    // Add the comment to the token list			    addToken(i-lastOffset, token);			    token= Token.NULL;			    lastKeyword= i;			    lastOffset= i;			}			break;		    case Token.COMMENT2:			// Check for closing of (* comments			backslash = false;			// If *) is found, deal with closing of (* comments 			if(c=='*' & length-i > 1) {			    if(array[i1]==')') {					inComment= false;					// Update the current position					i++;					// Add the comment to the token list					addToken((i+1) - lastOffset,token);					token= Token.NULL;					lastKeyword= i+1;					lastOffset= i+1;			    }			}			// Check for the closing of LaTeX Math Mode			if(c=='$' && inMathMode){			    inMathMode= false;			    // Add the string to the token list			    addToken(i1 - lastOffset,token);			    // Reset token to be in special comments			    token= Token.KEYWORD2;			    lastKeyword= i1;			    lastOffset= i1;			}			break;		    case Token.KEYWORD1:			// Check for the closing of LaTeX commands			// End of LaTeX command will either be a space (\maketitle)			// or a } (\begin{....}) or a newline (\maketitle<newline>)			// or \\ could be used (for seperating lines in LaTeX)			if( (c==' ' || c=='{' || c=='[')&& inLatexCommand) {			    // End the LaTeX command			    inLatexCommand= false;			    // Add the string to the token list			    addToken(i - lastOffset ,token);			    token= Token.KEYWORD2;			    lastKeyword= i;			    lastOffset= i;			    i--;			}			break;		    case Token.KEYWORD2:				// Check for closing of (** documentation comments and highlight any LaTeX commands				// If the start of a LaTeX command is found				if(backslash){				    backslash= false;				    doKeyword(line,i,c);				    inLatexCommand= true;      				    // Add the token preceding this to the token list				    addToken(i - lastOffset,token);				    // Set the token to KEYWORD1				    token= Token.KEYWORD1;				    lastKeyword= i;				    lastOffset= i;				}				// If the start of LaTeX Math Mode is found				if(c== '$'){				// Start of maths mode in LaTeX, stored as COMMENT2				    backslash= false;				    doKeyword(line,i,c);				    inMathMode= true;				    // Add the token preceding this to the token list				    addToken(i - lastOffset,token);				    token= Token.COMMENT2;				    lastKeyword= i;				    lastOffset= i;				}				// If the content tag is found				/*if(c=='{'){				    inContentTag= true;				    addToken(i - lastOffset,token);				    token= Token.OPERATOR;				    lastKeyword= i;				    lastOffset= i;				    				    }*/				//If options tag is found				if (c=='['){				    backslash= false;				    inOptionsTag= true;				    addToken(i - lastOffset,token);				    token= Token.COMMENT1;				    lastKeyword= i;				    lastOffset= i;				}				// If *) is found, deal with closing of documentation comments				if(c=='*'){					if(array[i1]==')'){						inComment= false;						i++;						// Add the comment to the token list						addToken(i-lastOffset+1, token);						token= Token.NULL;						lastKeyword= i+1;						lastOffset= i+1;					}				}				break;		    case Token.LITERAL1:			// Closing of string literals			// If backslash, character is part of character command \"			// Otherwise, character marks the end of string literal			if(backslash)			    backslash= false;			else if(c=='\'') {			    // Add the string to the token list			    addToken(i1 - lastOffset,token);			    token= Token.NULL;			    lastKeyword= i1;			    lastOffset= i1;			}			break;			/*case Token.OPERATOR:			//Check for closing of LaTeX content tags			if(c=='}' && inContentTag){			    inContentTag= false;			    // Add the string to the token list			    addToken(i1 - lastOffset,token);			    token= Token.KEYWORD2;			    lastKeyword= i1;			    lastOffset= i1;			}			break;*/		    default:			throw new InternalError("Invalid state: "						+ token);		    }		}	        if(token == Token.NULL)			doKeyword(line,length,'\0');		switch(token)		{		case Token.LITERAL1:		case Token.LITERAL2:			addToken(length - lastOffset,Token.INVALID);			token = Token.NULL;			break;		default:			addToken(length - lastOffset,token);			break;		}		return token;	}	// Returns the keywordmap for the Vector Pascal language	public static KeywordMap getKeywords()	{		// If the keywords map has not already been created		if(VPasKeywords == null)		{			// Initialise a new keyword map to represent the keywords			VPasKeywords = new KeywordMap(true);			// Add all the words in the Vector Pascal language to the keyword map			VPasKeywords.add("abs",Token.OPERATOR);			VPasKeywords.add("addr",Token.OPERATOR);			VPasKeywords.add("and",Token.KEYWORD1);			VPasKeywords.add("array",Token.KEYWORD3);			VPasKeywords.add("begin",Token.KEYWORD1);			VPasKeywords.add("byte2pixel",Token.OPERATOR);			VPasKeywords.add("chr",Token.KEYWORD3);			VPasKeywords.add("const",Token.KEYWORD1);			VPasKeywords.add("cos",Token.OPERATOR);			VPasKeywords.add("dispose",Token.KEYWORD1);			VPasKeywords.add("div",Token.KEYWORD1);			VPasKeywords.add("do",Token.KEYWORD1);			VPasKeywords.add("downto",Token.KEYWORD1);			VPasKeywords.add("end",Token.KEYWORD1);			VPasKeywords.add("else",Token.KEYWORD1);			VPasKeywords.add("exit",Token.KEYWORD1);			VPasKeywords.add("external",Token.KEYWORD1);			VPasKeywords.add("false",Token.LITERAL2);			VPasKeywords.add("file",Token.KEYWORD3);			VPasKeywords.add("for",Token.KEYWORD1);			VPasKeywords.add("function",Token.KEYWORD1);			VPasKeywords.add("goto",Token.KEYWORD1);			VPasKeywords.add("if",Token.KEYWORD1);			VPasKeywords.add("implementation",Token.KEYWORD1);			VPasKeywords.add("in",Token.KEYWORD1);			VPasKeywords.add("interface",Token.KEYWORD1);			VPasKeywords.add("iota",Token.OPERATOR);			VPasKeywords.add("label",Token.KEYWORD1);			VPasKeywords.add("library",Token.KEYWORD1);			VPasKeywords.add("ln",Token.OPERATOR);			VPasKeywords.add("max",Token.OPERATOR);			VPasKeywords.add("min",Token.OPERATOR);			VPasKeywords.add("mod",Token.OPERATOR);			VPasKeywords.add("new",Token.KEYWORD1);			VPasKeywords.add("not",Token.OPERATOR);			VPasKeywords.add("of",Token.KEYWORD1);			VPasKeywords.add("or",Token.KEYWORD1);			VPasKeywords.add("ord",Token.OPERATOR);			VPasKeywords.add("packed",Token.KEYWORD1);			VPasKeywords.add("pixel2byte",Token.OPERATOR);			VPasKeywords.add("pow",Token.OPERATOR);			VPasKeywords.add("pred",Token.OPERATOR);			VPasKeywords.add("procedure",Token.KEYWORD1);			VPasKeywords.add("program",Token.KEYWORD1);			VPasKeywords.add("read",Token.KEYWORD1);			VPasKeywords.add("readln",Token.KEYWORD1);			VPasKeywords.add("record",Token.KEYWORD3);			VPasKeywords.add("repeat",Token.KEYWORD1);			VPasKeywords.add("round",Token.OPERATOR);			VPasKeywords.add("set",Token.KEYWORD1);			VPasKeywords.add("shl",Token.OPERATOR);			VPasKeywords.add("shr",Token.OPERATOR);			VPasKeywords.add("sin",Token.OPERATOR);			VPasKeywords.add("sizeof",Token.KEYWORD1);			VPasKeywords.add("string",Token.KEYWORD3);			VPasKeywords.add("sqrt",Token.OPERATOR);			VPasKeywords.add("succ",Token.OPERATOR);			VPasKeywords.add("tan",Token.OPERATOR);			VPasKeywords.add("then",Token.KEYWORD1);			VPasKeywords.add("to",Token.KEYWORD1);			VPasKeywords.add("trans",Token.OPERATOR);			VPasKeywords.add("true",Token.LITERAL2);			VPasKeywords.add("type",Token.KEYWORD1);			VPasKeywords.add("var",Token.KEYWORD1);			VPasKeywords.add("with",Token.KEYWORD1);			VPasKeywords.add("while",Token.KEYWORD1);			VPasKeywords.add("write",Token.KEYWORD1);			VPasKeywords.add("writeln",Token.KEYWORD1);			VPasKeywords.add("unit",Token.KEYWORD1);			VPasKeywords.add("until",Token.KEYWORD1);			VPasKeywords.add("uses",Token.KEYWORD1);		}		return VPasKeywords;	}	// private members	private static KeywordMap VPasKeywords;	private boolean doc;//  Whether the token is part of the documentation	private KeywordMap keywords;// The list of keywords for the language	private int lastOffset;	private int lastKeyword;	private boolean doKeyword(Segment line, int i, char c)	{		int i1 = i+1;		int len = i - lastKeyword;		// The type of keyword, represented by a byte value		byte id = keywords.lookup(line,lastKeyword,len);		// If the keyword is not normal text		if(id != Token.NULL)		{			if(lastKeyword != lastOffset)				addToken(lastKeyword - lastOffset,Token.NULL);			// Add the current token			addToken(len,id);			lastOffset = i;		}		lastKeyword = i1;		return false;	}}