
package viper;

import java.io.*;
import java.awt.event.*;
import java.util.Vector;
import java.util.StringTokenizer;
import javax.swing.*;
import javax.swing.event.*;

import ilcg.tree.*;
import ilcg.tree.Procedure;import ilcg.Pascal.*;import ilcg.Pascal.PascalCompiler.*;import ilcg.Pascal.VPC;
import ilcg.*;

/** Class to handle all of the compiling methods for Viper.
 * 
 */
public class VPasCompiler
{
    /** Holds the name of files and options */
    String options[];
	
    Viper viper;
    /** whether the last compile was successful  */
    boolean error=false;
    VPC vpc;
    /** Construct the compiler class */
    VPasCompiler(Viper parent,boolean smart)
    {
        viper = parent;
		// Smart Compiler being used	
	   if (smart)
	   {
			String Path = System.getProperty("user.dir")+System.getProperty("file.separator")+"VWU"+System.getProperty("file.separator");
			String FileName = viper.props.SELECTEDCPU+".vwu";						  
			vpc = new VPC(Path,FileName,parent);
	   }
	   // Smart Compiler not being used
	   else	   
	      vpc = new VPC();
	   
        viper.compileErrorPanel.addListSelectionListener(new ListSelectionListener() {
            /**                          */
            public void valueChanged(ListSelectionEvent e)
            {
                String str = viper.compileErrorPanel.getSelectedValue().toString();
                str = str.trim();
                int start = 0;
                int end = 0;
                if (str.indexOf(viper.activeChild.getTitle())>=0 || viper.props.COMPILER.indexOf("jikes")>=0){
                    if (viper.props.COMPILER.endsWith("jikes.exe") || viper.props.COMPILER.endsWith
                            ("jikes"))
                        start = -1;
                    else
                        for (int i = 4; i < str.length(); i++)
                            if (str.charAt(i) == ':')
                            {
                                start = i;
                                break;
                            }
                    for (int i = start + 1; i < str.length(); i++)
                        if (str.charAt(i) == ':' || str.charAt(i) == '.')
                        {
                            end = i;
                            break;
                        }
                    String tmp = str.substring(start + 1, end);
                    try
                    {
                        int line = java.lang.Integer.parseInt(tmp);
                        viper.activeChild.gotoLine(line - 1);
                    }
                    catch (NumberFormatException nfe)
                    {
                    }
                }
            }
        });
        
    }
	
	  protected String[] toToken(String input)
      {
         Vector v = new Vector();
         StringTokenizer t = new StringTokenizer(input,"%");
         String[] cmd;
         while (t.hasMoreTokens())
            v.addElement(t.nextToken());
         cmd = new String[v.size()];
         for (int i = 0; i < cmd.length; i++)
            cmd[i] = (String)v.elementAt(i);
         return cmd;
      }	
    
    /** Compiles the file (or files) withits command line args specified with 
     *  {@param options}
     */
    
    public int compile(String options[]){
        viper.statusBar.msgline.setText("");
		//viper.compilerErrors.addElement("Compiling " + options[0]);
		System.err.println("Lets compile with: Default Compiler, and file:- "+ options[0]);
        
        //try{
			viper.statusBar.msgline.setText("Compiling " + options[0] +" Please Wait !!!");
            error = false;
			//Call the compiler with its arguement string
			//final String[] str = toToken(PascalCompiler.setComp(options));
			final String str = vpc.setComp(options);
			int eline = parseErrorLine(str);
            Thread waitThread = new Thread(new Runnable() 
			{
                public void run()
                {
                   // _wait(str); 
					viper.compilerErrors.addElement(str);
						
                }
            });
            waitThread.setDaemon(true);//it is important, if the compiler locks down 
                //a loop and doesn't want to exit
            
            waitThread.start();
            
        //}catch (IOException ex){
        //    viper.statusBar.msgline.setText("Error " + ex);
        //}
			return eline;
    }
	
    protected int parseErrorLine(String str)
	{	
	StringTokenizer st = new StringTokenizer (str);
	int errLine = -1;

	while (st.hasMoreTokens()&& errLine == -1 ) {
		String el= st.nextToken();
		//String el=eline.substring(1);
		if (el.startsWith("1")||el.startsWith("2")||el.startsWith("3")||
			el.startsWith("4")||el.startsWith("5")||el.startsWith("6")||
			el.startsWith("7")||el.startsWith("8")||el.startsWith("9"))
			errLine= java.lang.Integer.parseInt(el);
		} // end if
		return errLine;
	} 

    /** This checks the result, when the the process ends  */
    private void _wait(String str)
    {
       // try
       // {
         //  viper.compilerErrors.addElement(str);
            
       // }
       // catch (InterruptedException ex)
        //{
       //     viper.compilerErrors.addElement("Compilation iterrupted");
       //     viper.statusBar.msgline.setText("Error " + ex.toString());
       // }
    }
}
