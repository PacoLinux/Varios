package ilcg.tree;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
public
class StreamGobbler extends Thread
{


    InputStream is;
    String type;


    public StreamGobbler(InputStream is, String type)
    {
        this.is = is;
        this.type = type;
    }


    /**
     *  Main processing method for the StreamGobbler object
     */
    public void run()
    {
        try
        {
            InputStreamReader isr  = new InputStreamReader(is);
            BufferedReader br      = new BufferedReader(isr);
            String line            = null;
            while((line = br.readLine()) != null)
            {
                System.out.println(type + ">" + line);
            }
        }
        catch(IOException ioe)
        {
            ioe.printStackTrace();
        }
    }
}
