package ilcg.tree;

import java.util.Vector;

/**
 * Description of the Class
 *
 * @author     wpc
 * @created    30 July 2001
 *  updated to arm64  Aug 2022
 */
public class ARMCG extends ARM
{
    static final int stride =8;
    private int reserved_space_above_fp,
            reserved_space_below_fp,
            max_param_space;
    private boolean abi_printed = false;


    public ARMCG()
    {
        buf = new RollBackBuffer();
        regFP=regX29;
        commentprefix="//";
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
     * Override the standard match method to ensure that alignment rules are
     * obeyed
     *
     * @param  n              Description of the Parameter
     * @return                Description of the Return Value
     * @exception  Exception  Description of the Exception
     */
    public boolean match(Node n) throws Exception
    {
        if(n instanceof Assign)
            {
                Assign a = (Assign) n;
                if(a.dest instanceof Register && ismemderef(a.src))
                    {
                        Register r = (Register) a.dest;
                        int len;
                        if((len = Format.lengthInBits(Format.typeDeref(r.returnType())))
                                == 32)
                            {
                                // System.out.println(n.toString());
                            }
                    }
            }
        return innermatch(n);
    }


    /**
     *  Description of the Method
     *
     * @param  n  Description of the Parameter
     * @return    Description of the Return Value
     */
    boolean ismemderef(Node n)
    {
        if(n instanceof Deref)
            {
                Deref d = (Deref) n;
                Node n2 = decast(d.arg);
                return n2 instanceof Memref;
            }
        return false;
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
        return ".global";
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
                if((len % stride) != 0)
                    {
                        len += (stride - (len % stride));
                    }
                param_space += len;
            }
        return param_space;
    }


    /**
     * This function works to ensure that all arguments are either
     *32 bit constants, or 32 bit memory references.
     *if they are expressions then they have to be forced into memory
     *
     * @param  p  cartesian of parameters
     * @return    cartesian of 32 bit params all of which are in memory
     */
    Cartesian storefilter(Cartesian p) throws Exception
    {
        Vector q = new Vector();
        for(int i = 0; i < p.argc(); i++)
            {
                Node n = flushtomem(p.argi(i));
                int bytes = Format.lengthInBytes(n.returnType());
                int words = bytes / stride + ((bytes % stride) != 0 ? 1 : 0);
                if(words == 1)
                    {
                        q.add(n);
                    }
                else
                    {
                        for(int j = 0; j < words; j++)
                            {
                                q.add(
                                    new Deref(
                                        new Memref(
                                            new Dyad(new Int(j), addrof(n), "+"),
                                            Node.int32),
                                        Node.int32));
                            }
                    }
            }
        return new Cartesian(q);
    }


    /**
     * Implements procedure call it has to handle the conventions of the ABI of the machine
     *
     * @param  m  this is passed a function applied to a list of params
     * @return    Description of the Returned Value
     */
    public boolean cgApply(Monad m)
    {
        dlog("apply "+m);
        if(countReservations() > 0)
            {
                return false;
            }
        int resmark = ressp;
        // call may corrupt regs
        // the code generator should try again with no
        // reservations
        try
            {
                Procedure proc = (Procedure)(((Function) m.oper).proc);
                Cartesian params = (Cartesian) m.arg;
                try
                    {
                        //	params = storefilter(params);
                    }
                catch(Exception e)
                    {
                        System.out.println("In ARMCG store filter fails \n"+e);
                        return false;
                    }
                Statement pushlist = new Statement();
                int argc = params.argc();
                spchange = 0;
                int param_space = getParamSpace(params);
                if(param_space > max_param_space)
                    {
                        max_param_space = param_space;
                    }
                boolean ok = false;
                boolean arg1_real = false;
                dlog("\nname : " + proc.name);
                dlog("isImported : " + proc.isImported);
                if(proc.isImported)
                    {
                        Node[] dests = {regX0, regX1, regX2, regX3, regX4, regX5,regX6, regX7};
                        Node[]ddests = {regD0, regD1, regD2, regD3};
                        int regs_used = 0;
                        int dregs_used = 0;
                        int args_done = 0;
                        // try put first 8 parameters into the argument registers
                        try
                            {
                                while((args_done < argc) && (regs_used < 8)&& (dregs_used <4))
                                    {
                                        Node a = params.argi(args_done);
                                        String pt = a.returnType();
                                        dlog("pasparam "+a);
                                        if(pt .equals("ieee64")||pt. equals("ieee32"))
                                            {
                                                pushlist = new Statement(new Assign(ddests[dregs_used], a),
                                                                         pushlist);
                                                reserve(ddests[dregs_used]);
                                                dregs_used++;
                                                args_done++;
                                            }
                                        else
                                            {
                                                a = new Cast(Node.int64, a);
                                                pushlist = new Statement(new Assign(dests[regs_used], a),
                                                                         pushlist);
                                                reserve(dests[regs_used]);
                                                regs_used++;
                                                args_done++;
                                            }
                                    }
                                if(argc > args_done)
                                    {
                                        int offset_from_sp = 16;
                                        for(int i = argc - 1; i >= args_done; i--)
                                            {
                                                Node n = params.argi(i);
                                                String rt = n.returnType();
                                                int len = Format.lengthInBytes(rt);
                                                if(len == 8)
                                                    {
                                                        if((offset_from_sp % 8) != 0)
                                                            {
                                                                offset_from_sp += (8 - (offset_from_sp % 8));
                                                            }
                                                    }
                                                if(len < stride)
                                                    {
                                                        len = stride;
                                                    }
                                                pushlist = new Statement(
                                                    pushit(params.argi(i), offset_from_sp), pushlist);
                                                offset_from_sp += len;
                                            }
                                    }
                                dlog("pushlist for external call ="+pushlist);
                                ok = codeGen(pushlist);
                                codeGen(new ImpLabel(procprefix + proc.name));
                                buf.writeln("bl " + procprefix + proc.name + " ");
                            }
                        catch(Exception e3)
                            {
                                dlog("whilst applying got "+e3);
                            }
                    }
                else
                    {
                        if(!proc.argsPushedLeftToRight)
                            {
                                dlog("push right to left");
                                for (int i = 0; i < argc; i++)
                                    {
                                        pushlist = new Statement(pushit(params.argi(i)), pushlist);
                                    }
                            }
                        else
                            {
                                for (int i = argc - 1; i >= 0; i--)
                                    {
                                        pushlist = new Statement(pushit(params.argi(i)), pushlist);
                                    }
                            }
                        dlog("pushlist ="+pushlist);
                        ok = codeGen(pushlist);
                        buf.writeln("bl " + proc.getStartAddressLabel());
                    }
                if (!proc.calleePopsArgs)
                    {
                        if (spchange != 0)
                            // R13 is stack pointer
                            ok = ok && codeGen(new Assign(regRSP,new Dyad(new Deref(regRSP),new Int(spchange),"+")));
                    }
                rollBackReservations(resmark);
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println(eee);
                return false;
            }
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
        Node n2;
        String rt = n.returnType();
        int oldsp = spchange;
        int len = Format.lengthInBytes(rt);
        n2=n;
        Node decn = decast(n);
        if((decn  instanceof Memref)&&Format.isVector(rt))
            {
                Memref dn = (Memref)decn;
                int l=Format.getVectorTypeLength(dn.returnType());
                n2= new Cast(Format.typeDeref(dn.returnType()),new Deref(dn));
            }
        else
            //if(  Format.isVector(rt)){
            //   int l = Format.lengthInBytes( decn.returnType());
            //    n2= new Cast( Format.makeVectorType( "int8", l), (decn));
            //}
            if (verbose)
                {
                    dlog("pushit " + n);
                    dlog("could have "+n2);
                    dlog("type="+rt);
                    dlog("length "+len);
                }
        String it = Node.int32;
        Node typedSP = new Cast("ref " + it, regRSP);
        int aligned=len;
        if((aligned %stride) !=0)aligned+=(stride-(aligned%stride));
        Node stackassignment =new Assign(new Memref(new Deref(regRSP), "ref " + n2.returnType()), n2);
        Node res = (len != stride ?
                    (Node) new Statement(
                        new Assign(regRSP,
                                   new Dyad(new Deref(regRSP), new Int(-aligned), "+")
                                  ),
                        new Statement(stackassignment, new Statement())
                    )
                    :
                    (rt.equals("ieee32") && n instanceof Real ?
                     pushit(new Int(Float.floatToIntBits(((Real) n).floatValue())))
                     : (Node) new Push(regmainSTACK, n.eval())
                    )
                   );
        // the code to update the sp has to be here as the pushit function is recursive
        // we must thus use the sp value at the start of the routine as what we increment
        if (len < stride)
            {
                len = stride;
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
        try
            {
                Node n = r.arg;
                String nt = n.returnType();
                if(verbose)
                    dlog("try to return " + nt);
                if(nt.equals("ieee32"))
                    n= new Assign(regS0,n);
                else if(nt.equals("ieee64"))
                    n= new Assign(regD0,n);
                else
                    n = new Assign(regX0, n);
                if (verbose)
                    {
                        dlog("return " + n);
                    }
                if(! codeGen(new Statement(n, null)))return false;
                // if floats copy them into the return regs required by ABI
                 
                 
                return true;
            }
        catch(Exception e)
            {
                System.out.println(
                    "whilst generating return statement got \n" + e + "\n for "
                    + r);
                return false;
            }
    }


    /**
    * Description of the Method
    *
    * @param  t  Description of Parameter
    * @return    Description of the Returned Value
    */
    public Node functionRetReg(String t)
    {
        Node res = new Deref(regX0);
        return new Cast(t, res);
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
    * push a param on stack
    *
    * @param  n              node to go on stack
    * @param  sp_offset      Description of the Parameter
    * @return                Description of the Returned Value
    * @exception  Exception  Description of Exception
    */
    Node pushit(Node n, int sp_offset) throws Exception
    {
        String rt = n.returnType();
        int oldsp = spchange;
        int len = Format.lengthInBytes(rt);
        if(verbose)
            {
                dlog("pushit " + n);
                dlog("type=" + rt);
                dlog("length " + len);
            }
        String it = Node.int32;
        Node typedSP = new Cast("ref " + it, SP);
        int aligned = len;
        if((aligned % stride) != 0)
            {
                aligned += (stride - (aligned % stride));
            }
        Node res = (Node) new Statement(
                       new Assign(
                           new Memref(
                               new Dyad(new Deref(typedSP), new Int(sp_offset),
                                        "+"),
                               "ref " + rt),
                           n),
                       new Statement());
        /*
        *  Node res = (len != 4 ?
        *  (Node) new Statement(new Assign(regeSP, new Dyad(new Deref(typedSP), new Int(-aligned), "+")), new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + rt), n), new Statement()))
        *  : (rt.equals("ieee32") && n instanceof Real
        *  ? pushit(new Int(Float.floatToIntBits(((Real) n).floatValue())))
        *  : (Node) new Push(regmainSTACK, n.eval()))
        *  );
        */
        // System.out.println("push it : " + res);
        // the code to update the sp has to be here as the pushit function is
        // recursive
        // we must thus use the sp value at the start of the routine as what we
        // increment
        if(len < stride)
            {
                len = stride;
            }
        spchange = len + oldsp;
        return res;
    }


    /**
    *  Description of the Method
    */
    private void makeStackSpace()
    {
        makeStackSpace(stride);
    }


    /**
    *  Description of the Method
    *
    * @param  space  Description of the Parameter
    */
    private void makeStackSpace(int space)
    {
        reserved_space_below_fp += space;
    }






    /**
    *  Description of the Method
    *
    * @param  buf  Description of the Parameter
    */
    private void ret(RollBackBuffer buf)
    {
        buf.writeln(" ldw r31, stride(sp) \t# restore return address from top of stack");
        buf.writeln(" addi sp, sp, 8 \t# put back stack pointer to where it was at entry");
        buf.writeln("ret");
    }


    /**
    *  Gets the var attribute of the NIOSCG object
    *
    * @param  reg            Description of the Parameter
    * @param  p              Description of the Parameter
    * @return                The var value
    * @exception  Exception  Description of the Exception
    */
    Variable getVar(Register reg, Procedure p) throws Exception
    {
        return new Variable(reg.width / 8, reg.width / 8, p.alloc,
                            Format.typeDeref(reg.rt), reg.rt, FP, p.lexLevel, false,
                            Format.int32);
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

        };
        return regs;
    }


    static int suffixes = 0;

    static boolean Enter(int space, int level,ARM w)
    {
        Node lev = new Int(level & 31);
        Node one = new Int (1);
        Node regFP=w.regFP;
        Node regRSP=w.regX31;
        w.reserve(w.regX9);
        w.reserve(w.regX10);
        w.buf.writeln("sub  sp, sp, #16\n"+
                      "stp  x30,x29, [sp] \n");
        try
            {
                Node action=
                    new Statement(
                    new Statement(
                        new Assign(w.regX10,new Deref(regRSP)),
                        new Statement(
                            new If(new Dyad( lev,new Int(0),">"),
                                   new For(w.regX9,one,new Dyad(lev,one,"-"),one,
                                           new Statement(
                                               new Assign(regFP,new Dyad(new Deref(regFP),new Int((long)8),"-")),
                                               new Statement( new Push(w.regmainSTACK,new Deref(new Memref(new Deref (regFP),"ref int64"))))))),
                            new Statement(
                                new Assign(regFP,new Deref(w.regX10)),
                                new Statement(
                                    new Assign(regRSP,new Dyad(new Deref(regRSP),new Int(space),"-")))))));
                boolean ok= w.codegen(action);
                w.unreserve(w.regX9);
                w.unreserve(w.regX10);
                return ok;
            }
        catch(Exception e3)
            {
                w.dlog(" "+e3);
                return false;
            }
    }
    static
    boolean Enter(String space, int level,ARM w)
    {
        Node lev = new Int(level & 31);
        Node one = new Int (1);
        Node regFP=w.regFP;
        Node regRSP=w.regRSP;
        w.reserve(w.regX9);
        w.reserve(w.regX10);
        w.buf.writeln(" SUB  sp, sp, #16\n"+
                      " STP  x30,x29, [sp] \n");
        try
            {
                Node action=
                    new Statement(
                    new Statement(
                        new Assign(w.regX10,new Deref(regRSP)),
                        new Statement(
                            new If(new Dyad( lev,new Int(0),">"),
                                   new For(w.regX9,one,new Dyad(lev,one,"-"),one,
                                           new Statement(
                                               new Assign(regFP,new Dyad(new Deref(regFP),new Int((long)8),"-")),
                                               new Statement(
                                                   new Push(w.regmainSTACK,new Deref(new Memref(new Deref (regFP),"ref int64"))))))),
                            new Statement(
                                new Assign(regFP,new Deref(w.regX10)),null
                            ))));
                boolean ok= w.codeGen(action);
                w.buf.writeln("sub "+regRSP+","+regRSP+" ,#("+space+")");
                w.unreserve(w.regX9);
                w.unreserve(w.regX10);
                return ok;
            }
        catch(Exception e3)
            {
                w.dlog(" "+e3);
                return false;
            }
    }
    /**
    * Description of the Method
    *
    * @param  p  Description of Parameter
    * @param  w  Description of Parameter
    * @return    Description of the Returned Value
    */

    public static boolean scgProcedure(Procedure p, ARM w)
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
        w.buf.writeln(" .ltorg\n .text  "+
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
                if (! Enter(0,p.lexLevel,(ARM)w)) return false;
                // w.buf.writeln(" enter  $0,$" + p.lexLevel);
            }
        else
            {
                w.buf.writeln("# entering a procedure at lexical level "+p.lexLevel+"\n  ");
                if(! Enter("spacefor" + p.name +suffix + "-"+stride+"*" + p.lexLevel,p.lexLevel,(ARM)w)) return false;
                if(p.isExported)
                    {
                        //  w.buf.writeln("\tpush %ebx\n\tpush %esi\n\tpush %edi");
                    }
            }
        if(p.toCall != null)
            {
                for(int ui = 0; ui < p.toCall.length; ui++)
                    {
                        w.buf.writeln(" bl unit$" + p.toCall[ui]);
                    }
                w.buf.writeln(" ldr x20," +name + "ready");
                w.buf.writeln(" ldrb w20,[x20]");
                w.buf.writeln(" cmp w20,#0 \n bne " + name + "init\n b " + name+suffix + "exit");
                w.buf.writeln(" mov x21,#1\n strb w21,[x20] "  );
            }
        boolean res = w.codegen(new Block(p.getSubtree(), p.alloc));
        int reserve;
        w.buf.writeln("spacefor" + p.name +suffix+ " = " + (reserve=Math.abs(p.alloc.getLimit())));
        w.buf.writeln(name+suffix + "exit:");
        w.buf.writeln( " MOV "+w.regRSP+","+ w.regFP);
        w.buf.writeln( " LDP  X30,X29, [SP] \n add  SP, SP, #16\n ret X30  ");
        //w.buf.writeln("\tleave\n \tret $" + (p.calleePopsArgs ? p.paramspace : 0));
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t  .bss");
                w.buf.writeln("\t.align "+stride);
                w.buf.writeln("\t.space "+reserve);
                w.buf.writeln("\t.align "+stride);
                w.buf.writeln(" "+((Unit) p).getBase()+":");
            }
        else if(p.lexLevel==0)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t  .bss");
                w.buf.writeln("\t.align "+stride);
                w.buf.writeln("\t.space "+reserve);
                w.buf.writeln("\t.align "+stride);
                w.buf.writeln("PmainBase:");
            }
        if(p.toCall != null)
            {
                w.buf.writeln("\t  .data");
                w.buf.writeln(name + "ready: .byte  0");
            }
        return res;
    }


    /**
    * This is the link command that can be used by other ia32 family processors
    *
    * @param  infile  Description of Parameter
    * @param  ofile   Description of Parameter
    * @return         Description of the Returned Value
    */
    public static boolean slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "gcc " + ofile + " " + infile + AsmLink.libs;
                if(AsmLink.gcenable)
                    {
                        com = com + " "
                              /*
                              *  +AsmLink.gc
                              */
                              + " " + AsmLink.rtlb;
                    }
                else
                    {
                        com = com + " " + "\"" + AsmLink.rtl + "\"";
                    }
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


    /**
     *  Description of the Method
     *
     * @param  symbol  Description of the Parameter
     */
    public void defineSymbol(String symbol)
    {
        buf.writeln(symbol + "s:\n.equ " + symbol + " , 1");
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
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "as  -a=asm.lst    -o " + ofile + " " + infile+" ";
                // String com = "mipsEEel-linux-as";
                System.out.println(com);
                Process p = sys.exec(com);
                // any error message?
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
                ep.printStackTrace();
                System.err.println(ep);
            }
        return false;
    }
}

