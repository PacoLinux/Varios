
package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.*;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class OrdinalType extends SimpleType implements ScalarRange,Serializable {

    long low, hi;
    String[] elements;
    boolean isfull = false;
    public boolean fullrange() {
        return isfull;
    }

    /* the type translation table from the ordinals to strings, not present for all ordinal types */
    Node transtab = null;
    void setTransTab(Node tt) {
        transtab = tt;
    }

    /**
     *  Description of the Field
     */
    public static long maxint = IntegralType.maxint;

    /**
     *  Constructor for the OrdinalType object
     */
    OrdinalType() {
        String[] elem = { "true", "false"};
        elements = elem;
        low = -1;
        hi = 0;
        setsize();
    }

    /**
     *  Create an ordinal type with the labeled elements. All elements must be
     *  distinct
     *
     *@param  elems  Description of Parameter
     */
    OrdinalType(String[] elems) {
        low = 0;
        hi = elems.length - 1;
        elements = elems;
        setsize();
        // System.out.println("ordinal type low="+low+" hi ="+hi+" size ="+size +" type ="+type);
    }

    OrdinalType(String[] elems, int base) {
        low = base;
        hi = elems.length - 1 + base;
        elements = elems;
        setsize();
        // System.out.println("ordinal type low="+low+" hi ="+hi+" size ="+size +" type ="+type);
    }

    /**
     *  Constructor for the OrdinalType object
     *
     *@param  parent  Description of Parameter
     *@param  first   Description of Parameter
     *@param  last    Description of Parameter
     */
    OrdinalType(OrdinalType parent, long first, long last) {
        low = (first);
        hi = (last);
        elements = parent.elements;
        setsize();
    }
    /** ordinal types are equal if they have the same textual elements and
     * same ordinal representation */
    public boolean equals(Object t) {
        if(t instanceof OrdinalType) {
            OrdinalType ot = (OrdinalType)t;
            boolean bounds = (ot.low==low) && (ot.hi == hi);
            if(bounds) {
                for(int i=(int)0; i< elements.length; i++)
                    if(!ot.elements[i].equals(elements[i]))return false;
                return true;
            }
        }
        return false;
    }
    /**
     *  Constructor for the OrdinalType object
     *
     *@param  parent           Description of Parameter
     *@param  first            Description of Parameter
     *@param  last             Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    OrdinalType(OrdinalType parent, String first, String last) throws SyntaxError {
        low = parent.ord(first);
        hi = parent.ord(last);
        elements = parent.elements;
        setsize();
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return low + ".." + hi;
    }

    /**
     *  Computes the representation needed for the range
     */
    void setsize() {
        if(low >= 0) {
            if(hi < 128) {
                type = Node.int8;
                size = 1;
                isfull = hi == 127 && low == -128;
            }
            else if(hi < 256) {
                type = Node.uint8;
                size = 1;
                isfull = low == 0 && hi == 255;
            }
            else if(hi <= 0x7fff) {
                type = Node.int16;
                size = 2;
                isfull = false; // since low >=0
            }
            else if(hi < 0x10000) {
                type = Node.uint16;
                size = 2;
                isfull = low == 0 && hi == 0xffff;
            }
            else if(hi <= maxint) {
                type = Node.int32;
                size = 4;
                isfull = low == (-maxint - 1) && hi == maxint;
            }
            else if(hi < 0x100000000L) {
                type = Node.uint32;
                size = 4;
                isfull = low == 0 && hi == 0xffffffff;
            }
            else {
                type = Node.int64;
                size = 8;
            }
        }
        else {
            if((low >= -128) && (hi <= 127)) {
                type = Node.int8;
                size = 1;
                isfull = hi == 127 && low == -128;
            }
            else if((low >= -32768) && (hi <= 32767)) {
                type = Node.int16;
                size = 2;
                isfull = low == -32768 && hi == 32767;
            }
            else if((low >= (-maxint - 1)) && (hi <= maxint)) {
                type = Node.int32;
                isfull = low == (-maxint - 1) && hi == maxint;
                size = 4;
            }
            else {
                type = Node.int64;
                size = 8;
            }
        }
    }

    /**
     *  Description of the Method
     *
     *@return    highest ordinal in range as a long int
     */
    public long top() {
        return hi;
    }

    public long bottom() {
        return low;
    }

    public double range() {
        return (double) hi - (double) low + 1;
    }

    /**
     *  Description of the Method
     *
     *@param  s                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int ord(String s) throws SyntaxError {
        int i;
        for(i = 0; i < elements.length; i++) {
            if(s.equals(elements[i])) {
                return i;
            }
        }
        throw new SyntaxError(s + " not in type", -1);
    }
}
