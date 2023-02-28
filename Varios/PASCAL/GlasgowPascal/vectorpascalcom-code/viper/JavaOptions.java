/**
 * JavaOptions.java - Sets properties within the Viper Environment. 
 */
package viper;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;


public class JavaOptions extends JDialog implements ActionListener
{

	
    Viper viper;
    private static Properties p;
	private static VPCompPropsReader test;
    private String title = "Compiler Options";
    private JCheckBox defComp;//for the default/custom compiler
    private JTextField jTextField1 = new JTextField();
    private JTextField jTextField2 = new JTextField();
    private JTextField jTextField3 = new JTextField();
    private JTextField jTextField6 = new JTextField();
    private JTextField jTextField8 = new JTextField();
	private JTextField jTextField9 = new JTextField();
	private JTextField jTextField10 = new JTextField();
	private JTextField jTextField11 = new JTextField();
    private JButton jButton1 = new JButton();
    private JButton jButton2 = new JButton();
    private JButton jButton3 = new JButton();
    private JButton jButton4 = new JButton();
    private JButton jButton5 = new JButton();
    private JButton jButton6 = new JButton();
    private JButton jButton8 = new JButton();
	private JButton jButton11 = new JButton();
	private JPanel DynamicPanels[];
	//The combo box for the cpuflag
    private JComboBox cpus;
	
	private String names[];
    private JCheckBox dynamicCheckBoxes [] ;
    private JCheckBox[] checkBoxes = {
		new JCheckBox("SmartCompile"),
        new JCheckBox("S"),
        new JCheckBox("verbose"),
        new JCheckBox("cpuFlag"),
        new JCheckBox("fFormat"),
	    new JCheckBox("ISO"),
		new JCheckBox("CPUTAG")
		   };
   private String[] flags = {"Smart","-S","-V","-cpu","-f","-ISO","CPUTAG"};
   private String[] dynamicFlags;
   
   private JTextField dynamicJTextFields[];
   private JButton dynamicJButtons[];
    public JavaOptions(Viper parent){
        viper=parent;
		test = new VPCompPropsReader();
        try
        {
            p = new Properties();
            String userdir = System.getProperty("user.home");
            userdir = userdir + System.getProperty("file.separator") +
                      "viper.properties";
            File file = new File(userdir);
            if (file.exists())
                p.load(new FileInputStream(userdir));
            else
            {
                InputStream is = getClass().getResourceAsStream(
                                     "resources"+ System.getProperty("file.separator") +"viper.properties");
                p.load(is);
            }
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
		
		//ORO testing
		names = new String[(test.CPUS).length];//set up the CPU names string
        names = test.CPUS;//add the CPUS
		int noOfOptions = (test.FLAGS).length;
		int noOfTabbedPanels =(((test.FLAGS).length)/6)+1;
		int noOfPanels = noOfTabbedPanels*6;
		JPanel Panels[]= new JPanel[noOfPanels];
		dynamicJTextFields= new JTextField[noOfOptions];
		
		dynamicJButtons= new JButton[noOfOptions];
		for (int i=0;i<noOfOptions;++i){
			dynamicJButtons[i]= new JButton("Browse");
			dynamicJButtons[i].addActionListener(this);
		}
		for (int i=0;i<noOfOptions;++i){
		    	dynamicJTextFields[i]= new JTextField(test.TEXTFIELDS[i]);
		}
		for (int i=0;i<noOfPanels;++i){
			Panels[i] = new JPanel();
			Panels[i].setLayout(new GridLayout(4,1,4,1));
		}
		//create the number of needed panels
	    DynamicPanels= new JPanel[noOfTabbedPanels];
		//instantiate the panels
		for (int i =0;i<DynamicPanels.length;++i){
			  DynamicPanels[i]= new JPanel();
			  DynamicPanels[i].setLayout(new GridLayout(2,3));
	    }
		dynamicFlags = new String[noOfOptions];
		dynamicFlags = test.FLAGS;
		dynamicCheckBoxes = new JCheckBox[noOfOptions];
		
		for (int i =0;i<dynamicCheckBoxes.length ; i++){	//initialising and creating the checkboxes
		if(p.getProperty("DYNAMICOPTIONSTRING").indexOf(dynamicFlags[i])!=-1){
		  dynamicCheckBoxes[i] = new JCheckBox(dynamicFlags[i],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
		  dynamicJTextFields[i].setText(getFileFromOptionString(p.getProperty("DYNAMICOPTIONSTRING"),dynamicFlags[i]));
			}
        else dynamicCheckBoxes[i] = new JCheckBox(dynamicFlags[i],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
		
        dynamicCheckBoxes[i].setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
		dynamicCheckBoxes[i].setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));
		dynamicCheckBoxes[i].setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));
		dynamicCheckBoxes[i].setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
		dynamicCheckBoxes[i].setFocusPainted(false);
		dynamicCheckBoxes[i].setBorderPainted(false);
		dynamicCheckBoxes[i].setContentAreaFilled(false);
		dynamicCheckBoxes[i].setMargin(new Insets(0,0,0,0));
		dynamicCheckBoxes[i].setToolTipText(test.DESCRIPTIONS[i]);
		}	
		
		for (int i =0;i<dynamicCheckBoxes.length;++i){
		Panels[i].add(dynamicCheckBoxes[i]);
	
		if (test.TEXTFIELDS[i] > 0){
		Panels[i].add(dynamicJTextFields[i]);
			if (test.BROWSEBUTTONS[i])
		Panels[i].add(dynamicJButtons[i]);
		
		}
		
		}
		
		for (int i=0;i<Panels.length;++i){
		int currentPanel = i/6;
		DynamicPanels[currentPanel].add(Panels[i]);
		}
		
		
		//oro testing
		 
		/**
		 * Panels for constructing the tabbed panel
		 */

        JPanel messagePanel = new JPanel();
        JPanel panel2=new JPanel();
        JPanel panel3=new JPanel();
    
       messagePanel.setLayout(new GridLayout(3,3));
	
		
        messagePanel.setBorder(//Main option panel title
            BorderFactory.createTitledBorder("Vector Pascal Options:"));

        panel2.setBorder(
            BorderFactory.createTitledBorder(""));
        panel3.setBorder(
            BorderFactory.createTitledBorder(""));
//================START OF PANEL FOR "Vector Pascal Options"=======================
     

		if(p.getProperty("SMART").equalsIgnoreCase("true")){
				checkBoxes[0] = new JCheckBox(flags[0],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
		}
		else checkBoxes[0] = new JCheckBox(flags[0],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
		
    checkBoxes[0].setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
	checkBoxes[0].setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	checkBoxes[0].setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	checkBoxes[0].setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	checkBoxes[0].setFocusPainted(false);
	checkBoxes[0].setBorderPainted(false);
	checkBoxes[0].setContentAreaFilled(false);
	checkBoxes[0].setMargin(new Insets(0,0,0,0));
			
			for (int i =1;i<checkBoxes.length -1 ; i++){	//initialising and creating the checkboxes
				if(p.getProperty("OPTIONSTRING").indexOf(flags[i])!=-1){
				checkBoxes[i] = new JCheckBox(flags[i],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
				}
		else checkBoxes[i] = new JCheckBox(flags[i],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
		
    checkBoxes[i].setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
	checkBoxes[i].setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	checkBoxes[i].setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	checkBoxes[i].setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	checkBoxes[i].setFocusPainted(false);
	checkBoxes[i].setBorderPainted(false);
	checkBoxes[i].setContentAreaFilled(false);
	checkBoxes[i].setMargin(new Insets(0,0,0,0));
		}	
	if (p.getProperty("CPUTAG").equalsIgnoreCase("true")	)
		checkBoxes[6] = new JCheckBox(flags[6],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
	else 
		checkBoxes[6] = new JCheckBox(flags[6],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
		
    checkBoxes[6].setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
	checkBoxes[6].setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	checkBoxes[6].setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	checkBoxes[6].setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	checkBoxes[6].setFocusPainted(false);
	checkBoxes[6].setBorderPainted(false);
	checkBoxes[6].setContentAreaFilled(false);
	checkBoxes[6].setMargin(new Insets(0,0,0,0));
	
		int e=0;
			for (int i=0;i<names.length ;i++){
				if(p.getProperty("SELECTEDCPU").indexOf(names[i])!=-1){
						e=i;
				}
			  }
		    
     
		 
	  

            //add checkBoxes to the panel 
			messagePanel.add(checkBoxes[0]);
			messagePanel.add(checkBoxes[1]);
			messagePanel.add(checkBoxes[2]);
			messagePanel.add(checkBoxes[6]);
			//Set the layout for the second "line" 
			JPanel messagePanela=new JPanel();
			JPanel messagePanelb=new JPanel();
   		    messagePanela.setLayout(new GridLayout(4,1,4,1));
     		cpus = new JComboBox(names);//initialises the combobox
	    	cpus.setMaximumRowCount(names.length);
			cpus.setSelectedIndex(e);
			
			if (checkBoxes[3].isSelected()&& names[cpus.getSelectedIndex()].indexOf("Others")!=-1){ 
			 jTextField10.setEditable(true);
			 String cpu = p.getProperty("SELECTEDCPU");
			 String res;
			 res =cpu.substring(6);
			 jTextField10.setText(res);
			}
		     else
			jTextField10.setEditable(false);
			messagePanel.add(checkBoxes[5]);
		    
			messagePanela.add(checkBoxes[3]);
			messagePanela.add(cpus);
			messagePanela.add(jTextField10);
			jTextField9.setColumns(8);
			//messagePanel.add ( messagePanela );//add the panel
			
			
			messagePanelb.setLayout(new FlowLayout());
			messagePanelb.add(checkBoxes[4]);
			messagePanelb.add(jTextField9);
			
			jTextField9.setColumns(8);
			messagePanel.add ( messagePanelb);//add to panel
			messagePanel.add ( messagePanela);
			
			 
//======================END OF PANEL "VECTOR PASCAL OPTIONS"===========================		
      
//=======================START OF PANEL "Dependencies"===================  
	    //Checking for the previous value of COMPILER;	
		if(p.getProperty("COMPILER").indexOf("def")!=-1)defComp = new JCheckBox("Use Default Compiler",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
		else defComp = new JCheckBox("Use Default Compiler",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
		defComp.setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
		defComp.setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));		defComp.setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));		defComp.setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
		defComp.setFocusPainted(false);
		defComp.setBorderPainted(false);
		defComp.setContentAreaFilled(false);
		defComp.setMargin(new Insets(0,0,0,0));
	
	
		//these panels are used to layout the boxes.
        JPanel panel2a=new JPanel();
        JPanel panel2b=new JPanel();
        JPanel panel2c=new JPanel();
        JPanel panel2d=new JPanel();
        JPanel panel2e=new JPanel();
		JPanel panel2f = new JPanel();//ORO
        JPanel panel2g = new JPanel();
		
		panel2f.setLayout(new  GridLayout(1,2));
		panel2f.add(new JLabel("     "));
	    panel2f.add(defComp);

        panel2.setLayout(new GridLayout(0,1,1,0));
        jButton1.setText("Browse");
        jButton2.setText("Browse");
        jButton3.setText("Browse");
        jButton6.setText("Browse");
        jButton8.setText("Browse");
		jButton11.setText("Browse");
		
        panel2a.add(new JLabel("Source Compiler"));
        panel2a.add(jTextField1);
        jTextField1.setColumns(20);
		String comp;
		
		
		comp = p.getProperty("COMPILER");//get the string in COMPILER from Viper.properties
		//lock textfield if the default compiler is choosen
		if (comp.startsWith("def") )
			 jTextField1.setEditable(false);
		else
			 jTextField1.setEditable(true);

		panel2a.add(jButton1);
		
		
		
        panel2b.add(new JLabel("LaTeX Compiler"));
        panel2b.add(jTextField2);
        jTextField2.setColumns(20);
        panel2b.add(jButton2);
		
        panel2c.add(new JLabel("DVI Viewer     "));
        panel2c.add(jTextField3);
        jTextField3.setColumns(20);
        panel2c.add(jButton3);
		
        panel2d.add(new JLabel("Tex to HTML    "));
        panel2d.add(jTextField6);
        jTextField6.setColumns(20);
        panel2d.add(jButton6);
		
        panel2e.add(new JLabel("TEX to PDF     "));
        panel2e.add(jTextField8);
        jTextField8.setColumns(20);
        panel2e.add(jButton8);
		
        panel2g.add(new JLabel("DVI to PS      "));
        panel2g.add(jTextField11);
        jTextField11.setColumns(20);
        panel2g.add(jButton11);
		

      
		panel2.add(panel2f);
        panel2.add(panel2a);
        panel2.add(panel2b);
        panel2.add(panel2c);
        panel2.add(panel2d);
        panel2.add(panel2e);
		panel2.add(panel2g);
		//======================= END OF PANEL "Dependencies"===================  
		


        JTabbedPane tp=new JTabbedPane();
        tp.add(panel2,"Dependencies");
        tp.addTab("Options",messagePanel);
		if (dynamicCheckBoxes.length!=0){
		for (int i =0;i<DynamicPanels.length;++i)
			tp.addTab("Dynamic Options ("+(i+1) +")",DynamicPanels[i]);
		}
		//======================= END OF PANEL "Paths and Files"===================  
       
		
		//sets the text in the different textboxes;
        jTextField1.setText(p.getProperty("COMPILER"));
        jTextField2.setText(p.getProperty("LATEX"));
        jTextField3.setText(p.getProperty("DVIVIEWER"));
        jTextField6.setText(p.getProperty("TEXTOHTML"));
        jTextField8.setText(p.getProperty("TEXTOPDF"));
        jTextField9.setText(p.getProperty("FORMAT"));
		
		jTextField11.setText(p.getProperty("DVIPS"));

       //Add actionlisteners to buttons and other objects that needs one
        jButton1.addActionListener(this);
        jButton2.addActionListener(this);
        jButton3.addActionListener(this);
        jButton4.addActionListener(this);
        jButton5.addActionListener(this);
        jButton6.addActionListener(this);
        jButton8.addActionListener(this);
		jButton11.addActionListener(this);
	    defComp.addActionListener(this);
        checkBoxes[3].addActionListener(this);
	    cpus.addActionListener(this);
		
        final JOptionPane pane = new JOptionPane(
                                     tp, // message
                                     JOptionPane.PLAIN_MESSAGE, // messageType
                                     JOptionPane.OK_CANCEL_OPTION); // optionType

        JDialog dialog = pane.createDialog(
                             this, // parentComponent
                             title); // title

        dialog.setResizable(false);
        dialog.pack();
        dialog.show();

        Integer value=(Integer)pane.getValue();
        if(value.intValue()==JOptionPane.OK_OPTION)UpdateReferences();
    }
	
	

    /**
     * Respond to users requests
     */
    public void actionPerformed(ActionEvent e)
    {
                Object source = e.getSource();
		 if (source == defComp){
            if (defComp.isSelected()) 
			 jTextField1.setEditable(false);
		else
			jTextField1.setEditable(true);}
		
        else if (source == jButton1)
			   if(!defComp.isSelected())
                   jTextField1.setText(BrowseName("Compiler", jTextField1.getText()));
		             else
		              { JOptionPane vptexOptPane = new JOptionPane();
		                vptexOptPane.setFont(new Font("dialog", Font.PLAIN, 11));
		                vptexOptPane.showMessageDialog(this,"You can not browse for compiler when default compiler  is selected", "Compiler Options", JOptionPane.WARNING_MESSAGE);
	                   }
        else if (source == jButton2)
            jTextField2.setText(BrowseName("Latex Compiler", jTextField2.getText()));
        else if (source == jButton3)
            jTextField3.setText(BrowseName(
                                    "DVI viewer", jTextField3.getText()));
        else if (source == jButton6)
            jTextField6.setText(BrowseName(
                                    "Tex to HTML", jTextField6.getText()));
        else if (source == jButton8)
            jTextField8.setText(BrowseName(
                                    "TEX TO PDF", jTextField8.getText()));
		else if (source == jButton11)
            jTextField11.setText(BrowseName(
                                    "DVI TO PS", jTextField8.getText()));
		
		 else if (source ==   checkBoxes[3] || source==cpus  ){
            if (checkBoxes[3].isSelected()&& names[cpus.getSelectedIndex()].indexOf("Others")!=-1) 
			 jTextField10.setEditable(true);
		else
			jTextField10.setEditable(false);}
		 
		  for (int i=0;i<dynamicJButtons.length;++i){
			  if (source ==dynamicJButtons[i]){
			  dynamicJTextFields[i].setText(BrowseName(
                                    dynamicFlags[i], dynamicJTextFields[i].getText()));
			  
			  }
				
		}
    }
    String BrowseName(String title, String field)
    {
        JFileChooser fileChooser = new JFileChooser();
        fileChooser.setDialogTitle("Browse for " + title);
        int selected = fileChooser.showOpenDialog(this);
        File file = fileChooser.getSelectedFile();
        if (file != null && selected == JFileChooser.APPROVE_OPTION)
            return (file.getPath());
        else
            return field;
    }

    public void UpdateReferences(){
      
        viper.props.DVIVIEWER=  jTextField3.getText();
        viper.props.LATEX = jTextField2.getText();
        viper.props.SMART = checkBoxes[0].isSelected();
		viper.props.CPUTAG =checkBoxes[6].isSelected();
		if (defComp.isSelected())
        viper.props.COMPILER= "default";
		else
		viper.props.COMPILER= jTextField1.getText();
		//end deal with default compiler
        viper.props.TEXTOHTML= jTextField6.getText();
        viper.props.TEXTOPDF= jTextField8.getText();
        viper.props.JAVAOPTIONSTRING=optionString();
		viper.props.DYNAMICOPTIONSTRING =dynamicOptionString();
	    viper.props.FORMAT= jTextField9.getText();
		viper.props.DVIPS =jTextField11.getText();
		if(checkBoxes[3].isSelected()){//Inserts the needed cpu
	    if (names[cpus.getSelectedIndex()].indexOf("Others")!=-1) 
			viper.props.SELECTEDCPU = "Others" +jTextField10.getText();
		else
		viper.props.SELECTEDCPU =names[cpus.getSelectedIndex()] ;
			
		}
		else
		viper.props.SELECTEDCPU =" " ;
		
		
        viper.props.SaveOptions();
    }
    String optionString(){
        String optionstring="";
		//building the options string
        if(checkBoxes[1].isSelected())optionstring+="-S ";
        if(checkBoxes[2].isSelected())optionstring+="-V ";
		
		if(checkBoxes[3].isSelected()){//Inserts the needed cpu
			optionstring+="-cpu";
			
			if (names[cpus.getSelectedIndex()].indexOf("Others")!=-1) 
				optionstring+=jTextField10.getText()+" "; 
			else optionstring+=names[cpus.getSelectedIndex()]+" " ;
		}
		if(checkBoxes[4].isSelected()){
			optionstring+="-f";
		     optionstring+=jTextField9.getText()+" ";
		     }
		
        return optionstring;
    }

	String dynamicOptionString(){
        String optionstring="";
		
		for (int i=0;i<dynamicCheckBoxes.length;++i){
			  
			  if (dynamicCheckBoxes[i].isSelected()){
				  optionstring+=dynamicFlags[i];
			      optionstring +=dynamicJTextFields[i].getText() +" ";
				  if((dynamicJTextFields[i].getText()).equals(""))
					 optionstring +=" ";
			  }
			
		}
		  return optionstring;
	}
	
	public String getFileFromOptionString(String optString,String flg){
	 StringTokenizer ct= new StringTokenizer(optString," ");
	 String  to ="";
	 ArrayList al = new ArrayList();
	 while (ct.hasMoreTokens()) {
         al.add(ct.nextToken());
     }
	 for (int i=0;i<al.size();++i){
		 to = ((String)al.get(i)).trim();
		 if (to.indexOf(flg)!=-1){
			 to =to.substring(flg.length());
			 return to;
		 }//end if
		
	 }//end for
		 return to;
	}//end getFileFromOtpionString
		
}//end of class
