package ilcg.tree;

/**
 *  Used to search for memory references that can be substituted with register
 *  references
 *	Extracted as a separate compilation unit as exported both in Walker.java
 *	and Walker2.java
 * @author     wpc
 * @created    June 22, 2001
 */

public class CommonMemExpressionFinder extends CommonSubExpressionFinder
{


    /**
     *  This is called after all subtrees have been visited
     *
     * @param  n  Description of Parameter
     */
    public void leave(Node n)
    {
        if(n instanceof Memref)
            {
                record(n);
            }
    }

}