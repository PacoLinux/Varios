
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

 * This work is distributed in the hope that it will be useful, *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU *
 * Library General Public License for more details. *
 * *
 * You should have received a copy of the GNU Library General Public *
 * License along with this library; if not, write to the *
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330, *
 * Boston, MA 02111-1307, USA. *
 * *

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
package ilcg;




import java.io.*;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import ca.mcgill.sable.util.*;
import ilcg.analysis.*;
import ilcg.node.*;
//import com.c3d.structured.Relation;
import ilcg.tree.Format;


/**
 * Description of the Class
 *
 * @author Paul Cockshott
 * @created 22 November 2005
 */
public class IlcgTreeWalkGenerator extends
    DepthFirstAdapter
{
    PrintWriter out;
    //double version = IlcgTreeWalkGeneratorVer.VERSION;

    boolean VERBOSE=false;
    boolean outputcontext = false ;// set true when traversing an output
// meaning of a transformer pattern
    String FPAlias = "";

    String SPAlias = "";
    /**
     * Description of the Field
     */
    public boolean verbose = false;
    /**
     * A hash table that stores the formats of registers as strings, with
     *each register indexed on its name
     */
    public Hashtable globals = new Hashtable();
    /**
     * a table to store flags
     */
    public Hashtable flags = new Hashtable();
    /**
     * a vector of pairs mapping internal names for types to
     *those used in the assembler
     */
    public Vector typerenamevec = new Vector();
    /**
     * The symbol table tha handles embeded scopes
     */
    public SymbolTable names = new SymbolTable(globals);
    Dictionary procedureFormats = new Hashtable();
    Dictionary functionFormats = new Hashtable();
    Dictionary instructionSet = procedureFormats;
    Dictionary expandedInstructions = new Hashtable();
    Dictionary addressModes = new Hashtable();
    /**
     * Used to store the altenatives of a pattern as they are being parsed
     */
    Vector alternatives;
    /**
     * Patterns are either general, address or instruction
     */
    String patternContext = "unknown";
    /**
     * all generated procedures are numbered to ensure
     *that no two procedures have the same name
     */
    int procNum = 1;
    String cn, pk;
    Vector instructionset = new Vector();// instructions are tried in the
    // they occur in this list
    String transformer =""; // the root symbol of the transform grammer
    boolean[] starts = {true, true, true, true, false, false};
    String[] keywords = {"if", "for", "PUSH", "goto", ":=", "any"};
    int parentnum = 0;

    int paramindex = 0;


    /**
     *Constructor for the IlcgTreeWalkGenerator object
     *
     * @param s Description of the Parameter
     * @param cn_ Description of the Parameter
     * @param pk_ Description of the Parameter
     * @exception IOException Description of the Exception
     */
    public IlcgTreeWalkGenerator(String s, String cn_, String pk_)
    throws IOException
    {
        cn = cn_;
        pk = pk_;
        out = new PrintWriter(new FileOutputStream(s));
        // declare pregiven formats
        Node any=new TIdentifier("any");
        names.put("any", new pattern(any, "any", patternContext, new Hashtable(),
                                     "anymatcher",
                                     "anytransformer",
                                     "matches anything"));
        setIn(any,"anymatcher");
        names.put("int8", new Format("octet"));
        names.put("int16", new Format("halfword"));
        names.put("int64", new Format("doubleword"));
        names.put("int32", new Format("word"));
        names.put("uint8", new Format("octet"));
        names.put("uint16", new Format("halfword"));
        names.put("uint64", new Format("doubleword"));
        names.put("uint32", new Format("word"));
        names.put("ieee32", new Format("word"));
        names.put("ieee64", new Format("doubleword"));
        names.put("octet", new Format("octet"));
        names.put("halfword", new Format("halfword"));
        names.put("doubleword", new Format("doubleword"));
        names.put("word", new Format("word"));
        names.put("GP", new RegDetails("word", "GP", "GP", null));
        names.put("FP", new RegDetails("word", "FP", "FP", null));
        names.put("SP", new RegDetails("word", "SP", "SP", null));
    }


    void error(String s)
    {
        System.err.println(s);
        try
            {
                throw new Exception(s);
            }
        catch(Exception e)
            {
                //e.printStackTrace();
            }
        System.exit(1);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inStart(Start node)
    {
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outStart(Start node)
    {
        out.flush();
    }


    String localname(Object o)
    {
        Class c = o.getClass();
        String n = c.getName();
        if(n.lastIndexOf(".") >= 0)
            {
                n = n.substring(n.lastIndexOf(".") + 1);
            }
        return n;
    }


    /**
     * this function reserves a procedure name
     *for each node
     *
     * @param n Description of the Parameter
     */
    public void defaultIn(Node n)
    {
        setIn(n, "p" + localname(n) + procNum +(outputcontext?"Out":""));
        procNum++;
    }


    /**
     * Returns the recogniser or printer procedure name for this node
     *
     * @param n Description of the Parameter
     * @return Description of the Return Value
     */
    public String procname(Node n)
    {
        Object proc = getIn(n);
        if(proc == null)
            {
                error("no procedure declared for " + n+":"+n.getClass());
                return n.toString();
            }
        return proc.toString();
    }


    String memoname(Node n)
    {
        return "m" + procname(n);
    }
    // print the start of a recogniser proc

    void defps(Node n)
    {
        print("/** "+(outputcontext?"makes ":" recognises ") + n + " */");
        //String memo = "\tstatic String " + memoname(n) + "=\"\";";
        // print(memo);
        String heading = "\tpublic boolean " +
                         procname(n) +"("+
                         ("Node n")+")throws Exception{";
        if(outputcontext)heading="\tpublic Node " +
                                     procname(n) +"("+
                                     ("Node n")+")throws Exception{";
        out.println(heading);
        print("if(verbose)dlog(\""+procname(n)+":" + n +(outputcontext?" to make\");": "\",n);"));
    }
    // print the end of a recogniser proc

    void defpe()
    {
        out.println("\t}");
    }


    /**
     * print a procedure that will always fail when
     *used as a recogniser
     *
     * @param n Description of the Parameter
     */
    public void defaultOut(Node n)
    {
        defps(n);
        if(VERBOSE)
            {
                print("System.err.println(\" error default proc " +
                      procname(n) + " was called\");");
            }
        if(outputcontext)print("return n;");
        else print("return false;");
        // System.err.println("Default proc generated:"+procname(n));
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAProgram(AProgram node)
    {
        alternatives = new Vector();
        out.println("package " + pk + ";\nimport java.util.*;");
        out.println("public abstract class " + cn + " extends Walker{");
    }


    /**
     * this generates a pair of recognisers 1 recognising each variant of each
     *procedure patterns 1 matching each variant of function patterns
     */
    public void expandInstructions()
    {
        /*
         * handle procedure instructions
         */
        //System.out.println("expanding instructions");
        print("/** memofn to recognise instructions */");
        print("Hashtable matchmemo=new BoundedHinttable(4000);");
        print("\npublic boolean match(Node n,boolean restart,int startpoint)throws Exception{");
        print("\nint mark=buf.mark();// starting point in output buffer");
        print("int switchvar;\n\tif(restart)switchvar=startpoint;else switchvar=testmemo(matchmemo,n);");
        for(int j = 0; j < keywords.length; j++)
            {
                //System.out.println(keywords[j] + " instructions");
                boolean select = keywords[j] != "any";
                print("rollBack(mark);// undo any output for failed instructions ");
                if(select)
                    {
                        print("if(n.toString()." + (starts[j] ? "startsWith(\"" + keywords[j] + "\")){" : "indexOf(\"" + keywords[j] + "\")!=-1){"));
                    }
                print("\n\tswitch(switchvar){");
                int e = instructionset.size();
                try
                    {
                        for(int i = 0; i < e; i++)
                            {
                                print("case(" + i + "):");
                                Object key = instructionset.elementAt(i);
                                String k = key.toString();
                                pattern value = (pattern) names.get(key);
                                if((select & ((starts[j] ? value.getMeaning().startsWith(keywords[j]) : value.getMeaning().indexOf(keywords[j]) != -1))) | !select)
                                    {
                                        if(verbose)
                                            {
                                                System.out.println("expand instruction " + k);
                                            }
                                        print(" \t\tif(" + procname(((pattern) value).getNode()) + "(n)){");
                                        print("\t\t\t record(matchmemo," + i + ",n);return true;\n\t\t\t}\n\t\trollBack(mark);\t//erase failed output\n\t\t");
                                    }
                            }
                        print("}\n\t;return false;\n\t }");
                    }
                catch(NoSuchElementException ne)
                    {
                        System.out.println("in expand instructions " + e);
                    }
            }
    }


    public void expandPattern(pattern p)
    {
        expandPattern(p,"true");
    }
    public void expandPattern(pattern p, String precondition)
    {
        print("{");
        print(" res=false;names.enterScope();");
        declarevars(p);
        boolean instruction = p.context.equals("instruction");
        boolean transformer = p.context.equals("transformer");
        print(" patternrecsp++;");
        print(" String oldpad=pad;");
        print(" if (verbose)pad=pad+\"" + p.name + "> \";");
        print(" int resmark = ressp;");
        print(" \n\t\ttry{\n"
              +"\t\t\tif(" + p.internalrecognisingProc + "(n))if("+precondition+"){\n"
              +(transformer?
                "\t\t\t\t{transformedMatchedTree="+p.printingProc +"(n);} \n"
                :"\t\t\t\t{matchedAssembler="+p.printingProc +"();} \n"
               )
              +"\t\t\t\tmatchedTree=(n);\n"
              +"\t\t\t\tres= true;\n"
              +"\t\t\t}\n"
              +"\t\t}\n\t\tcatch (Exception ee){log(\" in pattern "+p.name+" \" +ee.toString());res=false;}");
        print("patternrecsp--;");
        if(instruction)
            {
                print("try{ rollBackReservations(resmark);}");
            }
        else
            {
                print("try{ if(!res)rollBackReservations(resmark);}");
            }
        print("catch (Exception ee){log(\"rolling back reservations \"+ee.toString()); res=false;}");
        forgetvars(p);
        print("names.leaveScope();pad=oldpad;");
        print("}");
    }


    void declarevars(pattern p)
    {
        Enumeration i = p.parameters.keys();
        int j = 1;
        while(i.hasMoreElements())
            {
                Object o = i.nextElement();
                j++;
            }
        print("Object [][]oldbindings=bindings;");
        print("bindings=new Object[3][" + j + "];");
        print("// fill in prebound parameters");
        print("for (int i=0;i<prebindings.length;i++){bindings[asfinallymatched][i]=oldbindings[asfinallymatched][prebindings[i]];"+
              "\n\t\tbindings[asoutput][i]=oldbindings[asoutput][prebindings[i]];"+
              "\n\t\tbindings[beforematching][i]=oldbindings[beforematching][prebindings[i]];}");
        print("int[]temppre={};prebindings=temppre;// forget the prebindings so they are not used in recursive calls");
    }


    void forgetvars(pattern p)
    {
        print("bindings=oldbindings;");
    }


    /**
     * create a new alternatives structure to hold
     *the ordered list of instructions. It is
     *important to retain the ordering in this list
     *in order to give the specifier of an instructionset
     *some control of the order in which alternative
     *instructions will be attempted when doing a match
     *
     * @param node Description of the Parameter
     */
    public void inAInstructionlist(AInstructionlist node)
    {
        alternatives = new Vector();
        defaultIn(node);
    }


    /**
     * declaress the constructor for the code generator class
     *
     * @param node Description of the Parameter
     */
    public void outAProgram(AProgram node)
    {
        instructionset = alternatives;
        try
            {
                //	for(int i=0;i<alternatives.size ();i++)
                //	System.out.println("elem "+i+" "+alternatives.elementAt(i));
                expandInstructions();
                out.println("public " + cn + "(){");
                print("// generated by TreeWalkGenerator ");
                if(FPAlias.equals(""))
                    {
                        System.err.println("FP alias not declared");
                    }
                else
                    {
                        out.println("setFP(" + FPAlias + ");getFP().reservePermanently();");
                    }
                if(SPAlias.equals(""))
                    {
                        System.err.println("SP alias not declared");
                    }
                else
                    {
                        out.println("setSP(" + SPAlias + ");getSP().reservePermanently();");
                    }
                for(int i = 0; i < typerenamevec.size(); i++)
                    {
                        String[] pair = (String[]) typerenamevec.elementAt(i);
                        out.println("typerename(\"" + pair[0] + "\",\"" + pair[1] + "\");");
                    }
                print("/** initialises the flags declared in the cpu description */");
                Enumeration f = flags.keys();
                while(f.hasMoreElements())
                    {
                        Object k = f.nextElement();
                        Object val = flags.get(k);
                        print("flags.put(\"" + k + "\",  java.lang.Integer.valueOf(" + val + "));");
                    }
                out.println("}\n}");
            }
        catch(Exception e2)
            {
                System.out.println(" in outAProgram trapped " + e2);
            }
    }


    boolean containsAnId(ADerefRhs node)
    {
        PRefval rv = node.getRefval();
        if(rv instanceof ARefval)
            {
                print("// the refval was " + rv);
                ARefval arv = (ARefval) rv;
                PLoc pl = arv.getLoc();
                return (pl instanceof AIdLoc);
            }
        return false;
    }


    AIdLoc getTheId(ADerefRhs node)
    {
        return (AIdLoc)((ARefval) node.getRefval()).getLoc();
    }
    // check if the id labels a set of alternatives

    Node getAlts(AIdLoc node)
    {
        String theId = node.getIdentifier().getText();
        print("// the id is " + theId);
        Object val = names.get(theId);
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + theId);
            }
        else if(val instanceof Param)
            {
                print("// it is a parameter id");
                String typeName = ((Param) val).type;
                print("// its type is " + typeName);
                Object typeDenotation = names.get(typeName);
                if(typeDenotation == null)
                    {
                        error("undeclared type " + typeName + " in getAlts " + node);
                    }
                else
                    {
                        pattern p = (pattern) typeDenotation;
                        Node n = p.getNode();
                        return n;
                    }
            }
        return null;
    }


    boolean containsJustARegId(ADerefRhs node)
    {
        if(containsAnId(node))
            {
                print("// contains an id");
                Node n = getAlts(getTheId(node));
                if(n == null)
                    {
                        return false;
                    }
                print("// and the alternatives are not null ");
                if(n instanceof AAlternativesPatterndecl)
                    {
                        print("// and the result is an alternative pattern ");
                        if(allRegisters((AAlternativesPatterndecl) n))
                            {
                                return true;
                            }
                        print("// but the alternatives are not all registers ");
                    }
            }
        return false;
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outADerefRhs(ADerefRhs node)
    {
        out.println("/** recongnises deref(refval) */");
        defps(node);
        Node rv = node.getRefval();
        if(outputcontext)
            {
                print("return new Deref("+procname(node.getRefval()) +
                      "((n)));");
            }
        else
            {
                out.println("\t\tn=decast(n);/* remove casts here as they do not change the semantics */");
                out.println("\t\tif(n instanceof Deref)");
                out.println("\t\treturn " + procname(node.getRefval()) +
                            "(((Monad)n).arg);");
                if(containsJustARegId(node))
                    {
                        print("//we can recognise any expression loaded into a register here ");
                        print("return " + procname(node.getRefval()) + "(n);");
                    }
                else
                    {
                        print("\t\treturn false;");
                    }
            }
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAReallitNumber(AReallitNumber node)
    {
        out.println("/** recognises a real in number context */");
        defps(node);
        out.println("\t\treturn (n instanceof Real)&&");
        out.println("\t\t\t((Real) n).doubleValue()==" + node.toString() + ";");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAIntegerNumber(AIntegerNumber node)
    {
        out.println("/** recognises an integer literal in number context */");
        defps(node);
        if(outputcontext)
            {
                print("return new Int("+node+");");
            }
        else
            {
                out.println("\t\treturn (n instanceof Int)&&");
                out.println("\t\t\t((Int) n).longValue()==" + node.toString() + ";");
            }
        defpe();
    }

// public void outARefvalValue(ARefvalValue node)
// { out.println(
// "\t/** Recognises a refval in value context */");
// defps(node);
// out.println("\t\treturn "+
// procname(node.getRefval())+"(n);");
// defpe();
// }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outALocValue(ALocValue node)
    {
        out.println(
            "\t/** Recognises a loc in value context, outputcontext="+outputcontext+" */");
        defps(node);
        out.println("\t\treturn " +
                    procname(node.getLoc()) + "("+(outputcontext?"n":"n.eval()")+");");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outANumberRhs(ANumberRhs node)
    {
        print("/** recognizes a number */ ");
        defps(node);
        out.println("\t\treturn " + procname(node.getNumber()) +
                    "(n);");
        defpe();
    }



    void defforms(Node n)
    {
        out.println("\tpublic "+(outputcontext?"Node ": "boolean ") + procname(n) + "(Format n)throws Exception{");
    }



    void print(String s)
    {
        out.println("\t\t" + s);
        out.flush();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAOctetFormat(AOctetFormat node)
    {
        defforms(node);
        print("return returnFormat(n)==Node.octet;");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAHalfwordFormat(AHalfwordFormat node)
    {
        defforms(node);
        print("return returnFormat(n)==Node.halfword;");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAWordFormat(AWordFormat node)
    {
        defforms(node);
        print("return returnFormat(n)==Node.word;");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outADoublewordFormat(ADoublewordFormat node)
    {
        defforms(node);
        print("return returnFormat(n)==Node.doubleword;");
        defpe();
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAQuadwordFormat(AQuadwordFormat node)
    {
        defforms(node);
        print("return returnFormat(n)==Node.quadword;");
        defpe();
    }




    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAReference(AReference node)
    {
        //defforms(node);
        defps(node);
        if(outputcontext)
            print(" return new Format(\"ref \" +"+ procname(node.getType()) +"(n ));");
        else
            print("return ( n instanceof Ref)&&"
                  + procname(node.getType()) +
                  "(((Ref)n).refTo());");
        defpe();
    }






    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAReftypeType(AReftypeType node)
    {
        //defforms(node);
        defps(node);
        print("return " +
              procname(node.getReference()) +
              "(n);");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outATypeidType(ATypeidType node)
    {
        defps(node);
        print("return " +
              procname(node.getTypeid()) +
              "(n);");
        defpe();
    }


    /*
     * public void outAFormatTypeprim(AFormatTypeprim node)
     * {
     * defforms(node);
     * print("return "+
     * procname(node.getFormat())+
     * "(n);");
     * defpe();
     * }
     */
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outATypeidTypeprim(ATypeidTypeprim node)
    {
        defps(node);
        print("return " +
              procname(node.getTypeid()) +
              "(n);");
        defpe();
    }
    public void outAPredeclaredtypeType(APredeclaredtypeType node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return new Format(\""+node.toString().trim()+"\");");
                defpe();
            }
        else
            defaultOut(node);
    }

    public void outAPredeclaredtypeTypeprim(APredeclaredtypeTypeprim node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return new Format(\""+node.toString().trim()+"\");");
                defpe();
            }
        else
            defaultOut(node);
    }

    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASignedTformat(ASignedTformat node)
    {
        defforms(node);
        if(outputcontext)
            print("return new Format(n.returnType() );");
        else
            print("return n.isSigned();");
        defpe();
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAUnsignedTformat(AUnsignedTformat node)
    {
        defforms(node);
        if(outputcontext)
            print("return new Format(n.returnType() );");
        else
            print("return n.isUnsigned();");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAIeee32Tformat(AIeee32Tformat node)
    {
        defps(node);
        if(outputcontext)
            print("return new Format(n.returnType() );");
        else
            print("return n.returnType()==Node.ieee32;");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAIeee63Tformat(AIeee63Tformat node)
    {
        defps(node);
        if(outputcontext)
            print("return new Format(n.returnType() );");
        else
            print("return n.returnType()==Node.ieee64;");
        defpe();
    }




    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outARhsValue(ARhsValue node)
    {
        defps(node);
        if(outputcontext)
            {
                print("return "+ procname(node.getRhs()) + "(n);");
            }
        else
            {
                print("enterRhs();");
                print("boolean res= " + procname(node.getRhs()) + "(n);");
                print("leaveRhs();");
                print("return res;");
            }
        defpe();
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASigned(ASigned node)
    {
        matchint(node, "int32");
    }


    void matchint(Node node, String tid)
    {
        defps(node);
        if(outputcontext)
            {
                print("return new Cast(\""+tid+"\","+procname(node)+"(n));");
            }
        else
            {
                print("return (n.returnType()==Node." + tid + ")&&");
                print(" ((n instanceof Number)||matches(n,Node." + tid + "));");
            }
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAInt8Signed(AInt8Signed node)
    {
        matchint(node, "int8");
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAInt16Signed(AInt16Signed node)
    {
        matchint(node, "int16");
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAInt64Signed(AInt64Signed node)
    {
        matchint(node, "int64");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAUnsigned(AUnsigned node)
    {
        matchint(node, "uint32");
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAUint8Unsigned(AUint8Unsigned node)
    {
        matchint(node, "uint8");
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAUint16Unsigned(AUint16Unsigned node)
    {
        matchint(node, "uint16");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAUint64Unsigned(AUint64Unsigned node)
    {
        matchint(node, "uint64");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAMonadicValue(AMonadicValue node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAMonadicValue(AMonadicValue node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return new Monad(\""+node.getMonadic().toString().trim()+"\"," +procname(node.getValue())+"((n)));");
                defpe();
            }
        else
            outAMonadicValue(node, "void");
    }
    public void outAMonadicCondition(AMonadicCondition node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return new Monad(\""+node.getMonadic().toString().trim()+"\"," +procname(node.getCondition())+"((n)));");
                defpe();
            }
        else
            outAMonadicValue(node, "void");
    }
    public void outAMonadicValue(AMonadicCondition node, String type)
    {
        defps(node);
        String op = notrailingspaces(node.getMonadic().toString());
        String argrec = procname(node.getCondition());
        print("boolean res=true;");
        print("if(!(n instanceof Monad))res= false;else{");
        print("\tMonad d=(Monad)n;");
        print("\tif(! " + procname(node.getMonadic()) + "(d.oper))res= false;");
        print("\tif(res){\n\t\tif(!(" + argrec + "(d.getArg())))res= false;");
        if(op.equals("EXTEND"))
            {
                print("\t// try to decompose the extension if res has failed");
                print("\tif(!res){");
                print("\t String mapto= n.returnType();");
                print("\t String mapfrom= d.getArg().returnType();");
                print("\t if (Format.isInteger(mapfto)){");
                print("\t \tint l1= Format.lengthInBits(mapto);");
                print("\t \tint l2= Format.lengthInBits(mapfrom);");
                print("\t \tif (l1==4*l2 || l1==8*l2){\n" +
                      "\t\t \t // we can do it in two stages\n" +
                      "\t\t \tOp newop= new Op(d.oper.Symbol,mapfrom,Format.halftype(mapto));\n" +
                      "\t\t \tNode n2=new Monad(newop,d.getArg());\n" +
                      //	"\t\t n2=new Cast(
                      "\t\t \tres=" + argrec + "(n2);\n");
                print("\t\t}}");
                print("\t}");
            }
        print("\t}\n}");
        if(!op.equals("POP"))
            {
                print("return res;");
            }
        else
            {
                Object val = names.get(notrailingspaces(node.getCondition().toString()));
                // check its type!!! if(!outputcontext)error("in or out suffix only allowed in output context");
                if(val == null)
                    {
                        error("undeclared register stack" + node.getCondition());
                    }
                else if(val instanceof RegDetails)
                    {
                        //if(!outputcontext)error("in or out suffix only allowed in output context");
                        String rn = "reg" + ((RegDetails) val).internalname;
                        print("int currentStackDepth=" + rn + ".depthUsed;");
                        print("if(!res)res =codeGen(new Push(");
                        print(rn + ",(n)));");
                        print("if(!res){" + rn + ".depthUsed=currentStackDepth;}");
                        print("return res;");
                    }
                else
                    {
                        error("not a register stack " + node.getCondition());
                    }
            }
        defpe();
    }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     * @param type Description of the Parameter
     */
    public void outAMonadicValue(AMonadicValue node, String type)
    {
        defps(node);
        String op = notrailingspaces(node.getMonadic().toString());
        String argrec = procname(node.getValue());
        print("boolean res=true;");
        print("if(!(n instanceof Monad))res= false;else{");
        print("\tMonad d=(Monad)n;");
        print("\tif(! " + procname(node.getMonadic()) + "(d.oper))res= false;");
        print("\tif(res){\n\t\tif(!(" + argrec + "(d.getArg())))res= false;");
        if(op.equals("EXTEND"))
            {
                print("\t// try to decompose the extension if res has failed");
                print("\tif(!res){");
                print("\t String mapto= n.returnType();");
                print("\t String mapfrom= d.getArg().returnType();");
                print("\t int l1= Format.lengthInBits(mapto);");
                print("\t int l2= Format.lengthInBits(mapfrom);");
                print("\t if (Format.isInteger(mapto)){");
                print("\t if (l1==4*l2 || l1==8*l2){\n" +
                      "\t\t // we can do it in two stages\n" +
                      "\t\t Op newop= new Op(d.oper.Symbol,mapfrom,Format.halftype(mapto));\n" +
                      "\t\t Node n2=new Monad(newop,d.getArg());\n" +
                      //	"\t\t n2=new Cast(
                      "\t\t res=" + argrec + "(n2);\n");
                print("\t\t}}");
                print("\t}");
            }
        print("\t}\n}");
        if(!op.equals("POP"))
            {
                print("return res;");
            }
        else
            {
                Object val = names.get(notrailingspaces(node.getValue().toString()));
                // check its type!!! if(!outputcontext)error("in or out suffix only allowed in output context");
                if(val == null)
                    {
                        error("undeclared register stack" + node.getValue());
                    }
                else if(val instanceof RegDetails)
                    {
                        //if(!outputcontext)error("in or out suffix only allowed in output context");
                        String rn = "reg" + ((RegDetails) val).internalname;
                        print("int currentStackDepth=" + rn + ".depthUsed;");
                        print("if(!res)res =codeGen(new Push(");
                        print(rn + ",(n)));");
                        print("if(!res){" + rn + ".depthUsed=currentStackDepth;}");
                        print("return res;");
                    }
                else
                    {
                        error("not a register stack " + node.getValue());
                    }
            }
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outACastpopRhs(ACastpopRhs node)
    {
        String castType = notrailingspaces(node.getType().toString());
        print("/** try to cast to type: " + castType + "*/");
        defps(node);
        //System.out.println("Cast to "+castType);
        String prefix = "";
        boolean wasrefpop=false;
        print("String nt=n.returnType();");
        while(castType.startsWith("ref "))
            {
                castType = Format.typeDeref(castType);
                print("if ( nt.startsWith(\"ref\"))");
                print("nt=Format.typeDeref(nt );");
                print("else return false ;");
                wasrefpop=true;
            }
        Object val = names.get(castType);
        if(Format.ispredeclared(castType) || Format.isVector(castType))
            {
                //if(Format.isVector(castType))System.out.println("\tis a vector ");
                print("if(verbose)dlog(\"CastRhs predeclared or vector cast " + castType + "=\"+nt,n);");
                print(" if(!Format.castIsSafe(\"" + castType + "\",nt))return false;");
            }
        else if(val == null)
            {
                System.out.println(castType + " unknown in " + node);
            }
        else if(val instanceof Param)
            {
                print("if(!bindtype(nt," + ((Param) names.get(castType)).index + "))return false;");
                String tt = ((Param) val).type;
                Object whatIsThis = names.get(tt);
                if(whatIsThis instanceof pattern)
                    {
                        String recogniser = procname(((pattern) whatIsThis).getNode());
                        print("\tif(!" + recogniser + "(n))return false;");
                    }
            }
        else
            {
                print("if(!nt.equals(\"" + castType + "\")) return false;");
            }
        print("if(n instanceof Cast){;");
        print("\tNode subt = ((Cast)n).getSubtree();");
        print("\t n=subt;//it is a permited null cast");
        print("}");
        Object val2 = names.get(notrailingspaces(node.getValue().toString()));
        // check its type!!!
        print("// val2 =" + val2);
        if(val2 == null)
            {
                error("undeclared register stack" + node.getValue());
            }
        else if(val2 instanceof RegDetails)
            {
                String rn = "reg" + ((RegDetails) val2).internalname;
                print("// internal name =" + rn);
                print("int currentStackDepth=" + rn + ".depthUsed;");
                print("if(n instanceof Monad){\n\t\t Monad m1=(Monad)n;");
                print("\t\tif (m1.oper.Symbol.equals(Node.pop)&&" + rn + ".equals(m1.getArg()))return true;");
                print("}");
                print("boolean res =codeGen(new Push(");
                print(rn + ",new Cast("+(wasrefpop?"getAddressType()":"nt")+",n)));");
                print("if(!res){" + rn + ".depthUsed=currentStackDepth;}");
                print("return res;");
            }
        else
            {
                error("not a register stack " + node.getValue());
            }
        //print("return "+procname(node.getValue())+	"(n);");
        defpe();
    }


    public void outAFreeMonadic(AFreeMonadic node)
    {
        handlemonad(node);
    }
    public void outAAbsMonadic(AAbsMonadic node)
    {
        handlemonad(node);
        //if(outputcontext)print("return new Monad(
        //print("return n.toString().startsWith(\"ABS\");");
        //defpe();
    }
    void handlemonad(Node n)
    {
        handledyad(n,notjava(n.toString().trim().toLowerCase()));
    }
    String notjava(String s)
    {
        // make sure we do not return a java reserved word
        if(s.equals("float"))return "flt";
        return s;
    }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAExtendMonadicb(AExtendMonadic node)
    {
        //defps(node);
        //print("return n.toString().startsWith(\"EXTEND\");");
        //defpe();
        handlemonad(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASqrtMonadic(ASqrtMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"SQRT\");");
        //defpe();
    }

    public void outASqrMonadic(ASqrMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"SQR\")&&!n.toString().startsWith(\"SQRT\");");
        //defpe();
    }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outATanMonadic(ATanMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"TAN\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outACosMonadic(ACosMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"COS\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outALnMonadic(ALnMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"LN\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASinMonadic(ASinMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"SIN\");");
        //defpe();
    }


    /*
     * public void outAPopMonadic(APopMonadic node)
     * {
     * defps(node);
     * print("return n.toString().startsWith(\"POP\");");
     * defpe();
     * }
     */
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outANotMonadic(ANotMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"NOT\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAFloatMonadic(AFloatMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"FLOAT\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outARoundMonadic(ARoundMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"ROUND\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outATruncMonadic(ATruncMonadic node)
    {
        handlemonad(node);
        //defps(node);
        //print("return n.toString().startsWith(\"TRUNCATE\");");
        //defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outADyadicValue(ADyadicValue node)
    {
        defps(node);
        if(!outputcontext)
            {
                print("if(!(n instanceof Dyad))return false;");
                print("Dyad d=(Dyad)n;");
            }
        if(!outputcontext)
            print("if(! " + procname(node.getDyadic()) +"(d.O))return false;");
        String lrec = procname(node.getLeft());
        String rrec = procname(node.getRight());
        String op = procname(node.getDyadic());
        String opsym = node.getDyadic().toString().trim();
        if(outputcontext)
            {
                print("return new Dyad("+ (lrec)+"(n),"+ (rrec)+"(n),"+ op+ "(n).toString() );");
            }
        else
            {
                if(opsym.equals("+") || opsym.equals("*") || opsym.equals("*:") || opsym.equals("+:") || opsym.equals("MAX")
                        || opsym.equals("AND") || opsym.equals("OR") || opsym.equals("MIN") || opsym.equals("XOR"))
                    {
                        // handle commuting operators
                        print(" int resmark = ressp;");
                        print(" int m2 = buf.mark();Object []ob = (Object[])bindings[asfinallymatched].clone(); ");
                        print(" if( " + lrec + "(d.left)){\n\t \n\t patternrecsp+=dyadicinc; if(" + rrec + "(d.right)){patternrecsp-=dyadicinc;return true;};");
                        print(" patternrecsp-=dyadicinc;}");
                        print(" if(verbose)log(\" try to commute arguments \");bindings[asfinallymatched]=ob;");
                        print(" rollBackReservations(resmark);rollBack(m2);// get rid of any instruction generated for commuting path ");
                        print(" if( " + lrec + "(d.right)){\n\t \n\t patternrecsp+=dyadicinc; if(" + rrec + "(d.left)){patternrecsp-=dyadicinc;return true;};");
                        print(" patternrecsp-=dyadicinc;}");
                        print("return false;");
                        defpe();
                        return;
                    }
                else
                    {
                        print("if(!(" + lrec + "(d.left)))return false;");
                        print("patternrecsp+=dyadicinc;");
                        print("if(!(" + rrec + "(d.right))){patternrecsp-=dyadicinc;return false;}");
                        print("patternrecsp-=dyadicinc;")
                        ;
                    }
                // this does not work any more if there are local variable cached in registers
                // it results in them being prematurely unreserved so comment out
                //if (op.equals("PUSH")||op.equals("push")){print("unreserve(d.right);");}
                print("return true;");
            }
        defpe();
    }
    public void outADyadicCondition(ADyadicCondition node)
    {
        defps(node);
        if(!outputcontext)
            {
                print("if(!(n instanceof Dyad))return false;");
                print("Dyad d=(Dyad)n;");
            }
        if(!outputcontext)
            print("if(! " + procname(node.getDyadic()) +"(d.O))return false;");
        String lrec = procname(node.getLeft());
        String rrec = procname(node.getRight());
        String op = procname(node.getDyadic());
        if(outputcontext)
            {
                print("return new Dyad("+ (lrec)+"(n),"+ (rrec)+"(n),"+ op+ "(n).toString() );");
            }
        else
            {
                if(op.equals("+") || op.equals("*") || op.equals("*:") || op.equals("+:") || op.equals("MAX")
                        || op.equals("AND") || op.equals("OR") || op.equals("MIN") || op.equals("XOR"))
                    {
                        // handle commuting operators
                        print(" int resmark = ressp;");
                        print(" int m2 = buf.mark();Object []ob = (Object[])bindings[asfinallymatched].clone(); ");
                        print(" if( " + lrec + "(d.left)){\n\t \n\t patternrecsp+=dyadicinc; if(" + rrec + "(d.right)){patternrecsp-=dyadicinc;return true;};");
                        print(" patternrecsp-=dyadicinc;}");
                        print(" if(verbose)log(\" try to commute arguments \");bindings[asfinallymatched]=ob;");
                        print(" rollBackReservations(resmark);rollBack(m2);// get rid of any instruction generated for commuting path ");
                        print(" if( " + lrec + "(d.right)){\n\t \n\t patternrecsp+=dyadicinc; if(" + rrec + "(d.left)){patternrecsp-=dyadicinc;return true;};");
                        print(" patternrecsp-=dyadicinc;}");
                        print("return false;");
                        defpe();
                        return;
                    }
                else
                    {
                        print("if(!(" + lrec + "(d.left)))return false;");
                        print("patternrecsp+=dyadicinc;");
                        print("if(!(" + rrec + "(d.right))){patternrecsp-=dyadicinc;return false;}");
                        print("patternrecsp-=dyadicinc;")
                        ;
                    }
                // this does not work any more if there are local variable cached in registers
                // it results in them being prematurely unreserved so comment out
                //if (op.equals("PUSH")||op.equals("push")){print("unreserve(d.right);");}
                print("return true;");
            }
        defpe();
    }

    String notrailingspaces(String s)
    {
        int len = s.length();
        if(s.charAt(len - 1) == ' ')
            {
                return notrailingspaces(s.substring(0, len - 1));
            }
        return s;
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outACastRhs(ACastRhs node)
    {
        String castType = notrailingspaces(node.getType().toString());
        if(!outputcontext)print("/** try to cast to type: " + castType + "*/");
        defps(node);
        if(outputcontext)
            {
                print("return new Cast(\""+castType+"\","+procname(node.getValue())+"((n)));");
            }
        else
            {
                //System.out.println("Cast to "+castType);
                String prefix = "";
                print("String nt=n.returnType();");
                while(castType.startsWith("ref "))
                    {
                        castType = Format.typeDeref(castType);
                        print("if ( nt.startsWith(\"ref\"))");
                        print("nt=Format.typeDeref(nt );");
                        print("else return false ;");
                    }
                Object val = names.get(castType);
                if(Format.ispredeclared(castType) || Format.isVector(castType))
                    {
                        //if(Format.isVector(castType))System.out.println("\tis a vector ");
                        print("if(verbose)dlog(\"CastRhs predeclared or vector cast " + castType + "=\"+nt,n);");
                        print(" if(!Format.castIsSafe(\"" + castType + "\",nt))return false;");
                    }
                else if(val == null)
                    {
                        System.out.println(castType + " unknown in " + node);
                    }
                else if(val instanceof Param)
                    {
                        print("if(!bindtype(nt," + ((Param) names.get(castType)).index + "))return false;");
                        String tt = ((Param) val).type;
                        Object whatIsThis = names.get(tt);
                        if(whatIsThis instanceof pattern)
                            {
                                String recogniser = procname(((pattern) whatIsThis).getNode());
                                print("\tif(!" + recogniser + "(n))return false;");
                            }
                    }
                else
                    {
                        print("if(!nt.equals(\"" + castType + "\")) return false;");
                    }
                print("if(n instanceof Cast){;");
                print("\tNode subt = ((Cast)n).getSubtree();");
                print("\t n=subt;//it is a permited null cast");
                print("}");
                print("return " + procname(node.getValue()) +
                      "(n);");
            }
        defpe();
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outARefval(ARefval node)
    {
        print("/** recognises a refval which is a location */");
        defps(node);
        String dest = procname(node.getLoc());
        print("return " + dest + "(n.eval());");
        defpe();
        setIn(node, dest);// set to bypass
    }
    public void outAIdCondition(AIdCondition node)
    {
        print("/** recognises an idetifier in a condition w  */");
        defps(node);
        String dest = procname(node.getLoc());
        print("return " + dest + "(n.eval());");
        defpe();
        setIn(node, dest);// set to bypass
    }
    public void inAPrecond(APrecond node)
    {
        defaultIn(node);
        outputcontext=true;
    }
    public void outAPrecond(APrecond node)
    {
        outputcontext=false;
        defps(node);
        print("return testiftrue("+procname(node.getCondition())+"(n));");
        defpe();
    }
    public void outAUnconditionalPrecond(AUnconditionalPrecond node)
    {
        print("/** recognises an unconditional precondition that always passes */");
        defps(node);
        print("return true;");
        defpe();
    }

    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outARefcastRefval(ARefcastRefval node)
    {
        String castType = notrailingspaces(node.getType().toString());
        print("/** try to cast to type: " + castType + "*/");
        defps(node);
        String prefix = "";
        String derefcast = (castType);
        while(Format.isRef(derefcast))
            {
                prefix = prefix + "ref ";
                derefcast = Format.typeDeref(derefcast);
            }
        print("String nt=n.returnType();");
        print("if(!nt.startsWith(\"" + prefix + "\"))return false;");
        if(Format.ispredeclared(derefcast) || Format.isVector(derefcast))
            {
                //if(Format.isVector(castType))System.out.println("\tis a vector ");
                //print("dlog(\"predeclared or vector cast "+castType+"\",n);");
                //	print("if(!(Format.lengthInBits(Format.typeDeref(nt))=="+Format.lengthInBits(derefcast)+"))return false;");
                //print("if(!Format.typeDeref(nt).equals(\""+derefcast+"\"))");
                print(" if(!Format.castIsSafe(\"" + castType + "\",nt))return false;");
            }
        else
            {
                Object val = names.get(derefcast);
                if(val != null && val instanceof Param)
                    {
                        Param p = (Param) val;
                        int index = p.index;
                        if(prefix.equals("ref "))
                            {
                                print("String rest= Format.typeDeref(nt);");
                            }
                        else
                            {
                                print("String rest = nt.substring(" + prefix.length() + ",nt.length());");
                            }
                        print("if(bindings[asfinallymatched][" + index +
                              "]!=null)\n\t\tif(!rest.equals(bindings[asfinallymatched][" + index +
                              "].toString()))return false;");
                        //checktype
                        Object oo = names.get(p.type);
                        if(oo != null)
                            {
                                pattern pp = (pattern) names.get(p.type);
                                print("if(!" + pp.internalrecognisingProc + "(new Deref(n)))return false;");
                            }
                        print("bindings[asfinallymatched][" + index + "]=bindings[asoutput][" + index + "]=rest;");
                        print("if(verbose)dlog(\"bind "+castType+" to ref \"+rest,n);");
                    }
                else
                    {
                        print("if(!n.returnType().equals(\"" + castType + "\"))return false;");
                    }
            }
        print("if(n instanceof Cast)n=((Cast)n).getSubtree();");
        print("return " + procname(node.getLoc()) +
              "(n);");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAConstRhs(AConstRhs node)
    {
        Token id = node.getIdentifier();
        print("/** matches a literal to the tree at this point*/");
        defps(node);
        print("if(!n.knownAtCompileTime())return false;");
        print("n=n.eval();");
        print("if(!((n) instanceof Number))return false;");
        // print("{push(n.eval());return true;}");
        // print("return false;");
        // /*
        Object val = names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + id);
            }
        else if(val instanceof Param)
            {
                String typeName = ((Param) val).type;
                Object typeDenotation = names.get(typeName);
                if(typeDenotation == null)
                    {
                        if(typeName.equals("label"))
                            {
                                print("if(n instanceof Label) return true; else return false;");
                            }
                        else
                            {
                                error("undeclared type " + typeName + " in AConstRhs " + node);
                            }
                    }
                else
                    {
                        pattern p = (pattern) typeDenotation;
                        int index = ((Param) val).index;
                        print("if(" + procname(p.getNode()) + "(n)){");
                        print("\tbindings[asfinallymatched][" + index + "]=matchedTree;" +
                              "\n\t\tbindings[asoutput][" + index + "]=matchedAssembler;\n\t\treturn true;}");
                        print("else return false;");
                    }
            }
        //*/
        //print("return bind (n,\""+id.getText()+"\");");
        defpe();
    }


    void memotest(Node n)
    {
        print("/* handle the fact that this is a memofn */");
        print("String nstr=n.toString();");
        //	print("if("+memoname(n)+"==nstr)return false;");
    }

    Vector<Integer> subscripts;
    /* the vector of subscripts is built up as we traverse the subcript list */
    public void inAParameterisedidLoc(AParameterisedidLoc node)
    {
        subscripts=new Vector<Integer>();
        defaultIn(node);
    }
    public void outASubscriptlist(ASubscriptlist node)
    {
        subscripts.add(Integer.valueOf(((Param)names.get(node.getIdentifier().getText())).index));
    }
    public void outANextSubscriptlist(ANextSubscriptlist node)
    {
        subscripts.add(Integer.valueOf(((Param)names.get(node.getIdentifier().getText())).index));
    }
    public void outAParameterisedidLoc(AParameterisedidLoc node)
    {
        Token id = node.getIdentifier();
        print("/** Matches identifier " + id + " to the tree at this point*/");
        defps(node);
        Object val = names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + id);
            }
        else if(val instanceof RegDetails)
            {
                error(" can not subscript a register name "+node);
            }
        else if(val instanceof Param)
            {
                String typeName = ((Param) val).type;
                int index = ((Param) val).index;
                Object typeDenotation = names.get(typeName);
                if(typeName.equals("label"))
                    {
                        error("can not subsript something of type label "+node);
                    }
                else if(typeDenotation == null)
                    {
                        error("undeclared type " + typeName + " in outAIdLoc " + node);
                    }
                else
                    {
                        //print("/* check the memo of last attempt */");
                        //memotest(node);
                        pattern p = (pattern) typeDenotation;
                        print("boolean free= unbound(" + index + ");");
                        print("int[]locpreb={");
                        for(int i=0; i<subscripts.size(); i++)
                            {
                                print("\t"+subscripts.get(i));
                                if(i<(subscripts.size()-1))print("\t\t,");
                                else print("\t};");
                            }
                        print("prebindings=locpreb;");
                        print("if(free&&" + procname(p.getNode()) + "(n)){");
                        //print("\tNode output =matchedTree;");
                        print("\tbindings[asfinallymatched][" + index + "]=matchedTree;");
                        print("\tbindings[beforematching][" + index + "]=n;");
                        print("// pattern context "+p.context);
                        //if(p.context.equals("transformer")||p.context.equals("transformforward")){
                        print("\tbindings[asoutput][" + index + "]=transformedMatchedTree;");
                        //} else{
                        //print("\tbindings[asoutput][" + index + "]=matchedAssembler;");
                        //}
                        if(outputcontext)
                            error("subscripted variables only allowed in input context "+node);
                        else
                            print("\treturn true;");
                        print("}");
                        print("if(!free){");
                        print(" // we now check if the parameter is identical to the tree or coercible to it ");
                        print(" if(treeIdenticalToOrAssignableToParam(" + index + ",n)){");
                        if(p.context.equals("transformer")||p.context.equals("transformforward"))
                            {
                                print("\ttransformedMatchedTree=(Node)bindings[asoutput][" + index + "];");
                                print(" Node tree = (Node)bindings[beforematching][" + index + "] ;");
                                print(" matchedTree=tree;");
                            }
                        else
                            {
                                print(" Node tree = (Node)bindings[0][" + index + "] ;");
                                print(" matchedTree=tree;");
                                print(" String asm =(String)bindings[asoutput][" + index + "] ;");
                                print(" matchedAssembler=asm ;");
                            }
                        if(outputcontext)
                            error("A parameter in output context must be qualified with .in or .out "+node);
                        else
                            print(" return true;");
                        print(" } ");
                        //print("/* before we return false remember that we failed this time */");
                        //memorecord(node);
                        if(outputcontext)
                            error("A parameter in output context must be qualified with .in or .out "+node);
                        else
                            print(" return false;");
                        print("}");
                        if(outputcontext)
                            error("A parameter in output context must be qualified with .in or .out "+node);
                        else
                            print("return n.equals(names.get(\"" + id.getText() + "\"));");
                    }
            }
        //print("return bind (n,\""+id.getText()+"\");");
        defpe();
    }

    public void outAIdLoc(AIdLoc node)
    {
        //defaultOut(node);
        String s= node.toString().trim();
        String memo = memoname(node);
        Token id = node.getIdentifier();
        print("/** Matches identifier " + id + " to the tree at this point*/");
        defps(node);
        Object val = names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + id);
            }
        else if(val instanceof RegDetails)
            {
                if(outputcontext)
                    {
                        print("return reg" + ((RegDetails) val).internalname+";");
                    }
                else print("return n.equals(reg" + ((RegDetails) val).internalname + ");");
            }
        else if(val instanceof Param)
            {
                if(outputcontext)error("in output context identifier "+s+" must be qualified as "+s+".in or "+s+".out ");
                String typeName = ((Param) val).type;
                int index = ((Param) val).index;
                Object typeDenotation = names.get(typeName);
                if(typeName.equals("label"))
                    {
                        print("if( n instanceof Label){");
                        print("bindings[asfinallymatched][" + index + "]=n ;");
                        print("bindings[asoutput][" + index + "]=n.toString() ;");
                        print("return true;}");
                        print("else return false;");
                    }
                else if(typeDenotation == null)
                    {
                        error("undeclared type " + typeName + " in outAIdLoc " + node);
                    }
                else
                    {
                        pattern p = (pattern) typeDenotation;
                        print("boolean free= unbound(" + index + ");");
                        print("if(free&&" + procname(p.getNode()) + "(n)){");
                        print("\tbindings[asfinallymatched][" + index + "]=matchedTree;");
                        print("\tbindings[beforematching][" + index + "]=n;");
                        if(outputcontext)
                            {
                                print("\tbindings[asoutput][" + index + "]=transformedMatchedTree;");
                            }
                        else
                            {
                                //print("\tString sout=matchedAssembler;");
                                print("\tbindings[asoutput][" + index + "]=matchedAssembler;");
                            }
                        if(outputcontext)
                            error("You should only use parameters in output context is they are qualified as .in or .out;"+p);
                        else
                            print("\treturn true;");
                        print("}");
                        print("if(!free){");
                        print(" // we now check if the parameter is identical to the tree or coercible to it ");
                        print(" if(treeIdenticalToOrAssignableToParam(" + index + ",n)){");
                        print(" String asm =(String)bindings[asoutput][" + index + "] ;");
                        print(" Node tree = (Node)bindings[0 ][" + index + "] ;");
                        print(" matchedTree=tree;");
                        print(" matchedAssembler=asm ;");
                        print(" return true;");
                        print(" } ");
                        //print("/* before we return false remember that we failed this time */");
                        //memorecord(node);
                        print(" return false;");
                        print("}");
                        print("return n.equals(names.get(\"" + id.getText() + "\"));");
                    }
            }
        //print("return bind (n,\""+id.getText()+"\");");
        defpe();
    }


    void memorecord(Node n)
    {
        print(memoname(n) + "=nstr;");
    }


    public void outAExtendMonadic(AExtendMonadic node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return null;// this should never bee actually used");
                defpe();
            }
        else outAExtendMonadicb(node);
    }
    public void outAForMeaning(AForMeaning node)
    {
        defps(node);
        if(outputcontext)
            {
                print("For f=(For)n;");
                print("f= new For ( "+procname(node.getRefval())+"(f.inductionVariable),"+
                      procname(node.getStart())+"(f.start),"+
                      procname(node.getStop())+"(f.finish),"+
                      procname(node.getIncrement())+"(f.step),"+
                      procname(node.getMeaning())+"(f.action));");
                print("return f;");
            }
        else
            {
                print("if (!(n instanceof For)) return false;");
                if(node.getRefval() != null)
                    {
                        String refhandler = procname(node.getRefval());
                        print("if(!" + refhandler + "(((For)n).inductionVariable))return false;");
                    }
                if(node.getStart() != null)
                    {
                        String handler = procname(node.getStart());
                        print("if(!" + handler + "(((For)n).start))return false;");
                    }
                if(node.getStop() != null)
                    {
                        String handler = procname(node.getStop());
                        print("if(!" + handler + "(((For)n).finish))return false;");
                    }
                if(node.getIncrement() != null)
                    {
                        String handler = procname(node.getIncrement());
                        print("if(!" + handler + "(((For)n).step))return false;");
                    }
                if(node.getMeaning() != null)
                    {
                        String meaning = procname(node.getMeaning());
                        print("\tif (verbose ) dlog(\"action=\"+(( For ) n ) . action+ (( For ) n ) . action.getClass());");
                        print("return " + meaning + " ((( For ) n ) . action ) ;");
                    }
            }
        defpe();
    }


    /*
     * public void inARegisterLoc(ARegisterLoc node)
     * {
     * defaultIn(node);
     * }
     * public void outARegisterLoc(ARegisterLoc node)
     * {
     * defaultOut(node);
     * }
     */
    public void outAOptionaltype(AOptionaltype node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return "+procname(node.getType())+"(n);");
                defpe();
            }
        else
            defaultOut(node);
    }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAMemoryLoc(AMemoryLoc node)
    {
        //defaultOut(node);
        defps(node);
        Node val = node.getValue();
        print("n=decast(n);");
        if(outputcontext)
            {
                String t=node.getOptionaltype().toString();
                if(t.equals(""))error("in an output context a memory reference must have its type specified\n"+node);
                print("return new Memref("+procname(val) +"(( n) ),"+procname(node.getOptionaltype())+"(n).toString());");
            }
        else
            {
                print("if(!(n instanceof Memref))return false;");
                print("return " +
                      procname(val) +
                      "(((Memref)n).index);"
                     );
            }
        defpe();
    }





    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAReallitNumber(AReallitNumber node)
    {
        defaultIn(node);
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAIntegerNumber(AIntegerNumber node)
    {
        defaultIn(node);
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAReallit(AReallit node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAReallit(AReallit node)
    {
        defaultOut(node);
    }


    void defds(Node n)
    {
        String nom = procname(n);
        out.println("\tpublic boolean " + nom +
                    "(Op o)throws Exception{");
    }


    void handledyad(Node node, String s)
    {
        defps(node);
        if(outputcontext)print("return new Format(Node . " + s+");");
        else
            print("return n.toString().trim().toLowerCase().equals(Node . " + s + ".toLowerCase());");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASatmultDyadic(ASatmultDyadic node)
    {
        handledyad(node, "satmult");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASatminusDyadic(ASatminusDyadic node)
    {
        handledyad(node, "satminus");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAMaxDyadic(AMaxDyadic node)
    {
        handledyad(node, ilcg.tree.Node.max);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAMinDyadic(AMinDyadic node)
    {
        handledyad(node, ilcg.tree.Node.min);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outALeDyadic(ALeDyadic node)
    {
        handledyad(node, "le");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAGeDyadic(AGeDyadic node)
    {
        handledyad(node, "ge");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inALtDyadic(ALtDyadic node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outANeDyadic(ANeDyadic node)
    {
        handledyad(node, "neq");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outALtDyadic(ALtDyadic node)
    {
        handledyad(node, "lt");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAReplicateDyadic(AReplicateDyadic node)
    {
        handledyad(node, "rep");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAGtDyadic(AGtDyadic node)
    {
        handledyad(node, "gt");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outASatplusDyadic(ASatplusDyadic node)
    {
        handledyad(node, "satplus");
    }

    public void outAContainsDyadic(AContainsDyadic node)
    {
        handledyad(node,"contains");
    }
    public void outABssDyadic(ABssDyadic node)
    {
        handledyad(node,"bss");
    }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAEqDyadic(AEqDyadic node)
    {
        handledyad(node, "eq");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAPushDyadic(APushDyadic node)
    {
        handledyad(node, "push");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAPlusDyadic(APlusDyadic node)
    {
        handledyad(node, "plus");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outACallDyadic(ACallDyadic node)
    {
        handledyad(node, "apply");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAMinusDyadic(AMinusDyadic node)
    {
        handledyad(node, "minus");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAOrDyadic(AOrDyadic node)
    {
        handledyad(node, "or");
    }



    public void outAAndDyadic(AAndDyadic node)
    {
        handledyad(node, "and");
    }
    public void outAArrayType(AArrayType node)
    {
        if(!outputcontext) defaultOut(node);
        else
            {
                defps(node);
                print("return new Format( \""+node.toString().trim()+"\" );");
                defpe();
            }
    }
    public void outAXorDyadic(AXorDyadic node)
    {
        handledyad(node, "xor");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAShlDyadic(AShlDyadic node)
    {
        handledyad(node, "shl");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAShrDyadic(AShrDyadic node)
    {
        handledyad(node, "shr");
    }

    public void outAIdentifierDyadic(AIdentifierDyadic node)
    {
        defps(node);
        Token id = node.getIdentifier();
        String key = id.getText();
        Object value = names.get(key);
        if(value instanceof Param)
            {
                {
                    String type = ((Param) value).type;
                    int index = ((Param) value).index;
                    Object whatIsThis = names.get(type);
                    if(whatIsThis instanceof pattern)
                        {
                            String recogniser = procname(((pattern) whatIsThis).getNode());
                            print("if(" + recogniser + "( n)){");
                            if(outputcontext)error("parameter \""+ id+"\" must be suffixed with .in or .out in output context ");
                            if(!patternContext.equals("transformer"))
                                print("bindings[asoutput][" + index + "]=matchedAssembler ;");
                            else
                                print("bindings[asoutput][" + index + "]=transformedMatchedTree ;");
                            // print("\tbindings[beforematching][" + index + "]=n;");
                            print("bindings[asfinallymatched][" + index + "]=matchedTree;");
                            print("bindings[beforematching]["+index+"]=n;");
                            print("return true;}else return false;");
                        }
                    else
                        {
                            System.err.println(key + " must be a pattern" +
                                               " when used as dyadic operator ");
                        }
                }
            }
        else
            {
                print(key + " had no value ");
            }
        defpe();
    }

    public void outAIdentifierMonadic(AIdentifierMonadic node)
    {
        defps(node);
        Token id = node.getIdentifier();
        String key = id.getText();
        Object value = names.get(key);
        if(value instanceof Param)
            {
                {
                    String type = ((Param) value).type;
                    int index = ((Param) value).index;
                    Object whatIsThis = names.get(type);
                    if(whatIsThis instanceof pattern)
                        {
                            String recogniser = procname(((pattern) whatIsThis).getNode());
                            print("if(" + recogniser + "( n)){");
                            if(outputcontext)error("parameter \""+ id+"\" must be suffixed with .in or .out in output context ");
                            if(!patternContext.equals("transformer"))
                                print("bindings[asoutput][" + index + "]=matchedAssembler ;");
                            else
                                print("bindings[asoutput][" + index + "]=transformedMatchedTree ;");
                            // print("\tbindings[beforematching][" + index + "]=n;");
                            print("bindings[asfinallymatched][" + index + "]=matchedTree;");
                            print("bindings[beforematching]["+index+"]=n;");
                            print("return true;}else return false;");
                        }
                    else
                        {
                            System.err.println(key + " must be a pattern" +
                                               " when used an operator ");
                        }
                }
            }
        else
            {
                print(key + " had no value ");
            }
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outATimesDyadic(ATimesDyadic node)
    {
        handledyad(node, "times");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outADivideDyadic(ADivideDyadic node)
    {
        handledyad(node, "divide");
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outARemainderDyadic(ARemainderDyadic node)
    {
        handledyad(node, "remainder");
    }
    public void outARangeDyadic(ARangeDyadic node)
    {
        handledyad(node, "range");
    }

    /**
     * Converts a TString into a string stripping of leading and
     *trailing quotes
     *
     * @param s Description of the Parameter
     * @return Description of the Return Value
     */
    String printable(TString s)
    {
        String raw = s.getText();
        return raw.substring(1, raw.length() - 1);
    }

    public void caseAAliasdecl(AAliasdecl node)
    {
        inAAliasdecl(node);
        if(VERBOSE)
            {
                if(node.getAlias() != null)
                    {
                        node.getAlias().apply(this);
                    }
                if(node.getReg() != null)
                    {
                        node.getReg().apply(this);
                    }
                if(node.getAggregate() != null)
                    {
                        node.getAggregate().apply(this);
                    }
                if(node.getType() != null)
                    {
                        node.getType().apply(this);
                    }
                if(node.getChild() != null)
                    {
                        node.getChild().apply(this);
                    }
                if(node.getEquals() != null)
                    {
                        node.getEquals().apply(this);
                    }
                if(node.getParent() != null)
                    {
                        node.getParent().apply(this);
                    }
                if(node.getBra() != null)
                    {
                        node.getBra().apply(this);
                    }
                if(node.getLowbit() != null)
                    {
                        node.getLowbit().apply(this);
                    }
                if(node.getColon() != null)
                    {
                        node.getColon().apply(this);
                    }
                if(node.getHighbit() != null)
                    {
                        node.getHighbit().apply(this);
                    }
                if(node.getKet() != null)
                    {
                        node.getKet().apply(this);
                    }
                if(node.getAssembles() != null)
                    {
                        node.getAssembles().apply(this);
                    }
                if(node.getSbra() != null)
                    {
                        node.getSbra().apply(this);
                    }
                if(node.getString() != null)
                    {
                        node.getString().apply(this);
                    }
                if(node.getSket() != null)
                    {
                        node.getSket().apply(this);
                    }
            }
        outAAliasdecl(node);
    }

    public void caseARegisterdecl(ARegisterdecl node)
    {
        inARegisterdecl(node);
        if(VERBOSE)
            {
                if(node.getReservation() != null)
                    {
                        node.getReservation().apply(this);
                    }
                if(node.getReg() != null)
                    {
                        node.getReg().apply(this);
                    }
                if(node.getAggregate() != null)
                    {
                        node.getAggregate().apply(this);
                    }
                if(node.getType() != null)
                    {
                        node.getType().apply(this);
                    }
                if(node.getIdentifier() != null)
                    {
                        node.getIdentifier().apply(this);
                    }
                if(node.getAssembles() != null)
                    {
                        node.getAssembles().apply(this);
                    }
                if(node.getSbra() != null)
                    {
                        node.getSbra().apply(this);
                    }
                if(node.getString() != null)
                    {
                        node.getString().apply(this);
                    }
                if(node.getSket() != null)
                    {
                        node.getSket().apply(this);
                    }
            }
        outARegisterdecl(node);
    }

    /**
     * plant a declaratrion of the in the tree walker
     *
     * @param node Description of the Parameter
     */
    public void outARegisterdecl(ARegisterdecl node)
    {
        String id = notrailingspaces(node.getIdentifier().toString());
        String printsAs = printable(node.getString());
        Node t = node.getType();
        Node a = node.getAggregate();
        String aggs = a.toString();
        RegDetails det = new RegDetails("ref " + notrailingspaces(t.toString()),
                                        printsAs,
                                        id,
                                        null);
        names.put(id, det);
        boolean isStack = aggs.startsWith("stack");
        boolean isVector = aggs.startsWith("vector");
        boolean res = node.getReservation().toString().startsWith("reserved");
        if(isStack)
            {
                print("RegisterStack reg" + id + "= new RegisterStack(\"" + printsAs +
                      "\",\"" + det.format + "\"," + aggs.substring(5) + ",registerSet,registerIndex);");
            }
        else if(isVector)
            {
                print("RegisterVector reg" + id + "= new RegisterVector(\"" + printsAs +
                      "\",\"" + det.format + "\"," + aggs.substring(6) + ");");
            }
        else
            {
                print("Register reg" + id + "=new Register(\"" + printsAs
                      + "\",\"" + det.format + "\", " + res + ",registerSet,registerIndex," + (parentnum++) + ");");
            }
    }


    /*
     * public void outAFpAliasdecl(AAliasdecl node)
     * {
     * String child="FP";
     * String parent=notrailingspaces(node.getParent().toString());
     * String lows,highs;
     * lows=node.getLowbit().toString();
     * Integer low=Integer.valueOf(notrailingspaces(lows));
     * Integer high=Integer.valueOf(notrailingspaces(node.getHighbit().toString()));
     * Object rd=names.get(child);
     * if(rd==null){
     * System.err.println("register "+child+" not declared at point "+
     * node);
     * return;
     * }
     * if(names.get(parent)==null)
     * System.err.println("register "+parent+" not declared for use as alias in"+node);
     * else{
     * RegAlias ra=new RegAlias((RegDetails)names.get(parent),low.intValue(),high.intValue());
     * ((RegDetails)rd).alias=ra;
     * print("Register regFP=new Register(\""+printsAs+"\",\""+((RegDetails)rd).format+"\",registerSet,registerIndex);");
     * }
     * }
     */
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAliasdecl(AAliasdecl node)
    {
        String child = notrailingspaces(node.getChild().toString());
        String parent = notrailingspaces(node.getParent().toString());
        String lows;
        String highs;
        lows = node.getLowbit().toString();
        Integer low = Integer.valueOf(notrailingspaces(lows));
        Integer high = Integer.valueOf(notrailingspaces(node.getHighbit().toString()));
        Object rd = names.get(child);
        if(names.get(parent) == null)
            {
                System.err.println("register " + parent + " not declared for use as alias in" + node);
            }
        else if(child.equals("FP"))
            {
                FPAlias = "reg" + parent;
            }
        else if(child.equals("SP"))
            {
                SPAlias = "reg" + parent;
            }
        else
            {
                if(rd != null)
                    {
                        System.err.println("register " + child + " declared at point " + node);
                        return;
                    }
                String id = child;
                String printsAs = printable(node.getString());
                RegDetails det = new RegDetails("ref " + notrailingspaces(node.getType().toString()),
                                                printsAs,
                                                id,
                                                null);
                names.put(id, det);
                RegAlias ra = new RegAlias((RegDetails) names.get(parent), low.intValue(), high.intValue());
                det.alias = ra;
                print("Register reg" + child + "=new Register(\"" + printsAs + "\",\"" + ((RegDetails) det).format + "\", reg" + parent + "," + lows + ",registerSet,registerIndex);");
            }
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAOpdecl(AOpdecl node)
    {
        String id = notrailingspaces(node.getIdentifier().toString());
        String oper = notrailingspaces(node.getOperator().toString());
        String printsAs = printable(node.getString());
        names.put(id, new Operation(id, oper, printsAs));
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAPlusOperator(APlusOperator node)
    {
// defaultOut(node);
    }



    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAMinusOperator(AMinusOperator node)
    {
        // defaultOut(node);
    }



    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outATimesOperator(ATimesOperator node)
    {
// defaultOut(node);
    }



    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outADivideOperator(ADivideOperator node)
    {
// defaultOut(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAssign(AAssign node)
    {
        defps(node);
        if(!outputcontext)
            {
                print("if(!(n instanceof Assign))return false;");
                if(node.getStore().toString().trim().equals(":="))print("if((n instanceof AssignStreaming))return false;");
                print("Assign a=(Assign)n;");
            }
        //	print("if(!"+procname(node.getValue())+"(new Type(a.type)))return false;");
        //	print("	if(!bindtype(a.type,\""+
        //			notrailingspaces(node.getType().toString())+
        //				"\"))return false;");
        if(outputcontext)
            {
                print("return new Assign("+procname(node.getRefval()) + "(n),"+procname(node.getValue()) + "(n));");
            }
        else
            {
                if(ilcg.tree.Walker.leftToRight)
                    {
                        print("enterLhs();");
                        print("boolean lhsok=" + procname(node.getRefval()) + "(a.dest);");
                        print("leaveLhs();");
                        print("if(!lhsok)return false;");
                        //	print("reserve(a.dest);");
                        print("enterRhs();");
                        print("patternrecsp+=assigninc;");
                        print("boolean rhsok= " + procname(node.getValue()) + "(a.src);");
                        print("patternrecsp-=assigninc;");
                        print("leaveRhs();");
                        print("if(!rhsok)return false;");
                    }
                else
                    {
                        print("enterRhs();");
                        print("boolean rhsok= " + procname(node.getValue()) + "(a.src);");
                        print("leaveRhs();");
                        print("if(!rhsok)return false;");
                        print("enterLhs();");
                        print("patternrecsp+=1000;");
                        print("boolean lhsok=" + procname(node.getRefval()) + "(a.dest);");
                        print("patternrecsp-=1000;");
                        print("leaveLhs();");
                        print("if(!lhsok)return false;");
                    }
                print("return lhsok&&rhsok;");
            }
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAValueMeaning(AValueMeaning node)
    {
        defps(node);
        String dest = procname(node.getValue());
        print("return " + dest + "(n);");
        defpe();
        setIn(node, dest);// set to bypass for speed
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAssignMeaning(AAssignMeaning node)
    {
        defps(node);
        String dest = procname(node.getAssign());
        print("return " + dest + "(n);");
        defpe();
        setIn(node, dest);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outALocMeaning(ALocMeaning node)
    {
        defps(node);
        print("if(!(n instanceof Location))return false;");
        print("return " + procname(node.getValue()) + "(((Location)n).getSubtree().eval());");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAIfMeaning(AIfMeaning node)
    {
        defps(node);
        print("if(!(n instanceof If))return false;");
        print("if(!(((If)n).a2==null)) return false;");
        print("return " + procname(node.getValue()) + "(((If)n).cond)&&" +
              procname(node.getMeaning()) + "(((If)n).a1);");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAGotoMeaning(AGotoMeaning node)
    {
        defps(node);
        print("if(!(n instanceof Goto))return false;");
        print("return " + procname(node.getValue()) + "(((Goto)n).l);");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAFailMeaning(AFailMeaning node)
    {
        defps(node);
        print("if(!(n instanceof Fail))return false;");
        print("return " + procname(node.getValue()) + "(((Fail)n).l);");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAPatterndecl(APatterndecl node)
    {
        setIn(node, "p" + localname(node) + procNum + node.getIdentifier().getText());
        procNum++;
        names.enterScope();
    }
    public void inATransformerPatterndecl(ATransformerPatterndecl node)
    {
        setIn(node, "t"+/* localname(node) + procNum +*/
              node.getIdentifier().getText());
        patternContext="transformer";
        names.enterScope();
    }

    public void outATransformerPatterndecl(ATransformerPatterndecl node)
    {
        String name = node.getIdentifier().getText();
        checkforward(name,false,"transformforward");
        Dictionary params = names.getCurrentScope();
        Node meaning = node.getMeaning();
        Node output = node.getOutput();
        pattern p = new pattern(node, name, patternContext, params,
                                procname(meaning),
                                procname(output),
                                meaning.toString());
        names.leaveScope();
        names.put(name, p);
        defps(node);
        print("boolean res;");
        expandPattern(p,procname(node.getPrecond())+"(n)");
        print("return res;");
        defpe();
        patternContext="unknown";
    }
    Object transformers[]= {};
    public void inATransformStatement(ATransformStatement node)
    {
        transformers = node.getNames().toArray();
        transformer = node.getIdentifier().toString();
    }

    public void outATransformStatement(ATransformStatement node)
    {
        print("Node transformer(Node n)throws Exception{");
        print(" if(t"+transformer+"(n))return transformedMatchedTree;");
        for(Object i :transformers)
            {
                ANames n = (ANames)i;
                print(" if(t"+n.getIdentifier().toString()+"(n))return transformedMatchedTree;");
            }
        print("return n;}");
    }
    public void inAOutput(AOutput node)
    {
        outputcontext=true;
        defaultIn(node);
    }
    public void outAOutput(AOutput node)
    {
        defps(node);
        String dest = procname(node.getMeaning());
        print("return " + dest + "(n);");
        defpe();
        setIn(node, dest);// set to bypass for speed
        outputcontext=false;
    }
    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAPatterndecl(APatterndecl node)
    {
        String name = node.getIdentifier().getText();
        checkforward(name,false,"forward");
        Dictionary params = names.getCurrentScope();
        Node meaning = node.getMeaning();
        Node assemblesto = node.getAssemblesto();
        pattern p = new pattern(node, name, patternContext, params, procname(meaning), procname(assemblesto),
                                meaning.toString());
        names.leaveScope();
        names.put(name, p);
        if(patternContext == "address")
            {
                addressModes.put(name, p);
            }
        if(patternContext == "instruction")
            {
                instructionSet.put(name, p);
            }
        defps(node);
        print("boolean res;");
        expandPattern(p);
        print("return res;");
        defpe();
    }




    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     * @return Description of the Return Value
     */
    public boolean allRegisters(AAlternativesPatterndecl node)
    {
        print("// are the following all registers ? " + node);
        boolean allregs = true;
        AAlternatives pa = (AAlternatives) node.getAlternatives();
        Object temp[] = pa.getAlts().toArray();
        for(int i = 0; i < temp.length; i++)
            {
                Object alti = temp[i];
                Object altt = ((AAlts) alti).getType();
                if(altt instanceof ATypeidType)
                    {
                        ATypeidType att = (ATypeidType) altt;
                        String alt = ((ATypeid) att.getTypeid()).getIdentifier().getText();
                        print("//alternative (" + i + ") " + alt);
                        Object whatIsIt = names.get(alt);
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
    public void inASequenceMeaning(ASequenceMeaning node)
    {
        defaultIn(node);
    }

    public void outASequenceMeaning(ASequenceMeaning node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return new Statement("+procname(node.getHead())+"(n),new Statement("+procname(node.getTail())+"(n)));");
                defpe();
            }
        else
            defaultOut(node);
    }
    public void inAInoroutLoc(AInoroutLoc node)
    {
        defaultIn(node);
    }
    public void outAInoroutLoc(AInoroutLoc node)
    {
        defps(node);
        Token id = node.getIdentifier();
        if(!outputcontext)error("in or out suffix only allowed in output context, token ="+id+" line "+id.getLine());
        Object val = names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + id+" line "+id.getLine());
            }
        if(val instanceof Param)
            {
                int index = ((Param) val).index;
                Token ino= node.getInout();
                print("// suffix =("+ino.getText()+")");
                print("if(unbound("+index+"))if(verbose)dlog(\" parameter "+index+" unbound in output context \" );");
                if(ino.getText().equals("in"))
                    {
                        print("if(bindings[beforematching]["+index+"]==null){");
                        print("\tException ez=new Exception(\"null return from parameter "+node+" \" );");
                        print("\tez.printStackTrace();");
                        print("\tthrow ez;}");
                        print("return (Node)bindings[beforematching]["+index+"];");
                    }
                else
                    {
                        print("if ( bindings[asfinallymatched]["+index+"] instanceof Node)");
                        print("return (Node)bindings[asoutput]["+index+"];");
                        print("return new Format(bindings[asoutput]["+index+"].toString());");
                    }
            }
        else error(id.toString()+" not a parameter");
        defpe();
    }
    public void outAInoroutDyadic(AInoroutDyadic node)
    {
        if(!outputcontext)error("in or out suffix only allowed in output context");
        defps(node);
        Token id = node.getIdentifier();
        Object val = names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable " + id);
            }
        if(val instanceof Param)
            {
                int index = ((Param) val).index;
                Token ino= node.getInout();
                print("// suffix =("+ino.getText()+")");
                print("if(unbound("+index+"))if(verbose)dlog(\" parameter "+index+" unbound in output context \" );");
                if(ino.getText().equals("in"))
                    {
                        print("if(bindings[beforematching]["+index+"]==null){");
                        print("\tException ez=new Exception(\"null return from parameter "+node+" \" );");
                        print("\tez.printStackTrace();");
                        print("\tthrow ez;}");
                        print("return (Node)bindings[beforematching]["+index+"];");
                    }
                else
                    {
                        print("if ( bindings[asoutput]["+index+"] instanceof Node)");
                        print("return (Node)bindings[asoutput]["+index+"];");
                        print("return new Format(bindings[asoutput]["+index+"].toString());");
                    }
            }
        else error(id.toString()+" not a parameter");
        defpe();
    }
    public void inAForwardPatterndecl(AForwardPatterndecl node)
    {
        setIn(node, "f"+ node.getIdentifier().getText());
        patternContext="forward";
    }
    public void inATransformforwardPatterndecl(ATransformforwardPatterndecl node)
    {
        setIn(node, "f"+ node.getIdentifier().getText());
        patternContext="transformforward";
    }
    void checkforward(String name,boolean allowed,String forward)
    {
        checkforward(name,allowed,forward,forward);
    }
    void checkforward(String name,boolean allowed,String forward,String tforward)
    {
        Object f = names.get(name);
        if(f !=null)
            {
                if(f instanceof pattern)
                    {
                        pattern p = (pattern) f;
                        boolean wasforward = p.context.equals(forward)||p.context.equals(tforward);
                        if(!allowed && wasforward) error("Forward declarations only allowed for alternatives patterns "+name);
                        if(!wasforward)error("Pattern identifier "+name+" is used twice ");
                    }
            }
    }

    public void outAForwardPatterndecl(AForwardPatterndecl node)
    {
        String patternid = notrailingspaces(node.getIdentifier().toString());
        checkforward(patternid,false,"forward");
//checkforward(patternid,false,"transformforward");
        names.put(patternid, new pattern(node, patternid, patternContext,
                                         new Hashtable(), procname(node), "defprintproc", "alternatives"));
        defps(node);
        print("return a"+patternid+"(n);");
        defpe();
    }
    public void outATransformforwardPatterndecl(ATransformforwardPatterndecl node)
    {
        String patternid = notrailingspaces(node.getIdentifier().toString());
        checkforward(patternid,false,"transformforward");//checkforward(patternid,false,"forward");
        names.put(patternid, new pattern(node, patternid, patternContext,
                                         new Hashtable(), procname(node), "defprintproc", "alternatives"));
        defps(node);
        print("return a"+patternid+"(n);");
        defpe();
    }
    public void inAAlternativesPatterndecl(AAlternativesPatterndecl node)
    {
        setIn(node, "a"+ node.getIdentifier().getText());
        alternatives = new Vector(0);
    }

    /**
     * Collects all the alternatives into a vector of alternatives
     *indexed under the pattern name
     *If all the alternatives are patterns constructs a switch statement
     *and remembers which switch alternative succeded last time.
     *If the input string it identical to a past success go straight to it.
     *
     * @param node Description of the Parameter
     */
    public void outAAlternativesPatterndecl(AAlternativesPatterndecl node)
    {
        //defaultOut(node);
        String patternid = notrailingspaces(node.getIdentifier().toString());
        checkforward(patternid,true,"forward","transformforward");
        if(names.get(patternid)==null)
            names.put(patternid, new pattern(node, patternid, patternContext,
                                             new Hashtable(), procname(node), "defprintproc", "alternatives"));
        defps(node);
        //memotest(node);
        print("	int mark=buf.mark();boolean res=false; int[]oldprebindings=prebindings;");
        boolean allregs = false;
        boolean allpatterns = true;
        try
            {
                String alt = (String) alternatives.elementAt(0);
                Object whatIsIt = names.get(alt);
                for(int i = 0; i < alternatives.size(); i++)
                    {
                        alt = (String) alternatives.elementAt(i);
                        whatIsIt = names.get(alt);
                        if(!(whatIsIt instanceof pattern))
                            {
                                allpatterns = false;
                            }
                    }
                /*
                 * place a switch statement
                 */
                if(allpatterns)
                    {
                        String quote = "\"";
                        print("int switchvar=testmemo(" + memoname(node) + ",n);");
                        print("int failvar=0; ");
                        print("String exactsig =key(n)+ ( 16 * currentSpills.getLimit() + optimisationLevel );");
                        print("if(switchvar==0){");
                        print("\tObject ff=fails"+memoname(node)+".get(exactsig);");
                        print("\tif(ff!=null)failvar=1;}");
                        print("if(verbose)dlog("+quote+" failvar= "+quote+" +failvar+exactsig +"+ quote+" switchvar "+quote+
                              "+ switchvar );");
                        print("if (failvar==0||ignorepastfailures)switch(switchvar){");
                    }
                for(int i = 0; i < alternatives.size(); i++)
                    {
                        alt = (String) alternatives.elementAt(i);
                        whatIsIt = names.get(alt);
                        if(whatIsIt instanceof pattern)
                            {
                                if(allpatterns)
                                    {
                                        print("case(" + i + "):");
                                    }
                                print("rollBack(mark);	//erase failed output");
                                print("prebindings=oldprebindings;");
                                print("res="+procname(((pattern)whatIsIt).getNode())+"(n);");
                                //expandPattern((pattern) whatIsIt);
                                if(allpatterns)
                                    {
                                        print("if(res){record(" + memoname(node) +
                                              "," + i + ",n);return true;}");
                                    }
                            }
                        else if(whatIsIt == null)
                            {
                                print(alt + " has nothing associated with it ");
                            }
                        else if(whatIsIt instanceof Operation)
                            {
                                print("if(dyadMatches((Op)n,\"" +
                                      ((Operation) whatIsIt).meaning + "\")){\n\t\tmatchedAssembler=(\"" +
                                      ((Operation) whatIsIt).printsAs + "\");\n\t\tmatchedTree=n;\n\t\treturn true;\n\t}");
                            }
                        else if(whatIsIt instanceof Format)
                            {
                                print("if(verbose)dlog(\" alternatives format \",n);");
                                print("if(typeequalitywith(n,\"" +
                                      //((Format)whatIsIt).returnType()
                                      alt
                                      + "\")){matchedTree=n;matchedAssembler=(n.toString());return true;}");
                            }
                        else if(whatIsIt instanceof RegDetails)
                            {
                                if(!allregs)
                                    {
                                        allregs = true;
                                        print("Register [] regs={reg" + alt);
                                    }
                                else
                                    {
                                        print(",reg" + alt);
                                    }
                            }
                        else
                            {
                                print(whatIsIt.toString());
                            }
                        allregs = allregs && (whatIsIt instanceof RegDetails);
                    }
                if(allregs)
                    {
                        print("};// end regs");
                        print("return tryBindingRegisterTo(regs,n);");
                    }
                else
                    {
                        //	memorecord(node);
                        if(allpatterns)
                            {
                                print("if(!res&&failvar==0){");
                                print("if (verbose ) dlog( \" record failure "+node+"\" + exactsig);");
                                print("fails" + memoname(node) + ".put(exactsig,exactsig);return res;}");
                                print("}// end switch");
                            }
                        print("return res;");
                    }
            }
        catch(Exception e)
            {
                System.out.println("in outAAlternativesPatterndecloutAAlternativesPatterndecl " + e);
            }
        defpe();
        print("Hashtable " + memoname(node) + "=new BoundedHinttable(50);");
        print("Hashtable fails" + memoname(node) + "=new BoundedHinttable(20);");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAParamlist(AParamlist node)
    {
        // defaultIn(node);
        paramindex = 0;
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAParamlist(AParamlist node)
    {
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAParam(AParam node)
    {
    }



    public void outAParam(AParam node)
    {
        String type = notrailingspaces(node.getTypeid().toString());
        String id = notrailingspaces(node.getIdentifier().toString());
        Param p = new Param(id, type, paramindex++);
        Object typeinfo = names.get(type);
        if(typeinfo == null)
            {
                error("type " + type + " undeclared");
            }
        names.put(id, p);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inATypeparamParam(ATypeparamParam node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outATypeparamParam(ATypeparamParam node)
    {
        String id = notrailingspaces(node.getIdentifier().toString());
        names.put(id, new Param(id, "type", paramindex++));
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outALabelParam(ALabelParam node)
    {
        String id = notrailingspaces(node.getIdentifier().toString());
        names.put(id, new Param(id, "label", paramindex++));
    }

    public void outAOptionalsign(AOptionalsign node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return null;");
                defpe();
            }
        else
            defaultOut(node);
    }





    public void outAPlusOptionalsign(APlusOptionalsign node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return null;");
                defpe();
            }
        else
            defaultOut(node);
    }



    public void outAMinusOptionalsign(AMinusOptionalsign node)
    {
        if(outputcontext)
            {
                defps(node);
                print("return new Int(-1);");
                defpe();
            }
        else
            defaultOut(node);
    }


    /**
     * checks that the identifier is declared
     *
     * @param node Description of the Parameter
     */
    public void inATypeid(ATypeid node)
    {
        defaultIn(node);
        String id = notrailingspaces(node.toString());
        Object result = names.get(id);
        if(result == null)
            {
                Token t = node.getIdentifier();
                System.err.println(id + " undeclared on line " +
                                   t.getLine() + "," + t.getPos());
            }
    }


    /**
     * generates a procedure which if called checks that
     *the current tree matches the type currently asssociated
     *with the identifier
     *
     * @param node Description of the Parameter
     */
    public void outATypeid(ATypeid node)
    {
        //defaultOut(node);
        Token t = node.getIdentifier();
        print("/** checks that the current tree matches the type ");
        print("currently associated with " + t + "*/");
        defps(node);
        print("if(verbose)dlog(\" ATypeid \",n);");
        print("if( typecompatiblewith(n,\"" + t.getText() + "\")) { return true;}else return false;");
        defpe();
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAParamtail(AParamtail node)
    {
        defaultIn(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAParamtail(AParamtail node)
    {
        // defaultOut(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
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
     * @param node Description of the Parameter
     */
    public void outAAlternatives(AAlternatives node)
    {
        //defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void inAAlts(AAlts node)
    {
        // defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAlts(AAlts node)
    {
        // defaultOut(node);
        alternatives.addElement(notrailingspaces(node.getType().toString()));
    }
    // declares start of an assembler output method

    void defas(Node n)
    {
        out.println("\tString " + procname(n) + "(){");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAssemblesto(AAssemblesto node)
    {
        defas(node);
        Node ap = node.getAssemblypattern();
        print("return " + procname(ap) + "();");
        defpe();
        //defaultOut(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAAssemblypattern(AAssemblypattern node)
    {
        defaultIn(node);
        defas(node);
        print("return \" \"");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAssemblypattern(AAssemblypattern node)
    {
        print(";");
        defpe();
        //defaultOut(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAStringAssemblertoken(AStringAssemblertoken node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAStringAssemblertoken(AStringAssemblertoken node)
    {
        // defaultOut(node);
        print("+\"" + printable(node.getString()) + "\"");
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAIdentifierAssemblertoken(AIdentifierAssemblertoken node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAIdentifierAssemblertoken(AIdentifierAssemblertoken node)
    {
        //defaultOut(node);
        String id = node.getIdentifier().getText();
        Object defn = names.get(id);
        if(defn != null)
            {
                if(defn instanceof Param)
                    {
                        Param p = (Param) defn;
                        if(p.type.equals("type"))
                            {
                                print("+ type2Assembler(bindings[asoutput][" + p.index + "].toString())");
                                return;
                            }
                        print("+ type2Assembler(bindings[asoutput][" + p.index + "].toString())");
                    }
            }
        // print(" defn is "+defn);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAAliasdeclStatement(AAliasdeclStatement node)
    {
        // defaultOut(node);
    }


    /**
     * Stores the association between the ilcg type and the assembler type
     *in a hash table
     *
     * @param node Description of the Parameter
     */
    public void outATyperenameStatement(ATyperenameStatement node)
    {
        String[] pair = {notrailingspaces(node.getPredeclaredtype().toString()), node.getIdentifier().getText()};
        typerenamevec.addElement(pair);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outARegisterdeclStatement(ARegisterdeclStatement node)
    {
        //
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAAddressmodeStatement(AAddressmodeStatement node)
    {
        patternContext = "address";
        //defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAAddressmodeStatement(AAddressmodeStatement node)
    {
        //defaultOut(node);
        patternContext = "general";
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
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
     * @param node Description of the Parameter
     */
    /*
     * public void inAInstructionfunctionStatement(AInstructionfunctionStatement node)
     * {	setIn(node,"p" +procNum+node.getIdentifier().getText());
     * procNum++;
     * names.enterScope();
     * patternContext="instruction";
     * instructionSet=functionFormats;
     * }
     */
    public void outAInstructionformatStatement(AInstructionformatStatement node)
    {
        //defaultOut(node);
        patternContext = "general";
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAReturnval(AReturnval node)
    {
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAOpdeclStatement(AOpdeclStatement node)
    {
        defaultIn(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void outAFlagStatement(AFlagStatement node)
    {
        String id = node.getIdentifier().getText();
        flags.put(id, Integer.valueOf(node.getIntlit().getText()));
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAOpdeclStatement(AOpdeclStatement node)
    {
        // defaultOut(node);
    }


    /**
     * Description of the Method
     *
     * @param node Description of the Parameter
     */
    public void inAPatterndeclStatement(APatterndeclStatement node)
    {
        defaultIn(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAPatterndeclStatement(APatterndeclStatement node)
    {
        // defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */

    public void outAStatementlist(AStatementlist node)
    {
        // defaultOut(node);
    }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAInstructionlist(AInstructionlist node) { }


    /**
     * dummy to prevent uneccessary recognising proc being generated
     *
     * @param node Description of the Parameter
     */
    public void outAStatements(AStatements node)
    {
        // defaultOut(node);
    }

}


