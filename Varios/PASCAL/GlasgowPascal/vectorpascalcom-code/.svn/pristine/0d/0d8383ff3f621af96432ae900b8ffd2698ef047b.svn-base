
//Title:        ilcg.tree.SubField
//Version:
//Copyright:    Copyright (c)2001
//Author:       Paul Cockshott
//Company:
//Description:  storage location representation


package ilcg.tree;
import java.io.*;
import ilcg.*;
/** this clas encodes the operation of selecting a sub field of some value
    */
public class SubField implements Node,Serializable
{
    Node subtree;
    public int lowbit,highbit;
    String dataformat;
    public String sig()
    {
        return subtree.sig()+lowbit+".."+highbit+dataformat;
    }
    /** writes subtree codeForLocation */
    public void toBinary(DataOutputStream out)throws IOException
    {
        subtree.toBinary(out);
        out.writeByte(codeForSubField);
    }
    public int[] weights()
    {
        return subtree.weights();
    }
    public int weight()
    {
        return subtree.weight();
    } public Node getCost()
    {
        return new Real(weight());
    }

    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                if(subtree!=null)subtree.examine(e);
            }
        e.leave(this);
    }
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                return new SubField(m.modified(subtree),lowbit,dataformat);
            }
        return this;
    }
    public boolean matches(Node n)
    {
        if(n instanceof SubField)
            {
                SubField s= (SubField)n;
                return s.lowbit==lowbit&& s.highbit==highbit&&dataformat.equals(s.dataformat)&&
                       subtree.matches(s.subtree);
            }
        return false;
    }
    public boolean matches(Node n, SymbolTable D)
    {
        return matches(n);
    }
    public boolean equals(Object n)
    {
        if(n instanceof SubField)
            {
                SubField s= (SubField)n;
                return s.lowbit==lowbit&& s.highbit==highbit&&dataformat.equals(s.dataformat)&&
                       subtree.equals(s.subtree);
            }
        return false;
    }
    public String toString()
    {
        subtree=subtree.eval();
        if(knownAtCompileTime())
            {
                if(subtree instanceof Int)
                    {
                        if(highbit==7&&lowbit ==0)return new Int(((Int)subtree).intValue()&255,dataformat).toString();
                        if(highbit==15&&lowbit ==0)return new Int(((Int)subtree).intValue()&0xffff,dataformat).toString();
                        return new Int(((Int)subtree).longValue(),dataformat).toString();
                    }
                if(subtree instanceof Int)
                    {
                        if(highbit==7&&lowbit ==0)return new Int(((Int)subtree).intValue()&255,dataformat).toString();
                        if(highbit==15&&lowbit ==0)return new Int(((Int)subtree).intValue()&0xffff,dataformat).toString();
                        return new Int(((Int)subtree).longValue(),dataformat).toString();
                    }
            }
        return (Dyad.infix? ""+subtree:"SubField("+subtree+", "+lowbit+","+dataformat+")");
    }
    void crash()
    {
        int x=2;
        x=x-2;
        x=x/x;
    }
    /** define a sublocation of node n starting at startbit of the given type */
    public SubField(Node n, int startbit, String type)
    {
        dataformat=type;
        subtree=n;
        lowbit=startbit;
        highbit = lowbit+Format.lengthInBits(dataformat)-1;
    }
    /** returns the value of which this is a subfield */
    public Node getSubtree()
    {
        return subtree;
    }
    /** Return true if the original register is >= 4 times the field being selected */
    public boolean decomposable()
    {
        return	Format.lengthInBits(subtree.returnType())>= 4* Format.lengthInBits(dataformat);
    }

    public SubField decompose()throws Exception
    {
        Node n=new SubField(subtree,lowbit, Format.halftype(subtree.returnType()));
        return new SubField(n,0,dataformat);
    }
    public boolean knownAtCompileTime()
    {
        return subtree.knownAtCompileTime();
    }
    public Node eval()
    {
        subtree= subtree.eval();
        if(knownAtCompileTime())
            {
                if(subtree instanceof Int)
                    {
                        if(highbit==7&&lowbit ==0)return new Int(((Int)subtree).intValue()&255,dataformat);
                        if(highbit==15&&lowbit ==0)return new Int(((Int)subtree).intValue()&0xffff,dataformat);
                        return new Int(((Int)subtree).longValue(),dataformat);
                    }
                if(subtree instanceof Int)
                    {
                        if(highbit==7&&lowbit ==0)return new Int(((Int)subtree).intValue()&255,dataformat);
                        if(highbit==15&&lowbit ==0)return new Int(((Int)subtree).intValue()&0xffff,dataformat);
                        return new Int(((Int)subtree).longValue(),dataformat);
                    }
            }
        return this;
    }
    public String returnType()
    {
        return dataformat;
    }
}
