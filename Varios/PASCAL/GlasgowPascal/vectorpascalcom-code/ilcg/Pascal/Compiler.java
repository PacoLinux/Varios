

// Title:        Your Product Name
// Version:
// Copyright:    Copyright (c) 1998
// Author:       Paul Cockshott
// Company:
// Description:  Your description


package ilcg.Pascal;


import java.io.*;
import ilcg.tree.*;
import ilcg.SyntaxError;
import java.util.*;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public abstract class Compiler {

    /** Reports on progress, used in the
     surrounding development environment */
    int statements = 1;
    ProgressNotifier notifier = new ProgressNotifier();
    Vector<CPUrunPair> runningPairs = new Vector<CPUrunPair>();
    static boolean parallelcodegen=false;
    /**
     *  The syntax tree walker proper to the CPU for which code is being generated
     */
    public Walker processor;

    /**
     *  Description of the Field
     */
    public PrintWriter asmFile;
    Node tree;
    private boolean invokedStandalone = false;

    /**
     *  Constructor for the Compiler object
     *
     *@param  cg  Description of Parameter
     */
    public Compiler(Walker cg) {
        processor = cg;
    }
    void collectResults()throws Exception {
        //	System.out.println("Collect results "+runningPairs.size());
        for(CPUrunPair p :runningPairs)
            try {
                if(processor.optimisationLevel == 0) {
                    p.t.join(20000 * statements + 10000);
                }
                else {
                    p.t.join(10000 * statements + 15000);
                }
                boolean ok = p.r.result;
                if((!p.r.finished) && processor.optimisationLevel > 0) {
                    p.t.interrupt();
                    processor.notifier.done(
                        "Timed out on optimisation, producing level 0 code\n", 0);
                    Walker.optimisationLevel = 0;
                }
                else if(ok) {
                    StringWriter sw = new StringWriter();
                    PrintWriter pw = new PrintWriter(sw);
                    p.r.processor.flush(pw);
                    String[] unoptimisedlines  =p.r.processor. buf.sequester(0);
                    if(p.r.code!=null) {
                        String key=p.r.code.sig();
                        String value = sw.toString();
                        //	 System.out.println("Cache "+key);
                        processor.exactmatch.put(key,unoptimisedlines);
                    }
                }
            }
            catch(Exception ee) {
                ee.printStackTrace();
                throw ee;
            }
    }
    /**
     *  this is overridden in specific compilers to provide parsing
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public abstract Node parse() throws SyntaxError;

    /**
     *  a dummy optimizer that only does constant folding
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node optimize(Node n) {
        //System.out.println("Optimizing expressions");
        if(n==null)return n;
        Node e = n.eval();
        // System.out.println("Expressions evaluated");
        //if (processor.optimisationLevel > 0)
        //e=processor.transformCodeTree(e);
        // System.out.println("Optimized and transformed");
        return e;
    }
    public void codegen(Node n, PrintWriter asm,int statcount)
    throws Exception {
        codegen(n,asm,statcount,false);
    }
    /**
     *  when invoked generates assembly code for node n on the PrintWriter asm
     *
     *@param  n              ilcg node to generate code for
     *@param  asm            where to output the assembler
     *@param coroutine       causes it to run in parallel with main tread
     *@exception  Exception   on failure to generate code
     */

    public void codegen(Node n, PrintWriter asm,int statcount,boolean coroutine) throws Exception {
        ExternalReferenceFinder lf = new ExternalReferenceFinder();
        n=optimize(n);
        try {
            if(n != null) {
                n.examine(lf);
            }
            // System.out.println("examined ");
            for(int i = 0; i < lf.reflist.size(); i++) {
                Object o = lf.reflist.elementAt(i);
                if(o != null && o instanceof Label) {
                    if(!lf.decls.contains(o)) {
                        if(! lf.reflist.elementAt(i).toString().contains("unit$"))
                            processor.codeGen(
                                new ImpLabel(
                                    Walker.procprefix
                                    + lf.reflist.elementAt(i).toString()));
                        //   System.out.println("importing " + o);
                    }
                    else {
                        //  System.out.println("exporting "+o);
                        processor.exportLabel((Label) o);
                    }
                }
            }
        }
        catch(Exception e) {
            throw new Exception(
                " while searching for external references :"
                + e.getMessage());
        }
        // System.out.println(n);
        boolean ok = false;
        try {
            if(coroutine) {
                // System.out.println("parallel code generate "+n+" statements");
                CPUrun attempt = new CPUrun((Walker) processor.getClass().newInstance(), n);
                Thread bgthread = new Thread(attempt);
                attempt.processor.exactmatch=processor.exactmatch;
                attempt.processor.optimisationLevel=processor.optimisationLevel;
                bgthread.start();
                runningPairs.add(new CPUrunPair(attempt,bgthread));
                return;
            }
            if(parallelcodegen)collectResults();
            Walker spare = (Walker) processor.getClass().newInstance();
            CPUrun attempt = new CPUrun(processor, n);
            Thread bgthread = new Thread(attempt);
            bgthread.start();
            //System.out.println("launched code generation thread");
            if(processor.optimisationLevel == 0) {
                bgthread.join(20000 * statements + 10000);
            }
            else {
                bgthread.join(10000 * statements + 15000);
            }
            ok = attempt.result;
            if((!attempt.finished) && processor.optimisationLevel > 0) {
                bgthread.interrupt();
                processor.notifier.done(
                    "Timed out on optimisation, producing level 0 code\n", 0);
                processor = spare;
                Walker.optimisationLevel = 0;
                ok = processor.codeGen(n);
            }
            if(parallelcodegen)processor.exactmatch.clear();// so we do not remember old procedures
            // which may have same sig as new ones
        }
        catch(Exception e2) {
            throw new Exception(
                "while executing code generator " + e2.getMessage());
        }
        if(ok) {
            // notifier.done("output assembler",0);
            processor.printcomment("invocations per line output ="+(1.0*processor.invocations/processor.buf.mark()));
            processor.printcomment("invocations per source statement ="+(1.0*processor.invocations/statcount));
            processor.printcomment("assembler lines per source statement ="+(1.0*processor.buf.mark()/statcount));
            processor.flush(asm);
            processor.flushlog();
        }
        else {
            processor.flushlog();
            throw new Exception(
                " code generation failed line " + processor.lastLine);
        }
    }

    /**
     *  Invokes parsing,optimization and code generation, output to PrintWriter asm
     *
     *@param  asm               Description of Parameter
     *@param  intermediateFile  Description of Parameter
     *@exception  Exception     Description of Exception
     */
    public void compile(PrintWriter asm, boolean intermediateFile) throws Exception {
        asmFile = asm;
        System.out.println("Parsing");
        tree = parse();
        if(intermediateFile) {
            // System.out.println("using intermediate file ");
            DataOutputStream dout = new DataOutputStream(
                new FileOutputStream("inter.tre"));
            try {
                tree.toBinary(dout);
            }
            catch(Exception e4) {
                System.err.println(e4);
            }
            // dout.close();
            // DataInputStream din = new DataInputStream(new FileInputStream("inter.tre"));
            // tree = Loader.load(din,processor);
        }

        System.out.println("Optimizing");
        tree = optimize(tree);

        System.out.println("Code generating");
        codegen(tree, asm,1);
    }
}


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class ExternalReferenceFinder implements TreeExaminer {

    MyHashSet refs = new MyHashSet();
    MyHashSet decls = new MyHashSet();
    Vector reflist = new Vector();

    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean visit(Node n) {
        // System.out.println(n+":"+n.getClass());
        if(n == null) {
            return false;
        }
        if(n instanceof ExtLabel) {
            if(!refs.contains(n)) {
                refs.add(n);
                reflist.addElement(n);
            }
        }
        if(n instanceof Statement) {
            Statement s = (Statement) n;
            if(s.action != null && s.action instanceof Label) {
                decls.add(s.action);
                // System.out.println("decl added "+s.action)  ;
            }
        }
        return true;
    }

    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {}
}
class CPUrunPair {
    CPUrun r;
    Thread t;
    CPUrunPair(CPUrun R, Thread T) {
        t=T;
        r=R;
    }
}

class CPUrun implements Runnable {
    Node code;
    boolean result = false;
    boolean finished = false;

    public Walker processor;
    public void run() {
        try {
            result = processor.codeGen(code);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        finished = true;
    }

    CPUrun(Walker cpu, Node n) {
        code = n;
        processor = cpu;
    }

}
