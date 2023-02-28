package ilcg.Pascal;

import ilcg.SyntaxError;
import ilcg.tree.AsmLink;
import ilcg.tree.Assign;
import ilcg.tree.Block;
import ilcg.tree.Cartesian;
import ilcg.tree.Cast;
import ilcg.tree.Deref;
import ilcg.tree.ExpressionSubstituter;
import ilcg.tree.ExtLabel;
import ilcg.tree.For;
import ilcg.tree.Format;
import ilcg.tree.Function;
import ilcg.tree.Goto;
import ilcg.tree.Int;
import ilcg.tree.Label;
import ilcg.tree.LocalStoreAllocator;
import ilcg.tree.Memref;
import ilcg.tree.Monad;
import ilcg.tree.Node;
import ilcg.tree.Procedure;
import ilcg.tree.TreeExaminer;
import ilcg.tree.Statement;
import ilcg.tree.Type;
import ilcg.tree.Variable;
import ilcg.tree.Walker;
import ilcg.tree.If;
import ilcg.tree.Dyad;
import java.io.Reader;
import java.util.Vector;
import java.io.*;
import ilcg.Pascal.*;
import VPTeX.vPTeX;
import VPTeX.PascalFile;
import java.util.*;
import java.util.zip.*;
public class GPUPascal extends PascalCompiler {
    /**
     * This class extends the compiler so that assignment statements for 2
     * dimensional arrays are run on more than one core
     */
    /** At the end of compilation this contains the openCL kernels for the
     * programme */
    StringBuffer globalOpenCLBuffer = new StringBuffer();
    /* at the end of compilationt this contains the C code that must be used to initialise the opencl code */
    StringBuffer globalCBuffer = new StringBuffer();
    /* at the end of compilationt this contains the C code for calling the kernels */
    StringBuffer globalCKBuffer = new StringBuffer();
    int kernelcount =0;
    Vector<String> kernelnames = new Vector<String>();
    Node threshold = new Int(-1);// the amount of work a loop must do to be worth multithreading
    /** Main constructor
     *@param  path        path to sourcefile
     *@param  w           code generator to use
     *@param  source      a stream containing open source
     *@param  sourcename  the name of the programme or unitfile*/
    public GPUPascal(String path, Walker w, Reader source, String sourcename) {
        super(path, w, source, sourcename);
        if(AsmLink.rtl.indexOf("OpenCL")<0) {
            AsmLink.rtl+="  -lglu32 -lOpenCL ";
        }
    }
    BitSet multicorelines = new BitSet();
    void profprint() {
        try {
            FileOutputStream fs=new FileOutputStream((pathPrefix+sourceName).replace(".pas",".lis"));
            PrintStream pw = new PrintStream(fs);
            FileReader ft = new FileReader(pathPrefix+sourceName);
            int c;
            boolean finished=false;
            int l=1;
            pw.println("listing of file "+sourceName);
            pw.println("        +--An 'G' at the start of a line indicates the line has been GPU parallelised");
            pw.println("        |");
            pw.println("        v");
            while(!finished) {
                pw.format("%6d ",l);
                pw.print(" ");
                if(multicorelines.get(l))pw.print("G");
                else pw.print(" ");
                for(c=ft.read(); c!='\n'&& !finished; c=ft.read()) {
                    if(c==-1) finished=true;
                    else if(((char)c)!='\r')pw.print((char)c);
                }
                l++;
                pw.println();
            }
            pw.close();
        }
        catch(Exception e) {
            System.err.println(e.toString());
        }
    }

    /* this takes an opencl programme in the buffer in and writes it as a string literal to the buffer out */
    static void convert2Cinline(StringBuffer in, StringBuffer out) {
        int i;
        out.append('"');
        for(i=0; i< in.length(); i++) {
            char c = in.charAt(i);
            if(c!='\n') {
                out.append(c);
            }
            else {
                out.append('\\');
                out.append('n');
                out.append('"');
                out.append('\\');
                out.append('\n');
                out.append('"');
            }
        }
        out.append('"');
    }
    /** generate code to assign to node v, parsing what follows */
    Node Doassign(Node v, Type tt) throws SyntaxError {
        unparalleled = false;
        boolean runonGPU = false;
        boolean list = lex.lineno() >= Walker.switchon
                       && lex.lineno() <= Walker.switchoff;
        int oldexpressionContext = expressionContext;
        expressionContext = assignContext;
        int oldcalls = callcount;
        boolean oldcontains = containscalls;
        boolean multi_threadable = true;
        String[] whynotmulti= {" dont know why not multithreaded but probably the amount of work done did not justify parallelisation"};
        containscalls = false;
        int therank = getRank(tt);
        if(v instanceof Variable) {
            runonGPU = therank>0&&therank<3;
            // it is only in these cases that it is
            // worth parallelising accross
            // gpu threads
            if(runonGPU) {
                String et=((ArrayType)tt).elemtype.returnType();
                runonGPU=et.equals("ieee32")||et.equals("int32");
                // only use gpu for these types
            }
            // thus only in this case do we need to create a procedure made up
            // of the statement
            if(((Variable) v).Protected) {
                error(" assignment to protected location ");
            }
        }
        if(processor.verbose) {
            System.out.println("rank of " + v + ":" + tt + "=" + therank);
        }
        Node res = null;
        Node[] indices = new Node[1];
        Node e;
        try {
            Statement saveprestatement = prestatement;
            Statement newprestatement = null;
            Node v1 = v;
            Type rest;
            Node base=null;
            if(therank == 0) {
                e = expression();
                e = forceTypeCompatibility(e, tt);
                rest = getType(e);
                res = new Assign(v, e, false);
            }
            else {
                Node fd;
                ArrayType at = null;
                Type actualtype = tt;
                try {
                    actualtype = getType(fd = forcederef(v));
                    at = (ArrayType) actualtype;
                    //		if(runonGPU)at= (ArrayType) ExpressionSubstituter.substituteAwithBinC( processor.getFP(), base, at);
                    //		if(runonGPU)System.out.println("type of "+v+":"+at+"\n upb 0 = "+at.getUpb(0, getAddr(v)));
                }
                catch(ClassCastException ex1) {
                    at = (ArrayType)((Pointer) actualtype).pointsTo;
                }
                if(at.elemtype instanceof SetType) {
                    setAssignmentContext = (SetType) at.elemtype;
                }
                // collect any bounds checks in new prestatement
                saveprestatement = prestatement;
                prestatement = null;
                indices = new Node[therank];
                for(int i = 0; i < therank; i++) {
                    indices[i] = tempvar(ADDRESS);
                    declareLoopIterator(indices[i]);
                    arrayiteratorset.put(indices[i], indices[i]);
                }
                autoiterators = assindices = indices;
                hazardcheck = true;
                assdest = v;
                if(list) {
                    System.out.println(" parse array exp");
                    System.out.println("prestatement=" + prestatement);
                    System.out.println("saveprestatement=" + saveprestatement);
                }
                e = expression(0, therank, indices);
                if(list) {
                    System.out.println("rhs =" + e);
                }
                hazardcheck = false;
                // temporatily switch of range checks
                boolean oldchecks = lex.rangechecks;
                lex.rangechecks = false;
                v1 = subscript(v, indices);
                lex.rangechecks = oldchecks;
                Node DRv1 = new Deref(v1);
                e = forcederef(e);
                e = forceTypeCompatibility(e, at.elemtype);
                e = typeTag(e, at.elemtype);
                rest = getType(e);
                // if array expression surround by for loop
                Node[] preloops = new Node[therank];
                Assign basicassign = new Assign(v1, e);
                if(list) {
                    System.out.println("prestatement=" + prestatement);
                    System.out.println("saveprestatement=" + saveprestatement);
                    System.out.println("basicassign=" + basicassign);
                }
                try {
                    Node newass = optimiseSetAssign(basicassign);
                    basicassign = (Assign) newass;
                }
                catch(Exception basic) { }
                newprestatement = prestatement;
                prestatement = saveprestatement;
                if(list)
                    System.out.println("newprestatement =" + newprestatement
                                       + "\nsaveprestatement=" + saveprestatement);
                res = new Statement(newprestatement, new Statement(basicassign))
                .eval();
                Statement block;
                for(int i = therank - 1; i >= 0; i--) {
                    Node lwb = at.getLwb(i, getAddr(v));
                    // the lower bound may refer to a descriptor which is now in the outer scope
                    if(list)
                        System.out.println("lwb=" + lwb);
                    Node upb = at.getUpb(i, getAddr(v));
                    Node step = new Int(1, intrep);
                    if(i == (therank - 2) && runonGPU) {
                        step = new Int(1, intrep);
                    }
                    Node ch = checkArrayBoundsNotViolatedInLoopForIndex(
                                  indices[i], lwb, upb);
                    if(list)
                        System.out.println("upb=" + upb);
                    Node cacheupb = tempvar(INTEGER);
                    Node inittemp = (upb.knownAtCompileTime() ? null
                                     : new Assign(cacheupb, new TypeTag(upb, INTEGER)));
                    res = new Statement(preloops[i] = new Statement(
                        getPreloopAction(indices[i]), // grab pre-loop
                        // statements
                        new Statement(ch)),
                                        // place before the loop proper
                                        new Statement(inittemp, block = new Statement(
                        new For((Variable) indices[i], lwb, (upb
                                .knownAtCompileTime() ? upb
                                : forcederef(cacheupb)), step, res)
                        .optimise())));
                    block.setLocal((Memref) indices[i]);
                    if(list)
                        System.out.println("expanded loop=" + res
                                           + "\n block =" + block);
                    res = new Statement(res.eval());
                    if(list)
                        System.out.println("evaluated loop=" + res);
                    // make the iteration variable register cachable in the
                    // absence of procedure calls
                    if(oldcalls == callcount) {
                        ((Statement) res).setLocal((Variable) indices[i]);
                    }
                }
                if(list)
                    System.out.println("loop before parallising" + res);
                int parfactor = processor.getParallelism(rest.type);
                Vector cacheables = cacheablerefs(new Statement(basicassign));
                v = v1;
                tt = getType(v1);
                for(int i = 0; i < therank; i++) {
                    freeIterator(indices[i]);
                }
            }
            if(tt instanceof RealType) {
                if(!((RealType) tt).dimensionallyEquivalent((RealType) rest)) {
                    System.out.println(tt + "<> " + rest);
                    dimerror(":=");
                }
            }
        }
        catch(Exception ex) {
            error(" assignment invalid " + ex.toString());
        }
        expressionContext = oldexpressionContext;
        FunctionFinder af = new  FunctionFinder();
        res.examine(af);
        runonGPU&=  af.count == 0;
        //	runonGPU&= prestatement==null;
        if(runonGPU&& ! unparalleled) {
            Node [] alternatives = {res, null};
            if(canconverttoGPU(alternatives,currentmodule)) {
                multicorelines.set(lex.lineno());
                return alternatives[1];
            }
        }
        return res;
    }
    Node variable(int rank, int validindices, Node[] indices)
    throws SyntaxError, UndeclaredVariable, TypeIdError {
        mustbe(lex.TT_IDENTIFIER);
        String  id   = lex.theId;
        Object  loc  = getid(id);
        if(processor.verbose || dolist()) {
            System.out.println("in variable " + id + " rank=" + rank
                               + " validindices=" + validindices);
        }
        if(loc == null) {
            System.out.println(id + " undeclared ");
            // symbolTable.list();
            throw new UndeclaredVariable(id, lex.lineno());
        }
        if(!((loc instanceof Variable) || (loc instanceof ObsConstOf))) {
            // System.out.println(loc);
            if(loc.toString().equals(compileTimeFunction)) {
                return docompiletimefunction(id);
            }
            else if(loc instanceof Type) {
                throw new TypeIdError(id, loc);
            }
            else if(loc instanceof Field) {
                Field       f     = (Field) loc;
                RecordType  rt    = f.recordType;
                Node        base  = (Node) withTable.get(rt);
                if(base == null) {
                    error("undeclared base " + base + " for field " + id);
                }
                loc = new TypeTag(new Memref(dyad(getAddr(base).eval(),
                                                  new Int(((Field) loc).offset, Format.addressType), "+")
                                             .eval(), f.fieldType.returnType()), f.fieldType);
            }
        }
        try {
            if(loc instanceof Variable)recordUseOf((Variable)loc);
            Node     V         = (Node)(loc instanceof Variable ? adjustLexLevel((ilcg.tree.Variable) loc)
                                        : loc);
            boolean  tryagain;
            do {
                tryagain = false;
                Type  t  = getType(V);
                if(t instanceof ArrayType)
                    if(arraynesting > 0) {
                        unparalleled = true;
                    }
                // do not allow parallelisation of
                // subscription of arrays by arrays
                if(processor.verbose || dolist()) {
                    if(unparalleled)System.out.println("Variable " + V + ":" + t + "\nunparalleled=" + unparalleled + "\n because array nesting=" + arraynesting);
                }
                if(have('^')) {
                    // Pointer deref
                    // ---------------------------------------------------------
                    try {
                        // System.out.println
                        // (" deref "+V+":"+t+" using explicit deref");
                        if(t.toString().startsWith("ref")) {
                            t = getType(forcederef(V));
                        }
                        if(!(t instanceof Pointer)) {
                            try {
                                // result may be an array in which case index it
                                V = derank(V, validindices, indices, 0);
                                t = getType(forcederef(V));
                            }
                            catch(Exception en) {
                                error("pointer required for ^\n");
                            }
                        }
                        if(!(t instanceof Pointer)) {
                            error("pointer required for ^\n");
                        }
                        Type  dereft  = ((Ref) t).pointsTo;
                        dereft = new Ref(dereft);
                        V = new Variable(0, 0, dereft, dereft.type,
                                         new TypeTag(new Deref(V), ADDRESS));
                        // System.out.println("after ^ , V="+V);
                        tryagain = true;
                    }
                    catch(Exception defefex) {
                        error(" invalid dereference operation "
                              + defefex.toString() + defefex.getClass());
                    }
                }
                else if(have('[')) {
                    // Array subscription
                    // ---------------------------------------------------------
                    try {
                        Node[][]  initialindices  = new Node[2][1];
                        int       indexcount      = 0;
                        boolean   subrange        = false;
                        do {
                            if(have(']')) {
                                // null index for whole array
                                ArrayType  at    = (ArrayType) getType(forcederef(V));
                                Node       base  = getAddr(V);
                                initialindices[0][indexcount] = at.getLwb(
                                                                    indexcount, base);
                                subrange = true;
                                initialindices[1][indexcount] = at.getUpb(
                                                                    indexcount, base);
                                indexcount++;
                                // extend the index vector
                                Node[][]   temp  = new Node[2][indexcount + 1];
                                for(int k = 0; k < indexcount; k++) {
                                    temp[0][k] = initialindices[0][k];
                                    temp[1][k] = initialindices[1][k];
                                }
                                initialindices = temp;
                            }
                            else {
                                do {
                                    // derive the indexing expression
                                    arraynesting++;
                                    Node      e          = expression(rank, validindices,
                                                                      indices);
                                    arraynesting--;
                                    initialindices[0][indexcount] = e;
                                    Node[]    flat       = flattenIndices(initialindices[0]);
                                    int       extension  = 1 + flat.length
                                                           - initialindices[0].length;
                                    initialindices[0] = flat;
                                    // extension now holds the number of indices
                                    // that
                                    // have been recorded
                                    // we have to allow for the index variable
                                    // being a tuple
                                    // of integers
                                    if(have(lex.TT_ELIPSIS)) {
                                        // subrange index
                                        initialindices[1][indexcount] = expression(
                                                                            rank, validindices, indices);
                                        initialindices[1] = flattenIndices(initialindices[1]);
                                        if(initialindices[1].length != initialindices[0].length) {
                                            error("subrange is not a paralliped");
                                        }
                                        subrange = true;
                                    }
                                    else {
                                        initialindices[1][indexcount] = e;
                                        initialindices[1] = flattenIndices(initialindices[1]);
                                    }
                                    indexcount += extension;
                                    tryagain = true;
                                    // extend the index vector
                                    Node[][]  temp       = new Node[2][indexcount + 1];
                                    for(int k = 0; k < indexcount; k++) {
                                        temp[0][k] = initialindices[0][k];
                                        temp[1][k] = initialindices[1][k];
                                    }
                                    initialindices = temp;
                                }
                                while(have(','));
                                mustbe(']');
                                // extend the index vector
                                Node[][]  temp  = new Node[2][indexcount + 1];
                                for(int k = 0; k < indexcount; k++) {
                                    temp[0][k] = initialindices[0][k];
                                    temp[1][k] = initialindices[1][k];
                                }
                                initialindices = temp;
                            }
                        }
                        while(have('['));
                        if(processor.verbose) {
                            System.out.println("evaluating indices, indexcount="
                                               + indexcount);
                        }
                        // compact the index vector
                        if(!subrange) {
                            Node[]  finalindices  = new Node[indexcount];
                            for(int i = 0; i < indexcount; i++) {
                                finalindices[i] = initialindices[0][i];
                                // System.out.println("final indices ["+i+"]="+finalindices[i]);
                            }
                            if(processor.verbose) {
                                System.out.println("before subscription of "
                                                   + V + "\nby " + finalindices);
                            }
                            V = subscript(V, finalindices);
                            // System.out.println("after subscription V="+V+"\n in method variable()");
                        }
                        else {
                            Node[][]  finalindices  = new Node[2][indexcount];
                            for(int i = 0; i < indexcount; i++) {
                                for(int j = 0; j < 2; j++) {
                                    finalindices[j][i] = initialindices[j][i];
                                }
                            }
                            V = subscript(V, finalindices);
                        }
                    }
                    catch(Exception ex1) {
                        error(" in array index computation " + ex1);
                    }
                }
                else if(have('.')) {
                    if(t instanceof Ref) {
                        t = ((Ref) t).pointsTo;
                    }
                    /*
                     *  Delphi extension to allow automatic dereferencing of
                     *  pointers
                     */
                    if(t instanceof Pointer) {
                        t = ((Pointer) t).pointsTo;
                        V = forcederef(V);
                    }
                    if(!(t instanceof RecordType)) {
                        if(!(t instanceof ArrayType)) {
                            error(" .  requires record type not " + V + ":" + t);
                        }
                        try {
                            // dot product or schema subscription
                            if(lex.peek(lex.TT_IDENTIFIER)) {
                                V = ((ArrayType) t).getBound(lex.theString,
                                                             getAddr(V));
                                lex.mustbe(lex.TT_IDENTIFIER);
                            }
                            else {
                                error(" not identifier");
                            }
                        }
                        catch(Exception dp) {
                            // is dot
                            // product---------------------------------------------------------------------
                            // create loop
                            // System.out.println("caught "+dp);
                            Memref     nindex             = (Memref) tempvar(INTEGER);
                            declareLoopIterator(nindex);
                            Node[]     lindices           = new Node[validindices + 1];
                            Node[]     rindices           = new Node[validindices + 1];
                            Node[]     nindices           = new Node[validindices + 1];
                            for(int I = 0; I < validindices; I++) {
                                nindices[I] = indices[I];
                            }
                            nindices[validindices] = nindex;
                            if(validindices <= 1) {
                                lindices = rindices = nindices;
                            }
                            // vector dot product
                            if(validindices >= 2) {
                                lindices = new Node[2];
                                lindices[0] = nindices[0];
                                lindices[1] = nindices[2];
                                rindices = new Node[2];
                                rindices[0] = nindices[2];
                                rindices[1] = nindices[1];
                            }
                            if(((ArrayType) t).rank() == 1) {
                                lindices = new Node[1];
                                lindices[0] = nindex;
                            }
                            // System.out.println(" generated both index sets ");
                            // if(validindices>2)error("dot product not allowed to deliver rank > 2");
                            Node       oldlast            = lastarray;
                            lastarray = null;
                            int        oldmaxrank         = maxRank;
                            int        oldcalls           = callcount;
                            Statement  oldprestatement    = prestatement;
                            prestatement = null;
                            Node       larg               = unary_expression(0,
                                                            (validindices < 2 ? validindices + 1 : 2),
                                                            rindices);
                            // boolean rc=lex.rangechecks;
                            // lex.rangechecks=false;
                            Node       thelastarray       = lastarray;
                            lastarray = oldlast;
                            Node       subV               = subscript(V, lindices);
                            Node       mult               = dyad(subV, larg, "*");
                            // lex.rangechecks=rc;
                            Type       T;
                            Node       total              = tempvar(T = getType(mult));
                            Node       sum                = dyad(total, mult, "+");
                            // System.out.println("V="+V+" t ="+t);
                            Node       lwb                = ((ArrayType) t).getLwb(
                                                                lindices.length - 1, getAddr(V));
                            Node       upb                = ((ArrayType) t).getUpb(
                                                                lindices.length - 1, getAddr(V));
                            int        currentcalls       = callcount;
                            Node       ch                 = checkArrayBoundsNotViolatedInLoopForIndex(
                                                                nindex, lwb, upb);
                            oldcalls += (currentcalls - callcount);
                            Statement  For;
                            Node       action             = assign(total, sum);
                            Node       loopprestatement   = ch;
                            Node       initialise         = assign(total,
                                                                   forcederef(identityElement(T, "+")));
                            Statement  loop               = new Statement(
                                initialise,
                                For = new Statement(
                                new For(
                                    nindex,
                                    lwb,
                                    upb,
                                    new Int(1, INTEGER.type),
                                    new Statement(
                                        loopprestatement = prestatement,
                                        new Statement(
                                            action)))
                                .optimise()));
                            Statement  extraprestatement  = prestatement;
                            prestatement = oldprestatement;
                            loop.setLocal((Memref) total);
                            For.setLocal(nindex);
                            // now try to parallelise
                            // the vector case : vector dot product
                            int        parfactor          = processor.getParallelism(forcederef(sum)
                                                            .returnType());
                            if(validindices < 2
                                    && oldcalls == callcount
                                    && (Format.isReal(T.type) || T.type.equals("int16"))
                                    && lwb.knownAtCompileTime()
                                    && upb.knownAtCompileTime()) {
                                // Array
                                // bounds
                                // are
                                // statically
                                // known
                                // System.out.println("try to parallelise");
                                int  range  = ((Number)(dyad(upb, lwb, "-")
                                                        .eval())).intValue() + 1;
                                if((range % parfactor) != 0) {
                                    parfactor = 1;
                                }
                                // System.out.println("parfactor"+parfactor);
                                if(parfactor > 1) {
                                    long[][]  bounds      = new long[1][2];
                                    bounds[0][0] = 0;
                                    bounds[0][1] = parfactor - 1;
                                    Type      totaltype   = new ArrayType(bounds, T, T.sizeOf(processor));
                                    String    totty       = T.type + " vector ( "
                                                            + parfactor + " )";
                                    Memref    totalarray  = (Memref) tempvar(totaltype);
                                    // build
                                    // up
                                    // partial
                                    // product
                                    // multiple
                                    // words
                                    // at
                                    // a
                                    // time
                                    // in
                                    // this
                                    // which we will cache to a register
                                    Memref    sumarray    = (Memref) tempvar(totaltype);
                                    // then
                                    // store
                                    // it
                                    // in
                                    // this
                                    // variable
                                    // and
                                    // sum
                                    // the
                                    // elements
                                    // of
                                    // the
                                    // array
                                    try {
                                        Node[]     subindices       = rindices;
                                        Node       arg              = mult.eval();
                                        Node       pararg           = parallelise(processor.decast(arg), parfactor, T,
                                                                      nindex);
                                        // System.out.println("pararg="+pararg);
                                        Node       bottomost        = lwb;
                                        Node       setit            = new Assign(nindex,
                                                bottomost);
                                        Node       init             = new Statement(
                                            new Statement(
                                                new Statement(
                                                    loopprestatement,
                                                    new Statement(
                                                        setit)),
                                                new Statement(
                                                    getPreloopAction(nindex))),
                                            new Statement(new Assign(
                                                              totalarray, pararg)));
                                        Node       assign           = new Assign(totalarray,
                                                new Cast(totty, new Dyad(
                                                             forcederef(totalarray,
                                                                        totaltype),
                                                             pararg, "+")));
                                        // System.out.println("init ="+init+"\n assign="+assign);
                                        if(!processor.generateable(assign)) {
                                            error("can not generate parallel code ");
                                        }
                                        Node       newlwb           = dyad(lwb, new Int(
                                                                               parfactor, INTEGER.type), "+");
                                        Statement  newprestatement  = prestatement;
                                        prestatement = oldprestatement;
                                        Statement  ifor;
                                        Statement  dploop           = new Statement(
                                            new Statement(
                                                init,
                                                ifor = new Statement(
                                            new For(
                                                nindex,
                                                newlwb,
                                                upb,
                                                new Int(
                                                    (parfactor),
                                                    INTEGER.type),
                                                new Statement(
                                                    prestatement,
                                                    new Statement(
                                                        assign)))
                                            .optimise(),
                                            new Statement(
                                                new Assign(
                                                    sumarray,
                                                    forcederef(
                                                        totalarray,
                                                        totaltype))))));
                                        ifor.setLocal(nindex);
                                        dploop.setLocal(totalarray);
                                        Node       firstelement     = subscript(sumarray,
                                                                                new Int(0, "int32"));
                                        Node       subtotal         = firstelement;
                                        for(int i = 1; i < parfactor; i++) {
                                            subtotal = dyad(
                                                           subtotal,
                                                           subscript(sumarray,
                                                                     new Int(i, "int32")),
                                                           "+");
                                        }
                                        postPrestatement(dploop);
                                        // System.out.println(dploop);
                                        // System.out.println(subtotal);
                                        unparalleled = true;
                                        // we must set this
                                        // to prevent an
                                        // attempt to
                                        // parallelise
                                        // again on the
                                        // final
                                        // assignment
                                        return subtotal;
                                    }
                                    catch(Exception ex) {
                                        // drop through
                                        if(processor.verbose) {
                                            System.out.println(" " + ex);
                                        }
                                    }
                                }
                            }
                            postPrestatement(loop);
                            unparalleled = true;
                            // we must set this to prevent
                            // an attempt to parallelise
                            // again on the final
                            // assignment
                            // System.out.println(" dot product loop "+loop);
                            return forcederef(total);
                            // end of dot product
                            // -------------------------------------------------------------
                        }
                    }
                    else {
                        mustbe(lex.TT_IDENTIFIER);
                        tryagain = true;
                        Object  f             = ((RecordType) t).lookuptable.get(lex.theId);
                        if(f == null) {
                            throw new UndeclaredVariable(lex.theId, lex.lineno());
                        }
                        if(!(f instanceof Field)) {
                            error(lex.theId + " not a field");
                        }
                        t = ((Field) f).fieldType;
                        t = resolvepointertypes(t);
                        Node    recordaddr    = getAddr(V).eval();
                        Node    fieldoffset   = new Int(((Field) f).offset);
                        Node    finaladdress  = dyad(recordaddr,
                                                     new TypeTag(fieldoffset, ADDRESS), "+").eval();
                        V = new TypeTag(
                            new Memref(finaladdress, t.returnType()), (t));
                        if(dolist()) {
                            System.out.println("field subscription " + lex.theId + ":" + t +
                                               " \n\t" + t.sizeOf(processor) + " bytes" +
                                               "\n\tV=" + V + "\n\tclass of t" + t.getClass()
                                              );
                        }
                        tryagain = true;
                    }
                }
                if(dolist()) {
                    System.out.println("variable " + V + ":" + t + " " + t.sizeOf(processor) + " bytes, return type=" + t.returnType());
                }
            }
            while(tryagain);
            return V;
        }
        catch(Exception addrcalc) {
            error(" in primary expression started by " + id + " " + addrcalc);
        }
        return null;
    }

    Set<Variable> arraysUsedInStatement= new HashSet<Variable>();
    void recordUseOf(Variable var) {
        if(!arraysUsedInStatement.contains(var)) {
            arraysUsedInStatement.add(var);
            //globalOpenCLBuffer.append("/* id "+var+"*/\n");
        }
    }
    Node statement() throws SyntaxError {
        arraysUsedInStatement.clear();
        return super.statement();
    }
    /**
     *  This obtains the address of a variable which must be a memref
     *  and records that it has been used
     *
     *@param  n                a node of type memref
     *@return                  The addr value
     *@exception  SyntaxError  Description of Exception
     */
    Node getAddr(Node n) throws SyntaxError {
        Node n1 = super.getAddr(n);
        if(n instanceof Variable) recordUseOf((Variable)n);
        return n1;
    }

    /** This is passed in a vector containing two pointers to nodes
     * the first is the non gpu version of the code, the second
     * is null. If it succeeds it returns true and fills in the
     * second alternative with a valid code tree for the the
     * host processor that will invoke the gpu code
     * */
    boolean canconverttoGPU(Node[] alternatives, String module) {
        try {
            For outerLoop = getOuterLoop(alternatives[0]);
            Statement barecode = stripForHeadersFrom(outerLoop);
            Set<Node> vars = findVarsIn(barecode);
            Node assignresultbuf = findfirstVarIn(barecode);
            vars.addAll(arraysUsedInStatement);
            Hashtable<String,String> renametab = new Hashtable<String,String>();
            Variable[] iota = getIota(outerLoop);
            Node[] lwbs= getLwbs(outerLoop);
            Node[] upbs= getUpbs(outerLoop);
            for(int i=0; i<iota.length; i++) {
                renametab.put(iota[i].toString(),"iota["+(iota.length-i-1)+"]");
                vars.remove(iota[i]);
                if(! lwbs[i].knownAtCompileTime() || ! upbs[i].knownAtCompileTime())throw new Exception(" only allow gpu for fixed sized arrays for now");
            }
            StringBuffer openCL =new StringBuffer();
            StringBuffer cleanupcode = new StringBuffer();
            openCL.append("/* sourceline "+lex.lineno()+"*/ \n");
            openCL.append("/* ilcg= "+barecode+"*/ \n");
            int i=0;
            Vector params = new Vector();
            for(Node v:vars) {
                // associate both the variable and its address with a parameter name
                if(renametab.get(v.toString())==null)renametab.put(v.toString(),"param"+(i++));
                if(v instanceof Variable) {
                    renametab.put(((Variable)v).index.toString(),"param"+(i-1));
                }
            }
            for(String n :renametab.keySet())
                openCL.append("\n/**"+n+" = "+renametab.get(n)+"*/");
            String kernelname ="kernSourceline_"+lex.lineno()+"_"+alternatives[0].hashCode();
            kernelcount++;
            kernelnames.add(kernelname);
            params=buildParameters(kernelname,removeduplicates(vars,renametab),renametab,openCL,cleanupcode,iota.length, module);
            String param0= renametab.get(assignresultbuf.toString());
            buildIotaInitialisation(iota, renametab, openCL);
            buildTranslationOfStatements(barecode, renametab, openCL);
            globalCKBuffer.append("\n\tcl_event events[1];");
            globalCKBuffer.append("\n\tsize_t globalWorkSize["+iota.length+"]={"+ (upbs[0])+"-"+ (lwbs[0])+"+1");
            if(iota.length==2)globalCKBuffer.append(", "+ (upbs[0])+"-"+ (lwbs[0])+"+1");
            globalCKBuffer.append("}; size_t localWorkSize["+iota.length+"]={1");
            if(iota.length==2)globalCKBuffer.append(", 1};");
            else globalCKBuffer.append("};");
            openCL.append("\n}\n");
            globalCKBuffer.append("\n\terr = clEnqueueNDRangeKernel(queue, kernels[ "+
                                  (kernelcount-1)+
                                  "],"+iota.length+" , NULL, globalWorkSize, localWorkSize,"+
                                  "0, NULL, events);"+
                                  "\n\tif (err!=CL_SUCCESS)"+
                                  "{ fprintf(stderr,\" on source line "+lex.lineno()+" failed to enque  opencl kernel %d\",err);exit(-10); }");
            globalCKBuffer.append("\n\terr=clWaitForEvents (1, events);"+"\n\tif (err!=CL_SUCCESS)"+
                                  "{ fprintf(stderr,\" on source line "+lex.lineno()+" failed waiting on event: %d\",err);exit(-11); }");
            globalCKBuffer.append("\n\terr=  clEnqueueReadBuffer (queue,"+paramtemps.get(param0)+" ,CL_TRUE,0,tempsize,"+param0+",0,NULL,NULL);");
            globalCKBuffer.append(cleanupcode);
            globalCKBuffer.append("\n}\n");
            globalOpenCLBuffer.append(openCL);
            Procedure ext =new  Procedure(kernelname, params.size(),
                                          "int32",
                                          "int32",
                                          new ExtLabel(kernelname),
                                          null,
                                          (LocalStoreAllocator) allocatorStack.peek(),
                                          0);
            ext.isImported=true;
            alternatives[1]=  new Statement(new Monad(new Function(ext),new Cartesian(params)));
            //	System.out.println("->"+alternatives[1]);
            return true;
        }
        catch(Exception ex) {    //System.err.println(" GPU code generation failed for "+lex.lineno()+" because \n\t"+ex);
        }
        return false;
    }
    /** it is possible that multiple entries in vars refer to the same expression
     * go through and create a new table without the duplicates
     * /
     */
    Set<Node> removeduplicates(Set<Node> all,Hashtable<String,String> renametab) {
        Set<Node> firstfilter = filterUsingHashtable(all);
        return removealiases(firstfilter,renametab);
    }
    Set<Node> removealiases(Set<Node> all,Hashtable<String,String> renametab) {
        Set<Node> arrays = new HashSet<Node>();
        Set<Node> nonarrays= new HashSet<Node>();
        Set<Node> dups = new HashSet<Node>();
        for(Node n:all)
            if(Format.isVector(n.returnType())&& n instanceof Variable)arrays.add(n);
            else nonarrays.add(n);
        for(Node a:arrays)
            for(Node b:all)
                if(addressOfAisB((Variable)a,b,  renametab)) {
                    dups . add(b);
                }
        Set <Node> res = new HashSet<Node>();
        res.addAll(all);
        res.removeAll(dups);
        return res;
    }
    boolean addressOfAisB(Variable A, Node B,Hashtable<String,String> renametab) {
        if(A.index.toString().equals(B.toString())) {
            renametab.put(B.toString(),renametab.get(A.toString()));
            return true;
        }
        if(A.index.eval().toString().equals(B.toString())) {
            renametab.put(B.toString(),renametab.get(A.toString()));
            return true;
        }
        if(B instanceof Cast) {
            if(addressOfAisB(A,((Cast)B).subtree,renametab)) {
                renametab.put(B.toString(),renametab.get(A.toString()));
                return true;
            }
        }
        return false;
    }
    Set<Node> filterUsingHashtable(Set<Node> all) {
        Map<String,Node> keyed = new Hashtable<String,Node>();
        for(Node n : all)	 keyed.put(n.toString(),n);
        Set<Node> part = new HashSet<Node>();
        for(Node m:keyed.values()) part.add(m);
        return part;
    }
    /** convert an ilcg type name to an appropriate opencl type name for a parameter */
    static String CLtypeResolve(String ilcgtype) {
        String prefix = " const ";
        if(Format.isRef(ilcgtype)) return CLtypeResolve(Format.typeDeref(ilcgtype));
        if(Format.isVector(ilcgtype)) {
            prefix = "__global ";
            String elem = Format.getVectorElementType(ilcgtype);
            String CLelem = CLtypeResolve(elem);
            return prefix + CLelem + " * ";
        }
        final int[] log= {0, 1,2,0,3,0,0,0,4};
        final String[] signed= {"void","char","short","int","long"};
        int len =Format.lengthInBytes(ilcgtype);
        if(Format.isSigned(ilcgtype))	return signed[log[len]];
        if(Format.isInteger(ilcgtype))	return  "u"+signed[log[len]];
        if(len==4) return "float";
        if(len==8) return "double";
        return "void";
    }
    /** convert an ilcg type name to an appropriate opencl type name for a parameter */
    static String CtypeResolve(String ilcgtype) {
        String prefix = " const ";
        if(Format.isRef(ilcgtype)) return CtypeResolve(Format.typeDeref(ilcgtype));
        if(Format.isVector(ilcgtype)) {
            prefix = "";
            String elem = Format.getVectorElementType(ilcgtype);
            String CLelem = CtypeResolve(elem);
            return prefix + CLelem + " * ";
        }
        final int[] log= {0, 1,2,0,3,0,0,0,4};
        final String[] signed= {"void","char","short","int","long"};
        int len =Format.lengthInBytes(ilcgtype);
        if(Format.isSigned(ilcgtype))	return signed[log[len]];
        if(Format.isInteger(ilcgtype))	return  "u"+signed[log[len]];
        if(len==4) return "float";
        if(len==8) return "double";
        return "void";
    }
    Hashtable<String,String> paramtemps = new Hashtable<String,String>();
    /** This sends to the openCl string buffer the declaration of the parameters
     * that will be needed by the kernel that will perform this task
     * */
    Vector buildParameters(String kernelname,Set<Node>vars,Hashtable<String,String> renametab,StringBuffer openCL, StringBuffer cleanup, int iotalength,String module) {
        openCL.append("__kernel void "+kernelname+"(\n\t\t");
        globalCKBuffer.append("  void "+kernelname+"(\n\t\t");
        StringBuffer paramset= new StringBuffer();
        paramset.append("\n\tint err=0;");
        int i;
        Node [] v = {};
        Vector res=new Vector();
        v= vars.toArray(v);
        //openCL.append("/* number of vars in expression ="+vars.size()+"*/");
        paramset.append("\n\t int tempsize="+Format.lengthInBytes(Format.typeDeref(v[0].returnType()))+";");
        for(i=0; i<v.length; i++) {
            String rt=v[i].returnType();
            openCL.append(CLtypeResolve(rt)+" ");
            globalCKBuffer.append(CtypeResolve(rt)+" ");
            openCL.append(renametab.get(v[i].toString()));
            globalCKBuffer.append(renametab.get(v[i].toString()));
            globalCKBuffer.append("/*"+v[i]+"*/");
            openCL.append("/*"+v[i]+"*/");
            if(v[i] instanceof Variable) {
                res.add(((Variable)v[i]).index);
            }
            else
                res.add(v[i]);
            if(Format.isVector(rt)) {
                String p=renametab.get(v[i].toString());
                paramset.append("\n\tcl_mem temp"+i+"= clCreateBuffer(context"+module+",  CL_MEM_READ_WRITE+CL_MEM_COPY_HOST_PTR,"+
                                Format.lengthInBytes(Format.typeDeref(rt))+",  "+p+", &err); /*"+rt+"*/");
                paramtemps.put(p,"temp"+i);
                paramset.append("\n\tif(err !=CL_SUCCESS) {fprintf(stderr,\"for source line  "+lex.lineno()+ " can not create CL buffer :%d\",err);exit(1);}");
                paramset.append("\n\terr = clSetKernelArg(kernels["+ (kernelcount-1)+"], "+i+", sizeof(cl_mem), &temp"    +   i +");"+
                                "\n\tif(err !=CL_SUCCESS) {fprintf(stderr,\" for source line "+lex.lineno()+
                                " can not set CL kernel argument :%d\",err);exit(1);}");
                cleanup.append("\n\tclReleaseMemObject(temp"+i+");");
            }
            else {
                paramset.append("\n\terr = clSetKernelArg(kernels["+ (kernelcount-1)+"], "+i+", sizeof("+  CtypeResolve(rt)  +"), &"
                                +  renametab.get(v[i].toString()) +");/*"+v[i]+"*/");
                paramset.append("\n\tif(err !=CL_SUCCESS) {fprintf(stderr,\"can not set kernel argument :%d\",err);exit(1);}");
            }
            if(i< v.length-1) openCL.append(",\n \t\t");
            if(i< v.length-1) globalCKBuffer.append(",\n \t\t");
        }
//		 globalCKBuffer.append(", int dim0");
//		 if(iotalength==2)globalCKBuffer.append(", int dim1");
        openCL.append("){\n \t");
        globalCKBuffer.append("){\n \t");
        globalCKBuffer.append("if(clneedsinit"+module+"){startupCL"+module+"();clneedsinit"+module+"=0;}\n\t");
        globalCKBuffer.append(paramset);
        return res;
    }
    /** This sends to the openCl string buffer the declaration and initialisation of the elements of iota
     * that will be needed by the kernel that will perform this task
     * */
    void buildIotaInitialisation(Variable[] iota,Hashtable<String,String> renametab,StringBuffer openCL) {
        openCL.append("int iota["+iota.length+"];\n \t");
        int i;
        for(i=0; i<iota.length; i++)
            openCL.append(renametab.get(iota[i].toString())+" = get_global_id("+(iota.length-1-i)+");\n \t");
    }
    static String anticast(String s,String pattern) {
        int i= s.indexOf(pattern);
        if(i==0)return s.substring(pattern.length());
        return s;
    }
    static String anticast(String s) {
        // give some opencl code with a cast as its leftmost part, strips the cast off
        String[] casts= {"(char)","(int)","(float)","(double)","(long)","(short)"};
        for(String i:casts)s=anticast(s,i);
        return s;
    }
    /** This sends to the openCl string buffer the actual assignment statements
     * that will be needed by the kernel that will perform this task
     * */
    void buildTranslationOfStatements(Statement barecode,Hashtable<String,String> renametab,StringBuffer openCL)
    throws Exception {
        // for (String key : renametab.keySet())openCL.append("//"+ key+"->"+renametab.get(key)+"\n");
        class CLversion implements TreeExaminer {
            boolean fail=false;
            Hashtable<String,String> translation = new Hashtable<String,String>();
            CLversion(Hashtable<String,String> init) {
                translation = new Hashtable<String,String>();
                for(String n:init.keySet())translation.put(n, init.get(n));
                translation.put("FLOAT","(float)");
                translation.put("NOT","!");
                translation.put("SIN","sin");
                translation.put("COS","cos");
                translation.put("div","/");
                translation.put("TAN","tan");
                translation.put("LN","log");
                translation.put("SQRT","sqrt");
                translation.put("ROUND","round");
                translation.put("TRUNCATE","trunc");
            }
            public boolean visit(Node n) {
                return !(translation.containsKey(n.toString()));
            }
            /** This is called after all subtrees have been visited */
            public void leave(Node n) {
                if(translation.get(n.toString())!=null)return;
                if(n instanceof ArraySubscription) {
                    ArraySubscription S = (ArraySubscription)n;
                    String t =translation.get(S.base.toString())+"[";
                    //	if( !(S.base instanceof Memref)){
                    //	t = " "/* + "(("+translation.get(S.base.toString())+"))" */;
                    //	t= /*"(("+CLtypeResolve(S.returnType())+"*)"+ */t+"[";
                    //	}
                    switch(S.indices.length) {
                    case 1:
                        t+=translation.get(S.indices[0].toString());
                        break;
                    case 2:
                        try { // convert 2d indexing to C style indexing
                            t+=translation.get(S.indices[0].toString())+"+(";
                            t+=translation.get(S.indices[1].toString()) +")*(";
                            t+= (S.at.getUpb(1, S.base))+"+1-";
                            t+= (S.at.getLwb(1, S.base))+")";
                        }
                        catch(Exception e) {
                            fail=true;
                        }
                        break;
                    default:
                        fail=true;
                    }
                    translation.put(n.toString(),"("+t+"])");
                }
                else if(n instanceof Memref) {
                    translation.put(n.toString(),"mem["+translation.get(((Memref)n).index.toString())+"]");
                }
                else if(n instanceof Deref) {
                    translation.put(n.toString(), translation.get(((Deref)n).getArg().toString()));
                }
                else if(n instanceof Cast) {
                    Cast C = (Cast)n;
                    String prefix = "("+CLtypeResolve(C.returnType())+")";
                    if(prefix.indexOf("*")>0)prefix =" ";
                    translation.put(n.toString(),prefix+ translation.get(C.subtree.toString())+" ");
                }
                else if(n instanceof Assign) {
                    Assign A= (Assign)n;
                    String lhs=anticast(translation.get(A.dest.toString()));
                    translation.put(n.toString(),lhs+"="+translation.get(A.src.toString()));
                }
                else if(n instanceof Statement) {
                    Statement S = (Statement)n;
                    String f="";
                    String a="";
                    if(S.next!=null)f=translation.get(S.next.toString());
                    if(S.action!=null) a = translation.get(S.action.toString());
                    translation.put(n.toString(),a+";\n\t\t"+f);
                }
                else if(n instanceof Dyad) {
                    Dyad D=(Dyad)n;
                    String left=translation.get(D.left.toString());
                    String right=translation.get(D.right.toString());
                    if(D.O.toString().equals("min"))
                        translation.put(n.toString(),"("+left+"<"+right + "?"+left+":"+right+")");
                    else {
                        if(D.O.toString().equals("max"))
                            translation.put(n.toString(),"("+left+">"+right + "?"+left+":"+right+")");
                        else translation.put(n.toString(),"("+ left+translation.get(D.O.toString())+right+")");
                    }
                }
                else if(n instanceof Monad) {
                    try {
                        Monad m = (Monad) n;
                        translation.put(n.toString(), translation.get(m.oper.toString())+"(" +translation.get(m.getArg().toString())+")");
                    }
                    catch(Exception e1) {
                        translation.put(n.toString(), e1.toString());
                    }
                }
                else translation.put(n.toString(),n.toString());
            }
        }
        CLversion cv = new CLversion(renametab);
        barecode.examine(cv);
        if(cv.fail) {
            openCL.append("could not translate "+barecode);
            throw new Exception("could not translate to opencl");
        }
        openCL.append(cv.translation.get(barecode.toString()));
        // for(Node n:cv.translation.keySet())openCL.append("/* "+n+" ->\n\t"+cv.translation.get(n)+"*/\n");
    }
    /** find all the variables in a block of code */
    Node findfirstVarIn(Node n) {
        class VarFinder extends ilcg.tree.CommonSubExpressionFinder {
            int  count  = 0;
            Node  vars = null;
            /**
             *  This is called after all subtrees have been visited
             */
            public void leave(Node n) {
                if(n instanceof ArraySubscription&&count==0) {
                    ArraySubscription S = (ArraySubscription)n;
                    vars= (S.base);
                    count++;
                }
            }
        }
        VarFinder vf = new VarFinder();
        n.examine(vf);
        return vf.vars;
    }/** find the outermost loop in this code */
    /** find all the variables in a block of code */
    Set<Node> findVarsIn(Node n) {
        class VarFinder extends ilcg.tree.CommonSubExpressionFinder {
            int  count  = 0;
            Set<Node> vars = new HashSet<Node>();
            /**
             *  This is called after all subtrees have been visited
             */
            public void leave(Node n) {
                if(n instanceof Variable) {
                    vars.add((Variable)n);
                    count++;
                }
                if(n instanceof ArraySubscription) {
                    ArraySubscription S = (ArraySubscription)n;
                    vars.add(S.base);
                }
            }
        }
        VarFinder vf = new VarFinder();
        n.examine(vf);
        return vf.vars;
    }/** find the outermost loop in this code */
    /** get the vector of indices used in the nested loop structure */
    Variable[] getIota(For n) {
        class ForFinder extends ilcg.tree.CommonSubExpressionFinder {
            int  count  = 0;
            Variable[] iotas=new Variable[1];
            /**
             *  This is called after all subtrees have been visited
             */
            public void leave(Node n) {
                if(n instanceof For) {
                    count++;
                    Variable[] newiotas = new Variable[count];
                    newiotas[0]=(Variable)(((For)n).inductionVariable);
                    for(int i=1; i<newiotas.length; i++)newiotas[i]=iotas[i-1];
                    iotas= newiotas;
                }
            }
        }
        ForFinder f = new ForFinder();
        n.examine(f);
        if(f.count>0) return f.iotas;
        return null;
    }
    /** get the vector of lowerbounds used in the nested loop structure */
    Node[] getLwbs(For n) {
        class ForFinder extends ilcg.tree.CommonSubExpressionFinder {
            int  count  = 0;
            Node[] bounds=new Node[1];
            /**
             *  This is called after all subtrees have been visited
             */
            public void leave(Node n) {
                if(n instanceof For) {
                    count++;
                    Node[] newbounds = new Node[count];
                    newbounds[0]=(Node)(((For)n).start);
                    for(int i=1; i<newbounds.length; i++)newbounds[i]=bounds[i-1];
                    bounds= newbounds;
                }
            }
        }
        ForFinder f = new ForFinder();
        n.examine(f);
        if(f.count>0) return f.bounds;
        return null;
    }
    /** get the vector of upperbounds used in the nested loop structure */
    Node[] getUpbs(For n) {
        class ForFinder extends ilcg.tree.CommonSubExpressionFinder {
            int  count  = 0;
            Node[] bounds=new Node[1];
            /**
             *  This is called after all subtrees have been visited
             */
            public void leave(Node n) {
                if(n instanceof For) {
                    count++;
                    Node[] newbounds = new Node[count];
                    newbounds[0]=(Node)(((For)n).finish);
                    for(int i=1; i<newbounds.length; i++)newbounds[i]=bounds[i-1];
                    bounds= newbounds;
                }
            }
        }
        ForFinder f = new ForFinder();
        n.examine(f);
        if(f.count>0) return f.bounds;
        return null;
    }
    /** find the outermost loop in this code */
    For getOuterLoop(Node n) {
        class ForFinder extends ilcg.tree.CommonSubExpressionFinder {
            int  count  = 0;
            For it=null;
            /**
             *  This is called after all subtrees have been visited
             *
             */
            public void leave(Node n) {
                if(n instanceof For) {
                    it = (For)n;
                    count++;
                }
            }
        }
        ForFinder f = new ForFinder();
        n.examine(f);
        if(f.count>0) return f.it;
        return null;
    }
    /** This replaces a loop with the statements inside the loop, doing
     *  this recursively to inner loops so what you get back is the
     *  sequence of code that would be run if the loop iterators were
     *  initialised outside the loops and the code for each loop run once
     * */
    Statement stripForHeadersFrom(For loop)throws Exception {
        For f = loop;
        Statement body = new Statement(loop);
        while(f != null) {
            body = (Statement)ExpressionSubstituter.substituteAwithBinC(f,f.action, body);
            f=getOuterLoop(body);
        }
        return body;
    }

    void loadUnit(String unit, String cpuname) throws SyntaxError {
        String  pref  = pathPrefix;
        if(unit.equals("system") || unit.equals("threadlib")) {
            pathPrefix = System.getProperty("mmpcdir", pref).replace("\\", "/");
            if(!pathPrefix.endsWith("/")) {
                pathPrefix = pathPrefix + "/";
            }
        }
        else {
            String name = cpuname.replaceFirst("CG","");
            name= unit+name;
            if(AsmLink.libs.indexOf(name)<0)AsmLink.libs+=(" "+ name +".c ");
        }
           String prefused = findunitprefix(unit); 
	        if(!uptodate(unit ,prefused))
        {
            compileUnit(unit, cpuname);
        }
        unitsUsed.addElement("\"" + pathPrefix + unit + cpuname + ".asm\"");
        unitsToCall.addElement(unit);
        // declareExternal("unit$"+unit+"$base");
        for(int i = 1; i < 3; i++) {
            try {
                FileInputStream    f  = new FileInputStream(pathPrefix + unit
                        + cpuname + ".mpu");
                ObjectInputStream  s  = new ObjectInputStream(f);
                Dictionary         d  = (Dictionary) s.readObject();
                s.close();
                symbolTable.enterScope(d);
                symbolTable.put(unit, new UnitHolder(d, unit));
                assembledUnits = assembledUnits + " " + pref + unit + cpuname
                                 + ".o";
                // System.out.println(assembledUnits);
                pathPrefix = pref;
                return;
            }
            catch(Exception e) {
                compileUnit(unit, cpuname);
                if(i > 1) {
                    error(" loading unit " + unit + " :" + e);
                }
            }
        }
    }
    void compileUnit(String unit, String apuname) throws SyntaxError {
        String  asmfile  = pathPrefix + unit + apuname + ".asm";
        try {
            // Walker w = (Walker) processor.getClass().newInstance();
            Walker                  w       = getCodeGenerator(apuname + "CG", processor.getLogFile());
            w.verbose = processor.verbose;
            FileInputStream         sf      = new FileInputStream(pathPrefix + unit  + ".pas");
            java.io.FileDescriptor  fd      = sf.getFD();
            if(!fd.valid()) {
                error(unit + ".pas invalid file");
            }
            // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
            // FileReader(fd));
            Reader                  source  = new InputStreamReader(sf, "UTF-8");
            PascalCompiler          p       = new GPUPascal(pathPrefix, w, source, unit
                    + ".pas");
            p.notifier = notifier;
            PrintWriter             asm     = new PrintWriter(new FileOutputStream(asmfile));
            // System.out.println(pathPrefix + unit + ".pas");
            w.setLogfile(new PrintWriter(new FileOutputStream(pathPrefix + unit
                                         + getprocessorname() + ".lst")
                                         // System.out // to be shown on the screen instead of the file *.lst
                                        ));
            asm.println(w.directivePrefix() + "ifndef " + unit);
            w.defineSymbol(unit);
            w.defineSymbol("definedunit$" + unit + "$base");
            p.compile(asm, intermediateFile, pathPrefix + unit + apuname);
            // System.out.println(unit+" compiled");
            for(int u = 0; u < p.unitsUsed.size(); u++) {
                asm.println(w.directivePrefix() + "include "
                            + p.unitsUsed.elementAt(u));
            }
            asm.println(w.directivePrefix() + "endif");
            asm.close();
        }
        catch(Exception e) {
            try {
                File  f  = new File(pathPrefix + unit + apuname + ".asm");
                if(f.exists()) {
                    System.out.println("Deleting " + pathPrefix + unit
                                       + apuname + ".asm");
                    f.delete();
                }
                f = new File(pathPrefix + unit + apuname + ".mpu");
                if(f.exists()) {
                    System.out.println("Deleting " + pathPrefix + unit
                                       + apuname + ".mpu");
                    f.delete();
                }
            }
            catch(Exception fe) {
            }
            error(unit + ":" + e);
        }
        // if(!processor.assemble(asmfile,pathPrefix+unit+".o"))error(unit+" assembly failed");
        // System.out.println(" assembled");
    }

    /**
     *  return true if file f1 newer than file f2
     *
     *@param  f1  Description of Parameter
     *@param  f2  Description of Parameter
     *@return     Description of the Returned Value
     */
    boolean f1newerthanf2(String f1, String f2) {
        // System.out.println("is " + f1 + " newer than " + f2);
        boolean  ok  = new File(f1).lastModified() > new File(f2).lastModified();
        // System.out.println(ok);
        return ok;
    }

    /**
    	 *  main entry point of the program
    	 *
    	 *@param  args  The command line arguments
    	 */

    public static void main(String[] args) {
        PrintWriter  asm;
        PrintWriter  lst;
        try {
            int                     i;
            String                  cgname          = defaultcg;
            boolean                 console         = false;
            String                  assemprefix     = "";
            boolean                 cputest         = false;
            boolean                 dontassemble    = false;
            boolean                 dontlink        = false;
            int                     disp            = args[0].indexOf(".pas");
            if(disp > 0) {
                args[0] = args[0].substring(0, disp);
            }
            String                  asmfile         = "p.asm";
            String                  ofile           = "p.o";
            String                  outfile         = "p.exe";
            Vector                  defines         = new Vector();
            rtldir = (System.getProperty("mmpcdir", ".")).replace("\\", "/");
            // System.out.println("mmpcdir="+rtldir);
            AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
            AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
            AsmLink.gc = rtldir + "/" + AsmLink.gc;
            AsmLink.rtldir = rtldir;
            int                     threadcount     = 1;
            String                  path            = "";
            int                     maxapu          = -1;
            String[]                apus            = new String[10];
            for(i = 0; i < args.length; i++) {
                // System.out.println(args[i]);
                if(args[i].startsWith("-h") || args[i].startsWith("--h")
                        || args[i].startsWith("?")) {
                    System.out.println(helptext);
                    System.exit(0);
                }
                if(args[i].startsWith("-fastforloop")) {
                    usePascalForDefinition = false;
                }
                if(args[i].startsWith("-nolink")) {
                    dontlink = true;
                }
                if(args[i].startsWith("-cores")) {
                    String  nums  = args[i].substring(6);
                    // strip of -cores
                    threadcount = new java.lang.Integer(nums).intValue();
                }
                else if(args[i].startsWith("-BOEHM")) {
                    AsmLink.gcenable = true;
                }
                else if(args[i].startsWith("-NOBOEHM")) {
                    AsmLink.gcenable = false;
                }
                else if(args[i].startsWith("-count")) {
                    Walker.linecount = true;
                }
                else if(args[i].startsWith("-parallelsum")) {
                    reduceparallelise = true;
                }
                else if(args[i].startsWith("-switchon")) {
                    int  last_dot  = args[i].lastIndexOf("..");
                    if(last_dot != -1) {
                        Walker.switchon = new java.lang.Integer(args[i]
                                                                .substring(9, last_dot)).intValue();
                        Walker.switchoff = new java.lang.Integer(args[i]
                                .substring(last_dot + 2)).intValue();
                    }
                    else {
                        Walker.switchon = new java.lang.Integer(args[i]
                                                                .substring(9)).intValue();
                    }
                }
                else if(args[i].startsWith("-cputest")) {
                    cputest = true;
                }
                else if(args[i].startsWith("-gnu")) {
                    assemprefix = "gnu";
                }
                else if(args[i].startsWith("-opt")&& args[i].length()==5) {
                    optimisationlevel = (int)args[i].charAt(4)-'0';
                }
                else if(args[i].startsWith("-opt1")) {
                    optimisationlevel = 1;
                }
                else if(args[i].startsWith("-opt2")) {
                    optimisationlevel = 2;
                }
                else if(args[i].startsWith("-opt0")) {
                    optimisationlevel = 0;
                }
                else if(args[i].startsWith("-opt3")) {
                    optimisationlevel = 3;
                }
                else if(args[i].startsWith("-apu")) {
                    if(args[i].length() < 7) {
                        throw new Exception(
                            "on command line, apu parameter invalid: "
                            + args[i]);
                    }
                    char  nc  = args[i].charAt(4);
                    if(nc > '9' || nc < '0') {
                        throw new Exception(
                            "on command line, apus must be in range 0..9");
                    }
                    int   n   = (int)(nc - '0');
                    if(n > (maxapu + 1)) {
                        throw new Exception("on command line, apu" + nc
                                            + " specified before apu" + (n - 1));
                    }
                    if(n > maxapu) {
                        maxapu = n;
                    }
                    apus[n] = args[i].substring(6);
                    Apus = new String[n + 1];
                    for(short ii = 0; ii <= n; ii++) {
                        Apus[ii] = apus[ii];
                    }
                }
                else if(args[i].startsWith("-cpu")) {
                    cgname = args[i].substring(4) + "CG";
                }
                else if(args[i].startsWith("-mmpcdir=")) {
                    rtldir = (args[i].substring(9)).replace("\\", "/");
                    // System.out.println("mmpcdir="+rtldir);
                    AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
                    AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
                    AsmLink.gc = rtldir + "/" + AsmLink.gc;
                }
                else if(args[i].startsWith("-A")) {
                    asmfile = args[i].substring(2);
                }
                else if(args[i].startsWith("-L")) {
                    latexLevel = 4;
                }
                else if(args[i].startsWith("-L1")) {
                    latexLevel = 1;
                }
                else if(args[i].startsWith("-L2")) {
                    latexLevel = 2;
                }
                else if(args[i].startsWith("-L3")) {
                    latexLevel = 3;
                }
                else if(args[i].startsWith("-L0")) {
                    latexLevel = 0;
                }
                else if(args[i].startsWith("-NOVPWORDS")) {
                    novpwords = true;
                }
                else if(args[i].startsWith("-V")) {
                    verbose = true;
                }
                else if(args[i].startsWith("-o")) {
                    outfile = args[i].substring(2);
                }
                else if(args[i].startsWith("-console")) {
                    console = true;
                }
                else if(args[i].startsWith("-inter")) {
                    intermediateFile = true;
                }
                else if(args[i].startsWith("-S")) {
                    dontassemble = true;
                }
                else if(args[i].startsWith("-f")) {
                    AsmLink.objectformat = args[i].substring(2);
                }
                else if(args[i].startsWith("-d")) {
                    path = args[i].substring(2);
                }
                else if(args[i].startsWith("-D")) {
                    defines.add(args[i].substring(2));
                }
                else if(args[i].startsWith("-nobalance")) {
                    Dyad.treeBalance = false;
                }
                else if(args[i].startsWith("-T")) {
                    training = true;
                }
                else if(args[i].startsWith("-U")) {
                    Walker.procprefix = "_";
                }
                else if(args[i].endsWith(".a") || args[i].endsWith(".c")
                        || args[i].endsWith(".s") || args[i].endsWith(".o")) {
                    AsmLink.rtl = AsmLink.rtl + " " + args[i];
                }
                // do these again
            }
            int                     dispout         = outfile.indexOf(".pas");
            if(dispout > 0) {
                outfile = outfile.substring(0, dispout);
            }
            if(AsmLink.objectformat.equals("coff")) {
                // Walker.procprefix = "_";
            }
            if(AsmLink.objectformat.equals("elf")) {
                // Walker.procprefix = "";
            }
            asmfile = path + asmfile;
            outfile = path + outfile;
            // if(intermediateFile)System.out.println("using intermediate file");
            if(cgname == "undefined cpu") {
                throw new Exception(
                    "target CPU not defined on command line "
                    + "\nUsage:\n\t java ilcg.pascal.PascalCompiler sourcefile -cpuCPU");
            }
            cgname = assemprefix + cgname;
            asm = new PrintWriter(new FileOutputStream(asmfile));
            if(console) {
                lst = new PrintWriter(System.err);
            }
            else {
                lst = new PrintWriter(new FileOutputStream(path + args[0]
                                      + ".lst"));
            }
            ilcg.tree.Walker        w               = getCodeGenerator(cgname, lst);
            w.setLogfile(lst);
            if(optimisationlevel >= 0) {
                w.setOptimisationLevel(optimisationlevel);
                if(w.optimisationLevel > 0) {
                    For.optimiseon = true;
                }
                if(w.optimisationLevel > 1) {
                    For.loopunroll = true;
                }
            }
            w.verbose = verbose;
            System.out.println("Glasgow GPU Pascal Compiler (with vector exensions)");
            if(cputest) {
                if(!w.selftest()) {
                    System.out.println("cputest fails");
                    System.exit(-1);
                }
                System.out.println("cputest ok");
                // System.exit(0);
            }
            FileInputStream         sf              = new FileInputStream(path + args[0] + ".pas");
            java.io.FileDescriptor  fd              = sf.getFD();
            if(!fd.valid()) {
                throw new IOException(args[0] + ".pas invalid file");
            }
            // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
            // FileReader(fd));
            Reader                  source          = new InputStreamReader(sf);
            try {
                source = new InputStreamReader(sf, "UTF-8");
            }
            catch(UnsupportedEncodingException ue) {
                System.out.println("utf-8 not supported using ascii");
                source = new InputStreamReader(sf);
            }
            if(threadcount > 1) {
                AsmLink.rtl = AsmLink.rtl + " " + rtldir + "/" + "threadlib.c "
                              + rtldir + "/" + cgname + "taskexecute.s -pthread";
            }
            // if (!path.endsWith("/")) path=path+"/";
            PascalCompiler          pascalCompiler  = (threadcount == 1 ?
                    new GPUPascal(path, w, source, args[0] + ".pas")
                    : new MultiThreadPascal(path, w, source, args[0] + ".pas",threadcount));
            try {
                pascalCompiler.defineSymbol(cgname);
                pascalCompiler.lex.defineSymbols(defines);
                if(novpwords) {
                    pascalCompiler.excludeReservedWords(pascalCompiler.vpExtensions);
                }
                // if(intermediateFile)System.out.println("using intermediate file");
                // asm.println(";#compiler version "+PascalCompilerVer.VERSION);
                if(!w.macrofile().equals("")) {
                    asm.println(w.directivePrefix() + "include \"" + rtldir
                                + "/" + w.macrofile() + "\"");
                }
                if(verbose) {
                    System.out.print(" " + w.invocations);
                }
                pascalCompiler.compile(asm, intermediateFile, path + args[0]);
                if(verbose) {
                    System.out.print(" " + w.invocations);
                }
                for(int u = 0; u < pascalCompiler.unitsUsed.size(); u++) {
                    asm.println(w.directivePrefix() + "include "
                                + pascalCompiler.unitsUsed.elementAt(u));
                }
                asm.println(w.sectionDirective() + " .data");
                w.reservebytes(256);
                System.out.println("compiled");
                asm.close();
                if(!dontassemble) {
                    if(dontlink) {
                        ofile = path + args[0] + ".o";
                    }
                    if(!w.assemble(asmfile, ofile)) {
                        throw new Exception("assembly failed");
                    }
                    if(!dontlink) {
                        if(!w.link(ofile, outfile)) {
                            throw new Exception("linking failed");
                        }
                    }
                }
                lst.close();
                if(new Random().nextFloat() > 0.7) {
                    // save the cached compilation details
                    FileOutputStream  fo  = new FileOutputStream(cgname + ".vwu");
                    ZipOutputStream   zo  = new ZipOutputStream(fo);
                    zo.putNextEntry(new ZipEntry(cgname));
                    ObjectOutput      so  = new ObjectOutputStream(zo);
                    so.writeObject(w);
                    so.flush();
                    so.close();
                }
            }
            catch(Exception e) {
                lst.close();
                asm.close();
                System.out.println("compilation failed" + e);
                if(verbose)e.printStackTrace();
                System.out.flush();
                System.exit(-1);
            }
        }
        catch(Exception e) {
            System.out.println(e);
            System.exit(-1);
        }
    }
    Node program() throws SyntaxError {
        if(have("library")) {
            inlib = true;
            return unit();
        }
        if(have("unit")) {
            return unit();
        }
        mustbe("PROGRAM");
        mustbe(lex.TT_IDENTIFIER);
        String     name  = lex.theString;
        if(AsmLink.libs.indexOf(name)<0)AsmLink.libs+=(" "+ name +".c ");
        enterScope();
        unitbase = new Label("PmainBase");
        lexicalLevel = global;
        // Node heading =program_headingopt() ;
        if(have('(')) {
            mustbe(lex.TT_IDENTIFIER);
            while(have(',')) {
                mustbe(lex.TT_IDENTIFIER);
            }
            mustbe(')');
        }
        mustbe(lex.TT_SEMICOLON);
        useSpec();
        enterScope();
        Block      bl    = (Block) block();
        leaveScope();
        // System.out.println("block ="+bl);
        mustbe(lex.TT_FULLSTOP);
        if(latexLevel >= 0) {
            String      fileName  = pathPrefix + sourceName;
            vPTeX.printToDoc(fileName,
                             "\\documentclass[10pt, a4paper]{article}\n"
                             + "\\usepackage{graphicx, epsfig}\n"
                             + "\\reversemarginpar\n" + "\\title{" + sourceName
                             + "}\n" + "\\begin{document}\n" + "\\maketitle\n",
                             true);
            vPTeX.printToDoc(fileName, "\\tableofcontents\n\\section{" + name
                             + "}", false);
            PascalFile  latexer   = new PascalFile(fileName);
            latexer.createLatex((byte) latexLevel, true, false);
            Object[]    units     = new Object[unitsToCall.size()];
            for(int y = 0; y < unitsToCall.size(); y++) {
                units[y] = unitsToCall.elementAt(y);
            }
            for(int x = 0; x < units.length; x++) {
                String  uname  = units[x].toString();
                if(!uname.equals("system")) {
                    vPTeX.printToDoc(fileName, "\\section{" + uname
                                     + "}\n\\input{" + uname + "}\n", false);
                }
            }
            System.out.println(fileName + "->TeX");
            vPTeX.printToDoc(fileName, "\\end{document}", false);
        }
        leaveScope();
        Object[]   arr   = new Object[unitsToCall.size()];
        for(int y = 0; y < unitsToCall.size(); y++) {
            arr[y] = unitsToCall.elementAt(y);
        }
        Procedure  main  = new Procedure("Pmain", 0, "[]", "void", new Label(),
                                         bl, global, arr);
        main.isExported = true;
        // System.out.println(wholeProgram==null);
        return new Statement(wholeProgram, new Statement(main, new Statement(
                                 dataDecls, null)));
    }
    String currentmodule;
    /**
    	 *  Invokes parsing,optimization and code generation, output to PrintWriter asm
    	 *
    	 *@param  asm               Assembler file to output
    	 *@param  intermediateFile  file to write ilcg to
    	 *@param  module            name of module being compiled
    	 *@exception  Exception     Description of Exception
    	 */
    public void compile(PrintWriter asm,
                        boolean intermediateFile,
                        String module)	 throws Exception {
        currentmodule=module;
        super.compile(asm, intermediateFile,module);
        FileOutputStream clf = new FileOutputStream(module+".cl");
        PrintWriter clw = (new PrintWriter(clf));
        clw.println(globalOpenCLBuffer);
        clw.close();
        generateCLProgramLoadCode(module);
        globalCBuffer.append(globalCKBuffer);
        clf=  new FileOutputStream(module+".c");
        clw = (new PrintWriter(clf));
        clw.println(globalCBuffer);
        clw.close();
    }
    void generateCLProgramLoadCode(String module) {
        globalCBuffer.append(
            "#include <fcntl.h>\n"+
            "#include <stdio.h>\n"+
            "#include <stdlib.h>\n"+
            "#include <string.h>\n"+
            "#include <math.h>\n"+
            "#include <unistd.h>\n"+
            "#include <sys/types.h>\n"+
            "#include <sys/stat.h>\n"+
            "#include <CL/opencl.h>\n"+
            "\nconst char *KernelSource"+module+" =");
        convert2Cinline(globalOpenCLBuffer,globalCBuffer);
        globalCBuffer.append(";\n");
        globalCBuffer.append(
            "cl_device_id device_id"+module+";           // device ID\n"+"\nint clneedsinit"+module+"=1;\n"+
            "cl_context context"+module+";               // context\n"+
            "cl_command_queue queue;           // command queue\n"+
            "cl_program program;               // program\n"+
            "cl_kernel kernels["+kernelcount+"];                 // kernel\n"+
            "void startupCL"+module+"(){\n\tint err;\n"+
            "    cl_platform_id plats[3];\n"+
            "    cl_uint num_plats;\n"+
            "    err= clGetPlatformIDs(3,plats,&num_plats);\n"+
            "    if(err!=CL_SUCCESS){fprintf(stderr,\"can not get platform ids\");exit(-1);}\n"+
            "#ifdef VERBOSE\n"+
            "	fprintf(stderr,\"%d platforms\\n\",num_plats);\n"+
            "#endif	\n"+
            "// Get an ID for the device   \n"     +
            "    int gpu = 1; cl_uint devicecount;\n"+
            "    err = clGetDeviceIDs(plats[0], gpu ? CL_DEVICE_TYPE_GPU : CL_DEVICE_TYPE_CPU,   1,       &device_id"+module+", &devicecount);\n"+
            "    if(err != CL_SUCCESS){gpu=0;err = clGetDeviceIDs(plats[0], gpu ? CL_DEVICE_TYPE_GPU : CL_DEVICE_TYPE_CPU, 1,       &device_id"+module+", &devicecount);}\n"+
            "#ifdef VERBOSE\n"+
            "	fprintf(stderr,\"using device type %d\\n\" ,gpu);\n"+
            "#endif	\n"+
            "    if (err != CL_SUCCESS) { fprintf(stderr,\"failed to get open cl device: %d\",err);exit(-1);}\n"+                                                    //
            "    // Create a context   \n"+
            "    context"+module+" = clCreateContext(0, 1, &device_id"+module+", NULL, NULL, &err);\n"+
            "    if (err!=CL_SUCCESS) { fprintf(stderr,\"failed to create opencl context: %d \",err);exit(-2); }\n"+
            "    // Create a command queue   \n"+
            "    queue = clCreateCommandQueue(context"+module+", device_id"+module+", 0, &err);\n"+
            "   if (err!=CL_SUCCESS)   { fprintf(stderr,\"failed to create opencl command queue : %d\",err);exit(-3); }\n"+
            "    // Create the compute program from the source buffer    \n"+
            "    program = clCreateProgramWithSource(context"+module+", 1,(const char **) & KernelSource"+module+", NULL, &err);\n"+
            "    if ( err!=CL_SUCCESS){ fprintf(stderr,\"failed to compile the opencl programme \");exit(-4); }\n"+
            "    // Build the program executable  \n"+
            "    err = clBuildProgram(program, 0, NULL, NULL, NULL, NULL);\n"+
            "    if (err != CL_SUCCESS){\n"+
            "        size_t len; char buffer[2048];\n"+
            "        fprintf(stderr,\"Error: Failed to build program executable\\n\");  \n"+
            "        clGetProgramBuildInfo(program, device_id"+module+", CL_PROGRAM_BUILD_LOG, sizeof(buffer), buffer, &len);\n"+
            "        fprintf(stderr,\"%s\\n\", buffer);\n"+
            "        exit(1);\n"+
            "    }\n");
        int i;
        for(i=0; i<kernelcount; i++)
            globalCBuffer.append(
                "\tkernels["+i+"] = clCreateKernel(program, \"" + kernelnames.get(i)+"\", &err);\n"+
                "\tif (!kernels["+i+"] || err != CL_SUCCESS) { fprintf(stderr,\"failed to create opencl kernel "+
                kernelnames.get(i)+
                "\");exit(-5); }\n");
        globalCBuffer.append("}\n");
    }

}
