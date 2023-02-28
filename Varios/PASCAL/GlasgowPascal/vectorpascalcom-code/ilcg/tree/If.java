
//Title:        ilcg.tree.If
//Version:
//Copyright:    Copyright (c) 2000
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation
package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Implements If cond then a1 else a1 fi
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class If implements Node, Control, Serializable
{
    /**
     *  Description of the Field
     */
    public Node cond, a1;
    /**
     *  Description of the Field
     */
    public Node a2 = null;
    private Node simple;
    int w(Node p)
    {
        if(p==null) return 0;
        return p.weight();
    }
    int[] ws(Node p)
    {
        if(p==null)
            {
                int[] n= {0};
                return n;
            }
        return p.weights();
    }
    public String sig()
    {
        return cond.sig()+"?"+a1.sig()+":"+(a2==null?" ":a2.sig());
    }
    public int weight()
    {
        return w(cond)+w(a1)+w(a2);
    }
    public int[] weights()
    {
        return Dyad.sumv(ws(cond),Dyad.sumv(ws(a1),ws(a2)));
    }
    public Node getCost()
    {
        return new Real(weight());
    }

    public boolean equals(Node n)
    {
        if(n instanceof If)
            {
                if(cond.equals(((If)n).cond)&&
                        a1.equals(((If)n).a1))
                    {
                        if(a2==null)
                            return ((If)n).a2==null;
                        return a2.equals(((If)n).a2);
                    }
                return false;
            }
        else return false;
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
                if(a1 != null)
                    {
                        a1.examine(e);
                    }
                if(a2 != null)
                    {
                        a2.examine(e);
                    }
                if(cond != null)
                    {
                        cond.examine(e);
                    }
            }
        e.leave(this);
    }


    public boolean matches(Node n)
    {
        if(n instanceof If)
            {
                if(cond.matches(((If)n).cond)&&
                        a1.matches(((If)n).a1))
                    {
                        if(a2==null)
                            return ((If)n).a2==null;
                        return a2.matches(((If)n).a2);
                    }
                return false;
            }
        else return false;
    }
    public boolean matches(Node n, SymbolTable D)
    {
        if(n instanceof If)
            {
                if(cond.matches(((If)n).cond,D)&&
                        a1.matches(((If)n).a1,D))
                    {
                        if(a2==null)
                            return ((If)n).a2==null;
                        return a2.matches(((If)n).a2,D);
                    }
                return false;
            }
        else return false;
    }
    /**
     *  Creates if then else fi
     *
     *@param  condition  Description of Parameter
     *@param  thenPart   Description of Parameter
     *@param  elsePart   Description of Parameter
     */
    public If(Node condition, Node thenPart, Node elsePart)
    {
        cond = condition;
        a1 = thenPart;
        a2 = elsePart;
    }


    /**
     *  Creates if then fi
     *
     *@param  condition  Description of Parameter
     *@param  thenPart   Description of Parameter
     */
    public If(Node condition, Node thenPart)
    {
        cond = condition;
        a1 = thenPart;
    }


    /**
     *  Gets the simple attribute of the If object
     *
     *@return    The simple value
     */
    public boolean isSimple()
    {
        if(a2 == null && a1 instanceof Goto)
            {
                return true;
            }
        return false;
    }


    /**
     *  writes condition thenpart elsepart codeForIf
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        cond.toBinary(out);
        a1.toBinary(out);
        if(a2 == null)
            {
                out.writeByte(codeFornoval);
            }
        else
            {
                a2.toBinary(out);
            }
        out.writeByte(codeForIf);
    }


    /**
     *  Description of the Method
     *
     *@param  e  Description of Parameter
     */


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
                return new If(m.modified(cond),
                              (a1==null?a1:m.modified(a1)),
                              (a2==null?a2:m.modified(a2)));
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
        if(cond.knownAtCompileTime())
            {
                cond = cond.eval();
                return true;
            }
        return false;
    }


    /**
     *  converts if then else fi into if goto format
     *
     *@return    Description of the Returned Value
     */
    public Node simplify()
    {
        if(simple != null)
            {
                return simple;
            }
        if(isSimple())
            {
                return this;
            }
        Label l1 = new Label();
        Label l2 = new Label();
        simple = new Statement(
            ((ordyad(cond)?(Node)new Statement(new If(((Dyad)cond).left,new Goto(l1)),
                                               new Statement(new If(((Dyad)cond).right,new Goto(l1))))
              :(Node)new If(cond, new Goto(l1)))),
            // goto then part
            new Statement(a2,
                          // do else part
                          new Statement(new Goto(l2),
                                        new Statement(l1,
                                                new Statement(a1,
                                                        new Statement(l2))))));
        //	System.out.println("simplify "+toString()+"\nto\t"+simple);
        return simple;
    }
    /** Checks if a  node is of form OR(a,b) */
    boolean ordyad(Node e)
    {
        if(!(e instanceof Dyad))return false;
        if(((Dyad)e).O.Symbol.equals("OR"))return true;
        return false;
    }
    /**
     *  this can be used for compile time simplification of code, unreachable code
     *  is deleted
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        if(knownAtCompileTime())
            {
                cond = cond.eval();
                Node dc = Cast.decast(cond);
                if(dc instanceof Int)
                    {
                        Node res= (((Int) dc).intValue() == 0 ? a2 : a1) ;
                        if(res!=null) res=res.eval();
                        return res;
                    }
            }
        if(a1!=null) a1=a1.eval();
        if(a2!=null) a2=a2.eval();
        return this;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return a1.returnType();
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        return "if(" + cond + ")\n"+Statement.nest+"{\n" + a1 +"\n"+Statement.nest +(a2!=null?"}else{\n " + a2 +"\n"+ Statement.nest+"}":"}");
    }
}
