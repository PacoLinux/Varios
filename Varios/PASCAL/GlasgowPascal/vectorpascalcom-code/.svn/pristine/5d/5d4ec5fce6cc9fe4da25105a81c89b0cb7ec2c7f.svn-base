/** 
 *  FileNodeList.java 
 */
package viper;

import java.util.*;
			 

public class FileNodeList {
	
	Vector list;
	
	/**
	 *  Constructor
	 */
	public FileNodeList() {
		list = new Vector();
	}
	private int exists(FileNode fn){
		int result = -1;
		for (int i = 0; i < list.size(); i++) {
			if(((FileNode)list.elementAt(i)).nameOf().equals(fn.nameOf()))
				result = i;
		}
		return result;
	}
		
	public void addFileNode(FileNode fn) {
		int i = this.exists(fn);
		if (i>=0) {
			FileNode temp =  (FileNode)list.elementAt(i);
			temp.changeLevel(fn.levelOf());
			list.setElementAt(temp,i);
		}
		else list.addElement(fn);
	}
	public String[] getFilesAtLevel(int l){
		Vector files = new Vector();
		for (int i = 0; i< list.size(); i++) {
			if (((FileNode)list.elementAt(i)).levelOf() == l)
				files.addElement(((FileNode)list.elementAt(i)).nameOf());
		}
		if (!(files.isEmpty())) {
			String[] fileList = new String[files.size()];
			for(int i = 0; i < files.size(); i++) {
				
				fileList[i] = (String)files.elementAt(i);
			}
		    return fileList;	
		}
		return null;
	}
		
	public String toString(){
		String string = "";
		for (int i = 0; i < list.size();i++) {
		     string = string + ((FileNode)list.elementAt(i)) + "\n";
		}
		return string;
	}
}         

