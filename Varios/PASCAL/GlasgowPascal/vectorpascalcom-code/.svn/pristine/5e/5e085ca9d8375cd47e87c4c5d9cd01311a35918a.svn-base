

//Title:        compiler toolbox
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Compiler tools for mmx optimisation
package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Monad implements Node, Serializable
{
    /**
     *  Description of the Field
     */
    public Op oper;
    Node arg;
    private boolean invokedStandalone = false;
    /** returns the number of registers needed for its argument */
    public int weight()
    {
        return arg.weight();
    }
    public int[] weights()
    {
        return arg.weights();
    }

    /**
     *  Constructor for the Monad object
     */
    public Monad()
    {
    }
    public Node getCost()
    {
        return getArg().getCost();
    }

    /**
     *  Constructor for the Monad object
     *
     *@param  o  Description of Parameter
     *@param  a  Description of Parameter
     */
    public Monad(Op o, Node a)
    {
        oper = o;
        String sym=o.Symbol;
        {
            String argt= a.returnType();
            // check vector consistency and enforce it necessary
            if(!Format.isVector(o.Right)&&
                    Format.isVector(argt)&&sym.equals("EXTEND"))
                {
                    oper=new Op(sym,argt,argt,Format.nextUp(argt));
                }
        }
        arg = a;
    }

    public Monad(String op, Node a)
    {
        arg=a;
        oper=new Op(op,a.returnType(),a.returnType(),a.returnType());
        if(op.equals("EXTEND"))try
                {
                    oper=new Op(op,a.returnType(),"undefined",Format.nextUp(a.returnType()));
                }
            catch(Exception ee) {}
    }

    /**
     *  return the monadic operators argument
     *
     *@return    The arg value
     */
    public Node getArg()
    {
        return arg;
    }


    /**
     *  writes: arg operator
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        arg.toBinary(out);
        oper.toBinary(out);
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
                if(oper != null)
                    {
                        oper.examine(e);
                    }
                if(arg != null)
                    {
                        arg.examine(e);
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
                Node marg=null;
                Op oparg=null;
                try
                    {
                        try
                            {
                                marg= m.modified(arg);
                                oparg=(Op)m.modified(oper);
                                String argret = arg.returnType();
                                String margret = marg.returnType();
                                if(!Format.isVector(argret))
                                    {
                                        if(Format.isVector(margret))
                                            {
                                                if(!Format.isVector(oper.Returns)&&!Format.isVector(oparg.Returns))
                                                    {
                                                        int len =Format.getVectorTypeLength(margret);
                                                        oparg=new Op(oparg.Symbol,margret,oparg.Returns+" vector ( "+len+" )");
                                                    }
                                            }
                                    }
                            }
                        catch(Exception ee)
                            {
                                System.out.println("in mondad.modify call of m.modified(arg) "+ee);
                                //force new exception
                                Node n1= null;
                                n1=n1.eval();
                            }
                        return new Monad((Op) oparg, marg);
                    }
                catch(Exception ex)
                    {
                        ex.printStackTrace();
                        System.out.println("Monad.modify "+ex.toString()+
                                           ", oper ="+oper+ "modified oper="+oparg+", arg="+arg +marg+"\nmodifier class="+m.getClass());
                        //force new exception
                        Node n= null;
                        n=n.eval();
                    }
            }
        return this;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object n)
    {
        if(n instanceof Monad)
            {
                Monad m = (Monad) n;
                return oper.equals(m.oper) && arg.equals(m.arg);
            }
        else
            {
                return false;
            }
    }
    public boolean matches(Node n)
    {
        return equals(n);
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(n instanceof Monad)
            {
                Monad m = (Monad) n;
                return
                    Pattern.matchPusingDtoC(oper,  D, m.oper)&&
                    Pattern.matchPusingDtoC(arg,  D, m.arg);
            }
        else
            {
                return false;
            }
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return
            (oper.Symbol.equals("NOT")|| oper.Symbol.equals("ABS")|| oper.Symbol.equals("SIN")|| oper.Symbol.equals("COS")||
             oper.Symbol.equals("SQRT")|| oper.Symbol.equals("SQRT")|| oper.Symbol.equals("FLOAT")||
             oper.Symbol.equals("ROUND")||
             oper.Symbol.equals("EXTEND")||
             oper.Symbol.equals("LN"))&&
            arg.knownAtCompileTime();
    }


    /**
     *  Try evaluating at compile time
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        try
            {
                arg = arg.eval();
                if(arg.knownAtCompileTime())
                    {
                        if(oper.Symbol.equals("NOT"))
                            {
                                int v=((Num) arg).intValue();
                                //	System.out.println("NOT("+v+")->" +(~v));
                                return new Int(~v);
                            }
                        else if(oper.Symbol.equals("ROUND"))
                            {
                                double d=((Num) arg).doubleValue();
                                return new Int(Math.round(d),"int32");
                            }
                        else if(oper.Symbol.equals("FLOAT"))
                            {
                                double d=((Num) arg).doubleValue();
                                return new Real(d,"ieee64");
                            }
                        else if(oper.Symbol.equals(Node.free))
                            {
                                if(!(arg instanceof Register))return new Int(0,"int8");
                                if(((Register)arg).isReserved())return new Int(0,"int8");
                                return new Int(-1,"int8");
                            }
                        else if(oper.Symbol.equals("EXTEND"))
                            {
                                if(!oper.Returns.equals("ieee64"))
                                    return new Int(((Num) arg).intValue(),oper.Returns);
                                return new Real(((Num) arg).doubleValue(),oper.Returns);
                            }
                        if(oper.Symbol.equals("LN"))
                            {
                                return new Real(Math.log(((Num) arg).doubleValue()));
                            }
                    }
                else
                    {
                        if(oper.Symbol.equals("EXTEND"))
                            {
                                if(arg instanceof Dyad)
                                    {
                                        Dyad d = (Dyad)arg;
                                        if(d.O.Symbol.equals("AND")||d.O.Symbol.equals("OR")||d.O.Symbol.equals("XOR"))
                                            {
                                                return new Dyad(d.O,new Monad(oper, d.left), new Monad(oper,d.right));
                                            }
                                    }
                            }
                    }
                //  return oper.eval((Num) arg, (Num) arg);
            }
        catch(Exception e)
            {
                //  System.out.println("in monad eval"+e+"\n\t"+this);
                return this;
            }
        return this;
    }


    /**
     *  return string equivalent of monad, may be used in intermediate code
     *
     *@return    Description of the Returned Value
     */
    public String  toString()
    {
        if(mystring==null)
            {
                if(oper instanceof Function)
                    {
                        Function f = (Function)oper;
                        if(f.proc==null)
                            {
                                //if (f.address instanceof ImpLabel) mystring=((ImpLabel)f.address).getLab()+arg;
                                //else
                                mystring=f.address.toString()+  /*  "(" +  */ arg  /*  +   ")"  */;
                            }
                        else
                            mystring= f.proc.getStartAddressLabel()+arg;
                    }
                else
                    {
                        mystring= oper.toString()+  "(" + arg + ")"   ;
                        if(oper.toString().equals("EXTEND"))if(Dyad.infix)mystring=  "(" + arg + ")" ;
                    }
                if(!returnType().equals("undefined"))
                    mystring =(!Dyad.infix?("("+returnType()+")"+mystring):mystring);
            }
        return mystring;
    }
    String mystring=null;
    String signed=null;
    public String sig()
    {
        if(signed==null)signed= oper.sig()+"("+arg.sig();
        return signed;
    }
    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return oper.Returns;
    }


    /**
     *  The main program for the Monad class
     *
     *@param  args  The command line arguments
     */
    public static void main(String[] args)
    {
        // ROUND((ieee32)+((ieee32)*(min(max(1.0, -1.0), 1.0), 127.5), -0.5))
        Op ROUND= new Op("ROUND","ieee32","ieee32");
        Monad monad= new Monad(ROUND,
                               new Cast("ieee32",
                                        new Dyad(
                                            new Cast("ieee32",
                                                    new Dyad(
                                                            new Dyad(
                                                                    new Dyad(new Real(1.0),
                                                                            new Real(-1.0),
                                                                            "max"),
                                                                    new Real(1.0),
                                                                    "min"
                                                            ),
                                                            new Real(127.5),
                                                            "*")
                                                    ),
                                            new Real(-0.5),
                                            "+"
                                        )
                                       )
                              );
        monad.invokedStandalone = true;
        System.out.println(monad.toString());
        Node sub=new SubField(monad,0,"uint8");
        System.out.println(sub.toString());
        System.out.println(sub.eval().toString());
        System.out.println(monad.eval().toString());
    }

}

