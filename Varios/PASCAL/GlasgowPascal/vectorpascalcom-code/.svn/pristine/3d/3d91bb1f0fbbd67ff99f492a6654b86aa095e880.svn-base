package ilcg.tree;

/**
 * Description of the Class
 *
 * @author wpc
 * @created 30 July 2001
 */
public class EECG extends EE
{
    private int reserved_space_above_fp,
            reserved_space_below_fp,
            max_param_space;
    private boolean abi_printed = false;
    /**
     * Create a pentium code generator and overide the rollback buffer with an
     * intel peephole optimizer
     */
    public EECG()
    {
        buf = new gnuIntelPeep();
    }

    /**
     * Override the standard match method to ensure that alignment rules are
     * obeyed
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
                        if((len = Format.lengthInBits(Format.typeDeref(r.returnType()))) == 32)
                            {
                                //	System.out.println(n.toString());
                            }
                    }
            }
        return innermatch(n);
    }

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
     * @param elementType
     *            Description of Parameter
     * @return The parallelism value
     */
    public int getParallelism(String elementType)
    {
        if(elementType.equals(Node.int32))
            {
                return 4;
            }
        if(elementType.equals(Node.int16))
            {
                return 8;
            }
        if(elementType.equals(Node.int8))
            {
                return 16;
            }
        if(elementType.equals(Node.uint32))
            {
                return 4;
            }
        if(elementType.equals(Node.uint16))
            {
                return 8;
            }
        if(elementType.equals(Node.uint8))
            {
                return 16;
            }
        if(elementType.equals(Node.ieee32))
            {
                return 4;
            }
        return 1;
    }

    // 486 CG tail file for the gnu assembler

    public String globalDirective()
    {
        return ".globl";
    }

    public String sectionDirective()
    {
        return "";
    }

    public String directivePrefix()
    {
        return ".";
    }

    public String macrofile()
    {
        return "";
    }

    public void reservebytes(int bytes)
    {
        buf.writeln(" .space " + bytes + ", ' '");
    }

    public String externDirective()
    {
        return ".extern ";
    }

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
                    len += (4 - (len % 4));
                param_space += len;
            }
        return param_space;
    }

    /**
     * Implements procedure call
     *
     * @param m
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public boolean cgApply(Monad m)
    {
        if(countReservations() > 0)
            return false;// call may corrupt regs
        // the code generator should try again with no
        // reservations
        try
            {
                Procedure proc = (Procedure)(((Function) m.oper).proc);
                Cartesian params = (Cartesian) m.arg;
                Statement pushlist = new Statement();
                int argc = params.argc();
                spchange = 0;
                int param_space = getParamSpace(params);
                if(param_space > max_param_space)
                    max_param_space = param_space;
                boolean ok = false;
                boolean arg1_real = false;
                //System.out.println("\nname : " + proc.name);
                //System.out.println("isImported : " + proc.isImported);
                if(proc.isImported)
                    {
                        Node[] dests = { regA0, regA1, regA2, regA3 };
                        Node[] dests64 = { regi64A0, regi64A1, regi64A2, regi64A3 };
                        Node[] fdests = { regFPR12, regFPR14 };
                        int regs_used = 0;
                        int args_done = 0;
                        // try put first 4 parameters into the argument registers
                        while((args_done < argc) && (regs_used < 4))
                            {
                                Node a = params.argi(args_done);
                                String pt = a.returnType();
                                if(pt.equals(Node.ieee32))
                                    {
                                        int up_to = 2;
                                        // only assign arg 2 to a floating point register
                                        // if arg 1 was a float
                                        if(args_done == 0)
                                            {
                                                arg1_real = true;
                                            }
                                        else
                                            {
                                                if(!arg1_real)
                                                    up_to = 1;
                                            }
                                        if(regs_used < up_to)
                                            {
                                                pushlist = new Statement(new Assign(fdests[regs_used], a), pushlist);
                                            }
                                        else
                                            {
                                                a = new Cast(Node.int32, a);
                                                pushlist = new Statement(new Assign(dests[regs_used], a), pushlist);
                                            }
                                        regs_used++;
                                        args_done++;
                                    }
                                else
                                    {
                                        if(Format.lengthInBytes(pt) == 8)
                                            {
                                                // can load a double into an even register, but not an odd one
                                                if((regs_used % 2) == 0)
                                                    {
                                                        a = new Cast(Node.int64, a);
                                                        pushlist = new Statement(new Assign(dests64[regs_used], a), pushlist);
                                                        regs_used+= 2;
                                                        args_done++;
                                                    }
                                                else
                                                    {
                                                        regs_used++;
                                                    }
                                            }
                                        else
                                            {
                                                if(Format.lengthInBytes(pt) < 4)
                                                    {
                                                        a = new Cast(Node.int32, a);
                                                    }
                                                pushlist = new Statement(new Assign(dests[regs_used], a), pushlist);
                                                regs_used++;
                                                args_done++;
                                            }
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
                                                    offset_from_sp += (8 - (offset_from_sp % 8));
                                            }
                                        if(len < 4)
                                            len = 4;
                                        pushlist = new Statement(pushit(params.argi(i), offset_from_sp), pushlist);
                                        offset_from_sp += len;
                                    }
                            }
                        ok = codeGen(pushlist);
                        codeGen(new ImpLabel(procprefix + proc.name));
                        buf.writeln(" jal " + procprefix + proc.name + "#imported");
                    }
                else
                    {
                        if(!proc.argsPushedLeftToRight)
                            {
                                int offset_from_sp = 0;
                                for(int i = 0; i < argc; i++)
                                    {
                                        Node n = params.argi(i);
                                        String rt = n.returnType();
                                        int len = Format.lengthInBytes(rt);
                                        if(len < 4)
                                            len = 4;
                                        pushlist = new Statement(pushit(params.argi(i), offset_from_sp), pushlist);
                                        offset_from_sp += len;
                                    }
                            }
                        else
                            {
                                int offset_from_sp = 0;
                                for(int i = argc - 1; i >= 0; i--)
                                    {
                                        Node n = params.argi(i);
                                        String rt = n.returnType();
                                        int len = Format.lengthInBytes(rt);
                                        if(len < 4)
                                            len = 4;
                                        pushlist = new Statement(pushit(params.argi(i), offset_from_sp), pushlist);
                                        offset_from_sp += len;
                                    }
                            }
                        ok = codeGen(pushlist);
                        buf.writeln(" jal " + proc.getStartAddressLabel());
                    }
                /*if (!proc.calleePopsArgs)
                {
                    if (spchange != 0)
                        buf.writeln(" add  $sp , " + spchange);
                }*/
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println(eee);
                return false;
            }
    }

    /**
     * * handles function return code
     *
     * @param r
     *            Return node
     * @return Description of the Returned Value
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
                    n = new Assign(regFPR0, n);
                else
                    n = new Assign(regV0, new Cast(Node.int64, n));
                if(verbose)
                    dlog("return " + n);
                return codeGen(new Statement(n, null));
            }
        catch(Exception e)
            {
                System.out.println("whilst generating return statement got \n" + e + "\n for " + r);
                return false;
            }
    }

    /**
     * Description of the Method
     *
     * @param t
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public Node functionRetReg(String t)
    {
        Node res = new Deref(regV0);
        if(t.equals("ieee32"))
            res = new Deref(regFPR0);
        return new Cast(t, res);
    }

    /**
     * produces entry and exit sequence for pascal procedures
     *
     * @param p
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public boolean cgProcedure(Procedure p)
    {
        return scgProcedure(p, this);
    }

    /**
     * Invoke the linker on a file.
     *
     * @param infile
     *            Description of Parameter
     * @param ofile
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public boolean link(String infile, String ofile)
    {
        return slink(infile, ofile);
    }

    /**
     * Invoke the assembler on a file.
     *
     * @param infile
     *            Description of Parameter
     * @param ofile
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public boolean assemble(String infile, String ofile)
    {
        return sassemble(infile, ofile);
    }

    /**
     * push a param on stack
     *
     * @param n
     *            node to go on stack
     * @return Description of the Returned Value
     * @exception Exception
     *                Description of Exception
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
        Node typedSP = new Cast("ref " + it, regeSP);
        int aligned = len;
        if((aligned % 4) != 0)
            aligned += (4 - (aligned % 4));
        Node res = (Node) new Statement(new Assign(new Memref(new Dyad(new Deref(typedSP), new Int(sp_offset), "+"), "ref " + rt), n), new Statement());
        /*Node res = (len != 4 ?
        	(Node) new Statement(new Assign(regeSP, new Dyad(new Deref(typedSP), new Int(-aligned), "+")), new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + rt), n), new Statement()))
        	: (rt.equals("ieee32") && n instanceof Real
        		? pushit(new Int(Float.floatToIntBits(((Real) n).floatValue())))
        		: (Node) new Push(regmainSTACK, n.eval()))
        );*/
        //System.out.println("push it : " + res);
        // the code to update the sp has to be here as the pushit function is
        // recursive
        // we must thus use the sp value at the start of the routine as what we
        // increment
        if(len < 4)
            {
                len = 4;
            }
        spchange = len + oldsp;
        return res;
    }

    private void makeStackSpace()
    {
        makeStackSpace(4);
    }

    private void makeStackSpace(int space)
    {
        reserved_space_below_fp += space;
    }

    private void call(RollBackBuffer buf)
    {
        //makeStackSpace();
        reserved_space_above_fp += 4;
        buf.writeln("sw $31, -" + reserved_space_above_fp + "($sp)");
    }

    private void enter(int space, int level, RollBackBuffer buf)
    {
        // push FP
        //makeStackSpace();
        reserved_space_above_fp += 4;
        buf.writeln("sw " + FP + ", -" + reserved_space_above_fp + "($sp)");
        // frame_ptr <- sp - 8 (This is where the new frame pointer will point to
        buf.writeln("addi $8, $sp, -" + reserved_space_above_fp);
        // at this point the offset from sp to fp is known to be 0
        reserved_space_below_fp = 0;
        if(level > 0)
            {
                int fp_offset = 0;
                for(int i = (level - 1); i > 0; i--)
                    {
                        // push -4(FP)
                        makeStackSpace();
                        fp_offset -= 4;
                        buf.writeln("lw $9," + fp_offset + "(" + FP + ")");
                        int offset = reserved_space_above_fp + reserved_space_below_fp;
                        buf.writeln("sw $9,-" + offset + "($sp)");
                    }
                // store the new frame pointer so that chld procedures copying the
                // display from this one will have the frame pointer of this method
                makeStackSpace();
                int offset = reserved_space_above_fp + reserved_space_below_fp;
                buf.writeln("sw $8,-" + offset + "($sp)");
            }
        // move FP to the new frame base pointer
        //buf.writeln("move " + FP + ",$8");
        buf.writeln("move " + FP + ", $8");
        if(space != 0)
            {
                makeStackSpace(space);
            }
    }

    private void leave(RollBackBuffer buf)
    {
        // restore SP back to FP
        buf.writeln("move $sp, " + FP + "");
        // restore FP back to saved FP
        buf.writeln("lw " + FP + ", 0($sp)");
        // pop FP off stack (BUG IN ENTER???)
        buf.writeln("addu $sp, 4");
    }

    private void ret(RollBackBuffer buf)
    {
        // restore return address from top of stack
        buf.writeln("lw $31, 0($sp)");
        buf.writeln("addu $sp, 4");
        buf.writeln("j $31");
    }

    Variable getVar(Register reg, Procedure p) throws Exception
    {
        return new Variable(reg.width / 8, reg.width / 8, p.alloc, Format.typeDeref(reg.rt), reg.rt, regBP, p.lexLevel, false, Format.int32);
    }

    Register[] changedRegisters()
    {
        Register[] regs = new Register[]
        {
            regiRR16,
            regiRR17,
            regiRR18,
            regiRR19,
            regiRR20,
            regiRR21,
            regiRR22,/*,
			regi64RR23	// don't include this right now, its reserved for the FP
			*/
            regGP,
            regrealFP,
            regFPR20,
            regFPR22,
            regFPR24,
            regFPR26,
            regFPR28,
            regFPR30,
        };
        return regs;
    }

    static int suffixes = 0;

    /**
     * Description of the Method
     *
     * @param p
     *            Description of Parameter
     * @param w
     *            Description of Parameter
     * @return Description of the Returned Value
     *
     */

    public boolean scgProcedure(Procedure p, Walker w)
    {
        reserved_space_above_fp = 0;
        max_param_space = 0;
        if(!abi_printed)
            {
                buf.writeln("\t.abicalls");
                abi_printed = true;
            }
        String name = p.name;
        String suffix = "l" + suffixes;
        suffixes++;
        if(p.isImported)
            {
                w.buf.writeln("\t.extern " + procprefix + name);
                // import directive not supported by gas
                //if (p.lib != null) {
                //	w.buf.writeln("\tIMPORT " + procprefix + name + " " + p.lib);
                //}
                // this jump is needed in case we have a local label for the
                // procedure
                // it ensures that a call to the local label is redirected to the
                // procedure
                //buf.writeln(p.getStartAddressLabel()+":");
                //buf.writeln("\tjmp "+name);
                return true;
            }
        w.buf.writeln(".text\n.align 3  " + "\n; #procedure generated by code generator " + w.getClass());
        if(p.isExported)
            {
                //w.buf.writeln("\tEXPORT "+procprefix+name); // only use export
                // for dlls
                w.exportLabel(new ExtLabel(procprefix + name));
            }
        if(p.lexLevel == 0)
            {
                w.buf.writeln("\t.ent " + procprefix + name);
                w.buf.writeln(procprefix + name + ":");
            }
        else
            {
                w.buf.writeln("\t.ent " + p.getStartAddressLabel());
                w.buf.writeln(p.getStartAddressLabel() + ":");
            }
        if(p.isExported)
            {
                // only write the procedure label if it wasn't printed above
                if(p.lexLevel != 0)
                    {
                        w.buf.writeln(procprefix + name + ":");
                    }
            }
        else
            {
                w.buf.writeln("\t #" + name);
            }
        w.buf.writeln(".set noreorder\n.cpload $25\n.set reorder");
        call(buf);
        if(p instanceof Unit)
            {
                w.buf.writeln(";# entering a unit at lexical level " + p.lexLevel);
                //w.buf.writeln(name + ":");
                enter(0, p.lexLevel, w.buf);
            }
        else
            {
                w.buf.writeln(";# entering a procedure at lexical level " + p.lexLevel);
                enter(0, p.lexLevel, w.buf);
                //w.buf.writeln("lw $9,( $spacefor" + p.name + suffix + " )");
                //w.buf.writeln("sub $sp,$sp,$9");
            }
        //Node var = new Memref(new Deref(regeSP), "ref int32");
        //String restore_regs = "";
        boolean res = false;
        Statement stmt2 = null;
        Variable gp_var = null;
        int reserve = 0;
        try
            {
                int register_save_mark = w.buf.mark();
                //gp_var = getVar(regGP, p);
                /*Node store_block = new Block(new Statement(
                	new Assign(gp_var, regGP),
                	new Statement(
                		p.getSubtree(),
                		new Statement(
                			new Assign(regGP, gp_var),
                			null)
                		)
                	), p.alloc);*/
                Node store_block = new Block(new Statement(
                                                 p.getSubtree(), null)
                                             , p.alloc);
                res = w.codegen(store_block);
                Statement stmt = null;
                Register[] regs = changedRegisters();
                for(int i = 0; i < regs.length; i++)
                    {
                        Variable variable = getVar(regs[i], p);
                        if(regs[i] == regGP)
                            {
                                gp_var = variable;
                            }
                        else
                            {
                                stmt = new Statement(new Assign(variable, new Deref(regs[i])), stmt);
                                stmt2 = new Statement(new Assign(regs[i], new Deref(variable)), stmt2);
                            }
                    }
                String[] prev = w.buf.sequester(register_save_mark);
                res = w.codegen(stmt);
                reserve = Math.abs(p.alloc.getLimit()) + reserved_space_below_fp;
                if((reserve % 16) != 0)
                    {
                        reserve += 16 - (reserve % 16);
                    }
                // lower 16 bytes reserved for use by the next procedure to save parameters
                if((max_param_space % 16) != 0)
                    {
                        max_param_space += 16 - (max_param_space % 16);
                    }
                // reserved 16 extra bytes to be sure that procedures
                // called don't overwrite this space
                reserve += 16;
                reserve += max_param_space;
                w.buf.writeln("addi $sp, $sp, -" + reserve);
                // set the fp to be at the same position as the sp
                w.buf.writeln("move $fp, $sp");
                w.buf.writeln(".cprestore " + (reserve + 32 + (gp_var != null ? gp_var.offset - reserved_space_above_fp: 0)));
                if(p.toCall != null)
                    {
                        for(int ui = 0; ui < p.toCall.length; ui++)
                            {
                                w.buf.writeln(" jal unit$" + p.toCall[ui]);
                            }
                        w.buf.writeln("lb $9,(" + name + "ready)\n beq $0, $9, " + name + "init\n j " + name + suffix + "exit");
                        w.buf.writeln(name + "init:");
                        w.buf.writeln(" li $2,1\n sb $2, " + name + "ready");
                    }
                w.buf.append(prev);
            }
        catch(Exception e)
            {
                e.printStackTrace();
            }
        w.buf.writeln(name + suffix + "exit:");
        w.codegen(stmt2);
        leave(buf);
        ret(buf);
        if(p.lexLevel == 0)
            {
                w.buf.writeln("\t.end " + procprefix + name);
            }
        else
            {
                w.buf.writeln("\t.end " + p.getStartAddressLabel());
            }
        w.buf.writeln("\t.data");
        //w.buf.writeln("$spacefor" + p.name + suffix + ": .word " + reserve);
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t.bss");
                w.buf.writeln("\t.align 3");
                w.buf.writeln("\t.space " + reserve);
                w.buf.writeln("\t.align 3");
                w.codeGen(((Unit) p).getBase());
            }
        else if(p.lexLevel == 0)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t.bss");
                w.buf.writeln("\t.align 3");
                w.buf.writeln("\t.space " + reserve);
                w.buf.writeln("\t.align 3");
                w.buf.writeln("PmainBase:");
            }
        if(p.toCall != null)
            {
                w.buf.writeln("\t.data");
                w.buf.writeln(name + "ready: .byte  0");
            }
        return res;
    }

    /**
     * This is the link command that can be used by other ia32 family processors
     *
     * @param infile
     *            Description of Parameter
     * @param ofile
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public static boolean slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "ee-gcc -o " + ofile + " " + infile + AsmLink.libs;
                if(AsmLink.gcenable)
                    com = com + " "/* +AsmLink.gc */+ " " + AsmLink.rtlb;
                else
                    com = com + " " + "\"" + AsmLink.rtl + "\"";
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

    public void defineSymbol(String symbol)
    {
        buf.writeln(symbol + ":\n.equ " + symbol + " , 1");
    }

    /**
     * This is the asm command that can be used by other ia32 family processors
     *
     * @param infile
     *            Description of Parameter
     * @param ofile
     *            Description of Parameter
     * @return Description of the Returned Value
     */
    public static boolean sassemble(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "ee-as  -a=asm.lst  -m5900 -o " + ofile + " " + infile;
                //String com = "mipsEEel-linux-as";
                System.out.println(com);
                Process p = sys.exec(com);
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
