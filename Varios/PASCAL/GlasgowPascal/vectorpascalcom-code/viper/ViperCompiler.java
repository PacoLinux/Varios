/**
 * Compiler.java - Compile for use with the Viper Project.
 */
 

package viper;

import java.io.*;
import java.awt.event.*;
import java.util.Vector;
import javax.swing.*;
import javax.swing.event.*;

/** Class to handle all of the compiling methods for Viper.
 * 
 */
public class ViperCompiler
{
    /** Holds the name of files  */
    String name;
    /** Holds the full path to compiler  */
    String compilerName;
    /** The compilation process   */
    Process process;
    /** holds the parent were the progress messages, and errors are sent back  */
    Viper viper;
    /** whether the last compile was successful  */
    boolean error=false;
    
    /** Construct the compiler class */
    ViperCompiler(Viper parent)
    {
        viper = parent;
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
                        int line = Integer.parseInt(tmp);
                        viper.activeChild.gotoLine(line - 1);
                    }
                    catch (NumberFormatException nfe)
                    {
                    }
                }
            }
        });
        
    }
    
    /** Compiles the file (or files) specified with {@param path}, with the
     *  compiler {@param compilername}
     */
    
    public void compile(String compilername, String path){
        viper.statusBar.msgline.setText("");
        System.err.println("Lets compile with:"+compilername+", and file:"+path);
        InputStream is;
        name = path;
        compilerName = compilername;
        try{
            String command = compilerName + " " + name;
            viper.compilerErrors.addElement(command);
            process = Runtime.getRuntime().exec(command);
            process.getOutputStream().close();
            viper.statusBar.msgline.setText("Compiling " + name +" Please Wait !!!");
            error = false;
            ReaderThread r1 = new ReaderThread(process.getInputStream());
            r1.start();
            ReaderThread r2 = new ReaderThread(process.getErrorStream());
            r2.start();

            
            Thread waitThread = new Thread(new Runnable() {
                public void run()
                {
                    _wait();
                }
            });
            waitThread.setDaemon(true);//it is important, if the compiler locks down 
                //a loop and doesn't want to exit
            
            waitThread.start();
            
        }catch (IOException ex){
            viper.statusBar.msgline.setText("Error " + ex);
        }
    }

    /** This checks the result, when the the process ends  */
    private void _wait()
    {
        try
        {
            int x = process.waitFor();
            if (x==0){
                viper.compilerErrors.addElement("Compilation successful");
                viper.statusBar.msgline.setText("Compiled OK.");
            }else{
                viper.compilerErrors.addElement("There were errors in the compilation");
                viper.statusBar.msgline.setText("Compiling Errors.");
                //the scrollpane is in the tabbedpane so that should be selected
                viper.tabbedPane3.setSelectedComponent(viper.compileErrorPanel.getParent().getParent());
            }
        }
        catch (InterruptedException ex)
        {
            viper.compilerErrors.addElement("Compilation iterrupted");
            viper.statusBar.msgline.setText("Error " + ex.toString());
        }
    }
    
    private class ReaderThread extends Thread
    {
        /**          */
        private InputStream stream;

        /**          */
        ReaderThread(InputStream stream)
        {
            this.stream = stream;
            setDaemon(true);
        }
        /**          */
        public void run()
        {
            try
            {
                BufferedReader ds = new BufferedReader(new InputStreamReader(stream));
                String  str;
                while ((str = ds.readLine())!= null){
                    //viper.tabbedPane3.setSelectedIndex(1);
                    viper.compilerErrors.addElement(str);
                }
                ds.close();
            }
            catch (IOException ex)
            {
                viper.statusBar.msgline.setText("Error " + ex.toString());
                return;
            }
        }
    }
}
