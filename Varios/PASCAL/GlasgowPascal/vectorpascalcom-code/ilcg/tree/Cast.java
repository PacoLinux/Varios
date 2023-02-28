
// Title:        ilcg
// Version:
// Copyright:    Copyright (c) 1998
// Author:       Paul Cockshott
// Company:
// Description:  Your description


package ilcg.tree;
import ilcg.*;

import java.io.*;




/**
 *  Cast a value to a type, the type encoded as a string
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Cast
    implements Node, Serializable, Annotated
{

    /**
     *  this holds the tree that is being cast to a new type
     */
    public Node subtree;
    String castTo;
    Object castingPattern = null;
    Object[] annotation = null;
    public void setAnnotation(Object[]an)
    {
        annotation = an;
    }
    public boolean matches(Node n)
    {
        if(equals(n)) return true;
        return Format.castIsSafe(castTo,n.returnType());
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(n instanceof Cast)
            {
                Cast c = (Cast)n;
                if(! subtree.matches(c.subtree,D)) return false;
                return Format.castIsSafe(castTo,n.returnType());
            }
        if(!subtree.matches(n,D)) return false;
        //System.out.println("in Cast.match "+n+"\t"+toString());
        if(castingPattern != null)
            {
                //System.out.println(" castingPattern "+castingPattern+":"+castingPattern.getClass());
                if(castingPattern instanceof Node)
                    {
                        return
                            Pattern.matchPusingDtoC((Node)castingPattern,D,new Format(n.returnType()));
                    }
            }
        return false;
    }
    public Object[] getAnnotation()
    {
        return annotation;
    }

    public int weight()
    {
        return subtree.weight();
    }
    public int[] weights()
    {
        return subtree.weights();
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    /**
     *  Constructor for the Cast object
     *
     *@param  t  type string
     *@param  n  node to be cast
     */
    public Cast(String t, Node n)
    {
        castingPattern = castTo = t;
        try
            {
                try
                    {
                        subtree = n.eval();
                    }
                catch(Exception e1)
                    {
                        System.out.println("error in eval in cast "+e1);
                        e1.printStackTrace();
                    }
                while(subtree instanceof Cast)
                    {
                        subtree = ((Cast) subtree).subtree;
                    }
                checktype();
            }
        catch(Exception e)
            {
                System.err.println("Error in Cast constructor "+e);
            }
    }

    /** force the subtree to match the size of the type it is cast to */
    public void checktype()
    {
        try
            {
                //System.out.println("checktype ");
                //System.out.println(" before "+toString());
                String t = castTo;
                String vt = subtree.returnType();
                if(vt.startsWith("ref"))
                    {
                        return;
                    }
                try
                    {
                        int vallen = Format.lengthInBits(vt);
                        int typelen = Format.lengthInBits(t);
                        // System.out.println(" vallen="+vallen+", typelen="+typelen+"castto="+castTo+" "+subtree+","+vt);
                        if(Format.isInteger(vt)&&Format.isReal(t))
                            {
                                subtree= new Monad(new Op("FLOAT", vt, t), subtree);
                            }
                        else if(Format.isInteger(t)&&Format.isReal(vt))
                            {
                                subtree= new Monad(new Op("ROUND", vt, t), subtree);
                            }
                        else if(vallen > typelen && Format.isInteger(vt)&& ! Format.isVector(t))
                            {
                                //      System.out.println("select subfield");
                                Node nv = subtree;
                                if(vallen < 32)
                                    {
                                        nv = new ilcg.tree.Monad(new Op("EXTEND", vt, Node.int32),subtree).eval();
                                    }
                                // if(! subtree.knownAtCompileTime())
                                subtree = new SubField(nv, 0, t);
                            }
                        else if(vallen < typelen&& ! Format.isVector(t))
                            {
                                //	System.out.println("EXTEND");
                                Node st=subtree;
                                subtree = new ilcg.tree.Monad(new Op("EXTEND", vt, t), subtree).eval();
                                if(st instanceof Dyad)
                                    {
                                        Dyad d = (Dyad)st;
                                        if(d.O.Symbol.equals("AND")||d.O.Symbol.equals("OR")||d.O.Symbol.equals("XOR"))
                                            {
                                                subtree= new Dyad(
                                                    new Monad(new Op("EXTEND", vt, t), d.left),
                                                    new Monad(new Op("EXTEND", vt, t),d.right),
                                                    d.O.Symbol);
                                            }
                                    }
                            }
                    }
                catch(Exception e2)
                    {
                        System.err.println("error in 2nd half of cast.checktype "+e2);
                        e2.printStackTrace();
                    }
            }
        catch(Exception e)
            {
                System.err.println("error in Cast.checktype "+e);
                e.printStackTrace();
            }
        // System.out.println("after"+toString());
    }

    /**
     *  Constructor for the Cast object used only in Walker2 descended classes
     *
     *@param  t  type pattern
     *@param  n  node to be cast
     */
    public Cast(Node t, Node n)
    {
        castingPattern = t;
        castTo = t.getClass().toString();
        if(t instanceof Format)
            {
                castTo = t.toString();
            }
        subtree = n;
        while(subtree instanceof Cast)
            {
                subtree = ((Cast) subtree).subtree;
            }
        checktype();
    }

    public Cast(Pattern t, Node n)
    {
        castingPattern = t;
        castTo = t.getClass().toString();
        subtree = n;
        while(subtree instanceof Cast)
            {
                subtree = ((Cast) subtree).subtree;
            }
    }

    /**
     *  Gets the subtree attribute of the Cast object
     *
     *@return    The subtree value
     */
    public Node getSubtree()
    {
        return subtree;
    }

    /**
     *  writes castTo subtree codeForCast
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        Loader.toBinary(out, castTo);
        subtree.toBinary(out);
        out.writeByte(codeForCast);
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
                return new Cast(castTo, m.modified(subtree));
            }
        return this;
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
                if(subtree != null)
                    {
                        subtree.examine(e);
                    }
            }
        e.leave(this);
    }

    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object n)
    {
        if(n instanceof Cast)
            {
                Cast c = (Cast) n;
                return c.castTo.equals(castTo) && c.subtree.equals(subtree);
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
        if(mystring == null)
            {
                mystring = "(" +(Dyad.infix?Format.toC(castTo): castingPattern) + ")" + subtree;
                //   mystring += Dyad.infix;
            }
        return mystring;
    }
    String mystring = null;
    String signed = null;
    public String sig()
    {
        if(signed == null)
            {
                signed = "(" + castTo + ")" + subtree.sig();
            }
        return signed;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return subtree.knownAtCompileTime();
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        checktype();
        Node tree = subtree.eval();
        if(tree.returnType().equals(castTo))
            {
                return tree;
            }
        // if (castTo.startsWith("ref ref"))return new Cast("ref int32",subtree.eval() );
        if(castTo.equals(ieee32) || castTo.equals(ieee64))
            {
                if(tree instanceof Real)
                    {
                        return new Real(((Real) tree).doubleValue(), castTo);
                    }
            }
        else if(tree instanceof Int)
            {
                return new Int(((Int) tree).longValue(), castTo);
            }
        if(tree == subtree)
            return this;
        Cast t= new Cast(castTo,tree);
        t.setAnnotation(getAnnotation());
        return t;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return castTo;
    }

    static Node decast(Node n)
    {
        if(n instanceof Cast)
            {
                return ((Cast) n).subtree;
            }
        return n;
    }
}
