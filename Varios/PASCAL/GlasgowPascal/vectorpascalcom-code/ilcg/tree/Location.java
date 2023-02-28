
//Title:        ilcg.tree.Location
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  storage location representation


package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  storage location representation
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Location implements Node, Serializable
{
    Node subtree;
    public String sig()
    {
        return "LOC"+subtree.sig();
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(!(n instanceof Location)) return false;
        return Pattern.matchPusingDtoC(subtree,  D, ((Location)n).subtree);
    }
    public boolean matches(Node n)
    {
        if(!(n instanceof Location)) return false;
        return subtree.matches(((Location)n).subtree);
    }

    /**
     *  Constructor for the Location object
     *
     *@param  n  Description of Parameter
     */
    public Location(Node n)
    {
        subtree = n;
    }

    public int weight()
    {
        return subtree.weight();
    } public Node getCost()
    {
        return new Real(weight());
    }
    public int[] weights()
    {
        return subtree.weights();
    }
    /**
     *  Gets the subtree attribute of the Location object
     *
     *@return    The subtree value
     */
    public Node getSubtree()
    {
        return subtree;
    }


    /**
     *  writes subtree codeForLocation
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        subtree.toBinary(out);
        out.writeByte(codeForLocation);
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
                if(subtree != null)
                    {
                        subtree.examine(e);
                    }
            }
        e.leave(this);
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
                return new Location(m.modified(subtree));
            }
        return this;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object n)
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
        return " loc(" +  subtree+")";
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return subtree.knownAtCompileTime();
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        subtree = subtree.eval();
        return this;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return "ref " + subtree.returnType();
    }
}
