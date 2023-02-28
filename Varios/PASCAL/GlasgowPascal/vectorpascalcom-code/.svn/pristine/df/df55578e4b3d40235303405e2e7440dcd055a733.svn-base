 
/**
 * ProjectManager.java
 * Responsible for handling Vector Pascal Projects
 * */
package viper;

import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import javax.swing.*;
import javax.swing.event.*;
import javax.swing.tree.*;


public class ViperProjectManager extends JDialog implements ActionListener, ItemListener
{

	/** The Name of the Current Project */
	static String PROJECTNAME;

	/** The author of the Project */
	static String AUTHORNAME;

	/** The name of the Main file */
	static String PROJECTMAIN;

	/** The description of the file */
	static String PROJECTDESCRIPTION;

	/** The path of the current project */
	static String PROJECTPATH;

	/** Seperator that keeps the files seperate in the .prj file */
	final String FILESEPERATOR  = "*****NOFILESHERE****";

	/** Name of the 'printable' project properties file kept in the project directory */
	static String DESCRIPTION_FILE = "desc.txt";

	 /** String that represents the path of the import project */
      static String IMPORTPATH;

	/** Keeps count of the Number of files currently in the Project */
	private int FILE_COUNT=0;
	
	/** Boolean determines if a project is currently Open */
	boolean OPENPROJECT;

	/** Boolean determines if a project is needing to be Saved */
	boolean SAVEPROJECT;
 

	/* Values for Text Field names */

	private JTextField 	projectname_text_field;
	private JTextField 	authorname_text_field;
	private JTextField 	directory_text_field;
 	private JTextArea 	project_description;
	private JTextField      import_file_textfield;

	private JButton browse_directory= new JButton("browse...");
	private JButton import_file= new JButton("browse...");
      

    protected static Vector projectchildren = null;
    DefaultMutableTreeNode projecttreenode;
    TreeSelectionModel selectionModel;
    DefaultTreeModel model;
    static DefaultMutableTreeNode root;
    JTree projecttree;
    JFileChooser fileChooser;

    Container container;
    Viper viper;


    ViperProjectManager(Viper child)
    {
        viper = child;
        container = this.getContentPane();
        projectchildren = new Vector(4, 4);
        root = new DefaultMutableTreeNode("Root");
        projecttree = new JTree(root);
        model = (DefaultTreeModel)projecttree.getModel();
        selectionModel = projecttree.getSelectionModel();
        projecttree.setRootVisible(false);
        projecttree.setShowsRootHandles(false);
        JScrollPane projectScrollPane=new JScrollPane(projecttree);
        viper.tabbedPane.addTab("Project", projectScrollPane);


        selectionModel.setSelectionMode(
            TreeSelectionModel.SINGLE_TREE_SELECTION);

        model.addTreeModelListener(new TreeModelListener() {

                                       public void treeNodesInserted(TreeModelEvent e)
                                       {
                                           showInsertionOrRemoval(e, " added to ");
                                       }
                                       public void treeNodesRemoved(TreeModelEvent e)
                                       {
                                           showInsertionOrRemoval(e, " removed from ");
                                       }
                                       private void showInsertionOrRemoval(TreeModelEvent e, String s)
                                       {
                                           Object[] parentPath = e.getPath();
                                           int[] indexes = e.getChildIndices();
                                           Object[] children = e.getChildren();
                                           Object parent = parentPath[parentPath.length - 1];
                                           viper.statusBar.msgline.setText("File: " + s);
                                       }
                                       public void treeNodesChanged(TreeModelEvent e)
                                       {
                                       }
                                       public void treeStructureChanged(TreeModelEvent e)
                                       {
                                       }
                                   });
        projecttree.addMouseListener(new MouseAdapter(){
                                         public void mousePressed(MouseEvent e)
                                         {
                                             JTree t = (JTree)e.getSource();
                                             int row = t.getRowForLocation(e.getX(), e.getY());

                                             TreePath path = t.getPathForLocation(e.getX(), e.getY());
                                             TreeNode treenode = null;
                                             File file = null;
                                             String nodeName = null;
                                             if (e.getClickCount() == 2)
                                             {
                                                 if (row != -1 && t == projecttree)
                                                 {
                                                     treenode = (TreeNode)path.getLastPathComponent();
                                                     nodeName = treenode.toString();
                                                     if (treenode.isLeaf())
                                                     {
                                                         file=(File)projectchildren.elementAt(row-1);
                                                         if (viper.GetWindow(file) == false)
                                                             viper.loadChild(nodeName, file);
                                                     }
                                                 }
                                             }
                                         }
                                     });
    }

    protected void addToProject()
    {
        if (projecttreenode != null)
        {
		boolean invalid= false;
            int index = projecttreenode.getChildCount();
	
		
            File[] files=getAddChildFileName(); 	//get files to be added

		if (files.length == 0) {		
		  invalid= true;	// no files to add
		  JOptionPane.showMessageDialog(container, "Unable to add same named file:" + "\n" + "Rename file or remove file from Project","Warning",JOptionPane.WARNING_MESSAGE);
		}
		
            if(files!=null && !invalid)
		{
                for(int i=0;i<files.length;i++)
		   {
		        FILE_COUNT++;
                    projectchildren.addElement((Object)files[i]);
                    MutableTreeNode newNode = new DefaultMutableTreeNode(files[i].getName());
                    if(newNode!=null){
                        model.insertNodeInto(newNode, projecttreenode, index);
                    }
                }
			// Save the Project after adding in files
			SaveProject();
            }
        }

    }




  

    /** Removes a file from the Current project and removes it from the project directory */

    protected void removeFromProject()
    {
        if (projecttreenode != null)
        {
            TreePath path = selectionModel.getSelectionPath();
            if (path.getPathCount() == 1)
            {
                viper.statusBar.msgline.setText("Can't remove root node!");
                return;
            }
            if (path.getPathCount() == 2)
            {
                viper.statusBar.msgline.setText("Cannot Delete Root Project File!");
                return;
            }
            if (path != null)
            {
                MutableTreeNode node =
                    (MutableTreeNode)path.getLastPathComponent();

                if (node.isLeaf()){

				File delete_file= new File(PROJECTPATH +  System.getProperty("file.separator")  + PROJECTNAME +  System.getProperty("file.separator") ,path.getLastPathComponent().toString());

				/* prevent deletion of the project description file*/
				if (!delete_file.equals(new File(PROJECTPATH +  System.getProperty("file.separator")  + PROJECTNAME +
					System.getProperty("file.separator") + DESCRIPTION_FILE)))
				{
	
					/* Check to see if main project file */
					if(!delete_file.equals(new File(PROJECTPATH + System.getProperty("file.separator") +
					  PROJECTNAME + System.getProperty("file.separator") + PROJECTMAIN)))
					{					

						delete_file.delete();	// removes this file
						projectchildren.removeElement(delete_file); // remove from 'storage'
                        		model.removeNodeFromParent(node);
			 			FILE_COUNT--;	// decrease file count by 1
						SaveProject();	// save the current state of the project
					} else // main project file
					{
						int choice = JOptionPane.showConfirmDialog(container, "Delete Main Project File?");
						if (choice == JOptionPane.YES_OPTION)
						{
							
							PROJECTMAIN= "";	// no main project file anymore
							delete_file.delete();	// removes this file
							projectchildren.removeElement(delete_file); // removes from 'storage'
                        			model.removeNodeFromParent(node);
			 				FILE_COUNT--;	// decrease file count by 1
							SaveProject();	// save the current state of the project
							JOptionPane.showMessageDialog(container, "Main project file deleted");


						} else 
						{
					JOptionPane.showMessageDialog(container, "Main project file kept");
						}
					}
					

				} else 
				{
					JOptionPane.showMessageDialog(container, "Cannot delete the Project Description File!","Warning",JOptionPane.WARNING_MESSAGE);
					viper.statusBar.msgline.setText("Cannot Delete Description File!");
				}
                }
            }
        }

    }


    

/** Project Properties Method
		* Sets the properties for the project
		* Project Name, Author Name, Main Project File, Description
		* Holds project statistics as well
	**/


	protected void ProjectProperties()
	{

	JPanel main_panel= new JPanel();

	JPanel main_panel_1= new JPanel(); // holds contents of first panel
	GridBagLayout gridlayout= new GridBagLayout();
	GridBagConstraints c= new GridBagConstraints();
	main_panel_1.setLayout(gridlayout);

	JLabel projname = new JLabel("Project Name: ");
	c.gridx=0;
	c.gridy=1;
	c.anchor= GridBagConstraints.WEST;

	gridlayout.setConstraints(projname,c);
	main_panel_1.add(projname);

	c.gridx=1;
	c.gridy=1;
	c.anchor= GridBagConstraints.EAST; 
	JLabel count= new JLabel(("Total File(s): " + new Integer(FILE_COUNT).toString()));
	count.setForeground(Color.red);
	
	gridlayout.setConstraints(count,c);

	main_panel_1.add(count);

	c.gridx=0;
	c.gridy=2;
	c.anchor= GridBagConstraints.WEST;
	main_panel_1.add(projectname_text_field = new JTextField("",15));
	gridlayout.setConstraints(projectname_text_field,c);
	projectname_text_field.setToolTipText("Name of the Project");


	JLabel authname= new JLabel("Author Name: ");
	c.gridx=0;
	c.gridy=3;
	c.anchor= GridBagConstraints.WEST;

	gridlayout.setConstraints(authname,c);
	main_panel_1.add(authname,c);

	c.gridx= 0;
	c.gridy= 4;
	c.anchor= GridBagConstraints.WEST;

	main_panel_1.add(authorname_text_field= new JTextField("",15));
	gridlayout.setConstraints(authorname_text_field,c);
	authorname_text_field.setToolTipText("Name of the author");

	JLabel dir= new JLabel("Directory Path: ");
	c.gridx=0;
	c.gridy=5;
	c.anchor= GridBagConstraints.WEST;

	gridlayout.setConstraints(dir,c);
	main_panel_1.add(dir);

	c.gridx=0;
	c.gridy=6;
	c.anchor= GridBagConstraints.WEST;

	main_panel_1.add(directory_text_field= new JTextField("",15));
	gridlayout.setConstraints(directory_text_field,c);
	directory_text_field.setToolTipText("Source Directory");

	c.gridx=1;
	c.gridy=6;
	c.anchor= GridBagConstraints.CENTER;

	gridlayout.setConstraints(browse_directory,c);
	main_panel_1.add(browse_directory);
	browse_directory.addActionListener(this);


	JLabel main= new JLabel("Main File Name: ");
	c.gridx= 0;
	c.gridy= 7;
	c.anchor= GridBagConstraints.WEST;

	gridlayout.setConstraints(main,c);
	main_panel_1.add(main);


	/* Select main file from current files in the project
	   only the name of the VECTOR PASCAL and TeX files are displayed - not their paths*/


	String[] mainfile_array= getAllProjectFiles();
	Vector mainfile= new Vector();
	for (int i= 0; i < mainfile_array.length ; i ++)
	{
	    // add only file if Vector Pascal file or TeX file
	    if (mainfile_array[i].endsWith(".pas") || mainfile_array[i].endsWith(".tex")) {
		File getfile_name = new File(mainfile_array[i]);
		mainfile.addElement(getfile_name.getName().toString());  
	    }
	}	
	
	JComboBox select_main;
	if (mainfile.isEmpty()) 
	{
		select_main= new JComboBox();
		select_main.addItem("Empty Project");
	} else {

			select_main= new JComboBox(mainfile);
			
			/* highlight selected main file if exists */
			if (!PROJECTMAIN.equals("")) {
				select_main.setSelectedItem(PROJECTMAIN);
			 }

			// files in project, but no main file so have the main file as 'blank' in the list
			else if(PROJECTMAIN.equals("") && mainfile.size() >= 1) 
			{
				
				select_main.addItem("");
				select_main.setSelectedIndex(mainfile.size()-1); // if no main file, set the "" to be the main file
			}

		select_main.addItemListener(this);
	}

	c.gridx=0;
	c.gridy=8;
	c.anchor= GridBagConstraints.WEST;

	main_panel_1.add(select_main);
	gridlayout.setConstraints(select_main,c);
	select_main.setToolTipText("Set main file for project");


	// attach everything to the main tabbed panel
	main_panel.add(main_panel_1);


	/* holds the project description */
 	JPanel main_panel_2= new JPanel();	

	project_description= new JTextArea(5,25);
	project_description.setWrapStyleWord(true);
	project_description.setToolTipText("Enter Description of Project");
	JScrollPane project_description_scrollbar= new JScrollPane(project_description);
	project_description_scrollbar.setMaximumSize(new Dimension(5,25));

	// add in sub panels
	main_panel_2.add(project_description_scrollbar);

	/* Panel for the Statistics of the project Size, Last Modified, number of files */
	JPanel main_panel_3= new JPanel();
	
	JLabel overall_size = new JLabel("Size: " + project_size() + " bytes");

	GridBagLayout gridlayout2= new GridBagLayout();
	main_panel_3.setLayout(gridlayout2);
	GridBagConstraints c2 = new GridBagConstraints();


	c2.gridx=0;
	c2.gridy=1;
	c2.anchor= GridBagConstraints.WEST;
	gridlayout2.setConstraints(count,c2);
	JLabel count1= new JLabel(("Total File(s) in Project: " + new Integer(FILE_COUNT).toString()));
	count1.setForeground(Color.red);
	main_panel_3.add(count1);

	c2.gridx=0;
	c2.gridy=2;
	c2.anchor= GridBagConstraints.WEST;
	gridlayout2.setConstraints(overall_size,c2);
	main_panel_3.add(overall_size);


		/* Set text fields if project is already open */
		if(PROJECTNAME != null)
		{
			projectname_text_field.setText(PROJECTNAME);
			authorname_text_field.setText(AUTHORNAME);
			directory_text_field.setText(PROJECTPATH);
			project_description.setText(PROJECTDESCRIPTION);
		}
	/* create a tabbed Pane for the Project Options,Project Description and Project Statistics*/
	JTabbedPane pane= new JTabbedPane();
	pane.add("Options",main_panel);
	pane.add("Description",main_panel_2);
	pane.add("Statistics",main_panel_3);
	final JOptionPane optionPane= new JOptionPane(pane,JOptionPane.PLAIN_MESSAGE,JOptionPane.OK_CANCEL_OPTION);


	JDialog dialog= optionPane.createDialog(this,"Viper Project Properties");
	dialog.setSize(396,360);
	dialog.setResizable(false);
	dialog.pack();
	dialog.show();


		/*Update references or discard depending on user option */
		Integer value= (Integer)optionPane.getValue();
			
			if (value.intValue() == JOptionPane.OK_OPTION) 
			UpdateReferences();

			/* only save the project if both PROJECTNAME AND PROJECTPATH are present */
			if ((PROJECTNAME.equals("")) || (PROJECTPATH.equals(""))) {
				 JOptionPane.showMessageDialog(container, "Cannot create an empty project!" + "\n" + "Enter a project name and source directory","Warning",JOptionPane.WARNING_MESSAGE);
				 SAVEPROJECT= false; // dont save this project
				 CloseProject();
			} else {
			
				/* Check that there are no spaces in the name */
				if((PROJECTNAME.indexOf(' ')!=-1) ||(PROJECTPATH.indexOf(' ')!=-1))
				{
			     		JOptionPane.showMessageDialog(container, "Project Name or Project Path cannot contain spaces","Warning",JOptionPane.WARNING_MESSAGE);
					SAVEPROJECT= false;
					CloseProject();

				} else {

					OPENPROJECT= true;
					SaveProject();
				}		
			}

			if (value.intValue() == JOptionPane.CANCEL_OPTION)
				OPENPROJECT= false;


	}// Project Properties


/** returns the pascal files in the project directory
    Note: This includes .pas files and any other user .pas files in the project directory */

private String[] actual_directory_pascalfiles() 
{
	String pascalFiles[];

	 File project_directory_stats= new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME + System.getProperty("file.separator"));
	if(project_directory_stats.isDirectory()) {
		File templist[] = project_directory_stats.listFiles();
		

		/* remove just pascal files and return */
		int file_number=0;
		for(int i=0; i < templist.length;i++) {
			String tempstring= templist[i].getName().toString();
			if (tempstring.toLowerCase().endsWith(".pas"))
				file_number++;
		
		}

		pascalFiles= new String[file_number];
		int counter=0; // set as counter
		int current=0; // current position in templist
		while (counter < file_number) {
			String tempstring= templist[current].getName().toString();
			if(tempstring.toLowerCase().endsWith(".pas")) {
				pascalFiles[counter]= templist[current].getName().toString();
				counter++;
			}

		current++;
		}
			

	/* return all of the pascal files */
	return pascalFiles;
	}

	return pascalFiles= new String[0];
}



/** Calculates the Size of the Current Project */
private int project_size() 
{
  File project_directory_stats= new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME + System.getProperty("file.separator"));


  if (project_directory_stats.isDirectory()) {
	File [] fileList= project_directory_stats.listFiles();
	
	// return 0 if no files in directory
	if (fileList.length == 0)
		return 0;

	int directory_size=0;	
		// add up the sizes of all files in directory
		for (int i=0; i < fileList.length;i++ ) {
			directory_size= directory_size + (int)fileList[i].length();
		}
		return directory_size;

  } else {
	
		return 0;
     }

}


/** Opens the Desired project via the .prj file and deserialize */
    protected void OpenNewProject(File projectFile)
    {

        if (projecttreenode != null)CloseProject();
        if (projecttreenode == null){
	
		/*remove the instance of the project */
            if(projectFile == null)
		{	
			this.dispose();
			viper.tabbedPane.removeTabAt(0);
			viper.project= null;
			return;
		}
			
			
            try
            {
                viper.statusBar.msgline.setText("Loading Project.");
                FileReader fis = new FileReader(projectFile.getPath());
                BufferedReader br = new BufferedReader(fis);

                PROJECTNAME= br.readLine();
                projecttreenode = new DefaultMutableTreeNode(PROJECTNAME);
                AUTHORNAME = br.readLine();
		    File temp_file= new File(br.readLine());
                PROJECTMAIN = temp_file.getName();
           	    PROJECTPATH= br.readLine();
      	    PROJECTDESCRIPTION = br.readLine();

			boolean more_lines= false;
		   /* check if multiline descrtiption */

			String check_string= br.readLine();
		
			if (!check_string.equals(FILESEPERATOR)) {
				more_lines= true;
			}

			while (more_lines) {
				PROJECTDESCRIPTION = PROJECTDESCRIPTION + "\n" + check_string;
				check_string= br.readLine();
				if (check_string.equals(FILESEPERATOR)) {			
					more_lines= false;
				}

			}
                String str = br.readLine();
                while (str != null)
                {
			  FILE_COUNT++;	// increase the number of files by 1
                    File file=new File(str);
                    projectchildren.addElement((Object)file);
                    projecttreenode.add(new DefaultMutableTreeNode(file.getName()));
                    str = br.readLine();
                }
                root.add(projecttreenode);
                model.reload(root);
                viper.statusBar.msgline.setText("Project Loaded.");
                fis.close();
            }
            catch (Exception err)
            {
                viper.statusBar.msgline.setText("Error : " + err);
            }
        }
		if(getAllPascalFiles().length > actual_directory_pascalfiles().length) {
			 JOptionPane.showMessageDialog(container, "Files detected in Project File not present in Project Directory!","Warning",JOptionPane.WARNING_MESSAGE);
		}

			 if (viper.props.SMART) { 	
					String cpuStr = viper.props.SELECTEDCPU;
				if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
					String walkerFile=PROJECTNAME + cpuStr+".vpwu";
					String walkerPath = PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator");
					viper.walker=SmartComp.getWalker(walkerPath,walkerFile);
				 } 
    }




    /** Responsible for Opening up Projects */

    protected void OpenNewProject()
    {
		
		
        if (projecttreenode != null)CloseProject();
        if (projecttreenode == null){
		File projectFile= getFileName("Open Project",3);
		
		
		/*remove the instance of the project */
            if(projectFile==null)
		{	
			this.dispose();
			viper.tabbedPane.removeTabAt(0);
			viper.project= null;
			return;
		}
            try
            {
                viper.statusBar.msgline.setText("Loading Project.");
                
                            if(viper.props.RPROJECTS.indexOf(projectFile.getAbsolutePath())<0){
				viper.props.RPROJECTS=projectFile.getAbsolutePath()+","+viper.props.RPROJECTS;
                viper.createRecentProjectsList();
            }
                FileReader fis = new FileReader(projectFile.getPath());
                BufferedReader br = new BufferedReader(fis);

              PROJECTNAME= br.readLine();
              projecttreenode = new DefaultMutableTreeNode(PROJECTNAME);
	        AUTHORNAME = br.readLine();
		  File temp_file= new File(br.readLine());
              PROJECTMAIN = temp_file.getName();
	        PROJECTPATH = br.readLine();
              PROJECTDESCRIPTION = br.readLine();
		    
			boolean more_lines= false;
		   /* check if multiline desctiption */

			String check_string= br.readLine();
		
			if (!check_string.equals(FILESEPERATOR)) {
				more_lines= true;
			}

			while (more_lines) {
				PROJECTDESCRIPTION = PROJECTDESCRIPTION + "\n" + check_string;
				check_string= br.readLine();
				if (check_string.equals(FILESEPERATOR)) {			
					more_lines= false;
				}

			}

			// get all the files after seperator
                String str = br.readLine();
                while (str != null)
                {
			  FILE_COUNT++;	// increase the number of files			  

                    File file=new File(str);
                    projectchildren.addElement((Object)file);
                    projecttreenode.add(new DefaultMutableTreeNode(file.getName()));
                    str = br.readLine();
                }
                root.add(projecttreenode);
                model.reload(root);
                viper.statusBar.msgline.setText("Project Loaded.");
                fis.close();
            

		if(getAllPascalFiles().length > actual_directory_pascalfiles().length) {
			 JOptionPane.showMessageDialog(container, "Files detected in Project File not present in Project Directory!","Warning",JOptionPane.WARNING_MESSAGE);
		}
		
			if (viper.props.SMART) {
		
				String cpuStr = viper.props.SELECTEDCPU;
				if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
					String walkerFile=(PROJECTNAME)+ cpuStr+".vpwu";
					String walkerPath = PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator");
					viper.walker=SmartComp.getWalker(walkerPath,walkerFile);
				 } 
		
			}
		            catch (Exception err)
            {
                viper.statusBar.msgline.setText("Error : " + err);
            }
        }

			
			
    }


	/** Closes the Current project file and saves it if need be */

	protected void CloseProject()
	{

		
			if (viper.props.SMART && viper.walker != null) {
			   String cpuStr = viper.props.SELECTEDCPU;
			   if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
				   
					String walkerFile= PROJECTNAME + cpuStr+".vpwu";
					String walkerPath = PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator");
			    SmartComp.putWalker(viper.walker,walkerPath,walkerFile);
				viper.walker= null;
			}
		
		
		if(SAVEPROJECT) 
		{
			int value = JOptionPane.showConfirmDialog(getContentPane(),"Save Current Project","Save Project"
					,JOptionPane.YES_NO_CANCEL_OPTION,JOptionPane.QUESTION_MESSAGE);

			switch (value)
			{
			// clear out all relevent fields when closing a project
			case JOptionPane.YES_OPTION:
				SaveProject();
				FILE_COUNT=0;

			case JOptionPane.NO_OPTION:
				this.dispose();
				viper.tabbedPane.removeTabAt(0);
				viper.project= null;

				// clear all relevent fields
				projectname_text_field.setText("");
				authorname_text_field.setText("");
				directory_text_field.setText("");
				project_description.setText("");
				AUTHORNAME="";
				PROJECTNAME="";
				PROJECTMAIN="";
				PROJECTPATH="";
				PROJECTDESCRIPTION="";
				FILE_COUNT=0;
				
			case JOptionPane.CANCEL_OPTION:
				// do nothing
			}

		} else {

			this.dispose();
			viper.tabbedPane.removeTabAt(0);
			viper.project=null;
			OPENPROJECT= false; // no open project

		}


	}// Close Project




	/** Method Responsible for creating a New Project */

	protected void NewProject() 
	{
		
	if (projecttreenode != null)
		CloseProject();
	if (projecttreenode == null) {
			// clear all relevent fields
			AUTHORNAME="";
			PROJECTNAME="";
			PROJECTMAIN="";
			PROJECTPATH="";
			PROJECTDESCRIPTION="";
			FILE_COUNT=0;
			ProjectProperties();
		if (OPENPROJECT) {
			projecttreenode= new DefaultMutableTreeNode(PROJECTNAME);
			root.add(projecttreenode);
			model.reload(root);
		}
	
	

	}

	} // New Project

   
    /** Method responsible for saving the Project File (.prj) and the description file (desc.txt)*/

    protected void SaveProject()
    {


        Vector x=new Vector();
        int i=0;

        while (i < projectchildren.size())
        {
            File tempfile=(File)projectchildren.elementAt(i);
		// take out Project Description file as added manually to .prj file
		if (!tempfile.equals(new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME + 
		    System.getProperty("file.separator") + DESCRIPTION_FILE))) {
            		x.addElement(tempfile.getPath());		
		}

            i++;
        }

		/* makes a directory the same name as the project */
		File path =new File(PROJECTPATH,PROJECTNAME);
		path.mkdirs();

		/* if there is no project name or project path don't save the project, and close the empty one */
		if((PROJECTNAME.equals("")) || (PROJECTPATH.equals(""))) {
			 JOptionPane.showMessageDialog(container, "Cannot save an empty project!","Warning",JOptionPane.WARNING_MESSAGE);
			SAVEPROJECT=false;
			CloseProject();
			return;
		}
	
	  File file = new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME + System.getProperty("file.separator")+ PROJECTNAME +".prj");
        TreePath selPath;
        TreeNode node;

        if (file==null)return;
        else
        {
            String filename=file.getPath();
            if(!filename.endsWith(".prj"))filename=filename+".prj";
            try
            {
              FileWriter fs = new FileWriter(filename);
	        fs.write(PROJECTNAME);
              fs.write(System.getProperty("line.separator"));
	        fs.write(AUTHORNAME);
              fs.write(System.getProperty("line.separator"));

	      	/* Write Main Project file, with full path when main file selected, otherwise leave empty */
	
		if(!PROJECTMAIN.equals(""))
		{
		    fs.write(PROJECTPATH + System.getProperty("file.separator") 
			 + PROJECTNAME + System.getProperty("file.separator") + PROJECTMAIN); // full name of the Main File

		}

            fs.write(System.getProperty("line.separator"));
		fs.write(PROJECTPATH);
		fs.write(System.getProperty("line.separator"));
		fs.write(PROJECTDESCRIPTION);
		fs.write(System.getProperty("line.separator"));
            fs.write(FILESEPERATOR);			// file seperator
            fs.write(System.getProperty("line.separator"));
		fs.write(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  // description file
			     + System.getProperty("file.separator") + DESCRIPTION_FILE);
		fs.write(System.getProperty("line.separator"));
		
                i = 0;

		 /* Adds file paths to end of .prj file - but not the Project Description file */
                Enumeration e=x.elements();
                while(e.hasMoreElements()) {	
                    fs.write(e.nextElement() + System.getProperty("line.separator"));
		    }
                fs.close();
                SAVEPROJECT=false;
            }
            catch (Exception err)
            {
				err.printStackTrace();
            }

		
        }

	/* Updates the current description file */
	updateDescription();
	
    }


	/** Method that updates the desc.txt file once a project is created / saved / modified
	 This file is a printable version of the project properties and can be used as an overview
	to all of the files in the project*/

	private void updateDescription()
	{
	
	File desc_file= new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME + System.getProperty("file.separator")
				 + DESCRIPTION_FILE);
	String desc_file_name= desc_file.getPath();
	if(!desc_file_name.endsWith(".txt")) 
		desc_file_name= desc_file_name + ".txt";

	try
	{

	 /* Write Project Name, Author, Description and current files in the project */
	FileWriter fs= new FileWriter(desc_file_name);
		
		fs.write("Project Name:");
		fs.write(System.getProperty("line.separator"));    
		fs.write(PROJECTNAME);
		fs.write(System.getProperty("line.separator"));    fs.write(System.getProperty("line.separator"));
		fs.write("Project Author: ");
		fs.write(System.getProperty("line.separator"));  
		fs.write(AUTHORNAME);
		fs.write(System.getProperty("line.separator"));    fs.write(System.getProperty("line.separator"));
		fs.write("Project Description:");
		fs.write(System.getProperty("line.separator"));
		fs.write(PROJECTDESCRIPTION);
		fs.write(System.getProperty("line.separator"));     fs.write(System.getProperty("line.separator"));
		fs.write("Current Files in Project: ");
		fs.write(System.getProperty("line.separator"));

		/* Reads in file names to the desc.txt file */
	      
		if (!projectchildren.isEmpty()) 
		{
		int i=0;
		while (i < projectchildren.size())
		    {
			
			File file=(File)projectchildren.elementAt(i);
			String file_name= file.getPath();
			fs.write(file_name);
			fs.write(System.getProperty("line.separator"));
			i++;
		    }
		}
		
		fs.close();

		/* add to the project tree if not already there - true when creating a new project*/


	}
	catch (Exception e) 
	{
		System.out.println("Error in saving input");
		e.printStackTrace();
	}


this.generateMakeFile();

}


    /** Sets the action to be performed when the browse_directory / import_directory button is clicked*/
	public void actionPerformed(ActionEvent e){
	    
		if (e.getSource() == browse_directory)
		{ 
			directory_text_field.setText(browse_directory());
		}



		 if(e.getSource() == import_file)
		    {
			import_file_textfield.setText(getFileName("Get Project file to Import",0).toString());
		    }
	       

	}

	/** Sets PROJECTMAIN to be value selected from the ComboBox in Project Properties */
	public void itemStateChanged (ItemEvent e)
	{
	
		PROJECTMAIN= e.getItem().toString();
	}





    protected File getFileName(String title,int type){
        fileChooser = new JFileChooser(viper.CURRENTDIR);
        fileChooser.setMultiSelectionEnabled(false);
        fileChooser.setDialogTitle(title);
        fileChooser.addChoosableFileFilter(new ProjectFilter());
        int selected=0;
        if(type==1)selected = fileChooser.showSaveDialog(container);
        else selected = fileChooser.showOpenDialog(container);
        if (selected == JFileChooser.APPROVE_OPTION){
            viper.CURRENTDIR=fileChooser.getCurrentDirectory();
            return fileChooser.getSelectedFile();
        }
        else if (selected == JFileChooser.CANCEL_OPTION)
            return null;
        return null;
    }



    /** Responsible for adding files to the project directory */

    protected File[] getAddChildFileName()
    {
        fileChooser = new JFileChooser(viper.CURRENTDIR);
        fileChooser.setMultiSelectionEnabled(true);
        fileChooser.setDialogTitle("Add Files to Project");
        fileChooser.setFileFilter(new VPasFilter());
        int selected = fileChooser.showOpenDialog(container);

	  // if file(s) selected copy into Project directory
	  // and return there path
 
	
    if (selected == JFileChooser.APPROVE_OPTION)
	{
            viper.CURRENTDIR=fileChooser.getCurrentDirectory();
	
		/* change the file paths to be redirected to project directory
		   i.e to be changed from where they were to where they are now */

		File[] Transfer_Files= fileChooser.getSelectedFiles();	// files selected
		Vector Transferred_Files= new Vector();	// files to copy over

		//gets the full path name of the current directory
		String path= PROJECTPATH + System.getProperty("file.separator")  + PROJECTNAME;
		File directory_contents = new File(path); // file to directory (to get directory files)

		File[] current_project_files= directory_contents.listFiles(); // all files in current project
		boolean add_file= true; 
		

		/* copies over and checks file does not already exist */
		for(int i=0; i  < Transfer_Files.length; i++)
		 {
			
			// gets the actual filename <myfile.pas>
			String tempname= Transfer_Files[i].getName();

			for(int a=0; a < current_project_files.length; a++) 
			{
				if (tempname.equals(current_project_files[a].getName()))
				 {
					add_file= false;
				 }
				
			}


			/* adds the file iff it is not in the project */
			if (add_file) 
			{
			
				// transfers the actual file over and copies to Array of new file path
				File temp= new File(path,tempname);
				Transferred_Files.addElement(temp);
				ViperFileHandler.moveFile(Transfer_Files[i],temp);
			}
			add_file= true;	
		}

	/* returns the locations of the files in the project directory 
	or returns an empty array to indicate invalid selection of file*/

			File files[]= new File[Transferred_Files.size()];
	            for(int a=0;a < Transferred_Files.size();a++)
			{	
				files[a]= (File)Transferred_Files.elementAt(a);
			}
				
			/* return all the files selected */	
       		return files;

	// returns an empty array - no selection made
       } 

		/** returned if user selects cancel, or selects no files */
		  File[] empty_file= new File[0];	
            return empty_file;


    }





	 /** Method responsible for choosing directory in which to save the project 
		* return String returned represents the path of the directory chosen to hold the project directory
	*/

	 private String browse_directory()
    {
        JFileChooser fileChooser = new JFileChooser(viper.CURRENTDIR);
        fileChooser.setDialogTitle("Browse for project directory...");
		
		fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
		
        int selected = fileChooser.showOpenDialog(this);
        File file = fileChooser.getSelectedFile();
        if (file != null && selected == JFileChooser.APPROVE_OPTION)
            return (file.getPath());
        else 
            return " ";
    }


	/** Method Responsible for selecting the main file in the project 
	 Selection begins from the current project directory*/
	
	private String browse_file() 
	{
	
	JFileChooser fileChooser = new JFileChooser(PROJECTPATH + System.getProperty("file.separator") 
						    + PROJECTNAME + System.getProperty("file.separator"));
        fileChooser.setDialogTitle("Browse for main file...");
		
	fileChooser.setFileSelectionMode(JFileChooser.FILES_ONLY); //can only include files
	fileChooser.setFileFilter(new VPasFilter()); // can only be a Vector Pascal File

        int selected = fileChooser.showOpenDialog(this);
        File file = fileChooser.getSelectedFile();
        if (file != null && selected == JFileChooser.APPROVE_OPTION)
            return (file.getPath());
        else
            return " ";

	}

  
	/** Method that Updates the instances for Project Properties */

	private void UpdateReferences() 
	{

		PROJECTNAME= projectname_text_field.getText().trim();
		AUTHORNAME= authorname_text_field.getText().trim();
		PROJECTPATH= directory_text_field.getText().trim();
		PROJECTDESCRIPTION= project_description.getText().trim();

	} // Update References



/** Method that converts a project file to run on the current machine
 * Method lets user select the project to import, and also lets user select where to place the newly
 * converted project. This method assumes that all necessery source files are included in the directory with the
 * project file to be imported. 
 * In addition, importProject() can be used to copy project files within the same machine

**/

	public void importProject()
	{
		/** String that contains the old project path */
		String OLDPATH;

	    /* get users choice on where to load up the project */

	    JPanel main_panel= new JPanel();
	    
		/* set the layout of the panel */
		GridBagLayout gridlayout= new GridBagLayout();
		GridBagConstraints c= new GridBagConstraints();
		main_panel.setLayout(gridlayout);
	
		// Label
		JLabel projectlabel= new JLabel("Select project to import");
		c.gridx= 0;
		c.gridy= 0;
		c.anchor= GridBagConstraints.WEST;
		gridlayout.setConstraints(projectlabel,c);
	      main_panel.add(projectlabel);

	    // file import text field
	    import_file_textfield= new JTextField("",25);
	    import_file_textfield.setToolTipText("Select project file to import:");
		c.gridx= 0;
		c.gridy= 1;
		c.anchor= GridBagConstraints.WEST;
		gridlayout.setConstraints(import_file_textfield,c);
		main_panel.add(import_file_textfield);

		// browse button
		c.gridx= 1;
		c.gridy= 1;
		c.anchor= GridBagConstraints.WEST;
		gridlayout.setConstraints(import_file,c);
	   	main_panel.add(import_file);

	    //label
	    JLabel directorylabel= new JLabel("Select a directory for the project:");
	    c.gridx= 0;
	    c.gridy= 2;
	    c.anchor= GridBagConstraints.WEST;
	    gridlayout.setConstraints(directorylabel,c);
	    main_panel.add(directorylabel);

	    // directory for project to be placed text field
	    directory_text_field= new JTextField("",25);
	    directory_text_field.setToolTipText("Directory in which new project directory will be created");
	    c.gridx= 0;
	    c.gridy= 3;
	    c.anchor= GridBagConstraints.WEST;
	    gridlayout.setConstraints(directory_text_field,c);
	    main_panel.add(directory_text_field);

	
	    // button
	    c.gridx= 1;
	    c.gridy= 3;
	    c.anchor= GridBagConstraints.WEST;
	    gridlayout.setConstraints(browse_directory,c);
	    main_panel.add(browse_directory);
	    browse_directory.addActionListener(this);
	    import_file.addActionListener(this);
	    
	    JOptionPane optionPane= new JOptionPane(main_panel,JOptionPane.PLAIN_MESSAGE,JOptionPane.OK_CANCEL_OPTION);
	    JDialog dialog= optionPane.createDialog(this,"Import Project");
	    dialog.setResizable(false);
	    dialog.pack();
	    dialog.show();

	    int choice= ((Integer)optionPane.getValue()).intValue();

	    /* Convert Project if user Selects OK and we have valid directories */	
	    if (choice == JOptionPane.OK_OPTION && (!import_file_textfield.getText().equals("")) 
			|| (!directory_text_field.getText().equals("")))
	    {
		IMPORTPATH= import_file_textfield.getText().trim();	//import directory
		PROJECTPATH= directory_text_field.getText().trim();	// new directory for imported project
		File getname= new File(IMPORTPATH);
			if(getname.getName().toString().endsWith(".prj"))
			{
				// remove .prj extension of the project name
				PROJECTNAME= getname.getName().toString().substring(0,getname.getName().toString().length()-4);
			}



	    /* Create the project directory, create new project file based on the system and copy all source files
		to that directory */


	File new_directory= new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME +
						  System.getProperty("file.separator"));
	new_directory.mkdirs();
try
{
	// read the project file to convert
	File read_projectfile= new File(IMPORTPATH);
	FileReader fr= new FileReader(read_projectfile);
	BufferedReader br= new BufferedReader(fr);

	
	// write the new converted project file
	File new_projectfile= new File(new_directory,PROJECTNAME + ".prj");
	FileWriter fs= new FileWriter(new_projectfile);

	fs.write(br.readLine()); // project name
	fs.write(System.getProperty("line.separator"));

	fs.write(br.readLine()); // author name
	fs.write(System.getProperty("line.separator"));

	OLDPATH= br.readLine();	// old main file path

	if (OLDPATH.length() != 0 )
	{	

	      /* set the new file path and directory for the project, modifying the file separator */
		PROJECTMAIN= PROJECTPATH + System.getProperty("file.separator") + // new project path
				OLDPATH.substring(OLDPATH.indexOf(PROJECTNAME) ,(OLDPATH.indexOf(PROJECTNAME)+PROJECTNAME.length())) //project directory
				+ System.getProperty("file.separator") + OLDPATH.substring(OLDPATH.indexOf(PROJECTNAME) + (PROJECTNAME.length() + 1), 	
				OLDPATH.length()); // include the new file separator

		fs.write(PROJECTMAIN);    // project main file	
		fs.write(System.getProperty("line.separator"));
	}
	 else // no main file, so leave a blank line
	 {
		fs.write(System.getProperty("line.separator"));
	}


	
	OLDPATH= br.readLine(); // old project path
	fs.write(PROJECTPATH); // new project path
	fs.write(System.getProperty("line.separator"));

	boolean more_lines= false;
	String check_string= br.readLine(); //first line of description
	if(!check_string.equals(FILESEPERATOR))
	{
		more_lines= true;
	}
	while (more_lines) {
		fs.write(check_string);
		fs.write(System.getProperty("line.separator"));
		check_string= br.readLine();
		// stop when we reach the file separtor
		if (check_string.equals(FILESEPERATOR)) {
			fs.write(FILESEPERATOR);
			more_lines= false;
			fs.write(System.getProperty("line.separator"));
		}
	}
	
	/* read old file paths and convert to new ones */
	/* keep track of all those files Vector Pascal Source files, so they can be transferred */
	Vector source_file_list = new Vector(); //keeps track of all source files in the project being imported, so they can be copied

	check_string= br.readLine();	
	while (check_string != null )
	{

		fs.write(PROJECTPATH + System.getProperty("file.separator") +	// new project path
			   PROJECTNAME + System.getProperty("file.separator") +	// project directory
			   check_string.substring(check_string.indexOf(PROJECTNAME) + PROJECTNAME.length() + 1,check_string.length()));// the actual file 
		fs.write(System.getProperty("line.separator"));

		
		
		/* Append this source file, without the path, to the list */
		source_file_list.addElement(check_string.substring(check_string.indexOf(PROJECTNAME) + PROJECTNAME.length() + 1,check_string.length()));

		check_string= br.readLine();
	}
	

	// close the reading and writing files
	fr.close();
	fs.close();

	/* transfer source files over to the newly created directory for the project */
	for (int i= 0; i < source_file_list.size();i++)
	{
		File move_from= new File(IMPORTPATH.substring(0,IMPORTPATH.lastIndexOf(PROJECTNAME)-1),(String)source_file_list.elementAt(i));
		File move_to = new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator") ,
				   (String)source_file_list.elementAt(i));
		ViperFileHandler.moveFile(move_from,move_to);
	}


}

	// raised if directories cannot be found
	catch(FileNotFoundException fn)
	{
		JOptionPane.showMessageDialog(container,"Unable to find directory - Check directory names","Warning",JOptionPane.WARNING_MESSAGE);
	}

	// an I/O exceptopn
	catch(IOException io)
	{
		io.printStackTrace();
		System.out.println("Error in converting Project");
	}

	// any genral exception
	catch(Exception e)
	{
		System.out.println("An exception has occurred in the Import Project section");
	}
} // if user select OK

	    else {
		IMPORTPATH= "";
		PROJECTPATH= "";
	    }

		viper.tabbedPane.removeTabAt(0);	
	}



/************ COMPILER / BUILD METHODS ******************/


	/** Method that returns the Path of the Main file 
		* @return Returns a String that is the absolute path for the Current Main Project File
	*/

	static String projectMainFile()  
	{
		return PROJECTPATH +  System.getProperty("file.separator") + PROJECTNAME + System.getProperty("file.separator") + PROJECTMAIN;
	}




	/** Method that generates a project 'makefile' (.mke) based on all of the dependencies
	 *	* allows units to be compiled up 'bottom up' 
		* NOTE: Makefile is only produced if the Project contains a Mainfile : 
	*/

	public void generateMakeFile()
	{
		/** Names the makefile, complete path so it is based in the project directory */
		final String name= PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME + System.getProperty("file.separator") +
					PROJECTNAME +  ".mke";

	try 
	{

		/* Create the makefile*/
		File makefile_create= new File(name);
		FileWriter fs= new FileWriter(makefile_create.getPath().toString());
		
		/** Contains dependencies for each project file */
		Project_Dependencies[] dependent_files= getMakeProjectFiles(); 

		/** determines the position of the main file in dependent_files */
		int index= 0; 

		/** used to hold the dependencies of the mainfile */
		Vector dependfiles= new Vector(); 

		/* Get the Main file and its assocateted dependencies */
		if(!PROJECTMAIN.equals(""))
		{
			fs.write(PROJECTMAIN.substring(0,PROJECTMAIN.length()-4));
			fs.write(" ");

			File compare_file= new File(dependent_files[index].fileName());

			// determine position of the main file
			while(!(compare_file.getName().toString().equals(PROJECTMAIN)) && (index < dependent_files.length))
			{
				index++;
				compare_file= new File(dependent_files[index].fileName());
					

			}

			String display_files= "";
			
			
			// if found then display all dependencies of the Main file
			// if index > dependent_files.length then Main file has not been found
			if (index <= dependent_files.length)
				 
			{
				/* returns an array with the main files dependent files */
				String[] dependent_temp= dependent_files[index].dependentFiles(); // 

				/* convert to Vector to be passed into recursion */
				for(int i=0 ; i < dependent_temp.length;i++)
				{
						display_files=display_files + dependent_temp[i] +  " ";
						fs.write(dependent_temp[i] + " ");
						dependfiles.add(dependent_temp[i]); 					
				}
			
							  

			}

		}

	/* Use recursion and display all the files these files depend on - and so on */
	fs.write(writeDependentFiles(dependfiles)); // dependfiles empty?
	
	// close the 'makefile'
	fs.close();
	
	}// try
	catch(IOException io) {
		io.printStackTrace();
		System.out.println("Error in writing to makefile:");
	}
	
		
}


/** Method responsible for Compiling Vector Pascal Projects */

public void compileProject()
	{
		

		// tempory String to hold the line that needs to be tokenized 
		String temp="";
	try{
	
	/* open up the 'makefile', read in the line, tokenize and display the line(backwards)*/
	FileReader fis= new FileReader(PROJECTPATH + System.getProperty("file.separator")+ PROJECTNAME
								 + System.getProperty("file.separator") + PROJECTNAME + ".mke");
	BufferedReader br= new BufferedReader(fis);

	temp= br.readLine();
	
	// close the file
	br.close();
		
	}
	
	// catch any exceptions
	catch(Exception e)
	{
		System.out.println("Error in opening makefile" + e);
	}
	// tokenize the line
	String[] makelist= viper.toToken(temp);
	String[] moveList=getAllPascalFiles();
	ViperFileHandler.moveFiles(moveList);
	
	
	// Vector that contains the files in order they needed to be compiled 
	Vector makefilelist= new Vector();
	
	// display the line backwards
	for (int q=makelist.length - 1; q >= 0;q--)
	{
		
		File file =  new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator")+ makelist[q] + ".pas");   
		viper.loadChild(makelist[q] +".pas",file);
		makefilelist.addElement(makelist[q]);	
		viper.compileFile();
		ViperFileHandler.moveTo(System.getProperty("user.dir"),PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),makelist[q] + ".mpu",makelist[q] + ".mpu");
	}	
	for (int q=moveList.length - 1; q >= 0;q--)
	{
		
		File file =  new File(System.getProperty("user.dir")+ System.getProperty("file.separator")+ viper.getName(moveList[q])+".pas");   
		ViperFileHandler.moveTo(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),System.getProperty("user.dir"),viper.getName(moveList[q])+ ".mpu",viper.getName(moveList[q]) + ".mpu");
	 ViperFileHandler.moveTo(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),System.getProperty("user.dir"),viper.getName(moveList[q])+ ".asm",viper.getName(moveList[q]) + ".asm");
	 ViperFileHandler.moveTo(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),System.getProperty("user.dir"),viper.getName(moveList[q])+ ".lst",viper.getName(moveList[q]) + ".lst");
	
	}
	
	}




/** Method responsible for building Vector Pascal Projects */

public void buildProject()
	{
		

		// tempory String to hold the line that needs to be tokenized 
		String temp="";
	try{
	
	/* open up the 'makefile', read in the line, tokenize and display the line(backwards)*/
	FileReader fis= new FileReader(PROJECTPATH + System.getProperty("file.separator")+ PROJECTNAME
								 + System.getProperty("file.separator") + PROJECTNAME + ".mke");
	BufferedReader br= new BufferedReader(fis);

	temp= br.readLine();
	
	// close the file
	br.close();
		
	}
	
	// catch any exceptions
	catch(Exception e)
	{
		System.out.println("Error in opening makefile" + e);
	}
	// tokenize the line and retrieve all Vector Pascal Files
	String[] makelist= viper.toToken(temp);
	String[] moveList=getAllPascalFiles();


	/* Check files are up to date */
	


	ViperFileHandler.moveFiles(moveList);
	
	
	// Vector that contains the files in order they needed to be compiled 
	Vector makefilelist= new Vector();
	
	/* compile the file then move to user directory (VectorPascal) */
	// only compile those files that are not uptodate

	for (int q=makelist.length - 1; q >= 0;q--)
	{
		
		File file =  new File(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator")+ makelist[q] + ".pas");   
		viper.loadChild(makelist[q] +".pas",file);
		makefilelist.addElement(makelist[q]);	
		viper.compileFile();
		ViperFileHandler.moveTo(System.getProperty("user.dir"),PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),makelist[q] + ".mpu",makelist[q] + ".mpu");
	}	
	for (int q=moveList.length - 1; q >= 0;q--)
	{
		
		File file =  new File(System.getProperty("user.dir")+ System.getProperty("file.separator")+ viper.getName(moveList[q])+".pas");   
		ViperFileHandler.moveTo(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),System.getProperty("user.dir"),viper.getName(moveList[q])+ ".mpu",viper.getName(moveList[q]) + ".mpu");
	 ViperFileHandler.moveTo(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),System.getProperty("user.dir"),viper.getName(moveList[q])+ ".asm",viper.getName(moveList[q]) + ".asm");
	 ViperFileHandler.moveTo(PROJECTPATH + System.getProperty("file.separator") + PROJECTNAME  + System.getProperty("file.separator"),System.getProperty("user.dir"),viper.getName(moveList[q])+ ".lst",viper.getName(moveList[q]) + ".lst");
	
	}
	
	}



/** Method that can recurse down to multi level dependencies */
private String writeDependentFiles(Vector v)
{

	/** Dependencies for each file */
	Project_Dependencies[] dependent_files= getMakeProjectFiles(); // file dependencies
	

	/** Vector that holds ALL files to be recursed at next 'level' */
	Vector recurse_2= new Vector();

	/* if the vector is empty return the empty string - (i.e Module above has no dependencies)*/
	if(v.isEmpty())
	{
		return "";
	} 
	
	String temp= "";
	/* goes through all the files at this 'level' of dependency*/
	for(int i= 0; i < v.size();i++)
	{
		/** index of the current file in dependent_files - which contains all files the current file is dependent on*/
		int index= 0; 

		/** choose find_file as file at position i in v to be the current one */
		String find_file= (String)v.elementAt(i);


		/* find position this file is at in the array*/
		boolean found= false; //indicates if we have found the file

		// finds the index of the file in the array
		for(int c=0 ; c < dependent_files.length; c++)
		{
		// get the file to be compared against
		File compare= new File(dependent_files[index].fileName());

			if(compare.getName().toString().equalsIgnoreCase(find_file+".pas") || found)
				{
					found= true;
				}
			// if found then dont increment the counter
			else {

				index++;
			}			
	
		} //for c


	 /* Only search for further dependencies if the current file is in dependent_files list */
 

	/** Vector that holds dependent files for one*/
	Vector recurse= new Vector();
	
	/** contains all of the dependent files (to be displayed) */
	String display_files="";

	/* find all of its dependent files - only if exists */
if (found)
 {
	/** dependent files of the current file */
	String[] dependfiles= dependent_files[index].dependentFiles();
		// copy over all dependent files and append to display files vector
		for(int a= 0; a <dependfiles.length;a++)
		{
			display_files= display_files + " " + dependfiles[a];
			recurse.add(dependfiles[a]);
		
		}
}

		
	 // writes out to file what the file depends on

	 temp= temp + " " + display_files; 


	/* add values to recurse_2 vector to take us down to the next level of dependency */
	for(int b= 0; b < recurse.size(); b++)
	{
		recurse_2.add((String)recurse.elementAt(b));

	}
   }

	// return all the files and there dependencies
	return temp + writeDependentFiles(recurse_2);



}







	/** Method that returns the list of all files in the current project 
		* @return Returns an Array of Strings with the paths of the files.
	*/

        public String[] getAllProjectFiles()
        {
	
	    /* read files from projectJTree */
		String[] project_files= new String[projectchildren.size()];
		for (int i =0;i < projectchildren.size();i++)
		{
			project_files[i]= projectchildren.elementAt(i).toString();
		} 

	    return project_files;
	}


		
		/** Method that returns all Vector Pascal Files that the project knows about - has been added by the user
		 * @return an array of Vector Pascal Files
		 */
public String[] getAllPascalFiles()
{
	
	    /* read files from projectJTree */
		Vector project_files= new Vector();
		for (int i =0;i < projectchildren.size();i++)
		{
			// if pascal file add into vector
			if(projectchildren.elementAt(i).toString().toLowerCase().endsWith(".pas"))
			{
				project_files.addElement(projectchildren.elementAt(i).toString());
			}
		} 
		
		
		/* turn Vector into an array, then return */
		String[] pascal_files = new String[project_files.size()];
		for(int i=0; i < project_files.size();i++)
		{
			pascal_files[i]= (String)project_files.elementAt(i);
		}
		
	    return pascal_files;
	
}


	/** Method that returns the list of Pascal Files in the project with dependencies
		* @return Returns an array of Vector Pascal files, each one containing its dependent files
	*/

	public Project_Dependencies[] getMakeProjectFiles()
	{
		
		String[] makeFiles = getAllPascalFiles();

		/* return those files with a list of dependencies
		   open up each file, scan for dependecies 	*/
	
		/** Stores each file in the project with its associated dependencies */
		Project_Dependencies[] Files= new Project_Dependencies[makeFiles.length];
		for(int a= 0; a < Files.length; a++)
		{
		
			try
			{
			/* open up each file */
			FileReader fis= new FileReader(makeFiles[a]);

			BufferedReader br= new BufferedReader(fis);
		
			String input_line= br.readLine(); // read each line of the file

			/** stores temporily the names of the dependent files for the current file */
			Vector temp_files= new Vector(); 

			/* Go through the file and pick out the USES clause */
			while(input_line != null)
			{
				/* if a Uses clause is found add all files to the temp_files , check to see if uses is valid and not a comment
				   converts the input string to lower case inorder to find "uses" 				*/
				if(((input_line.indexOf("uses"))!= -1)&& (input_line.indexOf(';')) == input_line.length()-1)
				{	

					int start_position= input_line.indexOf("uses") + 5; // where we start from initially 
					int last_position= input_line.indexOf(';');	// the last possible position (as semicolon)
					int next_position= input_line.indexOf(',');	// position of the first comma in the list 	
													// if -1 only 1 file in the list
	
				/* if only one dependant file, add it to the temp vector */
				if(next_position == -1)
						
					{	
				
											
							temp_files.add(input_line.substring(start_position,last_position));


					}
				else // more than one file that this file is dependent on
					{

						while(start_position <= last_position)
						{
							temp_files.add(input_line.substring(start_position,next_position));
							// move on so the start_position is just after the previous comma
							// and the next position is at the FIRST comma after that (so encloses a dependent file)
							start_position= next_position + 1;

							// note: need to add absolute length to get correct position
							next_position= input_line.substring(start_position,last_position + 1).indexOf(',');

							/* if there is no more commas, just semi colon - so one more file to get*/
							if (next_position == -1) {

								temp_files.add(input_line.substring(start_position, last_position));
								start_position= last_position + 1; // indicates we have reached the end
							}
							else {
			
							next_position= next_position + start_position;		
							}
		
						} 

					}				

				} // on Uses Line


			
				
				/* get next line of input*/
				input_line= br.readLine();
			
   			} //while

			/* Append the current file and its associated dependencies to Files */

			Project_Dependencies obj= new Project_Dependencies(makeFiles[a],temp_files);
			Files[a]= obj;
			
		// close the file
		fis.close();

			}// try

		catch(IOException io) {
				io.printStackTrace();	
				System.out.println("Error in IO");
		}


	}// for


		/* return the list of files with there associated file dependencies */
		return Files;
	}
	


}//VIPER ProjectManager

