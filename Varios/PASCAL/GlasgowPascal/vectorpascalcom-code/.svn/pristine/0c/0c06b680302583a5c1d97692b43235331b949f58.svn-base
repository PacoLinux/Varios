package ilcg.tree;
import java.io.*;
import ilcg.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Op implements Node, Serializable
{

    public static boolean full =false;
    /**
     *  deines operator semantics
     */
    public String Symbol="";
    public String Left=Format.any;
    public String Right=Format.any;
    public String Returns=Format.any;
    IlcgParam param;
    public String sig()
    {
        return Symbol+Left+Right+Returns;
    }
    public int weight()
    {
        return 0;
    } public Node getCost()
    {
        return new Real(weight());
    } public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    /**
     *  True of + and *
     */
    public Op()
    {
        Symbol = Left = Right = Returns = "";
    }
    /**
    create an operator which is a free variable in a pattern
    */
    public Op(IlcgParam p)
    {
        Symbol="param";
        param=p;
    }

    /**
     *  Constructor for the Op object
     *
     *@param  sym      Operator string
     *@param  left     type string
     *@param  right    type string
     *@param  returns  type string
     */
    public Op(String sym, String left, String right, String returns)
    {
        Symbol = sym;
        if(Symbol.equals("/"))Symbol=Node.divide;
        Left = left;
        Right = right;
        Returns = returns;
    }


    /**
     *  Constructor for the Op object
     *
     *@param  sym      Description of Parameter
     *@param  right    Description of Parameter
     *@param  returns  Description of Parameter
     */
    public Op(String sym, String right, String returns)
    {
        Symbol = sym;
        Left = "void";
        Right = right;
        Returns = returns;
    }


    /**
     *  writes: codeForoperation
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        int code = 0;
        if(Symbol.equals(plus))
            {
                code = codeForplus;
            }
        else if(Symbol.equals(satplus))
            {
                code = codeForsatplus;
            }
        else if(Symbol.equals(minus))
            {
                code = codeForminus;
            }
        else if(Symbol.equals(satminus))
            {
                code = codeForsatminus;
            }
        else if(Symbol.equals(times))
            {
                code = codeFortimes;
            }
        else if(Symbol.equals(lt))
            {
                code = codeForlt;
            }
        else if(Symbol.equals(neq))
            {
                code = codeForneq;
            }
        else if(Symbol.equals(le))
            {
                code = codeForle;
            }
        else if(Symbol.equals(ge))
            {
                code = codeForge;
            }
        else if(Symbol.equals(gt))
            {
                code = codeForgt;
            }
        else if(Symbol.equals(eq))
            {
                code = codeForeq;
            }
        else if(Symbol.equals(divide))
            {
                code = codeFordivide;
            }
        else if(Symbol.equals(remainder))
            {
                code = codeForremainder;
            }
        else if(Symbol.equals(and))
            {
                code = codeForand;
            }
        else if(Symbol.equals(or))
            {
                code = codeForor;
            }
        else if(Symbol.equals(xor))
            {
                code = codeForxor;
            }
        else if(Symbol.equals(apply))
            {
                code = codeForapply;
            }
        out.writeByte(code);
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
                if(param!=null) param.examine(e);
            }
        e.leave(this);
    }


    /**
     *  Simply return the integer un modified
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        return this;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Node n)
    {
        if(n instanceof Op)
            {
                Op o = (Op) n;
                return o.Symbol.equals(Symbol) &&
                       o.Left.equals(Left) &&
                       o.Right.equals(Right) &&
                       o.Returns.equals(Returns);
            }
        return false;
    }
    public boolean matches(Node n)
    {
        if(equals(n)) return true;
        if(n instanceof Op) return Symbol.equals(((Op)n).Symbol);
        return false;
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }
    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString(boolean full)
    {
        if(Symbol.equals("param")&& param!=null) return param.toString();
        if(full) return Symbol+"{"+Left+", "+Right+"->"+Returns+"}";
        return Symbol;
    }
    public String toString()
    {
        return toString(full);
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return false;
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


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return Node.int32;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node eval(Number a, Number b)
    {
        // System.out.println("eval "+a+Symbol+b+"->"+Returns);
        if(Returns.equals(Node.ieee64))
            {
                return new Real(eval(a.doubleValue(), b.doubleValue()));
            }
        if(Returns.equals(Node.ieee32))
            {
                return new Real(eval(a.doubleValue(), b.doubleValue()), Returns);
            }
        if(Format.isReal(Left)||Format.isReal(Right))
            return new Int((int)eval(a.doubleValue(),b.doubleValue()),Returns);
        return new ilcg.tree.Int(eval(a.longValue(), b.longValue()), Returns);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        if(Symbol.equals("NOT"))
            {
                return ~b;
            }
        if(Symbol.equals("ABS"))
            {
                return (b>0?b:-b);
            }
        if(Symbol.equals("<<"))
            {
                return a << b;
            }
        if(Symbol.equals(">>"))
            {
                return a >> b;
            }
        if(Symbol.equals("AND"))
            {
                return a & b;
            }
        if(Symbol.equals("OR"))
            {
                return a | b;
            }
        if(Symbol.equals("XOR"))
            {
                return a^b;
            }
        if(Symbol.toLowerCase().equals(Node.remainder))
            {
                return a%b;
            }
        if(Symbol.equals("-"))
            {
                return a - b;
            }
        if(Symbol.equals("+"))
            {
                return a + b;
            }
        if(Symbol.equals("*"))
            {
                return a * b;
            }
        if(Symbol.equals("/"))
            {
                return a / b;
            }
        if(Symbol.equals(Node.divide))
            {
                return a / b;
            }
        if(Symbol.equals("EXTEND"))
            {
                return b;
            }
        if(Symbol.equals(Node.lt))
            {
                return (a < b ? -1 : 0);
            }
        else if(Symbol.equals(Node.gt))
            {
                return (a > b ? -1 : 0);
            }
        else if(Symbol .equals(Node.eq))
            {
                return (a == b ? -1 : 0);
            }
        else if(Symbol .equals(Node.neq))
            {
                return (a != b ? -1 : 0);
            }
        else if(Symbol .equals(Node.le))
            {
                return (a <= b ? -1 : 0);
            }
        else if(Symbol.equals(Node.ge))
            {
                return (a >= b ? -1 : 0);
            }
        else if(Symbol.equals(Node.min))
            {
                return (a<b?a:b);
            }
        else if(Symbol.equals(Node.max))
            {
                return (b<a?a:b);
            }
        else
            System.out.println(" class Op reports error in integer eval of " + Symbol);
        return 0L;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        if(Symbol.equals("-"))
            {
                return a - b;
            }
        if(Symbol.equals("+"))
            {
                return a + b;
            }
        if(Symbol.equals("*"))
            {
                return a * b;
            }
        if(Symbol.equals("/"))
            {
                return a / b;
            }
        if(Symbol.equals(Node.divide))
            {
                return a / b;
            }
        if(Symbol.equals("SIN"))
            {
                return Math.sin(b);
            }
        if(Symbol.equals("COS"))
            {
                return Math.cos(b);
            }
        if(Symbol.equals("ABS"))
            {
                return (b>0?b:-b);
            }
        //if  (Symbol.equals("ABS")) return Math.abs(b);
        if(Symbol.equals("SQRT"))
            {
                return Math.sqrt(b);
            }
        if(Symbol.equals("FLOAT"))
            {
                return b;
            }
        if(Symbol.equals("EXTEND"))
            {
                return b;
            }
        else if(Symbol==Node.min)
            {
                return (a<b?a:b);
            }
        else if(Symbol==Node.max)
            {
                return (b<a?a:b);
            }
        if(Symbol.equals(Node.lt))
            {
                return (a < b ? -1 : 0);
            }
        else if(Symbol.equals(Node.gt))
            {
                return (a > b ? -1 : 0);
            }
        else if(Symbol .equals(Node.eq))
            {
                return (a == b ? -1 : 0);
            }
        else if(Symbol .equals(Node.neq))
            {
                return (a != b ? -1 : 0);
            }
        else if(Symbol .equals(Node.le))
            {
                return (a <= b ? -1 : 0);
            }
        else if(Symbol.equals(Node.ge))
            {
                return (a >= b ? -1 : 0);
            }
        //	System.out.println(" class Op reports error in real eval of " + Symbol);
        return b;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@param  c  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static Op sum(String a, String b, String c)
    {
        return new sum(a, b, c);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@param  c  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static Op dif(String a, String b, String c)
    {
        return new dif(a, b, c);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@param  c  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static Op prod(String a, String b, String c)
    {
        return new prod(a, b, c);
    }


    /**
     *  Description of the Method
     *
     *@param  arg   Description of Parameter
     *@param  oper  Description of Parameter
     *@return       Description of the Returned Value
     */
    public static Op cond(String arg, String oper)
    {
        return new Condition(arg, oper);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@param  c  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static Op div(String a, String b, String c)
    {
        return new div(a, b, c);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@param  c  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static Op mod(String a, String b, String c)
    {
        return new mod(a, b, c);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static Op toReal(String a)
    {
        return new toReal(a);
    }
// public static Op deRef(String t){return new Deref(t);}
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class sum extends Op
{


    /**
     *  Constructor for the sum object
     *
     *@param  left   Description of Parameter
     *@param  right  Description of Parameter
     *@param  res    Description of Parameter
     */
    public sum(String left, String right, String res)
    {
        super(Node.plus, left, right, res);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return true;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        return b + a;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        return b + a;
    }
}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class prod extends Op
{


    /**
     *  Constructor for the prod object
     *
     *@param  left   Description of Parameter
     *@param  right  Description of Parameter
     *@param  res    Description of Parameter
     */
    public prod(String left, String right, String res)
    {
        super(Node.times, left, right, res);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return true;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        return a * b;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        return a * b;
    }
}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class dif extends Op
{


    /**
     *  Constructor for the dif object
     *
     *@param  left   Description of Parameter
     *@param  right  Description of Parameter
     *@param  res    Description of Parameter
     */
    public dif(String left, String right, String res)
    {
        super(Node.minus, left, right, res);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        return a - b;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        //System.out.println("floating point subtract "+a+b);
        return a - b;
    }
}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class Condition extends Op
{


    /**
     *  Constructor for the Condition object
     *
     *@param  args  Description of Parameter
     *@param  oper  Description of Parameter
     */
    public Condition(String args, String oper)
    {
        super(oper, args, args, Node.int8);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        if(Symbol .equals(Node.lt))
            {
                return (a < b ? -1 : 0);
            }
        else if(Symbol .equals(Node.gt))
            {
                return (a > b ? -1 : 0);
            }
        else if(Symbol .equals(Node.eq))
            {
                return (a == b ? -1 : 0);
            }
        else if(Symbol .equals(Node.neq))
            {
                return (a != b ? -1 : 0);
            }
        else if(Symbol .equals(Node.le))
            {
                return (a <= b ? -1 : 0);
            }
        else if(Symbol .equals(Node.ge))
            {
                return (a >= b ? -1 : 0);
            }
        System.out.println(" class Condition reports error in int eval of " + Symbol);
        return 0;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        if(Symbol == Node.lt)
            {
                return (a < b ? -1 : 0);
            }
        else if(Symbol == Node.gt)
            {
                return (a > b ? -1 : 0);
            }
        else if(Symbol == Node.eq)
            {
                return (a == b ? -1 : 0);
            }
        else if(Symbol == Node.neq)
            {
                return (a != b ? -1 : 0);
            }
        else if(Symbol == Node.le)
            {
                return (a <= b ? -1 : 0);
            }
        else if(Symbol == Node.ge)
            {
                return (a >= b ? -1 : 0);
            }
        System.out.println(" class Condition reports error in real eval of " + Symbol);
        return 0;
    }
}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class div extends Op
{


    /**
     *  Constructor for the div object
     *
     *@param  left   Description of Parameter
     *@param  right  Description of Parameter
     *@param  res    Description of Parameter
     */
    public div(String left, String right, String res)
    {
        super(Node.divide, left, right, res);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        return a / b;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        return a / b;
    }
}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class mod extends Op
{


    /**
     *  Constructor for the mod object
     *
     *@param  left   Description of Parameter
     *@param  right  Description of Parameter
     *@param  res    Description of Parameter
     */
    public mod(String left, String right, String res)
    {
        super(Node.remainder, left, right, res);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean commutes()
    {
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        return a % b;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        return a % b;
    }
}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class toReal extends Op
{


    /**
     *  Constructor for the toReal object
     *
     *@param  right  Description of Parameter
     */
    public toReal(String right)
    {
        super("(" + Node.ieee64 + ")", right, Node.ieee64);
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    long eval(long a, long b)
    {
        return b;
    }


    /**
     *  Description of the Method
     *
     *@param  a  Description of Parameter
     *@param  b  Description of Parameter
     *@return    Description of the Returned Value
     */
    double eval(double a, double b)
    {
        return b;
    }
}

