

package viper;

import java.util.*;

public class FileNode implements Comparator {

	 private String filename;
	 private String parentname;
	 private int level;
	/**
	 * Constructors
	 */
	public FileNode ( String fn, int l ) {
		filename = fn;
		parentname = "Main File";
		level = l;
	}
	
	public FileNode (String name, FileNode fn) {
		filename = name;
		parentname = fn.nameOf();
		level = fn.levelOf()+1;
	}
	
	public String nameOf() {
		return filename;
	}
	
	public String parentOf() {
		return parentname;
	}
	
	public int levelOf() {
		return level;
	}
	
	public void changeLevel(int newLevel) {
		level = newLevel;
	}
	
	public int compare(Object o1, Object o2) {
		return ((FileNode)o1).level - ((FileNode)o2).level;
	}
	
	public String toString() {
		return "File Name : " + filename +"\nParent : " + parentname +"\nLevel : " + level;
	}
}


