/**
 * PropertiesManager.java - Sets properties within the Viper Environment.
 */
package viper;


import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;

public class PropertiesManager
{

    Viper viper;
    private static Properties p;
    static String DVIVIEWER;
	static String FORMAT;
    static String LATEX;
	static String DVIPS;
    static String APPLETVIEWER;
    static String TEXTOHTML;
    static String COMPILER;
    static String TEXTOPDF;
    static String FONTSTYLE;
    static String CONSOLEFONT;
    static String RFILES;
    static String RPROJECTS;
	static String VPTEXOPTIONS; //ORO
	
	static boolean MATHCONVERTER;
	static boolean CONTENTSPAGE;
	
	static String SELECTEDCPU; //ORO
	static String MENUICONSIZE;//ORO
	static String TOOLBARICONSIZE;//ORO
    static String COMPOUTFILE;//ORO
    static String COMPINFILE;//ORO
    static Color CONSOLEBCOLOUR, CONSOLEFCOLOUR;
    static int CONSOLEFONTSIZE,FONTSIZE,TABSIZE,XPOS,YPOS,XSIZE,YSIZE,TOGGLE,DIV1,DIV2,DIV3;
    static boolean AUTOINDENT,SHOWLEFTPANEL,SHOWSTATUSBAR,SHOWBOTTOMPANEL,SHOWTOOLBAR1,SHOWTOOLBAR2;
    static boolean SMART,CPUTAG;
	public static int[] CCOLOR;
    public static int[] JCOLOR;
    public static int[] HCOLOR;
    public static int[] JSCOLOR;
    public static int[] JSPCOLOR;
	public static int[] VPASCOLOR;

    static String LOOKANDFEEL;
    static String JAVAOPTIONSTRING;
	static String DYNAMICOPTIONSTRING;
    //**oro**static String JAVADOCS;
    String path1,path2,path3,path4,path5,path6,path7,path8,path9,path10,path11; //oro
    static String CColors,JColors,JSColors,JSPColors,VPasColors,HTMLColors;
    StringParser parser2,parser3;
    public PropertiesManager(Viper parent)
    {
        viper = parent;
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
        
        String vers = p.getProperty("VERSION");
		System.out.println("Viper version "+vers);
        if (vers==null || vers.compareTo("2.0") < 0)
        {
        	System.out.println("Your viper.properties file in "+System.getProperty("user.home")+
        	"\nisn't compatible with this version of Viper.\nYou need to delete this file for Viper to work again.");
        	System.exit(0);
    	}

		
        DVIVIEWER = p.getProperty("DVIVIEWER");
	    FORMAT = p.getProperty("FORMAT");
        LATEX = p.getProperty("LATEX");
		DVIPS = p.getProperty("DVIPS");
        APPLETVIEWER = "appletviewer";
        COMPILER = p.getProperty("COMPILER");
        TEXTOHTML=p.getProperty("TEXTOHTML");
        TEXTOPDF=p.getProperty("TEXTOPDF");
      //**oro**  JAVADOCS=p.getProperty("JAVADOCS");
      //  CLASSPATH=p.getProperty("CLASSPATH");
       // OUTPUTDIR=p.getProperty("OUTPUTDIR");
        JAVAOPTIONSTRING=p.getProperty("OPTIONSTRING");
		DYNAMICOPTIONSTRING = p.getProperty("DYNAMICOPTIONSTRING");
		VPTEXOPTIONS =p.getProperty("VPTEXOPTIONS");//ORO
		SELECTEDCPU=p.getProperty("SELECTEDCPU") ;//ORO
		
		MATHCONVERTER=setState(p.getProperty("MATHCONVERTER"));
		CONTENTSPAGE=setState(p.getProperty("CONTENTSPAGE"));
		
        
		FONTSTYLE = p.getProperty("FONT");
        FONTSIZE = Integer.parseInt(p.getProperty("FONTSIZE"));
        CONSOLEFONT = p.getProperty("CONSOLEFONT");
        CONSOLEFONTSIZE = Integer.parseInt(p.getProperty("CONSOLEFONTSIZE"));
        CONSOLEFCOLOUR=parseColor(p.getProperty("CONSOLEFCOLOUR"));
        CONSOLEBCOLOUR=parseColor(p.getProperty("CONSOLEBCOLOUR"));

        TABSIZE = Integer.parseInt(p.getProperty("TABSIZE"));
        AUTOINDENT = setState(p.getProperty("AUTOINDENT"));
		MENUICONSIZE = p.getProperty("MENUICONSIZE");
		TOOLBARICONSIZE = p.getProperty("TOOLBARICONSIZE");

		COMPOUTFILE = p.getProperty("COMPOUTFILE");
                COMPINFILE = p.getProperty("COMPINFILE");

        LOOKANDFEEL = p.getProperty("LOOKFEEL");
        XPOS = Integer.parseInt(p.getProperty("XPOS"));
        YPOS = Integer.parseInt(p.getProperty("YPOS"));
        XSIZE = Integer.parseInt(p.getProperty("XSIZE"));
        YSIZE = Integer.parseInt(p.getProperty("YSIZE"));
		TOGGLE = Integer.parseInt(p.getProperty("TOGGLE"));
        DIV1 = Integer.parseInt(p.getProperty("DIV1"));
        DIV2 = Integer.parseInt(p.getProperty("DIV2"));
        DIV3 = Integer.parseInt(p.getProperty("DIV3"));
	  VPasColors = p.getProperty("VPASCOLORS");
        CColors = p.getProperty("CCOLORS");
        JColors = p.getProperty("JCOLORS");
        JSColors = p.getProperty("JSCOLORS");
        JSPColors = p.getProperty("JSPCOLORS");
        HTMLColors = p.getProperty("HTMLCOLORS");
	  VPASCOLOR = new int[10];
        CCOLOR = new int[10];
        JCOLOR = new int[10];
        HCOLOR = new int[10];
        JSCOLOR = new int[10];
        JSPCOLOR = new int[10];
        parser2 = new StringParser();
	  VPASCOLOR = parser2.getColorCode(VPasColors);
        CCOLOR = parser2.getColorCode(CColors);
        JCOLOR = parser2.getColorCode(JColors);
        JSCOLOR = parser2.getColorCode(JSColors);
        HCOLOR = parser2.getColorCode(HTMLColors);
        JSPCOLOR = parser2.getColorCode(JSPColors);
	  
        SHOWLEFTPANEL=setState(p.getProperty("SHOWLEFTPANEL"));
	    SHOWSTATUSBAR=setState(p.getProperty("SHOWSTATUSBAR"));
	    SHOWBOTTOMPANEL=setState(p.getProperty("SHOWBOTTOMPANEL"));
	    SHOWTOOLBAR1=setState(p.getProperty("SHOWTOOLBAR1"));
	    SHOWTOOLBAR2=setState(p.getProperty("SHOWTOOLBAR2"));
	    SMART = setState(p.getProperty("SMART"));
		CPUTAG = setState(p.getProperty("CPUTAG"));
        RFILES=p.getProperty("RFILES");
        RPROJECTS=p.getProperty("RPROJECTS");


    }
    
    /**
     * Sets the state of a given boolean switch to true or false
     * @param vers - The String value of boolean that need to be converted
     */
     
     boolean setState(String vers)
     {
		if(vers.equals("true"))return true;
     	else return false;
     }

    /**
     * Converts a color object to its hex value. The hex value
     * prefixed is with #, for example #ff0088.
     * @param c The color object
     */

    public static String getColorHexString(Color c)
    {
        String colString = Integer.toHexString(c.getRGB() & 0xffffff);
        return "#000000".substring(0, 7 - colString.length()).concat(colString);
    }

    /**
     * Converts a hex color value prefixed with #, for example #ff0088.
     * @param name The color value
     */

    public static Color parseColor(String name)
    {
        if (name == null)
            return Color.black;
        else if (name.startsWith("#"))
        {
            try
            {
                return Color.decode(name);
            }
            catch (NumberFormatException nfe)
            {
                return Color.black;
            }
        }
        return Color.black;
    }

    void SaveOptions()
    {
        try
        {
            String userdir = System.getProperty("user.home");
            userdir = userdir + System.getProperty("file.separator") +
                      "viper.properties";
            FileWriter fs = new FileWriter(userdir);
            String separator = System.getProperty("line.separator");
            fs.write("# Viper Properties." + separator);
            fs.write("# Borland,Hughes,Opland,Renfrew,Ronaes & Tinto 2002" + separator);
            fs.write("VERSION=2.1"+ separator + separator);
			
            if((System.getProperty("file.separator")).equals("\\")){
                viper.StringParser parser=new viper.StringParser();
				path9=parser.ModifyPath(FORMAT);
                fs.write("FORMAT "+path9 + separator);
                path8=parser.ModifyPath(TEXTOPDF);
                fs.write("TEXTOPDF "+path8 + separator);
        
                path6=parser.ModifyPath(TEXTOHTML);
                fs.write("TEXTOHTML "+path6 + separator);
                path5=parser.ModifyPath(DVIVIEWER);
                fs.write("DVIVIEWER "+path5 + separator);
                path4=parser.ModifyPath(LATEX);
                fs.write("LATEX "+path4 + separator);
                path11 = parser.ModifyPath(DVIPS);
				fs.write("DVIPS "+path11 +separator);
                path3=parser.ModifyPath(COMPILER);
                fs.write("COMPILER "+path3 + separator);


            }
            else {
			    fs.write("FORMAT " + FORMAT + separator);
                fs.write("TEXTOPDF " + TEXTOPDF + separator);
          
                fs.write("TEXTOHTML " + TEXTOHTML + separator);
                fs.write("DVIVIEWER " + DVIVIEWER + separator);
                fs.write("LATEX " + LATEX + separator);
				fs.write("DVIPS " +DVIPS +separator);
                fs.write("COMPILER " + COMPILER + separator);

            }
            fs.write("OPTIONSTRING "+JAVAOPTIONSTRING + separator);
			fs.write("DYNAMICOPTIONSTRING = "+DYNAMICOPTIONSTRING +separator);
			fs.write("VPTEXOPTIONS "+VPTEXOPTIONS + separator);//ORO
			fs.write("SELECTEDCPU "+SELECTEDCPU + separator);//ORO
            fs.write("MATHCONVERTER " +MATHCONVERTER +separator);
		    fs.write("CONTENTSPAGE " +CONTENTSPAGE +separator);			
			
			fs.write(separator + "#Set Font Style" + separator);
            fs.write("##Valid values are normally - SansSerif, Dialog, Serif, Monospaced or DialogInput" +
                separator);
            fs.write("FONT=" + FONTSTYLE + separator);
            fs.write("FONTSIZE=" + FONTSIZE + separator);
            fs.write("TABSIZE=" + TABSIZE + separator);
			fs.write("AUTOINDENT="+AUTOINDENT + separator);
			fs.write("MENUICONSIZE=" + MENUICONSIZE + separator);
			fs.write("TOOLBARICONSIZE="+ TOOLBARICONSIZE +separator);

			fs.write("COMPOUTFILE ="  +separator);
			fs.write("COMPINFILE = "  +separator);

            fs.write("# Console Options" + separator);
            fs.write("CONSOLEFONT="+CONSOLEFONT+separator);
            fs.write("CONSOLEFONTSIZE="+CONSOLEFONTSIZE+separator);
            fs.write("CONSOLEFCOLOUR="+getColorHexString(CONSOLEFCOLOUR)+separator);
            fs.write("CONSOLEBCOLOUR="+getColorHexString(CONSOLEBCOLOUR)+separator+separator);

            fs.write("#Colors for Syntax highlighting"+ separator);
            parser3 = new StringParser();
			fs.write("VPASCOLORS="+ parser3.makeString(VPASCOLOR)+separator);
            fs.write("CCOLORS="+ parser3.makeString(CCOLOR)+separator);
            fs.write("JCOLORS="+ parser3.makeString(JCOLOR)+separator);
            fs.write("JSCOLORS="+parser3.makeString(JSCOLOR)+separator);
            fs.write("HTMLCOLORS="+ parser3.makeString(HCOLOR)+separator);
            fs.write("JSPCOLORS="+ parser3.makeString(JSPCOLOR)+separator+separator);

            fs.write("#Set the Look & Feel" + separator);
            fs.write(
                "#Valid values are normally - Metal, CDE/Motif, or Windows" +
                separator);
            fs.write("LOOKFEEL=" + LOOKANDFEEL + separator);
            fs.write("XPOS="+ viper.getLocation().x + separator);
            fs.write("YPOS="+ viper.getLocation().y + separator);
            fs.write("XSIZE="+ viper.getSize().width + separator);
            fs.write("YSIZE="+ viper.getSize().height + separator);
			fs.write("TOGGLE="+TOGGLE +separator);
            fs.write("DIV1=0" +separator);
            if(SHOWLEFTPANEL==true)fs.write("DIV2="+ viper.sp2.getDividerLocation()+separator);
            else fs.write("DIV2="+ DIV2 +separator);
            if(SHOWBOTTOMPANEL==true)fs.write("DIV3="+ viper.sp3.getDividerLocation()+separator+ separator);
            else fs.write("DIV3="+ DIV3 +separator);
            fs.write("SHOWLEFTPANEL="+SHOWLEFTPANEL+separator);
            fs.write("SHOWSTATUSBAR="+SHOWSTATUSBAR+separator);
            fs.write("SHOWBOTTOMPANEL="+SHOWBOTTOMPANEL+separator);
            fs.write("SHOWTOOLBAR1="+SHOWTOOLBAR1+separator);
            fs.write("SHOWTOOLBAR2="+SHOWTOOLBAR2+separator+ separator);
			fs.write("SMART=" +SMART +separator);
			fs.write("CPUTAG=" +CPUTAG +separator);
            if((System.getProperty("file.separator")).equals("\\")){
                viper.StringParser parser=new viper.StringParser();
            fs.write("RFILES="+ parser.ModifyPath(RFILES) + separator);
            fs.write("RPROJECTS="+ parser.ModifyPath(RPROJECTS) + separator);
        }
            else{
            	fs.write("RFILES="+ RFILES + separator);
            fs.write("RPROJECTS="+ RPROJECTS + separator);
        }

            fs.close();
        }
        catch (Exception err){}
    }
}
