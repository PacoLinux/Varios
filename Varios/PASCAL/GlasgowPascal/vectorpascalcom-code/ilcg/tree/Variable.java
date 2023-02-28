
package ilcg.tree;


public class Variable extends Memref implements java.io.Serializable
{
    /** size of var in bytes */
    public int size_;
    /** holds byte offset from the base of the allocation area used for the variable */
    public int offset;
    int align_;
    boolean assignedtoyet=false;
    public boolean assignedto()
    {
        return assignedtoyet;
    }
    public void assignto()
    {
        assignedtoyet=true;
    }
    public Object type_;
    /** used to determine if a variable can be assigned to */
    public boolean Protected=false;
    /** Lexical level used to encode nesting level for block structured languages.
    Set to a default level of -1 which indicates that the variable is allocated
    space in the global segment.
          <p>
    Level    0 indicates store allocated on the stack frame of the main procedure   <p>
    Level    1  indicates that store allocated in stack frame of a
    procedure nested  in the main program.  <p>
    Level 2 or greater indicates allocation within an inner procedure.
    */
    public int lexicalLevel=-1;
    public Object getType()
    {
        return type_;
    }
    /** This is used to create a variable where the indexing expression and offset can be pre-calculated by the compiler */
    public Variable(int size, int offs,
                    Object type,
                    String representationType,
                    Node indexExp)  throws Exception
    {
        offset=offs;
        size_=size;
        index=indexExp;
        type_=type;
        retType= (representationType);
        if(!retType.startsWith("ref"))throw new Exception("variable representations must start with ref not:"+retType);
    }
    /** This is used to create a variable where the indexing expression is a labeled memory
    reference pointing into a global segment */
    public Variable(int size,
                    Object type,
                    String representationType,
                    Node indexExp) throws Exception
    {
        offset=0;
        size_=size;
        index=indexExp;
        type_=type;
        retType= (representationType);
        if(!retType.startsWith("ref"))throw new Exception("variable representations must start with ref not:"+retType);
    }
    public Variable()
    {
        super(new ilcg.tree.Int(0),Node.octet);
        size_=1;
        offset=1;
        align_=1;
        offset=0;
    }	/**
	 *  uses a tree modifier to rewrite the node
	 *
	 *@param  m  the modifier
	 *@return     the Returned node
	 */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this)) try
                {
                    Variable v= new Variable(size_,type_,retType,m.modified(index));
                    v.setName(varname);
                    if(assignedto())v.assignto();
                    return (Node)v;
                }
            catch(Exception e)
                {
                    return super.modify(m);
                }
        return this;
    }

    String varname="";
    /** Allows you to give a name to a variable for annotation purposes */
    public void setName(String n)
    {
        varname=n;
    }
    public String toString()
    {
        if(varname.equals(""))return super.toString();
        return varname;
    }
    /**
    creates a variable of the specified size and alignment, using
    the local store allocator to allocate an offset and the
    Node base as the base register for access. Must also be
    parameterised with the address type of the machine on
    which code is being generated.


    Note that the lexlevel field is only used in block structured languages

    The rep field should be a ref type
     */

    public Variable(int size, int alignment,
                    LocalStoreAllocator a,
                    Object type,
                    String rep,
                    Node base,
                    int level,
                    boolean isparameterCalledbyRef,
                    String addrtype)throws Exception
    {
        size_=size;
        align_=alignment;
        type_=type;
        lexicalLevel=level;
        offset = a.alloc(size,alignment);
        index=new Dyad(new ilcg.tree.Int(offset, addrtype),
                       (base instanceof Label?base:	new Deref(base)),
                       "+");
        if(isparameterCalledbyRef)
            {
                index=new Deref(
                    new Memref(index,makeref(addrtype)));
                calledbyref=true;
            }
        if(!rep.startsWith("ref"))throw new Exception("variable representations must start with ref not:"+rep);
        retType= (rep);
    }
    public boolean calledbyref=false;
    public static String makeref(String r)
    {
        return "ref "+r;
    }
    public Variable(int size, int alignment,
                    LocalStoreAllocator a,
                    Object type,
                    String rep,
                    Node base,
                    String addrtype)throws Exception
    {
        size_=size;
        align_=alignment;
        type_=type;
        offset = a.alloc(size,alignment);
        index=new Dyad(new ilcg.tree.Int(offset),
                       new Deref(new Cast("ref "+addrtype,base)),
                       "+");
        if(!rep.startsWith("ref"))throw new Exception("variable representations must start with ref not:"+rep);
        retType= (rep);
    }

}
