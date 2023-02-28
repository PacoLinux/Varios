
// Title:        ilcg.tree.Block
// Version:
// Copyright:    Copyright (c) 1998
// Author:       Paul Cockshott
// Company:
// Description:  storage location representation


package ilcg.tree;


import java.io.*;
import ilcg.*;

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Block implements Node, Serializable
{

    /**
     *  Description of the Field
     */
    public LocalStoreAllocator alloc;
    public Node subtree = new Statement(null);
    public int weight()
    {
        return subtree.weight();
    }
    public int [] weights()
    {
        return subtree.weights();
    }
    public Node getCost()
    {
        return subtree.getCost();
    }
    /**
     *  Constructor for the Block object
     */
    public Block()
    {
        subtree = new Statement();
        alloc = new LocalStoreAllocator(-1, 0);
    }

    /**
     *  Create a block with an area of store to hold temp vars
     *
     *@param  n  Description of Parameter
     *@param  l  Description of Parameter
     */
    public Block(Node n, LocalStoreAllocator l)
    {
        alloc = l;
        subtree = n;
    }

    /**
     *
     *
     *@return    The subtree value
     */

    public Node getSubtree()
    {
        return subtree;
    }
    public void setSubtree(Node n)
    {
        subtree=n;
    }

    /**
     *  writes: subtree allocator codeForBlock
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        alloc.toBinary(out);
        subtree.toBinary(out);
        out.writeByte(codeForBlock);
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
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object n)
    {
        return false;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }
    public boolean matches(Node n)
    {
        return equals(n);
    }
    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        return " begin " + subtree + " end ";
    }

    public String sig()
    {
        return "{" + (subtree == null ? "" : subtree.sig());
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
                return new Block(m.modified(subtree), alloc);
            }
        return this;
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
