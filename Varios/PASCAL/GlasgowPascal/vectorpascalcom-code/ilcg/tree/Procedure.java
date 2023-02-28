
//Title:        ilcg.tree.Procedure
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  storage location representation


package ilcg.tree;
public class Procedure extends Block
{
    /** external name of the proc */
    static int cnt=0;
    public String name="dummyname"+cnt;

    /** library name that contains it for imports from dlls */
    public String lib="";
    /** space     occupied by parameters */
    public int paramspace;
    public String paramtype="";
    public String returntype="";
    int lexLevel=0;
    public Label start=new Label();
    /** This calling method is commonly used in Pascal. At the end of the procedure
    the called procedure removes any arguments from the stack. */
    Object[] toCall=null;
    public boolean calleePopsArgs=false;
    /** Arguments are pushed right to left in C, and the reserse in pascal */
    public boolean argsPushedLeftToRight=false;
    /** true if the procedure is imported from another DLL */
    public boolean isImported =false;
    /** True if the entry point is exported */
    public boolean isExported =false;
    public String procToString()
    {
        return "procedure (\n\t"+
               getStartAddressLabel()+"\t/* internal label*/"+
               " ,\n\t"+name+"\t/* public label */ ,\n\t"+
               isExported  +"\t/* isexported */,\n\t"+
               isImported+"\t/* imported */,\n\t"+
               argsPushedLeftToRight+ "\t/* arguments are pushed left to right */,\n\t"+
               calleePopsArgs+ "\t/* callee pops args*/,\n\t"+
               lexLevel+"  \t/* lexical level */,\n\t"+
               paramtype+"  \t/* args */,\n"+
               returntype+"\t /* return type*/"+
               ",\n"+subtree+"\t/* subtree */"+
               ",\n"+alloc+"\t/* allocator */"+
               ",\n"+ paramspace+")";
    }
    public String toString()
    {
        return procToString();
    }
    public void examine(TreeExaminer e)
    {
        if(e.visit(this))
            {
                if(start!=null)start.examine(e);
                super.examine(e);
            }
        e.leave(this);
    }     /**
	 *  Description of the Method
	 *
	 *@param  m  Description of Parameter
	 *@return    Description of the Returned Value
	 */
    public Node modify(TreeModifier m)
    {
        if(m.visit(this))
            {
                if(subtree!=null)
                    subtree=m.modified(subtree);
            }
        return this;
    }
    public Procedure()
    {
        paramtype=returntype=name="undefined";
        start = new Label();
        cnt++;
    }
    /**
    Create a procedure in which the externally linkable name is externalname, the
    label in the code at which the procedure is located is localname,
    the procedure semantics are defined by the Node n, local variable space
    is provided by LocalStoreAllocator l and the nesting level of the procedure
    ( for block structured languages) is given by l.

    The default calling method assumed is CalleePopsArgs
    */
    public Procedure(String externalname,int params,
                     String argtype,
                     String returns,
                     Label localname,
                     Node n,
                     LocalStoreAllocator l,
                     int level)
    {
        super(n,l);
        paramspace=params;
        start=localname;
        name=externalname;
        lexLevel=level;
        cnt++;
        paramtype=argtype;
        returntype=returns;
    }

    /** This method converts a block to a procedure at lexical nesting level 0 */
    public Procedure(String externalname,int params,
                     String argtype,String returns, Label localname,
                     Block b)
    {
        alloc=b.alloc;
        paramspace=params;
        lexLevel=0;
        subtree=b.subtree;
        start=localname;
        name=externalname;
        paramtype=argtype;
        returntype=returns;
    }
    /** This method converts a block to a procedure at lexical nesting level lev */
    public Procedure(String externalname,int params,
                     String argtype,String returns, Label localname,
                     Block b,int lev)
    {
        alloc=b.alloc;
        paramspace=params;
        lexLevel=lev;
        subtree=b.subtree;
        start=localname;
        name=externalname;
        paramtype=argtype;
        returntype=returns;
    }
    /** This method converts a block to a procedure at lexical nesting level lev calling the units first */
    public Procedure(String externalname,int params,
                     String argtype,String returns, Label localname,
                     Block b,int lev,Object[] unitsToCall)
    {
        alloc=b.alloc;
        paramspace=params;
        lexLevel=lev;
        subtree=b.subtree;
        start=localname;
        name=externalname;
        paramtype=argtype;
        returntype=returns;
        toCall=unitsToCall;
        cnt++;
    }
    /** this returns the type of the formal arguments to the procedure */
    public String getArgs()
    {
        return paramtype;
    }
    /** this returns the type returned by a call of the procedure */
    public String getResult()
    {
        return returntype;
    }
    /** if proc has arg type t and result type r this returns t->r */
    public String returnType()
    {
        return "("+paramtype+"->"+returntype+")";
    }
    public boolean returnInRegister()
    {
        return Format.isInteger(returntype)||Format.isReal(returntype);
    }
    public String getStartAddressLabel()
    {
        if(isImported)return name;
        return start.toString();
    }
    public String sig()
    {
        return start+"proc";
    }
}





