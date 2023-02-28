
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 2001
//Author:       Paul Cockshott
//Company:
//Description:  this is a class that enables data to be
//              written to it with the option of setting
//              rollback points
//              it can eventually be flushed to a file

package ilcg.tree;

import java.util.*;
import java.io.*;
/** This class performs the following checks on the assembly code in the
rollbackbuffer before it is flushed to a file.
<p>1. It inserts emms instructions after each sequence of instructions
      that uses the MMX registers.
<p>2. It removes load after store operations.
<p>
The emms instructions are inserted in front of any sequences of floating
point instructions comming after a sequence of mmx operations, or in
front of any control transfer following an mmx sequence if the control
transfer could cause a branch to some floating point instructions.

A set of flags are first associated with each instruction line these are
documented below. The flags are stored in a temporary array that is
in one to one correspondance with the lines in the rollbackbuffer.


*/
public class gnuIntelPeep extends RollBackBuffer implements Serializable
{
    /** this flag is associated with each instruction that contains a reference to an mmx register */
    static final byte is_mmx_flag=1;
    /** this flag is assoicated with lines that contain an fpu instruction */
    static final byte is_fpu_flag=2;
    /** this flag is associated with lines that have return or call statements */
    static final byte is_call_flag=4;

    String thelab; // last label to be matched
    void peepopt()
    {
        Hashtable ltab=new Hashtable();
        // first create a vector of bytes to hold the flags in
        byte[]flags = new byte[lastline];
        boolean mmxset=false;
        int prefetches=0;
        try
            {
                for(int i=0; i<lastline; i++)
                    {
                        String l = store.elementAt(i).toString().toUpperCase();
                        if(hasMMX(l))
                            {
                                flags[i]|=is_mmx_flag;
                                mmxset=true;
                            }
                        if(hasfloat(l))
                            {
                                flags[i]|=is_fpu_flag;
                                mmxset=false;
                            }
                        if(hascall(l))
                            {
                                flags[i]|=is_call_flag;
                                mmxset=false;
                            }
                        if(hasprefetch(l))
                            {
                                prefetches++;
                                if(prefetches>2)store.setElementAt("",i);
                            }
                        else if(hasjump(l))
                            {
                                prefetches=0;
                                Object dest=ltab.get(getdest(l));
                                if(mmxset)if(dest!=null)if(dest instanceof Integer)flags[((Integer)dest).intValue()]|=is_mmx_flag;
                            }
                        if(haslabel(l))
                            {
                                ltab.put(thelab,new Integer(i));
                                prefetches=0;
                            }
                        //	System.out.println(" "+flags[i]+l);
                    }
                for(int i=0; i<lastline; i++)
                    {
                        if((flags[i]&is_mmx_flag) ==is_mmx_flag)mmxset=true;
                        if((flags[i]&is_fpu_flag)==is_fpu_flag)
                            {
                                if(mmxset)insertemms(i);
                                mmxset=false;
                            }
                        if((flags[i]&is_call_flag)==is_call_flag)
                            {
                                if(mmxset)insertemms(i);
                                mmxset=false;
                            }
                        //if ((flags[i]&is_jump_flag)==is_jump_flag){ if(mmxset)insertemms(i);mmxset=false;}
                    }
                for(int i=0; i<lastline-2; i++)
                    {
                        mergepair(i);
                    };
                removeblanks();
                for(int i=0; i<lastline-2; i++)
                    {
                        nonullmove(i);
                    };
                removeblanks();
                for(int i=0; i<lastline-2; i++)
                    {
                        mergepair(i);
                    };
                removeblanks();
                for(int i=0; i<lastline-2; i++)
                    {
                        nonullmove(i);
                    };
                removeblanks();
            }
        catch(StringIndexOutOfBoundsException si)
            {
                System.out.println("Internal error in Intel Peephole optimizer "+si);
                System.exit(1);
            }
    }
    /** strip spaces */
    String strip(String s)
    {
        if(s.length()<1) return s;
        if(s.charAt(0)==' ') return strip(s.substring(1));
        return s;
    }

    String merge(String l,String r)
    {
        l=strip(l);
        r=strip(r);
        if(l.indexOf("push")==0 && r.indexOf("pop")==0&&(nonmem(argm(r))))
            {
                if(strip(argm(r)).equals(strip(argm(l))))return " ";
                return "#"+l+"\n #"+r+"  ---> \n mov "+ argm(l) + "," + argm(r);
            }
        if(l.indexOf("mov")==0&& r.indexOf("mov")==0)
            {
                //	System.out.println(l+ " "+ r);
                String[] largs=args(l);
                String [] rargs=args(r);
                //	System.out.println(largs[0]+ " "+largs[1]);
                String dest1=largs[1];
                String src1=largs[0];
                String dest2=rargs[1];
                String src2=rargs[0];
                if(dest1.equals(src2)&& dest2.equals(src1)) return l;
            }
        return "";
    }
    void nonullmove(int i)
    {
        String res;
        String first= strip(res=store.elementAt(i).toString()) ;
        if(res.trim().equals(""))store.setElementAt("",i);
        else if(first.indexOf("mov")==0)
            {
                String [] fargs = args(first);
                String src = fargs[0].trim();
                String dest = fargs[1].trim();
                if(dest.equals(src)) store.setElementAt("",i);
            }
    }
    /** return argument of monadic instruction g*/
    String argm(String s)
    {
        int comstart = s .indexOf("#");
        if(comstart>-1)s=s.substring(0,comstart);
        if(s.length()<1) return "";
        int pos = s.indexOf(" ");
        if(pos>1) return s.substring(pos);
        return "";
    }
    String[] args(String s)
    {
        s=strip(s);
        int pos = s.indexOf(" ");
        s=strip(s.substring(pos));
        String [] res= {"",""};
        int comma = s.indexOf(",");
        if(comma>0)
            try
                {
                    res[0]=s.substring(0,comma);
                    res[1]=s.substring(comma+1);
                }
            catch(Exception e)
                {
                    System.out.println("Internal error in Intel Peephole optimizer args"+e);
                    System.exit(1);
                }
        return res;
    }
    boolean nonmem(String arg)
    {
        return (!(arg.indexOf("%")<0))&&arg.indexOf("(")<0;
    }
    void mergepair(int i)
    {
        String f,s;
        String first= (f=store.elementAt(i).toString()) ;
        String second =(s= store.elementAt(i+1).toString()) ;
        String merged=merge(first,second);
        if(!merged.equals(""))
            {
                store.setElementAt(merged,i);
                store.setElementAt("",i+1);
            }
    }
    void insertemms(int line)
    {
        store.setElementAt(" EMMS\n "+store.elementAt(line),line);
    }
    boolean hasfloat(String l)
    {
        if(l.length()<1) return false;
        while(l.length()>=1&&l.charAt(0)==' ') l= l.substring(1);
        if(l.length()<1) return false;
        if(l.charAt(0)=='F') return true;
        if(l.indexOf("FLD")>-1) return true;
        if(l.indexOf("FILD")>-1) return true;
        return false;
    }
    String getdest(String l)   // assume that we have a jump instruction look for the label
    {
        if(l.length()>=1)while(l.charAt(0)==' ') l= l.substring(1);
        int i = l.indexOf(" ");
        String lab="";
        try
            {
                while(l.charAt(i)==' ')i++;
                while(i<l.length()&&Character.isLetterOrDigit(l.charAt(i)))
                    {
                        lab=lab+l.charAt(i);
                        i++;
                    }
            }
        catch(Exception e)
            {
                return " ";
            }
        return lab;
    }
    boolean haslabel(String l)
    {
        if(l.length()<1) return false;
        while(l.length()>=1&&l.charAt(0)==' ') l= l.substring(1);
        int colon = l.indexOf(":");
        if(colon<=0) return false;
        thelab =  l.substring(0,colon);
        return true;
    }
    boolean hascall(String l)
    {
        if(l.length()<3) return false;
        if(l.indexOf("RET")>=0)return true;
        if(l.indexOf("CALL")>=0)return true;
        return false;
    }
    boolean hasprefetch(String l)
    {
        return l.trim().startsWith("PREFETCH");
    }
    boolean hasjump(String l)
    {
        if(l.length()<2) return false;
        while(l.length()>=1&&l.charAt(0)==' ') l= l.substring(1);
        if(l.length()<2) return false;
        if(l.charAt(0)=='J') return true;
        if(l.indexOf("LOOP")==0)return true;
        if(l.indexOf("\n")>0)return hasjump(l.substring(l.indexOf("\n")+1));
        return false;
    }
    boolean hasMMX(String l)
    {
        int pos = l.indexOf("MM");
        if(pos<0) return false;
        int xpos = l.indexOf("XMM");
        if(xpos ==(pos-1))return false;
        return true;
    }
    public void flush(PrintWriter out)
    {
        peepopt();
        super.flush(out);
    }

}
