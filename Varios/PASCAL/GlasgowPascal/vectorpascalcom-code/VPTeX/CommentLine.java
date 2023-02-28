package VPTeX;

/** Class to represent a normal comment line */
public class CommentLine extends Line{
    
    /** Default constructor for commentLine */
    CommentLine(){
	super();
    }
 
    /** Constructor for commentLine which sets the content of the line and the line number */
    CommentLine(String s, int n, boolean sel){
	super(s, n, sel);
    }


      
	public String toString() {
		return ("\\parbox{14cm}{\\texttt{\\small{"+formatString(content)+"}}}\\\\");
	}
}
