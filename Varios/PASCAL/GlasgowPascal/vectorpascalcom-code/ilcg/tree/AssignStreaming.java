

package ilcg.tree;


import java.io.*;

public class AssignStreaming extends Assign
{
    public AssignStreaming(Node d, Node s)throws AssignmentException
    {
        super(d,s);
    }
    public AssignStreaming(Node d, Node s, boolean check) throws AssignmentException
    {
        super(d, s, check);
    }

    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                try
                    {
                        return new AssignStreaming(m.modified(dest), m.modified(src));
                    }
                catch(AssignmentException a)     // System.out.println("modify assign failed due to "+a);
                    {
                    }
            }
        return this;
    }
    public String toString()
    {
        return "assignStreaming("+dest + "," + src+")";
    }
}