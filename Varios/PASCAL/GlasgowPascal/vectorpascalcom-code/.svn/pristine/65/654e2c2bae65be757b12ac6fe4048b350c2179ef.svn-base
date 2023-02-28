
// Title:        ilcg
// Version:
// Copyright:    Copyright (c) 1999
// Author:   paul Cockshott
// Company:      Faraday
// Description:  Intermediat language for code generation
package ilcg.tree;

import ilcg.*;
import java.io.*;
import java.util.*;

/**
 *  Ancestor of all tree types. Contains static field giving the byte codes used
 *  for the binary encoding of ilcg trees in reverse polish form.
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public interface Node
{
    /** Give an expression which evaluates to a cost of an operation in memory accesses */
    public Node getCost();
    /**
     *  Nodes are used to represent the ILCG tree, and in the root class we declare
     *  the terminal symbols of the language as strings
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime();

    /** gives a string describing the grammar of the tree but with details
     about specific constants elided */
    public String sig();

    /**
     *  evaluate expressions known at compile time
     *
     *@return    Description of the Returned Value
     */
    public Node eval();

    /** returns a rough estimate of the number of registers
     needed to compile this sub tree
     */
    public int weight();
    /** returns an exact estimate of the number of registers
     needed to compile this sub tree by typecode of the registers
     * The result is an array indexed by type code that tells you
     * how many registers of each type code are needed.
     */
    public int[] weights();

    /**
     *  A method that is used by an examiner to visit all locations. This must call
     *  examine on all its subtrees if e.visit(this) is true.
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e);
    public final static int codeForAlternative = 47;
    public final static int codeForand = 19;
    public final static int codeForapply = 22;
    public final static int codeForAssign = 37;
    public final static int codeForBlock = 40;
    public final static int codeForCartesian = 42;
    public final static int codeForCast = 34;
    public final static int codeForCharlit = 28;
    public final static int codeForDeref = 35;
    public final static int codeFordivide = 12;
    public final static int codeForend = 0;
    public final static int codeForeq = 11;
    public final static int codeForFor = 23;
    public final static int codeForFormat = 39;
    public final static int codeForFP = 33;
    public final static int codeForge = 9;
    public final static int codeForGoto = 29;
    public final static int codeForgt = 10;
    public final static int codeForIf = 24;
    public final static int codeForIlcgParam = 48;
    public final static int codeForIlcgPattern = 49;
    public final static int codeForInteger = 27;
    public final static int codeForintlit = 15;
    public final static int codeForle = 8;
    public final static int codeForLocalStoreAllocator = 41;
    public final static int codeForLocation = 45;
    public final static int codeForlt = 6;
    public final static int codeForMemref = 32;
    public final static int codeForminus = 3;
    public final static int codeForneq = 7;
    public final static int codeFornoval = 16;
    public final static int codeForor = 20;
    public final static int codeForPlantLab = 30;
    public final static int codeForplus = 1;
    public final static int codeForpop = 18;
    public final static int codeForProc = 25;
    public final static int codeForpush = 17;
    public final static int codeForReal = 26;
    public final static int codeForRegister = 44;
    public final static int codeForRegisterStack = 43;
    public final static int codeForremainder = 13;
    public final static int codeForsatminus = 4;
    public final static int codeForsatplus = 2;
    public final static int codeForStatement = 36;
    public final static int codeForstore = 14;
    public final static int codeForString = 31;
    public final static int codeForSubField = 46;
    public final static int codeFortimes = 5;
    public final static int codeForxor = 21;
    public final static String abs ="ABS";
    public final static String and = "AND";
    public final static String any = "any";
    public final static String apply = "APPLY";
    public final static String bit = "bit";
    public final static String bra = "(";
    public final static String bss = "bss";
    public final static String contains ="CONTAINS";
    public final static String cos ="COS";
    public final static String divide = "div";
    public final static String dot = ".";
    public final static String doubleword = "doubleword";
    public final static String eq = "=";
    public final static String extend ="EXTEND";
    public final static String flt ="FLOAT";
    public final static String free="FREE";
    public final static String ge = ">=";
    public final static String gt = ">";
    public final static String halfword = "halfword";
    public final static String ieee32 = "ieee32";
    public final static String ieee64 = "ieee64";
    public final static String int16 = "int16";
    public final static String int32 = "int32";
    public final static String int64 = "int64";
    public final static String int8 = "int8";
    public final static String intlit = "digits";
    public final static String ket = ")";
    public final static String le = "<=";
    public final static String ln = "LN";
    public final static String lt = "<";
    public final static String max = "MAX";
    public final static String MAX = "MAX";
    public final static String min = "MIN";
    public final static String MIN = "MIN";
    public final static String minus = "-";
    public final static String neq = "<>";
    public final static String not ="NOT";
    public final static String noval = "void";
    public final static String octet = "octet";
    public final static String or = "OR";
    public final static String plus = "+";
    public final static String pop = "POP";
    public final static String push = "PUSH";
    public final static String quadword = "quadword";
    public final static String range = "range";
    public final static String remainder = "mod";
    public final static String rep = "rep";
    public final static String round ="ROUND";
    public final static String satminus = "-:";
    public final static String satmult = "*:";
    public final static String satplus = "+:";
    public final static String sin = "SIN";
    public final static String shl = "<<";
    public final static String shr = ">>";
    public final static String store = "store";
    public final static String sqr = "SQR";
    public final static String sqrt = "SQRT";
    public final static String tan ="TAN";
    public final static String times = "*";
    public final static String truncate ="TRUNCATE";
    public final static String uint16 = "uint16";
    public final static String uint32 = "uint32";
    public final static String uint64 = "uint64";
    public final static String uint8 = "uint8";
    public final static String word = "word";
    public final static String xor = "XOR";
    /**
     *  A method that must beinstantiated allowing a TreeModifier to substitute
     *  values into the tree. if e.visit(this) is false the method should return
     *  this.
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */

    public Node modify(TreeModifier m);

    /**
     *  This method must save a node in postfix binary notation on the output
     *  stream
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException;

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType();

    /**
     *  check exact equality of trees
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object n);
    /** Check if similar enough for code generation purposes */
    public boolean matches(Node n);
    /** Check if similar enough for code generation purposes with use of rewrite rules stored in D */
    public boolean matches(Node n,SymbolTable D);

}


// public
interface TreeModifiern
{

    /** This is called each time a node is visited, but before any subtrees are visited. If it returns
     false the subtree below the node is not visited */
    public boolean visit(Node n);

    /** This returns the rewritten node n */
    public Node modified(Node n);
}


interface TreeExaminern
{

    /** This is called each time a node is visited, but before any subtrees are visited. If it returns
     false the subtree below the node is not visited */

    public boolean visit(Node n);

    /** This is called after all subtrees have been visited */
    public void leave(Node n);
}

