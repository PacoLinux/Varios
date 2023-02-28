/**
 * viper.java - Main Class for viper. 
 * by -- The Viper Team 2002 --
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
import javax.swing.JOptionPane;
import java.net.URL;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.net.*;

import org.gjt.sp.jedit.syntax.*;
import org.gjt.sp.jedit.textarea.*;

import VPTeX.*;
import ilcg.tree.*;
		   


/**
 * The main viper application class.
 */
   public class Viper extends JFrame implements ActionListener
	   
   {
	   BrowserLauncher browserlauncher; 
	   ViperCompiler    compiler;
	   VPasCompiler vipcomp;
	   public Walker walker;
	   static PropertiesManager props;
	   ViperConsole viperconsole;
	   ViperMethodFinder    speedbar;
	   IDEOptions optiondialog;
	   JavaOptions optionJavadialog;
	   ViperProjectManager project;
	   Find find;
	   FindInFiles findin;
	   StatusBar    statusBar;
	   JFileChooser fileChooser;
	   //   ViperBrowser viperBrowser;
	   HelpConsole helpConsole;
	   VPTexOptions optionVPTexdialog;
	   vPTeX    vptex;
	   static String    os = null;
	   static String    compFlag = null;    
	   static String    lnfName = null;
	   File CURRENTDIR;
	   Container    container;
	   static JMenu window, recentFiles,    recentProjects, openMenu;
	   protected    static Vector children = null;
	   protected    static Editor activeChild = null;
	   JTree    directorytree;
	   TreeSelectionModel dirselectionModel;
	   public JList compileErrorPanel,filesearchlistPanel;
	   public DefaultListModel compilerErrors,filesearchModel;
	   private Properties viperProperties;
	   private Hashtable    commands;
	   private JMenuBar menubar;
	   private JToolBar toolbar,toolbar1,toolbar2;
	   static JTabbedPane tabbedPane;
	   static JTabbedPane tabbedPane2;
	   static JTabbedPane tabbedPane3;
	   JPopupMenu popup,    popup2;
	   static JSplitPane    sp,sp2,sp3;
	   JPanel panel;
	   protected    static int window_num = 0;
	   static JMenuItem windowitem,rprojectitem,rfileitem,oMenuitem;
	   static JCheckBoxMenuItem view;
	   String textcache = "";
	   static int saveorquitoption =    0;
	   protected    int Buttonswitch = 0;
	   static int screenHeight;
	   private String[] rfiles;
	   private String[] rprojects;
	   private String[] oMenu;
	   static String    SYSDET = "Java version:"+System.getProperty("java.version")+"\n"+
								 "OS Name:"+System.getProperty("os.name")+"\n"+
								 "OS version:"+System.getProperty("os.version")+"\n"+
								 "OS arch:"+System.getProperty("os.arch");
	   static String    ABOUTMSG =
								  "         VIPER Version 2.1\n"+
								  "Written by\nKen Renfrew,    Martin Ronaes\nDouglas Tinto, Eirik Opland\nStephen Hughes, "+
								  "Kenny Borland.";
	   static String    gplLicence =
									"(**\n *   <one line to give the program's name and a brief idea of what it does.>\n"+
									"  *  Copyright (C) 20yy  <name of author>\n *\n *  This program is free software;"+
									"  you can redistribute it and/or modify\n *  it under the terms of the GNU General "+
									"Public License as published by\n  *  the Free Software Foundation; either version 2 of"+
									"  the License, or\n *  (at your option) any later version.\n *\n *  This program is "+
									"distributed in the hope that  it will be useful,\n *  but WITHOUT ANY WARRANTY; without"+
									"  even the implied warranty of\n *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE."+
									"   See the\n *  GNU General Public License for more details.\n *\n *  You should have"+
									"  received a copy of the GNU General Public License\n *  along with this program; if not, "+
									"write to  the Free Software\n *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.\n *)";
	   
	   /**
	   * Suffix applied to the key used in resource file lookups for an image.
	   */
	   //menus
	   public static    final String mImageSuffix= "mImage";
	   //toolbars
	   public static    final String tImageSuffix= "tImage";
	   
	   /**
		* Suffix applied to the key used in resource file lookups for a label.
		*/
	   public static    final String labelSuffix = "Label";
	   
	   /**
		* Suffix applied to the key used in resource file lookups for tooltip 
		* text.
		*/
	   public static    final String tipSuffix = "Tooltip";
	   /**
		*   Constructer for the main Viper Class.
		*   Default constructor only
		*/
	   public Viper()
	   {
		   super("V.I.P.E.R.");
		   container = this.getContentPane();
		   props=new PropertiesManager(this);
		   walker= null;
		   
		   // Force SwingSet to come up in  the Cross Platform L&F
		   try
		   {
			   if (props.LOOKANDFEEL.startsWith("Metal"))
				   lnfName = "javax.swing.plaf.metal.MetalLookAndFeel";
			   else if  (props.LOOKANDFEEL.startsWith("Window"))
				   lnfName ="com.sun.java.swing.plaf.windows.WindowsLookAndFeel";
			   else if  (props.LOOKANDFEEL.startsWith("CDE/Motif"))
				   lnfName = "com.sun.java.swing.plaf.motif.MotifLookAndFeel";
			   else
				   lnfName = UIManager.getCrossPlatformLookAndFeelClassName();
			   UIManager.setLookAndFeel(lnfName);
		   }
		   catch (Exception exc)
		   {
			   System.err.println("Error loading L&F: " + exc);
		   }
		   try
		   {
			   viperProperties  = new Properties();
			   String userdir = System.getProperty("user.home");
			   userdir  = userdir + System.getProperty("file.separator") +
						  "vipercontrol.properties";
			   File file =  new File(userdir);
			   if (file.exists())
				   viperProperties.load(new FileInputStream(userdir));
			   else
			   {
				   InputStream is = getClass().getResourceAsStream(
																   "resources/vipercontrol.properties");
				   viperProperties.load(is);
			   }
		   }
		   catch (Exception e)
		   {
			   System.out.println(e);
		   }
		   os   = getOS(); // get operating system
		   compFlag =   setOptionString(os); // set compiler for os
		   vptex = new vPTeX();
		   CURRENTDIR=new   File(System.getProperty("user.dir"));
		   tabbedPane   = new JTabbedPane();
		   tabbedPane2 = new JTabbedPane();
		   tabbedPane3 = new JTabbedPane();
		   speedbar=new ViperMethodFinder(this);
		   sp   = new JSplitPane(JSplitPane.VERTICAL_SPLIT, tabbedPane, (new JScrollPane
			   (speedbar.results)));
		   sp.setOneTouchExpandable(true);
		   
		   compileErrorPanel = new JList(compilerErrors =   new DefaultListModel());
		   compileErrorPanel.setVisibleRowCount(10);
		   compileErrorPanel.setFont(new Font(props.FONTSTYLE, 0,   props.FONTSIZE));
		   compiler =   new ViperCompiler(this);
		   vipcomp = new VPasCompiler(this,false);
		   
		   filesearchlistPanel= new JList();
		   filesearchModel= new DefaultListModel();
		   filesearchlistPanel.setVisibleRowCount(10);
		   filesearchlistPanel.setFont(new Font(props.FONTSTYLE, 0, props.FONTSIZE));
		   
		   sp3 = new JSplitPane(
								JSplitPane.VERTICAL_SPLIT,  tabbedPane2, tabbedPane3);
		   sp3.setOneTouchExpandable(true);
		   sp2 = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, sp, sp3);
		   /*        
		   KJR experiment to allow the menus to be created and altered dynamically
		   //        recentFiles=new JMenu ("Recent Files");              //prob
		   //        recentProjects=new JMenu ("Recent Projects");        //prob
		   //        openMenu=new JMenu ("New Document");                  //prob 
		   //        URL url = getResource("openMenu" + mImageSuffix+props.MENUICONSIZE); //prob
		   //        openMenu.setIcon(new ImageIcon(url)); //prob*/
		   createSpMenus();
		   
		   showLeftPanel();
		   showBottomPanel();
		   statusBar = new StatusBar();
		   showToolBars();
		   popup = createPopupMenu("popup");
		   popup2   = createPopupMenu("popup2");
		   children =   new Vector(4, 4);
		   tabbedPane.setFont(new   Font("dialog", Font.PLAIN, 11));
		   tabbedPane2.setFont(new Font("dialog",   Font.PLAIN, 11));
		   tabbedPane3.setFont(new Font("dialog",   Font.PLAIN, 11));
		   viperconsole=new ViperConsole(this);
		   tabbedPane3.addTab("Console", new JScrollPane(viperconsole.viperConsole));
		   tabbedPane3.addTab("Compile", new JScrollPane(compileErrorPanel));
		   //tabbedPane3.addTab("VPTeX",new JScrollPane(filesearchlistPanel));
		   tabbedPane3.setTabPlacement(JTabbedPane.BOTTOM);
		   
		   tabbedPane2.addChangeListener(
										 new ChangeListener() {
			   
			   public void  stateChanged(ChangeEvent e)
			   {
			   JTabbedPane tp = (JTabbedPane)e.getSource();
			   int index = tp.getSelectedIndex();
			   if (index >= 0)
			   {
			   String s = tp.getTitleAt(index);
			   GetWindow(new    File(s));
			   }
			   }
			   });
		   
		   tabbedPane2.addMouseListener(
										new MouseAdapter()  {
			   public void  mouseClicked(MouseEvent me) {
			   if ((me.getModifiers() & me.BUTTON3_MASK) != 0)popup2.show(tabbedPane2, me.getX(), me.getY());
			   }
			   });
		   
		   setBounds(props.XPOS,props.YPOS,props.XSIZE,props.YSIZE);
		   
		   sp.setDividerLocation(props.DIV1);
		   this.setIconImage(ViperIcon());
		   
		   setVisible(true);
		   
		   
		   this.setDefaultCloseOperation(WindowConstants.DO_NOTHING_ON_CLOSE);
		   
		   this.addWindowListener(
								  new WindowAdapter() {
			   
			   public void  windowClosing(WindowEvent e)
			   {
			   close();
			   }
			   });
	   }
	   
	   /**
		*   showStatusBar shows the status bar if option set to true in viper,properties file.
		*/
	   public void showStatusBar(){
		   if(props.SHOWSTATUSBAR==true)getContentPane().add(statusBar, BorderLayout.SOUTH);
		   else getContentPane().remove(statusBar);
		   setVisible(true);
	   }
	   
	   /**
		*   showToolBars shows the Tool Bar as options set in viper,properties file.
		*/
	   public void showToolBars()
	   {
		   if(panel!=null)getContentPane().remove(panel);
		   panel=new JPanel();
		   menubar = createMenubar();
		   if(props.SHOWTOOLBAR1==true &&   props.SHOWTOOLBAR2==true)panel.setLayout(new GridLayout(3, 1));
		   else if(props.SHOWTOOLBAR1==true || props.SHOWTOOLBAR2==true)panel.setLayout(new GridLayout(2,   1));
		   else panel.setLayout(new GridLayout(1,   1));
		   panel.add(menubar);
		   if(props.SHOWTOOLBAR1==true)panel.add(createToolbar(1));
		   if(props.SHOWTOOLBAR2==true)panel.add(createToolbar(2));
		   getContentPane().add(panel, BorderLayout.NORTH);
		   getContentPane().add(sp2, BorderLayout.CENTER);
		   showStatusBar();
		   setVisible(true);
	   }
	   
	   /**
		*   showLeftPanel shows the Left Panel(Method finder & Projects)
		*   if option set to true in viper,properties file.
		*/   
	   public void showLeftPanel(){
		   
		   if(props.SHOWLEFTPANEL==false){
			   sp2.setDividerSize(0);
			   sp2.setOneTouchExpandable(false);
			   
			   sp2.setDividerLocation(0);
			   sp2.remove(sp);
			   sp2.resetToPreferredSizes();
		   }
		   else {
			   sp2.setDividerSize(10);
			   sp2.setOneTouchExpandable(true);
			   sp2.setLeftComponent(sp);
			   sp2.setDividerLocation(props.DIV2);
			   sp2.resetToPreferredSizes();
		   }
	   }
	   
	   /**
		*   showBottomPanel shows the Bottom Panel(Compiler & Console)
		*   if option set to true in viper,properties file.
		*/    
	   public void showBottomPanel(){
		   if(props.SHOWBOTTOMPANEL==false){
			   sp3.setDividerSize(0);
			   sp3.setOneTouchExpandable(false);
			   
			   sp3.setDividerLocation(0);
			   sp3.remove(tabbedPane3);
			   sp3.resetToPreferredSizes();
		   }
		   else {
			   sp3.setDividerSize(10);
			   sp3.setOneTouchExpandable(true);
			   sp3.setBottomComponent(tabbedPane3);
			   sp3.setDividerLocation(props.DIV3);
			   sp3.resetToPreferredSizes();
		   }
	   }
	   
	   /**
		* sets  up the logo on the about panel 
		*/
	   
	   public Image ViperIcon(){
		   Image imageIcon=getToolkit().getImage(getClass().getResource("resources/vipericon.gif"));
		   return   imageIcon;
	   }
	   
	   /**
		* Converts  a string to a keystroke.
		* 
		* The string should be  of the form <i>modifiers</i>+<i>shortcut</i> where 
		* <i>modifiers</i>  is any combination of A for Alt, C for Control, S for 
		* Shift or  M for Meta, and <i>shortcut</i> is either a single character, 
		* or a  keycode name from the <code>KeyEvent</code> class, without the 
		* <code>VK_</code>  prefix.
		* 
		* @param keyStroke  A string description of the key stroke
		*/
	   public static    KeyStroke parseKeyStroke(String keyStroke)
	   {
		   if   (keyStroke == null)
			   return null;
		   int modifiers = 0;
		   int ch   = '\0';
		   int index = keyStroke.indexOf('+');
		   if   (index != -1)
		   {
			   for  (int i = 0; i < index; i++)
			   {
				   switch (Character.toUpperCase(keyStroke.charAt(i)))
				   {
				   case 'A':
					   modifiers |= InputEvent.ALT_MASK;
					   break;
				   case 'C':
					   modifiers |= InputEvent.CTRL_MASK;
					   break;
				   case 'M':
					   modifiers |= InputEvent.META_MASK;
					   break;
				   case 'S':
					   modifiers |= InputEvent.SHIFT_MASK;
					   break;
				   }
			   }
		   }
		   String   key = keyStroke.substring(index + 1);
		   if   (key.length() == 1)
			   ch = Character.toUpperCase(key.charAt(0));
		   else if (key.length() == 0)
		   {
			   System.err.println("Invalid  key stroke: " + keyStroke);
			   return null;
		   }
		   else
		   {
			   try
			   {
				   ch = KeyEvent.class.getField("VK_".concat(key)).getInt(null);
			   }
			   catch (Exception e)
			   {
				   System.err.println("Invalid key stroke: "    + keyStroke);
				   return null;
			   }
		   }
		   return   KeyStroke.getKeyStroke(ch, modifiers);
	   }
	   
	   /**
		* Create the pop out menus for the app
		* 
		* This is referenced by the constructer at start up and each time the 
		* app is redrawn(IDE Options changed at run time). If this is not called the 
		* pop out menus do not redraw with rest of the application.
		*/  
	   protected    void createSpMenus()
	   {
		   recentFiles=new JMenu ("Recent Files");            //prob
		   recentProjects=new   JMenu ("Recent Projects");        //prob
		   openMenu=new JMenu   ("New Document");                  //prob 
		   URL url = getResource("openMenu" +   mImageSuffix+props.MENUICONSIZE); //prob
		   openMenu.setIcon(new ImageIcon(url)); //prob       
	   }
	   
	   
	   /**
		* Create the menubar for the app.
		* 
		* By default this pulls the definition  of the menu from the associated 
		* resource  file.
		*/
	   protected    JMenuBar createMenubar()
	   {
		   JMenuBar mb = new JMenuBar();
		   String[] menuKeys = tokenize(viperProperties.getProperty("menulist"));
		   for (int i   = 0; i < menuKeys.length; i++)
		   {
			   JMenu m  = createMenu(menuKeys[i]);
			   if (m != null)
			   {
				   m.setFont(new Font("dialog", Font.PLAIN, 11));
				   mb.add(m);
			   }
		   }
		   return   mb;
	   }
	   
	   /**
		* Create a  menu for the app.
		* 
		* By default this pulls the definition  of the menu from the associated 
		* resource  file.
		*/
	   protected    JMenu createMenu(String key)
	   {
		   String[] itemKeys = tokenize(viperProperties.getProperty(key));
		   JMenu menu   = new JMenu(viperProperties.getProperty(key + "Label"));
		   if(viperProperties.getProperty(key   + "Label").equals("Window"))window=menu;
		   
		   menu.setMnemonic(viperProperties.getProperty(key +   "Label").charAt(0));
		   for (int i   = 0; i < itemKeys.length; i++)
		   {
			   if (itemKeys[i].equals("-"))
			   {
				   menu.addSeparator();
			   }
			   else
			   {
				   if(key.startsWith("view")){
					   boolean state=true;
					   if(itemKeys[i].equals("showleftpanelItem"))state=props.SHOWLEFTPANEL;
					   if(itemKeys[i].equals("showbottompanelItem"))state=props.SHOWBOTTOMPANEL;
					   if(itemKeys[i].equals("showToolBar1Item"))state=props.SHOWTOOLBAR1;
					   if(itemKeys[i].equals("showToolBar2Item"))state=props.SHOWTOOLBAR2;
					   if(itemKeys[i].equals("showStatusBarItem"))state=props.SHOWSTATUSBAR;
					   JMenuItem    mi = createCheckBoxMenuItem(itemKeys[i], state);
					   menu.add(mi);
				   }
				   else if(itemKeys[i].startsWith("recentFiles"))menu.add(createRecentFilesList());
				   else if(itemKeys[i].startsWith("recentProjects"))menu.add(createRecentProjectsList());
				   else if(itemKeys[i].startsWith("newVPas"))menu.add(createOpenMenu());        
				   else
				   {
					   JMenuItem    mi = createMenuItem(itemKeys[i]);
					   menu.add(mi);
				   }
			   }
		   }
		   return   menu;
	   }
	   
	   /**
		* This  is the hook through which all menu items are created.
		* 
		* It registers  the result with the menuitem hashtable so that it can be 
		* fetched with  getMenuItem().
		* 
		* @see  #getMenuItem
		*/
	   protected    JMenuItem createMenuItem(String cmd)
	   {
		   JMenuItem mi =   new JMenuItem(viperProperties.getProperty(cmd + labelSuffix));
		   KeyStroke keyStroke = parseKeyStroke(viperProperties.getProperty(cmd +   "Key"));
		   mi.setFont(new   Font("dialog", Font.PLAIN, 11));
		   mi.setAccelerator(keyStroke);
		   // Debug line    use when addind images for new mneus 
		   // tells where the wrongly spelt images are to chase the 
		   // null pointer errors they cause!!   
		   //System.out.println(cmd+mImageSuffix+props.MENUICONSIZE);
		   URL url = getResource(cmd + mImageSuffix+props.MENUICONSIZE);
		   if   (url == null)url = getResource("blankItem"+mImageSuffix+props.MENUICONSIZE);
		   mi.setHorizontalTextPosition(JButton.RIGHT);
		   mi.setIcon(new   ImageIcon(url));
		   mi.addActionListener(this);
		   mi.setActionCommand(cmd);
		   return   mi;
	   }
	   
	   /**
		* This  is the hook through which all CheckBox menu items are created.
		* 
		* It registers  the result with the menuitem hashtable so that it can be 
		* fetched with  getMenuItem().
		* 
		* @see  #getMenuItem
		*/
	   protected    JMenuItem createCheckBoxMenuItem(String cmd, boolean state)
	   {
		   
		   view =   new JCheckBoxMenuItem(viperProperties.getProperty(cmd + labelSuffix), state);
		   KeyStroke keyStroke = parseKeyStroke(viperProperties.getProperty(cmd +   "Key"));
		   view.setFont(new Font("dialog", Font.PLAIN, 11));
		   view.setAccelerator(keyStroke);
		   URL url = getResource(cmd + mImageSuffix+props.MENUICONSIZE);
		   if   (url == null)url = getResource("blankItem"+mImageSuffix+props.MENUICONSIZE);
		   view.setHorizontalTextPosition(JButton.RIGHT);
		   view.setIcon(new ImageIcon(url));
		   view.addActionListener(this);
		   view.setActionCommand(cmd);
		   return   view;
	   }
	   
	   /**
		*   createOpenMenu
		*   @return JMenu of Open File Type
		*   Current file types 
		*   , Latex, Vector Pascal
		*/
	   protected    JMenu createOpenMenu(){
		   openMenu.removeAll();
		   String   menuOpts ="Pascal LaTeX HTML";
		   oMenu =toToken(menuOpts);
		   openMenu.setFont(new Font("dialog", Font.PLAIN, 11));
		   for(int j=0;j<oMenu.length;j++)
		   {
			   oMenuitem= createMenuItem(oMenu[j]);
			   openMenu.add(oMenuitem);
		   }
		   return   openMenu;
	   }
	   
	   /**
		*   createRecentFilesList
		*   @return JMenu of Recent Files
		*   creates recent files menu 
		*/
	   protected    JMenu createRecentFilesList(){
		   recentFiles.removeAll();
		   rfiles=tokenize(props.RFILES);
		   recentFiles.setFont(new Font("dialog",   Font.PLAIN, 11));
		   for(int j=0;j<rfiles.length;j++){
			   rfileitem=new JMenuItem(rfiles[j]);
			   rfileitem.setFont(new Font("dialog", Font.PLAIN, 11));
			   recentFiles.add(rfileitem);
			   rfileitem.addActionListener(this);
			   rfileitem.setActionCommand("recent_files_"+rfiles[j]);
		   }
		   return   recentFiles;
	   }
	   
	   /**
		*   createRecentProjectsList
		*   @return JMenu of Recent Projects
		*   creates recent files menu 
		*/
	   protected    JMenu createRecentProjectsList()
	   {
		   recentProjects.removeAll();
		   rprojects=tokenize(props.RPROJECTS);
		   recentProjects.setFont(new   Font("dialog", Font.PLAIN, 11));                
		   for(int j=0;j<rprojects.length;j++)
		   {
			   rprojectitem=new JMenuItem(rprojects[j]);
			   rprojectitem.setFont(new Font("dialog",  Font.PLAIN, 11));
			   recentProjects.add(rprojectitem);
			   rprojectitem.addActionListener(this);
			   rprojectitem.setActionCommand("recent_projects_"+rprojects[j]);
		   }
		   return   recentProjects;
	   }
	   
	   /**
		*   getResource 
		*   @param String key name of image to get
		*   @return URL image 
		*   Used to get the images for the menu 
		*   and toolbar images
		*/
	   protected    URL getResource(String key)
	   {
		   String   name = viperProperties.getProperty(key);
		   if   (name != null)
		   {
			   URL  url = this.getClass().getResource(name);
			   return url;
		   }
		   return   null;
	   }
	   
	   /**
		*   @returns toolbar instance
		*/
	   protected    Container getToolbar()
	   {
		   return   toolbar;
		   
	   }
	   
	   /**
		*   returns menu bar instance
		*/
	   protected    JMenuBar getMenubar()
	   {
		   return   menubar;
	   }
	   
	   /**
		* Create the toolbar.
		* 
		* By default this reads the resource file for the definition of the 
		* toolbar.
		*/
	   private Component    createToolbar(int toolrow)
	   {
		   toolbar = new JToolBar();
		   // toolbar.setFloatable(true);
		   toolbar.setFloatable(false);
		   toolbar.putClientProperty("JToolBar.isRollover",Boolean.TRUE);
		   String[] toolKeys = tokenize(viperProperties.getProperty("toolbar"   + toolrow));
		   for (int i   = 0; i < toolKeys.length; i++)
		   {
			   if (toolKeys[i].equals("-"))toolbar.add(Box.createHorizontalStrut(5));
			   else toolbar.add(createTool(toolKeys[i]));
		   }
		   return   toolbar;
	   }
	   
	   /**
		* Hook  through which every toolbar item is created.
		*/
	   protected    Component createTool(String key)
	   {
		   return   createToolbarButton(key);
	   }
	   
	   /**
		* Create a  button to go inside of the toolbar.
		* 
		* By default this will  load an image resource.  The image filename is 
		* relative  to the classpath (including the '.' directory if its a part of 
		* the classpath)
		* 
		* @param key The key in the resource file to serve  as the basis of 
		*             lookups.
		*/
	   protected    JButton createToolbarButton(String key)
	   {
		   URL url = getResource(key + tImageSuffix+props.TOOLBARICONSIZE);
		   // Debug line    use when addind images for new mneus 
		   // tells where the wrongly spelt images are to chase the 
		   // null pointer errors they cause!!           
		   // System.out.println(key    + tImageSuffix+props.TOOLBARICONSIZE);
		   JButton b = 
					  new   JButton(new ImageIcon(url)) {
			   
			   public float getAlignmentY()
			   {
			   return 0.5f;
			   }
			   };
		   b.setRequestFocusEnabled(false);
		   b.setMargin(new Insets(1, 1, 1, 1));
		   b.setActionCommand(key);
		   b.addActionListener(this);
		   String   tip = viperProperties.getProperty(key + tipSuffix);
		   if   (tip != null)
		   {
			   b.setToolTipText(tip);
		   }
		   return   b;
	   }
	   
	   /**
		* Take  the given string and chop it up into a series of strings on 
		* "," boundaries
		* 
		* This  is useful for trying to get an array of strings out of the 
		* resource  file.
		*/
	   protected    String[] tokenize(String input)
	   {
		   Vector   v = new Vector();
		   StringTokenizer t = new StringTokenizer(input,",");
		   String[] cmd;
		   while (t.hasMoreTokens())
			   v.addElement(t.nextToken());
		   cmd = new String[v.size()];
		   for (int i   = 0; i < cmd.length; i++)
			   cmd[i] = (String)v.elementAt(i);
		   return   cmd;
	   }
	   
	   /**
		* Take  the given string and chop it up into a series of strings on 
		* whitespace boundries.
		* 
		* This  is useful for trying to get an array of strings eg compiler options etc 
		*/
	   protected    String[] toToken(String input)
	   {
		   Vector   v = new Vector();
		   StringTokenizer t = new StringTokenizer(input);
		   String[] cmd;
		   while (t.hasMoreTokens())
			   v.addElement(t.nextToken());
		   cmd = new String[v.size()];
		   for (int i   = 0; i < cmd.length; i++)
			   cmd[i] = (String)v.elementAt(i);
		   return   cmd;
	   }    
	   
	   /**
		* Create the popupMenu.
		* 
		* By default this reads the resource file for the definition of the 
		* toolbar.
		*/
	   private JPopupMenu createPopupMenu(String    popupType)
	   {
		   JPopupMenu   popUp = new JPopupMenu();
		   String[] toolKeys = tokenize(viperProperties.getProperty(popupType));
		   for (int i   = 0; i < toolKeys.length; i++)
		   {
			   if (toolKeys[i].equals("-"))
			   {
				   popUp.addSeparator();
			   }
			   else
			   {
				   popUp.add(createMenuItem(toolKeys[i]));
			   }
		   }
		   return   popUp;
	   }
	   
	   /**
		* Respond to users  requests
		*/
	   public void actionPerformed(ActionEvent e)
	   {
		   String   source = e.getActionCommand();
		   //System.out.println(source);
		   if(source.startsWith("recent_files_")){        
			   File file=new File(source.substring(13,source.length()));
			   loadChild(file.getName(), file);
		   }
		   
		   else if(source.startsWith("window_"))GetWindow(new   File(source.substring(7,source.length())));

		   else if(source.startsWith("recent_projects_"))
		   {
			   if(project!=null)CloseProject();
			   //props.SHOWTOOLBAR2=true;
			   //showToolBars();
			   props.DIV1=150;
			   sp.setDividerLocation(props.DIV1);
			   project=new  ViperProjectManager(this);
			   project.OpenNewProject(new File(source.substring(16,source.length())));
			   //props.SHOWTOOLBAR2=true;
			   //showToolBars();
			   props.DIV1=150;
			   sp.setDividerLocation(props.DIV1);
		   }
		   
		   else if(project==null && source.equals("importprojectItem")) 
		   {
			   project=new ViperProjectManager(this);
			   project.importProject();
			   project.dispose();
			   project= null;
		   }

		   //   open file menu option
		   else if (source.equals("opendocument")) {
			   loadChild("Load", null);
		   /*if (props.SMART) {
			   String cpuStr = props.SELECTEDCPU;
			   if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
				   
			    String walkerFile= getName((activeChild.file.getPath()))+ cpuStr+".vwu";
				String walkerPath=getDirPath(activeChild.file.getPath());
				walker = SmartComp.getWalker(walkerPath,walkerFile);
			}*/
		   }
		   // QUIT
		   else if   (source.equals("quitItem"))
			   close();
		   
		   else if (source.equals("new_HTML")||source.equals("HTML"))   
			   addChild(this, "Html ",  null); 
		   
		   //   new vector pascal menu option
		   else if (source.equals("new_Pascal")||source.equals("Pascal"))
			   addChild(this, "Vector Pascal ", null);
		   
		   else if (source.equals("new_LaTeX")||source.equals("LaTeX"))
			   addChild(this, "TeX ", null);
		   
		   else if (project!=null   && source.equals("addprojectItem"))
			   project.addToProject();
		   
		   else if (project!=null   && source.equals("removeprojectItem"))
			   project.removeFromProject();
		   
		   else if (project == null && source.equals("importprojectItem"))
		   {
			   project= new ViperProjectManager(this);
			   project.importProject();
			   project.dispose();
			   project= null;
		   }
		   
		   else if (project!=null   && source.equals("projectproperties"))
			   project.ProjectProperties();
		   
		   else if(source.equals("clearrecentfilelistItem")){
			   recentFiles.removeAll();
			   props.RFILES="";
		   }
		   
		   else if(source.equals("clearrecentprojectlistItem")){
			   recentProjects.removeAll();
			   props.RPROJECTS="";
		   }
		   
		   else if (source.equals("toggleItem"))
		   {
			   if (props.TOGGLE==8) props.TOGGLE=1;
			   else props.TOGGLE++;
			   switch(props.TOGGLE)
			   {
			   case 1:
				   if(props.SHOWLEFTPANEL==true)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==true)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==true)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }             
				   break;
			   case 2:
				   if(props.SHOWLEFTPANEL==false)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==true)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==true)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }
				   break;
			   case 3:
				   if(props.SHOWLEFTPANEL==false)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==false)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==true)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }                   
				   break;
			   case 4:
				   if(props.SHOWLEFTPANEL==false)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==false)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==false)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }
				   break;
			   case 5:
				   if(props.SHOWLEFTPANEL==false)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==true)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==false)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }                   
				   break;
			   case 6:
				   if(props.SHOWLEFTPANEL==true)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==true)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==false)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }                   
				   break;
			   case 7:
				   if(props.SHOWLEFTPANEL==true)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==false)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==false)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }                   
				   break;
			   case 8:
				   if(props.SHOWLEFTPANEL==true)
				   {    
					   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
					   showLeftPanel();
				   }
				   if(props.SHOWSTATUSBAR==false)
				   {
					   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
					   showStatusBar();
				   }
				   if(props.SHOWBOTTOMPANEL==true)
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }                   
				   break;
			   default:
				   System.out.println("Toggle switch    overflow");
			   }
		   }
		   
		   else if (source.equals("aboutItem"))
		   {
			   JOptionPane  aboutPane = new JOptionPane();
			   aboutPane.setFont(new Font("dialog", Font.PLAIN, 11));
			   aboutPane.showMessageDialog(this, ABOUTMSG,  "About Viper", JOptionPane.INFORMATION_MESSAGE, new ImageIcon
				   (getClass().getResource("resources/viper.gif")));
		   }
		   
		   else if (source.equals("sysDetItem"))
		   {
			   JOptionPane  sysDetPane = new JOptionPane();
			   sysDetPane.setFont(new Font("dialog", Font.PLAIN, 11));
			   sysDetPane.showMessageDialog(this, SYSDET, "System Details", JOptionPane.INFORMATION_MESSAGE);
		   }
		   
		   else if (source.equals("helpItem")||source.equals("helpsItem"))
		   {
			   if (helpConsole  == null)
				   helpConsole = new HelpConsole(this);
		   }
		   
		   //   close all menu option
		   else if (source.equals("closeallItem"))
			   CloseAll();
		   
		   //   close project menu option
		   else if (project!=null   && source.equals("closeprojectItem"))CloseProject();
		   
		   //   open project menu option
		   else if (source.equals("openproject")){
			   if(project!=null)CloseProject();
			   props.DIV1=150;
			   sp.setDividerLocation(props.DIV1);
			   project=new  ViperProjectManager(this);
			   props.DIV1=150;
			   sp.setDividerLocation(props.DIV1);
			   project.OpenNewProject();
		   }
		   
		   //   new project menu option
		   else if (source.equals("newprojectItem")){
			   if(project!=null)CloseProject();
			   project=new  ViperProjectManager(this);
			   props.DIV1=150;
			   sp.setDividerLocation(props.DIV1);           
			   project.NewProject();
		   }
		   
		   //   save project menu option
		   else if (project!=null   && source.equals("saveprojectItem"))
			   project.SaveProject();
		   
		   //   viper options menu option
		   else if (source.equals("viperOptionsItem")){
			   try{
				   optiondialog = new IDEOptions(this);
				   showToolBars();
				   createSpMenus();
				   createMenubar();
			   }
			   catch(Exception ex){       
			   }
		   }
		   
		   else if (source.equals("optionsJavaItem")){
			   try{
				   optionJavadialog = new JavaOptions(this);
			   } 
			   catch(Exception ex){
			   }
		   }
		   
		   //   VP-TeX Options panel
		   else if (source.equals("vptexOptionsItem")){
			   try{
				   optionVPTexdialog = new VPTexOptions(this);
			   } 
			   catch(Exception ex){
			   }
		   }
		   
		   else if (source.equals("projvptex")||source.equals("buildvptexItem")) {
			   if((project!=null)||(activeChild!=null)) buildVPTex();
		   }

		   //   find in files menu option
		   else if (source.equals("findinfilesItem"))FindInFiles();
		   
		   else if(source.equals("showleftpanelItem")){
			   props.SHOWLEFTPANEL=invertBoolean(props.SHOWLEFTPANEL);
			   showLeftPanel();
		   }
		   else if(source.equals("showStatusBarItem")){
			   props.SHOWSTATUSBAR=invertBoolean(props.SHOWSTATUSBAR);
			   showStatusBar();
		   }
		   
		   else if(source.equals("showbottompanelItem")){
			   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
			   showBottomPanel();
		   }
		   
		   else if(source.equals("showToolBar1Item")){
			   props.SHOWTOOLBAR1=invertBoolean(props.SHOWTOOLBAR1);
			   showToolBars();
		   }
		   
		   else if(source.equals("showToolBar2Item")){
			   Vector backup =  new Vector(); 
			   backup=children; 
			   props.SHOWTOOLBAR2=invertBoolean(props.SHOWTOOLBAR2);
			   showToolBars();
			   children= backup;
		   }
			   else if (source.equals("compileallItem") && (project != null))
				   // CompileAll();
			   { 
				   //System.out.println("Main File = " + project.projectMainFile());
				   //File mainfile =  new File(project.projectMainFile());    
				   //loadChild(project.PROJECTMAIN,mainfile); 
				  // String[] files =  project.getAllProjectFiles();
				   //String fileString  = new String();
				  /* for  (int strNo = 0; strNo<files.length; strNo++)
					   if (files[strNo].toLowerCase().endsWith(".pas"))
					   {    
						   //fileString= fileString +"\n"+files[strNo];
						   System.out.println("Touching file" + files[strNo]);
					   }*/
				  
				   System.out.println("Compile - All Project");
				   
				   project.compileProject(); 
			   }


			   else if (source.equals("buildItem") && (project !=null)) 
			   {

				System.out.println("Building Project");
				project.buildProject();


			   }
		
		   		   // run Viewer
			   else if  (source.equals("viewItem")&&((activeChild != null)||(project != null)))
			   {
				   String viewer= props.DVIVIEWER;
				   if(!(viewer.startsWith("NULL")))
				   {
					   String vpFile = "";
					   String vpPath = "";
					   
					   if(project==null)
					   {
							vpFile= getName(activeChild.file.getPath())+".dvi";
							vpPath= getDirPath(activeChild.file.getPath());
					   }
					   else 
					   {
						   vpPath = project.PROJECTPATH + System.getProperty("file.separator") + project.PROJECTNAME + System.getProperty("file.separator");
						   vpFile = project.PROJECTNAME + ".dvi";
					   }
					   System.out.println(viewer+" "+vpPath+vpFile);
					   RunCommandLine(viewer+" "+vpPath+vpFile,false);
				   }
				   else
				   {
					   JOptionPane noViewerPane = new JOptionPane();
					   noViewerPane.setFont(new Font("dialog", Font.PLAIN, 11));
					   noViewerPane.showMessageDialog(this,"No Postscript Viewer set in compiler options", "LaTeX", JOptionPane.ERROR_MESSAGE); 
				   }            
			   }
		   
		   /* If file is open the following can be done*/
		   if   (activeChild != null){
			   
			   
			   if (source.equals("findItem"))
			   {
				   displayFindDialog();
				   System.out.println(activeChild.getTitle());
			   }
			   
			   //   close Item menu option
			   else if (source.equals("closeItem")){
				   if (props.SMART && walker != null) {
							String cpuStr = props.SELECTEDCPU;
							if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
							String walkerFile=
							getName((activeChild.file.getPath()))+ cpuStr+".vwu";
							String walkerPath=getDirPath(activeChild.file.getPath());
							SmartComp.putWalker(walker,walkerPath,walkerFile);
							walker= null;
				   }
				   if(tabbedPane2.getTitleAt(tabbedPane2.getSelectedIndex()).equals("-  Help -")){
					   helpConsole.close();
					   helpConsole=null;
				   
				   }				   
				   else if  (activeChild!=null)activeChild.close();   
			   }
			   
			   else if  (source.equals("findNextItem"))
				   FindNext();
			   
			   else if  (source.equals("parseItem")) 
			   {
				   if(activeChild.file.getPath().toLowerCase().endsWith(".pas"))
					   speedbar.parse();
				   else if(activeChild.file.getPath().toLowerCase().endsWith(".tex"))
					   speedbar.parseTex();
			   }
			   
			   // Goto  line
			   else if  (source.equals("gotoItem"))
				   activeChild.Goto();
			   
			   // Save
			   else if  (source.equals("saveItem"))
				   activeChild.SaveFile(false);
			   
			   // Save  as
			   else if  (source.equals("saveasItem"))
				   activeChild.SaveFile(true);
			   
			   // Print
			   else if  (source.equals("printItem"))
				   Print();
			   
			   // Run application
			   else if  (source.equals("applicationItem"))
			   {    
				   boolean  canRun = true;
				   /* if file open  save and compile? */
				   if(activeChild.isDirty())
				   {    
					   JOptionPane  runPane = new JOptionPane();
					   runPane.setFont(new  Font("dialog", Font.PLAIN, 11));
					   int  reply = runPane.showConfirmDialog(this,
															  "The File has been changed since the last time you saved.\n"+
															  "Do you wish to save and recompile?", "Run Application",
																									JOptionPane.YES_NO_CANCEL_OPTION);   
					   if (reply == JOptionPane.CANCEL_OPTION)
					   {
						   canRun = false;
						   //System.out.println("Cancel");
					   }
					   if(reply ==  JOptionPane.YES_OPTION)
					   {    
						   /* Save  file */
						   canRun=(activeChild.SaveReply());
						   /* Recompile */
						   if (activeChild.file.getPath().endsWith(".pas"))
						   {    
							   String compFile=getName((activeChild.file.getPath()));
							   String compPath=getDirPath(activeChild.file.getPath());
							   String thisDir=System.getProperty("user.dir");
							   compFile = compPath  + compFile; //full path to .pas file no suffix 
							   String compDir = " -o" + compFile +".exe" //full path for exe
												+ " -A" + compFile +".asm"; //full path for asm
							   if((System.getProperty("file.separator")).equals("\\"))
							   {
								   StringParser ps  = new StringParser();
								   if (RunCompiler(ps.ModifyPath(compFile)+ compDir)>-1)
									   canRun = false;
							   }
							   else if  (RunCompiler(compFile + compDir)>-1)
								   canRun=false;
							   //move any p.o to source dir & rename
							   moveTo(compPath,thisDir,getName((activeChild.file.getPath())));
						   }
					   }
					   
				   }
				   if(canRun)
				   {
					   tabbedPane3.setSelectedIndex(0);
					   /* If its a  html file run in browser */
					   if (activeChild.file.getPath().endsWith(".html")
						   ||activeChild.file.getPath().endsWith(".htm"))
					   {
						   try
						   {
							   browserlauncher.openURL(activeChild.file.getPath());
						   }
						   catch(Exception  urlEr)
						   {}
					   }
					   /* Run the exe file  */
					   else 
					   {
						   // if console panel  hiden show it
						   RunOptions runFiles  = new RunOptions(this);
						   if (runFiles.showPanel())
						   {
							   if (props.SHOWBOTTOMPANEL==false)
							   {
								   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
								   showBottomPanel();
							   }
							   String runCom =  getDirPath(activeChild.file.getPath())
												+getName(activeChild.file.getPath())+".exe";
							   viperconsole.doProc(runCom,runFiles.getInFile(),
												   runFiles.getOutFile());        
						   }
					   }
				   }
			   }
			   			   
			   
			   // Compile File
			   else if  (source.equals("compilerItem"))
				   compileFile();

			   
			   
			   /* Convert to HTML */
			   else if  (source.equals("htmlItem"))
			   {
				   String home=System.getProperty("user.dir")+System.getProperty("file.separator")+"VPTemp"+System.getProperty("file.separator");
				   String vpPath= getDirPath(activeChild.file.getPath());               
				   String vpFile= getName((activeChild.file.getPath())); 
				   String converter = props.TEXTOHTML;
				   if (!(converter.startsWith("NULL")))
					   RunCommandLine(converter+" "+vpFile+".tex",false); 
				   else{
					   JOptionPane noConvPane = new JOptionPane();
					   noConvPane.setFont(new Font("dialog",    Font.PLAIN, 11));
					   noConvPane.showMessageDialog(this,"No TeX to HTML Converter set in compiler options", "TeX to HTML", JOptionPane.ERROR_MESSAGE); 
				   }
			   }
			   /* run LaTeX compiler */
			   else if  (source.equals("latexItem"))
			   {
				   latexBuild();
			   }
			   /* run DVIPS */
			   else if  (source.equals("dvipsItem"))
			   {
				   
				   String dvips= props.DVIPS;   
				   if(!(dvips.startsWith("NULL")))
				   {
					   String home=System.getProperty("user.dir")+System.getProperty("file.separator");
					   String vpPath= getDirPath(activeChild.file.getPath());               
					   String vpFile= getName((activeChild.file.getPath()));    
					   RunCommandLine(dvips+" "+vpFile+"dvi",false);
					   JOptionPane dvipsPane = new JOptionPane();
					   dvipsPane.setFont(new Font("dialog", Font.PLAIN, 11));
					   dvipsPane.showMessageDialog(this,"DVI to Ps converter running\nDo not run anything until output\n has finished in console", "LaTeX", JOptionPane.WARNING_MESSAGE);   
					   ViperFileHandler.moveFile(home,vpFile+".ps",vpPath,vpFile+".ps");
					   // ViperFileHandler.moveTo(vpPath,home,vpFile+".ps");
				   }
				   else
				   {
					   JOptionPane noDvipsPane =    new JOptionPane();
					   noDvipsPane.setFont(new Font("dialog", Font.PLAIN, 11));
					   noDvipsPane.showMessageDialog(this,"No DVI to PS converter set in compiler options", "LaTeX", JOptionPane.ERROR_MESSAGE);    
				   }

			   }
	
			   else if  (source.equals("undoItem"))
				   activeChild.undoAction();
			   else if  (source.equals("redoItem"))
				   activeChild.redoAction();
			   else if  (source.equals("cutItem"))
				   activeChild.textarea.cut();
			   else if  (source.equals("copyItem"))
				   activeChild.textarea.copy();
			   else if  (source.equals("pasteItem"))
				   activeChild.textarea.paste();
			   else if  (source.equals("selectItem"))
				   activeChild.textarea.selectAll();
			   else if  (source.equals("deletelineItem")){
				   DeleteLine deleteLine;
				   deleteLine=new DeleteLine(activeChild.textarea);
			   }
			   else if  (source.equals("lowercaseItem")){
				   ToLowerCase toLowerCase;
				   toLowerCase=new ToLowerCase(activeChild.textarea);
			   }
			   else if  (source.equals("uppercaseItem")){
				   ToUpperCase toUpperCase;
				   toUpperCase=new ToUpperCase(activeChild.textarea);
			   }
			   else if( source.equals("removespacesItem")){
				   RemoveSpaces removespaces;
				   removespaces=new RemoveSpaces(activeChild.textarea);
			   }
			   else if( source.equals("indentleftItem")){
				   LeftIndent leftIndent;
				   leftIndent=new LeftIndent(activeChild.textarea);
			   }
			   else if( source.equals("indentrightItem")){
				   RightIndent rightIndent;
				   rightIndent=new RightIndent(activeChild.textarea);
			   }
			   else if  (source.equals("indentItem"))
			   {
				   activeChild.indent();
				   if (activeChild.getTitle().toLowerCase().endsWith(".pas"))
					   speedbar.parse();
				   else if (activeChild.getTitle().toLowerCase().endsWith(".tex"))
					   activeChild.textarea.setDirty();
				   tabbedPane2.setForegroundAt(tabbedPane2.getSelectedIndex(), Color.red.darker());
			   }
			   else if  (source.equals("insertDateItem"))
			   {
				   Date date = new Date();
				   SimpleDateFormat sdf = new SimpleDateFormat(
															   "dd/MMM/yyyy -   HH:mm:ss");
				   activeChild.textarea.setSelectedText(sdf.format(date));
				   activeChild.textarea.setDirty();
				   tabbedPane2.setForegroundAt(tabbedPane2.getSelectedIndex(), Color.red.darker());
			   }
			   else if  (source.equals("gplLicenceItem"))
			   {
				   activeChild.textarea.setSelectedText(gplLicence);
				   activeChild.textarea.setDirty();
				   tabbedPane2.setForegroundAt(tabbedPane2.getSelectedIndex(), Color.red.darker());
			   }
		   }
	   }
	   
	   /**
		*   @return boolean opposite of @param boolean var
		*/
	   public boolean invertBoolean(boolean var){
		   if(var==true)
			   return false;
		   else 
			   return true;
	   }
	   
	   /**
		*   Displays the find dialog
		*/
	   public void displayFindDialog()
	   {
		   if   (find == null)
		   {
			   String Lnf=  props.LOOKANDFEEL;
			   System.out.println(Lnf);
			   find = new Find(this, activeChild.textarea,Lnf);
		   }
		   if   (find != null)
			   Find.editor  = activeChild.textarea;
		   find.setVisible(true);
	   }
	   
	   /**
		*   Continue to find!
		*/
	   public void FindNext(){
		   if(find==null){
			   displayFindDialog();
		   }
		   else find.find();
	   }
	   
	   
	   public void FindInFiles()
	   {
		   if   (findin == null)
		   {
			   findin = new FindInFiles(this);
		   }
		   if   (findin != null)
			   findin.setVisible(true);
		   findin.requestFocus();
	   }
	   
	   
	   /**
		*   close single open file prompt to 
		*   save if nec
		*/
	   public void close()
	   {
		 if (project == null && props.SMART && walker != null) {
				String cpuStr = props.SELECTEDCPU;
				if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
					String walkerFile=
					getName((activeChild.file.getPath()))+ cpuStr+".vwu";
					String walkerPath=getDirPath(activeChild.file.getPath());
					SmartComp.putWalker(walker,walkerPath,walkerFile);
					walker= null;
				 }   
		   CloseAll();
		   props.SaveOptions();
		   if(children.isEmpty())System.exit(0);
	   }
	   
	   /**
		*   
		*/
	   public boolean GetWindow(File    windowname)
	   {
		   for (int i = 0; i < window.getItemCount();   i++)
		   {
			   if (window.getItem(i) == null || children.isEmpty())
			   {
				   continue;
			   }
			   if (windowname.getName().equals(window.getItem(i).getText()))
			   {
				   if(windowname.getName().equals("- Help -")){
					   tabbedPane2.setSelectedIndex(tabbedPane2.indexOfTab("- Help -"));
					   statusBar.msgline.setText("Help Window");
					   activeChild=null;
				   }
				   else{
					   Editor child = (Editor)children.elementAt(i -    4);
					   if (child    != null)
					   {
						   activeChild = child;
						   tabbedPane2.setSelectedIndex(tabbedPane2.indexOfTab(
																			   activeChild.getTitle()));
						   //ViperFileHandler.removeFile(System.getProperty("user.dir")+System.getProperty("file.separator")+"VPTemp"+System.getProperty("file.separator"),getName(activechild.getpath())+".html"); kjr add in when remove is ready
						   
						   
						   statusBar.msgline.setText("Current   Window : " +
													 activeChild.getTitle());
						   if (activeChild.getTitle().toLowerCase().endsWith(".pas"))
							   speedbar.parse();
						   else if (activeChild.getTitle().toLowerCase().endsWith(".tex"))
							   speedbar.parseTex();						   
						   else
							   speedbar.removeList();
					   }
					   statusBar.updateStatus(activeChild.textarea);
					   return true;
				   }
			   }
		   }
		   return   false;
	   }
	   
	   /**
		* This  method is used to update the details for an existing child
		* @param Viper  parent instance of Viper to which child belongs
		* @param Editor child intance of {@link Editor  Editor.class} details to be up dated 
		*/
	   public void addChild(Viper parent, Editor    child)
	   {
		   children.addElement((Object)child);
		   statusBar.msgline.setText("Current Window : " + child.getTitle());
		   window.add(windowitem = new JMenuItem(child.getTitle()));
		   windowitem.setFont(new Font("dialog", Font.PLAIN, 11));
		   windowitem.addActionListener(parent);
		   windowitem.setActionCommand("window_"+child.getTitle());
		   activeChild = child;
		   if (child.getTitle().toLowerCase().endsWith(".pas"))
			   speedbar.parse();
		   else if (child.getTitle().toLowerCase().endsWith(".tex"))
			   speedbar.parseTex();	
	   }
	   
	   /**
		* This  method is used to add the details for a new child
		* @param String title Stat
		* @param File importfile File   to be added
		*/   
	   public void loadChild(String title, File importfile)
	   {
		   File file = importfile;
		   if (title == "Load" ||   file != null)
		   {
			   if (title == "Load")file = getAddChildFileName("Open File");
			   if (file !=  null)
			   {
				   if(fileChooser!=null)CURRENTDIR=fileChooser.getCurrentDirectory();
				   if (GetWindow(file) == false)
					   addChild(this, file.getName(), file);
			   }
		   }
		   	if (project == null && props.SMART) {
			   String cpuStr = props.SELECTEDCPU;
			   if (cpuStr.endsWith(" ")) cpuStr = cpuStr.substring(0,cpuStr.length()-1);
				   
			    String walkerFile= getName((activeChild.file.getPath()))+ cpuStr+".vwu";
				String walkerPath=getDirPath(activeChild.file.getPath());
				walker = SmartComp.getWalker(walkerPath,walkerFile);
			}
	   }
	   
	   /**
		*   Handles open file dialogue 
		*   @param String title name 
		*   @return File to be added
		*/
	   protected File getAddChildFileName(String    title)
	   {
		   fileChooser = new JFileChooser();
		   fileChooser.setCurrentDirectory(CURRENTDIR);
		   fileChooser.setMultiSelectionEnabled(false);
		   fileChooser.setDialogTitle(title);
		   fileChooser.addChoosableFileFilter(new HtmlFilter());
		   fileChooser.addChoosableFileFilter(new TeXFilter());
		   fileChooser.addChoosableFileFilter(new ProjectFilter());
		   fileChooser.setFileFilter(new VPasFilter());
		   int selected = fileChooser.showOpenDialog(container);
		   if   (selected == JFileChooser.APPROVE_OPTION)
			   return fileChooser.getSelectedFile();
		   else if (selected == JFileChooser.CANCEL_OPTION)
			   return null;
		   return   null;
	   }
	   
	   /**
		*   adds file to an instance of viper
		*   @param Viper parent instance of viper to be added to
		*   @param String title type of file
		*   @param File importfile Name of file
		*/
	   public void addChild(Viper parent, String title, File    importfile)
	   {
		   Editor   child;
		   if   (title == "Untitled" || title == "Html " || title == "Vector Pascal " || title == "TeX ")
		   {
			   child =  new Editor(parent, title, null);
			   
			   if (title.equals("Html ")) 
				   child.textarea.setText(
										  "\n<HTML>\n<HEAD>\n<TITLE> Your Title here</TITLE>\n</HEAD>\n"+
										  "<BODY>\n\n\n</BODY>\n</HTML>");
			   title =  title + window_num;
			   child.setTitle(title);
			   window_num++;
		   }
		   
		   else if(title.endsWith(".project"))
		   {
			   child =  new Editor(parent, title, null);
			   child.setTitle(title);
			   child.textarea.setText("Project  Details:\nAuthor:\nDate:\nProject Description\n\nNotes:");
			   child.textarea.setDirty();
		   }
		   
		   else
		   {
			   child =  new Editor(parent, title, importfile);
			   child.file = importfile;
			   child.load(title);
			   if(props.RFILES.indexOf(importfile.getAbsolutePath())<0){
				   props.RFILES=importfile.getAbsolutePath()+","+props.RFILES;
				   createRecentFilesList();
			   }
		   }
		   child.setLocation(200,   0);
		   child.setSize(440,   screenHeight - 200);
		   tabbedPane2.add(child.textarea, child.getTitle());
		   tabbedPane2.setSelectedIndex(tabbedPane2.getTabCount()   - 1);
		   children.addElement((Object)child);
		   statusBar.msgline.setText("Current   Window : " + child.getTitle());
		   window.add(windowitem = new JMenuItem(child.getTitle()));
		   windowitem.setFont(new Font("dialog", Font.PLAIN, 11));
		   windowitem.addActionListener(parent);
		   windowitem.setActionCommand("window_"+child.getTitle());               
		   activeChild = child;
		   activeChild.textarea.setCaretPosition(0);
		   statusBar.updateStatus(activeChild.textarea);
		   if (child.getTitle().toLowerCase().endsWith(".pas"))
			   speedbar.parse();
		   else if (child.getTitle().toLowerCase().endsWith(".tex"))
			   speedbar.parseTex();
	   }
	   
	   /**
		*   Calls print manager to print file
		*/
	   public void Print()
	   {
		   String   vers = System.getProperty("java.version");
		   
		   if   (vers.compareTo("1.2") < 0)
		   {
			   PrintManager print = new PrintManager(this,  activeChild.textarea.getText());
		   }
		   else
		   {
			   Print print;
			   print =  new Print((PlainDocument)activeChild.textarea.getDocument(), new Font
				   (props.FONTSTYLE, 0, props.FONTSIZE));
		   }
	   }
	   
	   /**
		*   runs a command in the viper consoel (bottom window
		*   @param String name command to be run
		*   Note takes off file extensions
		*/   
	   public void RunCommandLine(String name,boolean ext)
	   {
		   String com = name;
		   if(ext) 
		   {com =   name.substring(0,name.length() - 4);}
		   tabbedPane3.setSelectedIndex(0);
		   try
		   {
			   viperconsole.RunCommand(com);
			   
		   }
		   catch (IOException e)
		   {
			   viperconsole.viperConsole.append(e+ System.getProperty("line.separator"));
		   }
	   }
          /** perform command in specified directory */
	     public void RunCommandLine(String dir,String name,boolean ext)
	   {       System.out.println("run command line "+name+" in directory "+dir);
		   String com = name;
		   if(ext) 
		   {com =   name.substring(0,name.length() - 4);}
		   tabbedPane3.setSelectedIndex(0);
		   try
		   {
			   viperconsole.RunCommand(dir,com);
			   
		   }
		   catch (IOException e)
		   {
			   viperconsole.viperConsole.append(e+ System.getProperty("line.separator"));
		   }
	   }
	   
	   public void compileFile()
	   			   {
				   System.out.println("IN Compiler");			 
			
				   
				   // if compiler panel hiden show  it
				   if (props.SHOWBOTTOMPANEL==false) 
				   {
					   props.SHOWBOTTOMPANEL=invertBoolean(props.SHOWBOTTOMPANEL);
					   showBottomPanel();
				   }                
				   String compFile=getName((activeChild.file.getPath()));
				   String compPath=getDirPath(activeChild.file.getPath());
				   String thisDir=System.getProperty("user.dir");
				   compFile = compPath + compFile; //full path to .pas file no suffix 
				   String compDir = " -o" + compFile +".exe" //full path for exe
									+ " -A" + compFile +".asm"; //full path for asm
				   if((System.getProperty("file.separator")).equals("\\"))
				   {
					   StringParser ps =    new StringParser();
					   RunCompiler(ps.ModifyPath(compFile)+ compDir);
				   }
				   else
					  RunCompiler(compFile + compDir);
						   
						  
					  
				    if (props.CPUTAG){
							   System.out.println("RENAMING");
						   ViperFileHandler.moveTo(getDirPath(activeChild.file.getPath()),getDirPath(activeChild.file.getPath()),getName((activeChild.file.getPath()))+".exe", props.SELECTEDCPU.trim()+ getName(activeChild.file.getPath())+".exe");
						   
						   }
				   //move any p.o to source dir & rename
				   moveTo(compPath,thisDir,getName((activeChild.file.getPath()))); 
				   
			   }
	   
	   /**
		*   runs compiler on file
		*   @param String compileFile name of file to be compiled
		*/
	   protected int RunCompiler(String compFile)
	   {

		   tabbedPane3.setSelectedIndex(1);
		   String   compileFile = compFile;
		   int line = -1;
		   boolean build = true;

		   if   (os.toLowerCase().startsWith("window")) compileFile = compileFile + " -U";
		   compilerErrors.removeAllElements();
		   compilerErrors.addElement("Compiling ");
		   compilerErrors.addElement("Options Set " + compileFile + " " + props.JAVAOPTIONSTRING);
		   //  if(props.JAVAOPTIONSTRING.trim().length()>=1)compileFile=compileFile + " " + props.JAVAOPTIONSTRING;
		   if (activeChild.isDirty())
		   {
			   JOptionPane  dvipsPane = new JOptionPane();
			   dvipsPane.setFont(new Font("dialog", Font.PLAIN, 11));
			   int  value = dvipsPane.showConfirmDialog(this,
														"The File has been changed since the last time you   saved.\n"+
														"Do you wish to save ?", "Compile File",
																				 JOptionPane.YES_NO_CANCEL_OPTION);
			   /* Dont  build the VPTeX*/
			   if (value == JOptionPane.CANCEL_OPTION)
			   {
				   build = false;
				   System.out.println("Cancel");
			   }
			   if(value ==  JOptionPane.YES_OPTION)
			   {
				   build =(activeChild.SaveReply());
			   }
		   }
		   if(build){
			   if   (props.COMPILER.startsWith("def"))
			   {
				   if(props.JAVAOPTIONSTRING.trim().length()>=1)compileFile=compileFile + " " + props.JAVAOPTIONSTRING;
				   boolean  smrt = props.SMART;
				   vipcomp  = new VPasCompiler(this,smrt);
				   String compfileOps[] = toToken(compileFile);
				   line = vipcomp.compile(compfileOps);
				   if (line>0)
				   {
					   activeChild.gotoLine(line-1);
					   System.out.println("<error in> " + line);
				   }
			   }
			   else{
				   String   vpPath= getDirPath(activeChild.file.getPath());
				   String   vpFile= getName((activeChild.file.getPath()));
				   //  compiler.compile(props.COMPILER+ props.DYNAMICOPTIONSTRING ,compileFile );
				   RunCommandLine(props.COMPILER+"  "+props.DYNAMICOPTIONSTRING+" "+vpPath+vpFile+".tex",false);
				   JOptionPane  LaTeXPane = new JOptionPane();
				   LaTeXPane.setFont(new Font("dialog", Font.PLAIN, 11));
				   LaTeXPane.showMessageDialog
					   (this,"Compiler running\nDo not run again until output\n"+
					   " has finished   in console", "COMPILER", JOptionPane.WARNING_MESSAGE);
			   }
		   }
		   vipcomp=null;
		   return line;
	   }

	
	   /**
		*   closes all open files
		*/
	   void CloseAll()
	   {
		   int count;
		   if(helpConsole!=null)
		   {
			   helpConsole.close();
			   helpConsole=null;
		   }
		   while ((count = children.size()) >   0)
		   {

			   Editor child = (Editor)children.elementAt(0);
			   if (child != null)
			   {
				   //String dir = System.getProperty("user.dir");
				   child.close();
			   }
			   if (count == children.size())
				   break;
		   }
	   }

	   /**
		*   Closes open project only one project
		*   can be open at a time
		*/
	   void CloseProject()
	   {
		   props.DIV1=0;
		   sp.setDividerLocation(props.DIV1);
		   CloseAll();
		   String [] removeFiles = project.getAllPascalFiles();
		   for (int i =0;i<removeFiles.length;i++){
		   String path = System.getProperty("user.dir")+System.getProperty("file.separator");
		   String filename=getName(removeFiles[i]);
			   
		   File file = new File(path,filename+".pas");
		   System.out.println(file  +" " + file.delete());
		   file.delete();
							}
		   
		   project.CloseProject();
		   project=null;
	   }

	   /**
		*   runs a process in the back ground
		*   does not require any components of viper
		*   to be running
		*   @param String proc process name to run
		*   @return boolean suceessfull= true etc
		*/
	   protected    boolean ViperProcCaller(String proc)
	   {
		   Runtime sys= Runtime.getRuntime();
		   try
		   {
			   String com=  proc;
			   //System.out.println(com);
			   Process  p= sys.exec(com);
			   if (p.waitFor()== 0)
			   {
				   return true;
			   } // end if
		   } // end try
		   catch (Exception ep)
		   {
			   System.err.println(ep);
		   } // end catch
		   return   false;
		   //this.filesearchlistpanel.addElement("VPTeX build   successful");
	   }

	   /**
		*   returns the path from a file name
		*   @param String path full file name and path
		*   @return string path only
		*/
	   public static    String getDirPath(String path)
	   {
		   String   str= System.getProperty("file.separator");
		   char ch= str.charAt(0);
		   int m=   path.lastIndexOf(ch);
		   int n=   path.length();
		   char buf[]= new char[m+1];
		   path.getChars(0,m+1,buf,0);
		   String   name= new String(buf);
		   return   name;
	   }

	   /**
		*   returns the name from a full file path without suffix
		*   @param String path full file name and path
		*   @return string name only
		*/
	   protected    String getName(String path)
	   {
		   String   str= System.getProperty("file.separator");
		   char ch= str.charAt(0);
		   int m=   path.lastIndexOf(ch);
		   int n=   path.length();
		   char buf[]= new char[n-m-5];
		   path.getChars(m+1,n-4,buf,0);
		   String   name= new String(buf);
		   return   name;
	   }



	   public void webSurf ()
	   {
		   try
		   {

			   String address = JOptionPane.showInputDialog("Enter  target URL");
			   if (address.length()<4)  address="www.viper-team.fsnet.co.uk";
			   browserlauncher.openURL(address);
		   }
		   catch (Exception urle)
		   {}
	   }

	   /**
		*   Moves the .o file from the home directory to the working
		*   directory renames it to match the .pas source file
		*   @param String toPath Destination directory path
		*   @param String fromPath Source directory path
		*   @param String filename Destination file name
		*/
	   protected    void moveTo(String toPath,String fromPath,String filename)
	   {
		   try
		   {
			   //lets   deal with the p.o file first.
			   File fPath=  new File (fromPath,"p.o");
			   File tPath=  new File (toPath,(filename + ".o"));
			   if (fPath.exists())
			   {//if the file exist move it
				   if (tPath.exists())
				   { //if the to file does existed
					   tPath.delete();//delete it
					   tPath    = new File(toPath,(filename + ".o"));//if create a new
				   }    
				   fPath.renameTo(tPath);//then move to file
			   }
		   }
		   catch (Exception e)
		   {            }
	   }
	   
	   /**
		*   Rteurns the operating system in use on the current system
		*   @return String the name of the operating system  
		*/
	   protected    String getOS()
	   {
		   String   ret = System.getProperty("os.name").toLowerCase();
		   return   ret;
	   }
	   
	   /**
		*   Puts the correct rtl file in the ilcg/Pascal directory
		*   @param osName operating systems name comes from 
		*   getOS() method
		*   @return The -U string for the operating system
		*   Linux = " "
		*   Windows = "-U" 
		*/
	   protected    String setOptionString (String osName)
	   {
		   String   ops = null;
		   String   rtlFile = null;
		   String   home = System.getProperty("user.dir") + System.getProperty("file.separator");
		   String   setRtl = null;
		   String   rtlDir = home +
							 "ilcg"+
							 System.getProperty("file.separator")+
							 "Pascal"+
							 System.getProperty("file.separator");
		   /* Deal  with Linux os */
		   if   (osName.toLowerCase().startsWith("lin"))
		   {
			   ops  = null;
			   rtlFile  = "LIN_rtl.o";
			   setRtl = "cp "+home  + rtlFile + " " +rtlDir+"rtl.o";
		   }
		   /*   Deal with windows NT flavour os */
		   else if(osName.toLowerCase().startsWith("windows nt") || osName.toLowerCase().startsWith("windows 2000"))
		   {
			   ops  = " -U";
			   rtlFile  = "WIN_rtl.o";
			   setRtl = "cmd /c copy "  +home + rtlFile + " " +rtlDir+"rtl.o";
		   }
		   /*   Deal with windows 9x flavour os */
		   else if (osName.toLowerCase().startsWith("windows"))
		   {
			   ops  = " -U";
			   rtlFile  = "WIN_rtl.o";
			   setRtl = "command.com /c copy "+home + rtlFile + " " +rtlDir+"rtl.o";
		   }
		   /* Report status to  user */
		   System.out.println("OS   detected: "+ osName +"\nUsing :" 
							  + rtlFile+"\nIn : "+rtlDir
							  +"\nOption set to : " + ops);
		   /* debug code */
		   System.out.println(" ");
		   System.out.println(setRtl);
		   /* Move  selected rtl file to ~/ilcg/Pascal/rtl.o */ 
		   ViperProcCaller(setRtl);
		   
		   /* debug code    */
		   System.out.println("Moved rtl from: " +home + rtlFile+
							  "\nTO : " + rtlDir +"rtl.o");
		   /* return the comp flag  */
		   return   ops;
	   }
	   
	   /**
		* Builds    the vptex for the current active file
		* if    file dirty save option if latex compiler setup
		* LaTeX is built.
		*/
	   protected    void buildVPTex()
	   {
		   String[] opt =   toToken(props.VPTEXOPTIONS);
		   byte vpLev= Byte.parseByte(opt[0]);
		   boolean build = true;

		   // boolean mathConv  =props.MATHCONVERTER;// Boolean.valueOf(opt[1]).booleanValue();
		   boolean  mathConv = props.MATHCONVERTER;
		   boolean  contentsP = props.CONTENTSPAGE;


		   String   vpPath= new String();
		   String   vpFile= new String();
		   String   texFile= new String();
		   String   home=System.getProperty("user.dir");
		   String   compiler = props.LATEX;
		   vptex = new vPTeX();
		   if (project==null){
			   vpPath= getDirPath(activeChild.file.getPath());
			   vpFile= activeChild.getTitle();
			   texFile= getName((activeChild.file.getPath()));



		   /*   If .pas file not saved */
		   if   (activeChild.isDirty())
		   {
			   JOptionPane  dvipsPane = new JOptionPane();
			   dvipsPane.setFont(new Font("dialog", Font.PLAIN, 11));
			   int  value = dvipsPane.showConfirmDialog(this,
														"The File has been changed since the last time you saved.\n"+
														"Do you wish to save ?", "VP-TEX BUILDER ",
																				 JOptionPane.YES_NO_CANCEL_OPTION);
			   /* Dont  build the VPTeX*/
			   if (value == JOptionPane.CANCEL_OPTION)
			   {
				   build = false;
				   System.out.println("Cancel");
			   }
			   if(value ==  JOptionPane.YES_OPTION)
			   {
				   build =(activeChild.SaveReply());
			   }
		   }
		   }
		   if (project != null){

			  System.out.println("Project VPTeX ");

				   vpPath =project.PROJECTPATH + System.getProperty("file.separator")+ project.PROJECTNAME + System.getProperty("file.separator")+ project.PROJECTNAME;
				   vpFile=".prj";
				   texFile = project.PROJECTNAME;
				   //System.out.println(projString);

			  }


		   if(build)
		   {
			   if(vptex.createVPTeX(vpPath+vpFile,vpLev,mathConv,contentsP))
				   /*if(project!=null)
				   {
				   move all tex files
				   }*/
			   {
				   /*   If there is a compiler compile latex */
				   if (!(compiler.startsWith("NULL")))
				   {
					   RunCommandLine(project.PROJECTPATH+ System.getProperty("file.separator")+ project.PROJECTNAME,compiler+" "+vpPath+".tex",false);
					   JOptionPane  LaTeXPane = new JOptionPane();
					   LaTeXPane.setFont(new Font("dialog", Font.PLAIN, 11));
					   LaTeXPane.showMessageDialog
						   (this,"LaTeX compiler running\nDo not run again until output\n"+
						   " has finished   in console", "LaTeX", JOptionPane.WARNING_MESSAGE);
					   if(project!=null)
					   {
					   vpPath= project.PROJECTPATH + System.getProperty("file.separator")+project.PROJECTNAME;
					   
					   vpFile= project.PROJECTNAME;
					   }
					   else
						   vpFile=getName(activeChild.file.getPath());
					   /* Move all files back to their original directory */
					   System.out.println(vpPath+vpFile+".aux");
					   /*
					   
					   ViperFileHandler.moveTo(vpPath,home,vpFile+".aux");
					   ViperFileHandler.moveTo(vpPath,home,vpFile+".toc");
					   ViperFileHandler.moveTo(vpPath,home,vpFile+".log");
					   ViperFileHandler.moveTo(vpPath,home,vpFile+".dvi");
					 */


				   }

			   }

		   }
	   }
	   
	   protected    void latexBuild()
	   {
		   String   home=System.getProperty("user.dir")+System.getProperty("file.separator");
		   String   vpPath= getDirPath(activeChild.file.getPath());
		   String   vpFile= getName((activeChild.file.getPath()));
		   String   compiler = props.LATEX;
		   boolean doTeX = true;
		   if   (!(compiler.startsWith("NULL")))
		   {
			   boolean  isTeX = (activeChild.file.getPath()).endsWith(".tex");
			   if (activeChild.isDirty() && isTeX)
			   {
				   JOptionPane  texPane = new JOptionPane();
				   texPane.setFont(new  Font("dialog", Font.PLAIN, 11));
				   int  val = texPane.showConfirmDialog(this,
														"The File has been changed since the last time you saved.\n"+
														"Do you wish to save?", "TeX BUILDER ",
																				JOptionPane.YES_NO_CANCEL_OPTION);
				   if (val==JOptionPane.CANCEL_OPTION||val==JOptionPane.NO_OPTION)
					   doTeX =  false;
				   else 
					   doTeX =  (activeChild.SaveReply());
			   }
			   if(doTeX)
			
			   {
			/*	   System.out.println("From : "+vpPath+vpFile+".tex");
				   System.out.println("To : "+ home + vpFile+".tex");
				   //take .tex  file to viphome
				   //   ViperFileHandler.moveFile(vpPath,vpFile+".tex",home,vpFile+".tex");
				   ViperFileHandler.moveTo(vpPath,home,vpFile+".tex");*/
				   RunCommandLine(vpPath,compiler+" "+vpPath+vpFile+".tex",false);
				   // RunCommandLine(compiler+" "+vpFile+".tex",false);
				   /*    if((props.LATEX).startsWith("latex")||(props.LATEX).startsWith("texi2dvi"))
				   {           */
				   JOptionPane LaTeXPane = new JOptionPane();
				   LaTeXPane.setFont(new Font("dialog", Font.PLAIN, 11));
				   LaTeXPane.showMessageDialog
					   (this,"LaTeX compiler running\nDo not run again until output\n"+
					   " has finished in console", "LaTeX", JOptionPane.WARNING_MESSAGE);
				   //    }
				   /*   ViperFileHandler.moveFile(home,vpFile+".aux",vpPath,vpFile+".aux");
				   ViperFileHandler.moveFile(home,vpFile+".toc",vpPath,vpFile+".toc");
				   ViperFileHandler.moveFile(home,vpFile+".log",vpPath,vpFile+".log");    */
				   //ViperFileHandler.moveTo(vpPath,home,vpFile+".aux");
				   //ViperFileHandler.moveTo(vpPath,home,vpFile+".toc");
				   //ViperFileHandler.moveTo(vpPath,home,vpFile+".log");
				   //ViperFileHandler.moveTo(vpPath,home,vpFile+".dvi");
			   }
			   
		   }
		   else
		   {
			   JOptionPane  noConvPane = new JOptionPane();
			   noConvPane.setFont(new Font("dialog", Font.PLAIN, 11));
			   noConvPane.showMessageDialog(this,"No LaTeX  compiler set in compiler options", "LaTeX", JOptionPane.ERROR_MESSAGE); 
		   }

	   }
	   
	   /**
		*   main function for application
		*/
	   public static void main(String[] args)
	   {
		   Viper window =   new Viper();
		   //System.out.println("Java   version:"+System.getProperty("java.version"));
		   //System.out.println("OS Name:"+System.getProperty("os.name"));
		   //System.out.println("OS arch:"+System.getProperty("os.arch"));
		   if   (args.length > 0)
		   {
			   File file =  new File(args[0]);
			   if (file.getName().endsWith(".pas")  || file.getName().endsWith(".pas") || file.getName().endsWith(
																												  ".html") || file.getName().endsWith("htm")|| file.getName().endsWith(".tex"))
				   window.loadChild(file.getName(), file);
			   if (file.getName().endsWith(".prj"))
				   window.project.OpenNewProject(file);
		   }
	   }
	   
	   
   }
