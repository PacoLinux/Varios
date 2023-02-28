
//Title:        ilcg.tree.Goto
//Version:
//Copyright:    Copyright (c) 1999
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation representation of goto statements
package ilcg.tree;
import java.io.*;
import ilcg.SymbolTable;
/**
 *  Unconditional jump to label
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Goto implements Node, Control, Serializable
{
    /**
     *  Description of the Field
     */
    public Node l;
    public String sig()
    {
        return "->"+l.sig();
    }
    public int weight()
    {
        return 0;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    /**
     *  Constructor for the Goto object
     *
     *@param  lab  Description of Parameter
     */
    public Goto(Node lab)
    {
        l = lab;
    }

    public boolean matches(Node n)
    {
        if(n instanceof Goto)
            return l.matches(((Goto)n).l);
        return false;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(n instanceof Goto)
            return Pattern.matchPusingDtoC(l,  D, ((Goto)n).l);
        return false;
    }
    /**
     *  Gets the simple attribute of the Goto object
     *
     *@return    The simple value
     */
    public boolean isSimple()
    {
        return true;
    }


    /**
     *  writes label codeForGoto
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        l.toBinary(out);
        out.writeByte(codeForGoto);
    }



    /**
     *  Description of the Method
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                return new Goto(m.modified(l));
            }
        return this;
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
                if(l != null)
                    {
                        l.examine(e);
                    }
            }
        e.leave(this);
    }


    /**
     *  returns void
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return "void";
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
    public Node simplify()
    {
        return this;
    }


    /**
     *  Description of the Method
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
    public String toString()
    {
        return "goto(" + l+")";
    }
}
