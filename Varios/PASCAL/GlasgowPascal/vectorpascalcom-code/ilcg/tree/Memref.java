
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  Your description


package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Memref implements Node, Cloneable, java.io.Serializable
{

    /**
     *  Description of the Field
     */
    public Node index;
    public String retType;

    String signed =null;
    public String sig()
    {
        if(signed==null)signed=
                "M["+index.sig()+retType;
        return signed;
    }
    public int weight()
    {
        int w=index.weight();
        return (w<1?1:w);
    }
    public int[] weights()   // return a vector with one non zero element for the index type
    {
        String it = index.returnType();
        int ic = Format.getCode(it);
        int w=index.weight();
        int wlen =  ic+1 ;
        int[]ws = new int[wlen];
        ws[ic]= (w<1?1:w);
        return ws;
    }
    public Node getCost()
    {
        return  new Dyad(index.getCost(), new Real(1),"+").eval();
    }
    /**
     *  Constructor for the Memref object
     *
     *@param  indx     Description of Parameter
     *@param  returns  Description of Parameter
     */
    public Memref(Node indx, String returns)
    {
        if(!returns.startsWith("ref"))
            {
                returns = "ref " + returns;
            }
        retType = returns;
        index = indx;
    }


    /**
     *  Create one of the same type as orig but new index
     *
     *@param  orig  Description of Parameter
     *@param  indx  Description of Parameter
     */
    public Memref(Memref orig, Node indx)
    {
        index = indx;
        retType = orig.retType;
    }


    /**
     *  the default reference = nil = address 0
     */
    public Memref()
    {
        index = new Int(0);
        retType = Node.octet;
    }


    /**
     *  writes retType index codeForMemref
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        Loader.toBinary(out, retType);
        index.toBinary(out);
        out.writeByte(codeForMemref);
    }


    /**
     *  uses a tree modifier to rewrite the node
     *
     *@param  m  the modifier
     *@return     the Returned node
     */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                return new Memref(m.modified(index), retType);
            }
        return this;
    }


    /**
     *  examine node used by tree walkers
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                if(index != null)
                    {
                        index.examine(e);
                    }
            }
        e.leave(this);
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object n)
    {
        if(n instanceof Memref)
            {
                return index.equals(((Memref) n).index);
            }
        return false;
    }

    public boolean matches(Node n)
    {
//	System.out.println("match ("+n+")");
        if(n instanceof Memref)
            {
                if(!Format.castIsSafe(retType,(n.returnType()))) return false;
                return index.matches(((Memref) n).index);
            }
        return false;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        //	System.out.println("Match with dictionary "+n+retType+n.returnType());
        if(n instanceof Memref)
            {
                if(!Format.castIsSafe(retType,(n.returnType()))) return false;
                return Pattern.matchPusingDtoC(index,  D, ((Memref) n).index);
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
        return "mem("+index+"," +  retType + ")";
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
    public Node eval()
    {
        index = index.eval();
        return this;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return retType;
    }
}
