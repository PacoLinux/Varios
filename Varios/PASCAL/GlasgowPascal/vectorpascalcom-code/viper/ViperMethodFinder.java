
/**
 * ViperMethodFinder.java 
 */
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

/** Class for stroring subprograms and there type
 */
class treeobject {
	/**	Name of the subprogram */
	String name;
	/** The type of subprogram */
	int value;
	
	public treeobject(String s,int v) {
		name=s;
		value=v;
	}
	
	public String toString() {
		return name;
	}
}

/** Class for finding sub Programs within a file and displying the results in a frame
 * with a tree structure
 */
public class ViperMethodFinder implements TreeSelectionListener{
	Viper viper;
	
	/**	The results in a tree */
	protected JTree results;
	/** The list of line no of which the subprograms can be found */
	private Vector positions;
	/** The list of names of  the subprograms */
	private Vector data;
	/** The list of types of the sub program */
	private Vector type;
	/**	for tokinizing a line */
	private Tokens tokens = new Tokens();
	/** the route node of the tree */
	private static DefaultMutableTreeNode root;
	/** the tree model */
	private DefaultTreeModel treeModel;
	/** the current state of the line being read */
	private  State state = new State();
	
	/** constants for differnt lines */
	private final int procedure=1;
	private final int function=2;
	private final int constructor=7;
	private final int destructor=8;
	private final int program=5;
	private final int begin=3;
	private final int implementation=6;
	private final int end=4;
	private final int forward=9;
	
	/** Number of lines */
	private int lines;
	/** The line number */
	private int line;
	/** Stores the last subprogam that was found */
	private String lastSubProgramName;
							  
	
	/** constants for differnt lines */
	private final int chapter=10;
	private final int section =11;
	private final int subsection =12;
	private final int subsubsection =13;
	private final int none=14;
	/** Stores the last subprogam that was found */
	private String lastSectionName="";
	

	/** Constructor
	 */
	public ViperMethodFinder(Viper parent){
		// set up varibles
		viper=parent;
		root = new DefaultMutableTreeNode(new treeobject("Program",5));
		treeModel = new DefaultTreeModel(root);
		results = new JTree(treeModel);
		results.setRootVisible(false);
		results.setShowsRootHandles(true);
		data = new Vector();
		results.addTreeSelectionListener(this);
		positions = new Vector();
		type =new Vector();
		results.setFont(new Font(viper.props.FONTSTYLE, 0, viper.props.FONTSIZE));
	}
	/** Method for reseting the varibles
	 */
	public void removeList()
	{
		data.removeAllElements();
		positions.removeAllElements();
		type.removeAllElements();
		root.removeAllChildren();
		treeModel.reload();
	}
	/** Method for parsing the current file that viper has selected. It will update the tree
	 */
	protected void parse()
	{
		// reset state
		state=new State();
		// the value of the line being anylised
		int lineV=0;
		int count = 1;
		// depth of the tree
		int depth = 1;

		// clear all the data
		positions.removeAllElements();
		data.removeAllElements();
		type.removeAllElements();
		// get the file
		Element map =
					 viper.activeChild.textarea.getDocument().getDefaultRootElement();
		// the number of line in file
		lines = map.getElementCount();
		line = 0;
		

		// loop through until program starts or implementation
		while ((lineV != program && lineV != implementation)&& line < lines) {
			
			Element lineElement = map.getElement(line);
			int start = lineElement.getStartOffset();
			String lineString = viper.activeChild.textarea.getText(start,
			lineElement.getEndOffset() - start - 1);
			lineV=(CheckLine(lineString.toLowerCase(),state));
			line++;
		}
		// get the sub program
		nesting("",lines,state,map,false,1);
		// reset tree
		root.removeAllChildren();
		//cunstruct the tree
		construct_tree(0,1,root);
		
		
		DefaultTreeCellRenderer renderer2 = new DefaultTreeCellRenderer();
		results.setCellRenderer(new MyRenderer());
		// reload the tree
		treeModel.reload();
		
		
	}


	/** Method for parsing the tex current file that viper has selected. It will update the tree
	 */
	protected void parseTex()
	{
		// reset state
		state=new State();
		// for keeping count of the each sub part
		int chapterCount=0;
		int sectionCount =0;
		int subsectionCount =0;
		int subsubsectionCount =0;
		
		int lineV=0;
		int count = 1;
		int depth = 1;
		// remove all the elemants
		positions.removeAllElements();
		data.removeAllElements();
		type.removeAllElements();
		// get the file
		Element map =
					 viper.activeChild.textarea.getDocument().getDefaultRootElement();
		int lines = map.getElementCount();
		int i = 0;
		
		// the number of each elemant
		String num="("+chapterCount+")";
		String splitstring;
		// while lines left loop
		while ( i < lines) {
			//anylize line
			Element lineElement = map.getElement(i);
			int start = lineElement.getStartOffset();
			String lineString = viper.activeChild.textarea.getText(start,
																   lineElement.getEndOffset() - start - 1);
			lineV=(CheckLineTex(lineString,state));
			try {
				// if a chapter line change varibles and add line
				if (lineV==chapter) {
					chapterCount++;
					
					sectionCount =0;
					subsectionCount =0;
					subsubsectionCount =0;
					
					num="("+chapterCount+")";
					splitstring=num+" "+lastSectionName;
					data.addElement(splitstring);
					type.addElement(new Integer(lineV));

					positions.addElement(viper.activeChild.textarea.getDocument().createPosition
						(start + getMethodStartIndex()));
				}
				// if a section line change varibles and add line
				else if  (lineV==section){
					sectionCount++;
					
					subsectionCount =0;
					subsubsectionCount =0;
					
					num="("+chapterCount+"."+sectionCount+")";
					splitstring=num+" "+lastSectionName;
					data.addElement(splitstring);
					type.addElement(new Integer(lineV));

					positions.addElement(viper.activeChild.textarea.getDocument().createPosition
						(start + getMethodStartIndex()));
				}
				// if a subsection line change varibles and add line
				else if  (lineV==subsection){
					subsectionCount++;

					subsubsectionCount =0;
					
					num="("+chapterCount+"."+sectionCount+"."+subsectionCount+")";
					splitstring=num+" "+lastSectionName;
					data.addElement(splitstring);
					type.addElement(new Integer(lineV));

					positions.addElement(viper.activeChild.textarea.getDocument().createPosition
						(start + getMethodStartIndex()));
				}
				// if a subsubsection line change varibles and add line
				else if  (lineV==subsubsection){
					subsubsectionCount++;

					
					num="("+chapterCount+"."+sectionCount+"."+subsectionCount+"."+subsubsectionCount+")";
					splitstring=num+" "+lastSectionName;
					data.addElement(splitstring);
					type.addElement(new Integer(lineV));

					positions.addElement(viper.activeChild.textarea.getDocument().createPosition
						(start + getMethodStartIndex()));
				}
			}
			catch (BadLocationException ble)
			{
			}
			i++;
		}
		// if no chapters then remove a zero from the start of every elemant
		if (chapterCount==0){
			String name;
			for (int j=0;j<data.size();j++){
				name=(String)data.elementAt(j);
				data.removeElementAt(j);
				name="("+name.substring(3,name.length());
				data.add(j,name);
			}
		}
		// reset values
		state.set_isInComment(false);
		state.set_comment('\0');
		root.removeAllChildren();

		// make sure the input has no inconsistances
		formatInput();
		// cunstruct tree
		int test=construct_tree(0,1,root);
		
		
		DefaultTreeCellRenderer renderer2 = new DefaultTreeCellRenderer();
		results.setCellRenderer(new MyRenderer());
		// reload tree
		treeModel.reload();
		
		
	}
	
	/** Format the input so that it is correct and there a re no error in it
	 */
	private void formatInput() {
		String index="";

		int dotCount=-1;
		int lastDotCount;
		int pos;
		int start=0;
		Vector hist=new Vector();
		for (int i=0;i<data.size();i++) {
			
			index=(String)data.elementAt(i);
			pos=index.indexOf(')');
			index=index.substring(1,pos);


			for (int j=start;j<index.length();j++){
				if (index.charAt(j)=='0'&&
					((j)==0 || index.charAt(j-1)=='.')&&
					((j)==index.length()||index.charAt(j+1)=='.')&&
					!hist.contains(index.substring(0,j+1))) {

					hist.add(index.substring(0,j+1));
					data.add(i,'('+index.substring(0,j+1)+')');
					type.add(i,new Integer(none));
					Position pos2=(Position)positions.elementAt(i);
					positions.add(i,pos2);
					
					i++;
				}
			}		
		}
	}


	/** method that counts the number of dots in a string
	 * @param S the string to count
	 * @return the number of dots in the String
	 */
	private int getDotCount(String S) {
		int count=0;
		for (int i=0;i<S.length();i++) {
			if (S.charAt(i)=='.'){
				count++;	
			}			
		}
		return count;
	}
	
	/** Recursive Method to cunstruct the tree
	 * @param j the number of elemants in the tree already
	 * @param level the depth of the the current node
	 * @param Node the current node
	 * @return the number of elements in the tree
	 */
	private int construct_tree(int j, int level, DefaultMutableTreeNode Node) {
		DefaultMutableTreeNode child;
		// if no nothing else to add the quit
		if (j==data.size())
			return j;
		String temp=(String)data.elementAt(j);
		int pos_bracket =temp.indexOf(')');
		String prefix=temp.substring(0,pos_bracket);
		// while we don't want to go back up a level in the tree
		while (level==getDotCount(prefix)+1) {
			Integer integer=(Integer)(type.elementAt(j));
			child = new DefaultMutableTreeNode(new treeobject(temp,integer.intValue()));
			Node.add(child);
			j++;
			if (j==data.size())
				return j;
			
			temp=(String)data.elementAt(j);
			pos_bracket =temp.indexOf(')');
			prefix=temp.substring(0,pos_bracket);
			// if we want to go down a level the call this method
			if (level<getDotCount(prefix)+1) {
				j= construct_tree(j,level+1,child);
				if (j==data.size())
					return j;
				temp=(String)data.elementAt(j);
				pos_bracket =temp.indexOf(')');
				prefix=temp.substring(0,pos_bracket);
				
			}
		}
		return j;
	}

	
	/** Recursive method for finding the sub programs
	 * @param num the current sub program numbering
	 * @param lines the current line number
	 * @param s the current State
	 * @param map the file being analised
	 * @param b if this is the first time the method has been called
	 * @param lastNum  num the current sub program numbering as an int
	 * @return  num the current sub program numbering
	 */
	private int nesting(String num, int lines, State s, Element map, boolean b, int lastNum  ) {

		int nest_num =1;
		int line_val =0;
		boolean in_proc_func = false;
		try
		{
			// loop through until the start of the subProgram
			while ((line_val !=begin || !b )&& line < lines && line_val !=forward) {

				Element lineElement = map.getElement(line);
				int start = lineElement.getStartOffset();
				String lineString = viper.activeChild.textarea.getText(start,
																	   lineElement.getEndOffset() - start - 1);
				
				line_val=(CheckLine(lineString,s));
				
				// if line is a sub program the call this method
				if 	(line_val==procedure || line_val ==function || line_val==constructor || line_val ==destructor )
				{
					in_proc_func=true;
					
					String splitstring;
					if (num.length() == 0)
						splitstring = ("("+nest_num+") "+lastSubProgramName);
					else
						splitstring = (num+"."+nest_num+") "+lastSubProgramName);
					
					data.addElement(splitstring);
					type.addElement(new Integer(line_val));

					positions.addElement(viper.activeChild.textarea.getDocument().createPosition
						(start + getMethodStartIndex()));

					line++;
					if (num.length() == 0)
						nest_num=nesting("("+nest_num,lines,s,map,in_proc_func,nest_num);
					else
						nest_num=nesting(""+num+"."+nest_num,lines,s,map,in_proc_func,nest_num);
					nest_num++;
				}
				// line was forward remove last subprogram
				else if (line_val==forward && data.size()>0){
					type.removeElementAt(type.size()-1);
					data.removeElementAt(data.size()-1);
					positions.removeElementAt(positions.size()-1);
					return(lastNum-1);
				}

				line++;
			}

			int begin_no = 1;
			// loop untill the end of the sub program
			while ((begin_no !=0 || line_val !=4) && line < lines && line_val !=forward) {
				
				Element lineElement = map.getElement(line);
				int start = lineElement.getStartOffset();
				String lineString = viper.activeChild.textarea.getText(start,
																	   lineElement.getEndOffset() - start - 1);
				
				line_val=(CheckLine(lineString.toLowerCase(),s));
				if (line_val ==3) {
					begin_no++;
				}
				else if (line_val ==4){
					begin_no--;		   
				}
				
				line++;
			}
			if (line_val==4)
				line--;
		}
		catch (BadLocationException ble)
		{
		}

		
		return lastNum;
	}

	/**
	 * Methods indexes
	 */
	private int startIndex;
	private int endIndex;



	private int getMethodStartIndex()
	{
		return startIndex;
	}
	private int getMethodEndIndex()
	{
		return endIndex;
	}
	
	/** Method that checks a line and returns an int depending what was in the line
	 * @param data the string to be checked
	 * @param the current State
	 * @return the lines value
	 */
	private int CheckLine(String data,State s) {

		
		int lineValue = 0;
		// get the code
		s.checkLine(data);
		String line=s.getCode();
		// tokinize line
		tokens.tokenizeLine(line);
		
		// check to see what key words are in it and return acordingly
		if (tokens.containsToken("begin")){
			lineValue=begin;
		}
		else if (tokens.containsToken("end")){
			lineValue=end;
		}
		else if (tokens.containsToken("program")){
			lineValue=program;
		}
		else if (tokens.containsToken("implementation")){
			lineValue=implementation;
		}
		
		if (!tokens.containsToken("forward")&&!tokens.containsToken("external")){
			if (tokens.containsTokenSub("procedure")){
				lineValue=procedure;
				lastSubProgramName=tokens.getTokenAfter("procedure");
			}
			else if (tokens.containsTokenSub("function")){
				lineValue=function;
				lastSubProgramName=tokens.getTokenAfter("function");
			}
			else if (tokens.containsTokenSub("constructor")){
				lineValue=constructor;
				lastSubProgramName=tokens.getTokenAfter("constructor");
			}
			else if (tokens.containsTokenSub("destructor")){
				lineValue=destructor;
				lastSubProgramName=tokens.getTokenAfter("destructor");
			}
		}
		else if (!tokens.containsTokenSub("procedure")&& !tokens.containsTokenSub("function") &&
				 !tokens.containsTokenSub("constructor")&& !tokens.containsTokenSub("destructor")){
			lineValue=forward;
			
		}
		return lineValue;
	}
	

	/** Method that checks a Tex line and returns an int depending what was in the line
	 * @param data the string to be checked
	 * @param the current State
	 * @return the lines value
	 */
	private int CheckLineTex(String data,State s) {
		
		int lineValue = 0;
		// get the code		
		String line=s.checkTexLine(data);
		// tokinize line
		tokens.tokenizeTexLine(line);
		
		// check to see what key words are in it and return acordingly
		if (tokens.containsTexToken("\\chapter")){
			lineValue=chapter;
			lastSectionName=tokens.getTexTokenAfter("\\chapter");
		}
		else if (tokens.containsTexToken("\\section")){
			lineValue=section;
			lastSectionName=tokens.getTexTokenAfter("\\section");
		}
		else if (tokens.containsTexToken("\\subsection")){
			lineValue=subsection;
			lastSectionName=tokens.getTexTokenAfter("\\subsection");
		}
		else if (tokens.containsTexToken("\\subsubsection")){
			lineValue=subsubsection;
			lastSectionName=tokens.getTexTokenAfter("\\subsubsection");
		}
		return lineValue;
	}

	/** Method to get the last selection in a Selection Path
	 * @param stringname The string to be extracted
	 * @return the extracted string
	 */
	private String ExtractString(String stringname)
	{
		String s = null;
		int i=0;
		int pos_bracket = stringname.lastIndexOf('(');

		if (pos_bracket>0)
			s= stringname.substring(pos_bracket,stringname.length()-1);
		return s;
	}

	/** The listener for the tree selectioner, that will jump to the line in the code
	 */
	public void valueChanged(TreeSelectionEvent evt)
	{
		if (results.isSelectionEmpty() || 
			viper.activeChild == null)
			return;
		// find the line number
		Position pos = (Position)positions.elementAt(data.indexOf(ExtractString(results.getSelectionPath().toString())));
		
		Element map =
					 viper.activeChild.textarea.getDocument().getDefaultRootElement();
		Element lineElement = map.getElement(map.getElementIndex(
																 pos.getOffset()));
		if (lineElement == null)
			return;
		viper.activeChild.textarea.select(lineElement.getStartOffset(),
										  lineElement.getEndOffset() - 1);
	}

	/** Cell renderer for a Tree
	 */
	private class MyRenderer extends DefaultTreeCellRenderer {
		ImageIcon procedureIcon;
		ImageIcon functionIcon;
		ImageIcon constructorIcon;
		ImageIcon destructorIcon;
		ImageIcon chapterIcon;
		ImageIcon sectionIcon;	
		/** Stores all the icons
		 */
		public MyRenderer() {
			procedureIcon = new ImageIcon (getClass().getResource("resources/procedure.gif"));
			functionIcon = new ImageIcon (getClass().getResource("resources/function.gif"));
			constructorIcon = new ImageIcon (getClass().getResource("resources/constructor.gif"));
			destructorIcon = new ImageIcon (getClass().getResource("resources/destructor.gif"));
			chapterIcon = new ImageIcon (getClass().getResource("resources/chapter.gif"));
			sectionIcon = new ImageIcon (getClass().getResource("resources/section.gif"));
		}
		
		/** for getting component
		 */
		public Component getTreeCellRendererComponent(JTree tree,Object value,boolean sel,boolean expanded,
        						      boolean leaf, int row, boolean hasFocus) {
			super.getTreeCellRendererComponent(tree, value, sel,expanded, leaf, row,
							   hasFocus);
			
			DefaultMutableTreeNode node = (DefaultMutableTreeNode)value;
			treeobject nodeInfo = (treeobject)(node.getUserObject());
			int i = nodeInfo.value;
			// Find out what icon the cell has
			if (i==procedure)
				setIcon(procedureIcon);
			else if (i==function)
				setIcon(functionIcon);
			else if (i==constructor)
				setIcon(constructorIcon);
			else if (i==destructor)
				setIcon(destructorIcon);
			else if (i==chapter)
				setIcon(chapterIcon);
			else if (i==none){
				setIcon(null);	
			}
			else
				setIcon(sectionIcon);
			
			
			return this;
		}

	}

}

