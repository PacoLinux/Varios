/*
\begin{verbatim}
*/

package ilcg.tree;

/**
 *
 *  A class that overides the automatically produced class PPC and code
 *  generates code for the basic PPC architecture based on the 64-bit
 *  PowerPC ELF ABI supplement 1.9
 *
 *	It requires gcc and gas as linker and assembler to be installed.
 *
 */

public class CELLCG extends PPC
{

    /**
     *  Create a PowerPC code generator
     */
    private int maxParamSpace = 0;
    private int frameSize = 0;
    int resevedRegs = 0;
    public CELLCG()
    {
        //new IntelPeep();
        buf = new RollBackBuffer();
        // To give registers names instead of only numbers
        redefineIntReg(buf);
        ignorepastfailures = true;
    }

    /**
     * Stack frame variables
     */

//	private int localArea=0;
//	private int displayArea=0;
//	private int paramArea=0;
//	private const int linkageArea=48;	// The 48 bytes for bach chain + return address CR + TOC + 16 free
//	private int nonVolatileGPRs= 0;		// volatile GPRs used by callee
//	private int nonVolatileFPRs= 0;		// volatile FPRs used by callee
//	private const int ParamArea=64;
    private static int offsetFromSP = 0;

    // # of integer arguments' regs r3 - SP0
//	private const int noIntParamRegs = 8;
//	private const Node[] idests = { regR3, regR4, regR5, regR6, regR7, regR8, regR9, regR10};
//	private int iregs_used = 0;

    // # of real arguments' regs f1 - f13
//	private	const int noRealParamRegs = 13;
//	private	const Node[] rdests = { regF1, regF2, regF3, regF4, regF5, regF6, regF7, regF8,
//									regF9, regF10, regF11, regF12, regF13 };
//	private int rregs_used = 0;

    /**
     *  Gets parallelism
     *
     *@param  elementType  Description of Parameter
     *@return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        /**
         * if (elementType.equals(Node.int32)) {
        		return 1;
        	}
        	if (elementType.equals(Node.int16)) {
        		return 1;
        	}
        	if (elementType.equals(Node.int8)) {
        		return 1;
        	}
        	if (elementType.equals(Node.uint32)) {
        		return 1;
        	}
        	if (elementType.equals(Node.uint16)) {
        		return 1;
        	}
        	if (elementType.equals(Node.uint8)) {
        		return 1;

        	}
        */
        if(elementType.equals(Node.ieee32))
            return 1024;
        return 1;
    }

    /**
    * Overloaded functions for PowerPC
    *
    **/



    public String getAddressType()
    {
        return Node.int32;
    }

    public int getAddressLenInBytes()
    {
        return 4;
    }

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
        return "PPCmacros.s";
    }

    public void reservebytes(int bytes)
    {
        buf.writeln(" .space " + bytes + ", ' '");
    }

    public String externDirective()
    {
        return ".extern ";
    }

    public void defineSymbol(String symbol)
    {
        buf.writeln(symbol + "=1");
    }
    /**
     *  Implements procedure call
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean cgApply(Monad m)
    {
        if(countReservations() > 0)  // call may corrupt regs the code generator
            return false;			 // should try again with no reservations
        try
            {
                boolean ok = false;
                Procedure proc = (Procedure)(((Function)m.oper).proc);
                Cartesian params = (Cartesian) m.arg;
                Statement pushlist = new Statement();
                int argc = params.argc();
                int paramSpace=0;
                spchange = 0;	// maintains the SP at any moment
//			iregs_used = 0;
//			iargs_done = 0;
//			rregs_used = 0;
//			rargs_done = 0;
//			total_args_done = 0;
                paramSpace = getParamSpace(params);
                if(paramSpace > maxParamSpace)
                    maxParamSpace = paramSpace;		// To find out the max. space needed to pass
                // arguments by the caller routine
                // The64-bit PoweerPC ELF ABI will be applied in case of imported routines
                /*			if ( proc.isImported)
                			{
                				if ( argc > 0 )
                				{
                					if ( paramArea < paramSpace )		// the minimum space needs to allocated on stack
                						paramSpace = paramArea;			// for the parameter area

                					if (!proc.argsPushedLeftToRight)
                					{
                						for (int i = 0; i < argc; i++)
                						{
                							Node n = params.argi(i);
                							passParam(n);
                						}
                					}
                					else
                					{
                						for (int i = argc - 1; i >= 0; i--)
                						{
                							Node n = params.argi(i);
                							passParam(n);
                						}
                					}
                					boolean ok = codeGen(pushlist);
                				}
                				paramSpace = paramArea;			// No parameters to pass, and so reserve the
                			}
                			else
                			{*/
                // Internal (Vector Pascal ) Procedures
                int iregs_used = 0;
                int iargs_done = 0;
                int rregs_used = 0;
                int rargs_done = 0;
                int total_args_done = 0;
                int[] toBeReservedInt64 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                int[] toBeReservedInt32 = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                int[] toBeReservedReal = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
                int reservedRegsInt64 = 0;
                int reservedRegsInt32 = 0;
                int reservedRegsReal = 0;
                if(proc.isImported)
                    {
                        Node[] dests64 = { regR3, regR4, regR5, regR6, regR7, regR8, regR9, regR10 };
                        Node[] dests32 = { regswR3, regswR4, regswR5, regswR6, regswR7, regswR8, regswR9, regswR10 };
                        Node[] fdests = { regF1, regF2, regF3, regF4, regF5, regF6, regF7, regF8 };
                        Node[] fsdests = { regsF1, regsF2, regsF3, regsF4, regsF5, regsF6, regsF7, regsF8 };
                        int regs_used = 0;
                        int args_done = 0;
                        // try put first 4 parameters into the argument registers
                        while((args_done < argc) && (regs_used < 8))
                            {
                                Node a = params.argi(args_done);
                                String pt = a.returnType();
                                if(pt.equals(Node.ieee32) || pt.equals(Node.ieee64))
                                    {
                                        if(rregs_used < 8)
                                            {
                                                if(pt.equals(Node.ieee64))
                                                    {
                                                        pushlist = new Statement(new Assign(fdests[rregs_used], a), pushlist);
                                                        reservedRegsReal++;
                                                        toBeReservedReal[reservedRegsReal] = rregs_used;
                                                        reserve(fdests[rregs_used]);
                                                        rregs_used++;						// # of floating-point registers used
                                                    }
                                                else
                                                    {
                                                        pushlist = new Statement(new Assign(fsdests[rregs_used], a), pushlist);
                                                        reservedRegsReal++;
                                                        toBeReservedReal[reservedRegsReal] = rregs_used;
                                                        reserve(fsdests[rregs_used]);
                                                        rregs_used++;						// # of floating-point registers used
                                                    }
                                            }
                                        else
                                            {
                                                // Push the remaining on the stack
                                            }
                                        regs_used++;
                                        args_done++;
                                    }
                                else
                                    {
                                        if(Format.lengthInBytes(pt) == 8)
                                            {
                                                pushlist = new Statement(new Assign(dests64[iregs_used], a), pushlist);
                                                regs_used += 1;
                                                args_done++;
                                                reservedRegsInt64++;
                                                toBeReservedInt64[reservedRegsInt64] = iregs_used;
                                                reserve(dests64[iregs_used]);
                                                iregs_used++;					// # of integer registers used
                                            }
                                        else
                                            {
                                                if(Format.lengthInBytes(pt) < 4)
                                                    {
                                                        a = new Cast(Node.int32, a);
                                                    }
                                                pushlist = new Statement(new Assign(dests32[iregs_used], a), pushlist);
                                                regs_used++;
                                                args_done++;
                                                reservedRegsInt32++;
                                                toBeReservedInt32[reservedRegsInt32] = iregs_used;
                                                reserve(dests32[iregs_used]);
                                                iregs_used++;						// # of integer registers used
                                            }
                                    }
                            }
                        /*if (argc > args_done)
                        {
                        	int offset_from_sp = 8;
                        	for (int i = argc - 1; i >= args_done; i--)
                        	{
                        		Node n = params.argi(i);
                        		String rt = n.returnType();
                        		int len = Format.lengthInBytes(rt);
                        		if (len == 8)
                        		{
                        			if ((offset_from_sp % 8) != 0)
                        				offset_from_sp += (8 - (offset_from_sp % 8));
                        		}
                        		if (len < 4)
                        			len = 4;
                        		pushlist = new Statement(pushit(params.argi(i), offset_from_sp), pushlist);
                        		offset_from_sp += len;
                        	}
                        }
                        */
                        ok = codeGen(pushlist);
                        codeGen(new ImpLabel(procprefix + proc.name));
                        int q = 1;
                        for(q = 1; q <= reservedRegsReal; q++)
                            unreserve(fdests[toBeReservedReal[q]]);
                        for(q = 1; q <= reservedRegsInt64; q++)
                            unreserve(dests64[toBeReservedInt64[q]]);
                        for(q = 1; q <= reservedRegsInt32; q++)
                            unreserve(dests32[toBeReservedInt32[q]]);
                        buf.writeln(" bl " + procprefix + proc.name + "   #imported");
                        //buf.writeln(" mr r0,r3");
                    }
                else
                    {
                        if(!proc.argsPushedLeftToRight)
                            {
                                int offset_from_sp = 8;
                                for(int i = 0; i < argc; i++)
                                    {
                                        Node n = params.argi(i);
                                        pushlist = new Statement(pushit(params.argi(i), offset_from_sp), pushlist);
                                        String rt = n.returnType();
                                        int len = Format.lengthInBytes(rt);
                                        if(len < 4) len = 4;
                                        offset_from_sp += len;
                                    }
                            }
                        else
                            {
                                int offset_from_sp = 8;
                                for(int i = argc - 1; i >= 0; i--)
                                    {
                                        Node n = params.argi(i);
                                        pushlist = new Statement(pushit(params.argi(i), offset_from_sp), pushlist);
                                        String rt = n.returnType();
                                        int len = Format.lengthInBytes(rt);
                                        if(len < 4) len = 4;
                                        offset_from_sp += len;
                                    }
                            }
                        ok = codeGen(pushlist);
                        buf.writeln(" bl " + proc.getStartAddressLabel());
                    }
                return ok;
            }
        catch(Exception eee)
            {
                System.out.println(eee);
                eee.printStackTrace();
                return false;
            }
    }


    /**
    * Handles passing imported-routines' parameters
    * via regsiters or stack
    * Needs more work specially when the parameters to be
    * passed are mixed, for example, int's and float's. In
    * this case the GPRs corrsponding to the float values
    * should not be used (refer to ELF ABI page 22 for more)
    *
    *	@param  n  Description of Parameter
    *	@return    Description of the Returned Value
    **/
    /*
    	boolean passParam(Node a)
    	{
    		String paramType = a.returnType();
    		if (Format.isInteger(paramType) )
    		{
    			if ( iregs_used < noIntParamRegs)			// pass via registers
    			{
    				a = new Cast(Node.int64, a);
    				pushlist = new Statement(new Assign(idests[iregs_used], a), pushlist);
    				iregs_used++;
    			}
    			else								// pass the remaining on the stack
    			{
    				String rt = a.returnType();
    				int len = Format.lengthInBytes(rt);
    				if (len < 8)	len = 8;
    				pushlist = new Statement(pushit(a,offsetFromSP), pushlist);
    				offsetFromSP+=len;
    			}
    		}
    		else				// handl real numbers
    		{
    			if ( rregs_used < noRealIntParamRegs)	// pass via regsiters
    			{
    				a = new Cast(Node.ieee64, a);		// we may need to cast only ieee32
    				pushlist = new Statement(new Assign(rdests[rregs_used], a), pushlist);
    				rregs_used++;
    			}
    			else								// pass the remaining on the stack
    			{
    				String rt = a.returnType();
    				int len = Format.lengthInBytes(rt);
    				if (len < 8)	len = 8;
    				pushlist = new Statement(pushit(a,offsetFromSP), pushlist);
    				offsetFromSP+=len;
    			}
    		}

    */
    /*			if (!proc.argsPushedLeftToRight)
    			{
    				for (int i = 0; i < argc; i++)
    				{
    					Node n = params.argi(i);
    					passParam(n);
    					String rt = n.returnType();
    					int len = Format.lengthInBytes(rt);
    					if (len < 8)	len = 8;
    					pushlist = new Statement(pushit(params.argi(i),offsetFromSP), pushlist);
    					offsetFromSP+=len;
    				}
    			}
    			else
    			{
    				for (int i = argc - 1; i >= 0; i--)
    				{
    					Node n = params.argi(i);
    					String rt = n.returnType();
    					int len = Format.lengthInBytes(rt);
    					if (len < 8)	len = 8;
    					pushlist = new Statement(pushit(params.argi(i),offsetFromSP), pushlist);
    					offsetFromSp+=len;
    				}
    			}*/

//		}

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
                if(nt.equals(Node.ieee64)) n = new Assign(regF1, n);
                else if(nt.equals(Node.ieee32)) n = new Assign(regsF1, new Cast(nt, n));
                else if(nt.equals(Node.int8)||nt.equals(Node.uint8)||nt.equals(Node.octet))
                    {
                        n= new Statement(new Assign(regR3,new Int(0,Node.int64)),
                                         new Statement(new Assign(regbR3,new Cast(Node.int8,n))));
                        // addze can be used instead of the two above statment.
                    }
                else if(nt.equals(Node.int16)||nt.equals(Node.uint16)||nt.equals(Node.halfword))
                    {
                        n= new Statement(new Assign(regR3,new Int(0,Node.int64)),
                                         new Statement(new Assign(regsR3,new Cast(Node.int16,n))));
                    }
                else if(nt.equals(Node.int32) || nt.equals(Node.uint32) || nt.equals(Node.word))
                    {
                        n = new Statement(new Assign(regR3, new Int(0, Node.int64)),
                                          new Statement(new Assign(regswR3, new Cast(Node.int32, n))));
                    }
                else
                    n = new Assign(regR3, new Cast("int64",n));
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
        Node res = new Deref(regR3);		// it could be speeded up
        //if ( !t.equals(Node.int32) )     	// if statement is implement here
        if(t.equals(Node.ieee32)) 	res = new Deref(regsF1);
        else if(t.equals(Node.ieee64))	res = new Deref(regF1);
        else if(t.equals(Node.int8) || t.equals(Node.uint8) || t.equals(Node.octet)) res = new Deref(regbR3);
        else if(t.equals(Node.int16)||t.equals(Node.uint16)||t.equals(Node.halfword)) res=new Deref(regsR3);
        else if(t.equals(Node.int32) || t.equals(Node.uint32) || t.equals(Node.word)) res = new Deref(regswR3);
        return new Cast(t, res);
    }



    /**
     *  produces entry and exit sequence for pascal procedure
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
     *  The PowerPC Stack is always DoubleWord alinged (8 bytes)
     	Source:
    		 	Developing PowerPC Embedded Application Binary Interface (EABI) Compliant Programs,
    		 	Microcontroller Applications IBM Microelectronics Research Triangle Park,
    			NC, Version: 1.0,  Sep, 1998, p.4.

     *@param  n              node to go on stack
     *@return                Description of the Returned Value
     *@exception  Exception  Description of Exception
     */
    Node pushit(Node n,int spOffset) throws Exception
    {
        String rt = n.returnType();
        int oldsp = spchange;
        int len = Format.lengthInBytes(rt);
        String it = Node.int32;
        Node typedSP = new Cast("ref " + it, regR1);
        int aligned=len;
        if((aligned %4) !=0)aligned+=(4-(aligned%4));
        Node res = (Node)new Statement(new Assign(new Memref(new Dyad(new Deref(typedSP), new Int(spOffset), "+"), "ref " + rt), n), new Statement());
        /*
        Node res = (len != 4 ?
        		(Node)new Statement(
        		new Assign(regR1,
        		new Dyad(new Deref(typedSP), new Int(-aligned), "+")
        		),
        		new Statement(new Assign(new Memref(new Dyad(new Deref(typedSP), new Int(spOffset), "+"), "ref " + rt), n), new Statement())
        	//new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + rt), n), new Statement())
        		)
        		 :
        		  (Node)new Statement(
        		new Assign(regR1,
        		new Dyad(new Deref(typedSP), new Int(-4), "+")
        		),
        		new Statement(new Assign(new Memref(new Dyad(new Deref(typedSP), new Int(spOffset), "+"), "ref " + rt), n), new Statement())
        	//new Statement(new Assign(new Memref(new Deref(typedSP), "ref " + rt), n), new Statement())
        		)
        		);*/
        /*Node res = (Node)new Statement(
        			new Assign(regR1,
        			new Dyad(new Deref(typedSP), new Int(spOffset,"int64"), "+")
        			),
        			new Statement(
        			new Assign(	new Memref(
        			new Deref(typedSP), "ref " + rt), n), new Statement()));*/
        if(verbose)
            dlog("Result Node " + n);
        // the code to update the sp has to be here as the pushit function is recursive
        // we must thus use the sp value at the start of the routine as what we increment
        if(len < 4) len = 4;
        spchange = len + oldsp;
        return res;
    }


    /**
     *  Description of the Method
     *
     *@param  p  Description of Parameter
     *@param  w  Description of Parameter
     *@return    Description of the Returned Value
     */

    /*
    (gcc) Function Attributes

     `dllimport'
          On the PowerPC running Windows NT, the `dllimport' attribute causes
          the compiler to call the function via a global pointer to the
          function pointer that is set up by the Windows NT dll library.
          The pointer name is formed by combining `__imp_' and the function
          name.

     `dllexport'
          On the PowerPC running Windows NT, the `dllexport' attribute causes
          the compiler to provide a global pointer to the function pointer,
          so that it can be called with the `dllimport' attribute.  The
          pointer name is formed by combining `__imp_' and the function name.
    */

    /**
    * Override the standard match method to ensure that alignment rules are
    * obeyed
    */
    public boolean match(Node n) throws Exception
    {
        if(n instanceof Assign)
            {
                Assign a = (Assign)n;
                if(a.dest instanceof Register && ismemderef(a.src))
                    {
                        Register r = (Register)a.dest;
                        int len;
                        if((len = Format.lengthInBits(Format.typeDeref(r.returnType()))) == 32)
                            {
                                //	System.out.println(n.toString());
                            }
                    }
            }
        return innermatch(n);
    }

    static int suffixes=0;

    public boolean scgProcedure(Procedure p, Walker w)
    {
        maxParamSpace = 8;
        String name = p.name;
        String suffix= "l" + suffixes;
        suffixes++;
        //w.buf.writeln("\t.file \"" + name + ".pas\"");
        //w.buf.writeln("\t.file " + name);
        if(p.isImported)
            {
                w.buf.writeln("\t.extern " + procprefix + name);
                return true;
            }
        w.buf.writeln(".section .text \n" +
                      ".align 3 \n" +
                      "# procedure generated by code generator " + w.getClass());
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
                w.buf.writeln("#\t the procedure name is " + name);
            }
        /*if (p.lexLevel == 0)
        {
        	w.buf.writeln("\t.ent " + procprefix + name);  // .ent for debugging purpose only
        	w.buf.writeln(procprefix + name + ":");
        }
        else
        {
        	w.buf.writeln("\t.ent " + p.getStartAddressLabel());  // .ent for debugging purpose only
        	w.buf.writeln(p.getStartAddressLabel() + ":");
        }
        if (p.isExported) {
        	w.buf.writeln(procprefix + name + ":Youssef");
        }
        else {
        	w.buf.writeln(";\t the procedure name is " + name);
        }*/
        if(p instanceof Unit)
            {
                w.buf.writeln("# entering a unit at lexical level "+p.lexLevel);
                w.buf.writeln(name + ":");
                enterInstruction(0,p.lexLevel, w);
//			w.buf.writeln(" enter  0," + p.lexLevel);
            }
        else
            {
                w.buf.writeln("# entering a procedure at lexical level "+p.lexLevel);
            }
        enterInstruction(0,p.lexLevel, w);
        /*		if (p.toCall != null) {
        			for (int ui = 0; ui < p.toCall.length; ui++) {
        				w.buf.writeln(" bl unit$" + p.toCall[ui]);
        			}
        			w.buf.writeln("lis 11, " + name + "ready@ha");
        			w.buf.writeln("la 11, " + name + "ready@l(11)");
        			w.buf.writeln("lbz 11,0(11)");
        			w.buf.writeln("cmpi  0,0,11,0 \n beq " + name + "init");
        			w.buf.writeln("b " + name + suffix + "exit");
        			w.buf.writeln(name + "init:");
        			w.buf.writeln("lis 11, " + name + "ready@ha");
        			w.buf.writeln("la 11, " + name + "ready@l(11)");
        			w.buf.writeln("li 13,1");
        			w.buf.writeln("stb 13,0(11)");
        			//w.buf.writeln("bl speInitialize()");
        		}
        */
        Node nt;
        int reserve = 0;
        boolean res = w.codegen(new Block(nt=p.getSubtree(), p.alloc));
        if(res)if(w.verbose)w.log("compiled procedure "+nt);
        // A space should be presereved for linkage area (Return address (LR)& a previous SP)
        w.buf.writeln(".set frameSize" + " , " + (reserve=Math.abs(p.alloc.getLimit()+maxParamSpace+16)));
        w.buf.writeln(name+suffix + "exit:");
        leave(w);
//		w.buf.writeln("leave\n ret " + (p.calleePopsArgs ? p.paramspace : 0));
        if(p instanceof Unit)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t.section .bss");
                w.buf.writeln("\t.align 3");
                w.buf.writeln(".space " +Math.abs(p.alloc.getLimit()));
                w.buf.writeln("\t.align 3");
                w.codeGen(((Unit) p).getBase());
            }
        else if(p.lexLevel==0)
            {
                // plant the data decls for the unit
                w.buf.writeln("\t.section .bss");
                w.buf.writeln("\t.align 3");
                w.buf.writeln(".space " + Math.abs(p.alloc.getLimit()));
                w.buf.writeln("\t.align 3");
                w.buf.writeln("PmainBase:");
            }
        if(p.toCall != null)
            {
                w.buf.writeln("\t.section .data");
                w.buf.writeln(name + "ready:\n .byte 0");
            }
        return res;
    }



    /*
    It is not necessary to write down the WHOLE name of the host-compiler, e.g. "powerpc-eabi-gcc"
    in stead than only "gcc" Running gcc in PowerPC it will take the default compiler as powerpc-abi-gcc.
    Only in case of building a cross-compiler it would be necessary to declare the machine as a target.
    Configuring "--target=i486-linux --host=XXX" on platform XXX followed by a "make".
    For this it is needed the Linux includes, the kernel includes, and also to build the cross
    assembler and cross linker from the sources in.
    */

    /**
     *  This is the link command that can be used by other PPC family processors
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
                //PPC	String com = "gcc -g -lm -o " + ofile + " " + infile + AsmLink.libs;
                //PPC	if(AsmLink.gcenable)com=com+" "+AsmLink.gc+" "+AsmLink.rtlb;
                //PPC	else com= com+ " " + AsmLink.rtl;
                //system.out.println(com);
                //Start of PPC & SPE
                //String rtlname = "/root/SourceForge/vectorpascalcom/mmpc/rtl.c";
                String rtlname = "./mmpc/rtl.c";
                //String com = "ppu-gcc " + infile + " SI.o " + rtlname + " -o testSPE";
                String com = "ppu-g++ -O3 -g PPEcode.cpp SI.csf.o " + rtlname + " " + infile + " -lspe2 -lm -DPPE -o testSPE";
                System.out.println(com);
                // end of PPC & SPE
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
    *  Gas Assembler
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
                String com1 = "spu-g++ -O3 SPEcode.cpp -o SP";
                System.out.println(com1);
                Process p1 = sys.exec(com1);
                String com2 = "ppu-embedspu  speInterpreter SP SI.csf.o";
                System.out.println(com2);
                Process p2 = sys.exec(com2);
                String com3 = "ppu32-as -a64 -g -o " + ofile + " " + infile;
                System.out.println(com3);
                Process p3 = sys.exec(com3);
                StreamGobbler errorGobbler = new
                StreamGobbler(p3.getErrorStream(), "ERROR");
                // any output?
                StreamGobbler outputGobbler = new
                StreamGobbler(p3.getInputStream(), "OUTPUT");
                // kick them off
                errorGobbler.start();
                outputGobbler.start();
                if(p3.waitFor() == 0)
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

    public int getParamSpace(Cartesian params) throws Exception
    {
        int param_space = 0;
        int argc = params.argc();
        for(int i = 0; i < argc; i++)
            {
                Node n = params.argi(i);
                String rt = n.returnType();
                int len = Format.lengthInBytes(rt);
                // we may need to count the integer and real arguments
                if((len % 4) != 0)
                    len += (4 - (len % 4));
                param_space += len;
            }
        return param_space;
    }


    /**	ENTER procedure of instuction for PowerPC
    *	Creates a display area for nested proceudres
    *	Reg1  = SP
    *	Reg31 = FP
    *	Reg30 = tempSP
    */


    private void enterInstruction(int frameSize, int LL, Walker w)
    {
        // Reg31 holds the FP & Reg1 holds the SP & Reg30 = temp (copy of the SP which will become the new frame pointer )
        // PROLOG
        // 1) Link the current frame to the new frame
        w.buf.writeln("# Prolog");
        w.buf.writeln("mflr LR");								// Copy Link register (return address) into LR
        w.buf.writeln("stw LR, 4(SP)");				// mem(SP+4) = Return address
        w.buf.writeln("addi TMPREG,SP,0");						// Take a copy of the SP; it will be the FP of the new frame after
        w.buf.writeln("stw	FP,	-4(SP)");			// store the return address in the new frame
        w.buf.writeln("addi SP, SP, -4");			// SP = SP - 4      ; move the current SP
        // Establish the display area
        if(LL > 0)  											// lex-level > 0 In case of NESTED routine
            {
                // pushing the  frame pointers of the nested procedures (Display Window)
                for(int i = 1; i < LL ; i++)
                    {
                        // Load FP of previous nested procedure's frames into the display window of the new frame
                        w.buf.writeln("addi FP,FP,-4");				// FP = FP - 4 to move the FP to point to the place which holds
                        // a link for the nested procedure at level i
                        w.buf.writeln("lwz  r29, 0(FP)");			// r29 = mem(FP)	; load the address of the nested procedure at level i
                        w.buf.writeln("stw  r29, -4(SP)");			// mem(SP) = r29	; store that address of the nested procedure (Level i)
                        w.buf.writeln("addi SP, SP, -4");			// SP = SP - 4      ; move the current SP
                        //
                    }
                w.buf.writeln("stw TMPREG, -4(SP)");				// mem(SP) = oldSP	; store the new frame pointer
                w.buf.writeln("addi SP, SP, -4");			// SP = SP - 4      ; move the current SP
            }
        w.buf.writeln("mr  FP,TMPREG");						// FP = SP		; The FP of the new frame is the SP before pushing the
        //	w.buf.writeln("stwu SP,	-frameSize(SP)");			// Reserve a frame of size "frameSize" by:
        //w.buf.writeln("loadintr TMPREG, -frameSize");			// Reserve a frame of size "frameSize" by:
        //w.buf.writeln("stwux SP,SP,TMPREG");					//	 1) storing the current (callers)SPas a chain
        //w.buf.writeln("stwu SP,	-frameSize(SP)");
        w.buf.writeln("loadintr TMPREG,frameSize");
        w.buf.writeln("subf TMPREG, TMPREG,SP");
        w.buf.writeln("stw SP,0(TMPREG)");
        w.buf.writeln("or SP,TMPREG,TMPREG");
//		w.buf.writeln("bl ThreadsInitial");
        //w.buf.writeln("mr SP,TMPREG");
        //	w.buf.writeln("add SP,r0,TMPREG");				// the frame pointers of the nested procedures (Display Window)
        /*
        		w.buf.writeln("# Prolog");
        		w.buf.writeln("addi TMPREG,SP,0");						// Take a copy of the SP; it will be the FP of the new frame after
        		w.buf.writeln("stwu SP,	-frameSize(SP)");				// Reserve a frame of size "frameSize" by:
        																// 1) storing the current (callers)SPas a chain
        																// 2) update the SP to point to new frame

        		w.buf.writeln("stw	FP,	frameSize-4(SP)");			// store the return address in the new frame
        		w.buf.writeln("mflr LR");								// Copy Link register (return address) into LR
        		w.buf.writeln("stw LR, frameSize+4(SP)");			// mem(SP+4) = Return address
        		// Establish the display area
        		if (LL > 0)												// lex-level > 0 In case of NESTED routine
        		{																// pushing the  frame pointers of the nested procedures (Display Window)
        			for (int i = 1; i < LL; i++)
        			{
        				// Load FP of previous nested procedure's frames into the display window of the new frame
        				w.buf.writeln("addi FP,FP,-4");				// FP = FP - 4 to move the FP to point to the place which holds
        				// a link for the nested procedure at level i
        				w.buf.writeln("lwz  r29, 0(FP)");			// r29 = mem(FP)	; load the address of the nested procedure at level i
        				w.buf.writeln("stw  r29, -4(SP)");			// mem(SP) = r29	; store that address of the nested procedure (Level i)
        				w.buf.writeln("addi SP, SP, -4");			// SP = SP - 4      ; move the current SP
        				//
        			}
        		}
        		w.buf.writeln("mr  FP,TMPREG");						// FP = SP		; The FP of the new frame is the SP before pushing the
        */
    }
    private void leave(Walker w)
    {
        w.buf.writeln("# Ebilog");
        w.buf.writeln("lwz  r13, 0(SP)");					// load the previous frame's pointer into Reg13
        w.buf.writeln("mr SP,r13");							// Update the SP so that to point to caller (previous frame) address
//		w.buf.writeln("lwz  LR,	4(r13)");					// load the return address (which is the previous frame + 4) in R0
        w.buf.writeln("lwz  LR,	4(FP)");					// load the return address (which is the previous frame + 4) in R0
        w.buf.writeln("mtlr LR");							// move Reg0 to Link register
        //w.buf.writeln("addi SP,SP,frameSize");			// Update the SP to point to the previous frame
        w.buf.writeln("lwz FP,-4(FP)");					// Update the FP to point to the previous frame
        w.buf.writeln("blr");					// branch to the location point to it by link register
    }


    public void redefineIntReg(RollBackBuffer b)
    {
        for(int i = 0 ; i < 32; i++)
            b.writeln("\t.set r" + i + "," + i);
        b.writeln("\t.set LR , 0");
        b.writeln("\t.set SP , 1");
        b.writeln("\t.set TMPREG , 30");
        b.writeln("\t.set FP , 31");
        for(int i = 0; i < 32; i++)
            b.writeln("\t.set f" + i + "," + i);
        //	b.writeln(".ifndef definedunit$system$base");
        //	b.writeln("definedunit$system$base=1");
        //	b.writeln(".extern 	 unit$system$base");
        //	b.writeln(".endif");
    }
}
