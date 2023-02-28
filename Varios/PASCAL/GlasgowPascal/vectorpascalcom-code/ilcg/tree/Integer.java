package ilcg.tree;
import java.io.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Integer extends Int implements Node,Serializable
{
    /**
     *  This class implements integer literals in the expression tree
     */

    long val;


    /**
     *  Constructor for the Integer object
     *
     *@param  l  Description of Parameter
     */
    public Integer(long l)
    {
        val = l;
        representation = int64;
    }
    public String sig()
    {
        if(val>= -16 && val<16)return "L"+val+representation;
        return "LI"+representation.charAt(0)+representation.charAt(representation.length()-1);
    }


    /**
     *  Constructor for the Integer object
     */
    public Integer()
    {
        val = 0;
        representation = int32;
    }


    /**
     *  Constructor for the Integer object
     *
     *@param  l    Description of Parameter
     *@param  rep  Description of Parameter
     */
    public Integer(long l, String rep)
    {
        val = l;
        representation = rep;
        if(Format.isReal(rep))representation=Node.int32;
    }


    /**
     *  Constructor for the Integer object
     *
     *@param  i  Description of Parameter
     */
    public Integer(int i)
    {
        val = i;
        representation = int32;
    }


    /**
     *  Constructor for the Integer object
     *
     *@param  s  Description of Parameter
     */
    public Integer(String s)
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
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        return Long.toString(val);
    }
}
