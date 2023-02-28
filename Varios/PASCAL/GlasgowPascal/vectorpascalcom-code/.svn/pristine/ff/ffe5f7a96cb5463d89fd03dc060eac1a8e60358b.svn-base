

package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


/**
 *  represents a subscription  of pascal arrays evalueates to a Memref
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class ArraySubscription extends Memref implements Serializable {
    ArrayType at;
    Node base;
    Node[] indices;
    Node getLastIndex() {
        return indices[indices.length-1];
    }
    ArraySubscription(ArrayType At, Node Base, Node[] Indices)throws Exception {
        base = Base;
        at = At;
        indices = Indices;
        Memref res = (Memref) at.indexArray(base, indices);
        index = res.index;
        retType = res.returnType();
    }
    /**
    * returns the start of the array
    */
    public Node getArrayStart() {
        return at.getStartOfData(base);
    }
    /**
     *  examine node used by tree walkers
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e) {
        if(e.visit(this)) {
            for(int i = 0; i < indices.length; i++) {
                indices[i].examine(e);
            }
            base.examine(e);
            index.examine(e);
        }
        e.leave(this);
    }

    /**
     *  method that allows a TreeModifier to change this node
     *
     *@param  m  the modifier
     *@return    a new node if modified
     */
    public Node modify(TreeModifier m) {
        if(m.visit(this)) {
            try {
                Node[] newindices = new Node[indices.length];
                for(int i = 0; i < indices.length; i++) {
                    newindices[i] = m.modified(indices[i]);
                }
                return new ArraySubscription(at, m.modified(base), newindices);
            }
            catch(Exception e) {
                System.out.println("in ArraySubscription.modify" + e);
            }
        }
        return this;
    }

    public boolean parallelisablewith(Node lastindex) {
        Node target=decast(indices[indices.length - 1]);
        lastindex=decast(lastindex);
        return parallelisablewith(lastindex,target);
    }
    boolean parallelisablewith(Node lastindex,Node target) {
//  System.out.println(" in array subscription parallelisablewith\n"+
//        " parameter lastindex = "+lastindex+
//       "\n actual lastindex  = "+target);
        if((lastindex).equals(target)||
                ((target instanceof Dyad)
                 &&(
                     ((Dyad)target).O.Symbol.equals("+")||((Dyad)target).O.Symbol.equals("-")
                 )
                 &&
                 ((((Dyad)target).left.equals(lastindex)&&((Dyad)target).right.knownAtCompileTime())||
                  (((Dyad)target).right.equals(lastindex))&&((Dyad)target).left.knownAtCompileTime())
                ))return true
                             ;
        if(target instanceof Cast)return parallelisablewith(lastindex,  decast(target));
        if(target instanceof ArraySubscription) return ((ArraySubscription)target).parallelisablewith(lastindex);
        if(target instanceof Monad) {
            Monad m = (Monad)target;
            if(m.oper.Symbol.equals("EXTEND")||m instanceof Deref)
                //return lastindex.equals(m.getArg());
                return parallelisablewith(lastindex, (m.getArg()));
        }
        return false;
    }

    /** parallelise the substcription by the specified parallelism factor,but
     throws an exception if the lastindex on which parallelism is being attempted
     is not actually the last index that is being used */
    Memref parallelise(int parfactor, Node lastindex)throws Exception {
        //System.out.println("Parallelise "+this+" with "+lastindex);
        if(!parallelisablewith(lastindex)) {
            String mess= " attempt to parallelise array accessed on wrong index \n"
                         + lastindex + " \nwhen last index should be \n"
                         + indices[indices.length - 1];
            //System.out.println("in ArraySubscription error "+mess);
            throw	new Exception(mess);
        }
        Memref res = new Memref(index.eval(),
                                parallelise(returnType(), parfactor));
        //  System.out.println("in ArraySubscription parallelised to "+res);
        return res;
    }

    Node decast(Node n) {
        if(n instanceof Cast) {
            return decast(((Cast) n).getSubtree());
        }
        return n;
    }

    String parallelise(String type, int parfactor) {
        return type + " vector ( " + parfactor + " )";
    }

    public String toString(boolean b) {
        String start = base.toString() + "<<";
        for(int i = 0; i < indices.length; i++) {
            start = start + (i>0?", ":"") + indices[i];
        }
        return start + ">>";
    }
}

