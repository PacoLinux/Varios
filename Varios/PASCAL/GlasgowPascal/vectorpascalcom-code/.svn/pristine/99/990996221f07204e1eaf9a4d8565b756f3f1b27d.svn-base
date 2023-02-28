package ilcg.tree;
/** This is a class that represents a alternative in the ilcg grammar

Author Paul Cockshott
Copyright University of Glasgow */

import java.io.*;
import java.util.*;
public class Alternative implements Node,Serializable
{
    Vector alts;
    public Alternative(Vector a)
    {
        alts=a;
    }
    public int numAlts()
    {
        return alts.size();
    }
    public Node getAlt(int i)
    {
        return (Node)alts.elementAt(i);
    }
    public String returnType()
    {
        Object[]a = alts.toArray();
        String s="";
        for(int i=0; i<a.length; i++)
            {
                s=s+((Node)a[i]).returnType();
                if(i<a.length-1)s=s+"|";
            }
        return s;
    }
    public String toString()
    {
        Object[]a = alts.toArray();
        String s="means[";
        for(int i=0; i<a.length; i++)
            {
                s=s+((Node)a[i]);
                if(i<a.length-1)s=s+"|";
            }
        return s+"]";
    }
    public void toBinary(DataOutputStream out) throws IOException
    {
        Object[]a = alts.toArray();
        for(int i=0; i<a.length; i++)
            {
                ((Node)a[i]).toBinary(out);
            }
        out.writeInt(a.length);
        out.writeByte(codeForAlternative);
    }
    public Node modify(TreeModifier m)
    {
        Vector v = new Vector(0);
        if(m.visit(this))
            {
                Object[]a = alts.toArray();
                for(int i=0; i<a.length; i++)
                    {
                        v.add(m.modified((Node)a[i]));
                    }
                return new Alternative(v);
            }
        return this;
    }
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                Object[]a = alts.toArray();
                for(int i=0; i<a.length; i++)
                    {
                        ((Node)a[i]).examine(e);
                    }
            }
        e.leave(this);
    }
    public int weight()
    {
        return 0;
    }
    public Node eval()
    {
        return this;
    }
    public String sig()
    {
        return "Alternative";
    }
    public boolean knownAtCompileTime()
    {
        return false;
    }

}
