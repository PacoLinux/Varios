
package ilcg;
import java.io.*;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;
import ca.mcgill.sable.util.*;

import ilcg.analysis.*;
import ilcg.lexer.*;
import ilcg.node.*;
import ilcg.parser.*;
import ilcg.tree.*;
/**
 * Translates ilcg to a code generator written in pascal
 *
 * @author     Paul Cockshott
 * @created    22 November 2005
 */
public class Ilcg2Tree extends
    DepthFirstAdapter
{
    boolean crash =true; // if true then any error will produe a trace back
    // this can be useful for debugging
    String FPAlias               = "";
    String SPAlias               = "";
    MySet registerSet = new MyHashSet();

    /**
     * A hash table that stores the formats of registers as strings, with
     *each register indexed on its name
     */
    public Hashtable globals     = new Hashtable();

    /**
     * a table to store flags
     */
    public Hashtable flags       = new Hashtable();
    /**
     * a vector of pairs mapping internal names for types to
     *those used in the assembler
     */
    public Vector typerenamevec  = new Vector();
    /**
     * The symbol table that handles embeded scopes
     */
    public SymbolTable names     = new SymbolTable(globals);
    Dictionary procedureFormats  = new Hashtable();
    Dictionary functionFormats   = new Hashtable();
    Dictionary instructionSet    = procedureFormats;
    public Vector pats = new Vector();

    /**
     * Used to store the altenatives of a pattern as they are being parsed
     */
    Vector alternatives;
    /**
     * Patterns are either general, address or instruction
     */
    String patternContext        = "unknown";

    Hashtable done               = new Hashtable();

    Vector instructionset        = new Vector();

    boolean[] starts             = {true, true, true, true, false, false};
    String[] keywords            = {"if", "for", "PUSH", "goto", ":=", "any"};

    int baseregnum               = 0;

    int regnum                   = 0;

    int alternativescount        = 0;

    int paramindex               = 0;


    /**
     * all generated procedures are numbered to ensure
     *that no two procedures have the same name
     *
     * @exception  IOException  Description of the Exception
     */

    /**
     * The parameter is the name of the pascal unit to generate
     *
     * @exception  IOException  Description of the Exception
     */
    public Ilcg2Tree()
    throws IOException
    {
        // declare pregiven formats
        namesput("int8", new Format("int8"));
        namesput("int16", new Format("int16"));
        namesput("int64", new Format("int64"));
        namesput("int32", new Format("int32"));
        namesput("uint8", new Format("uint8"));
        namesput("uint16", new Format("uint16"));
        namesput("uint64", new Format("uint64"));
        namesput("uint32", new Format("uint32"));
        namesput("ieee32", new Format("ieee32"));
        namesput("ieee64", new Format("ieee64"));
        namesput("octet", new Format("octet"));
        namesput("halfword", new Format("halfword"));
        namesput("doubleword", new Format("doubleword"));
        namesput("word", new Format("word"));
        /*		namesput( "GP", new RegDetails( "word", "GP", "GP", null ) );
        		namesput( "FP", new RegDetails( "word", "FP", "FP", null ) );
        		namesput( "SP", new RegDetails( "word", "SP", "SP", null ) );*/
    }


    /**
     *  Description of the Method
     *
     * @param  s  Description of the Parameter
     */
    void error(String s)
    {
        System.err.println("Error ! "+ s);
        int[] a= {-1};
        System.exit((crash?a[7]: a[0]));
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inStart(Start node)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outStart(Start node)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     */
    public void defaultIn(ilcg.node.Node n)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     */
    void defps(ilcg.node.Node n)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     */
    void defpe(ilcg.node.Node n)
    {
    }


    /**
     * print a procedure that will always fail when
     *used as a recogniser
     *
     * @param  n  Description of the Parameter
     */
    public void defaultOut(ilcg.node.Node n)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAProgram(AProgram node)
    {
    }


    /**
     * this generates a pair of recognisers 1  recognising each variant of each
     *procedure patterns 1 matching each variant of function patterns
     */
    public void expandInstructions()
    {
        /*
         *  handle procedure instructions
         */
    }


    /**
     *  Description of the Method
     *
     * @param  p  Description of the Parameter
     */
    public void expandPattern(pattern p)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  p  Description of the Parameter
     */
    void declarevars(pattern p)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  t  Description of the Parameter
     * @return    Description of the Return Value
     */
    String paramref(String t)
    {
        if(t.equals("type"))
            {
                return "typeparam";
            }
        if(t.equals("label"))
            {
                return "patlabel";
            }
        return "pat" + pasname(t);
    }


    /**
     *  Description of the Method
     *
     * @param  p  Description of the Parameter
     */
    void forgetvars(pattern p)
    {
    }


    /**
     * create a new alternatives structure to hold
     *the ordered list of instructions. It is
     *important to retain the ordering in this list
     *in order to give the specifier of an instructionset
     *some control of the order in which alternative
     *instructions will be attempted when doing a match
     *
     * @param  node  Description of the Parameter
     */
    public void inAInstructionlist(AInstructionlist node)
    {
        alternatives = new Vector();
        defaultIn(node);
    }


    /**
     * declaress the constructor for the code generator class
     *
     * @param  node  Description of the Parameter
     */
    public void outAProgram(AProgram node)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     * @return       Description of the Return Value
     */
    boolean containsAnId(ADerefRhs node)
    {
        PRefval rv  = node.getRefval();
        if(rv instanceof ARefval)
            {
                ARefval arv  = (ARefval) rv;
                PLoc pl      = arv.getLoc();
                return (pl instanceof AIdLoc);
            }
        return false;
    }


    /**
     *  Gets the theId attribute of the Ilcg2Tree object
     *
     * @param  node  Description of the Parameter
     * @return       The theId value
     */
    AIdLoc getTheId(ADerefRhs node)
    {
        return (AIdLoc)((ARefval) node.getRefval()).getLoc();
    }

    // check if the id labels a set of alternatives

    /**
     *  Gets the alts attribute of the Ilcg2Tree object
     *
     * @param  node  Description of the Parameter
     * @return       The alts value
     */
    ilcg.node.Node getAlts(AIdLoc node)
    {
        String theId  = node.getIdentifier().getText();
        print("// the id is " + theId);
        Object val    = names.get(theId);
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + theId);
            }
        else if(val instanceof Param)
            {
                //print("// it is a parameter id");
                String typeName        = ((Param) val).type;
                //print("// its type is "+typeName);
                Object typeDenotation  = names.get(typeName);
                if(typeDenotation == null)
                    {
                        error("undeclared type " + typeName + " in  getAlts " + node);
                    }
                else
                    {
                        pattern p  = (pattern) typeDenotation;
                        ilcg.node.Node n     = p.getNode();
                        return n;
                    }
            }
        return null;
    }


    /**
     *  test if node just contains a register id
     *
     * @param  node  Description of the Parameter
     * @return       Description of the Return Value
     */
    boolean containsJustARegId(ADerefRhs node)
    {
        if(containsAnId(node))
            {
                //	print("// contains an id");
                ilcg.node.Node n  = getAlts(getTheId(node));
                if(n == null)
                    {
                        return false;
                    }
                //	print("// and the alternatives are not null ");
                if(n instanceof AAlternativesPatterndecl)
                    {
                        //		print("// and the result is an alternative pattern ");
                        if(allRegisters((AAlternativesPatterndecl) n))
                            {
                                return true;
                            }
                        //		print("// but the alternatives are not all registers ");
                    }
            }
        return false;
    }


    /**
     *  generate a derefed expression
     *
     * @param  node  Description of the Parameter
     */
    public void outADerefRhs(ADerefRhs node)
    {
        setOut(node, new ilcg.tree.Deref((ilcg.tree.Node) getOut(node.getRefval())));
    }


    /**
     *  convert a real to ilcg.tree format
     *
     * @param  node  Description of the Parameter
     */
    public void outAReallitNumber(AReallitNumber node)
    {
        setOut(node, new ilcg.tree.Real(Double.valueOf(node.toString())));
    }


    /**
     *  Create a format node for a type
     *
     * @param  node  Description of the Parameter
     */
    public void outAPredeclaredtypeType(APredeclaredtypeType node)
    {
        setOut(node, new ilcg.tree.Format(node.toString()));
    }


    /**
     *   create a format node for a type
     *
     * @param  node  Description of the Parameter
     */
    public void outAFormatPredeclaredtype(AFormatPredeclaredtype node)
    {
        setOut(node, new ilcg.tree.Format(node.toString()));
    }


    /**
     *  create a format node for a type
     *
     * @param  node  Description of the Parameter
     */
    public void outATformatPredeclaredtype(ATformatPredeclaredtype node)
    {
        setOut(node, new ilcg.tree.Format(node.toString()));
    }


    /**
     *  convert an int to ILCG tree format
     *
     * @param  node  Description of the Parameter
     */
    public void outAIntegerNumber(AIntegerNumber node)
    {
        String s=(node.toString()).trim();
        setOut(node, new ilcg.tree.Int(stoi(s)));
    }
    long stoi(String s)
    {
        int minus=1;
        s=s.trim();
        if(s.startsWith("-"))
            {
                s=s.substring(1).trim();
                minus= -1;
            }
        return java.lang.Long.valueOf(s) *minus;
    }

    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outALocValue(ALocValue node)
    {
        setOut(node, getOut(node.getLoc()));
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outANumberRhs(ANumberRhs node)
    {
        setOut(node, getOut(node.getNumber()));
    }


    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     */
    void defforms(ilcg.node.Node n) { }


    /**
     *  Description of the Method
     *
     * @param  s  Description of the Parameter
     */
    void print(String s)
    {
        System.out.println("\t\t" + s);
    }



    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAReference(AReference node)
    {
        String t= node.getType() .toString().trim();
        if(Format.ispredeclared(t))
            {
                setOut(node,"ref "+t) ;
            }
        else
            setOut(node, new ilcg.tree.Ref((ilcg.tree.Node) getOut(node.getType())));
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAArrayType(AArrayType node)
    {
        AArray a  = (AArray) node.getArray();
        setOut(node, new ilcg.tree.Vec((ilcg.tree.Node)getOut(node.getTypeprim()),
                                       (int)stoi(a.getNumber().toString())));
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAReftypeType(AReftypeType node)
    {
        setres(node, node.getReference());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outATypeidType(ATypeidType node)
    {
        String id = node.getTypeid().toString().trim();
        Object nid=names.get(id);
        if(nid==null)
            {
                System.out.println(id +" has not symbol table entry ");
                System.exit(1);
            }
        //	System.out.println(id+"="+nid+" "+nid.getClass());
        if(nid !=null) setOut(node,nid);
        else
            setres(node, node.getTypeid());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outATypeidTypeprim(ATypeidTypeprim node)
    {
        setres(node, node.getTypeid());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outARhsValue(ARhsValue node)
    {
        setres(node, (node.getRhs()));
    }


//
    /**
     *  remove redundant chaining of productions
     *
     * @param  node  node to be redefined
     * @param  n     what it is defined to be
     */
    void setres(ilcg.node.Node node, ilcg.node.Node n)
    {
        setOut(node, getOut(n));
    }




    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAMonadicValue(AMonadicValue node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAMonadicValue(AMonadicValue node)
    {
        setOut(node, new ilcg.tree.Monad((ilcg.tree.Op) getOut(node.getMonadic()), (ilcg.tree.Node) getOut(node.getValue())));
    }


    /**
     *  Description of the Method
     *
     * @param  n   Description of the Parameter
     * @param  op  Description of the Parameter
     */
    void defop(ilcg.node.Node n, String op)
    {
        setOut(n, new ilcg.tree.Op(op, Format.any, Format.any));
    }
    void defdop(ilcg.node.Node n, String op)
    {
        setOut(n, new ilcg.tree.Op(op,Format.any,Format.any, Format.any));
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAbsMonadic(AAbsMonadic node)
    {
        defop(node, "ABS");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAExtendMonadic(AExtendMonadic node)
    {
        defop(node, "EXTEND");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outASqrtMonadic(ASqrtMonadic node)
    {
        defop(node, "SQRT");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outATanMonadic(ATanMonadic node)
    {
        defop(node, "TAN");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outACosMonadic(ACosMonadic node)
    {
        defop(node, "COS");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outALnMonadic(ALnMonadic node)
    {
        defop(node, "LN");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outASinMonadic(ASinMonadic node)
    {
        defop(node, "SIN");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
//	public void outAPopMonadic(APopMonadic node)
//	{
//		defop(node, "POP");
//	}


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outANotMonadic(ANotMonadic node)
    {
        defop(node, "NOT");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAFloatMonadic(AFloatMonadic node)
    {
        defop(node, "FLOAT");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outARoundMonadic(ARoundMonadic node)
    {
        defop(node, "ROUND");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outATruncMonadic(ATruncMonadic node)
    {
        defop(node, "TRUNCATE");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outADyadicValue(ADyadicValue node)
    {
        ilcg.tree.Node lrec  = (ilcg.tree.Node) getOut(node.getLeft());
        ilcg.tree.Node rrec  = (ilcg.tree.Node) getOut(node.getRight());
        Object op    =  getOut(node.getDyadic());
        try
            {
                if(op instanceof Op)
                    setOut(node, new Dyad(lrec, rrec, (Op) op));
                else
                    {
                        Op newop =new Op((IlcgParam) op);
                        setOut(node, new Dyad(lrec, rrec, newop));
                    }
            }
        catch(Exception e)
            {
                error(" could not construct dyad \n"+lrec+" "+op+" "+rrec+"\nbecause\n"+e+"\n");
            }
    }


    /**
     *  Description of the Method
     *
     * @param  s  Description of the Parameter
     * @return    Description of the Return Value
     */
    String notrailingspaces(String s)
    {
        int len  = s.length();
        if(s.charAt(len - 1) == ' ')
            {
                return notrailingspaces(s.substring(0, len - 1));
            }
        return s;
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outACastRhs(ACastRhs node)
    {
        Object t          = getOut(node.getType());
        ilcg.tree.Node v  = (ilcg.tree.Node) getOut(node.getValue());
        if(t instanceof ilcg.tree.Pattern)
            {
                setOut(node, new ilcg.tree.Cast((ilcg.tree.Pattern) t, v));
            }
        else if(t instanceof ilcg.tree.Node)
            {
                setOut(node, new ilcg.tree.Cast((ilcg.tree.Node) t, v));
            }
        else
            {
                setOut(node, new ilcg.tree.Cast(t.toString(), v));
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outACastpopRhs(ACastpopRhs node)
    {
        Object t          = getOut(node.getType());
        ilcg.tree.Node v  = (ilcg.tree.Node)getOut(node.getValue());
        if(t instanceof ilcg.tree.Pattern)
            {
                setOut(node, new ilcg.tree.Cast((ilcg.tree.Pattern) t, v));
            }
        else if(t instanceof ilcg.tree.Node)
            {
                setOut(node, new ilcg.tree.Cast((ilcg.tree.Node) t, v));
            }
        else
            {
                setOut(node, new ilcg.tree.Cast(t.toString(), v));
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outARefval(ARefval node)
    {
        setres(node, node.getLoc());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outARefcastRefval(ARefcastRefval node)
    {
        Object t          = getOut(node.getType());
        ilcg.tree.Node v  = (ilcg.tree.Node)getOut(node.getLoc());
        //	System.out.println("outARefcastRefval"+t+v);
        if(t instanceof ilcg.tree.Pattern)
            {
                setOut(node, new ilcg.tree.Cast((ilcg.tree.Pattern) t, v));
            }
        else if(t instanceof ilcg.tree.Node)
            {
                setOut(node, new ilcg.tree.Cast((ilcg.tree.Node) t, v));
            }
        else
            {
                setOut(node, new ilcg.tree.Cast(t.toString(), v));
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAConstRhs(AConstRhs node)
    {
        Token id    = node.getIdentifier();
        Object val  = names.get(id.getText());
        // check its type!!!
        try
            {
                if(val == null)
                    {
                        error("undeclared variable " + id);
                    }
                else if(val instanceof IlcgParam)
                    try
                        {
                            setOut(node, new ilcg.tree.Const((IlcgParam) val));
                        }
                    catch(Exception e1)
                        {
                            error(" calline setOut "+e1);
                        }
            }
        catch(Exception e)
            {
                error("in const rhs "+e);
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAIdLoc(AIdLoc node)
    {
        Token id    = node.getIdentifier();
        Object val  = names.get(id.getText());
        // check its type!!!
        try
            {
                if(val == null)
                    {
                        error("undeclared variable " + id + " line" + id.getLine());
                    }
                else if(val instanceof ilcg.tree.Register)
                    {
                        setOut(node, val);
                    }
                else if(val instanceof ilcg.tree.RegisterStack)
                    {
                        setOut(node, val);
                    }
                else if(val instanceof IlcgParam)
                    {
                        setOut(node, val);
                    }
                else
                    error("illegal type of identifier " + id + " line" + id.getLine() +"\n"+
                          val.getClass());
            }
        catch(Exception e)
            {
                error(" in a idloc "+e);
            }
    }



    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAForMeaning(AForMeaning node)
    {
        setOut(node,
               new For((ilcg.tree.Node) getOut(node.getRefval()),
                       (ilcg.tree.Node) getOut(node.getStart()),
                       (ilcg.tree.Node) getOut(node.getStop()),
                       (ilcg.tree.Node) getOut(node.getIncrement()),
                       (ilcg.tree.Node) getOut(node.getMeaning())));
    }



    /**
     *  Create a memref node
     *
     * @param  node  Description of the Parameter
     */
    public void outAMemoryLoc(AMemoryLoc node)
    {
        setOut(node,
               new Memref((ilcg.tree.Node) getOut(node.getValue()),ilcg.tree.Format.any));
    }




    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAReallit(AReallit node)
    {
        setOut(node, new Real(Double.valueOf(node.toString())));
    }



    /**
     *  generic routine to associate internal strings with dyadic operators
     *
     * @param  node  Description of the Parameter
     * @param  s     Description of the Parameter
     */
    void handledyad(ilcg.node.Node node, String s)
    {
        defdop(node, s);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outASatmultDyadic(ASatmultDyadic node)
    {
        handledyad(node, ilcg.tree.Node.satmult);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outASatminusDyadic(ASatminusDyadic node)
    {
        handledyad(node, ilcg.tree.Node.satminus);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAMaxDyadic(AMaxDyadic node)
    {
        handledyad(node, ilcg.tree.Node.max);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAMinDyadic(AMinDyadic node)
    {
        handledyad(node, ilcg.tree.Node.min);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inALtDyadic(ALtDyadic node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outALtDyadic(ALtDyadic node)
    {
        handledyad(node, ilcg.tree.Node.lt);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAReplicateDyadic(AReplicateDyadic node)
    {
        handledyad(node, ilcg.tree.Node.rep);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAGtDyadic(AGtDyadic node)
    {
        handledyad(node, ilcg.tree.Node.gt);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outASatplusDyadic(ASatplusDyadic node)
    {
        handledyad(node, ilcg.tree.Node.satplus);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAEqDyadic(AEqDyadic node)
    {
        handledyad(node, ilcg.tree.Node.eq);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAPushDyadic(APushDyadic node)
    {
        handledyad(node, ilcg.tree.Node.push);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAPlusDyadic(APlusDyadic node)
    {
        handledyad(node, ilcg.tree.Node.plus);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outACallDyadic(ACallDyadic node)
    {
        handledyad(node, ilcg.tree.Node.apply);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAMinusDyadic(AMinusDyadic node)
    {
        handledyad(node, ilcg.tree.Node.minus);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAOrDyadic(AOrDyadic node)
    {
        handledyad(node, ilcg.tree.Node.or);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAndDyadic(AAndDyadic node)
    {
        handledyad(node, ilcg.tree.Node.and);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAXorDyadic(AXorDyadic node)
    {
        handledyad(node, "xor");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAShlDyadic(AShlDyadic node)
    {
        handledyad(node, "shl");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAShrDyadic(AShrDyadic node)
    {
        handledyad(node, "shr");
    }


    /**
     * this resolves the identifier at build time
     *on the assumption that instruction formats
     *that contain operators are expanded to
     *handle all the operators
     *
     * @param  node  Description of the Parameter
     */
    public void outAIdentifierDyadic(AIdentifierDyadic node)
    {
        Token id      = node.getIdentifier();
        String key    = id.getText();
        Object value  = names.get(key);
        if(value instanceof IlcgParam)
            {
                setOut(node,value);
            }
        else
            {
                error(key + " had no value ");
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outATimesDyadic(ATimesDyadic node)
    {
        handledyad(node, "times");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outADivideDyadic(ADivideDyadic node)
    {
        handledyad(node, "divide");
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outARemainderDyadic(ARemainderDyadic node)
    {
        handledyad(node, "remainder");
    }


    /**
     * Converts a TString into a string stripping off leading and
     *trailing quotes
     *
     * @param  s  Description of the Parameter
     * @return    Description of the Return Value
     */
    String printable(TString s)
    {
        String raw  = s.getText();
        return raw.substring(1, raw.length() - 1);
    }



    /**
     * plant a declaration of the  in the tree walker
     *
     * @param  node  Description of the Parameter
     */
    public void outARegisterdecl(ARegisterdecl node)
    {
        String id         = notrailingspaces(node.getIdentifier().toString());
        String printsAs   = printable(node.getString());
        ilcg.node.Node t            = node.getType();
        ilcg.node.Node a            = node.getAggregate();
        String aggs       = a.toString();
        String typestr    = "int32";
        boolean isStack   = aggs.startsWith("stack");
        boolean isVector  = aggs.startsWith("vector");
        boolean res       = node.getReservation().toString().startsWith("reserved");
        Object old = names.get(id);
        if(old != null)
            {
                printnames();
                error("line "+node.getIdentifier().getLine()+" register " + id + " is not a unique name "+
                      "\nIt already has the definition "+old +" : "+old.getClass());
            }
        Register det=
            new Register(printsAs,
                         "ref " + (typestr = notrailingspaces(t.toString())),
                         res,
                         registerSet,
                         globals,
                         regnum++);
        if(!isStack)
            {
                namesput(id, det);
            }
        else
            {
                AStackAggregate sa=(AStackAggregate)a;
                namesput(id,
                         new	RegisterStack(printsAs,
                                           det.returnType(),
                                           java.lang.Integer.valueOf((sa.getNumber().toString()).trim()),
                                           registerSet,
                                           globals
                                          )
                        );
            }
    }


    /*
     *  public void outAFpAliasdecl(AAliasdecl node)
     *  {
     *  String child="FP";
     *  String parent=notrailingspaces(node.getParent().toString());
     *  String lows,highs;
     *  lows=node.getLowbit().toString();
     *  Integer low=new Integer(notrailingspaces(lows));
     *  Integer high=new Integer(notrailingspaces(node.getHighbit().toString()));
     *  Object rd=names.get(child);
     *  if(rd==null){
     *  System.err.println("register "+child+" not declared at point "+
     *  node);
     *  return;
     *  }
     *  if(names.get(parent)==null)
     *  System.err.println("register "+parent+" not declared for use as alias in"+node);
     *  else{
     *  RegAlias ra=new RegAlias((RegDetails)names.get(parent),low.intValue(),high.intValue());
     *  ((RegDetails)rd).alias=ra;
     *  print("\tfp:="+regname(parent)+"code;");
     *  /  print("Register regFP=new Register(\""+printsAs+"\",\""+((RegDetails)rd).format+"\",registerSet,registerIndex);");
     *  }
     *  }
     */
    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAliasdecl(AAliasdecl node)
    {
        String child   = notrailingspaces(node.getChild().toString());
        String parent  = notrailingspaces(node.getParent().toString());
        String lows;
        String highs;
        lows = node.getLowbit().toString();
        java.lang.Integer low    = new java.lang.Integer(notrailingspaces(lows));
        java.lang.Integer high   = new java.lang.Integer(notrailingspaces(node.getHighbit().toString()));
        Object rd      = names.get(child);
        if(names.get(parent) == null)
            {
                System.err.println("register " + parent + " not declared for use as alias in" + node);
            }
        else if(child.equals("FP"))
            {
                FPAlias = (parent);
            }
        else if(child.equals("SP"))
            {
                SPAlias = (parent);
            }
        else
            {
                if(rd != null)
                    {
                        System.err.println("register " + child + " declared at point " + node);
                        return;
                    }
                String id          = child;
                String printsAs    = printable(node.getString());
                String typestr     = "int32";
                RegDetails det     = new RegDetails("ref " + (typestr = notrailingspaces(node.getType().toString())),
                                                    printsAs,
                                                    id,
                                                    null);
                if(names.get(id) != null)
                    {
                        error(id + " is not unique");
                    }
                //	RegAlias ra        = new RegAlias( ( RegDetails ) names.get( parent ), low.intValue(), high.intValue() );
                //		det.alias = ra;
                Register reg=new Register(printsAs,((RegDetails) det).format,(ilcg.tree.Register) names.get(parent),low,registerSet,globals);
                namesput(id,reg);
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAOpdecl(AOpdecl node)
    {
        String id         = notrailingspaces(node.getIdentifier().toString());
        String oper       = notrailingspaces(node.getOperator().toString());
        String printsAs   = printable(node.getString());
        if(names.get(id) != null)
            {
                error(id + " not unique");
            }
        Object[]assembly= {printsAs};
        ilcg.tree.IlcgParam[] params= {};
        ilcg.tree.Pattern pat=new ilcg.tree.Pattern(params,
                (ilcg.tree.Node)new Op(oper,ilcg.tree.Format.any,ilcg.tree.Format.any,ilcg.tree.Format.any),
                assembly);
        namesput(id, pat);
    }




    /**
     *  Description of the Method
     *
     * @param  id  Description of the Parameter
     * @return     Description of the Return Value
     */
    String regname(String id)
    {
        return  id ;
    }


    /**
     * Convert an id to a case insensitive form
     *
     * @param  id  Description of the Parameter
     * @return     Description of the Return Value
     */
    String pasname(String id)
    {
        String name  = id ;
        return name;
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAPlusOperator(APlusOperator node)
    {
        setOut(node, mkop(Op.plus));
    }
    Op mkop(String s)
    {
        return new Op(s,Op.any,Op.any,Op.any);
    }

    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAMinusOperator(AMinusOperator node)
    {
        setOut(node,mkop(Op.minus));
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outATimesOperator(ATimesOperator node)
    {
        setOut(node,mkop(Op.times));
//        defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outADivideOperator(ADivideOperator node)
    {
        setOut(node,mkop(Op.divide));
//        defaultOut(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAssign(AAssign node)
    {
        try
            {
                setOut(node,new Assign((ilcg.tree.Node)getOut(node.getRefval()),(ilcg.tree.Node)getOut(node.getValue()),false));
            }
        catch(Exception e)
            {
                error("line "+node.getStore().getLine()+"can not make assignment "+node.getRefval()+":="+node.getValue()+"\nbecause\n"+e);
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAValueMeaning(AValueMeaning node)
    {
        setres(node, node.getValue());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAssignMeaning(AAssignMeaning node)
    {
        setres(node, node.getAssign());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outALocMeaning(ALocMeaning node)
    {
        setres(node, node.getValue());
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAIfMeaning(AIfMeaning node)
    {
        setOut(node,
               new If(
                   (ilcg.tree.Node)getOut(node.getValue()),
                   (ilcg.tree.Node)getOut(node.getMeaning())
               )
              );
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAGotoMeaning(AGotoMeaning node)
    {
        setOut(node,
               new Goto(
                   (ilcg.tree.Node)getOut(node.getValue())
               )
              );
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAFailMeaning(AFailMeaning node)
    {
        setOut(node,
               new Fail(
                   (ilcg.tree.Node)getOut(node.getValue())
               )
              );
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAPatterndecl(APatterndecl node)
    {
        names.enterScope();
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAPatterndecl(APatterndecl node)
    {
        try
            {
                String name        = node.getIdentifier().getText();
                Dictionary params  = names.getCurrentScope();
                int i              = 0;
                ilcg.node.Node meaning       = node.getMeaning();
                Object[] assemblesto   = (Object[])getOut(node.getAssemblesto());
                //	pattern p          = new pattern( node, name, patternContext, params, "pattern "+ meaning ,
                //			procname( assemblesto ),
                //			meaning.toString() );
                names.leaveScope();
                Vector<IlcgParam> v=new Vector<IlcgParam>();
                for(Enumeration e = params.elements();
                        e.hasMoreElements();)
                    {
                        IlcgParam pp   = (IlcgParam) e.nextElement();
                        v.add(pp);
                    }
                IlcgParam [] parameters = {};
                parameters= v.toArray(parameters);
                Pattern p=	new Pattern(
                    parameters,
                    (ilcg.tree.Node)getOut(meaning),
                    assemblesto
                );
                p.setName(name);
                setOut(node,p);
                if(names.get(name) != null)
                    {
                        error("not a unique id " + name);
                    }
                namesput(name, p);
                if(patternContext == "address")
                    {
                        //	addressModes.put( name, p );
                    }
                if(patternContext == "instruction")
                    {
                        instructionSet.put(name, p);
                        //	namesput(name,p);
                    }
            }
        catch(Exception e)
            {
                error(" in outAPatterndecl" +e);
            }
    }


    /**
     * Add an alternative to the vector
     *
     * @param  node  Description of the Parameter
     */
    public void inAAlternativesPatterndecl(AAlternativesPatterndecl node)
    {
        defaultIn(node);
        alternatives = new Vector(0);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     * @return       Description of the Return Value
     */
    public boolean allRegisters(AAlternativesPatterndecl node)
    {
        //	print( "// are the following all registers ? " + node );
        boolean allregs   = true;
        AAlternatives pa  = (AAlternatives) node.getAlternatives();
        Object temp[]       = pa.getAlts().toArray();
        for(int i = 0; i < temp.length; i++)
            {
                Object alti  = temp[i];
                Object altt  = ((AAlts) alti).getType();
                if(altt instanceof ATypeidType)
                    {
                        ATypeidType att  = (ATypeidType) altt;
                        String alt       = ((ATypeid) att.getTypeid()).getIdentifier().getText();
                        print("//alternative (" + i + ") " + alt);
                        Object whatIsIt  = names.get(alt);
                        if(whatIsIt instanceof pattern)
                            {
                                whatIsIt = ((pattern) whatIsIt).getNode();
                            }
                        if(whatIsIt instanceof AAlternativesPatterndecl)
                            {
                                allregs = allregs && allRegisters((AAlternativesPatterndecl) whatIsIt);
                            }
                        else
                            {
                                allregs = allregs && (whatIsIt instanceof RegDetails);
                            }
                    }
                else
                    {
                        allregs = false;
                    }
            }
        return allregs;
    }


    /**
     * Collects all the alternatives into a vector of alternatives
     *indexed under the pattern name

     *
     * @param  node  Description of the Parameter
     */
    public void outAAlternativesPatterndecl(AAlternativesPatterndecl node)
    {
        //defaultOut(node);
        String patternid  = notrailingspaces(node.getIdentifier().toString());
        Pattern[] alternates = new Pattern[alternatives.size()];
        Register[]allregs = new Register[alternatives.size()];
        int rcount=0;
        for(int i = 0; i < alternatives.size(); i++)
            {
                Object a=names.get(alternatives.elementAt(i));
                try
                    {
                        if(a instanceof Format) a= new Pattern((Format)a);
                        if(a instanceof Register)
                            {
                                Register[] regs = {(Register)a};
                                allregs[i]=regs[0];
                                a = new Pattern(regs);
                                rcount++;
                            }
                        alternates[i]= (Pattern)a;
                    }
                catch(Exception e)
                    {
                        System.err.println("expected a pattern got "+a +" \nassociated with  " +alternatives.elementAt(i));
                        alternates[i]=(Pattern)a;
                    }
            }
        Pattern P= new Pattern(alternates);
        if(rcount==alternatives.size())P= new Pattern(allregs);
        P.setName(patternid);
        namesput(patternid, P);
        setOut(node,P);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAParamlist(AParamlist node)
    {
        //   defaultIn(node);
        paramindex = 0;
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAParamlist(AParamlist node)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAParam(AParam node)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAParam(AParam node)
    {
        String type      = notrailingspaces(node.getTypeid().toString());
        String id        = notrailingspaces(node.getIdentifier().toString());
        Object typeinfo  = names.get(type);
        IlcgParam p          = new IlcgParam(id, new Format(type), paramindex++);
        if(typeinfo == null)
            {
                error("type " + type + " undeclared");
            }
        else if(typeinfo instanceof Pattern)
            {
                p          = new IlcgParam(id, (Pattern)typeinfo, paramindex-1);
            }
        else
            error(type +" not a pattern ");
        namesput(id, p);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inATypeparamParam(ATypeparamParam node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outATypeparamParam(ATypeparamParam node)
    {
        String id  = notrailingspaces(node.getIdentifier().toString());
        namesput(id, new IlcgParam(id, new Format("type"), paramindex++));
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outALabelParam(ALabelParam node)
    {
        String id  = notrailingspaces(node.getIdentifier().toString());
        namesput(id, new IlcgParam(id, new Format("label"), paramindex++));
    }

    void namesput(Object id, Object token)
    {
        names.put(id,token);
        // System.out.println(" add "+id);
        if(token  instanceof Pattern)
            {
                ((Pattern)token).setName(id.toString());
                pats.add((Pattern)token);
                //  System.out.println("add "+token);
            }
        if(token instanceof Format) pats.add(token);
    }
    /**
     * checks that the identifier is declared
     *
     * @param  node  Description of the Parameter
     */
    public void inATypeid(ATypeid node)
    {
        defaultIn(node);
        // String id=node.getIdentifier().toString();
        String id      = notrailingspaces(node.toString());
        Object result  = names.get(id);
        if(result == null)
            {
                Token t  = node.getIdentifier();
                System.err.println(id + " undeclared on line " +
                                   t.getLine() + "," + t.getPos());
            }
    }


    /**
     * generates a procedure which if called checks that
     *the current tree matches the type currently asssociated
     *with the identifier
     *
     * @param  node  Description of the Parameter
     */
    public void outATypeid(ATypeid node)
    {
        //defaultOut(node);
        Token t   = node.getIdentifier();
        //  print("/** checks that the current tree matches the type ");
        //  print("currently associated with "+t+"*/");
        //  Object o = names.get(t.toString());
        Object o  = names.get(notrailingspaces(node.toString()));
        if(o==null) error(node.toString()+ " is undefined");
        setOut(node,o);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAParamtail(AParamtail node)
    {
        defaultIn(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAParamtail(AParamtail node)
    {
        // defaultOut(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAAlternatives(AAlternatives node)
    {
        alternatives = new Vector();
        alternatives.addElement(notrailingspaces(node.getType().toString()));
        //defaultIn(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAAlternatives(AAlternatives node)
    {
        //defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void inAAlts(AAlts node)
    {
        // defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAlts(AAlts node)
    {
        // defaultOut(node);
        alternatives.addElement(notrailingspaces(node.getType().toString()));
    }

    // declares start of an assembler output method

    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     */
    void defas(ilcg.node.Node n)
    {
        //	files[pimp][pfn].println( "\tFUNCTION " +
        //			procname( n ) + ":pprintlist;" );
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAssemblesto(AAssemblesto node)
    {
        ilcg.node.Node ap  = node.getAssemblypattern();
        setres(node,ap);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAAssemblypattern(AAssemblypattern node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAssemblypattern(AAssemblypattern node)
    {
        try
            {
                java.util.List tokens = node.getAssemblertoken();
                Object[]nodes = tokens.toArray();
                for(int i=0; i<nodes.length; i++)
                    nodes[i]= getOut((ilcg.node.Node)nodes[i]);
                setOut(node,nodes);
            }
        catch(Exception e)
            {
                error("in outAAssemblypattern "+e);
            }
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAStringAssemblertoken(AStringAssemblertoken node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAStringAssemblertoken(AStringAssemblertoken node)
    {
        setOut(node, printablestring(node.toString().trim()));
    }
    String printablestring(String s)
    {
        String raw = s;
        return raw.substring(1, raw.length() - 1);
    }

    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAIdentifierAssemblertoken(AIdentifierAssemblertoken node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAIdentifierAssemblertoken(AIdentifierAssemblertoken node)
    {
        //defaultOut(node);
        String id    = node.getIdentifier().getText();
        Object defn  = names.get(id);
        setOut(node, defn);
        // print(" defn is "+defn);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAAliasdeclStatement(AAliasdeclStatement node)
    {
        // defaultOut(node);
    }


    /**
     * Stores the association between the ilcg type and the assembler type
     *in a hash table
     *
     * @param  node  Description of the Parameter
     */
    public void outATyperenameStatement(ATyperenameStatement node)
    {
        String[] pair  = {notrailingspaces(node.getPredeclaredtype().toString()), node.getIdentifier().getText()};
        typerenamevec.addElement(pair);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outARegisterdeclStatement(ARegisterdeclStatement node)
    {
        //
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAAddressmodeStatement(AAddressmodeStatement node)
    {
        patternContext = "address";
        //defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAAddressmodeStatement(AAddressmodeStatement node)
    {
        //defaultOut(node);
        patternContext = "general";
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAInstructionformatStatement(AInstructionformatStatement node)
    {
        //defaultIn(node);
        patternContext = "instruction";
        instructionSet = procedureFormats;
    }


    /**
     * enters a name for the recogniser in the symbol table and sets
     *the pattern context to be instruction
     *
     * @param  node  Description of the Parameter
     */
    /*
     *  public void inAInstructionfunctionStatement(AInstructionfunctionStatement node)
     *  {	setIn(node,"p" +procNum+node.getIdentifier().getText());
     *  procNum++;
     *  names.enterScope();
     *  patternContext="instruction";
     *  instructionSet=functionFormats;
     *  }
     */
    public void outAInstructionformatStatement(AInstructionformatStatement node)
    {
        //defaultOut(node);
        patternContext = "general";
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAReturnval(AReturnval node)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAOpdeclStatement(AOpdeclStatement node)
    {
        defaultIn(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void outAFlagStatement(AFlagStatement node)
    {
        String id  = node.getIdentifier().getText();
        flags.put(id, new java.lang.Integer(node.getIntlit().getText()));
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAOpdeclStatement(AOpdeclStatement node)
    {
        //  defaultOut(node);
    }


    /**
     *  Description of the Method
     *
     * @param  node  Description of the Parameter
     */
    public void inAPatterndeclStatement(APatterndeclStatement node)
    {
        defaultIn(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAPatterndeclStatement(APatterndeclStatement node)
    {
        // defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */

    public void outAStatementlist(AStatementlist node)
    {
        // defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAInstructionlist(AInstructionlist node) { }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param  node  Description of the Parameter
     */
    public void outAStatements(AStatements node)
    {
        // defaultOut(node);
    }


    void printnames()
    {
        Enumeration keys = names.keys();
        while(keys.hasMoreElements())
            {
                Object k=keys.nextElement();
                if(k!=null)
                    {
                        if(names.get(k)!=null)
                            System.out.println(k.toString()+":"+names.get(k));
                    }
            }
    }

    /**
     *  The main program for the Ilcp class
     *
     * @param  arguments  The command line arguments
     */
    public static void main(String[] arguments)
    {
        if(arguments.length != 1)
            {
                System.out.println("usage:");
                System.out.println("java ilcg.Ilcg2Tree sourcefile ");
                System.exit(1);
            }
        try
            {
                Ilcg2Tree i2t=new Ilcg2Tree();
                new Parser(
                    new Lexer(
                        new PushbackReader(
                            new BufferedReader(
                                new FileReader(arguments[0])
                            ), 1024)
                    )
                ).parse().apply(i2t);
                i2t.printnames();
            }
        catch(Exception e)
            {
                System.out.println(e);
                e.printStackTrace();
            }
    }

    public static Ilcg2Tree loadTree(String path)throws Exception
    {
        Ilcg2Tree i2t=new Ilcg2Tree();
        new Parser(
            new Lexer(
                new PushbackReader(
                    new BufferedReader(
                        new FileReader(path)
                    ), 1024)
            )
        ).parse().apply(i2t);
        return i2t;
    }
}


