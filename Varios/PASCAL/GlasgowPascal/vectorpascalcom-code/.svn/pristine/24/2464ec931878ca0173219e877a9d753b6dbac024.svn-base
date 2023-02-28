
//Title:        ilcg.tree.Label
//Version:
//Copyright:    Copyright (c) 1999
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation representation of Labels
package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Label implements Node, Serializable
{
    public String labval = "label" + java.lang.Long.toString(System.currentTimeMillis(), 16) +
                           java.lang.Integer.toString(labcount++, 16);
    // generate a unique label
    static int labcount = 1;
    public boolean matches(Node n)
    {
        return n instanceof Label;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }
    public Label()
    {
        labcount++;
    }
    public Label(String s)
    {
        labval=s;
    }
    public String sig()
    {
        return "LAB";
    }
    public int weight()
    {
        return 1;
    } public int[] weights()
    {
        int[] nullw= {1};
        return nullw;
    }
    public Node getCost()
    {
        return new Int(weight());
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
     *  writes hashcodeofLabelasInteger codeForPlantLab
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        (new Int(hashCode())).toBinary(out);
        out.writeByte(codeForPlantLab);
    }


    /**
     *  Simply return the label un modified
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        return this;
    }


    /**
     *  We assume that addresses are 32 bits long, override this for 64 bit
     *  implementations
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return Format.addressType;
    }


    /**
     *  not known at compile time, only at assembly time
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return false;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        return this;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        return labval;
    }
}
