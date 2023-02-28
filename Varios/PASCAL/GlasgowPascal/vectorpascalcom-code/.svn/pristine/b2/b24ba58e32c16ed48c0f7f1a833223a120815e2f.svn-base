

//Title:        ilcg.tree.For
//Version:
//Copyright:    Copyright (c) 1999
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation
package ilcg.tree;
import java.io.*;
import java.util.*;
import ilcg.*;
/**
 *  Implements a for loop of the form for inductionVariable = start to finish
 *  step do action
 *
 *@author     wpc
 *@created    June 21, 2001
 */



public class For implements Node, Control, Serializable
{
    /** true if loop invariants are moved outside loop do not set true for now */
    public static   boolean optimiseon=true;
    /**
     *   Should hold access path to the induction variable
     */
    public Node inductionVariable;
    /* true if loops are unrolled before code generation */
    public static  boolean loopunroll=false;
    public boolean unrollthis=true;
    /**
     *  Description of the Field
     */
    static final int unrollfactor =4;
    public Node start, finish, step, action;
    public boolean matches(Node n)
    {
        if(n instanceof For)
            {
                For f=(For)n;
                return start.matches(f.start)&&
                       finish.matches(f.finish)&&
                       step.matches(f.step)&&
                       action.matches(f.action);
            }
        return false;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(n instanceof For)
            {
                For f=(For)n;
                return Pattern.matchPusingDtoC(start,  D,  f.start)&&
                       Pattern.matchPusingDtoC(finish,  D,  f.finish)&&
                       Pattern.matchPusingDtoC(step,  D,  f.step)&&
                       Pattern.matchPusingDtoC(action,  D,  f.action) ;
            }
        return false;
    }
    public int weight()
    {
        return 0;
    } public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    Node cost(Node p)
    {
        if(p==null) return new Real(0);
        return p.getCost();
    }
    public Node getCost()
    {
        if(start.knownAtCompileTime()&& finish.knownAtCompileTime()&& step.knownAtCompileTime())
            {
                return new Dyad(cost(action),
                                new Dyad(new Dyad(finish,start,"-"),step,divide),"*");
            }
        return new Dyad(cost(action),new Int(16),"*");
    }
    void enforceTypes()
    {
        String rt= inductionVariable.returnType();
        String t = Format.typeDeref(rt);
        start=enforceType(t,start);
        finish=enforceType(t,finish);
        step=enforceType(t,step);
    }
    Node enforceType(String t, Node n)
    {
        if(n.returnType().equals(t))return n;
        return new Cast(t,n);
    }

    /**
     *  Convert into the form: i= start l1: if step > 0 then if i > finish then
     *  goto l2; else if i<finish then goto l2; action; i:= i+step goto l1; l2:
     */
    private Node simple = null;


    /**
     *  Constructor for the For object
     *
     *@param  var         Description of Parameter
     *@param  begin       Description of Parameter
     *@param  end         Description of Parameter
     *@param  stepsize    Description of Parameter
     *@param  processing  Description of Parameter
     */
    public For(Node var, Node begin, Node end, Node stepsize, Node processing)
    {
        start = begin.eval();
        finish = end.eval();
        inductionVariable = var;
        step = stepsize.eval();
        enforceTypes();
        action = processing.eval();
        //  System.out.println("in for constructor "+this);
        while(singleton(action))
            {
                Statement a=(Statement)action;
                action=a.action;
            }
    }
    static boolean singleton(Node ac)
    {
        if(ac instanceof Statement)
            {
                Statement a=(Statement)ac;
                if(a.next==null && ! a.hasLocal())return true;
            }
        //	System.out.println("in for singleton , test is false");
        return false;
    }

    /**
     *  Gets the simple attribute of the For object
     *
     *@return    The simple value
     */
    public boolean isSimple()
    {
        return false;
    }


    /**
     *  writes var start finish step action codeForFor
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        inductionVariable.toBinary(out);
        start.toBinary(out);
        finish.toBinary(out);
        step.toBinary(out);
        action.toBinary(out);
        out.writeByte(codeForFor);
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
                if(inductionVariable != null)
                    {
                        inductionVariable.examine(e);
                    }
                if(start != null)
                    {
                        start.examine(e);
                    }
                if(finish != null)
                    {
                        finish.examine(e);
                    }
                if(step != null)
                    {
                        step.examine(e);
                    }
                if(action != null)
                    {
                        action.examine(e);
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
                return new For(m.modified(inductionVariable),
                               m.modified(start), m.modified(finish),
                               m.modified(step), m.modified(action));
            }
        return this;
    }
    boolean neverexecuted()
    {
        // this is true if the finish less than the start with a positive step
        if(start instanceof Int&&finish instanceof Int&&step instanceof Int)
            {
                long Start=((Int)start).longValue();
                long Stop=((Int)finish).longValue();
                long Step=((Int)step).longValue();
                if(Step>0) if(Start>Stop) return true;
                if(Step<0) if(Start<Stop) return true;
            }
        return false;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node simplify()
    {
        String t="";
        try
            {
                //	System.out.println("Simplify "+toString());
                try
                    {
                        if(simple != null)
                            {
                                return simple;
                            }
                        if(neverexecuted())return new Statement(null);
                        Node i = inductionVariable;
                        Node di=new Deref(i);
                        Node nexti;
                        t = di.returnType();
                        Op addop;
                        LabelFinder lf= new LabelFinder();
                        action.examine(lf);// do this to make sure that we only expand inner loops
                        //	if(lf.found)System.out.println("control statements in "+action);
                        Node inc = new Assign(i,nexti= new Dyad(di, step,addop= Op.sum(t, t, t)));
                        int unrollused=1;
                        boolean unrolled=false;
                        if(start instanceof Int&&finish instanceof Int&&step instanceof Int)
                            {
                                long Start=((Int)start).longValue();
                                long Stop=((Int)finish).longValue();
                                long Step=((Int)step).longValue();
                                int unroll=unrollfactor;
                                boolean even = (Step>0?((((Stop-Start+1)/Step)%unroll)==0)&&(!(Start==Stop))
                                                :((((Stop-Start)/Step+1)%unroll)==0)&&(!(Start==Stop)));
                                while(!even&&(unroll>=2))
                                    {
                                        unroll=unroll-1;
                                        even = (Step>0?((((Stop-Start+1)/Step)%unroll)==0)&&(!(Start==Stop))
                                                :((((Stop-Start)/Step+1)%unroll)==0)&&(!(Start==Stop)));
                                    }
                                try
                                    {
                                        if(even&&loopunroll&&lf.found==false&&unrollthis)
                                            {
                                                //System.out.println("even for loop, unroll\n"+toString()+"\n unroll="+unroll+" Start="+Start+" stop="+Stop+" step="+Step);
                                                Node newaction=action;
                                                Node succ_i=di;
                                                for(int j=1; j<unroll; j++)
                                                    {
                                                        succ_i=new Dyad(succ_i, step,addop= Op.sum(t, t, t))	;
                                                        Node variant=ExpressionSubstituter.substituteAwithBinC(di,succ_i,action);
                                                        newaction=new Statement(newaction,
                                                                                new Statement(variant));
                                                    }
                                                action=newaction;
                                                //	System.out.println(toString());
                                                unrollused=unroll;
                                                unrolled=true;
                                                inc = new Assign(i,nexti= new Dyad(di, new Int(Step*unrollused,t),addop= Op.sum(t, t, t)));
                                            }
                                    }
                                catch(Exception subex)
                                    {
                                        System.out.println(subex);
                                        unrollused=1;
                                    }
                                boolean singular = ((Step>0)?(Start+Step*unrollused)==Stop+1
                                                    :((Start>=Stop)&&(Start+Step*unrollused)<Stop));
                                //	System.out.println("Step="+Step+" start+step="+(Start+Step)+" Stop="+Stop);
                                if(singular)
                                    {
                                        //	System.out.println("singular loop"+toString());
                                        // try substituting the initial value for the index var in the statement
                                        // with a couple of possible cast options
                                        Node substitution =
                                            ExpressionSubstituter.substituteAwithBinC(new Deref(new Cast("ref "+t,i)),new Cast(t,start),
                                                    ExpressionSubstituter.substituteAwithBinC(new Deref(i),new Cast(t,start),action));
                                        Node tt= new Statement(new Assign(i, new Cast(t,start)),new Statement(substitution)).eval();
                                        //   System.out.println("->"+tt);
                                        return tt;
                                    }
                                boolean nullLoop=(Step>0?Stop<Start:Stop>Start);
                                if(nullLoop) return new Statement(null);
                            }
                        else
                            {
                                int unroll=unrollfactor;
                                Node bigstep = step;
                                try
                                    {
                                        if(loopunroll&&lf.found==false&&unrollthis)
                                            {
                                                //	System.out.println(" for loop, unroll\n"+toString()+"\n to");
                                                Node newaction=new Statement(action,new Statement(inc));
                                                Node baseaction = newaction;
                                                Node succ_i=di;
                                                for(int j=1; j<unroll; j++)
                                                    {
                                                        succ_i=new Dyad(succ_i, step,addop= Op.sum(t, t, t))	;
                                                        newaction=new Statement(newaction,
                                                                                new Statement(baseaction));
                                                    }
                                                //	System.out.println(toString());
                                                unrollused=unroll;
                                                unrolled=true;
                                                Node newinc = new Assign(i,nexti= new Dyad(di,bigstep=new Dyad(step, new Int(unrollused,t),"*"),addop= Op.sum(t, t, t)));
                                                Label l1 = new Label();
                                                Label l2 = new Label();
                                                Label l3 = new Label();
                                                start = new Cast(t, start);
                                                step = new Cast(t, step);
                                                finish = new Cast(t, finish);
                                                Node initialise = new Assign(i, start);
                                                Node test = new If(new Dyad(step, new Int(0, t), Op.cond(t, Node.gt)),
                                                                   new If(new Dyad(new Deref(i), finish, Op.cond(t, Node.gt)),
                                                                          new Goto(l2)),
                                                                   new If(new Dyad(new Deref(i), finish, Op.cond(t, Node.lt)),
                                                                          new Goto(l2)));
                                                Label l4= new Label();
                                                Node unrolledlooptest =new If(new Dyad(step, new Int(0, t), Op.cond(t, Node.gt)),
                                                                              new If(new Dyad(new Deref(i), new Dyad(finish,bigstep,"-"), Op.cond(t, Node.gt)),
                                                                                     new Goto(l1)),
                                                                              new If(new Dyad(new Deref(i),new Dyad(finish,bigstep,"-"),Op.cond(t, Node.lt)),
                                                                                     new Goto(l1)));
                                                simple =  new Statement(
                                                    new Statement(
                                                        new Statement(initialise,// this is the unrolled loop
                                                                      new Statement(new Statement(l3),
                                                                                    new Statement(new Statement(unrolledlooptest),
                                                                                            new Statement(new SubscriptionRemover().modified(newaction),
                                                                                                    new Statement(new Goto(l3))
                                                                                                         )
                                                                                                 )
                                                                                   )
                                                                     ),
                                                        new Statement(l1, // this is the conventional one
                                                                      new Statement(test,
                                                                                    new Statement(new  SubscriptionRemover().modified(action),
                                                                                            new Statement(inc,
                                                                                                    new Statement(new Goto(l1),
                                                                                                            new Statement(l2)
                                                                                                                 )
                                                                                                         )
                                                                                                 )
                                                                                   )
                                                                     )
                                                    ));
                                                //	System.out.println("unrolled to"+simple);
                                                return simple;
                                            }
                                    }
                                catch(Exception subex)
                                    {
                                        System.out.println(subex);
                                        unrollused=1;
                                    }
                            }
                        Label l1 = new Label();
                        Label l2 = new Label();
                        start = new Cast(t, start);
                        step = new Cast(t, step);
                        finish = new Cast(t, finish);
                        Node initialise = new Assign(i, start);
                        Node test = new If(new Dyad(step, new Int(0, t), Op.cond(t, Node.gt)),
                                           new If(new Dyad(new Deref(i), finish, Op.cond(t, Node.gt)),
                                                  new Goto(l2)),
                                           new If(new Dyad(new Deref(i), finish, Op.cond(t, Node.lt)),
                                                  new Goto(l2)));
                        simple = new Statement(initialise,
                                               new Statement(l1,
                                                             new Statement(test,
                                                                     new Statement(new  SubscriptionRemover().modified(action),
                                                                             new Statement(inc,
                                                                                     new Statement(new Goto(l1),
                                                                                             new Statement(l2)))))));
                        return simple;
                    }
                catch(SubstitutionException subs)
                    {
                        // these are not fatal here
                        return this;
                    }
            }
        catch(Exception ex)
            {
                System.err.println("in For.simplify "+ex);
                System.err.println("start="+start+" i="+inductionVariable+ " type ="+t);
                return this;
            }
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return false;
    }


    /**
     *   evaluate ranges and action
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        start = start.eval();
        finish = finish.eval();
        step = step.eval();
        action = action.eval();
        return this;
    }
    public boolean containsloopdependencies()
    /**
     * form set of all variablies written in the loop- > W<p>
     * remove from this the induction variable
     * form set of all variables dependent on variables written in the loop -> Dw<p>
     * If DW contains anything variables in W then return true */
    {
        Vector W= writtenset();
        Vector w = new Vector();
        for(int i=0; i<W.size(); i++)
            {
                if(!W.elementAt(i).toString().equals(inductionVariable.toString()))
                    w.add(W.elementAt(i));
            }
        W=w;
        int[] Wc = writecount(W);
        boolean[] Dw = dependent(W,false);
        //System.out.println(toString());
        for(int i=0; i<Dw.length; i++)
            {
                //	System.out.println(W.elementAt(i).toString()+Dw[i]+Wc[i]);
                if(!W.elementAt(i).toString().equals(inductionVariable.toString()))
                    if(Dw[i]&& Wc[i]>0)return true;
            }
        return false;
    }
    /**
    Optimise a for loop by removing all unguarded assignments that
    are loop invariants from the body of the loop.<p>
    Algorithm:<>
    1.Form set of all variables written in the loop -> W
    <p>
    2. Form set of all variables dependent on variables written in the loop -> Dw<p>
    3. Form subset of W that are assigned to once ->W1<p>
    4. Form moveable set of assigned variables W1 - Dw -> M <p>
    5. Form set of unguarded assignments U<p>
    6. Move all assignments in the set {m : m in U & m_dest in M} to before the loop<p>

    */
    public Statement optimise()//throws Exception{return optimise(false);}
    //public Statement optimise(boolean allowcalls)
    throws Exception
    {
        boolean singular =false;
        Vector W= writtenset();
        if(optimiseon&& ! neverexecuted())
            try
                {
                    // check we are on the innermost loop with no calls inside
                    if(callfree()
                      )
                        {
                            //System.out.println("forloop "+this);
                            int[] Wc = writecount(W);
                            boolean[] Dw = dependent(W);
                            boolean[] M= new boolean[W.size()];
                            for(int i=0; i<M.length; i++)M[i]=(!Dw[i]) && (Wc[i]==1);
                            //	 for(int i=0;i<W.size();i++)System.out.println("i"+i+",W "+W.elementAt(i)+",Writecount "+Wc[i]+",dependent "+Dw[i]+",to move "+M[i]);
                            Assign[] U = unguardedAssignments();
                            Statement prior=null;
                            for(int m=0; m<U.length; m++)
                                {
                                    Node m_dest = U[m].uncastdest();
                                    if(M[W.indexOf(m_dest)])
                                        try
                                            {
                                                prior=new Statement(prior,new Statement(U[m]));
                                                action = ExpressionSubstituter.substituteAwithBinC(U[m],null,action);
                                            }
                                        catch(Exception ex2)
                                            {
                                                System.out.println("Error in expression substitution \n"+ex2+"\n\t"+m_dest+" U[m]"+U[m]);
                                                throw ex2;
                                            }
                                }
                            //	 System.out.println("new loop "+this +"\nprior is "+prior);
                            checklimits();
                            if(prior==null)
                                return new Statement(this);
                            else
                                {
                                    while(singleton(action))
                                        {
                                            Statement a=(Statement)action;
                                            action=a.action;
                                        }
                                    return new Statement(prior,new Statement(this));
                                }
                        }
                }
            catch(Exception ex)
                {
                    System.out.println("Error in for loop optimisation ");
                    throw ex;
                }
        checklimits(W);
        return new Statement(this);
    }
    /** Checks to see if the bounds of the loop are altered in the loop */
    void checklimits(Vector W) throws Exception
    {
        eval();
        String tag=" "+start+finish+step;
        for(int i=0; i<W.size(); i++)
            if(tag.indexOf(W.elementAt(i).toString())>-1)
                {
                    throw new Exception(" Hazard in loop. \n"+
                                        " The number of times to go round a loop is set by expression within it.  \n"+
                                        " Note that the loop in question may be an implicit one");
                }
    }
    void checklimits()
    throws Exception
    {
        checklimits(writtenset());
    }
    Assign[] unguardedAssignments()
    {
        UnguardedAssignFinder f= new UnguardedAssignFinder();
        action.examine(f);
        Assign[] U= new Assign[f.U.size()];
        for(int i=0; i<U.length; i++)U[i]= (Assign)f.U.elementAt(i);
        return U;
    }
    Node largestLoopInvariant()
    {
        Vector<Node> invs = sortedLoopInvariants();
        return invs.elementAt(0);
    }
    /** Returns the most costly loop invariant sub expression in the body of the loop.
            It can be used by external code to assigne them to registers or to temporaries.
        This is not done within For because this class doees not have access to
        a LocalStoreAllocator */
    Vector<Node> sortedLoopInvariants()
    {
        if(!callfree()||neverexecuted())return new Vector<Node>();;
        Vector W= writtenset();
        boolean[] Dw = dependent(W);
        ExpressionSearcher s= new ExpressionSearcher();
        action.examine(s);
        Object [] r = s.getRepeats();
        String[]ws = new String[W.size()];
        int i;
        for(i=0; i<ws.length; i++)
            {
                ws[i]=W.elementAt(i).toString();
            }
        Vector<Node> invariants = new Vector<Node>();
        //	System.out.println("loop "+this);
        for(i=0; i<r.length; i++)
            {
                String rs=r[i].toString();
                boolean ok=true;
                for(int j=0; j<ws.length; j++)
                    ok=ok&&(!rs.contains(ws[j]));
                if(ok)
                    invariants.add((Node)r[i]) ;
                //		System.out.println("repeat "+i+"="+rs+" invariant ="+ok);
            }
        return invariants;
    }
    Vector writtenset()
    {
        WrittenSetFinder f= new WrittenSetFinder();
        f.W.addElement(Cast.decast(inductionVariable));
        action.examine(f);
        return f.W;
    }
    int[] writecount(Vector v)
    {
        Writecounter f= new Writecounter(v);
        action.examine(f);
        f.count[0]++;
        return f.count;
    }
    boolean[] dependent(Vector v)// anything dependent on the iteration
    // var or any other var in the set
    {
        return dependent(v,true);
    }
    boolean[] dependent(Vector v, boolean f0)   // f0 indicates if set the first var to be dependent
    {
        WritedependencyFinder f= new WritedependencyFinder(v);
        f.dependent[0]=f0;
        for(int i=0; i<v.size(); i++)action.examine(f);
        return f.dependent;
    }
    /** returns true if there are no procedure calls in code
            these can be recognised by the pattern ([ in the string
        returned by toString eg printstring([^(ref int)....]) */
    public boolean callfree()
    {
        return callfree(action);
    }
    public int countActionAssigns()
    {
        AssignFinder f=new AssignFinder();
        action.examine(f);
        return f.count;
    }
    public boolean innermost()
    {
        String s= action.toString();
        return ! s.contains("for(");
    }
    public static boolean callfree(Node n)
    {
        String s=n.toString();
        if(s.contains("[")) return false;
        CallGotoFinder f=new CallGotoFinder();
        n.examine(f);
        return !f.foundone;
    }
    /**
     *  Description of the Method
     *
     *@return    returns void
     */
    public String returnType()
    {
        return "void";
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        return "for(" + inductionVariable + "," + start + " , " + finish + " , " + step + " ," + action + ")";
    }
    public String sig()
    {
        return "for " + inductionVariable.sig()+ "=" + start.sig() + " to " +
               finish.sig() + " step " + step.sig() + " do {\n" + action.sig() + "\n}";
    }

}
class CallGotoFinder implements TreeExaminer
{
    public boolean foundone=false;
    public boolean visit(Node n)
    {
        if(n instanceof Goto)
            {
                foundone=true;
            }
        if(n instanceof Op)
            {
                Op o= (Op)n;
                if(o.Symbol.equals(o.apply))
                    {
                        foundone=true;
                    }
            }
        return true;
    }
    /** This is called after all subtrees have been visited */
    public void leave(Node n) {}
}
/** This is used to remove array subscriptions held in a form specific to the pascal
compiler to generic memrefs that the codegenerator can optimse.*/
class SubscriptionRemover implements TreeModifier
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
class LabelFinder implements TreeExaminer
{
    /** This is called each time a node is visited, but before any subtrees are visited. If it returns
         false the subtree below the node is not visited */
    public boolean visit(Node n)
    {
        return true;
    }
    boolean found=false;
    /** This updates state on leaving*/
    public void leave(Node n)
    {
        if(n instanceof Goto) found=true;
        if(n instanceof If) found=true;
        if(n instanceof For) found=true;
    }

}
class UnguardedAssignFinder implements TreeExaminer
{
    public boolean visit(Node n)
    {
        return !((n instanceof Control)||(n instanceof Procedure));
    }
    Vector U = new Vector();
    public void leave(Node n)
    {
        if(n instanceof Assign) U.addElement(n);
    }
}
class AssignFinder implements TreeExaminer
{
    Vector U = new Vector();
    int count=0;
    public void leave(Node n)
    {
        if(n instanceof Assign)
            {
                U.addElement(n);
                count++;
            }
    }
    public boolean visit(Node n)
    {
        return true;
    }
}
class WrittenSetFinder implements TreeExaminer
{

    Vector W = new Vector();
    public boolean visit(Node n)
    {
        return !(/*(n instanceof For)||*/(n instanceof Procedure));
    }
    public void leave(Node n)
    {
        if(n instanceof Assign)
            {
                Node d= ((Assign)n).uncastdest();
                //System.out.println("in written set finder adding "+d + "\n in "+n);
                if(!W.contains(d))W.addElement(d);
            }
    }
}
class Writecounter extends WrittenSetFinder
{
    int[]count;
    Writecounter(Vector V)
    {
        W=V;
        count= new int[V.size()];
    }

    public void leave(Node n)
    {
        if(n instanceof Assign)
            {
                Node d= ((Assign)n).uncastdest();
                count[W.indexOf(d)]++;
            }
    }
}
class ExpressionSearcher extends CommonSubExpressionFinder
{
    public boolean visit(Node n)
    {
        return !(n instanceof Control);
    }

    public void leave(Node n)
    {
        if(!(n instanceof Assign))record(n);
    }
    /** Call this whenever you encounter an object */
    public void record(Node n)
    {
        n=n.eval();
        String s = n.toString();
        // System.out.println("record "+s);
        Object o = allexp.get(s);
        if(o == null)
            {
                int[]count = new int[1];
                count[0] = 1;
                allexp.put(s, count);
                // System.out.println("record "+s);
                // first occurence add to vector
                commonExpressions.addElement(n);
            }
        else
            {
                int[] freq = (int[]) o;
                if(freq[0] == 1)
                    {
                        repeats++;
                    }
                freq[0]++;
                // System.out.println("count="+freq[0]+" repeats="+repeats+"\nfor "+s);
            }
    }

}
class WritedependencyFinder extends WrittenSetFinder
{
    boolean[]dependent;
    WritedependencyFinder(Vector V)
    {
        W=V;
        dependent= new boolean[V.size()];
        for(int i=0; i<V.size(); i++)dependent[i]=false;
    }

    public void leave(Node n)
    {
        if(n instanceof Assign)
            {
                Node d= ((Assign)n).uncastdest();
                for(int i=0; i<W.size(); i++)
                    if(((Assign)n).dependson(W.elementAt(i)))
                        dependent[W.indexOf(d)] =true;
            }
    }
}
