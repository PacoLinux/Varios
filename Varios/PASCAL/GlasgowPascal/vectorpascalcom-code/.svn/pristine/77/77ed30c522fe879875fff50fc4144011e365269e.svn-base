package ilcg.tree;

import java.io.*;
import ilcg.*;
/** this class implements real literals in the expression tree */
public class Real extends Num implements Node,Serializable
{


    private double val;
    String rep=ieee64;
    public String sig()
    {
        if(val==0)return "L"+rep+val;
        if(val==1)return "L"+rep+val;
        return "L"+rep;
    }
    /** writes codeForIntlit double */
    public void toBinary(DataOutputStream out)throws IOException
    {
        out.writeByte(codeForReal);
        out.writeDouble(val);
    }



    public void examine(TreeExaminer e)
    {
        if(e.visit(this)) {}
        e.leave(this);
    }

    public Node modify(TreeModifier m)
    {
        return this;
    }
    public boolean equals(Node n)
    {
        if(!(n instanceof Num))
            return false;
        return val == ((Num)n).doubleValue();
    }
    public boolean matches(Node n)
    {
        return equals(n);
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }
    public  int intValue()
    {
        return (int) val;
    };
    public  long longValue()
    {
        return (long)val;
    };
    public  float floatValue()
    {
        return (float)val;
    };
    public double  doubleValue()
    {
        return val;
    };
    public String toString()
    {
        String s=" "+(val);
        if(!(s.contains(".")||s.contains("e")||s.contains("E")))s=s+".0";
        return s;
    }
    public String returnType()
    {
        return rep;
    }
    public Real(double v)
    {
        val=v;
        representation = ieee64;
    }
    public Real(String v)
    {
        val =Double.valueOf(v).doubleValue();
        representation = ieee64;
    }
    /** allows declaration of 32 bit reals */
    public Real(double d, String representation)
    {
        val=d;
        if(representation.equals(ieee32))rep = ieee32;
    }
}
