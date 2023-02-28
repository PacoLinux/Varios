package ilcg.Pascal;

import ilcg.SyntaxError;
import ilcg.tree.Assign;
import ilcg.tree.AssignStreaming;
import ilcg.tree.Block;
import ilcg.tree.Deref;
import ilcg.tree.ExpressionSubstituter;
import ilcg.tree.For;
import ilcg.tree.Goto;
import ilcg.tree.Int;
import ilcg.tree.Label;
import ilcg.tree.LocalStoreAllocator;
import ilcg.tree.Memref;
import ilcg.tree.Node;
import ilcg.tree.Procedure;
import ilcg.tree.Statement;
import ilcg.tree.Type;
import ilcg.tree.TreeModifier;
import ilcg.tree.Variable;
import ilcg.tree.Walker;
import ilcg.tree.If;
import ilcg.tree.Dyad;
import java.io.Reader;
import java.util.Vector;
import java.io.*;
import java.util.*;
import java.util.zip.*;
public class MultiThreadPascal extends PascalCompiler {
    /**
     * This class extends the compiler so that assignment statements for 2
     * dimensional arrays are run on more than one core
     */
    int tasks;
    Node threshold = new Int(-1);// the amount of work a loop must do to be worth multithreading

    MultiThreadPascal(String path, Walker w, Reader source, String sourcename,
                      int Tasks) {
        super(path, w, source, sourcename);
        lex.rangechecks=false;
        tasks = Tasks;
        usePascalForDefinition = false;
    }

    class treesubs implements TreeModifier {
        Node key,value;
        String ks;
        treesubs(Node k, Node v) {
            key=k;
            value=v;
            ks=key.eval().toString();
            // System.out.println("key="+ks);
        }
        public boolean visit(Node n) {
            return true;
        }

        /** This returns the rewritten node n */
        public Node modified(Node n) {
            if(n == null) return null;
            //System.out.println("try to modify "+n);
            if(n.eval().toString().equals(ks)) {
                // System.out.println("OK");
                return value;
            }
            return n.modify(this);
        }
    }
    public void useSpec() throws SyntaxError {
        if(!isSystemUnit) {
            loadUnit("system");
        }
        if(!isThreadUnit && !isSystemUnit) {
            loadUnit("threadlib");
        }
        if(have("uses")) {
            uselist();
            mustbe(';');
            symbolTable.enterScope();
        }
    }


    BitSet multicorelines = new BitSet();
    void profprint() {
        try { String listf;
            FileOutputStream fs=new FileOutputStream(listf=(pathPrefix+sourceName).replace(".pas",".lis"));
            PrintStream pw = new PrintStream(fs);
            FileReader ft = new FileReader(pathPrefix+sourceName);
            int c;
            boolean finished=false;
            int l=1;
              System.out.println("\nGenerating SIMD and Multi-core parallelism analysis to "+listf);
            pw.println("listing of file "+sourceName);
            pw.println("       +---A 'P' at the start of a line indicates the line has been SIMD parallelised");
            pw.println("       |+--An 'M' at the start of a line indicates the line has been multi-core parallelised");
            pw.println("       ||");
            pw.println("       vv");
            while(!finished) {
                pw.format("%6d ",l);
                if(parlines.get(l))pw.print("P");
                else pw.print(" ");
                if(multicorelines.get(l))pw.print("M");
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
    int withinpar=0;
    Node statement() throws SyntaxError {
        // this is extended to support parallel for statements
        // these are triggered by a {$par) comment immediately
        // before the for statement
        // since the parallel fors are run on different stacks
        // the whole for loop is run in a procedure which can be
        // called on differnt calls. Thus we have to go into a scope
        // when we enter the parallel for and we have to allocate
        // a temporary loop iterator variable so as not to have a race condition on the variable
        // any nested fors must likewise have local loop iterators
        if(!lex.parfor) {
            if(withinpar>0) {
                if(lex.have("FOR"))try {
                        Node t=tempvar(INTEGER);
                        Node i = variable();
                        declareLoopIterator(i);
                        mustbe(lex.TT_ASSIGN);
                        Node       start        = expression();
                        int step =1;
                        if(have("DOWNTO")) {
                            step=-1;
                        }
                        else  mustbe("TO");
                        Node finish = expression();
                        mustbe("DO");
                        withinpar++;
                        Node action = statement();
                        withinpar--;
                        Node res= new For(i,start,finish, new Int(step,"int32"),action);
                        res = new Statement(getPreloopAction(i), new Statement(
                                                checkArrayBoundsNotViolatedInLoopForIndex(i, start,
                                                        finish), new Statement(res)));
                        iteratorset.remove(i);
                        freeIterator(i);
                        // indicate that the iterator is cachable
                        Statement s=new Statement(prestatement,new Statement(res));
                        prestatement=null;
                        treesubs ts=new treesubs(i,t);
                        //  System.out.println("s="+s);
                        Node res1= s.modify(ts);
                        // System.out.println("modified s="+res1);
                        return res1;
                    }
                    catch(Exception e1) {
                        error("in serial for nested within a parallel one \n"+e1);
                    }
            }
        }
        else {
            // execute this if we have parfor true and a for loop
            Node taskid = new Int(0, intrep);
            if(lex.have("FOR"))try {
                    lex.parfor=false;
                    taskid = handleProcScopes();// go into procedure scope
                    if(lex.peek(lex.TT_WORD)) {
                        String id = lex.theString;
                        declareVar(id,INTEGER);//declare as a local
                    }
                    Node i = variable();
                    declareLoopIterator(i);
                    mustbe(lex.TT_ASSIGN);
                    Node       start        = expression();
                    mustbe("TO");
                    Node finish = expression();
                    mustbe("DO");
                    withinpar++;
                    Node action = statement();
                    withinpar--;
                    Node serialversion=new For(i,start,finish,new Int(1,"int32"),action);
                    Node step=new Int(tasks,"int32");// default is to interleave  indices between task
                    if(lex.blockpar) { // otherwise each task is given a set of adjacent indices
                        Node blocksize = dyad(new Int(1,"int32"),dyad(dyad(new Int(1,"int32"),dyad(finish,start,"-"),"+"),step,"DIV"),"+");
                        start = dyad(start,dyad(taskid,step,"*"),"+");
                        step = new Int(1,"int32");
                        Node t = tempvar(INTEGER);
                        postPrestatement(new Assign(t,dyad(finish, dyad(dyad(blocksize,step,"-"),start,"+"),"MIN")));
                        finish = new Deref(t);
                    }
                    else {
                        start =dyad(start, taskid, "+");
                    }
                    Node res= new For(i,start,finish, step,action);
                    Node cost= res.getCost();
                    res = new Statement(getPreloopAction(i), new Statement(
                                            checkArrayBoundsNotViolatedInLoopForIndex(i, start,  finish), new Statement(res)));
                    iteratorset.remove(i);
                    freeIterator(i);
                    res=new Statement(prestatement,new Statement(res));
                    prestatement=null;
                    Block bl = new Block(res, (LocalStoreAllocator) allocatorStack.peek());
                    leaveprocscopes();
                    String nom;
                    Label l = new Label();
                    Node p = formProcFrom(bl, nom = ("stubforass" + (procstubcount++)),l);
                    wholeProgram = new Statement(p, wholeProgram);
                    Node diversion = goAround(p);
                    Statement parcalls = null;
                    Statement sercalls = null;
                    for(int tr = 0; tr < tasks; tr++) { // launch multiple calls of the
                        // routine for different rows
                        Node[] params = { l, new Deref(processor.getFP()),
                                          new Int(tr, "int32")
                                        };
                        Node call = procCall("post_job", params);
                        Node[] p2 = { new Int(tr, "int32") };
                        Node delay = procCall("wait_on_done", p2);
                        // lauch all the tasks first then wait
                        // for completion
                        parcalls = new Statement(call, new Statement(parcalls,
                                                 new Statement(delay)));
                        {
                            Node[]param = {new Int(tr,"int32")};
                            sercalls = new Statement(procCall(nom,param),    new Statement(sercalls));
                        }
                    }
                    multicorelines.set(lex.lineno());
                    Node runningparallel =(Node) symbolTable.checkedGet("runningparallel");
                    parcalls=new Statement(new Assign(runningparallel,new Int(-1,"int32")),
                                           new Statement(parcalls,
                                                         new Statement(new Assign(runningparallel,new Int(0,"int32")))));
                    //System.out.println(" cost="+cost);
                    res =
                        new If(dyad(dyad(cost,threshold,">"),dyad(new Int(0,"int32"),runningparallel,"="),"AND"),
                               parcalls,
                               sercalls
                              );
                    //    res= new Statement(  new Statement(diversion),new Statement(res));
                    return res;
                }
                catch(Exception e) {
                    error("in parallelisable for "+e);
                }
        }
        return super.statement();
    }

    // generate code to assign to v
    Node Doassign(Node v, Type tt) throws SyntaxError {
        try {
            unparalleled = false;
            Node upb=new Int(-1,"int32");
            boolean procedureise = false;
            Node taskid = new Int(0, intrep);
            boolean list = lex.lineno() >= Walker.switchon
                           && lex.lineno() <= Walker.switchoff;
            int oldexpressionContext = expressionContext;
            String[] whynotmulti= {" dont know why not multithreaded but probably the amount of work done did not justify parallelisation"};
            expressionContext = assignContext;
            int oldcalls = callcount;
            boolean oldcontains = containscalls;
            boolean multi_threadable = true;
            containscalls = false;
            int therank = getRank(tt);
            if(therank==0) unparalleled=true;
            if(v instanceof Variable) {
                procedureise = therank == 2; // it is only in these cases that it is
                // worth parallelising accross
                // threads
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
            Node one = new Int(1,"int32");
            Node minusone= new Int(-1,"int32");
            Node outer_range=(procedureise?
                              dyad(one, dyad(((ArrayType)tt).getUpb(0,getAddr(v)),((ArrayType)tt).getLwb(0,getAddr(v)),"-"),"+").eval():
                              minusone);
            outer_range = new TypeTag(outer_range,INTEGER);
            try {
                Statement saveprestatement = prestatement;
                Statement newprestatement = null;
                Node v1 = v;
                Type rest;
                Node base=null;
                if(procedureise)
                    try {
                        taskid = handleProcScopes();// go into procedure scope
                        String dn = "$$display" + (lexicalLevel - 1);
                        base = (Node) symbolTable.get(dn);
                        if(base == null) {
                            error(dn + " not found");
                        }
                        v = (Variable) ExpressionSubstituter.substituteAwithBinC(processor.getFP(), base, v);
                        // adjust access to v to make sure it complies with new
                        // scope level
                    }
                    catch(Exception procex) {
                        procedureise = false;
                        leaveprocscopes();
                    }
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
                        if(procedureise)at= (ArrayType) ExpressionSubstituter.substituteAwithBinC(processor.getFP(), base, at);
                        //		if(procedureise)System.out.println("type of "+v+":"+at+"\n upb 0 = "+at.getUpb(0, getAddr(v)));
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
                        indices[i] = tempvar(INTEGER/*ADDRESS*/);
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
                    Assign basicassign =(streaming?new AssignStreaming(v1,e): new Assign(v1, e));
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
                    ;
                    Statement block;
                    for(int i = therank - 1; i >= 0; i--) {
                        Node lwb = at.getLwb(i, getAddr(v));
                        // the lower bound may refer to a descriptor which is now in the outer scope
                        if(list)
                            System.out.println("processing assignment loop, for level iota="+i+"\nlwb=" + lwb+"\n procedurise="+procedureise);
                        upb = at.getUpb(i, getAddr(v));
                        Node step = new Int(1, intrep);
                        if(i == 0 && procedureise) {
                            lwb = dyad(lwb, taskid, "+");
                            step = new Int(tasks, intrep);
                            if(list)System.out.println("reset lwb="+lwb+"\nstep="+step);
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
                        res = new Statement(res);
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
                    int parfactor = (unparalleled ? 1 : processor.getParallelism(rest.type));;
                    if(parfactor ==1) unparalleled=true;
                    Vector cacheables = cacheablerefs(new Statement(basicassign));
                    if(parfactor > 1) {
                        // try parallelising this
                        try {
                            if(list)
                                System.out.println("Basic assign=" + basicassign);
                            Statement parallelversion = new Statement(
                                newprestatement,
                                new Statement(parallelise(new Assign(processor
                                                          .decast(basicassign.dest), processor
                                                          .decast(basicassign.src)), parfactor,
                                                          rest, (indices[therank - 1]))));
                            if(list)
                                System.out.println("parallel version="
                                                   + parallelversion);
                            if(!processor.generateable(parallelversion)) {
                                error("can not generate parallel version");
                            }
                            if(list)
                                System.out.println("Parallel version =\n"
                                                   + parallelversion);
                            for(int i = therank - 1; i >= 0; i--) {
                                Node lwb = at.getLwb(i, getAddr(v));
                                // System.out.println("lwb="+lwb);
                                upb = at.getUpb(i, getAddr(v)).eval();
                                Node oldupb = upb;
                                Node step = new Int((i == therank - 1 ? parfactor
                                                     : 1), intrep);
                                boolean innermost = false;
                                if(i == therank - 1) {
                                    innermost = true;
                                    Node range = dyad(dyad(upb, lwb, "-"),one, "+");
                                    Node pariterations = dyad(range, step,Node.divide);
                                    upb = dyad(
                                              dyad(dyad(pariterations, step, "*"),
                                                   one, "-"), lwb, "+").eval();
                                }
                                if(i == 0 && procedureise) {
                                    lwb = dyad(lwb, taskid, "+");
                                    step = new Int(tasks, intrep);
                                }
                                if(list)
                                    System.out.println("upb=" + upb);
                                Node pfor, sfor;
                                Node pcacheupb = tempvar(ADDRESS);
                                Node pinittemp = (upb.knownAtCompileTime() ? null
                                                  : new Assign(pcacheupb, upb));
                                Statement ploop = new Statement(new Statement(
                                                                    new Statement(pinittemp),
                                                                    block = new Statement(pfor = new For(
                                    (Variable) indices[i], lwb, (upb
                                                                 .knownAtCompileTime() ? upb
                                                                 : forcederef(pcacheupb)),
                                    step, parallelversion).optimise())));
                                if(i == therank - 1)
                                    block.setLocal((Memref) indices[i]);
                                if(list)
                                    System.out.println("ploop=\n" + ploop);
                                Statement innerloop = (innermost ? new Statement(
                                                           ploop,
                                                           new Statement(
                                                               // the non parallel loop handles the
                                                               // part left over by the
                                                               // vectorisation
                                                               sfor = new For(
                                    (Variable) indices[i],
                                    dyad(upb,new Int(1, intrep),
                                         "+"),
                                    oldupb,
                                    new Int(1, intrep),
                                    new Statement(
                                        newprestatement,
                                        new Statement(
                                            basicassign)))
                                .optimise()))
                                                       : // create nesting if not inner loop
                                                       new Statement(sfor = new For(
                                    (Variable) indices[i], lwb, upb,
                                    step, parallelversion).optimise()));
                                parallelversion = // this is to ensure all preloop
                                    // actions are replicated here
                                    // preloops contains all the pre loop actions
                                    // required by the
                                    // sequential code, we also call getPreloopAction to
                                    // get any
                                    // new actions invoked by the parallelisation
                                    // these typically involve the replication of
                                    // scalars in
                                    // scalar to vector arithmetic
                                    new Statement(
                                    new Statement(preloops[i], new Statement(
                                                      getPreloopAction(indices[i]))),
                                    innerloop);
                            }
                            res = parallelversion;
                            parlines.set(lex.lineno());
                            // System.out.println("Parallelised to "+res);
                        }
                        catch(Exception nopar) {
                            // ignore this
                            if(list) {
                                System.out .println("Warning unable to vectorise line :"
                                                    + lex.lineno()
                                                    + " "
                                                    + nopar.getMessage());
                            }
                        }
                    }
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
            NonPureFunctionFinder af = new NonPureFunctionFinder(purefunctions);
            res.examine(af);
            multi_threadable = af.count == 0;
            if(af.count>0)whynotmulti[0]="not multi-thread because there were "+
                                             (af.count)+" impure function calls in expression "+af.nonpure;
            if(purenesting>0) {
                multi_threadable=false;
                whynotmulti[0]="because this statement is already in a pure function\n"+
                               "\t\tas such it is likely to be running in a thread already";
            }
            containscalls |= oldcontains; // TT
            if(list)		System.out.println("do assign returns " + res);
            if(procedureise) {
                try {
                    Node cost= res.getCost();
                    Block bl = new Block(res, (LocalStoreAllocator) allocatorStack
                                         .peek());
                    leaveprocscopes();
                    String nom;
                    Label l = new Label();
                    Node p = formProcFrom(bl, nom = ("stubforass" + (procstubcount++)),
                                          l);
                    //  wholeProgram=new Statement(new Statement(p),wholeProgram);
//Node diversion = goAround(p);
                    Statement parcalls = null;
                    Statement sercalls = null;
                    //for (int tr = 0; tr < tasks; tr++) --- this is now done with a compiled loop not macro expanded
                    {
                        // launch multiple calls of the
                        Node Ti = tempvar(INTEGER);
                        Node Tr=	new Deref(Ti);							// routine for different rows
                        Node[] params = { l,new TypeTag(new Deref(processor.getFP()),POINTER),
                                          Tr
                                        };
                        Node Tc = new Int(tasks-1, "int32");
                        Node limit = tempvar(INTEGER);
                        Node zero = new Int(0,"int32");
                        Node check=  new Assign(limit,Tc) ;
                        Node dlimit =Tc;
                        //  Node test = new If(dyad(Tr,upb,">"),new Goto(lab));
                        Node call = new Statement(new Statement(procCall("post_job", params)));
                        Node[] p2 = { Tr};
                        Node delay = new Statement(procCall("wait_on_done", p2));
                        {
                            // lauch all the tasks first then wait
                            // for completion
                            parcalls =new Statement(
                                new Statement(new For(Ti,dlimit,zero,minusone, call)
                                              , new Statement(new For(Ti,zero,dlimit,one,delay)
                                                             )));
                        }
                        {
                            Node[]param = {Tr};
                            sercalls =
                                new Statement(new If(dyad(Tc,outer_range,"<"),new Assign(limit,Tc),
                                                     new Assign(limit,outer_range)),
                                              new Statement(
                                                  new For(Ti, zero, dlimit,one,procCall(nom,param))
                                              ));
                            sercalls.setAnnotation(whynotmulti);
                        }
                    }
                    if(multi_threadable) {
                        multicorelines.set(lex.lineno());
                        whynotmulti[0]+=" cost="+cost;
                        Node runningparallel = (Node)symbolTable.checkedGet("runningparallel");
                        parcalls=new Statement(new Assign(runningparallel,new Int(-1,"int32")),
                                               new Statement(parcalls,
                                                             new Statement(new Assign(runningparallel,new Int(0,"int32")))));
                        //System.out.println(" cost="+cost);
                        sercalls.setAnnotation(whynotmulti);
                        try {
                            res =
                                new If(dyad(dyad(cost,threshold,">"),dyad(new Int(0,"int32"),runningparallel,"="),"AND"),
                                       parcalls,
                                       sercalls
                                      );
                        }
                        catch(Exception ez) {}
                        // res= new Statement(res, new Statement(diversion));
                        wholeProgram=new Statement(new Statement(p),wholeProgram);
                    }
                    else {
                        //res = new Statement(sercalls, new Statement(diversion));
                        res = sercalls;
                        wholeProgram=new Statement(new Statement(p),wholeProgram);
                    }
                }
                catch(Exception en) {
                    en.printStackTrace();
                    error("failed to generate parallel code "+en);
                }

            }
            Statement sres = new Statement(res);
            whynotmulti[0]+="\n\t\tprocedureise="+ procedureise;
            sres.setAnnotation(whynotmulti);
            return sres;
        }
        catch(Exception en2) {
            error("in assign "+en2);
            return null;
        }
    }

    long procstubcount = System.currentTimeMillis();

    Node goAround(Node p)// plant the following pattern
    // goto temp
    // p
    // temp:
    {
        Node temp = new Label();
        return new Statement(new Goto(temp), new Statement(p, new Statement(
                                 temp)));
    }

    Variable handleProcScopes() throws Exception {
        enterScope(true);
        Variable taskidparam = (Variable) tempvar((INTEGER));
        enterScope(false);
        return taskidparam;
    }

    void leaveprocscopes() {
        leaveScope(false);
        leaveScope(true);
    }
    void compileUnit(String unit,String pathPrefix,  String apuname) throws SyntaxError {
		System.out.println("Multi-core compile "+unit);
        String  asmfile  = pathPrefix + unit + apuname + ".asm";
        try {
            // Walker w = (Walker) processor.getClass().newInstance();
            Walker                  w       = getCodeGenerator(apuname + "CG", processor.getLogFile());
            w.verbose = processor.verbose;
            FileInputStream         sf      = new FileInputStream(pathPrefix + unit + ".pas");
            java.io.FileDescriptor  fd      = sf.getFD();
            if(!fd.valid()) {
                error(unit + ".pas invalid file");
            }
            Reader                  source  = new InputStreamReader(sf, "UTF-8");
            PascalCompiler          p       = new MultiThreadPascal(pathPrefix, w, source, unit
                    + ".pas",tasks);
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
    }


    // return true if file f1 newer than file f2

    /**
     *  Description of the Method
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

    Node formProcFrom(Block n, String name, Label l) {
        Procedure dummy = new Procedure(name, 4, "[int32]",
                                        voidType.toString(), l, n, lexicalLevel + 1);
        Vector params = new Vector();
        params.add(INTEGER);
        ProcType pt = new ProcType(dummy, 1, params, voidType);
        symbolTable.put(name, pt);
        return dummy;
    }
}
