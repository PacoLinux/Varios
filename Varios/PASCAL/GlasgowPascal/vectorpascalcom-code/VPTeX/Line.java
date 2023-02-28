package VPTeX;
/** Class to represent any line from teh Pascal source file */
public class Line{

    /* Attributes of all lines */  
    protected String content; // The content of the line
    protected static int lineNo; // The line it appeared at in the source file
	protected boolean selected;

    /* Default Constructor for Line */
    Line(){
        content= "";
		lineNo= 0;
		selected=false;
    }

    /** Constructor for Line. Sets the values of content and lineNo to the values given 
     */
    Line(String s, int n, boolean sel){
	content= s;
	lineNo= n;
	selected=sel;
    }

    /** Method to update the value of content to String s */
    public void changeContent(String s){
	content= s;
    }

    /** Method to return the content of the line */
    public String getContent(){
	return this.content;
    }

    /** Method to return the line number */
    public int getLineNo(){
	return this.lineNo;
    }

    public String toString(){
	return(formatString(content) + "\\\\");
    }

    /** Protected method to return String not including LaTeX special characters
     *  @param S The String to be formatted
     *  @return The formatted String
     */
	protected static String formatString(String S) {
		char c;
		String start,end;
		for (int i =0;i<S.length();i++){
			c=S.charAt(i);
			if (c=='{' || c=='}' || c=='#' || c=='$' || c=='%' || c=='&' ||
				c=='~' || c=='_' || c=='^'){
			    if(i==0 && c=='^'){
				S= "\\" + S.substring(0,1) +"{}" + S.substring(1, S.length());
				i+= 2;
				}
			    else {
			        start=S.substring(0,i);
					end=(S.substring(i,S.length()));
					S=start+"\\"+end;
			    }
			    i++;
		}
			else if (c=='\\') {
				start=S.substring(0,i);
				end=(S.substring(i+1,S.length()));
				S=start+"$ \\backslash $"+end;
				i+=13;
			}
			else if (c== '<') {
				start=S.substring(0,i);				end=(S.substring(i+1,S.length()));
				S=start+"$ \\mathrm{<} $"+end;
				i+=13;
			}
			else if (c== '>') {
				start=S.substring(0,i);				end=(S.substring(i+1,S.length()));
				S=start+"$ \\mathrm{>} $"+end;
				i+=13;
			}		}
		return S;
	}
	public boolean getSelected() {
		return this.selected;
	}
	public void setSelected() {
		this.selected=true;
	}
}
