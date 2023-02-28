package ilcg.tree;
import java.io.*;
import java.util.*;
import ilcg.*;
public class Statement implements Node,Serializable,Annotated
{
    public Node action;
    public Statement next=null;
    Memref localvar=null;
    public int line=-1;
    Object [] annotation=null;
    public void setAnnotation(Object[]an)
    {
        annotation=an;
    }
    public Object[] getAnnotation()
    {
        return annotation;
    }

    /** true if there is a variable local to the action of the statement which is suitable for register
    caching */
    Node cost(Node p)
    {
        if(p==null) return new Real(0);
        return p.getCost();
    }
    public Node getCost()
    {
        try
        {
            return new Dyad(cost(action),cost(next),"+");
        }
        catch(Exception e)
        {
            return new Int(1);
        }
    }
    public boolean hasLocal()
    {
        return localvar !=null;
    }
    public Memref getLocal()
    {
        return localvar;
    }
    public void setLocal(Memref l)
    {
        localvar=l;
    }
    public int weight()
    {
        int wn = (next!=null?next.weight():0);
        int wa = (action!=null?action.weight():0);
        return (wn>wa?wn:wa);
    }
    public int[] weights()
    {
        int[] nullw= {0};
        int[] wn = (next!=null?next.weights():nullw);
        int[] wa = (action!=null?action.weights():nullw);
        int wlen = wn.length<wa.length?wa.length:wn.length;
        int []ws = new int [wlen];
        wa=Dyad.extend(wa,wlen);
        wn=Dyad.extend(wn,wlen);
        for(int i=0; i<wlen; i++)
            ws[i]= (wn[i]>wa[i]?wn[i]:wa[i]);
        return ws;
    }
    /** writes var action next codeForStatement */
    public void toBinary(DataOutputStream out)throws IOException
    {
        Loader.toBinary(out,action);
        Loader.toBinary(out,next);
        out.writeByte(codeForStatement);
    }
    /** return a vector of the statement actions rooted at this point */
    public Vector linearise(Dictionary d)
    {
        Vector V=new Vector();
        traverse(this,V,d);
        return V;
    }
    void traverse(Statement s,Vector acc, Dictionary d)
    {
        // if(s.line>0)Walker.notifier.done("traverse line ",s.line);
        if(s.action instanceof Statement)
        {
            traverse((Statement)s.action,acc,d);
        }
        else
        {
            if(s.action !=null)
            {
                acc.add(s.action);
                if(s.line>0) d.put(s.action, new Integer(s.line));
            }
        }
        if(s.next!=null)traverse(s.next,acc,d);
    }
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
        {
            if(action!=null)action.examine(e);
            if(next!=null)next.examine(e);
        }
        e.leave(this);
    }
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
        {
            Statement s= new Statement((action==null?null:m.modified(action)),
                                       (next==null?null:(Statement)m.modified(next)),line,
                                       getLocal() // null//m.modified(getLocal())
                                      );
            s.setAnnotation(getAnnotation());
            return s;
        }
        return this;
    }
    public boolean equals(Node n)
    {
        if(n==null) return false;
        if(!(n instanceof Node))
            return false;
        Statement s = (Statement)n;
        return action.equals(s.action)&&next.equals(s.next);
    }
    public boolean matches(Node n)
    {
        if(n==null) return false;
        if(!(n instanceof Node))
            return false;
        Statement s = (Statement)n;
        return action.matches(s.action)&&next.matches(s.next);
    }
    public boolean matches(Node n, SymbolTable D)
    {
        return matches(n);
    }
    public boolean knownAtCompileTime()
    {
        return false;
    }
    boolean nullable(Node n)
    {
        if(n == null) return true;
        if(n instanceof Statement)
        {
            Statement nn=(Statement)n;
            return nullable(nn.action)&& nullable(nn.next);
        }
        return false;
    }
    public Node eval()
    {
        Statement trav= this;
        if(hasLocal())
            if(action instanceof Statement)
                if(((Statement) action).hasLocal())
                    if(((Statement)action).getLocal().equals(getLocal()))
                        ((Statement)action).localvar=null;// dont allow the same variable to be local to an internally nested block
        // this just prunes unecessary declarations of local vars
        while(trav!=null)
        {
            if(nullable(trav.action))trav.action=null;
            if(trav.action != null)
            {
                trav.action=trav.action.eval();
            }
            if(nullable(trav.next))trav.next=null;
            trav= trav.next;
        }
        if(nullable(next))next=null;
        if(action==null)
        {
            if(next!=null) return next;
        };
        if(action!=null)
        {
            // if (next==null&&! hasLocal()) return action.eval();// this was deleted may have to again
            if(action instanceof Statement)
            {
                Statement a=(Statement)action;
                if(a.action==null && a.next==null)
                {
                    action=null;
                }
                else if(a.next==null&& ! a.hasLocal()) action= a.action.eval();
            }
        }
        if(next!=null)
        {
            {
                if(next.action==null && next.next==null)
                {
                    next=null;
                }
            }
        }
        return this;
    }

    public String returnType()
    {
        return "void";
    }
    public Statement()
    {
        action=null;
        next=null;
    }
    public Statement(Node n)
    {
        action=n;
    }
    public Statement(Node n, Statement s)
    {
        action=n;
        next=s;
        //  if (next!=null)next=(Statement)next.eval();
        // System.out.println("in Statement:"+this);
    }
    public Statement(Node n,Statement s, int lineno)
    {
        action =n;
        line=lineno;
        next=s;
    }
    public Statement(Node n,Statement s, Memref loc)
    {
        action =n;
        next=s;
        localvar=loc;
    }
    public Statement(Node n,Statement s, int lineno,Memref loc)
    {
        action =n;
        line=lineno;
        next=s;
        localvar=loc;
    }
    static String nest="\t";
    public String toString()
    {
        String form="" ;

        String nested=nest;

        Statement s=this;
        //if(form.equals(""))
        {
            StringBuffer lstr=new StringBuffer("");
            int count=0;

            {

                if(s.line>=0)lstr.append("/* "+s.line+" */");
                if(localvar!=null)
                {   lstr.append("{"+nest+"local var "+localvar+";\n") ;
                    count++;
                    if(nest.length()<100)nest=nest+" ";

                }
                if(s.action !=null) lstr.append(nest+s.action);



                if(s.next !=null) lstr.append(";\n"+s.next);
            }
            for(int z=0; z<count; z++)lstr.append("}");
            form=lstr.toString();
            if(annotation!=null)
                form="/*"+annotation[0]+"*/\n"+form;
        }
        nest=nested;
        return form;
    }



    public String sig()
    {
        String thesig="";
        if(thesig=="")thesig=(action==null?"":action.sig())+";"+
                                 (next==null?"":next.sig());
        return thesig;
    }


}
