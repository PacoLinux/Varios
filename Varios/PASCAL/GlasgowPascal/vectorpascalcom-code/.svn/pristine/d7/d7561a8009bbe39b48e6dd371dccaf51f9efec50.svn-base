/**
 * IDEOptions.java - Sets properties within the Viper Environment.
 */
package viper;


import java.awt.*;
import javax.swing.*;
import javax.swing.colorchooser.*;
import javax.swing.event.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;


/** Class to display the Viper Options dialog.
 * 
 */
public class IDEOptions extends JDialog implements ActionListener
{

    /**      */
    Viper viper;
    /**      */
    private static Properties p;
    /**      */
    private String title = "Viper Options";

    //IDE Settings
    /**      */
    private JPanel messagePanel = new JPanel();
	private JPanel messagePanela = new JPanel();
         
    private JPanel panel2=new JPanel();
    /**      */
    private JPanel panel2a=new JPanel();
    /**      */
    private JPanel panel2b=new JPanel();
    /**      */
    private JPanel panel2c=new JPanel();
    /**      */
    private JPanel panel3=new JPanel();
    /**      */
    private JPanel panel3a=new JPanel();
    /**      */
    private JPanel panel3b=new JPanel();
    /**      */
   // private JPanel panel4=new JPanel();
    //    private String word1 = new String("Java");
	//ORO
	private JRadioButton[] menu = {//array holding the radiobuttons for the level of vptex compilation
	 new JRadioButton("16"),
	 new JRadioButton("24"),	
	 new JRadioButton("32"),
	};
	private JRadioButton[] toolbar = {//array holding the radiobuttons for the level of vptex compilation
	 new JRadioButton("16"),
	 new JRadioButton("24"),	
	 new JRadioButton("32"),
	};
	private String[] sizeOptions={"16","24","32"};
  
    /**      */
    String word2 = new String();
    /**      */
    JComboBox jComboBox1= new JComboBox();
    /**      */
    JComboBox jComboBox2 = new JComboBox();
    /**      */
    JComboBox jComboBox3 = new JComboBox();
    /**      */
    JComboBox jComboBox4 = new JComboBox();
    /**      */
    JComboBox jComboBox5 = new JComboBox();
    /**      */
    JComboBox jComboBox6 = new JComboBox();
    /**      */
    JComboBox jComboBox7 = new JComboBox();
    /**      */
    JComboBox jComboBox8 = new JComboBox();
    /**      */
    JButton jButton1 = new JButton("Change");
    /**      */
    JCheckBox jCheckBox1;
    // Console Settings
    /**      */
    private JPanel panel5=new JPanel();
    /**      */
    private JPanel panel5a=new JPanel();
    /**      */
    private JPanel panel5b=new JPanel();

    private JPanel panel6a=new JPanel();
	  
    private JPanel panel6b=new JPanel();
    /**      */
    JButton bcolor=new JButton("Background Colour");
    /**      */
    JButton fcolor=new JButton("Foreground Colour");


    /**      */
    public IDEOptions(Viper parent){
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
                                     "resources/viper.properties");
                p.load(is);
            }
        }
        catch (Exception e)
        {
            System.out.println(e);
        }
        
        //jCheckBox1=new JCheckBox ("Auto Indent",viper.props.AUTOINDENT);
		//oro
		
	jCheckBox1 = new JCheckBox("Auto Indent",new ImageIcon("viper/resources/rb.gif"),viper.props.AUTOINDENT);
    jCheckBox1.setPressedIcon(new ImageIcon("viper/resorurces/rbp.gif"));
	jCheckBox1.setRolloverIcon(new ImageIcon("viper/resources/rbr.gif"));	jCheckBox1.setRolloverSelectedIcon(new ImageIcon("viper/resources/rbrs.gif"));	jCheckBox1.setSelectedIcon(new ImageIcon("viper/resources/rbs.gif"));
	jCheckBox1.setFocusPainted(false);
	jCheckBox1.setBorderPainted(false);
	jCheckBox1.setContentAreaFilled(false);
	jCheckBox1.setMargin(new Insets(0,0,0,0));
		
		
		
		
		

        messagePanel.setBorder(
            BorderFactory.createTitledBorder(""));
        panel2.setBorder(
            BorderFactory.createTitledBorder(""));
        panel3.setBorder(
            BorderFactory.createTitledBorder(""));
       //panel4.setBorder(
         //   BorderFactory.createTitledBorder(""));
        panel5.setBorder(
            BorderFactory.createTitledBorder(""));

        messagePanel.setLayout(new BoxLayout(messagePanel, BoxLayout.Y_AXIS));


        //        jComboBox1 = new FontComboBox();

        jComboBox1.addItem("Serif");
        jComboBox1.addItem("SansSerif");
        jComboBox1.addItem("Monospaced");
        jComboBox1.addItem("Dialog");
        jComboBox1.addItem("DialogInput");
        //        jComboBox1.addItem("Lucida Console");

        jComboBox2.addItem("8");
        jComboBox2.addItem("9");
        jComboBox2.addItem("10");
        jComboBox2.addItem("11");
        jComboBox2.addItem("12");
        jComboBox2.addItem("14");
        jComboBox2.addItem("16");
        jComboBox2.addItem("20");

        //       jComboBox5 = new FontComboBox();

        jComboBox5.addItem("Serif");
        jComboBox5.addItem("SansSerif");
        jComboBox5.addItem("Monospaced");
        jComboBox5.addItem("Dialog");
        jComboBox5.addItem("DialogInput");
        //        jComboBox5.addItem("Lucida Console");

        jComboBox6.addItem("8");
        jComboBox6.addItem("9");
        jComboBox6.addItem("10");
        jComboBox6.addItem("11");
        jComboBox6.addItem("12");
        jComboBox6.addItem("14");
        jComboBox6.addItem("16");
        jComboBox6.addItem("20");

        UIManager.LookAndFeelInfo[] tpLAF =
            UIManager.getInstalledLookAndFeels();
        for (int i = 0; i < tpLAF.length; i++)
        {
            jComboBox3.addItem(tpLAF[i].getName().toString());
        }

        jComboBox4.addItem("4");
        jComboBox4.addItem("8");
        jComboBox4.addItem("12");
        panel2.setLayout(new GridLayout(0,1,4,0));
        panel2a.setLayout(new FlowLayout(FlowLayout.LEFT));
        panel2b.setLayout(new FlowLayout(FlowLayout.LEFT));
        panel2c.setLayout(new FlowLayout(FlowLayout.LEFT));
        panel2a.add(new JLabel("Font"));
        panel2a.add(jComboBox1);
        panel2a.add(new JLabel("Size"));
        panel2a.add(jComboBox2);
        panel2b.add(new JLabel("Tab Spaces"));
        panel2b.add(jComboBox4);
        panel2b.add(jCheckBox1);
        panel2c.add(new JLabel("Look & Feel"));
        panel2c.add(jComboBox3);

        panel2.add(panel2a);
        panel2.add(panel2b);
        panel2.add(panel2c);
        jCheckBox1.addActionListener(this);

        panel5.setLayout(new GridLayout(0,1,1,0));
        panel5a.setLayout(new FlowLayout(FlowLayout.LEFT));
        panel5a.add(new JLabel("Font"));
        panel5a.add(jComboBox5);
        panel5a.add(new JLabel("Size"));
        panel5a.add(jComboBox6);
        panel5b.add(bcolor);
        panel5b.add(fcolor);
        panel5.add(panel5a);
        panel5.add(panel5b);
		
		jComboBox7.addItem("Vector Pascal");
		jComboBox7.addItem("LaTeX");
        jComboBox7.addItem("HTML");
        //jComboBox7.addItem("JScript");
        //jComboBox7.addItem("JSP");

        jComboBox8.addItem("Block comment");
        jComboBox8.addItem("Line comment");
        jComboBox8.addItem("Keyword 1");
        jComboBox8.addItem("Keyword 2");
		jComboBox8.addItem("Keyword 3");
        //jComboBox8.addItem("Classes");
        jComboBox8.addItem("String");
        
       		
	   messagePanela.setLayout(new GridLayout(2,0,0,0));
	   panel6a.setLayout(new GridLayout(0,4,0,0));
	   /*  for (int i =0;i<icons.length ; i++)
		messagePanela.add(icons[i]);*/
	   for (int i =0;i<menu.length ; i++){
		if(p.getProperty("MENUICONSIZE").indexOf(sizeOptions[i].toString())!=-1)menu[i] = new JRadioButton(sizeOptions[i],new ImageIcon("viper/resources/rb.gif"),true);
	   else menu[i] = new JRadioButton(sizeOptions[i],new ImageIcon("viper/resources/rb.gif"));
		
    menu[i].setPressedIcon(new ImageIcon("viper/resorurces/rbp.gif"));
	menu[i].setRolloverIcon(new ImageIcon("viper/resources/rbr.gif"));	menu[i].setRolloverSelectedIcon(new ImageIcon("viper/resources/rbrs.gif"));	menu[i].setSelectedIcon(new ImageIcon("viper/resources/rbs.gif"));
	menu[i].setFocusPainted(false);
	menu[i].setBorderPainted(false);
	menu[i].setContentAreaFilled(false);
	menu[i].setMargin(new Insets(0,0,0,0));
		}
		 
		 
	   panel6a.add(new JLabel("Menu icon size: "));
		   
		 //add radioboxes to buttongroup
		 ButtonGroup bg = new ButtonGroup();
		 for (int i =0;i<menu.length ; i++)
		 bg.add(menu[i]);
		 
		 for (int i =0;i<menu.length ; i++)
		panel6a.add(menu[i]);
		panel6b.setLayout(new GridLayout(0,4,0,0));
   for (int i =0;i<toolbar.length ; i++){
   if(p.getProperty("TOOLBARICONSIZE").indexOf(sizeOptions[i])!=-1)toolbar[i] = new JRadioButton(sizeOptions[i],new ImageIcon("viper/resources/rb.gif"),true);
   else toolbar[i] = new JRadioButton(sizeOptions[i],new ImageIcon("viper/resources/rb.gif"));
    toolbar[i].setPressedIcon(new ImageIcon("viper/resorurces/rbp.gif"));
	toolbar[i].setRolloverIcon(new ImageIcon("viper/resources/rbr.gif"));	toolbar[i].setRolloverSelectedIcon(new ImageIcon("viper/resources/rbrs.gif"));	toolbar[i].setSelectedIcon(new ImageIcon("viper/resources/rbs.gif"));
	toolbar[i].setFocusPainted(false);
	toolbar[i].setBorderPainted(false);
	toolbar[i].setContentAreaFilled(false);
	toolbar[i].setMargin(new Insets(0,0,0,0));
		}
		 
		 
	   panel6b.add(new JLabel("Toolbar icon size: "));
		   
		 //add radioboxes to buttongroup
		 ButtonGroup bg1 = new ButtonGroup();
		 for (int i =0;i<toolbar.length ; i++)
		 bg1.add(toolbar[i]);
		 
		 for (int i =0;i<toolbar.length ; i++)
		panel6b.add(toolbar[i]);
		 
		 
		messagePanel.add(panel6a); 
		messagePanel.add(panel6b);
		messagePanel.add(messagePanela);
		
		
        panel3.setLayout(new GridLayout(0,1,3,0));
        panel3a.setLayout(new FlowLayout(FlowLayout.LEFT));
        panel3b.setLayout(new FlowLayout(FlowLayout.LEFT));
        panel3a.add(new JLabel("Language"));
        panel3a.add(jComboBox7);
        panel3b.add(new JLabel("Color group"));
        panel3b.add(jComboBox8);
        panel3b.add(jButton1);
        jComboBox7.addActionListener(this);
        jComboBox8.addActionListener(this);
        panel3.add(panel3a);
        panel3.add(panel3b);
        jButton1.addActionListener(this);
        jButton1.setBackground(new Color(viper.props.JCOLOR[0]));
        jButton1.repaint();

        bcolor.setBackground(viper.props.CONSOLEBCOLOUR);
        fcolor.setBackground(viper.props.CONSOLEFCOLOUR);
        fcolor.addActionListener(this);
        bcolor.addActionListener(this);

        JTabbedPane tp=new JTabbedPane();

        tp.addTab("Editor",panel2);
        tp.addTab("Console",panel5);
        tp.add(messagePanel,"Preferences");
        tp.addTab("Syntax Colours",panel3);
       // tp.addTab("Code Completion",panel4);

        final JOptionPane pane = new JOptionPane(
                                     tp, // message
                                     JOptionPane.PLAIN_MESSAGE, // messageType
                                     JOptionPane.OK_CANCEL_OPTION); // optionType

        //
        //  Display the currently set options in the pane.
        //

        String fontsize="8";
        String consolefontsize="8";
        fontsize=fontsize.valueOf(viper.props.FONTSIZE).toString();
        consolefontsize=consolefontsize.valueOf(viper.props.CONSOLEFONTSIZE).toString();
        String tabsize="4";
        tabsize=tabsize.valueOf(viper.props.TABSIZE).toString();
        jComboBox1.setSelectedItem(viper.props.FONTSTYLE);
        jComboBox2.setSelectedItem(fontsize);
        jComboBox3.setSelectedItem(viper.props.LOOKANDFEEL);
        jComboBox4.setSelectedItem(tabsize);
        jComboBox5.setSelectedItem(viper.props.CONSOLEFONT);
        jComboBox6.setSelectedItem(consolefontsize);
        jComboBox7.setSelectedItem("Vector Pascal");

        //
        // Display the Pane
        //

        JDialog dialog = new JDialog();
        dialog = pane.createDialog(
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
     * 
     * @param e 
     */
    public void actionPerformed(ActionEvent e)
    {
        Object source = e.getSource();
        if (source == bcolor)
        {
            Color color = JColorChooser.showDialog(IDEOptions.this, "Colour Chooser", viper.props.CONSOLEBCOLOUR);
            viper.props.CONSOLEBCOLOUR=color;
        }
        else if (source == fcolor)
        {
            Color color = JColorChooser.showDialog(IDEOptions.this, "Colour Chooser", viper.props.CONSOLEFCOLOUR);
            viper.props.CONSOLEFCOLOUR=color;
        }
        else if (source == jButton1){
            SelectColors(IDEOptions.this,jComboBox7.getSelectedItem().toString(),jComboBox8.getSelectedIndex());
        }
        else if (source == jCheckBox1){
        	if(jCheckBox1.isSelected())viper.props.AUTOINDENT=true;
        	else viper.props.AUTOINDENT=false;
        }
        else if (source == jComboBox7)
        {
            /*if (jComboBox7.getSelectedItem().toString().equals("Java"))
            {

                jComboBox8.removeAllItems();
                jComboBox8.addItem("Block comment");
                jComboBox8.addItem("Line comment");
                jComboBox8.addItem("Keyword 1");
                jComboBox8.addItem("Keyword 2");
                jComboBox8.addItem("Classes");
                jComboBox8.addItem("String");
                jComboBox8.addItem("Keyword 3");
                jComboBox8.addItem("Label");
                jButton1.setBackground(new Color(viper.props.JCOLOR[jComboBox8.getSelectedIndex()]));
                jButton1.repaint();
            }*/
			if (jComboBox7.getSelectedItem().toString().equals("Vector Pascal"))
            {
                jComboBox8.removeAllItems();
				jComboBox8.addItem("{ }Comment");
                jComboBox8.addItem("(* *)Comment");
                jComboBox8.addItem("Keywords");
                jComboBox8.addItem("VPTeX Comment");
                jComboBox8.addItem("Types");
				jComboBox8.addItem("String");
                jComboBox8.addItem("Boolean Literals");
                jComboBox8.addItem("N/A");
				jComboBox8.addItem("Operators");
				jComboBox8.addItem("Error");
                jButton1.setBackground(new Color(viper.props.VPASCOLOR[jComboBox8.getSelectedIndex()]));
                jButton1.repaint();
            }
            else if (jComboBox7.getSelectedItem().toString().equals("LaTeX"))
            {
                jComboBox8.removeAllItems();
                jComboBox8.addItem("Comment");
                jComboBox8.addItem("N/A");
                jComboBox8.addItem("\\ Keyword");
                jButton1.setBackground(new Color(viper.props.CCOLOR[jComboBox8.getSelectedIndex()]));
                jButton1.repaint();
            }
            else if (jComboBox7.getSelectedItem().toString().equals("HTML"))
            {
                jComboBox8.removeAllItems();
                jComboBox8.addItem("JS comment1");
                jComboBox8.addItem("JS comment2");
                jComboBox8.addItem("Tag");
                jComboBox8.addItem("Keywords");
                jComboBox8.addItem("JS keywords");
                jComboBox8.addItem("JS string");
                jComboBox8.addItem("JS literal");
                jComboBox8.addItem("HTML string");
                jButton1.setBackground(new Color(viper.props.HCOLOR[jComboBox8.getSelectedIndex()]));
                jButton1.repaint();
            }
            /*else if (jComboBox7.getSelectedItem().toString().equals("JScript"))
            {
                jComboBox8.removeAllItems();
                jComboBox8.addItem("Keyword 1");
                jComboBox8.addItem("Keyword 2");
            }*/
            /*else if (jComboBox7.getSelectedItem().toString().equals("JSP"))
            {
                jComboBox8.removeAllItems();
                jComboBox8.addItem("Comment 1");
                jComboBox8.addItem("Comment 2");
                jComboBox8.addItem("Key 1");
                jComboBox8.addItem("Key 2");
                jComboBox8.addItem("Key 3");
                jComboBox8.addItem("String 1");
                jComboBox8.addItem("Jkey/String");
                jComboBox8.addItem("String 2");
            }*/
        }
        //	else if ((source == jComboBox8)&& (!(word1.equals(jComboBox7.getSelectedItem().toString()))))
        else if (source == jComboBox8)
            //word1 is required since on instantiation of IDEOptions two actionevents are sent from
            //jComboBox8. Figure out why from basic definition of event.
        {
            if (jComboBox8.getSelectedIndex()>=0)
                //when jComboBox7 is changed too two events are created by jComboBox8
                //First one has invalid index. (Why?)
            {
                /*if (jComboBox7.getSelectedItem().toString().equals("Java"))
                {
                    jButton1.setBackground(new Color(viper.props.JCOLOR[jComboBox8.getSelectedIndex()]));
                    jButton1.repaint();
                }*/
				if (jComboBox7.getSelectedItem().toString().equals("Vector Pascal"))
                {
                    jButton1.setBackground(new Color(viper.props.VPASCOLOR[jComboBox8.getSelectedIndex()]));
                    jButton1.repaint();
				}
                else if (jComboBox7.getSelectedItem().toString().equals("LaTeX"))
                {
                    jButton1.setBackground(new Color(viper.props.CCOLOR[jComboBox8.getSelectedIndex()]));
                    jButton1.repaint();
                }
                else if (jComboBox7.getSelectedItem().toString().equals("HTML"))
                {
                    jButton1.setBackground(new Color(viper.props.HCOLOR[jComboBox8.getSelectedIndex()]));
                    jButton1.repaint();
                }
                /*else if (jComboBox7.getSelectedItem().toString().equals("JScript"))
                {
                    jButton1.setBackground(new Color(viper.props.JSCOLOR[jComboBox8.getSelectedIndex()+3]));
                    jButton1.repaint();
                }
                else if (jComboBox7.getSelectedItem().toString().equals("JSP"))
                {
                    jButton1.setBackground(new Color(viper.props.JSPCOLOR[jComboBox8.getSelectedIndex()]));
                    jButton1.repaint();
                }*/
                else if (jComboBox7.getSelectedItem()==null){}
            }
        }
    }


    /** 
     * Changes the color associated with each type word
     * 
     * @param cmp 
     * @param itemName 
     * @param elementindx 
     */
    public void SelectColors(Component cmp,String itemName, int elementindx){
        try{
            /*if(itemName.equals("Java")){
                Color original=new Color(viper.props.JCOLOR[elementindx]);
                Color color= JColorChooser.showDialog(cmp,"Colour Chooser",original);
                viper.props.JCOLOR[elementindx]=color.getRGB();
            }*/
		    if (itemName.equals("Vector Pascal")){
                Color original=new Color(viper.props.VPASCOLOR[elementindx]);
                Color color= JColorChooser.showDialog(cmp,"Colour Chooser",original);
                viper.props.VPASCOLOR[elementindx]=color.getRGB();
            }
            else if (itemName.equals("LaTeX")){
                Color original=new Color(viper.props.CCOLOR[elementindx]);
                Color color= JColorChooser.showDialog(cmp,"Colour Chooser",original);
                viper.props.CCOLOR[elementindx]=color.getRGB();
            }
            else if (itemName.equals("HTML")){
                Color original=new Color(viper.props.HCOLOR[elementindx]);
                Color color= JColorChooser.showDialog(cmp,"Colour Chooser",original);
                viper.props.HCOLOR[elementindx]=color.getRGB();
            }
            /*else if (itemName.equals("JScript")){
                Color original=new Color(viper.props.JSCOLOR[elementindx+3]);
                Color color= JColorChooser.showDialog(cmp,"Colour Chooser",original);
                viper.props.JSCOLOR[elementindx+3]=color.getRGB();
            }
            else if (itemName.equals("JSP")){
                Color original=new Color(viper.props.JSPCOLOR[elementindx]);
                Color color= JColorChooser.showDialog(cmp,"Colour Chooser",original);
                viper.props.JSPCOLOR[elementindx]=color.getRGB();
            }*/
        }
        catch(NullPointerException ex){}
    }
    /** Updates viper so that it can start using its new settings.
     * 
     */
    public void UpdateReferences(){
        String lnfName = jComboBox3.getSelectedItem().toString();
        if (p.getProperty("LOOKFEEL") != lnfName)
        {
            viper.props.LOOKANDFEEL=lnfName;
            // Force SwingSet to come up in the Cross Platform L&F
            try
            {
                if (lnfName.startsWith("Metal"))
                    lnfName = "javax.swing.plaf.metal.MetalLookAndFeel";
                else if (lnfName.startsWith("Window"))
                    lnfName =
                        "com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
                else if (lnfName.startsWith("CDE/Motif"))
                    lnfName = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
                else
                    lnfName = UIManager.getCrossPlatformLookAndFeelClassName();
                UIManager.setLookAndFeel(lnfName);
                SwingUtilities.updateComponentTreeUI(viper.getContentPane());

            }
            catch (Exception exc)
            {
                System.err.println("Error loading L&F: " + exc);
            }
        }
        int tabsize = Integer.parseInt(jComboBox4.getSelectedItem().toString());
        viper.props.TABSIZE = tabsize;
        if(jCheckBox1.isSelected())viper.props.AUTOINDENT = true;
        	else viper.props.AUTOINDENT = false;
		 for (int i =0;i<menu.length ; i++){
		  if (menu[i].isSelected())
			   viper.props.MENUICONSIZE =sizeOptions[i];
		 }
		  for (int i =0;i<toolbar.length ; i++){
		 if (toolbar[i].isSelected()){
			   viper.props.TOOLBARICONSIZE =sizeOptions[i];
		 }
		  }
        if (jComboBox1.getSelectedItem().toString() != viper.props.FONTSTYLE || Integer.parseInt
                (jComboBox2.getSelectedItem().toString()) != viper.props.FONTSIZE)
        {
            viper.props.FONTSIZE = Integer.parseInt(
                                      jComboBox2.getSelectedItem().toString());
            viper.props.FONTSTYLE = jComboBox1.getSelectedItem().toString();
            for (int counter = 0; counter < viper.children.size(); counter++)
            {
                Editor child = (Editor)viper.children.elementAt(counter);
                child.textarea.getPainter().setFont(new Font(
                                                        viper.props.FONTSTYLE, 0, viper.props.FONTSIZE));
                child.textarea.setText(child.textarea.getText());
            }
        }
        if (jComboBox5.getSelectedItem().toString() != viper.props.CONSOLEFONT || Integer.parseInt
                (jComboBox6.getSelectedItem().toString()) != viper.props.CONSOLEFONTSIZE)
        {
            viper.props.CONSOLEFONTSIZE = Integer.parseInt(
                                             jComboBox6.getSelectedItem().toString());
            viper.props.CONSOLEFONT = jComboBox5.getSelectedItem().toString();
            viper.viperconsole.viperConsole.setFont(new Font(viper.props.CONSOLEFONT, 0, viper.props.CONSOLEFONTSIZE));
        }
        viper.viperconsole.viperConsole.setForeground(viper.props.CONSOLEFCOLOUR);
        viper.viperconsole.viperConsole.setBackground(viper.props.CONSOLEBCOLOUR);
        viper.viperconsole.viperConsole.setCaretColor(viper.props.CONSOLEFCOLOUR);
        viper.props.SaveOptions();
    }
}
