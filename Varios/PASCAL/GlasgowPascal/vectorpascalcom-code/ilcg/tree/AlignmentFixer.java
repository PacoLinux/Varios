package ilcg.tree;
import java.io.*;
import java.util.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
public class AlignmentFixer
{
    /* the purpose of this is to process assembler output files produced
    by gcc to ensure that the alignment of static data objects corresponds
    to their sizes */
    List<String> thetext=null;
    Vector<String>output =new Vector<String> (0);
    void appendfile(String fn)throws IOException
    {
        Path myPath = Paths.get(fn);
        List < String > lines = Files.readAllLines(myPath, StandardCharsets.UTF_8);
        thetext=lines;
    }
    void process()
    {
        int i;
        for (i=0; i<thetext.size(); i++)
            {
                String s=thetext.get(i);
                boolean done=false;
                if( i<thetext.size()-3)
                    {
                        // could still be valid to change
                        String t=s.trim();
                        if(t.startsWith(".align"))
                            {
                                // parse the alignment
                                String arg= t.substring(6).trim();
                                // arg now should be a number with no spaces round it
                                String t3=thetext.get(i+2).trim();
                                if(t3.startsWith(".size"))
                                    {
                                        // we have a constant object definition make the alignments match
                                        String arg2= t3.substring(t3.length()-arg.length()-1).trim();
                                        if(!arg.equals(arg2))
                                            {
                                                int l=java.lang.Integer.parseInt(arg2);
                                                if( l%8 ==0 )  output.add(" .align 8" ) ;
                                                //   else if (l%4 ==0)  output.add(" .align 4");
                                                //   else if(l%2 ==0)  output.add(" .align 2");
                                                //    else
                                                output.add(" .align  " +arg);
                                                done=true;
                                            }
                                    }
                            }
                    }
                if(!done)output.add(s);
            }
    }
    void printoutput(String fn)throws Exception
    {
        PrintStream PS=new PrintStream(fn);
        for(String s:output)PS.println(s);
        PS.flush();
        PS.close();
    }
    void map(String infile,String outfile)throws Exception
    {
        appendfile(infile);
        process();
        printoutput(outfile);
    }
    public static void main(String[]args)
    {
        AlignmentFixer AF=new AlignmentFixer();
        try
            {
                AF.map(args[0],args[1]);
            }
        catch(Exception e)
            {
                System.err.println("error "+e);
            }
    }
}
