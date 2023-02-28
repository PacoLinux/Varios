 /* 
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

class PascalReader{

	private BufferedReader brk;
	private String file_name;
	private String buffer="";
	public PascalReader(String F) {
		file_name=F;
		open();
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
	public String readLine() {

		try {
			return brk.readLine();
		}
		catch(IOException x){
			System.err.println("\n*** FileIn: Can't read input file " + file_name);
			System.exit(0);
		}
		return null;
	}
	

}
