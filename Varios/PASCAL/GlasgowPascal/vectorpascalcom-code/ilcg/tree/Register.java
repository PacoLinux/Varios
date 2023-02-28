
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  Your description
package ilcg.tree;
import java.util.*;
import ilcg.SymbolTable;
import java.io.*;
/**


<B><I><FONT FACE="Arial"><P>Registers</P>
</B></I></FONT><FONT SIZE=2><P>The register class provides an internal
 representation of machine registers whilst code generation takes place.
It stores the printable form of the register, its size and whether or not the register is reserved.</P>
</FONT><B><I><FONT FACE="Arial"><P>Register Aliases</P>
</B></I></FONT><FONT SIZE=2>
<P>One reason aliases are necessary is that machine definitions may define some
registers to be subfields of others. When the parent register is reserved so must
the aliases of its subfields. But there is another reason too.</P>

<P>When a register is allocated for the purpose of code generation it is important that it be spillable. That is tosay, when the number of registers allocated exceeds those available, the contents of some of these may have to be stored on the stack. </P>
<P>When this is done, there may be partially matched portions of the syntax tree that have pointers
to the register because it contains results of intermediate calculations.
When these come to be used, it is important that code is planted to recall the
former contents of the register from the stack.</P>

<P>&nbsp;</P>
<P>The strategy used is to provide an additional level of indirection, so that code generation
uses a  register alias, which, can potentially record information about where the register
has been spilled to.</P>

<P>Thus the RegReservation class provides a means of creating aliases which when printed out,
return the same name as the original register, but which can be spilled.</P>

<P>An interrogation predicate isSpilled is provided to detect if a register is spilled.
When it is spilled, the alias records the location at which it was spilled.
This can be obtained using the getSpillLocation method.</P></FONT>

*/
public class Register implements Node,Serializable
{
    String rn="unbound";
    String rt="unbound";
    public int parentnum=0;
    int startword=0;
    int startbit=0;

    public HashMap<String,Register> aliases=null;
    public Register latestReservation = null;
    /** an array of integers showing which bits of the register are currently reserved*/
    public int[] reserved= {0};
    /** there is a one in each bit of the reservation mask for which a bit exists in the register
    this allows aliased registers to reserve parts of a parent register*/
    public int[] reservationMask= {-1};
    /** width in bits*/
    public int width=32;
    int words=1;
    Register myParent=null;
    boolean spilled=false;
    Node spillLocation = null;


    /** return weight of 0 since the weight measures the number of additional registers that this expression will use */
    public int weight()
    {
        return 0;
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    public int hashCode()
    {
        int local= rn.hashCode()+3*rt.hashCode()+width;
        if(getParent()!=null) return local+getParent().hashCode()*5+13*startword+17*startbit;
        return local;
    }
    public String sig()
    {
        return rn+rt;
    }
    /** Returns the bit position in the parent register corresponding to the
    least significant bit of this register */
    public int getStartInParent()
    {
        return 32*startword+startbit;
    }
    /** writes: registername codeForRegister */
    public void toBinary(DataOutputStream out)throws IOException
    {
        Loader.toBinary(out,rn);
        out.writeByte(codeForRegister);
    }


    public void examine(TreeExaminer e)
    {
        if(e.visit(this)) {}
        e.leave(this);
    }
    public String resStatus()
    {
        String status = "";
        for(int i=0; i<reserved.length; i++)status=status+reserved[i];
        return status;
    }
    public Node modify(TreeModifier m)
    {
        return this;
    }
    /** for an alias this returns the parent, for all other registers it returns null */
    public Register getParent()
    {
        return myParent;
    }

    /** Returns true if a register has been spilled */
    public boolean isSpilled()
    {
        if(latestReservation==null) return false;
        return latestReservation.isSpilled();
    }

    /** returns a node specifying the mem loc into which it was spilled */
    public Node getSpillLocation()
    {
        if(latestReservation!=null)return latestReservation.getSpillLocation();
        return spillLocation;
    }

    /** This should be called whenever a spill is generated by the code generator.
    loc specifies where it is being spilled to.
     */
    public void spill(Node loc)
    {
        if(latestReservation!=null)latestReservation.spill(loc);
    }

    /** This should be called whenever it is unspilled or a spill is canceled
    due to the transaction within which it tookplace being aborted, it returns where it was
     spilled to and clears the spill flag */
    public Node unspill()
    {
        if(latestReservation!=null)return latestReservation.unspill();
        return null;
    }



    String deref(String t)
    {
        if(t.startsWith("ref "))return Format.typeDeref(t);
        return t;
    }
    /** Create a child register sharing the parents reservation bits.
    This method will typically be used in declaring permanent hardware aliases.
    */
    public Register(String name,String type,Register parent, int start,MyRegSet registerset,Dictionary index)
    {
        int i,j,pstart;
//type=deref(type);
        int w=Format.lengthInBits(deref(type));
        pstart= parent.startword<<5 + parent.startbit;
        start+= pstart;
        startword = start>>5;
        startbit = start &31;
        rn=name;
        rt=type;
        reserved=parent.reserved;
        permres=parent.permres;
        width=w;
        parentnum=parent.parentnum;
        myParent=parent;
        words=words(w);
        reservationMask=new int[reserved.length];
//	System.out.println(name+" field of "+getParent());
        if(words==(w/32))   // exact num of words
            {
                for(i=0; i<reserved.length; i++)
                    {
                        reservationMask[i]=0;
                    }
                for(i=startword; i<startword+words; i++)
                    {
                        reservationMask[i]=-1;
                    }
            }
        else
            {
                for(i=0; i<reserved.length; i++)
                    {
                        reservationMask[i]=0;
                    }
                for(i=startword; i<startword+words-1; i++)
                    {
                        reservationMask[i]=-1;
                    }
                j=1;
                for(i=0; i <startbit; i++)j=j+j;
                for(i=0; i<(w%32); i++)
                    {
                        reservationMask[words-1+startword]=reservationMask[words-1+startword]|j;
                        j=j+j;
                    }
            }
        registerset.add(this);
        index.put(name,this);
        //System.out.println(name +type +words+" "+reservationMask[0]);
    }
    int words(int w)
    {
        if((w&31)==0) return w>>5;
        else return (w>>5) +1;
    }
    /** Creates a parent register and makes sure that the register has the required number of
        reservation bits available to it */
    public Register(String name, String type, boolean permanent,MyRegSet registerset,Dictionary index,int pnum)
    {
        permres=permanent;
        parentnum=pnum;
        int i,j,w;
        //type=deref(type);
        w=Format.lengthInBits(deref(type));
//	System.out.println(name +type +w);
        rn=name;
        rt=type;
        width=w;
        words=words(w);
        reserved= registerset.newreservationline(words);//new int[words];
        reservationMask=new int[words];
        if(words==1)
            {
                reservationMask[0]=0;
                reserved[0]=0;
                for(i=0,j=1; i<w; i++)
                    {
                        reservationMask[0]=reservationMask[0]|j;
                        j=j+j;
                    }
            }
        else
            {
                if(words==(w/32))   // exact num of words
                    {
                        for(i=0; i<words; i++)
                            {
                                reserved[i]=0;
                                reservationMask[i]=-1;
                            }
                    }
                else
                    {
                        for(i=0; i<words-1; i++)
                            {
                                reserved[i]=0;
                                reservationMask[i]=-1;
                            }
                        for(i=0,j=1; i<w%32; i++)
                            {
                                reservationMask[words-1]=reservationMask[words-1]|j;
                                j=j+j;
                            }
                    }
            }
        registerset.add(this);
        index.put(name,this);
        //System.out.println(name +type +words+" "+reservationMask[0]);
    }


    public Register(String name, String type, boolean permanent,int pnum)
    {
        permres=permanent;
        parentnum=pnum;
        int i,j,w;
        //type=deref(type);
        w=Format.lengthInBits(deref(type));
//	System.out.println(name +type +w);
        rn=name;
        rt=type;
        width=w;
        words=words(w);
        reserved=new int[words];
        reservationMask=new int[words];
        if(words==1)
            {
                reservationMask[0]=0;
                for(i=0,j=1; i<w; i++)
                    {
                        reservationMask[0]=reservationMask[0]|j;
                        j=j+j;
                    }
            }
        else
            {
                if(words==(w/32))   // exact num of words
                    {
                        for(i=0; i<words; i++)
                            {
                                reserved[i]=0;
                                reservationMask[i]=-1;
                            }
                    }
                else
                    {
                        for(i=0; i<words-1; i++)
                            {
                                reserved[i]=0;
                                reservationMask[i]=-1;
                            }
                        for(i=0,j=1; i<w%32; i++)
                            {
                                reservationMask[words-1]=reservationMask[words-1]|j;
                                j=j+j;
                            }
                    }
            }
//	registerset.add(this);
    }
    public Register() {}
    public boolean equals(Object n)
    {
        if(n instanceof Register)return ((Register)n).rn.equals(rn);
        return false;
    }
    public boolean matches(Node n)
    {
        return equals(n);
    }
    public boolean matches(Node n, SymbolTable D)
    {
        return matches(n);
    }
    public String toString()
    {
        return rn;
    }
    /** This sets the reservation flags associated with all bits of the register */
    public void reserve()
    {
        int words=reserved.length;
        for(int i=0; i<words; i++)reserved[i]=reserved[i]|reservationMask[i];
    }
    /** Reserve the register for the whole duration of code generation */
    public void reservePermanently()
    {
        permres=true;
        reserve();
    }
    public boolean permanentlyReserved()
    {
        return permres;
    }
    boolean permres=false;
    /** This frees the reservation flags associated with all bits of the register */
    public void unreserve()
    {
        int words=reserved.length;
        if(permres)return;
        for(int i=0; i<words; i++)reserved[i]=reserved[i]&(-1 ^ reservationMask[i]);
    }
    public boolean isReserved()
    {
        int words=reserved.length;
        if(permres) return true;
        for(int i=0; i<words; i++)if((reserved[i]&reservationMask[i])!=0)return true;
        return false;
    }
    /** returns the name of the register */
    public String getName()
    {
        if(spilled)
            {
                return rn+"<"+getSpillLocation()+">";
            }
        return rn;
    }
    /** The return type defines what the register currently contains */
    public String returnType()
    {
        return rt;
    }
    /** A register can not be further evaluated at compile time */

    public Node eval()
    {
        return this;
    }
    /** Values in registers are generally not known at compile time.
    If they are, override with a sub class of register */

    public boolean knownAtCompileTime()
    {
        return false;
    }
}
