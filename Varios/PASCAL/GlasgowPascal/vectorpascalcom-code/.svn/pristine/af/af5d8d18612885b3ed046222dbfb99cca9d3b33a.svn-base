
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  Your description
package ilcg.tree;
import java.io.*;
import ilcg.SymbolTable;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Format implements Node,java.io.Serializable
{
    String typeid;

    public String toString()
    {
        return typeid;
    }
    private boolean invokedStandalone = false;
    public static String[] predeclaredtypes =
    {
        Node.int8,
        Node.int32,
        Node.uint8,
        Node.uint32,
        Node.int16,
        Node.uint16,
        Node.uint64,
        Node.int64,
        Node.ieee32,
        Node.ieee64,
        Node.octet,
        Node.halfword,
        Node.word,
        Node.doubleword,
        Node.quadword
    };
    public static String[] cequivtypes=
    {
        "char",//int8
        "long",//int32
        "unsigned char",//uint8
        "unsigned long",//uint32
        "short",//int16
        "unsigned short",//uint16
        "unsigned long long",//uint64
        "long long",//int64
        "float",//ieee32
        "double",//ieee64
        "char",//octet
        "short",//word
        "long",//int32
        "long long"//int64
    };
    public static String toC(String s)
    {
        int i;
        //	System.out.println("toC "+s);
        for(i=0; i< predeclaredtypes.length; i++)
            if(predeclaredtypes[i].equals(s)) return cequivtypes[(i)];
        return "void";
    }
    public static String[] formattypes =
    {
        Node.octet,
        Node.halfword,
        Node.word,
        Node.doubleword,
        Node.quadword
    };

    public static String[] integertypes =
    {
        Node.int8,
        Node.int32,
        Node.uint8,
        Node.uint32,
        Node.int16,
        Node.uint16,
        Node.uint64,
        Node.int64
    };
    public static String[] signedtypes =
    {
        Node.int8,
        Node.int32,
        Node.int16,
        Node.int64
    };
    public static String[] realtypes =
    {
        Node.ieee32,
        Node.ieee64
    };


    public static String addressType = Node.int32;

    /**
     *  Constructor for the Format object
     *
     *@param  t  Description of Parameter
     */
    public Format(String t)
    {
        typeid = t;
    }
    public boolean matches(Node n)
    {
        if(equals(n)) return true;
        return castIsSafe(typeid,n.returnType());
    }
    public boolean matches(Node n,SymbolTable D)
    {
        return matches(n);
    }
    /** return registers used to evaluate it, =0 */
    public int weight()
    {
        return 0;
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }

    /**
     *  Gets the untypedFormat attribute of the Format object
     *
     *@return    The untypedFormat value
     */
    public boolean isUntypedFormat()
    {
        return isUntypedFormat(typeid);
    }


    /**
     *  Gets the signed attribute of the Format object
     *
     *@return    The signed value
     */
    public boolean isSigned()
    {
        return isSigned(typeid);
    }


    /**
     *  returns true if the current format is an unsigned number
     *
     *@return    The unsigned value
     */
    public boolean isUnsigned()
    {
        return isUnsigned(typeid);
    }


    /**
     *  writes typeid codeForIntlit
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        Loader.toBinary(out, typeid);
        out.writeByte(codeForFormat);
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
    public boolean equals(Object n)
    {
        if(n instanceof Format)
            {
                return ((Format) n).typeid.equals(typeid);
            }
        return false;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return true;
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
        return typeid;
    }
    public String sig()
    {
        return toString();
    }

    /**
     *  Description of the Method
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static boolean ispredeclared(String t)
    {
        return isin(predeclaredtypes, t);
    }


    /**
     *  return true if it is a pure format with no info about the bits in it
     *
     *@param  type  Description of Parameter
     *@return       The untypedFormat value
     */
    public static boolean isUntypedFormat(String type)
    {
        return isin(formattypes, type);
    }


    /**
     *  return true if it is a singned integer
     *
     *@param  t  Description of Parameter
     *@return    The signed value
     */
    public static boolean isSigned(String t)
    {
        return isin(signedtypes, t);
    }


    /**
     *  Gets the unsigned attribute of the Format class
     *
     *@param  type  Description of Parameter
     *@return       The unsigned value
     */
    public static boolean isUnsigned(String type)
    {
        return isin(integertypes, type) && !isin(signedtypes, type);
    }


    /**
     *  returns true if type is an integer
     *
     *@param  type  Description of Parameter
     *@return       The integer value
     */
    public static boolean isInteger(String type)
    {
        return isin(integertypes, type);
    }


    /**
     *  Gets the real attribute of the Format class
     *
     *@param  type  Description of Parameter
     *@return       The real value
     */
    public static boolean isReal(String type)
    {
        return isin(realtypes, (type));
    }

    /** get an integer code for the type */
    public static int getCode(String type)
    {
        //System.out.println("get code for "+type);
        if(isVector(type))
            {
                String elem = getVectorElementType(type);
                if(isReal(elem))return 1 + lengthInBytes(type);
                return lengthInBytes(type);
            }
        else if(isReal(type))return 1 + lengthInBytes(type);
        return lengthInBytes(type);
    }
    /**
     *  is a reference type, i.e., a storage location
     *  Gets the ref attribute of the Format class
     *
     *@param  type  Description of Parameter
     *@return       The ref value
     */
    public static boolean isRef(String type)
    {
        return type.startsWith("ref ");
    }


    /**
     *  is vector checks if a string describes a vector type
     *
     *@param  s  Description of Parameter
     *@return    The vector value
     */
    public static boolean isVector(String s)
    {
        if(s!=null)return (s.contains("vector ( ")) ;
        return false;
    }


    /**
     *  getVectorTypeLength parses a vector type string to get the length field
     *
     *@param  s  Description of Parameter
     *@return    The vectorTypeLength value
     */
    public static int getVectorTypeLength(String s)
    {
        if(!isVector(s))return 1;
        int vstart = s.indexOf("( ");
        int vend = s.indexOf(" )");
        String tail = s.substring(vstart + 2, vend);
        return new java.lang.Integer(tail).intValue();
    }

// get the string which represents the element type of a vector type string

    /**
     *  Gets the vectorElementType attribute of the Format class
     *
     *@param  s  Description of Parameter
     *@return    The vectorElementType value
     */
    public static String getVectorElementType(String s)
    {
        if(isRef(s))
            {
                s = typeDeref(s);
            }
        int disp=s.indexOf(" vect");
        if(disp<0) return "undefined";
        return s.substring(0,disp);
    }


    /**
     *  This indicates that no type errors will occur if the cast is allowed to go
     *  ahead. Basically because the types are the same or the cast is less
     *  strongly typed than the subjectToCast
     *
     *@param  cast           Description of Parameter
     *@param  subjectToCast  Description of Parameter
     *@return                Description of the Returned Value
     */
    public static boolean castIsSafe(String cast, String subjectToCast)
    {
        if(cast.equals(subjectToCast))
            {
                return true;
            }
        if(cast.equals("any")||cast.equals("type")) return true;
        if(cast.equals("void")) return subjectToCast.equals("void");
        if(subjectToCast.equals("void")) return cast.equals("void");
        boolean castref = isRef(cast);
        boolean subjectref = isRef(subjectToCast);
        if((castref !=subjectref))
            {
                return false;
            }
        if(castref && subjectref)
            {
                return castIsSafe(typeDeref(cast), typeDeref(subjectToCast));
            }
        if(cast.equals("signed"))return isin(signedtypes,subjectToCast);
        return (
                   (
                       isUntypedFormat(cast) ||
                       (isVector(cast) && isUntypedFormat(getVectorElementType(cast)))
                   )
                   &&
                   (lengthInBits(cast) == lengthInBits(subjectToCast))
               )  ;
    }


    /**
     *  Covert a ref type to the type being referenced
     *
     *@param  s  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static String typeDeref(String s)
    {
        if(isRef(s))
            {
                return s.substring(4);
            }
        return s;
    }


    /**
     *  The main program for the Format class
     *
     *@param  args  The command line arguments
     */
    public static void main(String[] args)
    {
        Format format = new Format("void");
        format.invokedStandalone = true;
    }


    /**
     *  map a type to the data format that holds it
     *
     *@param  s  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static String typeToFormat(String s)
    {
        if(s.equals(Node.int32) || s.equals(Node.uint32) || s.equals(Node.ieee32))
            {
                return Node.word;
            }
        if(s.equals(Node.int8) || s.equals(Node.uint8))
            {
                return Node.octet;
            }
        if(s.equals(Node.int16) || s.equals(Node.uint16))
            {
                return Node.halfword;
            }
        if(s.equals(Node.int64) || s.equals(Node.uint64) || s.equals(Node.ieee64))
            {
                return Node.doubleword;
            }
        if(isVector(s))if(lengthInBytes(s)==16) return Node.quadword;
        return s;
    }
    public static String getStackTrace(Throwable aThrowable)
    {
        final Writer result = new StringWriter();
        final PrintWriter printWriter = new PrintWriter(result);
        aThrowable.printStackTrace(printWriter);
        return result.toString();
    }

    public static String halftype(String s)throws Exception
    {
        if(s.equals(Node.int64))return Node.int32;
        if(s.equals(Node.int32))return Node.int16;
        if(s.equals(Node.int16))return Node.int8;
        if(s.equals(Node.uint64))return Node.uint32;
        if(s.equals(Node.uint32))return Node.uint16;
        if(s.equals(Node.uint16))return Node.uint8;
        if(isVector(s))return halftype(getVectorElementType(s))+" vector ( "+ getVectorTypeLength(s)+" )";
        Exception e=
            new Exception("Can not halve type "+s);
        throw e;
    }
    public static String nextUp(String s)   // return the next largest type
    {
        if(s.equals(Node.int64))return Node.int64;
        if(s.equals(Node.int32))return Node.int64;
        if(s.equals(Node.ieee32))return Node.ieee64;
        if(s.equals(Node.int16))return Node.int32;
        if(s.equals(Node.int8))return Node.int16;
        if(s.equals(Node.uint64))return Node.uint64;
        if(s.equals(Node.uint32))return Node.uint16;
        if(s.equals(Node.uint16))return Node.uint32;
        if(s.equals(Node.uint8))return Node.uint16;
        if(isVector(s))return makeVectorType(nextUp(getVectorElementType(s)), getVectorTypeLength(s));
        return s;
    }
    public static String makeVectorType(String type, int length)
    {
        return type+" vector ( "+length+" )";
    }
    /**
     *  map a type to a length in bits
     *
     *@param  s  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static int lengthInBits(String s)
    {
        if(isVector(s))
            {
                if(isRef(s)) return lengthInBits(addressType);
                return lengthInBits(getVectorElementType(s)) * getVectorTypeLength(s);
            }
        s = typeToFormat(s);
        if(s.equals(word))
            {
                return 32;
            }
        if(s.equals(octet))
            {
                return 8;
            }
        if(s.equals(halfword))
            {
                return 16;
            }
        if(s.equals(doubleword))
            {
                return 64;
            }
        if(s.equals(quadword))
            {
                return 128;
            }
//	System.out.println("return length 32 for "+s);
        return lengthInBits(addressType);
    }

    public Node getCost()
    {
        return new Real(weight());
    }
    /**
     *  gives length in bytes
     *
     *@param  s  Description of Parameter
     *@return    Description of the Returned Value
     */
    public static int lengthInBytes(String s)
    {
        return lengthInBits(s) / 8;
    }


    /**
     *  Description of the Method
     *
     *@param  predeclaredtypes  Description of Parameter
     *@param  t                 Description of Parameter
     *@return                   Description of the Returned Value
     */
    static boolean isin(String[] predeclaredtypes, String t)
    {
        for(int i = 0; i < predeclaredtypes.length; i++)
            {
                if(t.equals(predeclaredtypes[i]))
                    {
                        return true;
                    }
            }
        return false;
    }
}
