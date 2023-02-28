package viper;
import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.util.*;
import java.io.*;

public class VPCompPropsReader
{
  	
	FileReader fr ;
    BufferedReader br ;
 static String CPUFLAGS;
 public String[] CPUS;
 //-------------------------------------
 private static ArrayList FLAG = new ArrayList();
 private static ArrayList DESCRIPTION =new ArrayList() ;
 private static ArrayList TEXTFIELD = new ArrayList();
 private static ArrayList BROWSEBUTTON = new ArrayList();
 
 //-------------------------------------
 public static String[] FLAGS;
 public static String[] DESCRIPTIONS;
 public static int[] TEXTFIELDS;
 public static boolean[] BROWSEBUTTONS;
  
	public VPCompPropsReader()
    {
		FLAG.clear();
        DESCRIPTION.clear();
        TEXTFIELD.clear();
        BROWSEBUTTON.clear();
		
		 //  viper = parent;
        try
        {
           	String buffer = "";
            String userdir = System.getProperty("user.home");
            userdir = userdir + System.getProperty("file.separator") +
                      "dynamicOption.properties";
			
            File file = new File(userdir);
			if (!file.exists()){
		
			file = new File("viper"+ System.getProperty("file.separator")+"resources"+System.getProperty("file.separator") +"dynamicOption.properties");
			ViperFileHandler.moveFile("viper"+ System.getProperty("file.separator")+"resources"+System.getProperty("file.separator"),"dynamicOption.properties",System.getProperty("user.home") + System.getProperty("file.separator"),"dynamicOption.properties");
			} 
			 if (file.exists()){
			 fr = new FileReader(file);
		     br = new BufferedReader(fr);
			 CPUFLAGS = this.br.readLine();	 
			 while (buffer.startsWith("#")){
				 buffer = br.readLine();
			 }
			 while (!buffer.startsWith("FLAG")){
				 buffer = br.readLine();
			 }
			 while ( (buffer=br.readLine()) != null){
				flagParser(buffer);								   
				
			}
			 
			 
			 }
			 br.close();
             fr.close(); 
        }
        catch (Exception e)
        {
			//e.printStackTrace();
			 
			int value;
            System.out.println(e);
			JOptionPane error = new JOptionPane();
			error.setFont(new Font("dialog", Font.PLAIN, 11));
		   value = error.showConfirmDialog(null,"The Compiler properties file is invalid.\n Do you wish to replace it with a standard file?", "Compiler options ", JOptionPane.YES_NO_OPTION); 	
			
			if(value == JOptionPane.YES_OPTION){
					
					ViperFileHandler.moveFile("viper"+ System.getProperty("file.separator")+"resources"+System.getProperty("file.separator"),"dynamicOption.properties",System.getProperty("user.home") + System.getProperty("file.separator"),"dynamicOption.properties");
					}
        }
 
          FLAGS       =new String[FLAG.size()];
          DESCRIPTIONS= new String[DESCRIPTION.size()];
		  TEXTFIELDS = new int[TEXTFIELD.size()];
          BROWSEBUTTONS = new boolean[BROWSEBUTTON.size()];
		
		  
		
		  CPUS=cpuParser(CPUFLAGS);

          FLAGS       =loadStringArrays(FLAG);		
          DESCRIPTIONS= loadStringArrays(DESCRIPTION);
          TEXTFIELDS = loadIntArray(TEXTFIELD);
          BROWSEBUTTONS = loadBooleanArray(BROWSEBUTTON);
	}
	public String readCPUS (){
		try{
		CPUFLAGS = this.br.readLine();
		}
		catch (Exception e){
			
		}
		
		return CPUFLAGS;
		
		
	}
	private void  flagParser(String buf){
		StringTokenizer ct = new StringTokenizer(buf,":");
	  FLAG.add(ct.nextToken());
      DESCRIPTION.add(ct.nextToken());
      TEXTFIELD.add(ct.nextToken());
      BROWSEBUTTON.add(ct.nextToken());
	}
	
	
	
	private static  String[] cpuParser(String cpu)
	{
	cpu.trim();	
	StringTokenizer ct= new StringTokenizer(cpu,":");
	String [] to;
	ArrayList al = new ArrayList();
     while (ct.hasMoreTokens()) {
         al.add(ct.nextToken());
     }
 	      al.remove(0);
		  to = new String[al.size()];
		for (int i=0; i<al.size() ;++i)
		{
		to[i]= ((String)al.get(i)).trim();
		}	
		
		return to;
	}
	
	private String[] loadStringArrays(ArrayList al){

		 String [] to;
		
	   to = new String[al.size()];
		for (int i=0; i<al.size() ;++i)
		{
		to[i]= ((String)al.get(i)).trim();
		}	
		
		return to;
	}
	
		
	private int[] loadIntArray(ArrayList al){
		 int [] to;
		
	   to = new int[al.size()];
		for (int i=0; i<al.size() ;++i)
		{
		to[i]= (new Integer(((String)al.get(i)).trim()).intValue());
		}	
		
		return to;
		
	}
	
	private boolean[] loadBooleanArray(ArrayList al){
		 boolean [] to;
		
	   to = new boolean[al.size()];
		for (int i=0; i<al.size() ;++i)
		{
		to[i]= (new Boolean(((String)al.get(i)).trim()).booleanValue());
		}	
		
		return to;
		
	}

	
	
	public static void main(String args[]){
	VPCompPropsReader t = new VPCompPropsReader();
	}//end main
}
		
	
	
	
	