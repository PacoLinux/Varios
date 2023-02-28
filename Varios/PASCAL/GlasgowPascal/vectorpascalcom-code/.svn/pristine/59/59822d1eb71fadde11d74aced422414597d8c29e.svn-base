package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


/**
 *  class to represent procedures
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class ProcType extends Type implements Serializable {
    Hashtable paramscope=new Hashtable();
    public Hashtable getParamScope() {
        return paramscope;
    }
    public void setParamScope(Hashtable d) {
        paramscope.putAll(d);
    }
    /**
     *  formal parameter types
     */
    public Type[] params = { null};

    /**
     *  type returned
     */
    public Type returns = null;

    /**
     *  count of params
     */
    public int numparams = 0;

    /**
     * A function is pure if it does not update any shared states.
     */
    private boolean pure = false;
    /** true for class methods */
    public boolean method = false;
    /**
     *  the implementation
     */
    public Procedure theProc;

    /**
     *  Constructor for the ProcType object
     *
     *@param  a  Description of Parameter
     */
    public ProcType(Procedure a) {
        theProc = a;
    }

    /**
     *  Constructor for the ProcType object
     *
     *@param  a           Procedure from which type is being built
     *@param  paramcount  number of parameters
     *@param  vpar        vector of the parameter types
     *@param  returnType  return type
     */
    public ProcType(Procedure a, int paramcount, Vector vpar, Type returnType) {
        returns = returnType;
        numparams = paramcount;
        theProc = a;
        params = new Type[numparams];
        for(int i = 0; i < numparams; i++) {
            params[i] = (Type) vpar.elementAt(i);
        }
    }

    /**
     *  A method that is used by an examiner to visit all locations. This must call
     *  examine on all its subtrees if e.visit(this) is true.
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e) {}

    /**
     *  A method that must beinstantiated allowing a TreeModifier to substitute
     *  values into the tree. if e.visit(this) is false the method should return
     *  this.
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m) {
        return this;
    }

    /**
     *  Description of the Method
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
    }
    public String paramtypes() {
        String res = "[";
        for(int i = 0; i < params.length; i++) {
            res = res + params[i];
            if(i < (params.length - 1)) {
                res = res + ", ";
            }
        }
        return res +  "]";
    }
    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        String res = "procedure(";
        if(method) res="virtual "+res;
        for(int i = 0; i < params.length; i++) {
            res = res + params[i];
            if(i < (params.length - 1)) {
                res = res + ", ";
            }
        }
        return res + "->" + returns + ")";
    }

    /**
     *  Description of the Method
     *
     *@param  processor the processor for which size of element is returned
     *@return            number of bytes in the object
     */
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
    }

    /**
     * @return true if the function is pure, false otherwise
     */
    public boolean isPure() {
        return pure;
    }

    /**
     * Declares the function as pure
     */
    public void setPure() {
        pure = true;
    }

    /**
     *  Description of the Method
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Type t) {
        boolean ok = t instanceof ProcType;
        if(ok) {
            ProcType pt = (ProcType) t;
            if(pt.numparams != numparams) {
                return false;
            }
            if(returns == null && pt.returns != null) {
                return false;
            }
            if(pt.returns == null && returns != null) {
                return false;
            }
            ok = returns.equals(pt.returns);
            for(int i = 0; i < numparams; i++) {
                ok = ok && pt.params[i].equals(params[i]);
            }
            return ok;
        }
        return false;
    }

}
