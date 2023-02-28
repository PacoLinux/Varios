/**
 *  Pascal representation for VPTeX. 
 */

//package VPTeX;
package viper;
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

public class  Tokens {
	Vector tokens;
	
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
	//System.out.println(tokens);
    }// tokenizeLine()
	
	
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
	//System.out.println(tokens);
    }// tokenizeLine()
	
	
	public boolean containsStat(){
		
	String temp;
	for(int i=0;i<tokens.size();i++) {
	    temp=(String)tokens.elementAt(i);
	    if (temp.toLowerCase().equals("then")||
		temp.toLowerCase().equals("do") ||
		temp.toLowerCase().equals("else")) {
				
		for (int j=i+1;j<tokens.size();j++) {
		    temp=(String)tokens.elementAt(j);
		    if (!temp.toLowerCase().equals(" ") &&
				!temp.toLowerCase().equals("\t") &&
				!temp.toLowerCase().equals("")) {
				return true;
		    }
		}
	    }
	}
	return false;
    }
	
	public boolean containsTokenAndNotLast(String S) {
		
		String temp;
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S.toLowerCase())){
				for(int j=i+1;j<tokens.size();j++){
					temp=(String)tokens.elementAt(j);
					if (temp.toLowerCase().equals(";")) {
							return true;
				    }
				}
				return false;
			}
		}
		return false;
    }
	
	public boolean containsTokenAndLast(String S) {
		
		String temp;
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
	
	
	public boolean containsTokens(String S1, String S2) {
		String temp,temp2;
		boolean noMatch=false;
		for (int i=0;i<tokens.size();i++){
			temp=(String)tokens.elementAt(i);
			if (temp.toLowerCase().equals(S1.toLowerCase())){
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

	public boolean containsToken(String S) {
	String temp;
	boolean inString=false;
	for (int i=0;i<tokens.size();i++){
	    temp=(String)tokens.elementAt(i);
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
	for (int i=0;i<tokens.size();i++){
	    temp=(String)tokens.elementAt(i);
	    if (temp.toLowerCase().equals(S.toLowerCase()) && !inString){
			return true;
	    }
	}
	return false;
    }
	
	
    public boolean containsTokenSub(String S) {
	String temp;
	boolean inString=false;
	for (int i=0;i<tokens.size();i++){
	    temp=(String)tokens.elementAt(i);
		if (temp.equals("'")) {
			inString=!inString;
		}
		if (temp.equals("=")) {
			inString=!inString;
		}
	    if (temp.toLowerCase().equals(S.toLowerCase()) && !inString){
			return true;
	    }
	}
	return false;
    }
	
	
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
	
}