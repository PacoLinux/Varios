
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




/**
 * @author V.I.P.E.R Team
 * This class provides the panel for Run Options
 */


public class RunOptions extends JDialog implements ActionListener
{
    
   
    Viper viper;
    private static Properties p;
    private String title = "Run Options";
	private JCheckBox jCheckBox1; 
	private JCheckBox jCheckBox2;
	private JButton jButton1;
	private JButton jButton2;
	private JTextField jTextField1;
	private JTextField jTextField2;
	private JPanel jPanel1;
	private JPanel jPanel2;
	private JDialog dialog 	;
	private JOptionPane pane	;
	 
    /**
     * @param parent,The current Viper 
     * Creates the panel
     */
	
	
    public RunOptions(Viper parent){
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
		
	//if(p.getProperty("COMPINFILE").indexOf("-IN")!=-1)
		if(viper.props.COMPINFILE != null &&(viper.props.COMPINFILE).indexOf("-IN")!=-1)
		jCheckBox1 = new JCheckBox("Redirect Input",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
	else jCheckBox1 = new JCheckBox("Redirect Input",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
    jCheckBox1.setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resorurces"+ System.getProperty("file.separator") +"rbp.gif"));
	jCheckBox1.setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	jCheckBox1.setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	jCheckBox1.setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	jCheckBox1.setFocusPainted(false);
	jCheckBox1.setBorderPainted(false);
	jCheckBox1.setContentAreaFilled(false);
	jCheckBox1.setMargin(new Insets(0,0,0,0));
	jCheckBox1.addActionListener(this);
    JPanel jPanel1a = new JPanel();
	jPanel1a.setLayout(new BorderLayout());
	jPanel1a.add(jCheckBox1,BorderLayout.WEST);
	JPanel jPanel1b  = new JPanel();
	jPanel1b.setLayout(new GridLayout(0,2));
	jButton1 = new JButton("Browse");
	jButton1.addActionListener(this);
	jTextField1 = new JTextField(20);
        jTextField1.setText(getINFile());
	jPanel1b.add(jTextField1);
	jPanel1b.add(jButton1);
	
	
	
	
   //if(p.getProperty("COMPOUTFILE").indexOf("-OUT")!=-1)
	 if((viper.props.COMPOUTFILE)!=null && (viper.props.COMPOUTFILE).indexOf("-UT")!=-1)
		 jCheckBox2 = new JCheckBox("Redirect Output",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"),true);
   else jCheckBox2 = new JCheckBox("Redirect Output",new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rb.gif"));
    jCheckBox2.setPressedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbp.gif"));
	jCheckBox2.setRolloverIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbr.gif"));	jCheckBox2.setRolloverSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbrs.gif"));	jCheckBox2.setSelectedIcon(new ImageIcon("viper"+ System.getProperty("file.separator") +"resources"+ System.getProperty("file.separator") +"rbs.gif"));
	jCheckBox2.setFocusPainted(false);
	jCheckBox2.setBorderPainted(false);
	jCheckBox2.setContentAreaFilled(false);
	jCheckBox2.setMargin(new Insets(0,0,0,0));
	jCheckBox2.addActionListener(this);//adds action listener to the jCheckBox2 option
	
	
     JPanel jPanel2a=new JPanel();//panel to add buttons to
	 jPanel2a.setLayout(new BorderLayout());
	 jPanel2a.add(jCheckBox2,BorderLayout.WEST);
	 
     
	JPanel jPanel2b = new JPanel();
	jPanel2b.setLayout(new GridLayout(0,2));
	jButton2 = new JButton("Browse");
	jButton2.addActionListener(this);
	jTextField2 = new JTextField(20);
	jTextField2.setText(getOUTFile());
	jPanel2b.add(jTextField2);
	jPanel2b.add(jButton2);
	   
	 
	   
	
	   
		   //add toradiobuttons to panel
	 
		 
		
		 
		JPanel messagePanel = new JPanel();//creates the panel that panel 4 will go on top of
        messagePanel.setBorder(
            BorderFactory.createTitledBorder("RUN OPTIONS"));
 

        messagePanel.setLayout(new GridLayout(4,0,2,0));
	    messagePanel.add ( jPanel1a );//add to message panel
		messagePanel.add ( jPanel1b );	
		messagePanel.add ( jPanel2a );
		messagePanel.add ( jPanel2b);
		
       JTabbedPane tp=new JTabbedPane();//the main tabbed panel
       tp.addTab("Redirect Input",messagePanel);//add the tab
		




         pane = new JOptionPane(//the final optionpane
                                     tp, // message
                                     JOptionPane.PLAIN_MESSAGE, // messageType
                                     JOptionPane.OK_CANCEL_OPTION); // optionType

       dialog = pane.createDialog(
                             this, // parentComponent
                             title); // title

        dialog.setResizable(false);
		dialog.setSize(400,300);
        dialog.pack();
        /*dialog.show();

        Integer value=(Integer)pane.getValue();
        if(value.intValue()==JOptionPane.OK_OPTION)UpdateReferences();
		if(value.intValue()==JOptionPane.CANCEL_OPTION){
			UpdateReferences();
		}*/
		
		
		
    }
	public boolean showPanel(){
	dialog.show();
     
        Integer value=(Integer)pane.getValue();
		if(value.intValue()==JOptionPane.OK_OPTION){
		    
			UpdateReferences();
			return true;
		}
		if(value.intValue()==JOptionPane.CANCEL_OPTION){
			UpdateReferences();
			return false;
		}
		return false;
	}

    /**
     * Respond to users requests
     */
    public void actionPerformed(ActionEvent e)
    {
		 Object source = e.getSource();
		 if (source == jButton1){
          jTextField1.setText(BrowseName("IN FILE", jTextField1.getText()));
	  UpdateReferences();
		 }
		 else if (source == jButton2){
            jTextField2.setText(BrowseName("OUT FILE", jTextField2.getText())); 
            UpdateReferences();
		 }
		 if (source == jCheckBox1){
		     if (!jCheckBox1.isSelected())
			 jTextField1.setText(" ");
                 }
      if (source == jCheckBox2){
		     if (!jCheckBox2.isSelected())
			 jTextField2.setText(" ");
                 }
   
    }
/**
 * Updates the references in the properties file
 */
    public void UpdateReferences(){

		
		 viper.props.COMPOUTFILE=optionString("UT");
		 viper.props.COMPINFILE=optionString("IN");
		 viper.props.SaveOptions();
    }
	
	
	/**
	 * Creates the optionstring
	 */
    String optionString(String which){
		if (which.indexOf ("IN")!=-1){
			if (jCheckBox1.isSelected())
			return "-IN " +jTextField1.getText();
		
		else return null;
		}
		else{
			if (jCheckBox2.isSelected())
			return "-UT " +jTextField2.getText();
			else 
			return null;
		}
    }
	/**
	 * @param title,The title for the browse box
	 * @param field, The String to be returned if no file is choosen
	 * @return The file chooosen
	 * This method opens a file-browser box
	 */
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
	  /**
	   * @return The name and path string for the file where the input is to be read from
	   */
	  private String getINFile(){
	     	 String  to =" ";
			 if((viper.props.COMPINFILE!=null)){ 
        StringTokenizer ct= new StringTokenizer(viper.props.COMPINFILE ," ");

	 ArrayList al = new ArrayList();
	 while (ct.hasMoreTokens()) {
         al.add(ct.nextToken());
     }
	 if (al.size()>1)
		 to = ((String)al.get(1)).trim();
			 }
		 
			 return to;
		  
		  
		}

	  /**
	   * @return String, the file where the output of the run process is to written to
	   */
	  
	  private String getOUTFile(){
           String  to ="";
		   if ((viper.props.COMPOUTFILE)!=null){
	 StringTokenizer ct= new StringTokenizer(viper.props.COMPOUTFILE ," ");
	
	 ArrayList al = new ArrayList();
     
	 while (ct.hasMoreTokens()) {
         al.add(ct.nextToken());
     }
	 if (al.size()>1)
		 to = ((String)al.get(1)).trim();
	 }
	  
			 return to;
			 
			 
		}//end  getOUTFile
	  
    public String getInFile(){
	String to =" ";
          if (jCheckBox1.isSelected())
             to = jTextField1.getText();
	  return to;
   
    }

	  
    public String getOutFile(){
	String to =" ";
           if (jCheckBox2.isSelected())
          to = jTextField2.getText();
	  return to;
   
    }
   
}
