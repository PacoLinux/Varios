package ilcg.tree;

import java.io.*;
import java.util.*;
import ilcg.*;
/**
 * Class used to represent a machable pattern in the version 2 walker
 *
 * @author     Paul Cockshott
 * @created    22 December 2005
 */
public class Pattern implements Node,Serializable
{
    final static int labtag   = 0;
    final static int patalt   = 1;
    final static int regalt   = 2;
    final static int parmpat  = 3;
    final static int formpat  = 4;
    final static int oppat    = 5;
    int patform               = 0;
    Pattern[] alts;
    IlcgParam[] parameters;
    Register[] regs;
    Node means;
    Object[] assembles;
    String op, asm;
    String name= "?";
    public void setName(String s)
    {
        name=s;
    }
    /**
     *  inherited from node
     *
     * @return    a string representation of a type
     */
    public String returnType()
    {
        switch(patform)
            {
            case patalt:
            {
                String s="";
                for(int i=0; i<alts.length; i++)
                    {
                        s=s+  alts[i].returnType();
                        if(i<alts.length-1)s=s+"|";
                    }
                return s;
            }
            case regalt:
                return regs[0].returnType();
            case formpat:
            case parmpat:
                return means.returnType();
            }
        return "void";
    }
    Pattern()
    {
        patform = 0;
    }

    /**
     *Constructor for the Pattern object
     *
     * @param  a  Description of the Parameter
     */
    public Pattern(Pattern[] a)
    {
        patform = patalt;
        alts = a;
    }

    /**
     *Constructor for the Pattern object
     *
     * @param  r  Description of the Parameter
     */
    public Pattern(Register[] r)
    {
        patform = regalt;
        regs = r;
    }

    /**
     *Constructor for the Pattern object
     *
     * @param  params    Description of the Parameter
     * @param  tree      Description of the Parameter
     * @param  assembly  Description of the Parameter
     */
    public Pattern(IlcgParam[] params, Node tree, Object[] assembly)
    {
        parameters = params;
        patform = parmpat;
        means = tree;
        assembles = assembly;
    }

    /**
     *Constructor for the Pattern object
     *
     * @param  f  Description of the Parameter
     */
    public Pattern(Format f)
    {
        patform = formpat;
        means = f;
    }

    Pattern(String IlcgOperator, String assemblerVersion)
    {
        patform = oppat;
        op = IlcgOperator;
        assemblerVersion = asm;
    }
    public static boolean PassociatedToC(Node P, SymbolTable D, Node C)
    {
        System.out.println("\tis " + C + "\tassociated to " + P + "\t:" + P.getClass());
        Object Cassociations  = D.get(C);
        if(Cassociations != null)
            try
                {
                    Hashtable va            = (Hashtable) Cassociations;
                    boolean ok=(va.get(P)!=null);
                    if(!ok) System.out.println("\tNO");
                    else System.out.println("\tYES");
                    return ok;
                }
            catch(Exception e)
                {
                    System.out.println("caught " + e);
                    System.out.println("P=" + P + "\t:" + P.getClass());
                    return false;
                }
        else
            {
                System.out.println("no associations of "+C);
            }
        return false;
    }
    /**
     *in the following
     *P is a pattern to be matched, C is a code tree that is to be matched to it
     *
     * @param  P  Description of the Parameter
     * @param  D  Description of the Parameter
     * @param  C  Description of the Parameter
     * @return    Description of the Return Value
     */
    public static boolean matchPusingDtoC(Node P, SymbolTable D, Node C)
    {
        if(PassociatedToC(P,D,C))return true;
        try
            {
                if(P.matches(C,D))
                    return true;
            }
        catch(Exception e)
            {
                System.out.println("caught " + e);
                System.out.println("P=" + P + "\t:" + P.getClass());
                return false;
            }
        return false;
    }

    boolean matchusingDtoC(SymbolTable D, Node C)
    {
        boolean ok;
        //	System.out.println( "\t" + C + "\t" + toString() );
        //System.out.println("patform ="+patform);
        try
            {
                switch(patform)
                    {
                    case oppat:
                        return op.equals(C.toString());
                    case formpat:
                    case parmpat:
                        D.enterScope();
                        //	System.out.println(toString()+C);
                        ok = means.matches(C, D);
                        D.leaveScope();
                        return ok;
                    case regalt:
                        for(int i = 0; i < regs.length; i++)
                            if(regs[i].matches(C, D))
                                return true;
                        return false;
                    case patalt:
                        for(int i = 0; i < alts.length; i++)
                            if(alts[i].matches(C,D))
                                return true;
                        return false;
                    }
            }
        catch(Exception e)
            {
                System.out.println("caught " + e);
                System.out.println("P=" + this + "\tC=" + C);
                return false;
            }
        return false;
    }

    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     * @param D a dictionary holding associations built up by BUR process
     * @return    Description of the Return Value
     */
    public boolean matches(Node n, SymbolTable D)
    {
        System.out.println("\t"+n+"\tto "+toString());
        return matchusingDtoC(D, n);
    }
    public boolean matches(Node n)
    {
        return matches(n, new SymbolTable(new Hashtable()));
    }
    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value#
     */
    public String toString()
    {
        String head = name +" ";
        if(patform == parmpat)
            {
                head  = head+"pattern(";
                for(int i = 0; i < parameters.length; i++)
                    head = head + (i == 0 ? " " : ";") + parameters[i];
                String s     = ") means[" + (means == null ? "null" : means.toString()) + "]\n\t\tassembles [";
                for(int i = 0; i < assembles.length; i++)
                    s += " " + (null == assembles[i] ? "null" : printable(i));
                return head + s + "]";
            }
        if(patform == patalt)
            {
                String s  = head+"pattern means[";
                for(int i = 0; i < alts.length; i++)
                    s += " " + (null == alts[i] ? "null" : ((i == 0 ? "\n\t\t" : "\n\t\t|") +
                                                            (alts[i]instanceof Pattern?((Pattern)alts[i]).name:alts[i].toString()))
                               );
                return s + "]";
            }
        if(patform == formpat)
            {
                return means.toString();
            }
        if(patform == regalt)
            {
                String s  = head +"pattern means[";
                for(int i = 0; i < regs.length; i++)
                    s += (i == 0 ? " " : "|") + (null == regs[i] ? "null" : regs[i].toString());
                return s + "]";
            }
        return "pattern";
    }

    String printable(int i)
    {
        String q  = "'";
        if(assembles[i] instanceof String)
            return q + assembles[i].toString() + q;
        return (assembles[i].toString());
    }




    /**
     *  output to a binary file in postfix
     *
     * @param  out              Description of the Parameter
     * @exception  IOException  Description of the Exception
     */
    public void toBinary(DataOutputStream out)
    throws IOException
    {
        means.toBinary(out);
        out.writeByte(codeForIlcgPattern);
    }


    /**
     *  Description of the Method
     *
     * @param  m  Description of the Parameter
     * @return    Description of the Return Value
     */
    public Node modify(TreeModifier m)
    {
        return this;
    }


    /**
     *  Description of the Method
     *
     * @param  e  Description of the Parameter
     */
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                means.examine(e);
            }
        e.leave(this);
    }



    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public int weight()
    {
        return 0;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public Node eval()
    {
        return this;
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String sig()
    {
        return means.sig();
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public boolean knownAtCompileTime()
    {
        return false;
    }

}

