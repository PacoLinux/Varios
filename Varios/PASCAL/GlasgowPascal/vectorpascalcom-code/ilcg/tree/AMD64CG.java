/*
\begin{verbatim}
*/

package ilcg.tree;

/**
 *  Description of the Class
 *
 *@author     Iain Jackson
 *@created    January 2004
 */
public class AMD64CG extends AMD64
{
    public Register getSP()
    {
        return regRSP;
    }
    public Node getStack()
    {
        return regmainSTACK;
    }


    public AMD64CG()
    {
        super();
        buf = new IntelPeep();
        this.verbose = true;
    }

    /**
     *  Overide this to provide the XMM parallelism
     *
     *@param  elementType  Description of Parameter
     *@return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        if(elementType.equals(Node.int32)) return 2;
        if(elementType.equals(Node.int16)) return 4;
        if(elementType.equals(Node.int8)) return 8;
        if(elementType.equals(Node.uint32)) return 1;
        if(elementType.equals(Node.uint16)) return 4;
        if(elementType.equals(Node.uint8)) return 8;
        if(elementType.equals(Node.ieee32))return 4;
        if(elementType.equals(Node.ieee64))return 2;
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
        return "global";
    }
    public String sectionDirective()
    {
        return "section";
    }
    public String directivePrefix()
    {
        return "%";
    }
    public String macrofile()
    {
        return "AMD64macros.asm";
    }

    public void reservebytes(int bytes)
    {
        if(bytes>0)
            buf.writeln(" times "+bytes +" db ' '");
    }
    public String externDirective()
    {
        return "extern ";
    }
    Register book(Register r)
    {
        reserve(r);
        return r;
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
                                                        pushlist = new Statement(new Assign(book(regXMM00),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 1:
                                                        // Arg needs to be placed in XMM1
                                                        pushlist = new Statement(new Assign(book(regXMM10),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 2:
                                                        // Arg needs to be placed in XMM2
                                                        pushlist = new Statement(new Assign(book(regXMM20),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 3:
                                                        // Arg needs to be placed in XMM3
                                                        pushlist = new Statement(new Assign(book(regXMM30),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 4:
                                                        // Arg needs to be placed in XMM4
                                                        pushlist = new Statement(new Assign(book(regXMM40),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 5:
                                                        // Arg needs to be placed in XMM5
                                                        pushlist = new Statement(new Assign(book(regXMM50),n),pushlist);
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
                                                        pushlist = new Statement(new Assign(book(regXMM0R64),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 1:
                                                        // Arg needs to be placed in XMM1
                                                        pushlist = new Statement(new Assign(book(regXMM1R64),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 2:
                                                        // Arg needs to be placed in XMM2
                                                        pushlist = new Statement(new Assign(book(regXMM2R64),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 3:
                                                        // Arg needs to be placed in XMM3
                                                        pushlist = new Statement(new Assign(book(regXMM3R64),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 4:
                                                        // Arg needs to be placed in XMM4
                                                        pushlist = new Statement(new Assign(book(regXMM4R64),n),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 5:
                                                        // Arg needs to be placed in XMM5
                                                        pushlist = new Statement(new Assign(book(regXMM5R64), n),pushlist);
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
                                                        pushlist = new Statement(new Assign(book(regRDI),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 1:
                                                        // Arg needs to be placed in the RSI
                                                        pushlist = new Statement(new Assign(book(regRSI),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 2:
                                                        // Arg needs to be placed in the RDX
                                                        pushlist = new Statement(new Assign(book(regRDX),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 3:
                                                        // Arg needs to be placed in the RCX
                                                        pushlist = new Statement(new Assign(book(regRCX),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 4:
                                                        // Arg needs to be placed in the R8
                                                        pushlist = new Statement(new Assign(book(regR8),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 5:
                                                        // Arg needs to be placed in the R9
                                                        pushlist = new Statement(new Assign(book(regR9),new Cast(Node.int64,n)),pushlist);
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
                                                        pushlist = new Statement(new Assign(book(regXMM0R64),new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 1:
                                                        // Arg 2 needs to be placed in XMM1
                                                        pushlist = new Statement(new Assign(book(regXMM1R64),new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 2:
                                                        // Arg 3 needs to be placed in XMM2
                                                        pushlist = new Statement(new Assign(book(regXMM2R64),new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 3:
                                                        // Arg 4 needs to be placed in XMM3
                                                        pushlist = new Statement(new Assign(book(regXMM3R64),new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 4:
                                                        // Arg 5 needs to be placed in XMM4
                                                        pushlist = new Statement(new Assign(book(regXMM4R64),new Cast(Node.ieee64,n)),pushlist);
                                                        floatuse++;
                                                        break;
                                                    case 5:
                                                        // Arg 6 needs to be placed in XMM5
                                                        pushlist = new Statement(new Assign(book(regXMM5R64),new Cast(Node.ieee64,n)),pushlist);
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
                                                        pushlist = new Statement(new Assign(book(regRDI),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 1:
                                                        // Arg 2 needs to be placed in the RSI
                                                        pushlist = new Statement(new Assign(book(regRSI),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 2:
                                                        // Arg 3 needs to be placed in the RDX
                                                        pushlist = new Statement(new Assign(book(regRDX),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 3:
                                                        // Arg 4 needs to be placed in the RCX
                                                        pushlist = new Statement(new Assign(book(regRCX),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 4:
                                                        // Arg 5 needs to be placed in the R8
                                                        pushlist = new Statement(new Assign(book(regR8),new Cast(Node.int64,n)),pushlist);
                                                        intuse++;
                                                        break;
                                                    case 5:
                                                        // Arg 6 needs to be placed in the R9
                                                        pushlist = new Statement(new Assign(book(regR9),new Cast(Node.int64,n)),pushlist);
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
                if((spchange %16)>0)
                    {
                        // stack will not be 16 byte aligned
                        int discrepancy =16-( spchange %16);
                        buf.writeln("sub rsp,"+discrepancy);
                        spchange+= discrepancy;
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
/** True if the processor ABI supports call by register */
	public boolean ABIsupportsCallByRegister(){return true;}
	/** returns the ith parameter register of given format **/
	public Register ithParamOfFormat (int i,String format){ 
	    
		if (format.equals("int32")){return int32regs[i];
		}
		if (format.equals("ieee32")){return ieee32regs[i];
		}
		if (format.equals("ieee64")){return ieee64regs[i];
		}
		return otherregs[i];
		 }
    Register [] ieee32regs = {regXMM00,regXMM10,regXMM20,regXMM30,regXMM40,regXMM50};
    Register [] ieee64regs = {regXMM0R64,regXMM1R64,regXMM2R64,regXMM3R64,regXMM4R64,regXMM5R64};
    Register [] int32regs={regEDI,regESI,regEDX,regECX,regR8D,regR9D};
    Register [] otherregs={regRDI,regRSI,regRDX,regRCX,regR8,regR9};
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
                        n = new Statement(new Assign(regXMM00,  n));
                    }
                else if(nt.equals(Node.ieee64))
                    {
                        n = new Statement(new Assign(regXMM0R64,  n));
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
                res = new Deref(regXMM00);
            }
        else if(t.equals(Node.ieee64))
            {
                res = new Deref(regXMM0R64);
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
        buf.writeln("; push value of length "+len);
        String nrt=rt;
        if(Format.isInteger(rt))nrt=Node.int64;
        Node res =
            (Node) new Statement(
                new Assign(regRSP,
                           new Dyad(new Deref(typedSP), new Int(-aligned), "+")
                          ),
                new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + nrt), new Cast(nrt,n)), new Statement())
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
                w.buf.writeln("\textern " + procprefix + name);
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
        w.buf.writeln("section .text  "+
                      "\n; #procedure generated by code generator "+w.getClass()
                     );
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
                w.buf.writeln(";\t " + name);
            }
        if(p instanceof Unit)
            {
                w.buf.writeln("; entering a unit at lexical level "+p.lexLevel);
                w.buf.writeln(name + ":");
                w.buf.writeln(" enter  0," + p.lexLevel);
            }
        else
            {
                w.buf.writeln("; entering a procedure at lexical level "+p.lexLevel);
                if(Math.abs(p.alloc.getLimit())>127)
                    {
                        w.buf.writeln(" enter   0" +","+p.lexLevel);
                        w.buf.writeln(" sub rsp,((spacefor"+ p.name+suffix+")+16)"/* + "-4*" + p.lexLevel*/);
                    }
                else   w.buf.writeln(" enter ((spacefor"+p.name+suffix + "-8*" + p.lexLevel+")+16),"+p.lexLevel);
                w.buf.writeln(" and rsp,$0fffffffffffffff0");
            }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" call unit$" + p.toCall[ui]);
                    }
                w.buf.writeln("lea r8 ,[rel " + name + "ready]\ncmp byte[r8],1\n jnz " + name + "init\n jmp " + name+suffix + "exit");
                w.buf.writeln(name + "init:mov byte[r8],1");
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        int reserve;
        w.buf.writeln("  spacefor" + p.name +suffix+ " equ " + (reserve=(8+Math.abs(p.alloc.getLimit()))&(-1^7)));
        w.buf.writeln(name+suffix + "exit:");
        w.buf.writeln("leave\n ret $" + (p.calleePopsArgs ? p.paramspace : 0));
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\tSECTION .bss");
                w.buf.writeln("\talignb 16");
                w.buf.writeln("resb spacefor" + p.name+suffix);
                w.buf.writeln("\talignb 16");
                w.buf.writeln(((Unit) p).getBase()+":");
                //	w.codeGen(((Unit) p).getBase());
            }
        else if(p.lexLevel==0)
            {
                // plant the data decls for the unit
                w.buf.writeln("\tSECTION .bss");
                w.buf.writeln("\talignb 16");
                w.buf.writeln("resb spacefor" + p.name+suffix);
                w.buf.writeln("\talignb 16");
                w.buf.writeln("PmainBase:");
            }
        if(p.toCall != null)
            {
                w.buf.writeln("\tSECTION .data");
                w.buf.writeln(name + "ready dd 0");
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
                String com = "gcc -g -no-pie -lm  -o " + ofile + " " + infile + AsmLink.libs;
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
                String com = "gcc -g -no-pie -lm -o " + ofile + " " + infile + AsmLink.libs;
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
        buf.writeln("%define "+symbol+" 1");
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
                String com = "nasm " +    "-f elf64 -lasm.lst  -g -o " + ofile + " " + infile;
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
