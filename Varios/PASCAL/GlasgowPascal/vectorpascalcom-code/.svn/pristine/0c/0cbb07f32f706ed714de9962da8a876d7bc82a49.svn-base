package ilcg.tree;
import java.io.*;
import java.util.*;
import ilcg.*;
public class RegisterStack implements Node,Serializable
{
    String stackname;
    String stacktype;
    int maxDepth;
    public int depthUsed=0;
    public String sig()
    {
        return stackname;
    }
    /** writes stackname codeForRegisterStack */
    public void toBinary(DataOutputStream out)throws IOException
    {
        Loader.toBinary(out,stackname)	;
        out.writeByte(codeForRegisterStack);
    }

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
    public boolean matches(Node n)
    {
        return equals(n);
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }

    public void examine(TreeExaminer e)
    {
        if(e.visit(this)) {}
        e.leave(this);
    }
    public Node modify(TreeModifier m)
    {
        return this;
    }

    public RegisterStack(String name, String type, int depth,MyRegSet registerSet, Dictionary index)
    {
        stackname=name;
        stacktype=type;
        maxDepth=depth;
        registerSet.add(this);
        index.put(name,this);
    }
    public String toString()
    {
        return stackname;
    }
    public Node eval()
    {
        return this;
    }
    public boolean knownAtCompileTime()
    {
        return false;
    }
    public String returnType()
    {
        return stacktype;
    }
}
