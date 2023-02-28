package ilcg.tree;

import java.util.Vector;

/**
 * Description of the Class
 *
 * @author     wpc
 * @created    30 July 2001
 */
public class PcodeCG extends Pcode
{



    /**
     * Create a pentium code generator and overide the rollback buffer with an
     * intel peephole optimizer
     */
    public PcodeCG()
    {
        buf = new gnuIntelPeep();
    }





    /**
     * Overide this to provide the mmx parallelism
     *
     * @param  elementType  Description of Parameter
     * @return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        if(elementType.equals(Node.int32))
            {
                return 1;
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
                return 1;
            }
        if(elementType.equals(Node.ieee32))
            {
                return 1;
            }
        return 1;
    }


    // 486 CG tail file for the gnu assembler

    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String globalDirective()
    {
        return ".globl";
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String sectionDirective()
    {
        return "";
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String directivePrefix()
    {
        return ".";
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String macrofile()
    {
        return "";
    }


    /**
     *  Description of the Method
     *
     * @param  bytes  Description of the Parameter
     */
    public void reservebytes(int bytes)
    {
        buf.writeln(" .space " + bytes + ", ' '");
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String externDirective()
    {
        return ".extern ";
    }


    /**
     *  Gets the paramSpace attribute of the NIOSCG object
     *
     * @param  params         Description of the Parameter
     * @return                The paramSpace value
     * @exception  Exception  Description of the Exception
     */
    public int getParamSpace(Cartesian params) throws Exception
    {
        int param_space = 0;
        int argc = params.argc();
        for(int i = 0; i < argc; i++)
            {
                Node n = params.argi(i);
                String rt = n.returnType();
                int len = Format.lengthInBytes(rt);
                if((len % 4) != 0)
                    {
                        len += (4 - (len % 4));
                    }
                param_space += len;
            }
        return param_space;
    }

    /**
     * Implements procedure call it has to handle the conventions of the ABI of the machine
     *
     * @param  m  this is passed a function applied to a list of params
     * @return    Description of the Returned Value
     */
    public boolean cgApply(Monad m)
    {
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
                if(proc.isImported)
                    {
                        codeGen(new ImpLabel(procprefix + proc.name));
                        buf.writeln(" call " + procprefix + proc.name);
                    }
                else
                    {
                        buf.writeln(" call " + proc.getStartAddressLabel());
                    }
                if(proc==null||!proc.calleePopsArgs)
                    {
                        if(spchange!=0)buf.writeln(" incsp " + spchange);
                    }
                reserve(regGP);
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println("whilst generating code for function application "+eee);
                return false;
            }
    }
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

    /**
     * * handles function return code
     *
     * @param  r  Return node
     * @return    Description of the Returned Value
     */
    public boolean cgReturn(Return r)
    {
        return true;
    }


    /**
     * Description of the Method
     *
     * @param  t  Description of Parameter
     * @return    Description of the Returned Value
     */
    public Node functionRetReg(String t)
    {
        Node res = new Deref(regGP);
        if(t.equals(Node.ieee32))
            {
                res = new Deref(regfGP);
            }
        if(t.equals(Node.ieee64))
            {
                res = new Deref(regGPD);
            }
        return new Cast(t, res);
    }
    public static boolean scgProcedure(Procedure p, Walker w)
    {
        String name = p.name;
        int stacksafety=16;
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
                w.buf.writeln(name + ":");
                w.buf.writeln("enter  $0,$" + p.lexLevel);
            }
        else
            {
                w.buf.writeln("enter spacefor"+p.name+suffix + "-4*" + p.lexLevel+","+p.lexLevel);
            }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" call unit$" + p.toCall[ui]);
                    }
                w.buf.writeln("loadlitl  " + name + "ready\nmloadb\niftrue " + name + "init\ngoto " + name+suffix + "exit");
                w.buf.writeln(name + "init:loadlitl " + name + "ready\nloadlitb 1\nvstoreb");
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        int reserve;
        w.buf.writeln("spacefor" + p.name +suffix+ " = " + (reserve=Math.abs(p.alloc.getLimit())));
        w.buf.writeln(name+suffix + "exit:");
        w.buf.writeln("\tleave\n ret");
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
     * produces entry and exit sequence for pascal procedures
     *
     * @param  p  Description of Parameter
     * @return    Description of the Returned Value
     */
    public boolean cgProcedure(Procedure p)
    {
        return scgProcedure(p, this);
    }


    /**
     * Invoke the linker on a file.
     *
     * @param  infile  Description of Parameter
     * @param  ofile   Description of Parameter
     * @return         Description of the Returned Value
     */
    public boolean link(String infile, String ofile)
    {
        return slink(infile, ofile);
    }


    /**
     * Invoke the assembler on a file.
     *
     * @param  infile  Description of Parameter
     * @param  ofile   Description of Parameter
     * @return         Description of the Returned Value
     */
    public boolean assemble(String infile, String ofile)
    {
        return sassemble(infile, ofile);
    }










    /**
     *  Description of the Method
     *
     * @param  space  Description of the Parameter
     * @param  level  Description of the Parameter
     * @param  buf    Description of the Parameter
     */
    private void enter(int space, int level, RollBackBuffer buf)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  buf  Description of the Parameter
     */
    private void leave(RollBackBuffer buf)
    {
    }


    /**
     *  Description of the Method
     *
     * @param  buf  Description of the Parameter
     */
    private void ret(RollBackBuffer buf)
    {
        buf.writeln("ret");
    }




    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    Register[] changedRegisters()
    {
        Register[] regs = new Register[]
        {
            //	regR16, regR17, regR18, regR19, regR20, regR21, regR22,
            /*
             *  ,
             *  regi64RR23	// don't include this right now, its reserved for the FP
             */
            regGP
        };
        return regs;
    }


    static int suffixes = 0;





    /**
     * This is the link command that can be used by other ia32 family processors
     *
     * @param  infile  Description of Parameter
     * @param  ofile   Description of Parameter
     * @return         Description of the Returned Value
     */
    public static boolean slink(String infile, String ofile)
    {
        return true;
    }


    /**
     *  Description of the Method
     *
     * @param  symbol  Description of the Parameter
     */
    public void defineSymbol(String symbol)
    {
        buf.writeln(symbol + ":\n.equ " + symbol + " , 1");
    }


    /**
     * This is the asm command that can be used by other ia32 family processors
     *
     * @param  infile  Description of Parameter
     * @param  ofile   Description of Parameter
     * @return         Description of the Returned Value
     */
    public static boolean sassemble(String infile, String ofile)
    {
        return true;
    }

}

