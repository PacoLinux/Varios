/**
 * viperConsole.java - Console shell to allow users to run external commands
 */

package viper;

import java.io.*;
import java.net.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.Vector;

class ViperConsole
{

    Viper viper;
    JTextArea viperConsole;
    private Process process;
    private Thread waitThread;
    String viperConsoleCommand="";
	Vector commandList = new Vector();
	int curCom = 0;
    /** SunOS prompt: csdlyon% */
    public static final int SUNOS_PROMPT = 0;
    /** Linux prompt: guy@csdlyon$ */
    public static final int LINUX_PROMPT = 1;
    /** DOS prompt: /export/home/guy > */
    public static final int DOS_PROMPT = 2;

    private int promptType;

    public ViperConsole(Viper parent){
        viper = parent;
        viperConsole = new JTextArea();
        if(System.getProperty("os.name").startsWith("Linux"))promptType=LINUX_PROMPT;
        else if(System.getProperty("os.name").startsWith("Windows"))promptType=DOS_PROMPT;
        else promptType=SUNOS_PROMPT;
        viperConsole.setFont(new Font(viper.props.CONSOLEFONT, 0, viper.props.CONSOLEFONTSIZE));
        viperConsole.setBackground(viper.props.CONSOLEBCOLOUR);
        viperConsole.setForeground(viper.props.CONSOLEFCOLOUR);
        viperConsole.setCaretColor(viper.props.CONSOLEFCOLOUR);
        displayPrompt();
        viperConsole.addKeyListener(new KeyListener(){
                                       public void keyPressed(KeyEvent e){
                                           viperConsole.setCaretPosition(viperConsole.getText().length());
                                           int key=e.getKeyCode();
                                           int modifiers = e.getModifiers();
                                           char c = e.getKeyChar();
                                           switch(key){

                                           case KeyEvent.VK_BACK_SPACE:     //int number 8
                                           case KeyEvent.VK_DELETE:            //int number 127
                                               if(viperConsoleCommand.trim().length()<1) {
                                                   viperConsoleCommand="";
                                                   e.consume();
                                               }
                                               else if(viperConsoleCommand!="")viperConsoleCommand=viperConsoleCommand.substring(0,viperConsoleCommand.length()-1);
                                               break;
                                           case KeyEvent.VK_ENTER:
                                               String errorCommand=viperConsoleCommand;
											   commandList.addElement(viperConsoleCommand);
											   curCom=commandList.size();
                                               try{
                                                   if(viperConsoleCommand.trim().length()>1)
												   {
                                                       if(viperConsoleCommand.endsWith("cls")||
														  viperConsoleCommand.endsWith("clear")) 
													   {
                                                           viperConsole.setText("");
                                                           displayPrompt();
                                                       }
													   else if (viperConsoleCommand.endsWith("vipsurf"))
													   {
														   viper.webSurf();
														   viperConsole.setText("");
														   displayPrompt();
													   }
													   else if (viperConsoleCommand.endsWith("VPTeX"))
													   {
														   viperConsole.setText("");
														   viperConsole.append("VPTeX Build Completed");
														   displayPrompt();
													   }													   
                                                       else RunCommand(viperConsoleCommand);
                                                   }
                                               }
                                               catch(IOException ioe){
                                                   viperConsole.append("Unknown command: "+errorCommand);
                                               }
                                               e.consume();
                                               break;
                                           case KeyEvent.VK_UP:
											   prevCom();
											   break;
                                           case KeyEvent.VK_DOWN:
											   nextCom();
											   break;
                                           case KeyEvent.VK_LEFT:
                                           case KeyEvent.VK_RIGHT:
                                           case KeyEvent.VK_TAB:
                                               e.consume();
                                               break;
                                           }
                                           if (c >=0x20 && c<=0x7e)viperConsoleCommand+=e.getKeyChar();
                                       }
                                   public void keyReleased(KeyEvent e){}
                                       public void keyTyped(KeyEvent e){}
                                   });
    }
	
	private void prevCom()
	{
		
		curCom--;
		if (curCom<0) curCom=0;
		viperConsole.setText("");
        displayPrompt();
		viperConsoleCommand=(String) commandList.elementAt(curCom);
		viperConsole.append(viperConsoleCommand);
		
	}
	private void nextCom()
	{
		int max = commandList.size()-1;
		curCom++;
		if (curCom>max) curCom = max;
		viperConsole.setText("");
        displayPrompt();
		viperConsoleCommand=(String) commandList.elementAt(curCom);
		viperConsole.append(viperConsoleCommand);		
	}
	
	public boolean doProc(String exeFile,String inFile,String oFile) 
	{
		Runtime sys = Runtime.getRuntime();
		boolean ans = false;
		boolean input;
		boolean output;
		input= inFile.length()>3;
		output= oFile.length()>3;
		try 
		{
			String com = exeFile;
			ans = true;
			viperConsole.append(" \n");
			displayPrompt();
			viperConsole.append("<OUTPUT FROM "+com+">\n");
			displayPrompt();
			viperConsole.append(" \n");
			displayPrompt();
			Process p = sys.exec(com);
			
			/* Input to program */
			if (input)
			{	
				BufferedOutputStream pw = 
							new  BufferedOutputStream (p.getOutputStream());
				WriterThread w = new WriterThread(pw,inFile);
				w.start();
			}
			
			/* Output from program */
			BufferedInputStream stream = new BufferedInputStream(p.getInputStream());
			ReaderThread r = new ReaderThread(p.getErrorStream());
			r.start();
			   
		    byte[] buf = new byte[200];
			if(output)
			{
				FileOutputStream fos = new FileOutputStream(oFile);
				PrintWriter pw = new PrintWriter(fos,true);
				while (true) 
				{
					try 
					{
						int b = stream.read(buf);
						if (b>0)
						{
						    pw.println(new String(buf,0,b));
						}
						else if (b<0) break;
					}
					catch (IOException ex)
					{
						viperConsole.append("<ERROR>"+ ex.toString()+"\n");
						break;
					}
					//pw.flush();
					viperConsole.append("Output redirected to "+oFile+"\n");
					viperConsole.append(" \n");
					viperConsole.append("<PROCESS COMPLETE>\n");
					displayPrompt();
					pw.close();
				}
				
			}
			else
			{
				while (true) 
				{
					try 
					{
						int b = stream.read(buf);
						if (b>0)
							viperConsole.append(new String(buf,0,b));
							//System.out.println(new String(buf,0,b));
						else if (b<0) break;
					}
					catch (IOException ex)
					{
						viperConsole.append("<ERROR>" + ex.toString()+"\n");
						//System.out.println("<ERROR>" +   ex.toString());
						break;
					}
					//System.out.println("<PROCESS COMPLETE>");
				}
			}
		}
		catch (Exception ep) {}		
		return true;
	}
		
    public void RunCommand(String cmdline)
    throws IOException
    {
        viperConsole.append(System.getProperty("line.separator"));
        String OSNAME=System.getProperty("os.name");
        if(OSNAME.startsWith("Windows NT") || OSNAME.startsWith("Windows 2000"))cmdline="cmd /c "+cmdline;
        else if(OSNAME.startsWith("Windows"))cmdline="command.com /c "+cmdline;
	    Runtime r = Runtime.getRuntime();
        process = r.exec(cmdline);
        process.getOutputStream().close();

        ReaderThread r1 = new ReaderThread(process.getInputStream());
        r1.start();
		//ReaderThread r2 = new ReaderThread(process.getOutputStream());<gives error
        ReaderThread r2 = new ReaderThread(process.getErrorStream());
        r2.start();

        Thread waitThread = new Thread(new Runnable() {

                                           public void run()
                                           {
                                               _wait();
                                           }
                                       });
        waitThread.start();
    }


  public void RunCom(String[] cmds)
    throws IOException
    {
        viperConsole.append(System.getProperty("line.separator"));
        String OSNAME=System.getProperty("os.name");
	String cmdline = null;

        if(OSNAME.startsWith("Windows NT") || OSNAME.startsWith("Windows 2000"))cmdline="cmd /c ";
        else if(OSNAME.startsWith("Windows"))cmdline="command.com /c ";

	for (int k= 0; k<cmds.length; k++)
	{

	Runtime r = Runtime.getRuntime();
        process = r.exec(cmdline + cmds[k]);
        process.getOutputStream().close();

        ReaderThread r1 = new ReaderThread(process.getInputStream());
        r1.start();
		//ReaderThread r2 = new ReaderThread(process.getOutputStream());<gives error
        ReaderThread r2 = new ReaderThread(process.getErrorStream());
        r2.start();

        Thread waitThread = new Thread(new Runnable() {

                                           public void run()
                                           {
                                               _wait();
                                           }
                                       });
        waitThread.start();
	    }
    }
    /** run the specified command line in the specified directory */
 public void RunCommand(String dir, String cmdline)
    throws IOException
    {   String comfile="vptask.bat";
    	cmdline = "cd "+dir+"\n"+cmdline+" \n";
	PrintWriter t= new PrintWriter(new FileOutputStream(comfile));

	t.println(cmdline);
	t.close();

        viperConsole.append(System.getProperty("line.separator"));
        String OSNAME=System.getProperty("os.name");
        if(OSNAME.startsWith("Windows NT") || OSNAME.startsWith("Windows 2000"))cmdline="  "+comfile;
        else if(OSNAME.startsWith("Windows"))cmdline=""+comfile;
	else cmdline ="bash "+comfile;
	    Runtime r = Runtime.getRuntime();
	    System.out.println(cmdline);
        process = r.exec(cmdline);
        process.getOutputStream().close();

        ReaderThread r1 = new ReaderThread(process.getInputStream());
        r1.start();
		//ReaderThread r2 = new ReaderThread(process.getOutputStream());<gives error
        ReaderThread r2 = new ReaderThread(process.getErrorStream());
        r2.start();

        Thread waitThread = new Thread(new Runnable() {

                                           public void run()
                                           {
                                               _wait();
                                           }
                                       });
        waitThread.start();
    }


  public void RunCom(String dir,String[] cmds)
    throws IOException
    {
        viperConsole.append(System.getProperty("line.separator"));
        String OSNAME=System.getProperty("os.name");
	String cmdline = null;

        if(OSNAME.startsWith("Windows NT") || OSNAME.startsWith("Windows 2000"))cmdline="cmd /c ";
        else if(OSNAME.startsWith("Windows"))cmdline="command.com /c ";
	else cmdline="bash -c ";

	for (int k= 0; k<cmds.length; k++)
	{

	Runtime r = Runtime.getRuntime();
        process = r.exec(cmdline + "\"cd "+dir+";"+cmds[k]+"\"");
        process.getOutputStream().close();

        ReaderThread r1 = new ReaderThread(process.getInputStream());
        r1.start();
		//ReaderThread r2 = new ReaderThread(process.getOutputStream());<gives error
        ReaderThread r2 = new ReaderThread(process.getErrorStream());
        r2.start();

        Thread waitThread = new Thread(new Runnable() {

                                           public void run()
                                           {
                                               _wait();
                                           }
                                       });
        waitThread.start();
	    }
    }





  
    private void _wait()
    {
        for (; ; )
        {
            try
            {
                int x = process.waitFor();
                break;
            }
            catch (InterruptedException ex)
            {
                viperConsole.append(ex.toString());
            }
        }
        displayPrompt();
    }

    public static String getUserDirectory()
    {
        return System.getProperty("user.dir");
    }

    public void displayPrompt()
    {
		String prompt = new String("<VIPER>> ");
 
        viperConsole.append(prompt);
        viperConsole.setCaretPosition(viperConsole.getText().length());
        viperConsoleCommand="";
    }
	
	private class WriterThread extends Thread {
		private OutputStream stream;
		private String testFileName;
		WriterThread (OutputStream stream,String testFileName)
		{
			this.stream= stream;
			setDaemon(true);
			this.testFileName= testFileName;
		}
		public void run()
		{
			try
			{
				FileInputStream fin= new FileInputStream(testFileName);
				int c= 0; 
				while (c!=-1) 
				{
					try 
					{
						c =  fin.read();
						stream.write(c);
						stream.flush();
					}
					catch (Exception ex)
					{
						System.out.println("<ERROR>" +   ex.toString());
						break;
					}
				}
			}
			catch(FileNotFoundException e){}
		}
	}
    private class ReaderThread extends Thread
    {
        private InputStream stream;
        private byte[] buf = new byte[80];
        ReaderThread(InputStream stream)
        {
            this.stream = stream;
            setDaemon(true);
        }
        public void run()
        {
            for (; ; )
            {
                try
                {
                    int b = stream.read(buf);
                    if (b > 0)
                        viperConsole.append(new String(buf, 0, b));
                    else if (b < 0)
                        break;
                }
                catch (IOException ex)
                {
                    viperConsole.append(ex.toString());
                    break;
                }
            }
        }
    }
}

