
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  Your description
package ilcg.tree;
import ilcg.*;
public class Ref extends Format implements java.io.Serializable
{
    Node f;
    public Ref(Node n)
    {
        super("ref");
        f=n;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        if(n instanceof Format)
            {
                String t= n.returnType();
                if(isRef(t))
                    {
                        return f.matches(new Format(typeDeref(t)),D);
                    }
            }
        return n.returnType().equals(returnType());
    }
    public String toString()
    {
        return "ref "+f;
    }
    public String returnType()
    {
        return "ref "+f.returnType();
    };
    public String returnFormat()
    {
        return "word";
    }
    public Node refTo()
    {
        return f;
    }

}
