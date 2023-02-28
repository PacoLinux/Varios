package ilcg.tree;
/** This is used to remove array subscriptions held in a form specific to the pascal
compiler to generic memrefs that the codegenerator can optimse.*/
public class SubscriptionRemover implements TreeModifier
{
    /** This is called each time a node is visited, but before any subtrees are visited. If it returns
         false the subtree below the node is not visited */
    public boolean visit(Node n)
    {
        return true;
    }

    /** This returns the rewritten node n */
    public Node modified(Node n)
    {
        if(n instanceof Memref)
            {
                return new Memref(((Memref)n).index,((Memref)n).retType);
            }
        else return n.modify(this);
    }

}
