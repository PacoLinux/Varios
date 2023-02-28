
package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


/**
 This is a structure to hold Pascal user defined operators */

public class UserDefinedOperator extends Op {
    Object next;
    String symbol;
    ProcType theFunction;
    Node identityElement;
    public String toString() {
        return symbol+"implemented by"+theFunction;
    }
    public ProcType getProc() {
        return theFunction;
    }

    public Type getLeftType() {
        return theFunction.params[0];
    }

    public Type getRightType() {
        return theFunction.params[1];
    }

    public UserDefinedOperator(Object n, String sym, ProcType fn, Node id) {
        next = n;
        symbol = sym;
        theFunction = fn;
        identityElement = id;
    }
}

