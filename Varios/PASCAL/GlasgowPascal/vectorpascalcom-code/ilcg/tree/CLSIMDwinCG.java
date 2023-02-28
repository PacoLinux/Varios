package ilcg.tree;

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    30 July 2001
 */
public class CLSIMDwinCG extends CLSIMDwin
{
    // we keep optimisation at level zero since any register optimisation
    // becomes unsafe is some of the 'instructions' are actually function calls
    public void setOptimisationLevel(int L)
    {
        optimisationLevel = 0;
    }

    /**
     *  Create a pentium code generator and overide the rollback buffer with an
     *  intel peephole optimizer
     */
    public CLSIMDwinCG()
    {
        buf = new gnuIntelPeep();
        ignorepastfailures=true;
    }

    boolean usestackfor(String type)
    {
        if(type.equals(Node.ieee32) || type.equals(Node.ieee64) || type.equals(Node.int64))return true;
        return false;
    }

    /**
     *  Overide this to provide the mmx parallelism
     *
     *@param  elementType  Description of Parameter
     *@return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        if(elementType.equals(Node.int32)) return 4;
        if(elementType.equals(Node.int16)) return 8;
        if(elementType.equals(Node.int8)) return 16;
        if(elementType.equals(Node.uint32)) return 1;
        if(elementType.equals(Node.uint16)) return 8;
        if(elementType.equals(Node.uint8)) return 16;
        if(elementType.equals(Node.ieee32))return Format.getVectorTypeLength(regNV0.returnType());
        if(elementType.equals(Node.ieee64))return 2;
        return 1;
    }



    static int stacksafety = 512; // stack space to use for temporary pushes by main program

    // 486 CG tail file for the gnu assembler

    public String globalDirective()
    {
        return ".global";
    }
    public String sectionDirective()
    {
        return ".section";
    }
    public String directivePrefix()
    {
        return ".";
    }
    public String macrofile()
    {
        return "macros.s";
    }

    public void reservebytes(int bytes)
    {
        buf.writeln(" .space "+bytes +", ' '");
    }
    public String externDirective()
    {
        return ".extern ";
    }

    /**
     *  Implements procedure call
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean cgApply(Monad m)
    {
        if(countReservations()>0) return false;// call may corrupt regs
        // the code generator should try again with no
        // reservations
        try
            {
                Node address=(((Function) m.oper).address);
                Procedure proc = null;
                if(address==null) proc = (Procedure)(((Function) m.oper).proc);
                Cartesian params = (Cartesian) m.arg;
                Statement pushlist = new Statement();
                int argc = params.argc();
                spchange = 0;
                if(proc==null)
                    {
                        for(int i = 0; i < argc; i++)
                            {
                                pushlist = new Statement(pushit(params.argi(i)), pushlist);
                            }
                    }
                else if(!proc.argsPushedLeftToRight)
                    {
                        for(int i = 0; i < argc; i++)
                            {
                                pushlist = new Statement(pushit(params.argi(i)), pushlist);
                            }
                    }
                else
                    {
                        for(int i = argc - 1; i >= 0; i--)
                            {
                                pushlist = new Statement(pushit(params.argi(i)), pushlist);
                            }
                    }
                boolean ok = codeGen(pushlist);
                if(proc==null)   // procedure variable call
                    {
                        codeGen(new Assign(regEAX,new Cast("int32",address)));
                        buf.writeln("  call *%eax");
                    }
                else if(proc.isImported)
                    {
                        codeGen(new ImpLabel(procprefix + proc.name));
                        buf.writeln(" call " + procprefix + proc.name + "#imported");
                    }
                else
                    {
                        buf.writeln(" call " + proc.getStartAddressLabel());
                    }
                if(proc==null||!proc.calleePopsArgs)
                    {
                        if(spchange!=0)buf.writeln(" add  $" + spchange+",%esp");
                    }
                reserve(regEAX);
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println("whilst generating code for function application "+eee);
                return false;
            }
    }


    /**	 *  handles function return code
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
                if(nt.equals(Node.ieee32) | nt.equals(Node.ieee64))
                    {
                        n = (new Push(regST, n));
                    }
                else if(nt.equals(Node.int8))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(regAL,n)));
                    }
                else if(nt.equals(Node.uint8))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(reguAL,n)));
                    }
                else if(nt.equals(Node.octet))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(regoAL,n)));
                    }
                else if(nt.equals(Node.int16))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(regAX,new Cast(nt,n))));
                    }
                else if(nt.equals(Node.uint16))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(reguAX,new Cast(nt,n))));
                    }
                else
                    {
                        n = new Assign(regEAX, new Cast("int32",n));
                    }
                if(verbose)dlog("return "+n);
                return codeGen(new Statement(n, null));
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
        Node res = new Deref(regEAX);
        if(t.equals(Node.ieee32) || t.equals(Node.ieee64))
            {
                res = new Monad(new Op("POP", "ieee32", "ieee32", "ieee32"), regST);
            }
        if(t.equals(Node.int8)||t.equals(Node.uint8)||t.equals(Node.octet))
            res=new Deref(regoAL);
        if(t.equals(Node.int16)||t.equals(Node.uint16)||t.equals(Node.halfword))
            res=new Deref(regAX);
        return new Cast(t, res);
    }



    /**
     *  produces entry and exit sequence for pascal procedures
     *
     *@param  p  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean cgProcedure(Procedure p)
    {
        currentBase=FP;
        if(p instanceof Unit)
            {
                currentBase=((Unit)p).getBase();
            }
        else if(p.lexLevel==0)
            {
                currentBase=new Label("PmainBase");
            }
        //System.out.println("base in prodedure "+p+"\n="+currentBase);
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
        String rt = n.returnType();
        int oldsp = spchange;
        int len = Format.lengthInBytes(rt);
        if(verbose)
            {
                dlog("pushit " + n);
                dlog("type="+rt);
                dlog("length "+len);
            }
        String it = Node.int32;
        Node typedSP = new Cast("ref " + it, regESP);
        int aligned=len;
        if((aligned %4) !=0)aligned+=(4-(aligned%4));
        Node res = (len != 4 ?
                    (Node) new Statement(
                        new Assign(regESP,
                                   new Dyad(new Deref(typedSP), new Int(-aligned), "+")
                                  ),
                        new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + rt), n), new Statement())
                    )
                    :
                    (rt.equals("ieee32") && n instanceof Real ?
                     pushit(new Int(Float.floatToIntBits(((Real) n).floatValue())))
                     : (Node) new Push(regmainSTACK, n.eval())
                    )
                   );
        // the code to update the sp has to be here as the pushit function is recursive
        // we must thus use the sp value at the start of the routine as what we increment
        if(len < 4)
            {
                len = 4;
            }
        spchange = len + oldsp;
        return res;
    }

    static int suffixes=0;
    /**
     *  Description of the Method
     *
     *@param  p  Description of Parameter
     *@param  w  Description of Parameter
     *@return    Description of the Returned Value

     */

    public static boolean scgProcedure(Procedure p, Walker w)
    {
        String name = p.name;
        String suffix= "l"+suffixes;
        suffixes++;
        if(p.isImported)
            {
                w.buf.writeln("\t.extern " + procprefix + name);
                // import directive not supported by gas
                //if (p.lib != null) {
                //	w.buf.writeln("\tIMPORT " + procprefix + name + " " + p.lib);
                //}
                // this jump is needed in case we have a local label for the procedure
                // it ensures that a call to the local label is redirected to the procedure
                //buf.writeln(p.getStartAddressLabel()+":");
                //buf.writeln("\tjmp "+name);
                return true;
            }
        w.buf.writeln(".section .text  "+
                      "\n; #procedure generated by code generator "+w.getClass());
        if(p.isExported)
            {
                //w.buf.writeln("\tEXPORT "+procprefix+name);   // only use export for dlls
                w.exportLabel(new ExtLabel(procprefix + name));
            }
        //if(p.name=="_main")buf.writeln("..start:");
        w.buf.writeln(p.getStartAddressLabel() + ":");
        if(p.isExported)
            {
                w.buf.writeln(procprefix + name + ":");
            }
        else
            {
                w.buf.writeln("#\t " + name);
            }
        if(p instanceof Unit)
            {
                w.buf.writeln("# entering a unit at lexical level "+p.lexLevel);
                w.buf.writeln(name + ":");
                w.buf.writeln(" enter  $0,$" + p.lexLevel);
            }
        else
            {
                w.buf.writeln("# entering a procedure at lexical level "+p.lexLevel);
                if(Math.abs(p.alloc.getLimit())>127)
                    {
                        w.buf.writeln("\tenter   $0" +",$"+p.lexLevel);
                        w.buf.writeln("\tsub $spacefor"+ p.name+suffix+"+  "+(p.lexLevel==0?stacksafety-Math.abs(p.alloc.getLimit()):0)+",%esp"/* + "-4*" + p.lexLevel*/);
                        if(p.lexLevel>0&&(Math.abs(p.alloc.getLimit())>65000))
                            System.out.println(" WARNING: Procedure "+p.name+" uses "+Math.abs(p.alloc.getLimit())+
                                               " bytes of stack space for variables\n this can cause non-deterministic "+
                                               " segment access violations on the stack on some operating systems."+
                                               " It would be a good idea to reduce this by puting large arrays on the heap\n"+
                                               " and initialising them with new(p) ");
                    }
                else   w.buf.writeln("\tenter $spacefor"+p.name+suffix + "-4*" + p.lexLevel+",$"+p.lexLevel);
                if(p.isExported)
                    {
                        w.buf.writeln("\tpush %ebx\n\tpush %esi\n\tpush %edi");
                    }
            }
        {
            w.buf.writeln("\tpush %ebx\n\tpush %esi\n\tpush %edi");
        }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" call unit$" + p.toCall[ui]);
                    }
                w.buf.writeln("cmpb $1," + name + "ready\n jnz " + name + "init\n jmp " + name+suffix + "exit");
                w.buf.writeln(name + "init:movb $1, " + name + "ready");
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        int reserve;
        w.buf.writeln("spacefor" + p.name +suffix+ " = " + (reserve=Math.abs(p.alloc.getLimit())));
        w.buf.writeln(name+suffix + "exit:");
        {
            w.buf.writeln("\tpop %edi\n\tpop %esi\n\tpop %ebx");
        }
        if(p.isExported)
            {
                w.buf.writeln("\tpop %edi\n\tpop %esi\n\tpop %ebx");
            }
        w.buf.writeln("\tleave\n \tret $" + (p.calleePopsArgs ? p.paramspace : 0));
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t.section .bss");
                w.buf.writeln("\t.align 4");
                w.buf.writeln("\t.space "+reserve);
                w.buf.writeln("\t.align 4");
                w.buf.writeln(" "+((Unit) p).getBase()+":");
            }
        else if(p.lexLevel==0)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t.section .bss");
                w.buf.writeln("\t.align 4");
                w.buf.writeln("\t.space "+reserve);
                w.buf.writeln("\t.align 4");
                w.buf.writeln("PmainBase:");
            }
        if(p.toCall != null)
            {
                w.buf.writeln("\t.section .data");
                w.buf.writeln(name + "ready: .byte  0");
            }
        return res;
    }


    /**
     *  This is the link command that can be used by other ia32 family processors
     *
     *@param  infile  Description of Parameter
     *@param  ofile   Description of Parameter
     *@return         Description of the Returned Value
     */
    public static boolean slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "gcc -m32 -msse2 -Wpointer-arith -lglu32  -lOpenCL -Wfloat-equal -g3 -DCLSIMD -o " + ofile + " " + infile + AsmLink.libs;
                if(AsmLink.gcenable)com=com+" "+AsmLink.gc+" "+AsmLink.rtlb;
                else com= com+ " " + AsmLink.rtl;
                //com= "sh -c \""+com+ " \" ";
                com += " -I\"C:\\Program Files\\AMD APP\\/include\" ";
                com += " "+ AsmLink.rtldir +"/clsimd.c";
                String amdapp = System.getenv("AMDAPPSDKROOT");
                com += (" -L\""+amdapp+"/lib/x86\"");
                com="gcc   -m32 -msse2 -Wpointer-arith  -DCLSIMD -Wfloat-equal -g3    -I\""
                    +amdapp+"/include\"     "+AsmLink.rtldir+"/clsimd.c  -o "
                    +ofile+"  -lglu32 -lOpenCL   "+ AsmLink.libs
                    +infile+"  "+AsmLink.rtldir+"/rtl.c";
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
                int code=p.waitFor();
                //System.out.println("code = "+code);
                if(code == 0)
                    {
                        return true;
                    }
            }
        catch(Exception ep)
            {
                System.err.println("Error running gcc "+ep);
            }
        return false;
    }
    public static boolean slinkb(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "gcc -g -m32 -o " + ofile + " " + infile + AsmLink.libs;
                if(AsmLink.gcenable)com=com+" "+AsmLink.gc+" "+AsmLink.rtlb;
                else com= com+ " " + AsmLink.rtl;
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
                        return true;
                    }
            }
        catch(Exception ep)
            {
                System.err.println(ep);
            }
        return false;
    }


    public void defineSymbol(String symbol)
    {
        //buf.writeln(".set "+symbol+",YES");
        buf.writeln(symbol+"=1");
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
                String com =  "as --32  --no-warn -g -o " + ofile + " " + infile;
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
                        return true;
                    }
            }
        catch(Exception ep)
            {
                System.err.println(ep);
            }
        return false;
    }
}
