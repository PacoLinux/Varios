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

/** Class for storing two objects together */
class Tuple {	

	Object x,y;

	Tuple(Object X, Object Y) {
		x=X;
		y=Y;
	}
	/* Returns the first object */
	Object get_x() {
		return x;
	}

	/* Returns the second object */
	Object get_y() {
		return y;
	}
}

/** Class to create and store the LaTeX representation of the Pascal file */
public class PascalFile {
	/** Stores the contents of the file */
	private Vector document;
	/** Keeps track of the selected text */
	private boolean selected=false;
	/** Is the file a program or a unit    */
	private int fileType=0;
	/** The name of the file */
	private String file_name;
	/** The name of the program */
	private String progName;
	/** Keeps track of where we are in the program */
	private String path;	
	/** Used for reading from a file */
	private PascalReader reader;
	/** keeps track of the number of unEnded begins */
	private int beginCount= 0;
	/** Used for procedure nestings */
	private Vector procedureQue= new Vector();	
	/** Keeps track of of where implementation starts, if applicable */
	private int implementation=-1;
	/** Keeps track of of where the interface starts, if applicable */
	private int pascalInterface=-1;
	
	/** Constants given to each method type */
	private final int procedure=0;	
	private final int function=1;
	private final int constructor=2;
	private final int destructor=3;
	private final int none=5;
	
	/** Constants for each of the levels */
	private final byte level1 = 0;
	private final byte level2 = 1;
	private final byte level3 = 2;
	private final byte level4 = 3;
	private final byte level5 = 4;

	/** Constants for each of the file types */
	private final int unknown=0;
	private final int program=1;
	private final int unit=2;
	
	/** true if in declaration part of program or sub-programs */
	private boolean beforeBegin=false;
	
	/** Constants for keeping track of the line types */
	private int lineType=0;
	private final int simple=0;
	private final int var=1;
	private final int cons=2;
	private final int type=3;
	
	/**	tabbing positions */
	private final String tabbingPos="***\\=***\\=***\\=***\\=***\\=***\\=***\\=***\\=***\\=***\\=***\\=***\\=***\\=\\kill";
	/** true if in record */
	private boolean record=false;
	
	/** Constructor for Pascal File. Takes a file name and constructs the LaTeX file 
	 * @param name The name of the file which is to be processed
	 */
	public	PascalFile(String name) {
		file_name= name;
		// Get program name
		progName= getFileName(name.substring(0, name.length()-4));

		path=progName;	// Set current path to the program name
		reader=new PascalReader(name);		// Open file to be read
		
		document=new Vector();	
			
		// parse the file
		parse();	
	}



	/** Parses the file */
	private void parse() {
		String line="";			// The line to be read
		State state=new State();
		int lineType;			// Keeps track of the line type
		 lineNo=1;			// The line number

		// While more lines loop
		while (line!=null) {	
			
			// Read line
			line = reader.readLine();	
			if (line!=null) {
				
				addLineToDocument(state,lineNo,line.trim()); // Add the line to the document

			}
			lineNo++;		   // Increment line number
		}
	}

int lineNo=1;

	/** Adds a line to a document depending on the type 
	 * @param type The integer representing the type of the line
	 * @param lineNo The line number in the source where this line appears
	 * @param S The line which is to be added
	 */
	private void addLineToDocument(State state, int lineNo, String S) {
		
		// Check the line
		state.checkLine(S);

		ProcedureLine procLine;

		// get the code and comments
		String specComment=state.getSpecComments().trim();
		String comment=state.getComment().trim();
		String codeLines=state.getCode().trim();
		String commentNoBrack=state.getCommentsWithNoBrackets().trim();
		
		
		// if there is code then most be code line
		if (!codeLines.equals("")){

			// tokinize line
			Tokens split =new Tokens();
			// split up into statments
			split.tokenizeLine(codeLines);
			Vector statments=split.split(";");
			String codeLine;
			// for all the statments and the statment
			for (int i=0;i<statments.size();i++){
				
				codeLine=(String)statments.elementAt(i);
				codeLine=codeLine.trim();
				/* Find out if the line is a procedure declaration & what 
				type it is, ie function, procedure etc. */
				Tuple pro= isProcedureLine(codeLine,lineNo);
				Integer integer=(Integer)(pro.get_x()); // get the type

				// check to see if line is not a declaration
				if (beginCount>0) {
					lineType=simple;
				}
				
				// If the line was not a procedure declaration then add a code
				// line to the document
				Tokens tokens = new Tokens();
				tokens.tokenizeLine(codeLine);
				if (integer.byteValue()==none) {
					// line conatains progaram then file program
					if (tokens.containsToken("program")) {
						fileType=program;
						document.addElement(new CodeLine(codeLine,
														 lineNo,commentNoBrack,
														 lineType,true));
					}
					// line conatains unit then file unit
					else if (tokens.containsToken("unit")) {
						fileType=unit;
						document.addElement(new CodeLine(codeLine,
														 lineNo,commentNoBrack,
														 lineType,true));
					}
					// line conatains end. then file select line
					else if (tokens.containsTokens("end",".")){
						document.addElement(new CodeLine(codeLine,
														 lineNo,commentNoBrack,
														 lineType,true));
					}
					else {
						document.addElement(new CodeLine(codeLine,
														 lineNo,commentNoBrack,
														 lineType,selected));
					}
				}
				// else if unit and not in implementation
				else if (implementation==-1 && fileType==unit) {
					document.addElement(new ProcedureLine(codeLine,
														  lineNo,commentNoBrack,
														  (String)(pro.get_y()),
														  path,
														  integer.byteValue(),selected));


				}
				else {
					// Add a procedure line to the document
					ProcedureLine procedureLine=new ProcedureLine(codeLine,
																  lineNo,commentNoBrack,
																  (String)(pro.get_y()),
																  path,
																  integer.byteValue(),selected);
					document.addElement(procedureLine);

					// Add this procedure to the queue
					procedureQue.addElement(procedureLine);

					// Change the path that we are currently in
					path=path+"/";
					path=path+(String)(pro.get_y());
				}

				// if forward sub program
				if (tokens.containsToken("forward") && procedureQue.size()>0){
					path=removeLast(path);
					ProcedureLine procedureLine=(ProcedureLine)procedureQue.lastElement();
					procedureLine.setFowrard();
					procedureQue.removeElementAt(procedureQue.size()-1);
				}
				// if external sub program
				if (tokens.containsToken("external") && procedureQue.size()>0){
					path=removeLast(path);
					ProcedureLine procedureLine=(ProcedureLine)procedureQue.lastElement();
					int index=document.indexOf(procedureLine);
					if (index!=-1){
						document.removeElementAt(index);

						document.add(index,new CodeLine(procedureLine.getContent(),
														procedureLine.getLineNo(),
														"",type,procedureLine.getSelected()));
					}
					procedureQue.removeElementAt(procedureQue.size()-1);
				}
				// Check to see if the code line contaned the word "begin" or "case"
				if (tokens.containsToken("begin") ||
					tokens.containsToken("case")) {
					if (beginCount==0) {
						CodeLine codeL = (CodeLine)document.lastElement();
						codeL.setSelected();
					}
					beginCount++;	// increment begin count
				}
				// Check to see if the code line contaned the word "record"
				if (tokens.containsToken("record")) {
					beginCount++;
					record=true;
				}
				// Check to see if the code line contaned the word "end" and in recored
				if (tokens.containsToken("end") && record) {
					beginCount--;
					record=false;
				}
				// Else check to see if the code line contaned the word "end"
				else if	(tokens.containsToken("end") && !contains("end.",codeLine)) {
					beginCount--; // decrement begin count

					// if begin count is equal to zero the we have reached the end of a
					// procedure, function etc.
					if (beginCount==0 && procedureQue.size()>0){

						// move the path down a level
						path=removeLast(path);
						// find the procedure that that was ended
						procLine=(ProcedureLine)procedureQue.lastElement();
						procedureQue.removeElementAt(procedureQue.size()-1);
						// remove the last line as it was an procedure end line
						document.removeElementAt(document.size()-1);
						// add a procedure end line
						document.addElement(new ProcedureEndLine(codeLine,lineNo,
																 commentNoBrack,procLine.getName(),procLine.getDeclared(),procLine.getType(),procLine.getSelected()));
					}
				}
				commentNoBrack="";
			}
		}
		// if empty line then add an empty line to the document
		else if (!comment.equals(""))
			document.addElement(new CommentLine(comment, lineNo, selected));
		
		//	document.addElement(new EmptyLine(lineNo, selected));

		// if empty comment then add a comment line to the document
		if (!specComment.equals("")) {
			
			//System.out.println("%"+S+"%");
			if (specComment.toLowerCase().equals("begin")){
				selected=true;
				for (int i=0; i<procedureQue.size();i++) {
					ProcedureLine procedureLine =(ProcedureLine)procedureQue.elementAt(i);
					procedureLine.setSelected();
				}
			}
			else if (specComment.toLowerCase().equals("end")){
				selected=false;
			}
			else {
				document.addElement(new SpecCommentLine(specComment,lineNo, selected));
			}
		}
		

		// If empty special comment then add a special comment to the document
		if (comment.equals("") && specComment.equals("") && codeLines.equals("")) {
			document.addElement(new EmptyLine(lineNo, selected));
		}


		
		
	}

	/** Method for extracting the file name from the complete path
	 * @param S The complete file path
	 * @return The file name
	 */
	private String getFileName(String S) {
		// get name
		String temp=S.substring(S.lastIndexOf(System.getProperty("file.separator"))+1,S.length());
		return temp;
	}

	/** Remove the last procedure from the path 
	 * @param p The String representing the current path
	 * @return The updated String representing the path
	 */
	private String removeLast(String p) {
		
		// find the last accurence of '/'
		
		int pos = p.lastIndexOf("/");
		// remove everthing after that
		if (pos==-1)
			return path;
		else
			return (p.substring(0,pos));
		
	}

	/** Finds out if the line is a procedure Line, returns a tuple with the first element
	 *  as an int representing the procdure type, which is 5 if the the line is not a procedure
	 *  line, the second element is the procedure name.
	 *  @param S The line which is to be checked
	 *  @return A tuple containing the int type of the procedure and the String which is the procedure name
	 */
	private Tuple isProcedureLine (String S,int lineNo){
		// Find out if the line has the key words
		Tokens tokens =new Tokens();
		tokens.tokenizeLine(S);

		// check to see if there are any key words in the line
		// and act accordingly
		if (tokens.firstTokenEquals("var")) {
			lineType=var;
		}
		if (tokens.firstTokenEquals("const")) {
			lineType=cons;
		}
		if (tokens.firstTokenEquals("type")) {
			lineType=type;
		}

		if (tokens.containsToken("implementation")) {
			implementation=lineNo;
		}
		if (tokens.containsToken("interface")) {
			pascalInterface=lineNo;
		}
		// If line contains the word "procedure" then return a procedure line
		if (tokens.firstTokenEquals("procedure")) {
			return (new Tuple(new Integer(procedure),SplitString(S)));
		}
		// If line contains the word "function" then return a function line
		else if (tokens.firstTokenEquals("function")) {
			return (new Tuple(new Integer(function),SplitString(S)));
		}
		// If line contains the word "constructor" then return a constructor line
		else if (tokens.firstTokenEquals("constructor")) {
			return (new Tuple(new Integer(constructor),SplitString(S)));
		}
		// if line contains the word "destructor" then return a destructor line
		else if (tokens.firstTokenEquals("destructor")) {
			return (new Tuple(new Integer(destructor),SplitString(S)));
		}
		// else line is not procedure, function etc
		return (new Tuple(new Integer(5),""));
		

	}

	


	/** Finds the name of a procedure in a line
	 *  that contains the procedure declaration
	 * @return The name of the procedure
	 * @param stringname The procedure delaration line
	 */
	private String SplitString(String stringname)
	{
		String s = null;
		char c;
		int i=0;
		boolean found=false;
		
		// Find the last character in the procedure name
		while (i < stringname.length() && !found) {
			c = stringname.charAt(i);
			if (c==';' || c=='(' || c=='{' || c==':')
				found=true;
			i++;
		}

		if (i>1)
			s= stringname.substring(0,i-1);

		// Remove all spaces from the string
		StringTokenizer t = new StringTokenizer(s, " ");
		while (t.hasMoreTokens())
			s = t.nextToken().trim();
		return s;
	}

    /** Returns true if the String S is contained within String S2 */
    private boolean contains (String S, String S2) {

	int pos = S2.toLowerCase().indexOf(S.toLowerCase());
	int lastPos = pos+S.length();

	return (
		pos!=-1 
		&&	((pos==0)||
			 (S2.charAt(pos-1)==' ')||
			 (S2.charAt(pos-1)=='\t'))
		&&	((S2.length()==lastPos)||
			 (S2.charAt(lastPos)==' ') ||
			 (S2.charAt(lastPos)=='\t') || 
			 (S2.charAt(lastPos)=='\n') ||
			 (S2.charAt(lastPos)=='.') ||
			 (S2.charAt(lastPos)==';') || 
			 (S2.charAt(lastPos)==':'))
		);

    }


	/**  Public method to create the LaTeX output file from the parsed Pascal file
	 * @param level The level of detail to go into
	 * @param math If you want math mode on
	 * @param overwrite If you wish to overwrite the existing file
	 * */
	public void createLatex (byte level, boolean math, boolean overwrite) {

		String name=file_name.substring(0, file_name.length()-4)+".tex";       // The name of the ouput file
		Vector proStartEnd = new Vector(); // Used to keep track of all the procdure starts and ends
		ProcedureLine proLine;
		ProcedureEndLine proEndLine;
		String proName,ProEndName;
		boolean found=false;
		int start,end;

		Tab tabing= new Tab();

		try {
			// Open file
			PrintWriter prs = new PrintWriter( new FileWriter(name,!overwrite));

			// start tabing
			prs.println("\\begin{tabbing}");

			prs.println(tabbingPos);
			int i=0;

			CodeLine line;

			// Loop through the whole program
			while (i<document.size()) {
				Line l=(Line)document.elementAt(i);
				// if selected and leve4
				if (level!=level4 || l.getSelected()) {

					// if special comment
					if (document.elementAt(i) instanceof SpecCommentLine && level>level1) {
						// end tabbing
						if (i>0){
							if (!(document.elementAt(i-1) instanceof SpecCommentLine)) {
								prs.println("\\end{tabbing}");
							}
						}
						else {
							prs.println("\\end{tabbing}");
						}
						// output line
						prs.println(document.elementAt(i));

					}
					else {

						if (i>0){
							Line temp2 =(Line)document.elementAt(i-1);
							// if last line was a special comment
							if ((document.elementAt(i-1) instanceof SpecCommentLine) && level>level1
								&& (level!=level4 || temp2.getSelected())) {
								// start tabbing again, and reset to last tabbing pos
								prs.println("\\begin{tabbing}");
								prs.println(tabbingPos);
								for (int j =0; j<tabing.getTabCount();j++){
									prs.print("\\+ ");
								}
								prs.println("\\\\");
							}
						}


						// If the line is a ProcedureLine then do not output the source code for
						// that procedure just output a reference to the source code
						if (document.elementAt(i) instanceof ProcedureLine)	{
							proLine=(ProcedureLine)(document.elementAt(i));
							prs.print(tabing.tabLine(proLine.getContent()));
							// if in interface
							if (fileType!=unit || i>implementation)	{
								start=i;

								proName=proLine.getName();
								if (fileType!=unit || level>level3) {
									// if greater than level 3 output line and ref
									if (level>level3) {
										prs.println(proLine.toStringRef());
									}
									// else just output line
									else {
										prs.println(proLine.toString()+'\n'+"\\\\");

									}
								}

								if (!proLine.getFowrard()) {
									// Find	the	end	of the procedure
									while (i<document.size() &&	!found){
										if ((document.elementAt(i) instanceof ProcedureEndLine)) {
											proEndLine=(ProcedureEndLine)(document.elementAt(i));
											if (proEndLine.getName().equals(proName))
												found=true;
										}
										i++;
									}

									found=false;
									end=i;

									// Keep	track of the lines to be output	later in document
									proStartEnd.addElement(new Tuple(new Integer(start), new Integer(end)));
									i--;
								}
							}
							// else output referance
							else {
								// if greater than level 3 output line and ref
								if (level>level3) {
									prs.println(proLine.toStringRef());
								}
								// else just output line
								else {
									prs.println(proLine.toString()+'\n'+"\\\\");

								}

							}
						}

						// else must be codeline so output line appropretly
						else if (level>level2){

							if (level!=level3 ||fileType!=unit || ( i>=pascalInterface-1 && i<implementation-1)){


								if (document.elementAt(i) instanceof CodeLine) {

									line=(CodeLine)document.elementAt(i);
									// print tabbing elements
									prs.print(tabing.tabLine(line.getContent()));
									prs.println(getCodeLine((CodeLine)document.elementAt(i),tabing, math));

								}
								else {
									prs.println(document.elementAt(i));
								}
							}
						}
					}
					i++;
				}
				// else not selected
				else {
					// ouput tabbing if it is a codeline, but kill the line so it is not output
					if (document.elementAt(i) instanceof CodeLine) {

						line=(CodeLine)document.elementAt(i);
						prs.println(tabing.tabLine(line.getContent())+"\\kill");
					}
					// if procedureline then
					if (document.elementAt(i) instanceof ProcedureLine) {
						proLine=(ProcedureLine)document.elementAt(i);
						proName=proLine.getName();
						if (!proLine.getFowrard()) {
							// Find	the	end	of the procedure
							while (i<document.size() &&	!found){
								if ((document.elementAt(i) instanceof ProcedureEndLine)) {
									proEndLine=(ProcedureEndLine)(document.elementAt(i));
									if (proEndLine.getName().equals(proName))
										found=true;
								}
								i++;
							}
							found=false;
						}
					}
					i++;
				}
			}
			prs.println("\\end{tabbing}");
			// Now output the source for all the procedures
			while (proStartEnd.size()>0 && level>level3){

				Tuple temp=(Tuple)proStartEnd.firstElement();
				proStartEnd.removeElementAt(0);
				Integer x=(Integer)temp.get_x();
				Integer y=(Integer)temp.get_y();

				i=x.intValue();
				end=y.intValue();
				// Output the first line of the procedure, and create an new section
				ProcedureLine procedureLine= (ProcedureLine) document.elementAt(i);
				if (level!=level4 || procedureLine.getSelected()) {
					prs.println(procedureLine.sectionHead());
					// reset tabbing
					tabing.reset();
					prs.print("\\begin{tabbing}\n");
					// print the line and tabbing
					prs.println(tabbingPos);
					prs.println(getCodeLine(procedureLine,tabing, math&&false));
					i++;


					// While there is still code left in procedure loop
					while (i< y.intValue()) {

						Line l=(Line)document.elementAt(i);
						if (level!=level4 || l.getSelected()) {
							// Else output the formatted line
							if (document.elementAt(i) instanceof SpecCommentLine ) {
								if (i>0){
									if (!(document.elementAt(i-1) instanceof SpecCommentLine)) {
										prs.println("\\end{tabbing}");
									}
								}
								else {
									prs.println("\\end{tabbing}");
								}
								prs.println(document.elementAt(i));

							}
							else {

								if (i>0){
									Line temp2 =(Line)document.elementAt(i-1);
									// if last line was a special comment
									if ((document.elementAt(i-1) instanceof SpecCommentLine)
										&& (level!=level4 ||temp2.getSelected())) {
										// start tabbing agiain and reset tabbing
										prs.println("\\begin{tabbing}");
										prs.println(tabbingPos);
										for (int j =0; j<tabing.getTabCount();j++){
											prs.print("\\+ ");
										}
										prs.println("\\\\");
									}
								}
								// If the line is a ProcedureLine then do not output the source code for
								// that procedure just output a reference to the source code
								if (document.elementAt(i) instanceof ProcedureLine) {
									start=i;
									proLine=(ProcedureLine)(document.elementAt(i));
									prs.print(tabing.tabLine(proLine.getContent()));
									proName=proLine.getName();
									prs.println(proLine.toStringRef());

									// find the end of the procedure
									if (!proLine.getFowrard()) {
										// Find	the	end	of the procedure
										while (i<document.size() &&	!found){
											if ((document.elementAt(i) instanceof ProcedureEndLine)) {
												proEndLine=(ProcedureEndLine)(document.elementAt(i));
												if (proEndLine.getName().equals(proName))
													found=true;
											}
											i++;
										}

										found=false;
										end=i;

										// Keep	track of the lines to be output	later in document
										proStartEnd.addElement(new Tuple(new Integer(start), new Integer(end)));
										i--;
									}
								}
								// if codeline output it and tabbing
								else if (document.elementAt(i) instanceof CodeLine ) {
									line=(CodeLine)document.elementAt(i);
									prs.print(tabing.tabLine(line.getContent()));
									prs.println(getCodeLine((CodeLine)document.elementAt(i),tabing, math));
								}
								else {
									prs.println(document.elementAt(i));
								}

							}
							i++;
						}
						// else not selected
						else {
							if (document.elementAt(i) instanceof CodeLine) {
								// ouput tabbing if it is a codeline, but kill the line so it is not output
								line=(CodeLine)document.elementAt(i);
								prs.println(tabing.tabLine(line.getContent())+"\\kill");
							}
							// if procedureline then
							if (document.elementAt(i) instanceof ProcedureLine) {
								proLine=(ProcedureLine)document.elementAt(i);
								proName=proLine.getName();
								if (!proLine.getFowrard()) {
									// Find	the	end	of the procedure
									while (i<document.size() &&	!found){
										if ((document.elementAt(i) instanceof ProcedureEndLine)) {
											proEndLine=(ProcedureEndLine)(document.elementAt(i));
											if (proEndLine.getName().equals(proName))
												found=true;
										}
										i++;
									}
									found=false;
								}
							}
							i++;
						}
					}
					prs.println("\\end{tabbing}");
				}
			}
			prs.close();
		}
		catch (Exception e) {
			e.printStackTrace();
			//throw new ilcg.SyntaxError(" in parsing latex"+e,lineNo);
		}

	}


	/** Method for finding out if string is contained in the token
	 * @param V The vector of tokens
	 * @param S The string that is being searched for
	 * @return true if contained in tokens
	 */
	protected boolean containsToken(Vector V,String S) {
		String temp;
		for (int i=0;i<V.size();i++){
			temp=(String)V.elementAt(i);
			if (temp.toLowerCase().equals(S.toLowerCase())){
				return true;
			}
		}
		return false;
	}
	
	/** Private method to split the code line up into tokens.  Used to separate a line
	 *  prior to embolding keywords and emphasising variables.
	 *  @return A Vector of the tokens in this line
	 */
	protected Vector tokenizeLine(String S){
		// Initialise the Vector of tokens
		Vector tokens= new Vector();
		// Integer used to mark the start of a token
		int    startTokenMarker= 0;

		if (S.length()==1) {
			tokens.addElement(S);
			return tokens;
		}
		else {
			// Loop through the content String of the CodeLine 
			for(int i=0; i<S.length(); i++){
				char c= S.charAt(i);
				// If we are not at the start of the line
				if(i>0){
					if(c== ' ' || c== '(' || c== ')' || c== ',' || c== ';' || c== ':' || c== '[' || c== ']' ||
					   c== '+' || c== '-' || c== '/' || c== '*' || c== '<' || c== '>' || c== '=' || c== '\\'||
					   c== '.' || c== '\t'|| c== '\''|| c== '@' || c== '^'){

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
					   c== '.' || c== '\t'|| c== '\''|| c== '@' || c== '^'){
						// Add the separator to the token list
						tokens.addElement(S.substring(i,i+1));
						// Update the startTokenMarker
						startTokenMarker= i+1;
					}
				}
			}
		}
		return tokens;
	}// tokenizeLine()

    /** Private method to return the LaTeX for a code line. Any possible 
     *  mathematical transformation will be called from within this method.
     * @param C The codeline to be processed
     * @param tabCount The number of tab characters that this line is to be indented
     * @param m Whether the mathematical transformation option is set
     * @return The line to be output to the LaTeX document 
     */
    private String getCodeLine(CodeLine C, Tab tab, boolean m) {
	// A list of Vector Pascal keywords
	Keywords keywords= new Keywords();
	// Vector to store the tokens in this line
	Vector   lineTokens= new Vector();
	// String of the codeLine with spaces removed
	String   noSpaces= (C.content);
	// Vector of the keywords which could share a line with mathematically translateable statements
	Vector mathLineKeywords= new Vector(); 
  
	// The section of a code line selected for mathematical translation
	String   changeValue;
	// The section of the code line following mathematical translation
	String   changedValue= "";
	// Whether this line is a simple statement
	boolean  isSimpleStatement= false;

	/* Initialise the list of mathLineKeywords */
	mathLineKeywords.addElement("IF");
	mathLineKeywords.addElement("WHILE");
	mathLineKeywords.addElement("FOR");
	mathLineKeywords.addElement("THEN");
	mathLineKeywords.addElement("CASE");
	mathLineKeywords.addElement("AND");
	mathLineKeywords.addElement("DO");
	mathLineKeywords.addElement("OF");
        mathLineKeywords.addElement("ARRAY");
	mathLineKeywords.addElement("PROCEDURE");
	mathLineKeywords.addElement("IN");
	mathLineKeywords.addElement("DOWNTO");
	mathLineKeywords.addElement("ELSE");
	mathLineKeywords.addElement("FUNCTION");
	mathLineKeywords.addElement("REPEAT");
	mathLineKeywords.addElement("TO");
	mathLineKeywords.addElement("WITH");
	mathLineKeywords.addElement("UNTIL");
	mathLineKeywords.addElement("GOTO");
	mathLineKeywords.addElement("VAR");

	// Tokenize the line
	lineTokens= tokenizeLine(noSpaces);
	// The first token in the line
	String   firstToken= (String)(lineTokens.firstElement());
	String   thisToken = firstToken;
        int i;
        boolean keyword=false;
        for (i=0;i<lineTokens.size();i++)
        {
           String atoken = lineTokens.elementAt(i).toString();
           if( (atoken.toUpperCase()).equals("ARRAY")) keyword=true;
        }
	isSimpleStatement= (!keyword) &&(CodeLine.isValidIdentifier(firstToken) ) && 
			(!(keywords.contents).contains(firstToken.toUpperCase()) || 
			    (firstToken.toUpperCase()).equals("WRITE") || 
			(firstToken.toUpperCase()).equals("WRITELN"));
        // If the line is a simple statement and maths translation is on
	if(isSimpleStatement && m){

	    // Do math conversion for whole line
	    changeValue= C.content;
	    try{
		changedValue= VpMath.simpleToMath(changeValue, tab.getActualTabCount(),C.getLineType());
		C.Math= true;
	    }
	    catch(SyntaxError s){
		C.Math= false;
		changedValue= C.content;
	    }
	    // Update the content of the CodeLine
	    C.content= changedValue;
	}

	// Otherwise, find sections of the line which could be mathematically translated
	else{
	    boolean thisLineString= false;
	    boolean succeededInLine= false;
	    boolean mathChanged= false;
	    int     keywordCount= 0;
	    String  token;
	    String  secondElement;
	    boolean isLabel= false;
	    boolean found= false;
	    String  checkToken;
	    boolean inString= false;

	    // Determine whether the line starts with a label ie 10: or label:
	    int p= 0;
	    while(keywordCount< 1 && !isLabel && p<lineTokens.size()){
		checkToken= (String)(lineTokens.elementAt(p));
		if(checkToken.equals("'"))
		    inString= !inString;
		if (checkToken.equals(":") &&(lineTokens.size()>p+1? !(((String)(lineTokens.elementAt(p+1))).equals("=")):true) && !inString)
		    isLabel= true;
		if ((keywords.contents).contains(checkToken.toUpperCase()))
		    keywordCount++;
		p++;
	    }
	    inString= false;
	    keywordCount= 0;

		// If the first token on a line is a mathLineKeyword or a label and Math translation is on
		if ((mathLineKeywords.contains(firstToken.toUpperCase()) || isLabel) && m){

		    keywordCount= 1;
		    
		    int  endMathSection = 1;

		    // Set the content of this CodeLine to empty
		    C.content= "";

		    // If the line starts with a label, skip past the label
		    if(isLabel){
			while(endMathSection< p && endMathSection<lineTokens.size()){ 
			    // Set the content to the start fo the line
			    C.content+= Line.formatString((String)(lineTokens.elementAt(endMathSection)));
			    endMathSection++;
			}
      		    }

		    // If the line contains more than 1 token, get the next token in the line
		    if (endMathSection<lineTokens.size())
			thisToken= (String)(lineTokens.elementAt(endMathSection));

		    // Skip spaces
		    while (thisToken.equals(" ") && isLabel){
			endMathSection++;
			thisToken= (String)(lineTokens.elementAt(endMathSection));
		    }

		    // If the rest of the line following the label is not maths convertible
		    // skip to the end of the line and set math to false

		    if ((keywords.contents).contains(thisToken.toUpperCase()) && !(mathLineKeywords.contains(thisToken.toUpperCase()))){
			while(endMathSection<lineTokens.size()){
			    C.content+= (String)(lineTokens.elementAt(endMathSection));
			    endMathSection++;
			}
			mathChanged= false;
		    }
		    
		    // While we are not at the end of the line
		    while(endMathSection<lineTokens.size()){

			String mathSection  =""; // The String to be passed to the Maths converter
     			boolean notKeyword= true; // True when the current token is in mathLineKeywords

			changedValue= "";

			// Find either the end of the line or the end of this math section
			while(notKeyword &&  (String)thisToken!=";" && endMathSection<lineTokens.size()){
			    // Move on to the next token in the line
			    thisToken= (String)(lineTokens.elementAt(endMathSection));

			    if(thisToken.equals("'"))
				inString= !inString;

			    // If a math line keyword is found set notKeyword to false
			    if(mathLineKeywords.contains(thisToken.toUpperCase()) && !inString){
				notKeyword= false;
				keywordCount++;
			    }
			    else
				// Add this token to the section to be mathematically translated
				mathSection+= thisToken;
			    endMathSection++;
			}

			// Perform mathematical transformation on the necessary section in the line
			try{
			    mathChanged= true;
			    if (mathSection.length()>0)
				changedValue= VpMath.simpleToMath(mathSection, 0, C.getLineType());
			}
			catch(SyntaxError s){
			    // Set mathChanged to false if the math conversion fails
			    changedValue= mathSection;
			}
			
			// Add the mathematically transformed section to the content for this codeline
			// along with the separating token, thisToken
			if (thisToken!=";" || thisToken!=" "){
			    // If math has succeeded
			    if (mathChanged){
				// Check to see if the current token is a keyword are requires emboldening
				if((keywords.contents).contains(thisToken.toUpperCase()))
				    C.content+= changedValue + " \\textbf{ " + (thisToken.toLowerCase()) + " } ";
				else
				    C.content+= changedValue;
			    }
			    // If math has failed do not highlight the keyword
			    else
				C.content+= changedValue;
			}
		    }
		    
		    // Add the first token where math succeeded
   		    if (mathChanged && !isLabel)
			C.content= "\\textsf {\\textbf {" + firstToken.toLowerCase() + " } " + C.content +"}";
		    // Add the first token if maths has failed or of it is a label
		    else if(isLabel || (mathLineKeywords.contains(firstToken.toUpperCase()) && !mathChanged)){
			C.content= firstToken + C.content;
			}
		    C.Math= mathChanged;
		}
	}
		String line="\\parbox{14cm}{"+C.toString()+"}\\\\";
		// if line had marge
		if (C.hasMarge()) {
			String temp="";
			Vector marges=new Vector();
			// move tab back to start
			for (int j =0; j<tab.getActualTabCount();j++){
				temp=temp+"\\<";
			}
			
			temp=temp+"\\parbox{3.5cm}{\\scriptsize{"+Line.formatString(C.getMarge())+"}}\\'";
			
			

			for (int j =0; j<tab.getActualTabCount();j++){
				temp=temp+"\\>";
			}
			temp=temp+line;
			

			

			return temp;
		}
		else {
			return line;
		}
	}

	/** Method to find what ype the file is
	 * @return 0 if program
	 * 1 if unit
	 * 2 if unknown
	 */
	public int getFileType() {
		
		return fileType;   
	}



}
