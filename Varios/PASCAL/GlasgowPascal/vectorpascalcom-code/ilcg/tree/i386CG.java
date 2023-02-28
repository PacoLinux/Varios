package ilcg.tree;
/**
 *  A class that overides the automatically produced class IA32 and code
 *  generates code for the basic ia32 architecture with a FPU but not MMX
 *  extensions. It requires gcc and nasmw as linker and assembler to be
 *  installed
 *
 *@author     wpc
 *@created    June 21, 2001
 */

public class i386CG extends i386
{


    /**
     *  Create a pentium code generator and overide the rollback buffer with an
     *  intel peephole optimizer
     */
    public i386CG()
    {
        buf = new IntelPeep();
    }


    /**
     *  Overide this to provide the mmx parallelism
     *
     *@param  elementType  Description of Parameter
     *@return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        if(elementType.equals(Node.int32))
            {
                return 2;
            }
        if(elementType.equals(Node.int16))
            {
                return 4;
            }
        if(elementType.equals(Node.int8))
            {
                return 8;
            }
        if(elementType.equals(Node.uint32))
            {
                return 2;
            }
        if(elementType.equals(Node.uint16))
            {
                return 4;
            }
        if(elementType.equals(Node.uint8))
            {
                return 8;
            }
        return 1;
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
                Cartesian params = (Cartesian) m.arg;
                Statement pushlist = new Statement();
                int argc = params.argc();
                spchange = 0;
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
                boolean ok = codeGen(pushlist);
                if(proc.isImported)
                    {
                        codeGen(new ImpLabel(procprefix + proc.name));
                        buf.writeln(" call " + procprefix + proc.name + "; imported");
                    }
                else
                    {
                        buf.writeln(" call " + proc.getStartAddressLabel());
                    }
                if(!proc.calleePopsArgs)
                    {
                        if(spchange!=0)buf.writeln(" add esp, " + spchange);
                    }
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println(eee);
                return false;
            }
    }


    /**
     *  handles function return code
     *
     *@param  r  Description of Parameter
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
                else if(nt.equals(Node.int8)||nt.equals(Node.uint8)||nt.equals(Node.octet))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(regAL,n)));
                    }
                else if(nt.equals(Node.int16)||nt.equals(Node.uint16)||nt.equals(Node.halfword))
                    {
                        n= new Statement(new Assign(regEAX,new Int(0,Node.int32)),
                                         new Statement(new Assign(regAX,new Cast(nt,n))));
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
        if(t.equals(Node.int8)||t.equals(Node.uint8)||t.equals(Node.octet)) res=new Deref(regAL);
        if(t.equals(Node.int16)||t.equals(Node.uint16)||t.equals(Node.halfword)) res=new Deref(regAX);
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
        if(verbose)
            {
                dlog("pushit " + n);
            }
        String rt = n.returnType();
        int oldsp = spchange;
        int len = Format.lengthInBytes(rt);
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
                w.buf.writeln("\tEXTERN " + procprefix + name);
                if(p.lib != null)
                    {
                        w.buf.writeln("\tIMPORT " + procprefix + name + " " + p.lib);
                    }
                // this jump is needed in case we have a local label for the procedure
                // it ensures that a call to the local label is redirected to the procedure
                //buf.writeln(p.getStartAddressLabel()+":");
                //buf.writeln("\tjmp "+name);
                return true;
            }
        w.buf.writeln("section .text  "+
                      "\n; procedure generated by code generator "+w.getClass()+
                      "\n; Walker version "+WalkerVer.VERSION);
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
                        w.buf.writeln(" sub esp,spacefor"+ p.name+suffix/* + "-4*" + p.lexLevel*/);
                    }
                else   w.buf.writeln(" enter spacefor"+p.name+suffix + "-4*" + p.lexLevel+","+p.lexLevel);
            }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" call unit$" + p.toCall[ui]);
                    }
                w.buf.writeln("cmp byte[" + name + "ready],1\n jnz " + name + "init\n jmp " + name+suffix + "exit");
                w.buf.writeln(name + "init:mov byte[" + name + "ready],1");
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        w.buf.writeln("spacefor" + p.name +suffix+ " equ " + Math.abs(p.alloc.getLimit()));
        w.buf.writeln(name+suffix + "exit:");
        w.buf.writeln("leave\n ret " + (p.calleePopsArgs ? p.paramspace : 0));
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\tSECTION .bss");
                w.buf.writeln("\talignb 16");
                w.buf.writeln("resb spacefor" + p.name+suffix);
                w.buf.writeln("\talignb 16");
                w.codeGen(((Unit) p).getBase());
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
    public static boolean slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "gcc -g -o " + ofile + " " + infile + AsmLink.libs;
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
                String com = "nasm -f" + AsmLink.objectformat + " -lasm.lst  -g -o " + ofile + " " + infile;
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
}
