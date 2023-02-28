

package ilcg.Pascal;


import java.io.*;
import java.util.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


/**
 *  Represents all of the whole number types in Pascal
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class FixedType extends SimpleType implements Serializable { // implements ScalarRange

    boolean isfull = false;
    public boolean fullrange() {
        return isfull;
    }

    long low, hi;
    double bottom = -1;
    double top = 1;

    /**
     *  Description of the Field
     */
    public static long maxint = 2147483647;

    /**
     *  Constructor for the IntegralType object
     */
    FixedType() {
        low = 0;
        hi = 1;
        size = 1;
    }

    public boolean equals(Type t) {
        if(t instanceof FixedType) {
            FixedType f = (FixedType) t;
            return type.equals(((SimpleType) t).type) && f.bottom == bottom
                   && f.top == top;
        }
        return false;
    }

    /**
     *  Constructor for the IntegralType object
     *
     *@param  Low   Description of Parameter
     *@param  High  Description of Parameter
     */
    FixedType(long Low, long High, double Bottom, double Top) {
        low = Low;
        top = Top;
        bottom = Bottom;
        hi = High;
        setsize();
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
     *@return    Description of the Returned Value
     */
    public String toString() {
        return bottom + ".." + top;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public long top() {
        return hi;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public long bottom() {
        return low;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public double range() {
        return (double) hi - (double) low + 1;
    }

}

