 
 
package viper;

import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;




import javax.swing.event.*;
import javax.swing.text.*;
import javax.swing.border.*;
import javax.swing.colorchooser.*;
import javax.swing.filechooser.*;
import javax.accessibility.*;


import java.beans.*;
import java.applet.*;
import java.net.*;

/**
 * @author VIPER TEAM
 * Class to handle the what level of vp-tex the user wants
 * last updated:03/02-2001
 */
public class VPTexOptions extends JDialog implements ActionListener
{
    
   
    Viper viper;
    private static Properties p;
    private String title = "Compiler Options";
	private JRadioButton[] levelOfVPtex = {//array holding the radiobuttons for the level of vptex compilation
	 new JRadioButton("Level 1"),
	 new JRadioButton("Level 2"),	
	 new JRadioButton("Level 3"),
	 new JRadioButton("Level 4"),
	 new JRadioButton("Level 5")
	};
		
	private String[] txtString ={//array holding the text for buttons
		"Level 1, Procedure & Function headings only",
		"Level 2,Level 1 + special comments",
		"Level 3,Program bodies/interface",
		"Level 4,Selected text",
	    "All"};
		
		
		
		
		
	private JCheckBox math;//the chckbox for wether to use the math converter or not
    private JCheckBox contentsPage;
	
	
    public VPTexOptions(Viper parent){
        viper=parent;
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
	 
	
//===================================================================================================
		//String description = getString("ButtonDemo.phone");
		for (int i =0;i<levelOfVPtex.length ; i++){	
			//int test = i+1;
		if(p.getProperty("VPTEXOPTIONS").indexOf((new Integer(i)).toString())!=-1)levelOfVPtex[i] = new JRadioButton(txtString[i],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
		else levelOfVPtex[i] = new JRadioButton(txtString[i],new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
    levelOfVPtex[i].setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
	levelOfVPtex[i].setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	levelOfVPtex[i].setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	levelOfVPtex[i].setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	levelOfVPtex[i].setFocusPainted(false);
	levelOfVPtex[i].setBorderPainted(false);
	levelOfVPtex[i].setContentAreaFilled(false);
	levelOfVPtex[i].setMargin(new Insets(0,0,0,0));
		}
		
		//now we deal with the math converter icon
   if(p.getProperty("MATHCONVERTER").indexOf("true")!=-1)math = new JCheckBox("Use maths converter",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
   else math = new JCheckBox("Use maths converter",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
    math.setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbp.gif"));
	math.setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	math.setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	math.setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	math.setFocusPainted(false);
	math.setBorderPainted(false);
	math.setContentAreaFilled(false);
	math.setMargin(new Insets(0,0,0,0));
	
	//deal with contentspage
	 if(p.getProperty("CONTENTSPAGE").indexOf("true")!=-1)contentsPage = new JCheckBox("Create Contents Page",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
   else contentsPage = new JCheckBox("Create Contents Page",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
    contentsPage.setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbp.gif"));
	contentsPage.setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	contentsPage.setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	contentsPage.setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	contentsPage.setFocusPainted(false);
	contentsPage.setBorderPainted(false);
	contentsPage.setContentAreaFilled(false);
	contentsPage.setMargin(new Insets(0,0,0,0));
       JPanel panel4=new JPanel();//panel to add buttons to
	   panel4.setLayout(new GridLayout(levelOfVPtex.length+2,1,0,0));
	 //  panel4.add(Box.createRigidArea(new Dimension(10,10)));
	   //add actionlisteners to radiobuttons
	   for (int i =0;i<levelOfVPtex.length ; i++)
		   levelOfVPtex[i].addActionListener(this);
	   
	
	   
		   //add toradiobuttons to panel
		for (int i =0;i<levelOfVPtex.length ; i++)
		panel4.add(levelOfVPtex[i]);
		
	
		   
		 //add radioboxes to buttongroup
		 ButtonGroup bg = new ButtonGroup();
		 for (int i =0;i<levelOfVPtex.length ; i++)
		 bg.add(levelOfVPtex[i]);
		 

		math.addActionListener(this);//adds action listener to the math option
		contentsPage.addActionListener(this);
		panel4.add(math);//Adds the math option to the panel
		panel4.add(contentsPage);
		JPanel messagePanel = new JPanel();//creates the panel that panel 4 will go on top of
        messagePanel.setBorder(
            BorderFactory.createTitledBorder("VP-Tex Options:"));
 

        messagePanel.setLayout(new GridLayout(1,1,2,0));
	    messagePanel.add ( panel4 );//add to message panel
			
       JTabbedPane tp=new JTabbedPane();//the main tabbed panel
        tp.addTab("Options",messagePanel);//add the tab
		




        final JOptionPane pane = new JOptionPane(//the final optionpane
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
    }
/**Updates the references in the properties file
 */
    public void UpdateReferences(){

		 viper.props.MATHCONVERTER=math.isSelected();
		 viper.props.CONTENTSPAGE =contentsPage.isSelected();
		 viper.props.VPTEXOPTIONS=optionString();
		 viper.props.SaveOptions();
    }
	
	
	/**Creates the optionstring
	 */
    String optionString(){
        String optionstring="";
        if (levelOfVPtex[0].isSelected())optionstring+="0 ";
        if (levelOfVPtex[1].isSelected())optionstring+="1 ";
		if (levelOfVPtex[2].isSelected())optionstring+="2 ";
		if (levelOfVPtex[3].isSelected())optionstring+="3 ";
		if (levelOfVPtex[4].isSelected())optionstring+="4 ";
		//if (math.isSelected())optionstring += "true ";
		//else optionstring+= "false ";
        return optionstring;
    }
}
