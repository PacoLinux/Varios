
package ilcg.tree;

import ilcg.*;
import java.io.*;


public class Const extends Cast implements Serializable
{
    public boolean matches(Node n)
    {
        if(equals(n))return true;
        if(n.knownAtCompileTime())
            {
                return subtree.matches(n);
            }
        return false;
    }

    public boolean matches(Node n,SymbolTable D)
    {
        if(equals(n))return true;
        if(n.knownAtCompileTime())
            {
                return Pattern.matchPusingDtoC(subtree,  D, n);
            }
        return false;
    }

    public Const(Node n)
    {
        super("const", n);
    }
}
