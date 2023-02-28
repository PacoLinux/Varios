
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
class RecordType extends Type implements Serializable {

    long size;
    String form = "";
    Vector variantpart, fixedpart;
    Dictionary lookuptable;

    // ------------------------------------------------

    // constructors

    /**
     *  Constructor for the RecordType object
     */
    public RecordType() {
        variantpart = new Vector();
        size = 0;
        type = (Node.octet + " vector ( " + size + " )");
        fixedpart = variantpart;
        lookuptable = new Hashtable();
        scanLookuptable();
    }

    /**
     *  pass in the record sie, and vectors of the fixed and variant field types.
     *  Last parameter is a dictionary associating names with the typed fields
     *
     *@param  sizeInBytes  Description of Parameter
     *@param  fixed        Description of Parameter
     *@param  variants     Description of Parameter
     *@param  d            Description of Parameter
     */
    public RecordType(int sizeInBytes, Vector fixed, Vector variants, Dictionary d) {
        size = sizeInBytes;
        if(size == 0) {
            size = 1;
        }
        type = (Node.octet + " vector ( " + size + " )");
        variantpart = variants;
        fixedpart = fixed;
        lookuptable = d;
        scanLookuptable();
    }

    // -------------------------------------------------

    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public String codeGenRepresentation(Walker processor) {
        return (Node.octet + " vector ( " + sizeOf(processor) + " )");
    }

    /**
     *  Description of the Method
     *
     *@param  w  Description of Parameter
     *@return    Description of the Returned Value
     */
    public long sizeOf(Walker w) {
        return size;
    }

    /**
     *  check structural type equality
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Type t) {
        if(!(t instanceof RecordType)) {
            return false;
        }
        return equals((RecordType) t);
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
     *@return    Description of the Returned Value
     */
    public String toString() {
        return form;
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
     *  Description of the Method
     */
    void scanLookuptable() {
        Enumeration e = lookuptable.keys();
        form = "\nrecord ";
        int i=0;
        while(e.hasMoreElements()) {
            Object o = e.nextElement();
            i++;
            if(i>1) form = form + ",";
            o = lookuptable.get(o);
            if(o instanceof Field) {
                Field f = (Field) o;
                f.setRecordType(this);
                form = form +"\n\t"+ o;
            }
            ;
        }
        form = form + "\n end";
    }

    /**
     *  Description of the Method
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    boolean equals(RecordType t) {
        int i;
        // System.out.println("is "+this+" = \n"+t);
        if(this == t) {
            return true;
        }
        if(t.size != size) {
            return false;
        }
        if(t.variantpart.size() != variantpart.size()) {
            return false;
        }
        if(t.fixedpart.size() != fixedpart.size()) {
            return false;
        }
        for(i = 0; i < fixedpart.size(); i++) {
            if(!fixedpart.elementAt(i).equals(t.fixedpart.elementAt(i))) {
                return false;
            }
        }
        for(i = 0; i < variantpart.size(); i++) {
            if(!variantpart.elementAt(i).equals(t.variantpart.elementAt(i))) {
                return false;
            }
        }
        return true;
    }

}
