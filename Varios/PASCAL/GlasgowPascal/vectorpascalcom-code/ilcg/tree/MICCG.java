/*
\begin{verbatim}
*/

package ilcg.tree;

/**
 *  Description of the Class Code Generator for Xeon PHi
 *
 *@author     Paul Cockshot
 *@created    July 2013
 */
public class MICCG extends MIC
{
    public Register getSP()
    {
        return regRSP;
    }
    public Node getStack()
    {
        return regmainSTACK;
    }


    public MICCG()
    {
        super();
        buf = new MICPeep();//RollBackBuffer();
        hasGather=true;
        this.verbose = true;
        optset();
        enableTransforms();
    }
    void optset()
    {
        optimisationLevel=subExpressionOptimise  |optimisationLevel ;
    }
    /**
     *  Overide this to provide the XMM parallelism
     *
     *@param  elementType  Description of Parameter
     *@return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        optset();
        if(elementType.equals(Node.int32))
            {
                return 1;// careful not to make this 16 as it will cause the k regs to be treated as potential integer registers
            }
        if(elementType.equals(Node.int16))
            {
                return 1;
            }
        if(elementType.equals(Node.int8))
            {
                return 1;
            }
        if(elementType.equals(Node.uint32))
            {
                return 1;
            }
        if(elementType.equals(Node.uint16))
            {
                return 1;
            }
        if(elementType.equals(Node.uint8))
            {
                return 64;
            }
        if(elementType.equals(Node.int64))return 1;
        if(elementType.equals(Node.ieee64)) return 1;
        if(elementType.equals(Node.ieee32))return 16;
        return 1;
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

    // Opteron CG tail file for the gnu assembler

    public String globalDirective()
    {
        return ".global";
    }
    public String sectionDirective()
    {
        return " ";
    }
    public String directivePrefix()
    {
        return ".";
    }
    public String macrofile()
    {
        return "MICmacros.s";
    }

    public void reservebytes(int bytes)
    {
        if(bytes>0)
            buf.writeln(" .space "+bytes +", ' '");
    }
    public String externDirective()
    {
        return ".extern ";
    }
    public String prelude()
    {
        return " .intel_syntax noprefix\n";
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
                Procedure proc = (Procedure)(((Function) m.oper).proc);
                Node address=(((Function) m.oper).address);
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
                else if(proc.isImported)
                    {
                        // External C runtime procedure
                        int intuse = 0;
                        int floatuse = 0;
                        if(!proc.argsPushedLeftToRight)
                            {
                                for(int i = 0; i < argc; i++)
                                    {
                                        Node n = params.argi(i);
                                        String rt = n.returnType();
                                        if(rt.equals(Node.ieee32))
                                            {
                                                switch(floatuse)
                                                    {
                                                    case 0:
                                                        // Arg needs to be placed in XMM0
                                                        pushlist = new Statement(new Assign(regfXMM0,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 1:
                                                        // Arg needs to be placed in XMM1
                                                        pushlist = new Statement(new Assign(regfXMM1,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 2:
                                                        // Arg needs to be placed in XMM2
                                                        pushlist = new Statement(new Assign(regfXMM2,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 3:
                                                        // Arg needs to be placed in XMM3
                                                        pushlist = new Statement(new Assign(regfXMM3,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 4:
                                                        // Arg needs to be placed in XMM4
                                                        pushlist = new Statement(new Assign(regfXMM4,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 5:
                                                        // Arg needs to be placed in XMM5
                                                        pushlist = new Statement(new Assign(regfXMM5,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    default:
                                                        // Put on the stack
                                                        pushlist = new Statement(pushit(params.argi(i)),pushlist);
                                                        break;
                                                    }
                                            }
                                        else if(rt.equals(Node.ieee64))
                                            {
                                                switch(floatuse)
                                                    {
                                                    case 0:
                                                        // Arg needs to be placed in XMM0
                                                        pushlist = new Statement(new Assign(regdXMM0,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 1:
                                                        // Arg needs to be placed in XMM1
                                                        pushlist = new Statement(new Assign(regdXMM1,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 2:
                                                        // Arg needs to be placed in XMM2
                                                        pushlist = new Statement(new Assign(regdXMM2,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 3:
                                                        // Arg needs to be placed in XMM3
                                                        pushlist = new Statement(new Assign(regdXMM3,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 4:
                                                        // Arg needs to be placed in XMM4
                                                        pushlist = new Statement(new Assign(regdXMM4,n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 5:
                                                        // Arg needs to be placed in XMM5
                                                        pushlist = new Statement(new Assign(regdXMM5, n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    default:
                                                        // Put on the stack
                                                        pushlist = new Statement(pushit(params.argi(i)),pushlist);
                                                        break;
                                                    }
                                            }
                                        else
                                            {
                                                switch(intuse)
                                                    {
                                                    case 0:
                                                        // Arg needs to be placed in the RDI
                                                        pushlist = new Statement(new Assign(regRDI,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 1:
                                                        // Arg needs to be placed in the RSI
                                                        pushlist = new Statement(new Assign(regRSI,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 2:
                                                        // Arg needs to be placed in the RDX
                                                        pushlist = new Statement(new Assign(regRDX,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 3:
                                                        // Arg needs to be placed in the RCX
                                                        pushlist = new Statement(new Assign(regRCX,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 4:
                                                        // Arg needs to be placed in the R8
                                                        pushlist = new Statement(new Assign(regR8,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 5:
                                                        // Arg needs to be placed in the R9
                                                        pushlist = new Statement(new Assign(regR9,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    default:
                                                        pushlist = new Statement(pushit(params.argi(i)),pushlist);
                                                        break;
                                                    }
                                            }
                                    }
                            }
                        else
                            {
                                for(int i = argc - 1; i >= 0; i--)
                                    {
                                        Node n = params.argi(i);
                                        String rt = n.returnType();
                                        if(rt.equals(Node.ieee32) || rt.equals(Node.ieee64))
                                            {
                                                switch(floatuse)
                                                    {
                                                    case 0:
                                                        // Arg 1 needs to be placed in XMM0
                                                        pushlist = new Statement(new Assign(regdXMM0,new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 1:
                                                        // Arg 2 needs to be placed in XMM1
                                                        pushlist = new Statement(new Assign(regdXMM1,new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 2:
                                                        // Arg 3 needs to be placed in XMM2
                                                        pushlist = new Statement(new Assign(regdXMM2,new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 3:
                                                        // Arg 4 needs to be placed in XMM3
                                                        pushlist = new Statement(new Assign(regdXMM3,new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 4:
                                                        // Arg 5 needs to be placed in XMM4
                                                        pushlist = new Statement(new Assign(regdXMM4,new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 5:
                                                        // Arg 6 needs to be placed in XMM5
                                                        pushlist = new Statement(new Assign(regdXMM5,new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    default:
                                                        // Put on the stack
                                                        pushlist = new Statement(pushit(params.argi(i)),pushlist);
                                                        break;
                                                    }
                                            }
                                        else
                                            {
                                                switch(intuse)
                                                    {
                                                    case 0:
                                                        // Arg 1 needs to be placed in the RDI
                                                        pushlist = new Statement(new Assign(regRDI,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 1:
                                                        // Arg 2 needs to be placed in the RSI
                                                        pushlist = new Statement(new Assign(regRSI,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 2:
                                                        // Arg 3 needs to be placed in the RDX
                                                        pushlist = new Statement(new Assign(regRDX,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 3:
                                                        // Arg 4 needs to be placed in the RCX
                                                        pushlist = new Statement(new Assign(regRCX,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 4:
                                                        // Arg 5 needs to be placed in the R8
                                                        pushlist = new Statement(new Assign(regR8,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 5:
                                                        // Arg 6 needs to be placed in the R9
                                                        pushlist = new Statement(new Assign(regR9,new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    default:
                                                        // All others on the stack
                                                        pushlist = new Statement(pushit(params.argi(i)),pushlist);
                                                        break;
                                                    }
                                            }
                                    }
                            }
                    }
                else
                    {
                        // Vector pascal procedure
                        if(!proc.argsPushedLeftToRight)
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
                    }
                boolean ok = codeGen(pushlist);
                if(proc==null)   // procedure variable call
                    {
                        codeGen(new Assign(regRAX,new Cast("int64",address)));
                        //buf.writeln(";"+address);
                        buf.writeln("  call rax");
                    }
                else
                    {
                        if(proc.isImported)
                            {
                                codeGen(new ImpLabel(procprefix + proc.name));
                                buf.writeln(" call " + procprefix + proc.name + ";#imported");
                            }
                        else
                            {
                                buf.writeln(" call " + proc.getStartAddressLabel());
                            }
                        if(!proc.calleePopsArgs)
                            {
                                if(spchange!=0)buf.writeln(" add rsp, " + spchange+"");
                            }
                    }
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println(eee);
                if(verbose) eee.printStackTrace();
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
                if(nt.equals(Node.ieee32))
                    {
                        n = new Statement(new Assign(regfXMM0,  n));
                    }
                else if(nt.equals(Node.ieee64))
                    {
                        n = new Statement(new Assign(regdXMM0,  n));
                    }
                else if(nt.equals(Node.int8))
                    {
                        n= new Statement(new Assign(regRAX,new Int(0,Node.int64)),
                                         new Statement(new Assign(regAL,n)));
                    }
                else if(nt.equals(Node.uint8))
                    {
                        n= new Statement(new Assign(reguRAX,new Int(0,Node.uint64)),
                                         new Statement(new Assign(reguAL,n)));
                    }
                else if(nt.equals(Node.octet))
                    {
                        n= new Statement(new Assign(regRAX,new Int(0,Node.int64)),
                                         new Statement(new Assign(regoAL,n)));
                    }
                else if(nt.equals(Node.int16))
                    {
                        n= new Statement(new Assign(regRAX,new Int(0,Node.int64)),
                                         new Statement(new Assign(regAX,new Cast(nt,n))));
                    }
                else if(nt.equals(Node.uint16))
                    {
                        n= new Statement(new Assign(reguRAX,new Int(0,Node.uint64)),
                                         new Statement(new Assign(reguAX,new Cast(nt,n))));
                    }
                else if(nt.equals(Node.uint32))
                    {
                        n = new Statement(new Assign(reguRAX, new Int(0,Node.uint64)),
                                          new Statement(new Assign(reguEAX, new Cast(nt,n))));
                    }
                else if(nt.equals(Node.int32))
                    {
                        n = new Statement(new Assign(regRAX, new Int(0,Node.int64)),
                                          new Statement(new Assign(regEAX, new Cast(nt,n))));
                    }
                else
                    {
                        n = new Assign(regRAX, new Cast("int64",n));
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
        Node res = new Deref(regRAX);
        if(t.equals(Node.ieee32))
            {
                res = new Deref(regfXMM0);
            }
        else if(t.equals(Node.ieee64))
            {
                res = new Deref(regdXMM0);
            }
        else if(t.equals(Node.int8)||t.equals(Node.uint8)||t.equals(Node.octet))
            {
                res=new Deref(regoAL);
            }
        if(t.equals(Node.int16)||t.equals(Node.uint16)||t.equals(Node.halfword))
            {
                res=new Deref(regAX);
            }
        if(t.equals(Node.int32)||t.equals(Node.uint32)||t.equals(Node.word))
            {
                res = new Deref(regEAX);
            }
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
        optset() ;// do this because use of k registers only works with at least sub expression optimisation
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
    public Node pushit(Node n) throws Exception
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
        String it = Node.int64;
        Node typedSP = new Cast("ref " + it, regRSP);
        int aligned=len;
        if((aligned %8) !=0)aligned+=(8-(aligned%8));
        //buf.writeln("; push value of length "+len);
        Node res =
            (Node) new Statement(
                new Assign(regRSP,
                           new Dyad(new Deref(typedSP), new Int(-aligned), "+")
                          ),
                new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + rt), n), new Statement())
            )
            ;
        if(len == 8) res= (Node) new Push(regmainSTACK, n.eval());
        // the code to update the sp has to be here as the pushit function is recursive
        // we must thus use the sp value at the start of the routine as what we increment
        if(len < 4)
            {
                len = 4;
            }
        spchange = aligned + oldsp;
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
        w.buf.writeln(" .text  "+
                      "\n; #procedure generated by code generator "+w.getClass()
                     );
        if(p.isExported)
            {
                //w.buf.writeln("\tEXPORT "+procprefix+name);   // only use export for dlls
                w.exportLabel(new ExtLabel(procprefix + name));
            }
        //if(p.name=="_main")buf.writeln("..start:");
        w.buf.writeln(p.getStartAddressLabel() + ":");
        Label tempstart=new Label();
        Label temprestart =null;
        if(p.isExported)
            {
                w.buf.writeln(procprefix + name + ":");
            }
        else
            {
                w.buf.writeln("#;\t " + name);
            }
        if(p instanceof Unit)
            {
                w.buf.writeln("# entering a unit at lexical level "+p.lexLevel);
                w.buf.writeln(name + ":");
                w.buf.writeln(" enter  0," + p.lexLevel);
            }
        else
            {
                w.buf.writeln("# entering a procedure at lexical level "+p.lexLevel);
                temprestart =new Label();
                w.buf.writeln(" jmp "+tempstart);
                w.buf.writeln(temprestart + ":");
            }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" call unit$" + p.toCall[ui]);
                    }
                w.buf.writeln("cmp byte ptr[" + name + "ready],1\n jnz " + name + "init\n jmp " + name+suffix + "exit");
                w.buf.writeln(name + "init:mov byte ptr[" + name + "ready],1");
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        int reserve;
        w.buf.writeln("  spacefor" + p.name +suffix+ " = " + (reserve=Math.abs(p.alloc.getLimit())));
        w.buf.writeln(name+suffix + "exit:");
        w.buf.writeln(" leave\n ret " + (p.calleePopsArgs ? p.paramspace : 0));
        w.buf.writeln(tempstart+":");
        if(reserve > 65000)
            {
                System.err.println("\nProcedure "+name+
                                   " has too many local variables for the allowed stack frame size ,"+
                                   " \nthey should occupy less than 65KB but are actually "+reserve +" bytes."+
                                   " \nRewrite your application to use explicit heap variables.");
                return false;
            }
        w.buf.writeln(" enter "+((16+reserve)&0xfff0)+","+p.lexLevel);
        if(temprestart!=null)w.buf.writeln(" jmp "+temprestart);
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t .bss");
                w.buf.writeln("\t.align 64");
                if(reserve>0)
                    w.buf.writeln("\t.space "+reserve);
                w.buf.writeln("\t.align 64");
                w.buf.writeln(((Unit) p).getBase()+":");
            }
        else if(p.lexLevel==0)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t .bss");
                w.buf.writeln("\t.align 64");
                if(reserve>0)
                    w.buf.writeln("\t.space "+reserve);
                w.buf.writeln("\t.align 64");
                w.buf.writeln("PmainBase:");
            }/*
		if (p instanceof Unit) {

			// plant the data decls for the unit
			w.buf.writeln("\t.SECTION .bss");
			w.buf.writeln("\t.align 16");
			w.buf.writeln("resb spacefor" + p.name+suffix);
			w.buf.writeln("\t.align 16");
			w.buf.writeln(((Unit) p).getBase()+":");
		//	w.codeGen(((Unit) p).getBase());
		}else if(p.lexLevel==0)
		{
			// plant the data decls for the unit
			w.buf.writeln("\t.SECTION .bss");

			w.buf.writeln("\t.align 16");
			w.buf.writeln("resb spacefor" + p.name+suffix);
			w.buf.writeln("\t.align 16");
			w.buf.writeln("PmainBase:");

		}*/
        if(p.toCall != null)
            {
                w.buf.writeln("\t .data");
                w.buf.writeln(name + "ready: .byte  0");
                w.buf.writeln(".align 64");
                //	w.buf.writeln(name + "ready dd 0");
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
    public static boolean slinka(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "mic-gcc -g -lm  -o " + ofile + " " + infile + AsmLink.libs;
                if(AsmLink.gcenable)com=com+" "+AsmLink.gc+" "+AsmLink.rtlb;
                else com= com+ " " + AsmLink.rtl;
                System.out.println(com);
                Process p = sys.exec(com);
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




    public static boolean slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "mic-gcc -g -lm -o " + ofile + " " + infile + AsmLink.libs;
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
        //  buf.writeln("#define "+symbol+" 1");
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
                String com = "mic-as " +    " -march=k1om -mmnemonic=intel -msyntax=intel  -g -o " + ofile + " " + infile;
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
/*
\end{verbatim}
*/
