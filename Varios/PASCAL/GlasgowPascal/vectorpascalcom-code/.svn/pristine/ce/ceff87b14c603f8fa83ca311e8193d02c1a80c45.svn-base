
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
class StringType extends ArrayType implements Serializable {

    Type CHARREP = PascalCompiler.CHAR;

    /**
     *  Constructor for the StringType object
     *
     *@param  len        capacity of the string
     *@param  processor  code gen for cpu used
     */
    public StringType(int len, Walker processor) {
        elemtype = CHARREP;
        indices = new long[1][2];
        indices[0][0] = 0;
        while(((len + 1) % 4) > 0) {
            len++;
        }
        if(len > 0xfffe) {
            len = 0xfffe;
        }
        indices[0][1] = len;
        esize = Format.lengthInBytes(elemtype.type);
        // System.out.println("string element length="+esize);
        type = codeGenRepresentation(processor);
    }

    public int getstrlen() {
        return (int) indices[0][1];
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return "string[" + length() + "]";
    }
}
