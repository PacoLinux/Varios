

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
class IntegralType extends SimpleType implements ScalarRange,Serializable {

    boolean isfull = false;
    public boolean fullrange() {
        return isfull;
    }
    String name = "";
    long low, hi;

    /**
     *  Description of the Field
     */
    public static long maxint = 2147483647;

    /**
     *  Constructor for the IntegralType object
     */
    IntegralType() {
        low = 0;
        hi = 1;
        size = 1;
    }

    /**
     *  Constructor for the IntegralType object
     *
     *@param  Low   lowest value allowed
     *@param  High  highest value
     */
    IntegralType(long Low, long High) {
        low = Low;
        hi = High;
        setsize();
    }
    IntegralType(String format) {
        if(format.equals("int32")) {
            low=0x80000000;
            hi=0x7fffffff;
        }
        else if(format.equals("int64")) {
            low= -9223372036854775807L;
            hi=9223372036854775807L ;
        }
        else if(format.equals("int16")) {
            low=0x8000;
            hi=0x7ffff;
        }
        else if(format.equals("int8")) {
            low=0x80;
            hi=0x7f;
        }
        else if(format.equals("uint32")) {
            low= 0;
            hi=0xffffffff;
        }
        else if(format.equals("uint64")) {
            low=0 ;
            hi=2*(9223372036854775807L);
        }
        else if(format.equals("uint16")) {
            low= 0;
            hi=0xfffff;
        }
        else if(format.equals("uint8")) {
            low=0;
            hi=0xff;
        }
        size=Format.lengthInBytes(format);
        type=format;
        name=format;
    }
    /**
     *  Constructor for the IntegralType object
     *
     *@param  Low   lowest value allowed
     *@param  High  highest value
     *@param  s     an optional name for the type
     */
    IntegralType(long Low, long High, String s) {
        low = Low;
        hi = High;
        name = s;
        setsize();
    }

    /**
     *  Computes the representation needed for the range
     */
    void setsize() {
        if(low >= 0) {
            /* if (hi < 128) {
                  type = Node.int8;
                  size = 1;
                  isfull = hi == 127 && low == -128;
              } else )*/
            if(hi < 256) {
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
            else if((low >= (-((long) maxint) - 1)) && (hi <= maxint)) {
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
        if(name.equals("")) {
            return low + ".." + hi;
        }
        return name;
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

