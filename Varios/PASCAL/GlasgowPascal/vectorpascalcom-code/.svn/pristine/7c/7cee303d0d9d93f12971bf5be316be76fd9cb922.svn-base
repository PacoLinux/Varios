package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


/**
 *  token for pascal set types
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class SetType extends ArrayType implements Serializable {

    /**
     *  creates a representation for sets whose elements will be of type t.
     *
     */
    Type members;
    Dictionary symbolTable = null;

    /** true for standard pascal sets, false for the vector pascal extensions */
    boolean bitmapImplementation = true;
    long top() {
        return	((ScalarRange)members).top()|7;
    }
    long bottom() {
        return	((ScalarRange)members).bottom()& 0xfffffff8;
    }
    SetType union(SetType t) {
        if(!(members instanceof ScalarRange))return this;
        long lowu = (bottom()<t.bottom()?bottom():t.bottom());
        long highu =(top()>t.top()?top():t.top());
        return (members instanceof IntegralType
                ?new SetType(new IntegralType(lowu,highu))
                :
                new SetType(new OrdinalType((OrdinalType)members,lowu,highu))
               );
    }
    /** constructor for set types that handles types other
     than integers or ordinals. The dictionary d pointes to a symbol
     table indexing the access functions for the set, we pass in the format for the address type
     * to allow the correct generation of pointers since the actual sets will be implemented as pointers */
    public SetType(Type t, Dictionary d,String addresstype) {
        symbolTable = d;
        members = t;
        long[][] i = new long[1][2];
        SimpleType element = new SimpleType(addresstype, Format.lengthInBytes(addresstype));
        esize = 4;
        i[0][0] = 0;
        i[0][1] = 0;
        // create an array of words to hold it
        elemtype = element;
        indices = i;
        type = addresstype+" vector ( " + length() + " )";
        bitmapImplementation = false;
    }

    /**
     *  basic constructor for the SetType object
     *
     *@param  t  element type
     */
    public SetType(OrdinalType t) {
        members = t;
        long[][] i = new long[1][2];
        // compute how many bytes and ints needed to hold the set as a bitmap
        long range = top() - bottom() + 1;
        long words = range / 8;
        if((range & 7) != 0) {
            words++;
        }
        SimpleType element;
        element = new SimpleType(Node.uint8, 1);
        esize = 1;
        i[0][0] = 0;
        i[0][1] = words - 1;
        // create an array of words to hold it
        elemtype = element;
        indices = i;
        type = "uint8 vector ( " + length() + " )";
    }

    public SetType(IntegralType t) {
        members = t;
        long[][] i = new long[1][2];
        // compute how many bytes and ints needed to hold the set as a bitmap
        long range = top() - bottom() + 1;
        long words = range / 8;
        if((range & 7) != 0) {
            words++;
        }
        SimpleType element;
        element = new SimpleType(Node.uint8, 1);
        esize = 1;
        i[0][0] = 0;
        i[0][1] = words - 1;
        // create an array of words to hold it
        elemtype = element;
        indices = i;
        type = "uint8 vector ( " + length() + " )";
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return "SET OF " + members;
    }

    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public String codeGenRepresentation(Walker processor) {
        if(bitmapImplementation) {
            return super.codeGenRepresentation(processor);
        }
        return processor.getAddressType();
    }
}
