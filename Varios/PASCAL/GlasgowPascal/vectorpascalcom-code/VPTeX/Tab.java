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

/** Class to conduct tabing in latex with pascal files
 */
public class Tab {
	/** keeps track of wiether or not a control statment has begin */
	class controlStatment{
		public boolean hasBegin;
		
		public controlStatment(boolean b){
			hasBegin=b;
		}
		public String toString() {
			if (hasBegin)
			return ("true");
			else return "false";
		}
	}
	
	/** number of tab posision moved */
	private int tabCount=0;
	/** tab count encluding non preminant tab posistion */
	private int nonPermTabCount=0;
	/** weither or not the last line was a control statment */
	private boolean lastLineControl=false;
	/**	a stack for storing the control statments */
	private Vector statStack=new Vector();
	/** wiether or not in a declaration */
	private boolean declaration=false;
	
	/** takes in a line and returns the aproriate tabbing to do
	 * @param line the ine to be tabbed
	 * @return the tabbing that needs to be done */
	public String tabLine(String line) {
		int lastTabCount=tabCount;
		Tokens tokens=new Tokens();
		tokens.tokenizeLine(line);

		String tab="";
		nonPermTabCount=tabCount;
		try{
		// if line contains any of these words then in declaration
		if (tokens.firstTokenEquals("var")||
			tokens.firstTokenEquals("type")||
			tokens.firstTokenEquals("const")||
			tokens.firstTokenEquals("procedure")||
			tokens.firstTokenEquals("function")||
			tokens.firstTokenEquals("constructor")||
			tokens.firstTokenEquals("destructor")||
			tokens.firstTokenEquals("uses")){

			// if first time tab back
			if (declaration){
				tab=tab+"\\<";
				nonPermTabCount--;

			}
			else {
				tab=tab+"\\+";
				tabCount++;

				declaration=true;
			}
		}
		// if repeat tab out
		if (tokens.containsToken("repeat"))	{
			tab=tab+"\\+";
			tabCount++;
		}
		// if until tab back
		if (tokens.containsToken("until"))	{
			tab=tab+"\\-\\<";
			tabCount--;
			nonPermTabCount--;
		}
		// if case tab out
		if (tokens.containsToken("case"))	{
			tab=tab+"\\+";
			tabCount++;
			statStack.addElement(new controlStatment(true));

		}
		// if recored tab out and add to stack
		if (tokens.containsToken("record"))	{
			tab=tab+"\\+";
			tabCount++;
			statStack.addElement(new controlStatment(true));

		}
		// if loop then
		if (tokens.containsToken("do"))	{
			// if contains statment
			if (tokens.containsTokenAndNotLast("do")) {
				if (!tokens.containsTokens("do","begin")) {
					// tab back if predesising statment
					if (statStack.size()>0)	{
						controlStatment	temp=(controlStatment)statStack.lastElement();
						while (!temp.hasBegin && statStack.size()>0) {
							tab=tab+"\\-";
							tabCount--;
							statStack.removeElementAt(statStack.size()-1);
							if (statStack.size()>0){
								temp=(controlStatment)statStack.lastElement();
							}
						}
					}
				}
			}
			else {
				tab=tab+"\\+";
				tabCount++;
				statStack.addElement(new controlStatment(false));

				lastLineControl=true;
			}
		}
		// if if statment
		else if	(tokens.containsToken("then")) {
			// if contains else if
			if (tokens.containsTokens("else","if")) {
				if (lastLineControl) {
					statStack.removeElementAt(statStack.size()-1);
					tab=tab+"\\<\\-";
					nonPermTabCount--;
					tabCount--;

				}
			}
			// contains statment
			if (tokens.containsTokenAndNotLast("then"))	{

				if (!tokens.containsTokens("then","begin")){

					if (statStack.size()>0)	{
						controlStatment	temp=(controlStatment)statStack.lastElement();
						while (!temp.hasBegin && statStack.size()>0) {
							tab=tab+"\\-";
							tabCount--;
							statStack.removeElementAt(statStack.size()-1);
							if (statStack.size()>0){
								temp=(controlStatment)statStack.lastElement();
							}
						}
					}
				}
			}

			else {
				tab=tab+"\\+";
				tabCount++;
				statStack.addElement(new controlStatment(false));

				lastLineControl=true;
			}
			// if contains else
			if (tokens.containsTokenAndLast("else")) {
				tab=tab+"\\+";
				tabCount++;
				statStack.addElement(new controlStatment(false));
				lastLineControl=true;
			}
		}
		// if contains else
		else if	(tokens.containsToken("else")) {
			// if contains statment
			if (tokens.containsTokenAndNotLast("else"))	{
				if (!tokens.containsTokens("else","begin")){
					if (lastLineControl) {
						tab=tab+("\\-\\<");
						tabCount--;
						nonPermTabCount--;
						lastLineControl=false; //maybe not needed?
						statStack.removeElementAt(statStack.size()-1);
					}

				}
			}

			else {
				if (lastLineControl) {
					statStack.removeElementAt(statStack.size()-1);
					tab=tab+"\\<";
					nonPermTabCount--;
					statStack.addElement(new controlStatment(false));
				}
				else {
					tab=tab+"\\+";
					tabCount++;
					statStack.addElement(new controlStatment(false));

					lastLineControl=true;
				}
			}
		}
		// else if line is a statment
		else if (tokens.containsToken(";") && lastLineControl)try {
			if (!tokens.containsToken("end")) {

			controlStatment temp=(controlStatment)statStack.lastElement();
			while (!temp.hasBegin && statStack.size()>0) {
					tab=tab+"\\-";
					tabCount--;
					statStack.removeElementAt(statStack.size()-1);
					if (statStack.size()>0){
						temp=(controlStatment)statStack.lastElement();
					}
			}
			lastLineControl=false;
			}
		}catch(Exception e)
		{	lastLineControl=false;

		}
		// if contains begin and last line control statment then last control statment must have a begin
		if (tokens.containsToken("begin") && lastLineControl) {
			statStack.removeElementAt(statStack.size()-1);
			statStack.addElement(new controlStatment(true));
			tab=tab+"\\<";
			nonPermTabCount--;
			lastLineControl=false;
		}
		// else if contain begin
		else if (tokens.containsToken("begin")) {
			if (declaration) {
				tab=tab+"\\-\\<";
				declaration=false;
				tabCount--;
				nonPermTabCount--;
			}
			tab=tab+"\\+";
			tabCount++;
		}
		// if key words that need to be tabbed back
		if (tokens.containsToken("interface")) {
			tab=tab+"\\+";
			tabCount++;
		}
		
		if (tokens.containsToken("implementation")) {
			tab=tab+"\\<";
			nonPermTabCount--;
		}
		// if end then must be the end of somthing
		if (tokens.containsToken("end")) {
			if (statStack.size()>0) {
				controlStatment temp=(controlStatment)statStack.lastElement();
				if (temp.hasBegin) {
					tab=tab+"\\<\\-";
					nonPermTabCount--;
					tabCount--;
					statStack.removeElementAt(statStack.size()-1);
				}
				else {
					while (!temp.hasBegin && statStack.size()>0) {
						tab=tab+"\\<\\-";
						nonPermTabCount--;
						tabCount--;
						statStack.removeElementAt(statStack.size()-1);
						if (statStack.size()>0){
							temp=(controlStatment)statStack.lastElement();
						}
					}
					tab=tab+"\\<\\-";
					tabCount--;
					nonPermTabCount--;
					lastLineControl=false;
				}
			}
			else {
				tab=tab+"\\<\\-";
				nonPermTabCount--;
				tabCount--;
			}
		}
		}
		catch(Exception e){
			System.out.println("Tabbing error "+e);
		}
		// check to make sure there are no illegal tabs
		if (tabCount<0 || nonPermTabCount<0) {
			System.out.println("Tab error!:"+line);
			tabCount=lastTabCount;
			nonPermTabCount=lastTabCount;
			return "";
		}
		return tab;
	}
	/** returns the perminante tab count
	 * @return tabcount
	 */
	public int getTabCount() {
		return tabCount;	
	}
	/** returns the Actual tab count
	 * @return tabcount
	 */	
	public int getActualTabCount() {
		return nonPermTabCount;	
	}
	/** resets the tab
	 */	
	public void reset() {
		tabCount=0;
		nonPermTabCount=0;
		lastLineControl=false;
		statStack=new Vector();
		declaration=false;
	}
	
}
