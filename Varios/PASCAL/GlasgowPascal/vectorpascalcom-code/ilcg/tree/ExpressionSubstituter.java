package ilcg.tree;

/**
 *  This substitutes all occurences of expression a with expression b
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class ExpressionSubstituter implements TreeModifier
{
    /**
     *  Description of the Field
     */
    public Node[] A, B;
    String []Astr=new String[1];
    public int done=0;

    /**
     *  Constructor for the ExpressionSubstituter object
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     */
    public ExpressionSubstituter(Node a, Node b)
    {
        A= new Node[1];
        B= new Node[1];
        A[0] = a;
        B[0] = b;
        Astr[0] = A[0].toString();
        // System.out.println("New Expressionsubstituter "+a+"->"+b);
    }
    public ExpressionSubstituter(Node[] a, Node[] b)
    {
        A  = a;
        B  = b;
        Astr=new String[a.length];
        for(int i=0; i<a.length; i++)Astr[i] = A[i].toString();
    }

    /**
     *  This is called each time a node is visited, but before any subtrees are
     *  visited. If it returns false the subtree below the node is not visited
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean visit(Node n)
    {
        if(n==null)return false;
        return visit(n,0);
    }
    public boolean visit(Node n,int i)
    {
        if(i>=A.length)return true;
        return (! eq(n,i))&&visit(n,i+1);
        //	return true;
    }
    boolean eq(Node n, int i)
    {
        //	System.out.println(pad+i+" "+Astr[i]+"=="+n);
        return n.toString().equals(Astr[i]);
    }
    String pad="";
    /**
     *  This returns the rewritten node n
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modified(Node n)
    {
        //	System.out.println(pad+"modify "+n+":"+n.getClass());
        String oldpad=pad;
        boolean found=false;
        int pos=0;
        Node res=n;
        if(n!=null)
            try
                {
                    for(int i=0; i<Astr.length; i++)
                        if(!found)
                            if(eq(n,i))
                                {
                                    done++;
                                    found=true;
                                    pos=i;
                                }
                    //	pad=pad+" ";
                    if(found) res=B[pos];
                    else res=n.modify(this);
                }
            catch(Exception ex)
                {
                    System.err.println("Error in modifying "+ex+ " n: "+n);
                    ex.printStackTrace();
                    // force an exception again
                    res=null;
                    res=res.eval();
                }
        //	if(found)System.out.println(pad+"yes");
        pad=oldpad;
        //	System.out.println(pad+"to "+res);
        return res;
    }
    /** return a new node in which all occurences of A in C are replaced by B */
    public static Node substituteAwithBinC(Node A, Node B, Node C)throws Exception
    {
        //System.out.println("substitute "+A+" with "+B+" in "+C);
        ExpressionSubstituter s=new ExpressionSubstituter(A,B);
        if(C==null)return null;
        C= C.modify(s);
        //System.out.println(" mapped to "+C);
        if(s.done==0)
            {
                String err="Serious error in code generator, attempt to substitute "+
                           A+" with \n"+B+" in \n"+C+"\n has failed, this can result in incorrect code being output";
                //System.out.println(err);
                //throw new SubstitutionException(err);
            }
        return C;
    }

}
//class SubstitutionException extends Exception{SubstitutionException(String err){super(err);}}
