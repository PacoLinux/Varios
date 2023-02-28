
// Title:        ilcg
// Version:
// Copyright:    Copyright (c) 1998
// Author:       Paul Cockshott
// Company:
// Description:  implements assignments


package ilcg.tree;
import ilcg.*;

import java.io.*;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class Assign implements Node, Serializable
{

    /**
     *  Description of the Field
     */
    public String type;

    /**
     *  Description of the Field
     */
    public Node dest, src;

    public boolean initialisingassign=false;/* if an initialising assign to a register, unreserve the register before executing then reserve after */
    public void setInitialising()
    {
        initialisingassign=true;
    }
    public int weight()
    {
        //  int ws = src.weight();
        int wd = dest.weight();
        return   wd + 1;
    }
    public int[] weights()
    {
        int[] wd = dest.weights();
        String srt = src.returnType();
        int srtc = Format.getCode(srt);
        int []ws = new int[Math.max(srtc+1,wd.length)];
        for(int i=0; i<wd.length; i++)ws[i]=wd[i];
        ws [srtc]+= 1;       // the return register
        return   ws;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    /**
     *  d = destination, s = source of the assignment
     *
     *@param  d                        Description of Parameter
     *@param  s                        Description of Parameter
     *@exception  AssignmentException  Description of Exception
     */

    public Assign(Node d, Node s, boolean check) throws AssignmentException
    {
        Assigninit(d, s, check);
    }

    public void Assigninit(Node d, Node s, boolean check)throws AssignmentException
    {
        if(d==null) throw new AssignmentException("destination was null");
        if(s==null) throw new AssignmentException("source was null"+d+":="+s);
        type = s.returnType();
        dest = d;
        src = s.eval();
        String dtype = d.returnType();
        if((!checkAssignComp(dtype, type))&&check)
            {
                // System.out.println(" Basic check fails "+d+":="+s);
                boolean fail = check;
                if(Format.isRef(dtype))
                    {
                        String drt = Format.typeDeref(dtype);
                        if(Format.isInteger(drt) &&
                                Format.isInteger(type)&&
                                s.knownAtCompileTime())
                            {
                                Node num = s.eval();
                                if(num instanceof Number)
                                    {
                                        long n = ((Number)num).longValue();
                                        if(drt.equals(uint16)&&n>=0 && n<=0xffff) fail =false ;
                                        else if(drt.equals(int16)&&n> -32000 && n<=
                                                0x7fff) fail =false ;
                                        else if(drt.equals(uint8)&&n>=0 && n<=0xff) fail =false ;
                                        else if(drt.equals(int8)&&n>= -128 && n<=0x7f) fail =false ;
                                        else
                                            fail = true;
                                    }
                                else fail = true;
                            }
                        else if(Format.isSigned(type) && !Format.isSigned(drt))
                            {
                                fail = true;
                            }
                        else if((Format.isSigned(drt) && Format.isSigned(type)
                                 && (Format.lengthInBits(drt) > Format.lengthInBits(type)))
                                || (Format.isInteger(drt) && Format.isUnsigned(type)
                                    && (Format.lengthInBits(drt) > Format.lengthInBits(type)))
                               )
                            {
                                src = new ilcg.tree.Monad(new Op("EXTEND", type, drt), src);
                                fail = false;
                            }
                        else if(Format.isInteger(drt) && Format.isReal(type))
                            {
                                fail = true;
                            }
                        else if(Format.isInteger(type) && Format.isReal(drt))
                            {
                                src = new Monad(new Op("FLOAT", type, drt), src);
                                fail = false;
                            }
                        else if(Format.isReal(type) && Format.isReal(drt)&&!type.equals(drt))
                            {
                                src = new Cast(drt,src);
                                fail=false;
                            }
                        //        else if (type.equals("word") && drt.equals("void")){fail=false;}
                        else
                            {
                                fail = !type.equals(drt);
                            }
                    }
                else
                    {
                        fail = true;
                    }
                if(fail)
                    {
                        String m = "cant assign " + type + " to " + dtype + "\n value ="
                                   + s + "\n attempted destination = " + d;
                        // System.out.println(m);
                        throw new AssignmentException(m);
                    }
            }
        if(check)
            {
                if(d instanceof Variable)
                    {
                        if(((Variable) d).Protected)
                            {
                                throw new AssignmentException(
                                    "Cant assign to a protected variable "
                                    + ((Variable) d));
                            }
                        else
                            {
                                ((Variable) d).assignto();
                            }
                    }
            }
        String drt = Format.typeDeref(dtype);
        if(!type.equals(drt))   // type =drt;
            {
                // src= new Cast(type,src);
            }
    }

    public Assign(Node d, Node s)throws AssignmentException
    {
        Assigninit(d, s, true);
    }

    /**
     *  writes dest source codeForAssign
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        dest.toBinary(out);
        src.toBinary(out);
        out.writeByte(codeForAssign);
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
                if(dest != null)
                    {
                        dest.examine(e);
                    }
                if(src != null)
                    {
                        src.examine(e);
                    }
            }
        e.leave(this);
    }

    /**
     *  Description of the Method
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                try
                    {
                        Assign a= new Assign(m.modified(dest), m.modified(src));
                        if (initialisingassign)a.setInitialising();
                        return a;
                    }
                catch(AssignmentException a)     // System.out.println("modify assign failed due to "+a);
                    {
                    }
            }
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
        if(!(n instanceof Assign))
            {
                return false;
            }
        Assign a = (Assign) n;
        return type.equals(a.type) && dest.equals(a.dest) && src.equals(a.src);
    }
    public boolean matches(Node n,SymbolTable D)
    {
// System.out.println("\t"+n+"\t "+toString());
        if(!(n instanceof Assign))
            {
                return false;
            }
        Assign a = (Assign) n;
        return //type.equals( a.type) &&
            Pattern.matchPusingDtoC(dest,  D, a.dest) &&
            Pattern.matchPusingDtoC(src,  D, a.src);
    }
    public boolean matches(Node n)
    {
        return equals(n);
    }
    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */

    public String toString()
    {
        if (initialisingassign)return "let "+dest  + "=" + src ;
        return " "+dest + " := " + src+" ";
    }

    public String sig()
    {
        if (initialisingassign)return "let "+dest.sig() + "=" + src.sig();
        return dest.sig() + ":=" + src.sig();
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return false;
    }

    /**
     *  Description of the Method
     *
     *@return    simplifies constants on both sides
     */
    public Node eval()
    {
        src = src.eval();
        dest = dest.eval();
        return this;
    }

    /** return the destination with all typecasts removed */
    public Node uncastdest()
    {
        Node d = dest;
        while(d instanceof Cast)
            {
                d = ((Cast) d).subtree;
            }
        return d;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return "void";
    }

    /** returns true if the src depends directly on n
     or the address of the destination depends on it
     */
    public boolean dependson(Object n)
    {
        String ns;
        if(src.toString().indexOf(ns = n.toString()) > -1)
            {
                return true;
            }
        String ds = uncastdest().toString();
        if(ds.equals(ns))
            {
                return false;
            }
        return ds.indexOf(ns) > -1;
    }

    /**
     *  Description of the Method
     *
     *@param  dest  location assigned to
     *@param  src   to be assigned
     *@return       true if valid
     */
    public static boolean checkAssignComp(String dest, String src)
    {
        // System.out.println("Check assing comp "+dest+":="+src);
        if(!dest.startsWith("ref"))
            {
                return false;
            }
        if(src.startsWith("ref"))
            {
                if(dest.equals("ref " + Format.addressType))
                    {
                        return true;
                    }
            }
        if(dest.startsWith("ref ref"))
            {
                return Format.lengthInBits(Format.addressType)
                       == Format.lengthInBits(src);
            }
        if(Format.isVector(src))
            {
                try
                    {
                        // chop the ref from the dest and get its bit length
                        int l1 = Format.lengthInBits(src);
                        int l2 = Format.lengthInBits(Format.typeDeref(dest));
                        // System.out.println(src+" is a vector of bitlength "+l1+dest+" is of length "+l2);
                        if(!(l1 == l2)) return false;
                        boolean isvec=Format.isVector(Format.typeDeref(dest));
                        String ed ="ref "+Format.getVectorElementType(Format.typeDeref(dest));
                        String es =Format.getVectorElementType(src);
                        if(isvec)return checkAssignComp(ed,es);
                        return false;
                    }
                catch(Exception e1)
                    {
                        System.out.println("error in checkAssignComp " + e1);
                        return false;
                    }
            }
        int size = Format.lengthInBytes(src);
        // System.out.println("src size "+size);
        String dt=Format.typeDeref(dest);
        if(dest.equals("ref " + word))
            {
                return size == 4;
            }
        if(dest.equals("ref " + halfword))
            {
                return size == 2;
            }
        if(dest.equals("ref " + doubleword))
            {
                return size == 8;
            }
        if(dest.equals("ref " + octet))
            {
                return size == 1;
            }
        if(dest.equals("ref " + quadword))
            {
                return size == 16;
            }
        // System.out.println("format comparisons fail");
        if( dest.equals("ref " + src))return true;
        //  if(Format.isInteger(dt))return size<Format.lengthInBytes(dt);  // this is now fixed up by extending in Assigninit
        return false;
    }
}
