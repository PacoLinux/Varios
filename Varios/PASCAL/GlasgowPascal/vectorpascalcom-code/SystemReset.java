
import java.io.File.*;
import java.io.*;

public class SystemReset extends java.io.File
{
    SystemReset(File parent, String child)
    {
        super(parent,child);
    }
    SystemReset(String parent, String child)
    {
        super(parent,child);
    }


    public static void touch( String filename)
    {

        try {
            File file = new File(filename);

            long temp = System.currentTimeMillis();
            if (file.isFile()) {
                file.setLastModified(System.currentTimeMillis());
                System.out.println("Time Stamps : " +file.lastModified());

            }
        } catch (Exception e) {}
    }

    public static void main (String args[])
    {
        SystemReset.touch("system.pas");
        SystemReset.touch("macros.asm");



    }



}