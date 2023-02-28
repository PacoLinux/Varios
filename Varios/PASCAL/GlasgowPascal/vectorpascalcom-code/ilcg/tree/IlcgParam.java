package ilcg.tree;
/** This is a class that represents a parameter in the grammar of the
    ilcg

Author Paul Cockshott
Copyright University of Glasgow */

import java.io.*;
import java.util.*;
import ilcg.*;
public class IlcgParam implements Node,Serializable
{
    public String name="";
    public Node paramtype;
    public int paramnum=0;
    public IlcgParam(String s, Node type, int pos)
    {
        name=s;
        paramtype=type;
        paramnum=pos;
    }
    public String returnType()
    {
        if(paramtype==null)return "void";
        try
            {
                return paramtype.returnType();
            }
        catch(Exception e)
            {
                System.err.println("error calling paramtype.returnType() in IlcgParam "+e);
                return "void";
            }
    }
    public void toBinary(DataOutputStream out) throws IOException
    {
        paramtype.toBinary(out);
        out.writeByte(codeForIlcgParam);
    }
    public boolean matches(Node n)
    {
        System.out.println("\t"+n+"\t"+name+":"+paramtype+"::"+paramtype.getClass());
        if(equals(n)) return true;
        return (paramtype.matches(n));
    }
    public boolean matches(Node n, SymbolTable D)
    {
        System.out.println("\t"+n+"\t"+name+":"+paramtype+"::"+paramtype.getClass());
        if(equals(n)) return true;
        return (Pattern.matchPusingDtoC(paramtype,  D, n));
    }
    public Node modify(TreeModifier m)
    {
        return this;
    }
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                paramtype.examine(e);
            }
        e.leave(this);
    }
    public int weight()
    {
        return 0;
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    public Node eval()
    {
        return this;
    }
    public String sig()
    {
        return name;
    }
    public boolean knownAtCompileTime()
    {
        return false;
    }
    public String toString()
    {
        return name;
    }
}
