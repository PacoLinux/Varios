
// Title:        compiler toolbox
// Version:
// Copyright:    Copyright (c) 1998
// Author:       Paul Cockshott
// Company:      Faraday
// Description:  Compiler tools for mmx optimisation
package ilcg.tree;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Deref extends Monad implements java.io.Serializable
{

    /**
     *  a deref with an associated cast, you specify the type to be returned
     *
     *@param  n  Description of Parameter
     *@param  t  Description of Parameter
     */
    public Deref(Node n, String t)
    {
        arg = n;
        String rt = "ref " + t;
        oper = new Op("^", rt, rt, t);
        eval();
    }

    public Node eval()
    {
        arg = arg.eval();
        return this;
    }

    /**
     *  in this case n must be a ref type, i.e., must start with string "ref ". The
     *  type returned is the dereferenced type, ref t goes to t .
     *
     *@param  n  Description of Parameter
     */
    public Deref(Node n)
    {
        arg = n;
        String t = n.returnType();
        String returns = Format.typeDeref(t);
        // removew the "ref " from type
        oper = new Op("^", t, t, returns);
        eval();
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
                try
                    {
                        Node res = new Deref(m.modified(arg));
                        //  System.out.println("Deref.modify "+toString()+"\nto "+res);
                        return res;
                    }
                catch(Exception ex)
                    {
                        System.out.println("Deref.modify "+ex.toString()+
                                           ", arg="+arg);
                        ex.printStackTrace();
                        System.exit(1);
                    }
            }
        return this;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        String at = arg.returnType();
        String ret = Format.typeDeref(at);
        // System.out.println("argtype="+at+" after deref "+ret);
        return ret;
    }
}
