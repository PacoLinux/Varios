
//Title:        ilcg.tree.Goto
//Version:
//Copyright:    Copyright (c) 1999
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation representation of interrupt statements
package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Unconditional jump to label
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Fail implements Node, Control, Serializable
{
    /**
     *  the interrupt vector or label
     */
    public Node l;
    public boolean matches(Node n)
    {
        if(equals(n)) return true;
        if(n instanceof Fail)
            {
                return	l.matches(((Fail)n).l);
            }
        return false;
    }

    public Node getCost()
    {
        return new Real(weight());
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }
    /**
     *  Constructor for the Fail object
     *
     *@param  lab  interrupt to invoke on failure
     */
    public Fail(Node lab)
    {
        l = lab;
    }
    public int weight()
    {
        return 0;
    } public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
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
                return new Fail(m.modified(l));
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
        return "Fail(" + l+")";
    }
    public String sig()
    {
        return "intr"+l.sig();
    }
}
