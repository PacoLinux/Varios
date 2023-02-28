/**
 *  Pascal representation for VPTeX. The Viper Team  
 *  Copyright (c) 2002 VIPER Team
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
 *  @author Kenneth Borland
 */

package VPTeX;

import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;
import javax.swing.text.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.tree.*;
import java.net.URL;
import java.util.Date;
import java.text.SimpleDateFormat;

/** Class to tokenize a line of text, with pascal syntax and tex
 */
public class  Tokens {
	Vector tokens;
	
	/** Tokinize the line
	 * @param S string to be tokinized
	 */
	public void tokenizeLine(String S){
		// Initialise the Vector of tokens
		tokens= new Vector();
		// Integer used to mark the start of a token
		int    startTokenMarker= 0;
		if (S.length()==1) {
			tokens.addElement(S);
		}
		else {
			// Loop through the content String of the CodeLine 
			for(int i=0; i<S.length(); i++){
				char c= S.charAt(i);
				// If we are not at the start of the line
				if(i>0){
					if(c== ' ' || c== '(' || c== ')' || c== ',' || c== ';' || c== ':' || c== '[' || c== ']' ||
					   c== '+' || c== '-' || c== '/' || c== '*' || c== '<' || c== '>' || c== '=' || c== '\\'||
					   c== '.' || c== '\t'|| c== '\''|| c== '@' || c== '^' || c== '\n'){

						// Add the latest token
						if (startTokenMarker!=i) {
							tokens.addElement(S.substring(startTokenMarker, i));
						}
						tokens.addElement(S.substring(i, i+1));
						// Update the startTokenMarker
						startTokenMarker= i+1;
					}
					else if ( i==S.length()-1){
						tokens.addElement(S.substring(startTokenMarker, i+1));
					}
				}
				else{
					// If the first entry in the line is a separator
					if(c== ' ' || c== '(' || c== ')' || c== ',' || c== ';' || c== ':' || c== '[' || c== ']' ||
					   c== '+' || c== '-' || c== '/' || c== '*' || c== '<' || c== '>' || c== '=' || c== '\\' ||
					   c== '.' || c== '\t'|| c== '\''|| c== '@' || c== '^' || c== '\n'){
						// Add the separator to the token list
						tokens.addElement(S.substring(i,i+1));
						// Update the startTokenMarker
						startTokenMarker= i+1;
					}
				}
			}
		}
	}// tokenizeLine()
	
	/** Tokinze a tex line
	 * @param S string to be tokinized
	 */
	public void tokenizeTexLine(String S){
		// Initialise the Vector of tokens
		tokens= new Vector();
		// Integer used to mark the start of a token
		int    startTokenMarker= 0;
		if (S.length()==1) {
			tokens.addElement(S);
		}
		else {
			// Loop through the content String of the CodeLine 
			for(int i=0; i<S.length(); i++){
				char c= S.charAt(i);
				// If we are not at the start of the line
				if(i>0){
					if(c== ' ' || c== '{' || c== '\t' ||  c== '['|| c== ']'|| c== '\n'|| c== '}' ){

						// Add the latest token
						if (startTokenMarker!=i) {
							tokens.addElement(S.substring(startTokenMarker, i));
						}
						tokens.addElement(S.substring(i, i+1));
						// Update the startTokenMarker
						startTokenMarker= i+1;
					}
					else if ( i==S.length()-1){
						tokens.addElement(S.substring(startTokenMarker, i+1));
					}
				}
				else{
					// If the first entry in the line is a separator
					if(c== ' ' || c== '{' || c== '\t' ||  c== '['|| c== ']'|| c== '\n'|| c== '}' ){
						// Add the separator to the token list
						tokens.addElement(S.substring(i,i+1));
						// Update the startTokenMarker
						startTokenMarker= i+1;
					}
				}
			}
		}

	}// tokenizeLine()
	

	/** Returns true if the tokinized line contains a token and it followed by a ; ie a statment
	 * @param S the token to search for
	 * @return if contains token and not last
	 */
	public boolean containsTokenAndNotLast(String S) {
		
		String temp;
		//search for token
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S.toLowerCase())){
				for(int j=i+1;j<tokens.size();j++){
					temp=(String)tokens.elementAt(j);
					// find ; if exists
					if (temp.toLowerCase().equals(";")) {
						return true;
					}
				}
				return false;
			}
		}
		return false;
	}	

	/** Returns true if the tokinized line contains a token and it is the last
	 * @param S the token to search for
	 * @return if contains token and last
	 */
	public boolean containsTokenAndLast(String S) {
		
		String temp;
		// search for token
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S.toLowerCase())){
				for(int j=i+1;j<tokens.size();j++){
					temp=(String)tokens.elementAt(j);
					if (!temp.toLowerCase().equals(" ") &&
						!temp.toLowerCase().equals("\t") &&
						!temp.toLowerCase().equals("")) {
						return false;
					}
				}
				return true;
			}
		}
		return false;
	}
	
	/** Return true if contains two tokens one after the other
	 * @param S1 the first token
	 * @param S2 the second token
	 * @return true if contains the two tokens
	 */
	public boolean containsTokens(String S1, String S2) {
		String temp,temp2;
		boolean noMatch=false;
		// search for the first token
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S1.toLowerCase())){
				// search for second token
				for (int j=i+1;j<tokens.size()&&!noMatch;j++){
					temp2=(String)tokens.elementAt(j);
					if (temp2.toLowerCase().equals(S2.toLowerCase())){
						return true;
					}
					else if (!(temp2.toLowerCase().equals(" ") ||
							   temp2.toLowerCase().equals("\t"))){
						noMatch=true;
					}
				}
				noMatch=false;
			}
		}
		return false;
	}

	/** return truw if contains token
	 * @param S the token to seearch for
	 * @return true if contains token
	 */
	public boolean containsToken(String S) {
		String temp;
		boolean inString=false;
		// search for token
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			// make sure no in string
			if (temp.equals("'")) {
				inString=!inString;
			}
			if (temp.toLowerCase().equals(S.toLowerCase()) && !inString){
				return true;
			}
		}
		return false;
	}
	
	
	public boolean containsTexToken(String S) {
		String temp;
		boolean inString=false;
		// search for token
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S.toLowerCase()) && !inString){
				return true;
			}
		}
		return false;
	}
	
	
	
	/** return true if tokenized line fist token is S 
	 * @param S token to search for
	 * @return true if contains token
	 */
	public boolean firstTokenEquals(String S) {
		String firstToken;
		if (tokens.size()>0){
			firstToken=(String)tokens.elementAt(0);
			if (firstToken.toLowerCase().equals(S.toLowerCase())){
				return true;	
			}
		}
		return false;
	}
	
	/** Return the first token after S, excluding spaces and tabs, returns empty string if token does not exist
	 * @param S token to search for
	 * @return the token to return
	 */
	public String getTokenAfter(String S) {
		String temp;
		boolean inString=false;
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.equals("'")) {
				inString=!inString;
			}
			if (temp.toLowerCase().equals(S.toLowerCase()) && !inString){
				for (int j=i+1;j<tokens.size();j++){
					temp=(String)tokens.elementAt(j);
					if (!temp.equals(" ") && !temp.equals("\t")){
						return temp;	
					}
				}
			}
		}
		return "";
	}
	
	/** Return the first tex token after S which is inside {}, excluding spaces and tabs, returns empty string if token does not exist
	 * @param S token to search for
	 * @return the token to return
	 */
	public String getTexTokenAfter(String S) {
		String temp;
		String name="";
		boolean bracket=false;
		boolean inString=false;
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S.toLowerCase()) && !inString){
				for (int j=i+1;j<tokens.size();j++){
					temp=(String)tokens.elementAt(j);
					if (temp.equals("}")){
						return name;
					}
					if (bracket){
						name=name+temp;	
					}
					if (temp.equals("{")){
						bracket=true;	
					}
				}
			}
		}
		return "";
	}
	
	
	public String toString() {
		
		return tokens.toString();
	}
	
	/** Splits the tokinzed line across the token S
	 * @param S the token to split across
	 * @return the split lines
	 */
	public Vector split (String S) {
		String token;
		String statment="";
		Vector vector=new Vector();
		int bracketCount=0;
		boolean inString=false;
		boolean newStatment=true;
		// search for token
		for (int i=0;i<tokens.size();i++){
			token=(String)tokens.elementAt(i);
			statment=statment+token;
			// split accross these
			if (newStatment) {
				if (token.toLowerCase().equals("type")||
					token.toLowerCase().equals("var")||
					token.toLowerCase().equals("const")){
					
					vector.addElement(statment);
					statment="";
				}
				// make sure not in ' ()
				else if (token.equals("'")) {
					inString=!inString;
				}
				else if (token.equals("(")) {
					bracketCount++;
				}
				else if (token.equals(")")) {
					bracketCount--;
				}
				else if(i==tokens.size()-1){
					vector.addElement(statment);
					statment="";
				}
				else {
					newStatment=false;
				}
			}
			else if (token.equals("'")) {
				inString=!inString;
			}
			else if (token.equals("(")) {
				bracketCount++;
			}
			else if (token.equals(")")) {
				bracketCount--;
			}

			else if (token.toLowerCase().equals(S.toLowerCase()) && !inString && bracketCount==0){
				
				vector.addElement(statment);
				statment="";
				newStatment=true;
			}
			else if (i==tokens.size()-1){
				vector.addElement(statment);
				statment="";
			}
						
			
		}
		return vector;
		
	}
}