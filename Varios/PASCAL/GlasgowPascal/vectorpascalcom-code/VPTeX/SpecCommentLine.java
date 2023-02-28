package VPTeX;

/** Class to represent a special comment line in the source code */
public class SpecCommentLine extends Line{

    //boolean inSingleQuote;
    //boolean inDoubleQuote;

    /** Default constructor for specCommentLine */
    SpecCommentLine(){
	super();
    }

    /** Constructor for specCommentLine which sets the content of the line and the line number */
    SpecCommentLine(String s, int n, boolean sel){
	super(s, n, sel);
    }

    /** Protected method to remove the Brackets from a special comment
     *  @param S The content of the line
     *  @return The content of the comment with brackets removed
     */

 /*   protected String removeBrackets(String S) {

	String temp = S;
	boolean charMet=false;

	for (int i = 0;i<temp.length() && !charMet;i++) {
	    if (temp.charAt(i)!=' ' && temp.charAt(i)!='\t') {
		if (temp.charAt(i)=='{' && temp.charAt(i+1)=='*') {
		    // Remove the {*
		    temp=temp.substring(0,i+2).replace('{',' ').replace('*',' ')+temp.substring(i+2);
		    charMet=true;				}
	    }
	}
	charMet=false;
	for (int i = temp.length()-1;i>=0 && !charMet;i--) {
	    if (temp.charAt(i)!=' ' && temp.charAt(i)!='\t') {
		if (temp.charAt(i)=='*' && temp.charAt(i+1)=='}') {
		    // Remove the *}
		    temp=temp.substring(0,i+2).replace('}',' ').replace('*',' ')+temp.substring(i+2);
		    charMet=true;
		}
	    }
	    }
	    return temp;
	    }*/



    /** Protected method to produce well formatted LaTeX quotation marks for a comment line
     *  @param S The String to be formatted
     *  @return The content String with well formatted quotation marks
     */
    protected String formatQuotes(String S){
	StringBuffer line= new StringBuffer(S);
	boolean inSingleQuote= false;
	boolean inDoubleQuote= false;

	// Loop through the line
	for (int i= 0; i<line.length(); i++){
	    if(line.charAt(i)== '\'') {
		if(!inSingleQuote){
		    System.out.println("Replacing \'");
	  	    inSingleQuote= true;
	  	    String str=line.toString();
	  	    str=str.substring(0,i)+"`"+str.substring(i+2);

			line = new StringBuffer(str);
		   // line.replace(i,i+1,"`") ;
	        }
	        if(inSingleQuote){
		    inSingleQuote= false;
		}
	    }
	    if(line.charAt(i)== '\"'){
		if(!inDoubleQuote){
		    System.out.println("Replacing \"");
		    inDoubleQuote= true;
		    String str=line.toString();
	  	    str=str.substring(0,i)+"`"+str.substring(i+2);

			line = new StringBuffer(str);

		    //line.replace(i,i+1,"``");
		    i++;
		}
		if(inDoubleQuote){
		    inDoubleQuote= false;String str=line.toString();
	  	    str=str.substring(0,i)+"`"+str.substring(i+2);

			line = new StringBuffer(str);

		//    line.replace(i,i+1,"''");
		    i++;
		}
	    }
	}

	return line.toString();
    }


    /** The toString() for this class.  Formats the String
     *  @return The formatted contents for the Special Comment Line
     */
    public String toString() {
   //   	return ("\\textrm{"+(content)+"} ");
   return content.toString();
    }

}
