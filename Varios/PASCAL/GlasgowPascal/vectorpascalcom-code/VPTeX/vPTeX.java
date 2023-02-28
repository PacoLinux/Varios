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


public class vPTeX {

	/** A constant array to store the types of files	 */
	private final String types[]={"","Program ","Unit "};
	/** gets the extention of  file
	 * @param S the to get extention from
	 * @return the extetion
	 */
	private String getExtention(String S) {
		return (S.substring(S.length()-3,S.length()).toLowerCase());	
	}
	
	
	/** Method for extracting the file name from the complete path
	 * @param S The complete file path
	 * @return The file name
	 */
	private String getFileName(String S) {
		String temp=S.substring(S.lastIndexOf(System.getProperty("file.separator"))+1,S.length());
		return temp;
	}
	/** Method for extracting the file name min the extention from the complete path
	 * @param S The complete file path
	 * @return The file name
	 */
	private String getName(String S) {
		return (getFileName(S.substring(0, S.length()-4)));
	}
	
	/**outputs a string to a file
	 * @param fileName The to output string to
	 * @param S string to be ouput
	 * @param overwrite withier or not to overwrite the existing file
	 */
	public static void printToDoc (String fileName, String S, boolean overwrite) {
		// The name of the ouput file
		String name=fileName.substring(0, fileName.length()-4)+".tex";
		try {
			// Open file and output header stuff
			PrintWriter prs = new PrintWriter( new FileWriter(name,!overwrite));
			prs.println(S);
			prs.close();
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** Creates a TeX document from a pascal file or a projeect file
	 * @param fileName the file you wish to be converted either a .pas or a .prj
	 * @param type the level of detail to go into
	 * @param math withier or not mats convertor is on or not
	 */
	public boolean createVPTeX(String fileName,byte type,boolean maths, boolean contents) {

		String progName= getName(fileName);
		// if a pascal file then send to convertor
		if (getExtention(fileName).equals("pas")) {
			
			// output heading
			PascalFile temp = new PascalFile(fileName);
			printToDoc(fileName,"\\documentclass[10pt, a4paper]{article}\n"+
								"\\usepackage{graphicx, epsfig}\n"+
								"\\reversemarginpar\n" +
								"\\title{"+types[temp.getFileType()]+Line.formatString(progName)+"}\n"+
								"\\begin{document}\n"+
								"\\maketitle\n",true);
			
			if (contents) {
				printToDoc(fileName,"\\tableofcontents\n"+
									"\\pagebreak\n",false);
			}
			temp.createLatex(type, maths,false);
			printToDoc(fileName,"\\end{document}",false);
		}
		// else if .prf get all info in project
		else if (getExtention(fileName).equals("prj")) {
			ProjectManager project = new ProjectManager(fileName);
			String author=project.getAuthor();
			String title=project.getTitle();
			String description=project.getDescription();
			String main=project.getMain();
			Vector files=project.getFiles();
			String descPath=project.getDescPath();
			String file;

			// output heading
			printToDoc(fileName,"\\documentclass[10pt, a4paper]{report}\n"+
								"\\usepackage{graphicx, epsfig}\n"+
								"\\reversemarginpar\n" +
								"\\title{"+Line.formatString(title)+"}\n"+
								"\\author{"+Line.formatString(author)+"}\n"+
								"\\begin{document}\n"+
								"\\maketitle\n",true);

			if (contents) {
				printToDoc(fileName,"\\tableofcontents\n"+
									"\\pagebreak\n",false);
			}
			if (descPath!=""){
			    printToDoc(fileName,"\\chapter{Description}",false);
			    PascalReader desc=new PascalReader(descPath);
			    String line=desc.readLine();
			    boolean atFiles=false;
			    printToDoc(fileName,"\\begin{tabbing}",false);
			   // printToDoc(fileName,"\\parbox{14cm}{",false);
			    while (line!=null){
				if (atFiles){
				    printToDoc(fileName,"\\parbox{14cm}{"+Line.formatString(getFileName(line))+"}\\\\\n",false);
				}
				else {
				    printToDoc(fileName,"\\parbox{14cm}{"+Line.formatString(line)+"}\\\\\n",false);
				}
				if (line.equals("Current Files in Project: ")){
				    atFiles=true;
				}
				
				line=desc.readLine();
				
			    }
			    printToDoc(fileName,"\\end{tabbing}",false);


			}
			// output main
			if (main.length()>4){
				PascalFile mainFile = new PascalFile(main);
				mainFile.createLatex(type, maths,true);


				printToDoc(fileName,"\\chapter{"+types[mainFile.getFileType()]+Line.formatString(getName(main))+"}",false);
				printToDoc(fileName,"\\input{"+getName(main)+"}",false);
			}

			// for all files in project output
			for (int i=0;i<files.size();i++) {
				file=(String)files.elementAt(i);
				PascalFile File = new PascalFile(file);
				File.createLatex(type, maths,true);

				printToDoc(fileName,"\\chapter{"+types[File.getFileType()]+Line.formatString(getName(file))+"}",false);
				printToDoc(fileName,"\\input{"+getName(file)+"}",false);
			}
			printToDoc(fileName,"\\end{document}",false);
		}
		return true;
	}   

    private String fourceNewLine(String S){
	String line="";
	for (int i=0;i<S.length();i++){
	    if (S.charAt(i)=='\n'){
		System.out.println("crap");
		line=line+" \\\\\n";
	    }
	    else{
		line=line+S.charAt(i);
	    }
	}
	return line;
    }

}
    
