package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Int extends Num implements  Node, java.io.Serializable
{
    /**
     *  This class implements integer literals in the expression tree
     */

    long val;


    /**
     *  Constructor for the Int object
     *
     *@param  l  Description of Parameter
     */
    public Int(long l)
    {
        val = l;
        representation = int64;
    }

    public boolean matches(Node n)
    {
        return equals(n);
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }

    /**
     *  Constructor for the Int object
     */
    public Int()
    {
        val = 0;
        representation = int32;
    }


    /**
     *  Constructor for the Int object
     *
     *@param  l    Description of Parameter
     *@param  rep  Description of Parameter
     */
    public Int(long l, String rep)
    {
        val = l;
        representation = rep;
        if(Format.isReal(rep))representation=Node.int32;
        int len=Format.lengthInBits(representation);
        if(len==32)val = (int)val;
        else if(len==16) val =(short)val;
        else if(len==8) val= (byte)val;
    }
    public String sig()
    {
        if(val>= -16 && val<16)return "L"+val+representation;
        return "LI"+representation.charAt(0)+representation.charAt(representation.length()-1);
    }

    /**
     *  Constructor for the Int object
     *
     *@param  i  Description of Parameter
     */
    public Int(int i)
    {
        val = i;
        representation = int32;
    }


    /**
     *  Constructor for the Int object
     *
     *@param  s  Description of Parameter
     */
    public Int(String s)
    {
        val = Long.parseLong(s);
        if(Math.abs(val) >= java.lang.Integer.MAX_VALUE)
            {
                if((val > 0) && (val < 0xffffffff))
                    {
                        representation = uint32;
                    }
                else
                    {
                        representation = int64;
                    }
            }
        else
            {
                representation = int32;
            }
    }


    /**
     *  writes codeForIntlit longint
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        out.writeByte(codeForintlit);
        out.writeLong(val);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public int hash()
    {
        return (int) val;
    }


    /**
     *  Description of the Method
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
            }
        e.leave(this);
    }


    /**
     *  Simply return the integer un modified
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        return this;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public int intValue()
    {
        return (int) val;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public long longValue()
    {
        return (long) val;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public float floatValue()
    {
        return (float) val;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public double doubleValue()
    {
        return val;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Node n)
    {
        if(n instanceof Num)
            {
                return (double) val == ((Num) n).doubleValue();
            }
        return false;
    }


    /**
     *  returns the decimal integer packed into a field dependent on its byte length of represenation.
     * This ensures that the string representation of a byte integer differs from that of a 32 bit integer etc
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        int len=Format.lengthInBytes(representation);
        String discriminant="";
        for(int i=0; i<len; i++)discriminant=discriminant+" ";
        return discriminant+Long.toString(val) ;
    }
}
