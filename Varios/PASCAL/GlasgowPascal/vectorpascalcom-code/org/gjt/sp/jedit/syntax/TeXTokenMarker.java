// Version 0.11 TeXTokenMarker

/*
 * VPasTokenMarker.java -  Tex token marker
 *
 */
package org.gjt.sp.jedit.syntax;

import javax.swing.text.Segment;

/**
 * TeX token marker.
 *
 */
public class TeXTokenMarker extends TokenMarker
{

	// Default constructor
	public TeXTokenMarker()
	{
	    this(false,getKeywords());
	}

	// Constructor
    public TeXTokenMarker(boolean doc,KeywordMap keywords)
	{
		this.doc = doc;
		this.keywords= keywords;
		
	}

	// Marks the tokens in a line of text
	public byte markTokensImpl(byte token, Segment line, int lineIndex)
	{
		char[] array = line.array;
		int offset = line.offset;
		lastOffset = offset;
		lastKeyword = offset;
		int length = line.count + offset;
		boolean backslash = false; // Used to check for special string and character symbols, \", \', etc.



		    // Loop through the line of text 
loop:		for(int i = offset; i < length; i++)
                {

			int i1 = (i+1); // The character following the current character in the line
			char c = array[i];
		
		
			       	if(c == '\\') {
		        // If the current character is a backslash, set backslash to true
			  	backslash = !backslash;
				}

			// Switch statement to deal with string literals, character literals, documentation comments
			// and normal comments
			switch(token) {
			case Token.NULL:
			// If the token has not been assigned as a keyword
				switch(c) {
				case '\\':
				// Start of LaTeX command, stored as KEYWORD1
					doKeyword(line,i,c);
				
						// Add the token preceding this to the token list
						addToken(i - lastOffset,token);
						token= Token.KEYWORD1;
						lastKeyword= i;
						lastOffset= i;
					       
					break;
		

				case '$':
				    // Start of maths mode in LaTeX, stored as COMMENT2
					doKeyword(line,i,c);
				
						// Add the token preceding this to the token list
						addToken(i - lastOffset,token);
						token= Token.COMMENT2;
						lastKeyword= i;
						lastOffset= i;
					       
					break;



			       case '[':
					// start of options tag in LaTeX
				      doKeyword(line,i,c);
					// Add the token preceding this to the token list
						addToken(i - lastOffset,token);
						token= Token.KEYWORD2;
						lastKeyword= i;
						lastOffset= i;

					 break;
					       

				case '%':
				   // Deal with % comments in LaTeX, stored as COMMENT1
			   		doKeyword(line,i,c);
				
       				         	addToken(i - lastOffset,token);
						token= Token.COMMENT1;					
						lastOffset= i;
						lastKeyword= length;
					
				      
					break;
 
				default:
					backslash = false;
					if(!Character.isLetterOrDigit(c) && c != '_')
						doKeyword(line,i,c);
					break;
				}
				break;


	/* ------------------------------------------------------------------------------------------------------------------------*/


			case Token.COMMENT1:
				
			    
			    if (i + 1 >= length) {
			        // Add the comment to the token list
			       addToken(i1-lastOffset, token);
			       token= Token.NULL;
			       lastKeyword= i1;
		               lastOffset= i1;
			    }
			    		break;
		
					

			 case Token.COMMENT2:
			 // end of Maths mode in LaTeX


			    if( c == '$') {
			    // Add the string to the token list
					addToken(i1 - lastOffset,token);
					token= Token.NULL;
					lastKeyword= i1;
					lastOffset= i1;
			    }
		
		
				break;
				

			case Token.KEYWORD2:
			 // end of tag mode in LaTeX


			    if( c == ']') {
			    // Add the string to the token list
					addToken(i1 - lastOffset,token);
					token= Token.NULL;
					lastKeyword= i1;
					lastOffset= i1;
			    }
			    
			    break;

			case Token.KEYWORD1:
		       // End of LaTeX command could be a } (\begin{....}) or a newline (\maketitle<newline>)
		       // or \\ could be used (for seperating lines in LaTeX)


			    if( c == '\\' || c == '}' || c == '\n' || i + 1 >= length ) {
			    	// Add the string to the token list
					addToken(i1 - lastOffset,token);
					token= Token.NULL;
					lastKeyword= i1;
					lastOffset= i1;
			    }
			    backslash= false;
			    if(lastOffset > length) {
				i++;

			       token= Token.NULL;
			       lastKeyword= i;
		               lastOffset= i;
		       	    	}
				
		
				break;

			default:
				throw new InternalError("Invalid state: "
					+ token);
			}
		}

	
		if(token == Token.NULL)
			doKeyword(line,length,'\0');

		switch(token)
		{
	
		default:
			addToken(length - lastOffset,token);
			break;
		}

		return token;
	}


	// Returns the keywordmap for the Vector Pascal language
    	public static KeywordMap getKeywords()
	{
		// If the keywords map has not already been created
		if(TeXKeywords == null)
		   	{
			// Initialise a new keyword map to represent the keywords
			TeXKeywords = new KeywordMap(false);
			// Add all the words in the LaTeX language to the keyword map
			TeXKeywords.add("+",Token.OPERATOR);
			TeXKeywords.add("-",Token.OPERATOR);
			TeXKeywords.add("/",Token.OPERATOR);
			TeXKeywords.add("*",Token.OPERATOR);
		}
		return TeXKeywords;
		}

	// private members
    	private static KeywordMap TeXKeywords;
	private boolean doc;//  Whether the token is part of the documentation
    	private KeywordMap keywords;// The list of keywords for the language
	private int lastOffset;
	private int lastKeyword;

	private boolean doKeyword(Segment line, int i, char c)
	{
        	int i1 = i+1;
 
		int len = i - lastKeyword;

		// The type of keyword, represented by a byte value
		byte id = keywords.lookup(line,lastKeyword,len);

		// If the keyword is not normal text
				if(id != Token.NULL)
				    {
				
					if(lastKeyword != lastOffset)
				         addToken(lastKeyword - lastOffset,Token.NULL);
				    // Add the current token
				    addToken(len,id);
				    lastOffset = i;
				    }
    	lastKeyword = i1;
	return false;
	}
}
