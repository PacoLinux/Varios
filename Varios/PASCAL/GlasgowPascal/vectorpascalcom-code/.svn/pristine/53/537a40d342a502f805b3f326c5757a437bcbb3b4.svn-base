
package ilcg;
import ca.mcgill.sable.util.*;
import ilcg.node.*;
import ilcg.lexer.*;
import ilcg.parser.*;
import java.util.Hashtable;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Vector;
import ilcg.tree.Format;

import ilcg.analysis.*;
import java.io.*;
/** Translates ilcg to a code generator written in java */
public class Ilcg2 extends
    DepthFirstAdapter
{
    public static void main(String[] arguments)
    {
        if(arguments.length != 3)
            {
                System.out.println("usage:");
                System.out.println("java ilcg.Main sourcefile destfile dir ");
                System.exit(1);
            }
        try
            {
                new Parser(
                    new Lexer(
                        new  PushbackReader(
                            new BufferedReader(
                                new FileReader(arguments[0])
                            ), 1024)
                    )
                ).parse().apply(new Ilcg2(arguments[1],arguments[2]));
            }
        catch(Exception e)
            {
                System.out.println(e);
                e.printStackTrace();
            }
    }
    /** constant to index the 2d array of output files, all with pint in
    first dimension are part of the interface */
    int pint =0;

    /** constant to index the 2d array of output files, all with pimp in
    first dimension are part of the implementation */
    int pimp =0;
    int pconst=0;
    int ptype=0;
    int pvar=0;
    int pfn=0;


    PrintWriter out;
    PrintWriter [][]files=new PrintWriter[1][1];
    String[][] filenames=new String[1][1];
    double version=IlcgTreeWalkGeneratorVer.VERSION;
    int maxalt=2000;


    String FPAlias="";
    String SPAlias="";

    /** A hash table that stores the formats of registers as strings, with
        each register indexed on its name*/
    public Hashtable globals=new Hashtable();
    /** a table to store flags */
    public Hashtable flags=new Hashtable();
    /** a vector of pairs mapping internal names for types to
        those used in the assembler */
    public Vector typerenamevec = new Vector();
    /** The symbol table tha handles embeded scopes */
    public SymbolTable names = new SymbolTable(globals);
    Dictionary procedureFormats = new Hashtable();
    Dictionary functionFormats= new Hashtable();
    Dictionary instructionSet=procedureFormats;
    Dictionary expandedInstructions = new Hashtable();
    Dictionary addressModes = new Hashtable();
    /** Used to store the altenatives of a pattern as they are being parsed */
    Vector alternatives;
    /** Patterns are either general, address or instruction */
    String patternContext="unknown";
    /** all generated procedures are numbered to ensure
    that no two procedures have the same name */
    int procNum=1;
    String cn,pk,unitname;




    /** The parameter is the name of the java class  to generate */
    public Ilcg2(String s,String dir)
    throws IOException
    {
        unitname=s;
        s=s;
        out=new PrintWriter(new FileOutputStream(dir +"/"+s+".java"));
        for(int i=pint; i<= pimp; i++)
            {
                for(int j=pconst; j<=pfn; j++)
                    {
                        files[i][j]=out;
                        filenames[i][j]=s+".java";
                        files[i][j].println("/* file "+filenames[i][j]+" part of codegen "+unitname+"*/");
                    }
                if(i<1)
                    {
                        //files [i][pconst].println("CONST");
                        //files [i][ptype].println("TYPE");
                    }
                //files [i][pvar].println("VAR");
            }
        //files [pimp][pvar].println("\ti:integer;");
        // declare pregiven formats
        names.put("int8",new Format("octet"));
        names.put("int16",new Format("halfword"));
        names.put("int64",new Format("doubleword"));
        names.put("int32",new Format("word"));
        names.put("uint8",new Format("octet"));
        names.put("uint16",new Format("halfword"));
        names.put("uint64",new Format("doubleword"));
        names.put("uint32",new Format("word"));
        names.put("ieee32",new Format("word"));
        names.put("ieee64",new Format("doubleword"));
        names.put("octet",new Format("octet"));
        names.put("halfword",new Format("halfword"));
        names.put("doubleword",new Format("doubleword"));
        names.put("word",new Format("word"));
        names.put("GP",new RegDetails("word","GP","GP",null));
        names.put("FP",new RegDetails("word","FP","FP",null));
        names.put("SP",new RegDetails("word","SP","SP",null));
    };
    void error(String s)
    {
        System.err.println(s);
        System.exit(-1);
    }
    public void inStart(Start node)
    {
    }

    public void outStart(Start node)
    {
        out.flush();
    }
    String localname(Object o)
    {
        Class c = o.getClass();
        String n = c.getName();
        if(n.lastIndexOf(".")>=0)n=n.substring(n.lastIndexOf(".")+1);
        return n;
    }

    /** this function reserves a procedure name
        for each node */
    public void defaultIn(Node n)
    {
        setIn(n,"p"+localname(n)+procNum);
        procNum++;
    }
    /** Returns the recogniser or printer procedure name for this node */
    public String procname(Node n)
    {
        Object proc=getIn(n);
        if(n==null)
            {
                System.err.println("no procedure declared for "+n);
                return n.toString();
            }
        return pasname(proc.toString());
    }
    String memoname(Node n)
    {
        return "m"+procname(n);
    }
    // print the start of a tree building func
    void defps(Node n)
    {
        defps(n,"Node");
    }
    void defps(Node n,String type)
    {
        if(done.get(procname(n))!=null)
            {
                System.out.println("repeat call of ps for "+procname(n));
                files[100][100].println("crash");
            }
        String s = n.toString();
        files[pint][pfn].println("\t/*! generates tree for\n\t"+
                                 s.substring(0,s.length()<80?s.length():79)
                                 +"\n\t */");
        String heading=type+" "+
                       procname(n)+
                       "()";
        print(heading);
        print("{\t"+type+" myrec;\n\t");
        done.put(procname(n),"done");
    }
    Hashtable done = new Hashtable();
    // print the end of a tree building func
    void defpeb()
    {
        pim("}");
    }
    void defpe(Node n)
    {
        pim(" return myrec;");
        defpeb();
    }
    /** print a procedure that will always fail when
        used as a recogniser */
    public void defaultOut(Node n)
    {
        int i=0;
        files[pint][pfn].println("/* default procedure "+procname(n)+"  */");
        defps(n);
        files[pimp][pfn].println("myrec=null;");
        defpe(n);
    }
    Vector instructionset = new Vector();
    public void inAProgram(AProgram node)
    {
        alternatives=new Vector();
        print("package ilcg.tree;import java.util.*;");
        print("abstract class "+unitname+" extends Walker2{");
        print(unitname+"(){");
        print(" AProgram();}");
    }
    boolean []starts= {true,  true,true,  true,     false,false};
    String[] keywords= {"if","for","PUSH","goto", ":=","any"};
    /** this generates a pair of recognisers 1  recognising each variant of each
        procedure patterns 1 matching each variant of function patterns */
    public void expandInstructions()
    {
        /*handle procedure instructions */
        int e=instructionset.size();
        print("instructionsetorder=new Pattern["+e+"];");
        try
            {
                for(int i=0; i<e; i++)
                    {
                        Object key = instructionset.elementAt(i);
                        String k =pasname(key.toString());
                        print("  instructionsetorder["+i+"]= pat"+k+";");
                    }
            }
        catch(NoSuchElementException ne)
            {
                System.out.println("in expand instructions "+e);
            }
    }
    public void expandPattern(pattern p)
    {
        Dictionary d=p.parameters;
        Enumeration i = p.parameters.keys();
        String name = pasname(p.name);
        print("Pattern [] makeparams"+name+"(){");
        print("\tPattern []prms=new Pattern["+(1+d.size())+"];");
        i = p.parameters.keys();
        while(i.hasMoreElements())
            {
                Object o = i.nextElement();
                ilcg.Param par=(ilcg.Param) p.parameters.get(o);
                print("\t// "+o+":"+par.type);
                print("\tprms["+par.index+"]= pat"+par.type+";");
            }
        print("  return prms;}");
        print("Pattern pat"+name+"= new Pattern(makeparams"+name+"(),"+p.internalrecognisingProc+"(),"
              +p.printingProc +"());");
    }

    void declarevars(pattern p)
    {
        Enumeration i = p.parameters.elements();
        int j=1;
        while(i.hasMoreElements())
            {
                Object o = i.nextElement();
                Param pa = (Param)o;
                files[pimp][pfn].println("\t\tparams^["+pa.index+
                                         "]:="+paramref(pa.type)+";");
                j++;
            }
        files[pimp][pfn].println("\t\tparamcount:="+j+";");
    }
    String paramref(String t)
    {
        if(t.equals("type")) return "typeparam";
        if(t.equals("label")) return "patlabel";
        return "pat"+pasname(t);
    }
    void forgetvars(pattern p)
    {
        //print("bindings=oldbindings;");
    }
    /** create a new alternatives structure to hold
        the ordered list of instructions. It is
        important to retain the ordering in this list
        in order to give the specifier of an instructionset
        some control of the order in which alternative
        instructions will be attempted when doing a match */
    public void inAInstructionlist(AInstructionlist node)
    {
        alternatives = new Vector();
        defaultIn(node);
    }
    /** declaress the constructor for the code generator class */
    public void outAProgram(AProgram node)
    {
        instructionset=alternatives;
        try
            {
                print("void AProgram(){");;
                expandInstructions();
                if(FPAlias.equals(""))System.err.println("FP alias not declared");
                else out.println("setFP("+FPAlias+");getFP().reservePermanently();");
                if(SPAlias.equals(""))System.err.println("SP alias not declared");
                else out.println("setSP("+SPAlias+");getSP().reservePermanently();");
                for(int i=0; i<typerenamevec.size(); i++)
                    {
                        String [] pair = (String[])typerenamevec.elementAt(i);
                        out.println("typerename(\""+pair[0]+"\",\""+pair[1]+"\");");
                    }
                print("/** initialises the flags declared in the cpu description */");
                Enumeration f=flags.keys();
                while(f . hasMoreElements())
                    {
                        Object k = f.nextElement();
                        Object val = flags.get(k);
                        print("flags.put(\""+k+"\",new java.lang.Integer("+val+"));");
                    }
                print("/* generated by Ilcg2 */");
                int firstalt=alternativescount;
                alternativescount+= typerenamevec.size();
                int lastalt=alternativescount-1;
                print("/* initialises the flags declared in the cpu description */");
                print("}");//end of AProgram
                for(int i=0; i<typerenamevec.size(); i++)
                    {
                        String [] pair = (String[])typerenamevec.elementAt(i);
                        //	out.println("typerename("+pair[0]+",'"+pair[1]+"');");
                        predecpat(pair[0],pair[1],i+firstalt);
                    }
                print("Pattern []ptlist={patuint8,patint8,patuint16,patint16,");
                print("\t\t\tpatint32,patuint32,patint64,patieee32,patieee64};");
                print("Pattern pattype= new Pattern(ptlist);");
                print("}");// end of class
                out.close();
                for(int i=0 ; i<=pimp; i++)
                    for(int j=0; j<=pfn; j++)files[i][j].close();
            }
        catch(Exception e2)
            {
                System.out.println(" in outAProgram trapped "+e2);
            }
    }
    int baseregnum=0;
    boolean containsAnId(ADerefRhs node)
    {
        PRefval rv=node.getRefval();
        if(rv instanceof ARefval)
            {
                ARefval arv=(ARefval)rv;
                PLoc pl=arv.getLoc();
                return(pl instanceof AIdLoc);
            }
        return false;
    }
    AIdLoc getTheId(ADerefRhs node)
    {
        return (AIdLoc)((ARefval)node.getRefval()).getLoc();
    }
    // check if the id labels a set of alternatives
    Node getAlts(AIdLoc node)
    {
        String theId = node.getIdentifier().getText();
        print("// the id is "+theId);
        Object val=names.get(theId);
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable "+theId);
            }
        else if(val instanceof Param)
            {
                //print("// it is a parameter id");
                String typeName = ((Param)val).type;
                //print("// its type is "+typeName);
                Object typeDenotation = names.get(typeName);
                if(typeDenotation == null)
                    {
                        error("undeclared type "+typeName+" in  getAlts "+node);
                    }
                else
                    {
                        pattern p = (pattern)typeDenotation;
                        Node n= p.getNode();
                        return n ;
                    }
            }
        return null;
    }
    boolean containsJustARegId(ADerefRhs node)
    {
        if(containsAnId(node))
            {
                Node n=getAlts(getTheId(node));
                if(n==null)return false;
                if(n instanceof AAlternativesPatterndecl)
                    {
                        if(allRegisters((AAlternativesPatterndecl)n))return true;
                    }
            }
        return false;
    }
    void pim(String s)
    {
        files[pimp][pfn].println("\t\t"+s);
    }
    public void outADerefRhs(ADerefRhs node)
    {
        files[pint][pfn].println("\t/** recongnises deref(refval) */");
        defps(node);
        pim("\t\tmyrec=new Deref("+procname(node.getRefval())+"());");
        defpe(node);
    }

    public void outAReallitNumber(AReallitNumber node)
    {
        pim("/** recognises a real in number context */");
        defps(node);
        pim("myrec^.tag:=reallit;");
        pim("myrec^.reallitarg:="+node+";");
        defpe(node);
    }
    public void outAPredeclaredtypeType(APredeclaredtypeType node)
    {
        pim("/** recognises a predeclared type */");
        defps(node);
        pim("myrec=new Format(\""+node+"\");");
        defpe(node);
    }

    public void outAFormatPredeclaredtype(AFormatPredeclaredtype node)
    {
        pim("/** recognises a predeclared type */");
        defps(node);
        pim("myrec=new Format(\""+node+"\");");
        defpe(node);
    }
    public void outATformatPredeclaredtype(ATformatPredeclaredtype node)
    {
        pim("/** recognises a predeclared type */");
        defps(node);
        pim("myrec=new Format(\""+node+"\");");
        defpe(node);
    }
    public void outAIntegerNumber(AIntegerNumber node)
    {
        pim("/** recognises an integer literal in number context */");
        defps(node);
        pim("myrec=new Int("+node+");");
        defpe(node);
    }


    public void outALocValue(ALocValue node)
    {
        out.println(
            "\t/** recogises loc in value context */");
        defps(node);
        pset("new Location("+procname(node.getLoc())+"());");
        defpe(node);
    }


    public void outANumberRhs(ANumberRhs node)
    {
        setIn(node,procname(node.getNumber()));
//	pim("/** recognizes a number */ ");
//	defps(node);
//	pim("myrec="+procname(node.getNumber())+                "();");
//	defpe(node);
    }




    void defforms(Node n)
    {
        out.println("/** defforms output-> "+procname(n)+"*/");
    }


    void pf(String f,String s)
    {
        pim("myrec^."+f+"="+s+";");
    }

    void pformat(String s)
    {
        pim("myrec=new Format(\""+s+"\");");
    }
    void print(String s)
    {
        files[0][0].println("\t\t"+s);
    };
    void deff(Node n, String s)
    {
        defps(n);
        pformat(s);
        defpe(n);
    }
    public void outAOctetFormat(AOctetFormat node)
    {
        deff(node,"foctet");
    }

    public void outAHalfwordFormat(AHalfwordFormat node)
    {
        deff(node, "fhalfword");
    }


    public void outAWordFormat(AWordFormat node)
    {
        deff(node,"fword");
    }


    public void outADoublewordFormat(ADoublewordFormat node)
    {
        deff(node,"fdword");
    }



    public void outAQuadwordFormat(AQuadwordFormat node)
    {
        deff(node,"fqword");
    }


    public void outAReference(AReference node)
    {
        defps(node,"String");
        print("myrec=\"ref \"+"+procname(node.getType())+"();");
        defpe(node);
    }
    public void outAArrayType(AArrayType node)
    {
        defps(node);
        AArray a= (AArray)node.getArray();
        pset("new Format(\""+
             ""+node.getTypeprim()+
             "vector("+
             notrailingspaces(a.getNumber().toString())+
             "\")");
        defpe(node);
    }
    public void outAReftypeType(AReftypeType node)
    {
        setres(node,node.getReference());
    }
    public void outATypeidType(ATypeidType node)
    {
        setres(node,node.getTypeid());
    }


    public void outATypeidTypeprim(ATypeidTypeprim node)
    {
        setres(node,node.getTypeid());
    }

    public void outASignedTformat(ASignedTformat node)
    {
        setres(node,node.getSigned());
    }



    public void outAUnsignedTformat(AUnsignedTformat node)
    {
        setres(node,node.getUnsigned());
    }


    public void outAIeee32Tformat(AIeee32Tformat node)
    {
        deff(node,"fieee32");
    }


    public void outAIeee63Tformat(AIeee63Tformat node)
    {
        deff(node,"fieee64");
    }

    public void outARhsValue(ARhsValue node)
    {
        setres(node,(node.getRhs()));
    }



    public void outASigned(ASigned node)
    {
        deff(node,"fint32");
    }

    void setres(Node node, Node n)
    {
        if(n!=null)setIn(node,procname(n));// short cut the processs here
        else
            {
                defps(node);
                pim("myrec=null;");
                defpe(node);
            }
    }


    public void outAInt8Signed(AInt8Signed node)
    {
        deff(node,"fint8");
    }



    public void outAInt16Signed(AInt16Signed node)
    {
        deff(node,"fint16");
    }


    public void outAInt64Signed(AInt64Signed node)
    {
        deff(node,"fint64");
    }


    public void outAUnsigned(AUnsigned node)
    {
        deff(node,"fuint32");
    }


    public void outAUint8Unsigned(AUint8Unsigned node)
    {
        deff(node,"fuint8");
    }



    public void outAUint16Unsigned(AUint16Unsigned node)
    {
        deff(node,"fuint16");
    }


    public void outAUint64Unsigned(AUint64Unsigned node)
    {
        deff(node,"fuint64");
    }


    public void inAMonadicValue(AMonadicValue node)
    {
        defaultIn(node);
    }

    public void outAMonadicValue(AMonadicValue node)
    {
        defps(node);
        print("myrec=new Monad("+procname(node.getMonadic())+"(),"
              +procname(node.getValue())+"());");
        defpe(node);
    }
    void defop(Node n,String op)
    {
        defps(n,"String");
        print("myrec= \""+op+"\";");
        defpe(n);
    }
    public void outAAbsMonadic(AAbsMonadic node)
    {
        defop(node,"ABS");
    }
    public void outAExtendMonadic(AExtendMonadic node)
    {
        defop(node,"EXTEND");
    }
    public void outASqrtMonadic(ASqrtMonadic node)
    {
        defop(node,"SQRT");
    }
    public void outATanMonadic(ATanMonadic node)
    {
        defop(node,"TAN");
    }
    public void outACosMonadic(ACosMonadic node)
    {
        defop(node,"COS");
    }

    public void outALnMonadic(ALnMonadic node)
    {
        defop(node,"LN");
    }

    public void outASinMonadic(ASinMonadic node)
    {
        defop(node,"SIN");
    }
    public void outAPopMonadic(APopMonadic node)
    {
        defop(node,"POP");
    }

    public void outANotMonadic(ANotMonadic node)
    {
        defop(node,"NOT");
    }


    public void outAFloatMonadic(AFloatMonadic node)
    {
        defop(node,"FLOAT");
    }

    public void outARoundMonadic(ARoundMonadic node)
    {
        defop(node,"ROUND");
    }
    public void outATruncMonadic(ATruncMonadic node)
    {
        defop(node,"TRUNCATE");
    }
    public void outADyadicValue(ADyadicValue node)
    {
        defps(node);
        String lrec=procname(node.getLeft());
        String rrec=procname(node.getRight());
        String op = procname(node.getDyadic());
        print("myrec=new Dyad("+lrec+"(),"+rrec+"(),\""+notrailingspaces(node.getDyadic().toString())+"\");");
        defpe(node);
    }


    String notrailingspaces(String s)
    {
        int len = s.length();
        if(s.charAt(len-1)==' ')
            return notrailingspaces(s.substring(0,len-1));
        return s;
    }

    public void outACastRhs(ACastRhs node)

    {
        String castType=notrailingspaces(node.getType().toString());
        pim("/** try to cast to type: "+castType+"*/");
        defps(node);
        print("myrec=new Cast(");
        print(" "+procname(node.getType())+"(),");
        print(" "+procname(node.getValue())+"());");
        defpe(node);
    }




    public void outARefval(ARefval node)
    {
        pim("/** recognises a refval which is a location */");
        setres(node,node.getLoc());
    }




    public void outARefcastRefval(ARefcastRefval node)
    {
        String castType=notrailingspaces(node.getType().toString());
        print("/*! try to cast to type: "+castType+"*/");
        defps(node);
        String prefix="";
        print("myrec=new Cast("+procname(node.getType())+"(),"+
              procname(node.getLoc())+"());");
        defpe(node);
    }


    public void outAConstRhs(AConstRhs node)
    {
        Token id = node.getIdentifier();
        print("/** matches a literal  to the tree at this point*/");
        defps(node);
        print("myrec=new Cast(\"const\",");
        Object val=names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable "+id);
            }
        else if(val instanceof Param)
            {
                print("buildparamref("+((Param)val).index+"));");
            }
        defpe(node);
    }



    public void outAIdLoc(AIdLoc node)
    {
        Token id = node.getIdentifier();
        print("/** Matches identifier "+id+" to the tree at this point*/");
        defps(node);
        Object val=names.get(id.getText());
        // check its type!!!
        if(val == null)
            {
                error("undeclared variable "+id);
            }
        else if(val instanceof RegDetails)
            {
                print("myrec=reg"+((RegDetails)val).internalname+";");
            }
        else if(val instanceof Param)
            {
                pim("myrec=buildparamref("+((Param)val).index+");");
            }
        defpe(node);
    }
    void memorecord(Node n)
    {
        //print (memoname(n)+"=nstr;");
    }

    public void outAForMeaning(AForMeaning node)
    {
        defps(node);
        print("myrec=new For(");
        if(node.getRefval() != null)
            {
                String refhandler=procname(node.getRefval());
                print(refhandler+"(),");
            }
        else error("illegalfor loop"+node);
        if(node.getStart() != null)
            {
                String handler=procname(node.getStart());
                print(handler+"(),");
            }
        else error("illegal for loop "+node);
        if(node.getStop() != null)
            {
                String handler=procname(node.getStop());
                print(handler+"(),");
            }
        else error("illegal for loop "+node);
        if(node.getIncrement() != null)
            {
                String handler=procname(node.getIncrement());
                print(handler+"(),");
            }
        else error("illegal for loop "+node);
        if(node.getMeaning() != null)
            {
                String meaning=procname(node.getMeaning());
                print(meaning+"());");
            }
        defpe(node);
    }

    /*
    public void inARegisterLoc(ARegisterLoc node)
    {
        defaultIn(node);
    }

    public void outARegisterLoc(ARegisterLoc node)
    {
        defaultOut(node);
    }
       */


    public void outAMemoryLoc(AMemoryLoc node)
    {
        defps(node);
        Node val = node.getValue();
        pset("new Memref("+procname(val)+"(),\"any\")");
        defpe(node);
    }







    public void inAReallitNumber(AReallitNumber node)
    {
        defaultIn(node);
    }



    public void inAIntegerNumber(AIntegerNumber node)
    {
        defaultIn(node);
    }



    public void inAReallit(AReallit node)
    {
        defaultIn(node);
    }

    public void outAReallit(AReallit node)
    {
        defaultOut(node);
    }

    void defds(Node n)
    {
        String nom=procname(n);
        out.println("/** defds ->public boolean "+nom+
                    "*/");
    }

    void handledyad(Node node, String s)
    {
        defps(node,"String");
        print("myrec=\""+s+"\";");
        defpe(node);
    }  public void outASatmultDyadic(ASatmultDyadic node)
    {
        handledyad(node,"satmult");
    }

    public void outASatminusDyadic(ASatminusDyadic node)
    {
        handledyad(node,"satminus");
    }
    public void outAMaxDyadic(AMaxDyadic node)
    {
        handledyad(node,ilcg.tree.Node.max);
    }
    public void outAMinDyadic(AMinDyadic node)
    {
        handledyad(node,ilcg.tree.Node.min);
    }
    public void inALtDyadic(ALtDyadic node)
    {
        defaultIn(node);
    }

    public void outALtDyadic(ALtDyadic node)
    {
        handledyad(node,"lt");
    }
    public void outAReplicateDyadic(AReplicateDyadic node)
    {
        handledyad(node,"rep");
    }
    public void outAGtDyadic(AGtDyadic node)
    {
        handledyad(node,"gt");
    }
    public void outASatplusDyadic(ASatplusDyadic node)
    {
        handledyad(node,"satplus");
    }
    public void outAEqDyadic(AEqDyadic node)
    {
        handledyad(node,"eq");
    }
    public void outAPushDyadic(APushDyadic node)
    {
        handledyad(node,"push");
    }
    public void outAPlusDyadic(APlusDyadic node)
    {
        handledyad(node,"plus");
    }
    public void outACallDyadic(ACallDyadic node)
    {
        handledyad(node,"apply");
    }
    public void outAMinusDyadic(AMinusDyadic node)
    {
        handledyad(node,"minus");
    }
    public void outAOrDyadic(AOrDyadic node)
    {
        handledyad(node,"or");
    }
    public void outAAndDyadic(AAndDyadic node)
    {
        handledyad(node,"and");
    }
    public void outAXorDyadic(AXorDyadic node)
    {
        handledyad(node,"xor");
    }
    public void outAShlDyadic(AShlDyadic node)
    {
        handledyad(node,"shl");
    }

    public void outAShrDyadic(AShrDyadic node)
    {
        handledyad(node,"shr");
    }
    /** this resolves the identifier at build time
        on the assumption that instruction formats
        that contain operators are expanded to
        handle all the operators */
    public void outAIdentifierDyadic(AIdentifierDyadic node)
    {
        defds(node);
        defps(node);
        Token id=node.getIdentifier();
        String key = id.getText();
        Object value = names.get(key);
        if(value instanceof Param)
            {
                pim("myrec = buildparamref("+((Param)value).index+");");
            }
        else
            error(key+" had no value ");
        defpe(node);
    }

    public void outATimesDyadic(ATimesDyadic node)
    {
        handledyad(node,"times");
    }

    public void outADivideDyadic(ADivideDyadic node)
    {
        handledyad(node,"divide");
    }



    public void outARemainderDyadic(ARemainderDyadic node)
    {
        handledyad(node,"remainder");
    }

    /** Converts a TString into a string stripping off leading and
        trailing quotes */
    String printable(TString s)
    {
        String raw=s.getText();
        return raw.substring(1,raw.length()-1);
    }
    /** convert an ilcg format to its java encoding */
    String pasformat(String f)
    {
        return f;
    }
    int regnum=0;
    /** plant a declaratrion of the  in the tree walker*/






    /** plant a declaratrion of the  in the tree walker*/
    public void outARegisterdecl(ARegisterdecl node)
    {
        String id=notrailingspaces(node.getIdentifier().toString());
        String printsAs=printable(node.getString());
        /** Note the type of the register is always a ref type */
        Node t = node.getType();
        Node a = node.getAggregate();
        String aggs = a.toString();
        RegDetails det= new RegDetails("ref "+notrailingspaces(t.toString()),
                                       printsAs,
                                       id,
                                       null);
        names.put(id,det);
        boolean isStack = aggs.startsWith("stack");
        boolean isVector = aggs.startsWith("vector");
        boolean res=node.getReservation().toString().startsWith("reserved");
        if(isStack)
            {
                print("RegisterStack reg"+id+"= new RegisterStack(\""+printsAs+
                      "\",\""+det.format+"\","+aggs.substring(5)+",registerSet,registerIndex);");
            }
        else if(isVector)
            {
                print("RegisterVector reg"+id+"= new RegisterVector(\""+printsAs+
                      "\",\""+det.format+"\","+aggs.substring(6)+");");
            }
        else
            print("Register reg"+id+"=new Register(\""+printsAs
                  +"\",\""+det.format+"\", "+ res+",registerSet,registerIndex);");
    }

    /*
    public void outAFpAliasdecl(AAliasdecl node)
        {
        	String child="FP";
    	String parent=notrailingspaces(node.getParent().toString());
    	String lows,highs;
    	lows=node.getLowbit().toString();
    	Integer low=new Integer(notrailingspaces(lows));
    	Integer high=new Integer(notrailingspaces(node.getHighbit().toString()));
            Object rd=names.get(child);
            if(rd==null){
            	System.err.println("register "+child+" not declared at point "+
            	node);
            	return;
            }
            if(names.get(parent)==null)
            	System.err.println("register "+parent+" not declared for use as alias in"+node);
            else{
            	RegAlias ra=new RegAlias((RegDetails)names.get(parent),low.intValue(),high.intValue());
            	((RegDetails)rd).alias=ra;

            print("Register regFP=new Register(\""+printsAs+"\",\""+((RegDetails)rd).format+"\",registerSet,registerIndex);");
            }
        }*/
    public void outAAliasdecl(AAliasdecl node)
    {
        String child=notrailingspaces(node.getChild().toString());
        String parent=notrailingspaces(node.getParent().toString());
        String lows,highs;
        lows=node.getLowbit().toString();
        Integer low=new Integer(notrailingspaces(lows));
        Integer high=new Integer(notrailingspaces(node.getHighbit().toString()));
        Object rd=names.get(child);
        if(names.get(parent)==null)
            System.err.println("register "+parent+" not declared for use as alias in"+node);
        else if(child.equals("FP"))
            {
                FPAlias="reg"+parent;
            }
        else if(child.equals("SP"))
            {
                SPAlias="reg"+parent;
            }
        else
            {
                if(rd!=null)
                    {
                        System.err.println("register "+child+" declared at point "+node);
                        return;
                    }
                String id=child;
                String printsAs=printable(node.getString());
                /** Note the type of the register is always a ref type */
                RegDetails det= new RegDetails("ref "+notrailingspaces(node.getType().toString()),
                                               printsAs,
                                               id,
                                               null);
                names.put(id,det);
                RegAlias ra=new RegAlias((RegDetails)names.get(parent),low.intValue(),high.intValue());
                det.alias=ra;
                print("Register reg"+child+"=new Register(\""+printsAs+"\",\""+((RegDetails)det).format+"\", reg"+parent+","+lows+",registerSet,registerIndex);");
            }
    }



    public void outAOpdecl(AOpdecl node)
    {
        String id=notrailingspaces(node.getIdentifier().toString());
        String oper=notrailingspaces(node.getOperator().toString());
        String printsAs=printable(node.getString());
        if(names.get(id)!=null) error(id+" not unique");
        names.put(id, new Operation(id,oper,printsAs));
        print("Pattern pat"+id+"=new Pattern(\""+oper+"\", \""+printsAs+"\");");
    }

    void predecpat(String id,String assemblesto,int altno)
    {
        print("Pattern pat"+pasname(id)+"=new Pattern(new Format(Node."+id+"),string2printlist(\""+assemblesto+"\"));");
    }
    String regname(String id)
    {
        return "reg"+pasname(id);
    }
    /** Convert an id to a case insensitive form */
    String pasname(String id)
    {
        String name= id+" ";
        return name;
    }


    public void outAPlusOperator(APlusOperator node)
    {
//       defaultOut(node);
    }




    public void outAMinusOperator(AMinusOperator node)
    {
        //     defaultOut(node);
    }



    /** dummy to prevent uneccessary recognising proc being generated */
    public void outATimesOperator(ATimesOperator node)
    {
//        defaultOut(node);
    }



    /** dummy to prevent uneccessary recognising proc being generated */
    public void outADivideOperator(ADivideOperator node)
    {
//        defaultOut(node);
    }

    public void outAAssign(AAssign node)
    {
        defps(node);
        print("try{myrec=new Assign(");
        print(" "+procname(node.getRefval())+"(),");
        print("  "+procname(node.getValue())+"(),false);");
        print("}catch(Exception e){System.out.println(\" error initialising \"+e);myrec= null;}");
        defpe(node);
    }

    public void outAValueMeaning(AValueMeaning node)
    {
        setres(node, node.getValue());
    }

    public void outAAssignMeaning(AAssignMeaning node)
    {
        setres(node,node.getAssign());
    }
    public void outALocMeaning(ALocMeaning node)
    {
        defps(node);
        pset("new Location("+procname(node.getValue())+"())");
        defpe(node);
    }
    public void outAIfMeaning(AIfMeaning node)
    {
        defps(node);
        pset("new If("+
             procname(node.getValue())+"(),"+
             procname(node.getMeaning())+"())");
        defpe(node);
    }
    void pset(String s)
    {
        print("myrec="+s+";");
    }
    public void outAGotoMeaning(AGotoMeaning node)
    {
        defps(node);
        pset("new Goto("+
             procname(node.getValue())+"())");
        defpe(node);
    }
    public void outAFailMeaning(AFailMeaning node)
    {
        defps(node);
        pset("new Fail("+
             procname(node.getValue())+"())");
        defpe(node);
    }


    public void inAPatterndecl(APatterndecl node)
    {
        setIn(node,"p"+localname(node)+procNum+node.getIdentifier().getText());
        procNum++;
        names.enterScope();
    }

    public void outAPatterndecl(APatterndecl node)
    {
        String name = node.getIdentifier().getText();
        Dictionary params = names.getCurrentScope();
        int i=0;
        Node meaning = node.getMeaning();
        Node assemblesto = node.getAssemblesto();
        pattern p=new pattern(node,name,patternContext,params, procname(meaning),
                              procname(assemblesto),
                              meaning.toString());
        names.leaveScope();
        if(names.get(name)!=null) error("not a unique id "+name);
        names.put(name,p);
        if(patternContext=="address")
            addressModes.put(name,p);
        if(patternContext=="instruction")
            instructionSet.put(name,p);
        expandPattern(p);
    }
    /** Add an alternative to the vector */
    public void inAAlternativesPatterndecl(AAlternativesPatterndecl node)
    {
        defaultIn(node);
        alternatives = new Vector(0);
    }
    /* non recursive version */
    public boolean allRegisters(AAlternativesPatterndecl node)
    {
        return allRegisters(node,false);
    }
    /* potentially recursive version */
    public boolean allRegisters(AAlternativesPatterndecl node,boolean recursive)
    {
        print("// are the following all registers ? "+node);
        boolean allregs=true;
        AAlternatives pa =(AAlternatives) node.getAlternatives();
        String tt=notrailingspaces(pa.getType().toString());
        allregs=names.get(tt) instanceof RegDetails;
        Object temp[]=pa.getAlts().toArray();
        for(int i=0; i<temp.length; i++)
            {
                Object alti = temp[i];
                Object altt= ((AAlts)alti).getType();
                if(altt instanceof ATypeidType)
                    {
                        ATypeidType att=(ATypeidType)altt;
                        String alt = ((ATypeid)att.getTypeid()).getIdentifier().getText();
                        print("//alternative ("+i+") "+alt);
                        Object whatIsIt = names.get(alt);
                        if(whatIsIt instanceof pattern)whatIsIt=((pattern)whatIsIt).getNode();
                        if(whatIsIt instanceof AAlternativesPatterndecl)
                            {
                                allregs=recursive&&allregs;
                                if(allregs)
                                    allregs=
                                        allRegisters((AAlternativesPatterndecl)whatIsIt,recursive);
                            }
                        else allregs=allregs && (whatIsIt instanceof RegDetails);
                    }
                else allregs=false;
            }
        return allregs;
    }
    int alternativescount=0;

    /** Collects all the alternatives into a vector of alternatives
            indexed under the pattern name
    If all the alternatives are patterns constructs a switch statement
    and remembers which switch alternative succeded last time.
    If the input string it identical to a past success go straight to it.

    */
    public void outAAlternativesPatterndecl(AAlternativesPatterndecl node)
    {
        //defaultOut(node);
        String patternid = notrailingspaces(node.getIdentifier().toString());
        names.put(patternid,new pattern(node,patternid,patternContext,
                                        new Hashtable(),procname(node),"defprintproc","alternatives"));
        //memotest(node);
        int firstalt=alternativescount;
        alternativescount+= alternatives.size();
        int lastalt=alternativescount-1;
        if(lastalt >maxalt) error("Machine description too large ");
        String typen="Pattern";
        if(allRegisters(node)) typen="Register ";
        defps(node,typen+"[] ");
        print("myrec=new "+typen+"["+alternatives.size()+"];");
        String pref="pat";
        if(allRegisters(node))pref="reg";
        for(int i=0; i<alternatives.size(); i++)
            print("myrec["+(i)+"]="+pref+pasname(alternatives.elementAt(i).toString())+";");
        defpe(node);
        print("Pattern pat"+pasname(patternid)+"=new Pattern("+
              procname(node)+"());");
    }

    public void inAParamlist(AParamlist node)
    {
        //   defaultIn(node);
        paramindex=0;
    }
    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAParamlist(AParamlist node)
    {
    }

    public void inAParam(AParam node)
    {
    }

    int paramindex=0;
    public void outAParam(AParam node)
    {
        String type = notrailingspaces(node.getTypeid().toString());
        String id=notrailingspaces(node.getIdentifier().toString());
        Param p=new Param(id,type,paramindex++);
        Object typeinfo = names.get(type);
        if(typeinfo==null)
            {
                error("type "+type+" undelclared");
            }
        names.put(id,  p);
    }

    public void inATypeparamParam(ATypeparamParam node)
    {
        defaultIn(node);
    }
    public void outATypeparamParam(ATypeparamParam node)
    {
        String id=notrailingspaces(node.getIdentifier().toString());
        names.put(id, new Param(id,"type",paramindex++));
    }
    public void outALabelParam(ALabelParam node)
    {
        String id=notrailingspaces(node.getIdentifier().toString());
        names.put(id, new Param(id,"label",paramindex++));
    }
    /** checks that the identifier is declared */
    public void inAATypeid(ATypeid node)
    {
        defaultIn(node);
        // String id=node.getIdentifier().toString();
        String id=notrailingspaces(node.toString());
        Object result = names.get(id);
        if(result==null)
            {
                Token t= node.getIdentifier();
                System.err.println(id+" undeclared on line "+
                                   t.getLine()+","+t.getPos());
            }
    }
    /** generates a procedure which if called checks that
        the current tree matches the type currently asssociated
        with the identifier */
    public void outATypeid(ATypeid node)
    {
        Token t = node.getIdentifier();
        Object o= names.get(notrailingspaces(node.toString()));
        pim("/*"+t+" "+o+"*/");
        if(o instanceof Param)
            {
                defps(node);
                pset("buildparamref("+((Param)o).index+")");
                defpe(node);
            }
        else if(o instanceof pattern)
            {
                defps(node,"Pattern");
                print("myrec=pat"+((pattern)o).name+";");
                defpe(node);
            }
    }

    public void inAParamtail(AParamtail node)
    {
        defaultIn(node);
    }
    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAParamtail(AParamtail node)
    {
        // defaultOut(node);
    }

    public void inAAlternatives(AAlternatives node)
    {
        alternatives=new Vector();
        alternatives.addElement(notrailingspaces(node.getType().toString()));
        //defaultIn(node);
    }
    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAAlternatives(AAlternatives node)
    {
        //defaultOut(node);
    }
    /** dummy to prevent uneccessary recognising proc being generated */
    public void inAAlts(AAlts node)
    {
        // defaultIn(node);
    }

    public void outAAlts(AAlts node)
    {
        // defaultOut(node);
        alternatives.addElement(notrailingspaces(node.getType().toString()));
    }
    // declares start of an assembler output method
    void defas(Node n)
    {
        print("Object[] "+
              procname(n)+"()");
    }

    int tokencount=0;
    public void outAAssemblesto(AAssemblesto node)
    {
        defas(node);
        Node ap= node . getAssemblypattern();
        print("{ return "+procname(ap)+"();");
        defpeb();
    }

    public void inAAssemblypattern(AAssemblypattern node)
    {
        defaultIn(node);
        defas(node);
        print("{Object[] list =list"+procname(node)+";");
        tokencount=0;// this counts the number of components in the list
    }

    public void outAAssemblypattern(AAssemblypattern node)
    {
        print(" return list;");
        defpeb();
        print("Object[] list"+procname(node)+"=new Object["+tokencount+"];");
    }


    public void inAStringAssemblertoken(AStringAssemblertoken node)
    {
        defaultIn(node);
        tokencount++;
    }
    public void outAStringAssemblertoken(AStringAssemblertoken node)
    {
        print("list["+(tokencount-1)+"]=(\""+printable(node.getString())+"\");");
    }

    public void inAIdentifierAssemblertoken(AIdentifierAssemblertoken node)
    {
        defaultIn(node);
        tokencount++;
    }

    public void outAIdentifierAssemblertoken(AIdentifierAssemblertoken node)
    {
        String id = node.getIdentifier().getText();
        Object defn = names.get(id);
        if(defn!=null)
            if(defn instanceof Param)
                {
                    Param p = (Param)defn;
                    files[pimp][pfn].println("\t\tlist["+(tokencount-1)+"]=buildparamref("+p.index+");");
                    if(p.type.equals("type"))
                        {
                            //	print("+ type2Assembler(bindings[1]["+p.index+"].toString())");
                            return;
                        }
                    //	print("+ type2Assembler(bindings[1]["+p.index+"].toString())");
                }
    }


    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAAliasdeclStatement(AAliasdeclStatement node)
    {
        // defaultOut(node);
    }

    /** Stores the association between the ilcg type and the assembler type
        in a hash table */
    public void outATyperenameStatement(ATyperenameStatement node)
    {
        String [] pair = {notrailingspaces(node.getPredeclaredtype().toString()),node.getIdentifier().getText()};
        typerenamevec.addElement(pair);
    }

    public void outARegisterdeclStatement(ARegisterdeclStatement node)
    {
        //
    }

    public void inAAddressmodeStatement(AAddressmodeStatement node)
    {
        patternContext="address";
        //defaultIn(node);
    }

    public void outAAddressmodeStatement(AAddressmodeStatement node)
    {
        //defaultOut(node);
        patternContext="general";
    }

    public void inAInstructionformatStatement(AInstructionformatStatement node)
    {
        //defaultIn(node);
        patternContext="instruction";
        instructionSet=procedureFormats;
    }
    /** enters a name for the recogniser in the symbol table and sets
            the pattern context to be instruction */
    /* public void inAInstructionfunctionStatement(AInstructionfunctionStatement node)
    {	setIn(node,"p" +procNum+node.getIdentifier().getText());
    		procNum++;

         	names.enterScope();
    	patternContext="instruction";
    	instructionSet=functionFormats;
    }
    */

    public void outAInstructionformatStatement(AInstructionformatStatement node)
    {
        //defaultOut(node);
        patternContext="general";
    }

    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAReturnval(AReturnval node)
    {
    }
    public void inAOpdeclStatement(AOpdeclStatement node)
    {
        defaultIn(node);
    }

    public void outAFlagStatement(AFlagStatement node)
    {
        String id = node.getIdentifier().getText();
        flags.put(id,new Integer(node.getIntlit().getText()));
    }
    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAOpdeclStatement(AOpdeclStatement node)
    {
        //  defaultOut(node);
    }

    public void inAPatterndeclStatement(APatterndeclStatement node)
    {
        defaultIn(node);
    }
    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAPatterndeclStatement(APatterndeclStatement node)
    {
        // defaultOut(node);
    }
    /** dummy to prevent uneccessary recognising proc being generated */

    public void outAStatementlist(AStatementlist node)
    {
        // defaultOut(node);
    }

    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAInstructionlist(AInstructionlist node) {}
    /** dummy to prevent uneccessary recognising proc being generated */
    public void outAStatements(AStatements node)
    {
        // defaultOut(node);
    }


}


