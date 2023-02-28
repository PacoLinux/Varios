package ilcg.tree;

/**
 *  finds memory dereferences in the tree
 *	Extracted as a separate compilation unit as exported
 *	by both Walker.java and Walker2.java
 * @author     wpc
 * @created    June 22, 2001
 */
public class CommonRHSFinder extends CommonSubExpressionFinder
{


    int optimiseThreshold  = 2;

    /**
     *  This is called after all subtrees have been visited
     *
     * @param  n  Description of Parameter
     */
    public void leave(Node n)
    {
        float count  = score(n);
        if(count > 0)
            {
                record(n);
            }
    }

    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     * @return    Description of the Return Value
     */
    public float score(Node n)
    {
        if(n == null)
            {
                return 0;
            }
        // if(!n.returnType().equals(Node.int32))return 0;
        if(n instanceof Deref)
            {
                return mscore(n);
            }
        if(n instanceof Dyad || n instanceof Monad)
            {
                return mscore(n);
            }
        if (n instanceof Label)
            {
                return   n.weight();
            }
        return 0;
    }


    int mscore(Node n)
    {
        if(n == null)
            {
                return 0;
            }
        if(n instanceof Cast)
            {
                return mscore(((Cast) n).subtree);
            }
        if(n instanceof Memref)
            {
                return mscore(((Memref) n).index) + 5;
            }
        if(n instanceof Deref)
            {
                Deref d  = (Deref) n;
                return mscore(d.arg);
            }
        if(n instanceof Monad)
            {
                Monad m  = (Monad) n;
                return mscore(m.arg) + 1;
            }
        if(n instanceof Dyad)
            {
                Dyad d   = (Dyad) n;
                int inc  = 1;
                if(d.O.Symbol.equals("<") || d.O.Symbol.equals(">")
                        || d.O.Symbol.equals("="))
                    {
                        inc = 4;
                    }
                else if(d.O.Symbol.startsWith("r"))
                    {
                        inc = 4;//  ranges have to be constructed in memory
                    }
                if(d.O.Symbol.equals("*"))
                    {
                        inc = 1;// was -1
                    }// dont optimise these as they can be done
                // in address expressions
                return mscore(d.left) + mscore(d.right) + inc;
            }
        return 0;
    }

}
