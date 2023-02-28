
//Title:        compiler toolbox
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Compiler tools for mmx optimisation
package ilcg.tree;

/**
This operation represents the return of a value from a function.
It typicall assigns its argument to a register and then jumps to the
exit label.
 */


public class Return extends Monad implements java.io.Serializable
{
    /** the label retlab is the exit point of the procedure */
    public Label retlab;
    /** in this case n must be a ref type, i.e., must start with string "ref ".
       The type returned is the dereferenced type, ref t goes to t .*/
    public Return(Node n)
    {
        arg=n;
        String t= n.returnType();
        oper = new Op("ret",t,t,"void");
    }
    public Node eval()
    {
        return this;
    }
    /**
     *  applies the modifier to the argument
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                return new Return(m.modified(arg));
            }
        return this;
    }

}
