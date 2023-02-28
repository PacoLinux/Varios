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
/** Class for storing and reading a project and its details 
 */
public class ProjectManager {

    BufferedReader brk;
	/** file name */
    String file_name;	/** Project title */
    String projectTitle;	/**	The author of the project */
    String author;	/**	the Description of the project */
    String description="";
    String line="";	/** main file in the project */
    String main;
    String path;	/** Files in the project */
    Vector files=new Vector();
    String descPath="";
    
    /** Reads a project file and gets all relivent info     * @param fileName the name of the project */
    public ProjectManager (String fileName){
	file_name=fileName;
	open();

	try {
		// read in all the lines in the correct order
		projectTitle=brk.readLine();
		author=brk.readLine();
		main=fixFileSeparators(brk.readLine());
		path=fixFileSeparators(brk.readLine());
		line=brk.readLine();
		while (!line.equals("*****NOFILESHERE****")) {
			description=description+line;
			line=brk.readLine();
		}
		descPath=fixFileSeparators(brk.readLine());
		line=fixFileSeparators(brk.readLine());
		while (line!=null) {
			files.addElement(line);
			line=fixFileSeparators(brk.readLine());
		}
	}
	catch (IOException x){
		System.exit(0);
	}

	files.removeElement(main);

    }

	/** Opens the file */
	private void open(){
		try {
			brk = new BufferedReader(new FileReader(file_name));
		}

		// Deal with the IOException
		catch(IOException x){
			System.err.println("\n*** FileIn: Can't open input file " + file_name);
			System.exit(0);
		}		
	}
	private String fixFileSeparators(String path) {
		String sep =System.getProperty("file.separator");
		if (path == null) {
			return null;
		}
		else if (sep.equals("\\")) {
			return (path.replace('/','\\'));
		}
		else if (sep.equals("/")) {
			return (path.replace('\\','/'));
		}
		return null;
	}	/** Gets the title of the project
	 * @return the title
	 */
	public String getTitle() {
		return this.projectTitle;
	}
	/** Gets the author of the project
	 * @return the author
	 */
	public String getAuthor() {
		return this.author;
	}	/** Gets the main file of the project
	 * @return the main file name
	 */
	public String getMain() {
		return this.main;
	}	/** Gets the description of the project
	 * @return the description
	 */
	public String getDescription() {
		return this.description;
	}
	/** Gets the the file in the project
	 * @return the all the file names inside a vector
	 */
	public Vector getFiles() {
		return this.files;
	}
        /** Get the path for the description file
	 * @return the path
	 */
    public String getDescPath(){
	return this.descPath;
    }
}
