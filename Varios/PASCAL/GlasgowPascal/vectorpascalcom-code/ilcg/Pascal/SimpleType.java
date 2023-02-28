
package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class SimpleType extends Type implements Serializable {

    int size;

    /**
     *  Constructor for the SimpleType object
     */
    SimpleType() {
        size = 1;
        type = Node.octet;
    }

    /**
     *  Constructor for the SimpleType object
     *
     *@param  representation  Description of Parameter
     *@param  Size            Description of Parameter
     */
    SimpleType(String representation, int Size) {
        size = Size;
        type = representation;
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

    /**
     * check type equality
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object t) {
        if(t instanceof SimpleType) {
            return type.equals(((SimpleType) t).type);
        }
        return false;
    }

    public  boolean equals(Type t) {
        return equals((Object)t);
    }
    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public long sizeOf(Walker processor) {
        return size;
    }

    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public String codeGenRepresentation(Walker processor) {
        return type;
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

}
