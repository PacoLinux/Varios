package ilcg.tree;


import java.util.*;
import java.io.*;
import ilcg.*;

/**
 *  Models a cartesian product of values e.g. a record initialisor or procedure
 *  parameter list
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Cartesian implements Node, Serializable
{
    String returns;
    String stringval;

    private Vector params;
    public void append(Node n)
    {
        params.add(n);
        Cartesian n1 = new Cartesian(params);
        stringval =n1.stringval;
    }
    public boolean matches(Node n)
    {
        if(n instanceof Cartesian)
            {
                Cartesian c= (Cartesian)n;
                if(c.argc()!=argc())return false;
                for(int i=0; i<argc(); i++)
                    {
                        if(!argi(i).matches(c.argi(i))) return false;
                    }
                return true;
            }
        return false;
    }
    public boolean matches(Node n, SymbolTable D)
    {
        return matches(n);
    }
    /**
     *  args pushed left to right, callee pops args
     */
    public final static int PascalCall = 0;

    /**
     *  args pushed right to left caller pops args
     */
    public final static int CCall = 1;
    public int weight()
    {
        return params.size();
    }
    public int[] weights()
    {
        int [] sum = {0};
        for(Object e :params)
            sum = Dyad.sumv(sum, ((Node)e).weights());
        return sum;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    /**
     *  Constructor for the Cartesian object
     */
    public Cartesian()
    {
        params = new Vector();
        returns = "[]";
        stringval = "[]";
    }

    /**
     *  Constructor for the Cartesian object
     *
     *@param  args  Description of Parameter
     */
    public Cartesian(Vector args)
    {
        params = args;
        returns = "[";
        stringval = "[";
        int n = params.size();
        for(int i = 0; i < n; i++)
            {
                Node N = (Node) args.elementAt(i);
                returns = returns + (N).returnType();
                stringval = stringval + N;
                if(i < n - 1)
                    {
                        returns = returns + ",";
                        stringval = stringval + ",";
                    }
            }
        returns = returns + "]";
        stringval = stringval + "]";
    }

    /**
     *  number of arguments
     *
     *@return    Description of the Returned Value
     */
    public int argc()
    {
        return params.size();
    }

    /**
     *  returns an argument
     *
     *@param  i  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node argi(int i)
    {
        return (Node) params.elementAt(i);
    }

    /**
     *  writes: params count codeForCartesian
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        int len = params.size();
        for(int i = 0; i < len; i++)
            {
                ((Node) params.elementAt(i)).toBinary(out);
            }
        (new Int(len)).toBinary(out);
        out.writeByte(codeForCartesian);
    }

    /**
     *  returns whatever the function called returns
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return returns;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        Vector v = new Vector(0);
        for(Iterator i = params.iterator(); i.hasNext();)
            {
                Object o = i.next();
                v.add(((Node) o).eval());
            }
        return new Cartesian(v);
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
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                Vector v = null;
                if(params != null)
                    {
                        v = new Vector();
                        for(int i = 0; i < params.size(); i++)
                            {
                                v.addElement(m.modified((Node) params.elementAt(i)));
                            }
                    }
                return new Cartesian(v);
            }
        return this;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        return stringval;
    }

    public String sig()
    {
        return toString();
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
                for(int i = 0; i < params.size(); i++)
                    {
                        Object n = params.elementAt(i);
                        if(n != null)
                            {
                                ((Node) n).examine(e);
                            }
                    }
            }
        e.leave(this);
    }

}
