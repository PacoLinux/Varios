/**
 * ViperMethodFinder.java - d:viper;*.javaeedBar window.  Copyright (c) 1996-2000 Steve Lawson.  E-Mail 
 * steve@e-i-s.co.uk Latest version found at http://e-i-s.co.uk/viper
 * 
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 * 
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 * 
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */

package VPTeX;

/** A class extracting the different parts of a line, ie comment, and special comments
 * 
 */
public class State {
	

	/** keeps track type of comment */
	private char comment = '\0';
	/** keeps track wether we are in a comment */
	private boolean isInComment=false;
	/** keeps track wether we are in a comment */
	private boolean specComment=false;
	/** Stores any comment on the last line */
	private String comments;
	/** Stores any comment without the brackets on the last line */
	private String commentsWithNoBrackets;
	/** Stores any special comment on the last line */
	private String specialComments;
	/** Stores any code on the last line */
	private String code;

	/** Returns the coments that were on the last line
	 * @return The comments
	 */
	public String getComment() {
		return comments;
	}
	/** Returns the coments without the brackets that were on the last line
	 * @return The comments
	 */
	public String getCommentsWithNoBrackets() {
		return commentsWithNoBrackets;
	}
	/** Returns the special coments that were on the last line
	 * @return The comments
	 */	
	public String getSpecComments() {
		return specialComments;
	}
	/** Returns the code that was on the last line
	 * @return The comments
	 */	
	public String getCode() {
		return code;
	}

	/** Checks a string and updates the varibles about lines
	 * @param line the line to be checked
	 */
	public void checkLine(String line) {
		
		// keep track of the last few characters
		char secondLastChar ='\0';
		char lastChar;
		char c='\0';
		// keep track of wither or not in string is '
		boolean isString=false;
		boolean letterAdded=false;
		
		// reset values
		comments="";
		commentsWithNoBrackets="";
		specialComments="";
		code="";
		
		// for all the letters in the string loop
		for (int i=0;i<line.length();i++) {
			
			lastChar=c;
			c=line.charAt(i);
			switch (c) {
				//case ' ':
			// if letter equlas tabb do nothing
			case '\t':
				secondLastChar=lastChar;
				lastChar = ' ';
				break;
			// if letter equals ' then is in string or not in sting
			case '\'':
				if (isInComment)
					break;
				isString =(!isString);
				secondLastChar=lastChar;
				lastChar = '\'';
				break;
			// if * then could be a new comment if last character is (
			case '*':
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
				secondLastChar=lastChar;
				lastChar = '*';
				break;
			// if ! the could be a special comment, if last two character were (*
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
			// if ) then could be end of comment if last character was *
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
			// if { then could be start of comment
			case '{':
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
			// if ( then store that fact
			case '(':
				if (isString || isInComment)
					break;
				secondLastChar=lastChar;
				lastChar = '(';
				break;
			// if } then could be end of comment
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
			// stor the character
			default:

				secondLastChar=lastChar;
				lastChar = c;
				break;
			}
			
			// add character to codeline
			if (!isInComment && !letterAdded) {
				code=code+c;
			}
			// add character to comments
			else if (isInComment && !letterAdded && !specComment){
				comments=comments+c;
				commentsWithNoBrackets=commentsWithNoBrackets+c;
			}
			// add character to special comment
			else if (isInComment && !letterAdded && specComment){
				specialComments=specialComments+c;
			}
			
			letterAdded=false;
		}
	}
	
	/** Checks a tex string and updates the varibles about lines
	 * @param line the line to be checked
	 */
	public String checkTexLine(String line) {
		
		char c='\0';
		String l="";
		// go through line
		for (int i=0;i<line.length();i++) {

			c=line.charAt(i);
			if (c=='%') {
				isInComment=true;
			}
			
			if (!isInComment) {
				l=l+c;
			}
			
			

		}
		isInComment=false;
		return l;
		
	}
	

}
