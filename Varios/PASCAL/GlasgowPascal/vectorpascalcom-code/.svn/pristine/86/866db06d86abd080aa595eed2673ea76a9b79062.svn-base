package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.SyntaxError;


/**
 *  TeX Lexanal Author Paul Cockshott Copyright \copyright University of
 *  Strathclyde A lexican analyser class to be used in the parser
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class PascalLex {

    /**
     *  Description of the Field
     */
    public String theString, theId;

    /**
     *  Description of the Field
     */
    public double theNumber;
    StreamTokenizer tokenizer;
    boolean echo = true;
    // reserved words

    int thebase;
    private int token, c, state;
    private Hashtable reserved = new Hashtable();
    private Vector symbols = new Vector(256);
    private Reader inp;

    /**
     *  Description of the Field
     */
    public final static int TT_QUOTE = '\'';

    /**
     *  Description of the Field
     */
    public final static int TT_EOL = StreamTokenizer.TT_EOL;

    /**
     *  Description of the Field
     */
    public final static int TT_TAB = '\t';

    /**
     *  Description of the Field
     */
    public final static int TT_EOF = StreamTokenizer.TT_EOF;

    /**
     *  Description of the Field
     */
    public final static int TT_WORD = StreamTokenizer.TT_WORD;

    /**
     *  Description of the Field
     */
    public final static int TT_NUMBER = StreamTokenizer.TT_NUMBER;

    /**
     *  Description of the Field
     */
    public final static int TT_COMMENT = '#';

    /**
     *  Description of the Field
     */
    public final static int TT_STRING = TT_QUOTE;

    /**
     *  Description of the Field
     */
    public final static int TT_SEMICOLON = ';';

    /**
     *  Description of the Field
     */
    public final static int TT_IDENTIFIER = TT_WORD;

    /**
     *  Description of the Field
     */
    public final static int TT_FULLSTOP = '.';
    static int unknown = 0;
    static boolean debug = false;
    final static int var = 1;
    // parsing a variable
    final static int str = 2;
    // parsing a string
    final static int num = 3;
    // parsing an integer
    final static int com = 4;
    // parsing a comment
    final static int frac = 5;
    // parsing a fraction
    final static int exp = 6;
    // parsing an exp sign
    final static int expdig = 7;
    // parsing an exponent
    final static int eol = 8;

    /**
     *  Invoke on reader I with echoing optionally to standard output.
     *
     *@param  I         Description of Parameter
     *@param  echoes    Description of Parameter
     *@param  reserved  Description of Parameter
     */

    public PascalLex(Reader I, boolean echoes, String[] reserved) {
        echo = echoes;
        inp = (I);
        start(reserved);
    }

    /**
     *  Invoke on standard input. No echoing.
     *
     *@exception  IOException  Description of Exception
     */
    public PascalLex() throws IOException {
        inp = new InputStreamReader(System.in);
        String[] res = { "BEGIN"};
        start(res);
    }

    /**
     *  return source line
     *
     *@return    Description of the Returned Value
     */
    public int lineno() {
        return tokenizer.lineno();
    }

    /**
     *  associate a string with a token in the reserved word table
     *
     *@param  s  Description of Parameter
     */
    public void reserveWord(String s) {
        symbols.addElement(s);
        reserved.put(s, new Integer(symbols.size()));
    }

    /**
     *  Move the analyser on by one token.
     */
    public void nextsymbol() {
        try {
            token = tokenizer.nextToken();
            if(debug || echo) {
                System.out.println(tokenizer.toString());
            }
        }
        catch(IOException e) {
            token = TT_EOF;
        }
        if(token == TT_NUMBER) {
            theNumber = tokenizer.nval;
            theString = "";
            int next;
            try {
                next = tokenizer.nextToken();
            }
            catch(IOException e) {
                next = TT_EOF;
            }
            if(next == 'E') {
                int ttype;
                try {
                    ttype = tokenizer.nextToken();
                }
                catch(Exception e) {
                    ttype = TT_EOF;
                }
                if(ttype != TT_NUMBER) {}
                else {
                    theNumber *= Math.pow(10, tokenizer.nval);
                }
            }
            else {
                tokenizer.pushBack();
            }
        }
        if(token == TT_WORD) {
            theString = tokenizer.sval;
            String upper = theString.toUpperCase();
            Object t = reserved.get(upper);
            // System.out.println(upper+t);
            if(t != null) {
                token = ((Integer) t).intValue();
            }
        }
        if(token == TT_QUOTE) {
            theString = tokenizer.sval;
        }
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        String s = " " + (char) token + " " + token + " " + theString + " "
                   + theNumber;
        return s;
    }

    /**
     *  checks for symbol in input and reads next
     *
     *@param  symbol           Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */

    public boolean have(int symbol) throws SyntaxError {
        if(token == symbol) {
            if(debug) {
                String sym;
                if(token == TT_WORD) {
                    sym = "word";
                }
                else if(token == TT_NUMBER) {
                    sym = "number";
                }
                else {
                    sym = " " + (char) token;
                }
                System.out.print("have(" + sym + ")\n");
            }
            if(token == TT_WORD) {
                theId = theString;
            }
            nextsymbol();
            if(debug) {
                System.out.print(theString + " ");
            }
            return true;
        }
        if(debug) {
            String sym;
            if(symbol == TT_WORD) {
                sym = "word";
            }
            else if(symbol == TT_NUMBER) {
                sym = "number";
            }
            else if(symbol > 256) {
                sym = theString;
            }
            else {
                sym = " " + (char) symbol;
            }
            System.out.print("!have(" + sym + ")");
            if(token == TT_WORD) {
                sym = "word";
            }
            else if(token == TT_NUMBER) {
                sym = "number";
            }
            else {
                sym = " " + (char) token;
            }
            System.out.println("but " + sym);
        }
        return false;
    }

    /**
     *  checks for symbol in input
     *
     *@param  symbol  Description of Parameter
     *@return         Description of the Returned Value
     */

    public boolean peek(int symbol) {
        if(token == symbol) {
            return true;
        }
        return false;
    }

    /**
     *  if not symbol give error
     *
     *@param  symbol           Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */

    public void mustbe(int symbol)
    throws SyntaxError {
        if(!have(symbol)) {
            throw new SyntaxError(
                "Error " + token + "(" + totext(token)
                + ") found when symbol  " + symbol + "(" + totext(symbol)
                + ") expected ",
                tokenizer.lineno());
        }
    }

    /**
     *  tests the next input symbol but does not advance beyond it
     *
     *@param  symbol  Description of Parameter
     *@return         Description of the Returned Value
     */
    public boolean peek(String symbol) {
        return (token == TT_WORD && (symbol.equalsIgnoreCase(theString)));
    }

    /**
     *  checks for the symbol and eats it up if found
     *
     *@param  symbol           Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public boolean have(String symbol) throws SyntaxError {
        if(token == TT_WORD && (symbol.equalsIgnoreCase(theString))) {
            if(debug) {
                System.out.print("have(" + symbol + ")");
            }
            nextsymbol();
            if(debug) {
                System.out.print(symbol);
            }
            return true;
        }
        if(token >= 0) {
            if(symbol.equalsIgnoreCase(theString)) {
                if(debug) {
                    System.out.print(symbol);
                }
                nextsymbol();
                return true;
            }
        }
        return false;
    }

    /**
     *  if not symbol give error
     *
     *@param  symbol           Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */

    public void mustbe(String symbol)
    throws SyntaxError {
        if(!have(symbol)) {
            throw new SyntaxError(
                theString + " found where " + symbol + " expected",
                tokenizer.lineno());
        }
    }

    /**
     *  Description of the Method
     *
     *@param  token  Description of Parameter
     *@return        Description of the Returned Value
     */
    String totext(int token) {
        // convert token to prinatable form
        if(token == TT_EOF) {
            return "EOF";
        }
        if(token == TT_NUMBER) {
            return "NUMBER";
        }
        if(token == TT_WORD) {
            return "WORD";
        }
        if(token > 255) {
            Object rep = symbols.elementAt(token - 1);
            if(rep instanceof String) {
                return (String) rep;
            }
        }
        if(token > 0) {
            return new Character((char) token).toString();
        }
        return " " + token;
    }

    /**
     *  Description of the Method
     *
     *@return                  Description of the Returned Value
     *@exception  IOException  Description of Exception
     */
    private int getchar() throws IOException {
        int c = inp.read();
        if(debug || echo) {
            System.out.print((char) c);
        }
        return c;
    }

    /**
     *  Description of the Method
     *
     *@param  reserved  Description of Parameter
     */
    private void start(String[] reserved) {
        thebase = 10;
        state = unknown;
        // c=getchar();
        theString = "";
        theNumber = 0;
        token = 0;
        tokenizer = new StreamTokenizer(inp);
        tokenizer.lowerCaseMode(true);
        tokenizer.eolIsSignificant(false);
        tokenizer.commentChar(TT_COMMENT);
        tokenizer.ordinaryChar('E');
        tokenizer.ordinaryChar('/');
        tokenizer.ordinaryChar('.');
        tokenizer.ordinaryChar('-');
        tokenizer.quoteChar(TT_QUOTE);
        for(int i = 0; i < 256; i++) {
            symbols.insertElementAt(new Character((char) i).toString(), i);
        }
        // symbols.insertElementAt(" IDENTIFIER ",TT_WORD);
        for(int i = 0; i < reserved.length; i++) {
            reserveWord(reserved[i]);
        }
        nextsymbol();
    }

}
