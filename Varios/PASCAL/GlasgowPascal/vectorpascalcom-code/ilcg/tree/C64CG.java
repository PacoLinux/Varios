package ilcg.tree;
import java.util.*;
import java.util.regex.*;
import java.io.*;

/**
 *  A class that overides the automatically produced class C and code generates
 *  C code
 *
 *@author     wpc
 *@created    Oct 9 2006
 */

public class C64CG extends C64

{
    RollBackBuffer predecls = new RollBackBuffer();
    Dictionary d= new Hashtable();
    static boolean fixalignment=false;
    class Editbuffer extends RollBackBuffer
    {
        java.util.regex.Pattern labpat=java.util.regex.Pattern.compile("label[0-9[a-z]]*:");
        Vector replacements=new Vector();
        Vector originals=new Vector();
        void replaceAll()
        {
            for(int i=0; i<replacements.size(); i++)
                {
                    replaceAwithB(originals.elementAt(i).toString(),replacements.elementAt(i).toString());
                }
        }
        void rppair(String A,String B)
        {
            replacements.add(B);
            originals.add(A);/*System.out.println(A+"->"+B);*/
        }

        void replaceAwithB(String A,String B)
        {
            int nesting=0;
            //System.out.println("replace original "+A+" with "+B+" in output file");
            for(int i=0; i< lastline ; i++)
                {
                    String s= store.elementAt(i).toString();
                    String ns=s.replace(A,B);
                    while(!ns.equals(s))
                        {
                            /*System.out.println(s+"->"+ns);*/s=ns;
                            ns=s.replace(A,B);
                        }
                    store.set(i,ns);
                }
        }
        public void flush(PrintWriter out)
        {
            // move include files to the top, in assembler they can go at the bottom but not in C
            RollBackBuffer includes=new RollBackBuffer();
            for(int i=0; i< lastline ; i++)
                {
                    String s= store.elementAt(i).toString();
                    if(s.trim().startsWith("#inc"))
                        {
                            ;
                            includes.writeln(s);
                            store.set(i,"");
                        }
                }
            includes.flush(out);
            peepopt();
            predecls.flush(out);
            super.flush(out);
        }
        void peepopt()
        {
            int nesting=0;
            replaceAll();
            for(int i=0; i< lastline ; i++)
                {
                    String s= store.elementAt(i).toString();
                    if(s.indexOf('{')>=0)nesting++;
                    if(s.indexOf('}')>=0)nesting--;
                    // labels outside of procs must be in assembler format
                    Matcher m=labpat.matcher(s.trim());
                    if((nesting==0)&&m.matches())
                        {
                            store.set(i,"asm(\" " + s + " \" );");
                        }
                    //	log(" "+nesting+s + "matches "+labpat.pattern()+m.matches());
                }
        }
    }
    public String getAddressType()
    {
        return Node.int64;
    }
    public String bits()
    {
        return "BITS 64";
    }
    public int getAddressLenInBytes()
    {
        return 8;
    }

    /**

     */
    public C64CG()
    {
        ignorepastfailures=true;
        commentprefix="//";
        buf=new Editbuffer();
    }


    // 486 CG tail file for the gnu assembler

    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String globalDirective()
    {
        return "";
    }
    public String type2Assembler(String loct)
    {
        if(loct.contains("ref "))return "INT64";
        if(Format.isVector(loct))return type2Assembler(Format.getVectorElementType(loct));
        return super.type2Assembler(loct);
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String sectionDirective()
    {
        return "#define z346g";
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String directivePrefix()
    {
        return "#";
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String macrofile()
    {
        return "macros64.h";
    }


    /**
     *  Description of the Method
     *
     *@param  bytes  Description of the Parameter
     */
    public void reservebytes(int bytes)
    {
        buf.writeln(" char xxxxx"+resnum+"[" + bytes + "];");
        resnum++;
    }
    int resnum=1;

    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String externDirective()
    {
        return "//extern ";
    }
    String toCcast(String ilcgtype)
    {
        if(!Format.isVector(ilcgtype))return type2Assembler(ilcgtype);
        return "struct{"+toCcast(Format.getVectorElementType(ilcgtype))+" b["+Format.getVectorTypeLength(ilcgtype)+"];}";
    }

    /**
     *  Implements procedure call
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */

    public boolean cgApply(Monad m)
    {
        try
            {
                String rt= m.returnType();
                Node address=(((Function) m.oper).address);
                Procedure proc=null;
                if(address==null) proc = (Procedure)(((Function) m.oper).proc);
                Cartesian params = (Cartesian) m.arg;
                Statement pushlist = new Statement();
                int argc = params.argc();
                spchange = 0;
                int premark = buf.mark();
                String precall="";
                String retass="\tD0=";
                if(Format.isInteger(rt))retass=("\tr0=");
                boolean ok = true;
                if(proc==null)   // procedure variable call
                    {
                        //		codeGen (new Assign(regEAX,new Cast("int32",address)));
                        buf.writeln("//   call indirect "+address);
                        Label l = new Label();
                        buf.writeln("\tint (*"+l+")();\n\t"+l+"=(");
                        int mk,k;
                        mk=buf.mark();
                        ok=ok&&codeGen(new Push(regmainSTACK, address));
                        // get rid of any ; in the code generated for this
                        String[] seq=buf.sequester(mk);
                        String all="\t";
                        for(k=0; k<seq.length; k++)all=all+seq[k];
                        all=all+")";
                        all=all.replace(";",",");
                        buf.writeln(all+";");
                        buf.writeln(retass+"(*"+l+")(");
                        //	       buf.writeln("  call eax");
                    }
                else
                    {
                        if(proc.isImported)
                            {
                                String slist=outputparamlist(proc,true);
                                predecls.writeln(type2Assembler(proc.returntype)+" "+proc.name+slist+";");
                                buf.writeln("/* imported procedure */;"+type2Assembler(proc.returntype)+" "+proc.name+slist+";");
                                buf.writeln(retass+ proc.name + "(");
                            }
                        else
                            {
                                String slist=outputparamlist(proc,true);
                                predecls.writeln("#ifndef "+proc.getStartAddressLabel()+"_defined\n#define "+proc.getStartAddressLabel()+
                                                 "_defined 1");
                                predecls.writeln("\n"+type2Assembler(proc.returntype)+" "+proc.getStartAddressLabel()+slist+";\n#endif");
                                buf.writeln(retass+ proc.getStartAddressLabel()+"("+(!(proc instanceof Unit)?FP+(params.argc()>0?", ":" "):""));
                            }
                    }
                for(int i = 0; i < argc; i++)
                    {
                        printcomment("type "+params.argi(i).returnType());
                        if(!Format.isVector(params.argi(i).returnType())|| Format.isRef(params.argi(i).returnType()))
                            {
                                //	pushlist = new Statement(pushit(params.argi(i)), pushlist);
                                int mk,k;
                                mk=buf.mark();
                                ok=ok&&codeGen(new Push(regmainSTACK, params.argi(i)));
                                // get rid of any ; in the code generated for this
                                String[] seq=buf.sequester(mk);
                                String all="(";
                                for(k=0; k<seq.length; k++)all=all+seq[k];
                                all=all+")";
                                all=all.replace(";",",");
                                buf.writeln(all);
                                if(i<argc-1)buf.writeln(",");
                            }
                        else
                            {
                                buf.writeln("/*"+params.argi(i).returnType()+"*/");
                                int size=(Format.lengthInBytes(params.argi(i).returnType())+3)/4;
                                //   for(int j=0; j<size; j++)
                                {
                                    buf.writeln("((char*)");
                                    int mk,k;
                                    mk=buf.mark();
                                    Node dc = addrof(params.argi(i));
                                    if(dc==null)
                                        {
                                            Node p = params.argi(i);
                                            String pt = p.returnType();
                                            //     System.out.println(pt+ " "+p);
                                            Memref v= newTemp(Format.lengthInBytes(pt),pt) ;
                                            int mk2= buf.mark();
                                            ok=ok&codeGen(new Assign(v,p));
                                            String[] init= buf.sequester(mk2);
                                            for(k=0; k<init.length; k++)precall+="\n\t\t"+init[k];
                                            //     System.out.println("assigned to "+v +" "+ok);
                                            dc=addrof(v);
                                        }
                                    buf.writeln("/* pass the address of the array, it will be copied inside the proc */");
                                    if(ok)ok=ok&&codeGen(new Push(regmainSTACK, new Cast("int32", (dc))));
                                    // get rid of any ; in the code generated for this
                                    String[] seq=buf.sequester(mk);
                                    String all="(";
                                    for(k=0; k<seq.length; k++)all=all+seq[k];
                                    all=all+")";
                                    all=all.replace(";",",");
                                    //    buf.writeln("("+all+"))["+j+"]");
                                    buf.writeln("("+all+"))");
                                    if(i<argc-1)buf.writeln(",");
                                }
                            }
                    }
                buf.writeln(");");
                String[] thecall = buf.sequester(premark);
                printcomment("precall");
                buf.writeln(precall);
                printcomment("call");
                for(String s :thecall)buf.writeln(s);
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println(eee);
                return false;
            }
    }


    /**
     *  * handles function return code
     *
     *@param  r  Return node
     *@return    Description of the Returned Value
     */
    public boolean cgReturn(Return r)
    {
        try
            {
                Node n = r.arg;
                String nt = n.returnType();
                if(verbose)dlog("try to return "+nt);
                boolean ok=true;
                buf.writeln("\treturn ");
                ok=ok&&codeGen(new Push(regmainSTACK, n));
                buf.writeln("\t;");
                return ok;
            }
        catch(Exception e)
            {
                System.out.println("whilst generating return statement got \n" + e + "\n for " + r);
                return false;
            }
    }


    /**
     *  Description of the Method
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node functionRetReg(String t)
    {
        Node res = new Deref(regR0);
        if(t.equals(Node.ieee32) || t.equals(Node.ieee64))
            {
                res = new Deref(regD0);
            }
        if(t.equals(Node.int8)||t.equals(Node.uint8)||t.equals(Node.octet))
            res=new Deref(regR0);
        return new Cast(t,res);
    }



    /**
     *  produces entry and exit sequence for pascal procedures
     *
     *@param  p  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean cgProcedure(Procedure p)
    {
        return scgProcedure(p, this);
    }


    /**
     *  Invoke the linker on a file.
     *
     *@param  infile  Description of Parameter
     *@param  ofile   Description of Parameter
     *@return         Description of the Returned Value
     */
    public boolean link(String infile, String ofile)
    {
        return slink(infile, ofile);
    }


    /**
     *  Invoke the assembler on a file.
     *
     *@param  infile  Description of Parameter
     *@param  ofile   Description of Parameter
     *@return         Description of the Returned Value
     */
    public boolean assemble(String infile, String ofile)
    {
        return sassemble(infile, ofile);
    }


    /**
     *  push a param on stack
     *
     *@param  n              node to go on stack
     *@return                Description of the Returned Value
     *@exception  Exception  Description of Exception
     */
    Node pushit(Node n) throws Exception
    {
        return null;
    }


    /**
     *  Description of the Method
     *
     *@param  b  Description of the Parameter
     */
    Node outputdatadecls(Node b,boolean recurse)
    {
        class codetrav implements TreeModifier
        {
            /**
             *  This is called each time a node is visited, but before any subtrees are
             *  visited. If it returns false the subtree below the node is not visited
             *
             *@param  n  Description of the Parameter
             *@return    Description of the Return Value
             */

            public boolean visit(Node n)
            {
                return true;
            }


            /**
             *  Description of the Method
             *
             *@param  n  Description of the Parameter
             *@return    Description of the Return Value
             */
            public Node modified(Node n)
            {
                if(n == null)
                    {
                        return n;
                    }
                if(n instanceof Block)
                    {
                        ((Block) n).subtree = process(((Block) n).subtree.modify(this));
                        return n;
                    }
                if(n instanceof For)
                    {
                        ((For) n).action = process(((For) n).action.modify(this));
                        return n;
                    }
                if(n instanceof If)
                    {
                        ((If) n).a1 = process(((If) n).a1.modify(this));
                        if(((If)n).a2 !=null)((If) n).a2 = process(((If) n).a2.modify(this));
                        return n;
                    }
                return n.modify(this);
            }


            /**
             *  Description of the Method
             *
             *@param  s           Description of the Parameter
             *@param  items2null  Description of the Parameter
             */
            void nullout(Statement s, Set items2null)
            {
                if(s == null)
                    {
                        return;
                    }
                if(items2null.contains(s.action))
                    {
                        log("nulling "+s.action);
                        s.action = null;
                    }
                else
                    {
                        if(s.action instanceof Statement)
                            {
                                nullout((Statement) s.action, items2null);
                            }
                    }
                ;
                nullout(s.next, items2null);
            }


            /**
             *  Description of the Method
             *
             *@param  n  Description of the Parameter
             *@return    Description of the Return Value
             */
            Node process(Node n)
            {
                dlog("processing in outputdatadecls ");
                // scan the statements looking for labels followed by location nodes
                if(n == null)
                    {
                        return n;
                    }
                if(n instanceof Statement)
                    {
                        Vector v = ((Statement) n).linearise(d);
                        if(((Statement)n).line>0)
                            {
                                notifier.done("processing ",((Statement)n).line);
                                printcomment("line "+((Statement)n).line);
                            }
                        dlog("statement "+n+"linearised to ");
                        for(int j = 0; j < v.size(); j++)
                            {
                                if(v.elementAt(j) instanceof Block)
                                    {
                                        dlog(" "+j+" Block");
                                        //	((Block) v.elementAt(j)).subtree=process(((Block) v.elementAt(j)).subtree);
                                    }
                                else
                                    {
                                        dlog(" " + j + " - " + v.elementAt(j));
                                    }
                            }
                        Set itemstonull = new HashSet();
                        int pos;
                        for(pos = 0; pos < v.size() - 1; pos++)
                            {
                                Object thisone = d.get(v.elementAt(pos));
                                //if( thisone != null) 	printcomment("line "+thisone);
                                if(v.elementAt(pos) instanceof Label)
                                    {
                                        dlog("found label in linseq "+pos);
                                        if(v.elementAt(pos + 1) instanceof Location)
                                            {
                                                int locs;
                                                int lastloc;
                                                if(pos>0)
                                                    if(v.elementAt(pos -1) instanceof Label)
                                                        {
                                                            buf.writeln("#define "+v.elementAt(pos-1)+" "+v.elementAt(pos));
                                                        }
                                                itemstonull.add(v.elementAt(pos));
                                                lastloc = pos + 1;
                                                for(locs = pos + 1; locs < v.size() && (v.elementAt(locs)) instanceof Location; locs++)
                                                    {
                                                        lastloc = locs;
                                                        dlog("found loc at "+(locs));
                                                        itemstonull.add(v.elementAt(locs));
                                                    }
                                                String loct = Format.typeDeref(((Location) v.elementAt(pos + 1)).returnType());
                                                if(Format.isVector(loct))loct=Format.getVectorElementType(loct);
                                                String Ctype = type2Assembler(loct);
                                                String vn=v.elementAt(pos).toString();
                                                ((Editbuffer)buf).rppair("&&"+vn,vn);
                                                buf.writeln(Ctype +"\t" + vn+ "[] " + "={");
                                                for(int i = pos+1; i <= lastloc; i++)
                                                    {
                                                        Node ll=decast(((Location) v.elementAt(i)).subtree);
                                                        String prefix ="";
                                                        if(ll instanceof Label) prefix="(INT64)&&";
                                                        buf.writeln(" " +prefix+(ll)+(i<(lastloc)? ",":" "));
                                                        buf.writeln("/*"+ll.getClass()+"*/");
                                                    }
                                                buf.writeln("};");
                                            }
                                    }
                            }
                        nullout((Statement) n, itemstonull);
                    }
                return n;
            }
        }
        dlog("output data decls");
        codetrav t=new codetrav();
        if(recurse)return b.modify(t);
        t.process(b);
        return b;
    }


    static int suffixes = 0;

    void GenerateMacros()
    {
        buf.writeln("#ifndef ilcgmacros");
        buf.writeln("#define ilcgmacros 1");
        buf.writeln("#define add(a,b) (a+b)");
        buf.writeln("#define sub(a,b) (a-b)");
        buf.writeln("#define and(a,b) ((a) &( b))");
        buf.writeln("#define or(a,b) ((a )| (b))");
        buf.writeln("#define xor(a,b) ((a) ^ (b))");
        buf.writeln("#define mul(a,b) (a*b)");
        buf.writeln("#define div(a,b) (a/b)");
        buf.writeln("#define mod(a,b) (a%b)");
        buf.writeln("#define lt(a,b) (a<b)");
        buf.writeln("#define gt(a,b) (a>b)");
        buf.writeln("#define eq(a,b) (a==b)");
        buf.writeln("#define ng(a,b) (a<=b)");
        buf.writeln("#define le(a,b) (a<=b)");
        buf.writeln("#define nl(a,b) (a>=b)");
        buf.writeln("#define ge(a,b) (a>=b)");
        buf.writeln("#define ne(a,b) (a!=b)");
        buf.writeln("#define shiftleft(a,b) (a<<b)");
        buf.writeln("#define shiftright(a,b) (a>>b)");
        buf.writeln("typedef unsigned short UINT16;");
        buf.writeln("typedef unsigned char BYTE;");
        defineregs(this);
        buf.writeln("#endif");
    }
    static void defineregs(Walker w)
    {
        w.buf.writeln("\tregister long long r0,r3,rbp; \n\tlong long r1,r4,r5,r6,r7; int r8,r9,r10,r11,r12,r13,r14,r15;");
        //   w.buf.writeln("\tINT8 b0,b4,b5,b6,b7;");
        w.buf.writeln("\tfloat F0,F1,F2,F3;");
        w.buf.writeln("\tdouble D0,D1,D2,D3;");
    }
    public boolean cgImplabel(Label l)
    {
        String defined  = "defined" + l;
        //buf.writeln( directivePrefix() + "ifndef " + defined );
        //	defineSymbol( defined );
        // buf.writeln(directivePrefix()+"define "+defined+" "+l);
        //	buf.writeln( externDirective() + "\t " + l +"();");
        //	buf.writeln( directivePrefix() + "endif" );
        return true;
    }



    public boolean cgStatement(Node n)
    {
        Statement s= (Statement)n;
        if(s.line >= 0)
            {
                lastLine = s.line;
                verbose = (lastLine >= switchon) && (lastLine <= switchoff);
                buf.writeln(commentprefix + lastLine);
                notify(s.line);
                printcomment(" line "+s.line);
            }
        s=new Statement(outputdatadecls(s,false));
        Vector v = ((Statement) n).linearise(d);
        if(verbose)dlog("statement"+n+"linearised to ");
        for(int j = 0; j < v.size(); j++)
            {
                Object e=v.elementAt(j);
                if(e instanceof Block)
                    {
                        dlog(" "+j+" Block");
                    }
                else
                    {
                        dlog(" " + j + " - " + e);
                    }
                Object l = d.get(e);
                if(l!=null) printcomment("line "+l);
                if(!super.cgStatement(new Statement((Node)v.elementAt(j)))) return false;
            }
        return true;
    }
    static String baselab="-------";


    int procnesting=0;

    static int Paramspace(Procedure p)
    {
        int paramspace=0;
        String []list=p.paramtype.replace("[", "").replace("]", "").split(",");
        for(String l :list)
            {
                int size = Format.lengthInBytes(l.trim());
                if(l.trim().equals(""))size=0;
                if((size %8)!=0) size=(1+(size/8))*8;
                paramspace+=size;
            }
        return paramspace;
    }
    /** outputs the C equivalent of a parameter list for the function */
    String outputparamlist(Procedure p,boolean schema)
    {
        int paramspace =Paramspace(p);
        int paramcountinINT64s = paramspace /8;
        String out="(/* original paramtype was "+p.paramtype +" paramspace = "+paramspace+"*/";
        if(!p.isImported)if(!(p instanceof Unit))
                {
                    out+="INT64 * framepointer ";
                    if(paramcountinINT64s>0)out += ", ";
                }
        String []list=p.paramtype.replace("[", "").replace("]", "").split(",");
        int i=0;
        for(String l :list)
            {
                l=l.trim();
                out+=((i>0?",": " "));
                int size = Format.lengthInBytes(l);
                if(l.equals(""))size=0;
                if((size %8)!=0) size=(1+(size/8))*8;
                if(size==8 &&   ! Format.isVector(l))
                    {
                        out += type2Assembler(l )+" param"+i;
                    }
                else if(Format.isVector(l))
                    {
                        out+=("char* param"+i);
                    }
                else if(size==4)   // this is the default
                    {
                        if(l.equals("ieee32"))
                            {
                                out+= " float param"+i;
                            }
                        else
                            out +=  " int param"+i;
                    }
                i++;
            }
        return out+")";
    }
    static void enter(int space,int lexicalLevel, Walker w,Procedure p)
    {
        space=space+32;
        int raspace=16;
        int paramcountinINT64s = Paramspace(p) /8;
        if(p instanceof Unit)w.buf.writeln("\tINT64 * framepointer  ;/* units have no enclosing scope so have no frampointer param*/");
        w.buf.writeln("\tchar locals["+(space+Paramspace(p)+raspace)+"];");
        w.buf.writeln("\tINT64    *RSP;");
        defineregs(w);
        w.buf.writeln("\tRSP=((int*)&locals["+space+"]); ");
        w.buf.writeln("/* we emulate the enter instruction by storing the old RBP in the frame */");
        w.buf.writeln("\tRSP[0]=(INT64)framepointer; ");
        w.buf.writeln("/* we copy over the C params into the image of an Intel Pascal frame */");
        String []list=p.paramtype.replace("[", "").replace("]", "").split(",");
        int pos=0;
        int i=0;
        for(String l :list)
            {
                int size = Format.lengthInBytes(l.trim());
                w.printcomment("paramtype "+l);
                if(l.trim().equals(""))size=0;
                //  if((size %4)!=0) size=(1+(size/4))*4;
                if((size %8)!=0) size=(1+(size/8))*8;
                if(4==Format.lengthInBytes(l.trim())&& ! Format.isVector(l.trim()))
                    {
                        if(l.trim().equals("ieee32"))w.buf.writeln("\t*((float*)&(locals["+(space+raspace +pos)+"]))=param"+i+";");
                        else
                            w.buf.writeln("\t*((int*)&(locals["+(space+raspace +pos)+"]))=(int)param"+i+";");
                    }
                else if(size==8 && ! Format.isVector(l.trim()))
                    {
                        w.buf.writeln("\t*((INT64*)&(locals["+(space+raspace +pos)+"]))=("+w.type2Assembler(l.trim())+ ")param"+i+";");
                    }
                else if(size>=4 &&  Format.isVector(l.trim()))
                    {
                        w.buf.writeln("\tmemcpy(&(locals["+
                                      (space+raspace +pos)+"]), "+ "param"+i+",  "+Format.lengthInBytes(l)+");"
                                     );
                    }
                i++;
                pos+=size;
            }
        //for(int i=0;i<paramcountinINT64s;i++)w.buf.writeln("\t*((int*)&(locals["+(space+raspace +4*i)+"]))=param"+i+"; ");
        if(lexicalLevel>0)
            {
                for(i=1; i<lexicalLevel; i++)
                    {
                        w.buf.writeln("/* for lex level "+i+" fill in display */");
                        w.buf.writeln("\t\tRSP[-"+i+"]=framepointer[-"+i+"]; ");
                    }
                w.buf.writeln("\tRSP[-"+lexicalLevel+"]=(INT64)RSP; ");
            }
        w.buf.writeln("\t"+w.FP+" =(&locals["+space+"]); ");
    }
    /**
    *  static method to generate code for a procedure
    *
    *@param  p  Description of Parameter
    *@param  w  Description of Parameter
    *@return    Description of the Returned Value
    */

    public static boolean scgProcedure(Procedure p, Walker w)
    {
        ((C64CG)w).procnesting++;
        String name = p.name;
        String suffix = "l" + suffixes;
        int mark= w.buf.mark();
        suffixes++;
        String plist=((C64CG)w).outputparamlist(p,false);
        String slist=((C64CG)w).outputparamlist(p,true);
        if(p.isImported)
            {
                w.buf.writeln("\t/* extern " +  name+"();*/");
                return true;
            }
        w.buf.writeln(
            "\n//procedure "+ name+ "  generated by code generator " + w.getClass());
        if(p.isExported || p instanceof Unit)
            {
                w.buf.writeln(w.type2Assembler(p.returntype)+" "+name +plist);
                ((C64CG)w).predecls.writeln(w.type2Assembler(p.returntype)+" "+name+slist+";");
            }
        else
            {
                w.buf.writeln(w.type2Assembler(p.returntype)+" "+p.getStartAddressLabel() +plist);
                //   ((C64CG)w).predecls.writeln(w.type2Assembler(p.returntype)+" "+p.getStartAddressLabel()+slist+";");
            }
        ;
        w.buf.writeln("{");
        p.subtree=((C64CG)w).outputdatadecls(p.subtree,true);
        int reserve = Math.abs(p.alloc.getLimit());
        if(p instanceof Unit)
            {
                w.buf.writeln("// entering a unit at lexical level " + p.lexLevel);
                baselab=((Unit)p).getBase().toString();
                //	w.buf.writeln(name+ ":");
                ((Editbuffer)(w.buf)).rppair("&&"+baselab,baselab.toString());
                enter(0, p.lexLevel,w,p);
            }
        else
            {
                w.buf.writeln("// entering a procedure at lexical level " + p.lexLevel);
                {
                    enter(2 * reserve+ -4*  p.lexLevel, p.lexLevel,w,p);
                }
            }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" unit$" + p.toCall[ui]+"();");
                        ((Editbuffer)(w.buf)).rppair("&&"+"unit$" + p.toCall[ui]+"$base","unit$" + p.toCall[ui]+"$base");
                    }
                w.buf.writeln("static int "+name+"ready=0;\n\tif("+name+"ready==1)goto "+name+suffix+"exit;");
                w.buf.writeln(name + "ready=1;");
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        w.buf.writeln(name + suffix + "exit:;");
        w.buf.writeln("}");
        if(p instanceof Unit)
            {
                ((Editbuffer)(w. buf)).rppair("&&"+baselab,baselab);
            }
        if((p instanceof Unit)|| (p.lexLevel==0))
            {
                String[] prior= w.buf.sequester(0);
                w.buf.writeln("#define spacefor" + p.name +suffix+ "  " + Math.abs(p.alloc.getLimit()));
                w.buf.writeln("char "+(p instanceof Unit?((Unit) p).getBase().toString():(p.name)+"Base")+"t[spacefor"+p.name+suffix+"];");
                w.buf.writeln("/* since we can not be sure which direction mem allocated by c we double allocate in both directions */");
                w.buf.writeln("char "+(p instanceof Unit?((Unit) p).getBase().toString():(p.name)+"Base")+"[ spacefor"+p.name+suffix+" ];");
                w.buf.append(prior);
                if(!(p instanceof Unit))
                    {
                        ((Editbuffer)(w. buf)).rppair("&&"+(p.name)+"Base",(p.name)+"Base");
                    }
                else
                    {
                        ((Editbuffer)(w. buf)).rppair("&&"+((Unit) p).getBase()+"",((Unit) p).getBase().toString());
                    }
                ((Editbuffer)(w. buf)).replaceAll();
            }
        ((C64CG)w).procnesting--;
        return res;
    }


    /**
     *  This is the link command that can be used by other ia32 family processors
     *
     *@param  infile  Description of Parameter
     *@param  ofile   Description of Parameter
     *@return         Description of the Returned Value
     */
    static String m32="  ";
    public static boolean slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "gcc   "   + " -g    -DC64CG "+(AsmLink.gcenable?"-DBOEHM":"")+"  -w -o " + ofile + " " + infile+".c "+AsmLink.rtl+" " + AsmLink.libs+ " -lm";
                if(fixalignment) com = "gcc   "   + " -g -S   -DC64CG "+(AsmLink.gcenable?"-DBOEHM":"")+"  -w  "  + " " + infile+".c "+AsmLink.rtl+" " + AsmLink.libs+ " -lm";
                System.out.println(com);
                Process p = sys.exec(com);
                StreamGobbler errorGobbler = new
                StreamGobbler(p.getErrorStream(), "ERROR");
                // any output?
                StreamGobbler outputGobbler = new
                StreamGobbler(p.getInputStream(), "OUTPUT");
                // kick them off
                errorGobbler.start();
                outputGobbler.start();
                if(p.waitFor() == 0)
                    {
                        if(fixalignment)
                            {
                                AlignmentFixer AF=new AlignmentFixer();
                                AF.map("p.o.s","p.o.f.s");
                                String com2 = "gcc   "   + " -g    -DC64CG "+(AsmLink.gcenable?"-DBOEHM":"")+"  -w -o " + ofile + " " +  "p.o.f.s "+AsmLink.rtl+" " + AsmLink.libs+ " -lm";
                                System.out.println(com2);
                                Process p2 = sys.exec(com2);
                                StreamGobbler errorGobbler2 = new
                                StreamGobbler(p2.getErrorStream(), "ERROR");
                                // any output?
                                StreamGobbler outputGobbler2 = new
                                StreamGobbler(p2.getInputStream(), "OUTPUT");
                                // kick them off
                                errorGobbler2.start();
                                outputGobbler2.start();
                                if(p2.waitFor() == 0)
                                    {
                                        return true;
                                    }
                            }
                        else return true;
                    }
            }
        catch(Exception ep)
            {
                System.err.println(ep);
            }
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  symbol  Description of the Parameter
     */
    public void defineSymbol(String symbol)
    {
        //buf.writeln(".set "+symbol+",YES");
        buf.writeln("#define "+symbol + " 1");
    }
    int nesting=0;
    // over ride the standard one
    public boolean codeGen(Node n)
    {
        if(nesting==0)
            {
                n=	outputdatadecls(n,false);
            }
        nesting++;
        boolean ok=super.codeGen(n);
        nesting--;
        return ok;
    }
    Editbuffer newebuf()
    {
        return new Editbuffer();
    }
    /**
     *  This is the asm command that can be used by other ia32 family processors
     *
     *@param  infile  Description of Parameter
     *@param  ofile   Description of Parameter
     *@return         Description of the Returned Value
     */
    public static boolean sassemble(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                BufferedReader di = new BufferedReader(new FileReader(infile));
                C64CG cc=new C64CG();
                C64CG.Editbuffer e=  cc.newebuf();
                e.rppair(" .space 256","//");
                String s;
                for(s=di.readLine(); s!=null; s=di.readLine())
                    {
                        e.writeln(s);
                        //System.out.println(s);
                    }
                di.close();
                PrintWriter pr=new PrintWriter(new FileOutputStream(ofile+".c"));
                e.flush(pr);
                pr.close();
                return true;
                /*	String com = "cp " + infile + " " + ofile+".c";
                	System.out.println(com);
                	Process p = sys.exec(com);
                	StreamGobbler errorGobbler = new
                			StreamGobbler(p.getErrorStream(), "ERROR");

                	// any output?
                	StreamGobbler outputGobbler = new
                			StreamGobbler(p.getInputStream(), "OUTPUT");

                	// kick them off
                	errorGobbler.start();
                	outputGobbler.start();

                	if (p.waitFor() == 0) {
                		return true;
                	}*/
            }
        catch(Exception ep)
            {
                System.err.println(ep);
            }
        return false;
    }
}

