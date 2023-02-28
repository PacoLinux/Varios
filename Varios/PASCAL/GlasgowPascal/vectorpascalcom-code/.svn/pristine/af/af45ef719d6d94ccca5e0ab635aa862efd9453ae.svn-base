package ilcg.tree;
import ilcg.*;

import java.io.*;


/**
 *  Implements dyadic operator application
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Dyad implements Node, Serializable
{

    /**
     *  Description of the Field
     */
    public Node left, right;

    /**
     *  Description of the Field
     */
    public Op O;
    String lookslike = "";
    int w = -1;
    int[] ws;

    /** returns the number of registers needed to evaluate the dyadic operation */
    public int weight()
    {
        if(w < 0)
            {
                setw();
            }
        // System.out.println("weight "+w+"for "+toString());
        return w;
    }
    public int[] weights()
    {
        if(w < 0)
            {
                setw();
            }
        // System.out.println("weight "+w+"for "+toString());
        return ws;
    }
    void setw()
    {
        left = left.eval();
        right = right.eval();
        int l = left.weight();
        int r = right.weight();
        //  if(Format.isVector(left.returnType()))l+=1;
        //  if(Format.isVector(right.returnType()))r+=1;
        w = (l < r ? r + 1 : (l > r ? l : l + 1));// this is the textbook weight algorithm for a general register machine
        // section below generalises it to multiple types of registers
        if(O.Symbol.equals("range"))
            {
                w= 1;
            }
        if(O.Symbol.equals("rep"))
            {
                w= 2;
            }
        int[] lw= left.weights();
        int[] rw= right.weights();
        int wlen = lw.length<rw.length?rw.length:lw.length;
        ws = new int [wlen];
        int i, code;
        lw= extend(lw,wlen);
        rw=extend(rw,wlen);
        code = Format.getCode(returnType());
        for(i= 0; i<wlen; i++)
            if(i==code) ws[i] = (lw[i] < rw[i] ? rw[i] + 1 : (lw[i] > rw[i] ? lw[i] : lw[i] + 1));// this is for the destination value
            else ws[i]= (lw[i]+rw[i])>2?2:lw[i]+rw[i]; // this assumes at most 2 address registers are enough
    }
    public static int[] extend(int[] arg,int to)
    {
        if(arg.length == to) return arg;
        int[] na = new int[to];
        int i;
        for(i=0; i<arg.length; i++)na[i]=arg[i];
        return na;
    }
    /* add two integer vectors together */
    public static int[] sumv(int[]a,int[]b)
    {
        int len = a.length>b.length?a.length:b.length;
        a= extend(a,len);
        b=extend(b,len);
        int []n = new int [len];
        for(int i=0; i<len; i++) n[i]=a[i]+b[i];
        return n;
    }
    /**
     *  Constructor for the Dyad object
     */
    public Dyad()
    {
        left = null;
        right = null;
        O = null;
    }
    static Node dyadoverhead = new Real(0.35);
    public Node getCost()
    {
        Node over = dyadoverhead;
        if(O.Symbol.startsWith("r"))     // dont evaluate
            {
                over = new Real(3.1);
            }
        return new Dyad(over, new Dyad(left.getCost(),right.getCost(),"+"),"+").eval();
    }
    /**
     *  Constructor for the Dyad object
     *
     *@param  l  Description of Parameter
     *@param  r  Description of Parameter
     *@param  o  Description of Parameter
     */
    public Dyad(Node l, Node r, String o)
    {
        r=r.eval();
        if(!l.returnType().equals(r.returnType()))
            {
                if(Format.isInteger(l.returnType())
                        && Format.isInteger(r.returnType()))
                    {
                        if(Format.lengthInBits(l.returnType())
                                > Format.lengthInBits(r.returnType()))   // extend the right field
                            {
                                r =  new Monad(
                                    new Op("EXTEND", r.returnType(), l.returnType()), r);
                            }
                        if(Format.lengthInBits(l.returnType())
                                < Format.lengthInBits(r.returnType()))   // extend the left field
                            {
                                l =  new Monad(
                                    new Op("EXTEND", l.returnType(), r.returnType()), l);
                            }
                    }
            }
        left = l;
        right = r;
        if(o .equals("+"))
            {
                O = Op.sum(l.returnType(), r.returnType(), l.returnType());
            }
        else if(o.equals("range"))
            {
                r= r.eval();
                l=l.eval();
                String ls = l.returnType();
                Number ln = (Number)l;
                Number n=(Number)r;
                O=new Op(o,ls, r.returnType(), Format.makeVectorType(ls,n.intValue()-ln.intValue()+1));
            }
        else if(o.equals("rep"))
            {
                r= r.eval();
                String ls = l.returnType();
                if(!(r instanceof Number))System.out.println("when constructing a rep dyad right argument was not a number but was="+r);
                Number n=(Number)r;
                O=new Op(o,ls, r.returnType(), Format.makeVectorType(ls,n.intValue()));
            }
        else if(o.equals("<") || o.equals(">") || o.equals("=") || o.equals(">=")
                || o.equals("<=") || o.equals("<>"))
            {
                String rs = r.returnType();
                String code = (!Format.isVector(rs)
                               ? "int8"
                               : "int8 vector ( " + Format.getVectorTypeLength(rs) + " )");
                O = new Op(o, l.returnType(), rs, code);
            }
        else
            {
                O = new Op(o, l.returnType(), r.returnType(), l.returnType());
            }
        //  System.out.println("in Dyad constructor "+toString()+"\nreturns"+returnType());
        setw();
    }

    /**
     *  postfix form of constructor
     *
     *@param  l              Description of Parameter
     *@param  r              Description of Parameter
     *@param  o              Description of Parameter
     *@exception  Exception  Description of Exception
     */
    public Dyad(Node l, Node r, Op o) throws Exception
    {
        if(l instanceof Type || r instanceof Type)throw new Exception("In "+l+o+r+" one or more arguments is a type");
        if(!l.returnType().equals(r.returnType()))
            {
                if(Format.isInteger(l.returnType())
                        && Format.isInteger(r.returnType()))
                    {
                        if(Format.lengthInBits(l.returnType())
                                > Format.lengthInBits(r.returnType()))   // extend the right field
                            {
                                r =  new Monad(
                                    new Op("EXTEND", r.returnType(), l.returnType()), r);
                            }
                        if(Format.lengthInBits(l.returnType())
                                < Format.lengthInBits(r.returnType()))   // extend the left field
                            {
                                l =  new Monad(
                                    new Op("EXTEND", l.returnType(), r.returnType()), l);
                            }
                    }
            }
        left = l;
        right = r;
        O = o;
        setw();
        if(!(l.returnType().startsWith(O.Left)))
            {
                if(!O.Left.equals(Node.any))
                    if(!o.Symbol.equals(Node.apply))
                        {
                            throw new Exception(
                                l.returnType() + "\nleft incompatible with\n" + O.Left
                                + " in operator " + o + "\n" + l + o + r);
                        }
            }
        if(!(r.returnType().startsWith(O.Right)))
            {
                if(!O.Right.equals(Node.any))
                    throw new Exception(
                        r.returnType() + "\nright incompatible with\n" + O.Right
                        + " in operator " + o + "\n" + l + o + r);
            }
    }

    /**
     *  prefix form of constructor
     *
     *@param  o              Description of Parameter
     *@param  l              Description of Parameter
     *@param  r              Description of Parameter
     *@exception  Exception  Description of Exception
     */
    public Dyad(Op o, Node l, Node r) throws Exception
    {
        left = l;
        right = r;
        O = o;
        setw();
        if(!(l.returnType().startsWith(O.Left)))
            {
                if(!o.Symbol.equals(Node.apply))
                    {
                        throw new Exception(
                            l + ":" + l.returnType() + "\nleft incompatible with\n"
                            + O.Left + " in operator " + o);
                    }
            }
        if(!(r.returnType().startsWith(O.Right)))
            {
                throw new Exception(
                    r + ":" + r.returnType() + "\nright incompatible with\n"
                    + O.Right + " in operator " + o);
            }
    }

    /**
     *  writes: left right operator
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        left.toBinary(out);
        right.toBinary(out);
        O.toBinary(out);
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
                if(left != null)
                    {
                        left.examine(e);
                    }
                if(right != null)
                    {
                        right.examine(e);
                    }
                if(O != null)
                    {
                        O.examine(e);
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
                try
                    {
                        Node marg=m.modified(right);
                        String argret = right.returnType();
                        String margret = marg.returnType();
                        Op oparg=(Op)m.modified(O);
                        /*
                                        if( !Format.isVector(argret))
                                                            {
                                                                if( Format.isVector(margret))
                                                                {
                                                                      if(!Format.isVector(O.Returns)&&!Format.isVector(oparg.Returns))
                                                                      { int len =Format.getVectorTypeLength(margret);
                                                                        if (!Format.isRef(oparg.Returns))
                                                                          oparg=new Op(oparg.Symbol,m.modified(left).returnYype(),margret,"vector ("+len+") "+oparg.Returns);
                         						return new Dyad(m.modified(left), m.modified(right),oparg);
                                                                      }
                                                                }
                                                            }
                        */
                        if(!oparg.Symbol.equals("rep"))return new Dyad(m.modified(left), m.modified(right),
                                                                  oparg.Symbol
                                                                          );// in these cases we may change the return type
                        return new Dyad(m.modified(left), m.modified(right),
                                        //  ((Op) m.modified(O)).Symbol
                                        oparg);
                    }
                catch(Exception ex)
                    {
                        System.out.println(ex);
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
        return O.Returns;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return left.knownAtCompileTime() && right.knownAtCompileTime() ;
    }

    /**
     *  checks for exact algebraic equality of expressions
     *
     *@param  o  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object o)
    {
        if(o instanceof Dyad)
            {
                Dyad d = (Dyad) o;
                if(O.equals(d.O))
                    {
                        if(left.equals(d.left) && right.equals(d.right))
                            {
                                return true;
                            }
                        if(O.commutes())
                            {
                                if(left.equals(d.right) && right.equals(d.left))
                                    {
                                        return true;
                                    }
                            }
                    }
                ;
            }
        return false;
    }
    /** Check if dyad similar to n using mappings in lookup table D*/
    public boolean matches(Node n,SymbolTable D)
    {
        if(equals(n))return true;
        if(n instanceof Dyad)
            {
                Dyad d = (Dyad) n;
                if(Pattern.matchPusingDtoC(O,D,d.O))
                    {
                        if(Pattern.matchPusingDtoC(left,D,d.left)  && Pattern.matchPusingDtoC(right,D,d.right))
                            {
                                return true;
                            }
                        if(Pattern.matchPusingDtoC(left,D,d.right)  && Pattern.matchPusingDtoC(right,D,d.left))
                            {
                                return true;
                            }
                    }
                ;
            }
        return	matches(n);
    }

    public boolean matches(Node o)
    {
        if(o instanceof Dyad)
            {
                Dyad d = (Dyad) o;
                if(O.matches(d.O))
                    {
                        if(left.matches(d.left) && right.matches(d.right))
                            {
                                return true;
                            }
                        if(O.commutes())
                            {
                                if(left.matches(d.right) && right.matches(d.left))
                                    {
                                        return true;
                                    }
                            }
                    }
                ;
            }
        return false;
    }
    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        if(lookslike.equals(""))
            {
                lookslike = (infix?"(" + left.toString()
                             + (O.toString()+ right.toString() + ")")
                             :(O.toString() + "(" + left.toString())
                             + (", " + right.toString() + ")"));
            }
        return lookslike;
    }
    public static boolean infix=false;
    String siglike = "";
    public String sig()
    {
        if(siglike.equals(""))
            {
                siglike = (left == null
                           ? ""
                           : (O.sig() + "(" + left.sig()) + (", " + right.sig() + ")"));
            }
        return siglike;
    }
    /** return true if the calculation is a mixed vector to scalar one */
    public boolean isVectorScalar()
    {
        if(Format.isVector(left.returnType()))
            {
                return !Format.isVector(right.returnType());
            }
        return Format.isVector(right.returnType());
    }
    boolean isInt32VectorInt64Scalar()
    {
        String lt=left.returnType();
        boolean LisV = Format.isVector(lt);
        boolean isint32= LisV&&Format.getVectorElementType(lt).equals("int32");
        return isint32 && right.returnType().equals("int64");
    }
    boolean isInt32VectorInt32Scalar()
    {
        String lt=left.returnType();
        boolean LisV = Format.isVector(lt);
        boolean isint32= LisV&&Format.getVectorElementType(lt).equals("int32");
        return isint32 && right.returnType().equals("int32");
    }
    /** assume operator + and left is and int32vectorint64scalar plus */
    Node segregate()
    {
        Dyad l=(Dyad)left;
        if(!l.O.Symbol.equals("+"))return this;
        return new Dyad(new Dyad(l.right,right,"+"),l.left,"+").eval();
    }
    /**
     *  if the node is known at compile time, simplifies it and returns the result
     *  of applying operators to both nodes constants always moved tothe right for
     *  adds,
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        String s="eval"+this;
        //System.out.println(s);
        Node that = innereval();
        // System.out.println("to "+that);
        if(that instanceof Dyad)
            {
                return new evaluatedDyad(((Dyad) that).O, ((Dyad) that).left,
                                         ((Dyad) that).right);
            }
        return that;
    }

    Node innereval()
    {
        if(O.Symbol.equals("rep")||O.Symbol.equals("range")||O.Symbol.equals("bss"))    // dont evaluate
            {
                return this;
            }
        if(knownAtCompileTime())
            {
                left = left.eval();
                right = right.eval();
                if(left  instanceof Cast)left=((Cast)left).subtree;
                if(right  instanceof Cast)right=((Cast)right).subtree;
                try
                    {
                        Node res = O.eval((Number) left.eval(), (Number) right.eval());
                        // System.out.println("eval "+this+" to "+res);
                        return res;
                    }
                catch(Exception e) {}
            }
        if(O.Symbol.equals("<") || O.Symbol.equals(">")
                || O.Symbol.equals("<>"))
            {
                if(left.equals(right))
                    {
                        return new Int(0, "int8");
                    }
            }
        if(O.Symbol.equals("<=") || O.Symbol.equals(">=")
                || O.Symbol.equals("="))
            {
                if(left.equals(right))
                    {
                        return new Int(-1, "int8");
                    }
            }
        if(O.Symbol.equals("AND"))
            {
                if(right instanceof Number)
                    {
                        if(((Number) right).doubleValue() == -1)
                            {
                                return left;
                            }
                    }
            }
        if(O.Symbol.equals("OR"))
            {
                if(right instanceof Number)
                    {
                        if(((Number) right).doubleValue() == 0)
                            {
                                return left;
                            }
                    }
            }
        if(O.Symbol.equals("*"))
            {
                try
                    {
                        if(left instanceof Number)
                            {
                                if(((Number) left).doubleValue() == 1)
                                    {
                                        return right;
                                    }
                            }
                        if(right instanceof Number)
                            {
                                if(((Number) right).doubleValue() == 1)
                                    {
                                        return left;
                                    }
                            }
                        Node ll = Cast.decast(left);
                        Node rr = Cast.decast(right);
                        if(ll instanceof Int)
                            {
                                if(((Number) ll).longValue() == 0)
                                    {
                                        return new Int(0);
                                    }
                            }
                        if(rr instanceof Int)
                            {
                                if(((Number) rr).doubleValue() == 0)
                                    {
                                        return new Int(0);
                                    }
                            }
                        /*   distributing the multiply operation for constants to allow forced evaluation, this allows the scaling
                                     of the start offsets of arrays that do not start at 1 to be folded into a constant for base plus
                                     offset addressing  disable this  */
                        if(right.knownAtCompileTime())
                            {
                                if(left instanceof Dyad)
                                    {
                                        try
                                            {
                                                if(((Dyad) left).right.knownAtCompileTime()
                                                        || ((Dyad) left).left.knownAtCompileTime())
                                                    {
                                                        if(((Dyad) left).O.Symbol.equals("+")
                                                                || ((Dyad) left).O.Symbol.equals("-")
                                                          )
                                                            {
                                                                return new Dyad(((Dyad) left).O, new Dyad(O, ((Dyad) left).left, right), new Dyad(O, ((Dyad) left).right, right)).eval();
                                                            }
                                                    }
                                            }
                                        catch(Exception e)
                                            {
                                                return this;
                                            }
                                    }
                            }  /* */
                    }
                catch(Exception e)
                    {
                        return this;
                    }
            }
        if(O.Symbol.equals(divide))
            {
                right=right.eval();
                if((right instanceof Number) && (left.returnType().equals("uint32")//||left.returnType().equals("int32") -- not a valid optimisation for signed integers
                                                 ||left.returnType().equals("uint64")//||left.returnType().equals("int64") -- not valid
                                                ))
                    {
                        if(((Number) right).doubleValue() == 4)
                            {
                                return new Dyad(left, new Int(2, "int32"), ">>");
                            }
                        if(((Number) right).doubleValue() == 16)
                            {
                                return new Dyad(left, new Int(4, "int32"), ">>");
                            }
                        if(((Number) right).doubleValue() == 8)
                            {
                                return new Dyad(left, new Int(3, "int32"), ">>");
                            }
                        if(((Number) right).doubleValue() == 2)
                            {
                                return new Dyad(left, new Int(1, "int32"), ">>");
                            }
                    }
            }
        if(O.Symbol.equals("+"))
            {
                if(left instanceof Number)
                    {
                        if(((Number) left).doubleValue() == 0)
                            {
                                return right;
                            }
                    }
                if(right instanceof Number)
                    {
                        if(((Number) right).doubleValue() == 0)
                            {
                                return left;
                            }
                    }
            }
        if(O.Symbol.equals("-"))
            {
                if(right instanceof Number)
                    {
                        if(((Number) right).doubleValue() == 0)
                            {
                                return left;
                            }
                    }
                if(right instanceof Int)
                    {
                        return new Dyad(left, new Dyad(right, new Int(-1, right.returnType()), "*"), "+").eval();
                    }
                if(!left.knownAtCompileTime())
                    {
                        if(left instanceof Dyad)
                            {
                                try
                                    {
                                        Dyad dl = (Dyad) left;
                                        if(dl.O.Symbol.equals("+") && dl.right instanceof Int
                                                && right.knownAtCompileTime())
                                            {
                                                return new Dyad(dl.left, new Dyad(dl.right, right, O), dl.O).eval();
                                            }
                                        if(dl.O.Symbol.equals("-") && dl.right instanceof Int
                                                && right.knownAtCompileTime())
                                            {
                                                return new Dyad(dl.left, new Dyad(dl.right, right, "+"), dl.O).eval();
                                            }
                                    }
                                catch(Exception ex)     // System.out.println(ex);
                                    {
                                    }
                            }
                    }
            }
        if(O.Symbol.equals(Node.contains))
            {
                String ls = left.toString().trim();
                String rs = right.toString().trim();
                //      	System.out.println("does \t"+ls+"\ncontain\t"+rs+"\n"+ls.contains(rs));
                if(ls.contains(rs))return new Int(-1);
                return new Int(0);
            }
        if(O.Symbol.equals("+"))
            {
                try
                    {
                        if((left.knownAtCompileTime() || (left instanceof Label))
                                && !right.knownAtCompileTime())
                            {
                                // make sure constants are on the right hand side of the operator
                                Node temp = left;
                                left = right;
                                right = temp;
                            }
                        String lt=left.returnType();
                        String rt=right.returnType();
                        boolean lv=Format.isVector(lt);
                        if(isVectorScalar()&&!lv)
                            {
                                // IN MIXED VECTOR SCALAR ARITHETIC PUT THE VECTOR ON THE LEFT
                                Node temp = left;
                                String ttemp =lt;
                                left = right;
                                lt=rt;
                                right = temp;
                                rt=ttemp;
                            }
                        if(!left.knownAtCompileTime())
                            {
                                if(left instanceof Dyad)
                                    {
                                        try
                                            {
                                                Dyad dl = (Dyad) left.eval();
                                                if(dl.  isInt32VectorInt64Scalar()||dl.  isInt32VectorInt32Scalar())return segregate();
                                                if(dl.O.Symbol.equals("+"))
                                                    {
                                                        return new Dyad(dl.left, new Dyad(dl.right, right, "+"), "+").eval();
                                                    }
                                                if((dl.O.Symbol.equals("-"))
                                                        && dl.right instanceof Int
                                                        && right.knownAtCompileTime())
                                                    {
                                                        return new Dyad(dl.left, new Dyad(right, dl.right, "-"), "+").eval();
                                                    }
                                            }
                                        catch(Exception ex)     // System.out.println(ex);
                                            {
                                            }
                                    }
                            }
                        if(!right.knownAtCompileTime())
                            {
                                if(right instanceof Dyad)
                                    {
                                        try
                                            {
                                                Dyad dr = (Dyad) right.eval();
                                                if(dr.O.Symbol.equals("+")&&
                                                        (dr.  isInt32VectorInt64Scalar()||dr.  isInt32VectorInt32Scalar()))
                                                    {
                                                        return new Dyad(new Dyad(dr.left, left, "+"),dr.right, "+").eval();
                                                    }
                                            }
                                        catch(Exception ex)     // System.out.println(ex);
                                            {
                                            }
                                    }
                            }
                    }
                catch(Exception f)
                    {
                        return this;
                    }
            }
        if(O.Symbol.equals("+") || O.Symbol.equals("*")||O.Symbol.equals("AND")||O.Symbol.equals("OR")||O.Symbol.equals("="))
            {
                try
                    {
                        if(treeBalance)
                            {
                                if(left.weight() < right.weight())
                                    {
                                        return new Dyad(right.eval(), left.eval(), O);
                                    }
                            }
                    }
                catch(Exception f2)
                    {
                        return this;
                    }
            }
        return new evaluatedDyad(O, left, right);
    }

    /** If true then trees are balanced for commutative operators to minimise register use */
    public static boolean treeBalance = true;
}


/**
 *  This is a dummy class to avoid repeated evaluations
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class evaluatedDyad extends Dyad implements Serializable
{

    /**
     *  Constructor for the evaluatedDyad object
     *
     *@param  o  Description of Parameter
     *@param  l  Description of Parameter
     *@param  r  Description of Parameter
     */
    evaluatedDyad(Op o, Node l, Node r)
    {
        left = l;
        right = r;
        O = o;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        return this;
    }
}
