package ilcg.tree;
/** converts a procedure to a monadic operator */
public class Function extends Op implements java.io.Serializable
{
    public Procedure proc=null;
    Node address =null; // for dynamic functions
    public Node getCost()
    {
        return new Real(100);
    }
    public Function(Node base, String ptype, String rettype)
    {
        address=base;
        Symbol="procedure variable";
        Left=ptype;
        Returns = rettype;
    }
    public Function(Procedure p)
    {
        proc=p;
        Symbol=proc.name;
        Left=proc.paramtype;
        Returns=proc.getResult();
    }
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                if(proc!=null)proc.examine(e);
            }
        e.leave(this);
    }
}
