package viper;
public class State {
	private char lastChar ='\0';
	private char secondLastChar ='\0';
	private char comment = '\0';
	private boolean isInComment=false;
	private boolean commentInLine=false;
	private boolean specComment=false;

	private String comments;
	private String commentsWithNoBrackets;
	private String specialComments;
	private String code;

	

	

	public void set_comment (char c) {
		comment = c;
	}
	
	public void set_isInComment (boolean b) {
		isInComment = b;
	}
	
	public void set_commentInLine (boolean b) {
		commentInLine = b;
	}
	
	public void set_specComment (boolean b) {
		specComment = b;
	}

	public String getComment() {
		return comments;
	}
	
	public String getCommentsWithNoBrackets() {
		return commentsWithNoBrackets;
	}
	
	public String getSpecComments() {
		return specialComments;
	}
	
	public String getCode() {
		return code;
	}
	
	public boolean get_commentInLine () {
		return commentInLine;
	}
	
	public boolean get_specComment () {
		return specComment;
	}
	

	public char get_comment () {
		return comment;
	}
	
	public boolean get_isInComment () {
		return isInComment;
	}
	
	

	
	
	
	public void checkLine(String line) {
		
		char lastChar;
		char c='\0';
		boolean isString=false;
		boolean letterAdded=false;
		
		comments="";
		commentsWithNoBrackets="";
		specialComments="";
		code="";
		
		
		for (int i=0;i<line.length();i++) {
			
			lastChar=c;
			c=line.charAt(i);
			switch (c)
			{
			case ' ':
			case '\t':
				secondLastChar=lastChar;
				lastChar = ' ';
				break;
				
			case '\'':
				if (isInComment)
					break;
				isString =(!isString);
				secondLastChar=lastChar;
				lastChar = '\'';
				break;

			case '*':                                // if we
				// encounter
				// this, the
				// comment might
				// ends
				// here...
				if (isString)
					break;
				if (lastChar == '(')
				{
					if (isInComment)
						break;
					isInComment=(true);
					comment=('*');
					code=code.substring(0,code.length()-1);
					code=code+' ';
					comments=comments+"(*";
					letterAdded=true;
				}
				/*else if (lastChar == '*' && secondLastChar== '(') {
					specComment=true;
					comment=('S');
					comments=comments.substring(0,comments.length()-2);
					letterAdded=true;
				}    */
				secondLastChar=lastChar;
				lastChar = '*';
				break;
			case '!':
				if (isString)
					break;
				if (lastChar == '*' && secondLastChar== '(') {
					specComment=true;
					comment=('S');
					comments=comments.substring(0,comments.length()-2);
					letterAdded=true;
				}    
				secondLastChar=lastChar;
				lastChar = '!';
				break;
			case ')':
				if (isString )
					break;
				if (((isInComment && comment == '*') || specComment) && lastChar == '*') {
					if (specComment){
						specialComments=specialComments.substring(0,specialComments.length()-1);
					}
					else {
						comments=comments+")";
						commentsWithNoBrackets=commentsWithNoBrackets.substring(0,commentsWithNoBrackets.length()-1);
					}
					letterAdded=true;
					isInComment=false;
					specComment=false;
					secondLastChar=lastChar;
					lastChar = ')';
				}
				break;

			case '{':                                // if we
				// encounter
				// this, the
				// comment might
				// ends
				if (isString || isInComment)
					break;
				
				comments=comments+"{";
				code=code+' ';
				letterAdded=true;
				isInComment=(true);
				comment=('{');
				
				secondLastChar=lastChar;
				lastChar = '{';
				break;
				
			case '(':
				if (isString || isInComment)
					break;
				secondLastChar=lastChar;
				lastChar = '(';
				break;
				
			case '}':
				if (isString)
					break;
				if (isInComment && comment == '{') {
					comments=comments+"}";
					letterAdded=true;
					isInComment=(false);
					secondLastChar=lastChar;
					lastChar = '}';
				}
				break;
				
			default:

				secondLastChar=lastChar;
				lastChar = c;
				break;
			}
			
			if (!isInComment && !letterAdded) {
				code=code+c;
			}
			else if (isInComment && !letterAdded && !specComment){
				comments=comments+c;
				commentsWithNoBrackets=commentsWithNoBrackets+c;
			}
			else if (isInComment && !letterAdded && specComment){
				specialComments=specialComments+c;
			}
			
			letterAdded=false;
		}
		//System.out.println(l);
		
	}
	
	
	public String checkTexLine(String line) {
		
		char c='\0';
		String l="";
		
		for (int i=0;i<line.length();i++) {

			c=line.charAt(i);
			if (c=='%') {
				isInComment=true;
			}
			
			if (!isInComment) {
				//System.out.println(c);
				l=l+c;
			}
			
			

		}
		isInComment=false;
		//System.out.println(l);
		return l;
		
	}
	

}
