package ilcg.tree;
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Compiler tools for mmx optimisation
/** represents types in ilcg trees */
import java.io.*;
import ilcg.*;
public abstract class Type implements Node,Serializable
{
    /** the sizeof method returns the number of bytes the
        type will take up on the specified processor */
    public abstract long sizeOf(Walker processor);
    public int alignment(Walker processor)
    {
        return (int)sizeOf(processor);
    }
    public int weight()
    {
        return 0;
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    public Node getCost()
    {
        return new Real(0);
    }
    public abstract boolean equals(Type t);
    public String codeGenRepresentation(Walker processor)
    {
        return size2rep(sizeOf(processor));
    }
    public String type;
    public Type()
    {
        type="void";
    }
    public Type(String t)
    {
        type=t;
    }
    public boolean knownAtCompileTime()
    {
        return true;
    }
    public Node eval()
    {
        return this;
    }
    public boolean equals(Object t)
    {
        if(t instanceof Type)
            {
                return equals((Type)t);
            }
        return false;
    }
    public boolean matches(Node n)
    {
        return equals(n);
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(!(n instanceof Type))
            {
                return false;
            }
        return type.equals(((Type) n).type) ;
    }
    public String returnType()
    {
        return type;
    }
    public String toString()
    {
        return type;
    }
    public String sig()
    {
        return "T"+type;
    }
    public String size2rep(long i)
    {
        if(i==1)return Node.octet;
        if(i==2)return Node.halfword;
        if(i==4)return Node.word;
        if(i==8)return Node.doubleword;
        return Node.octet+"["+i+"]";
    }
    public void examine(TreeExaminer e)
    {
        if(e.visit(this)) {}
        e.leave(this);
    }
}

