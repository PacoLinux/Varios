package ilcg.Pascal;


import java.io.*;
import java.util.*;
import java.util.zip.*;
import viper.*;
import ilcg.tree.*;
import ilcg.tree.Procedure;
import ilcg.SyntaxError;


public class VPC {
    Walker ia32W;
    Walker pentiumW;
    Walker p3W;
    Walker k6W;
    Walker w;
    Viper v;
    boolean smart;
    String path = null;
    String fileName = null;

    /**
     * Default constructer used when
     * smart compiler not required
     */
    public VPC() {
        ia32W = new IA32CG();
        pentiumW = new PentiumCG();
        p3W = new P3CG();
        k6W = new K6CG();
        w = null; // PentiumCG();
        smart = false;
        v = null;
    }

    /**
     * Constructer with strings for the path and
     * name of file only used for smart compiler
     */
    public VPC(String Path, String FileName, Viper parent) {
        ia32W = new IA32CG();
        pentiumW = new PentiumCG();
        p3W = new P3CG();
        k6W = new K6CG();
        w = null;
        v = parent;
        path = Path;
        fileName = FileName;
        smart = true;
    }

    public String setComp(String[] options) {
        PrintWriter asm;
        PrintWriter lst;
        try {
            int i;
            String cgname = "PentiumCG";
            boolean verbose = false;
            boolean console = false;
            boolean dontassemble = false;
            boolean intermediateFile = false;
            String asmfile = "p.asm";
            String ofile = "p.o";
            String outfile = "p.exe";
            String rtldir = System.getProperty("mmpcdir", "./ilcg/Pascal");
            if(!AsmLink.rtl.startsWith(rtldir)) {
                AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
            }
            AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
            AsmLink.gc = rtldir + "/" + AsmLink.gc;
            boolean training = false;
            String path = "./";
            // ilcg.tree.Walker w = null;
            for(i = 0; i < options.length; i++) {
                // System.out.println(options[i]);
                if(options[i].startsWith("-BOEHM")) {
                    AsmLink.gcenable = true;
                }
                else if(options[i].startsWith("-cpu")) {
                    cgname = options[i].substring(4) + "CG";
                }
                else if(options[i].startsWith("-A")) {
                    asmfile = options[i].substring(2);
                }
                else if(options[i].startsWith("-V")) {
                    verbose = true;
                }
                else if(options[i].startsWith("-o")) {
                    outfile = options[i].substring(2);
                }
                else if(options[i].startsWith("-console")) {
                    console = true;
                }
                else if(options[i].startsWith("-inter")) {
                    intermediateFile = true;
                }
                else if(options[i].startsWith("-S")) {
                    dontassemble = true;
                }
                else if(options[i].startsWith("-f")) {
                    AsmLink.objectformat = options[i].substring(2);
                }
                else if(options[i].startsWith("-D")) {
                    path = options[i].substring(2);
                }
                else if(options[i].startsWith("-U")) {
                    Walker.procprefix = "_";
                }
                else if(options[i].endsWith(".a")
                        || options[i].endsWith(".c")
                        || options[i].endsWith(".s")
                        || options[i].endsWith(".o")) {
                    AsmLink.rtl = AsmLink.rtl + " " + options[i];
                }
            }
            if(cgname == "undefined cpu") {
                throw new Exception(
                    "target CPU not defined on command line "
                    + "\nUsage:\n\t java ilcg.pascal.PascalCompiler sourcefile -cpuCPU");
            }
            asm = new PrintWriter(new FileOutputStream(asmfile));
            if(console) {
                lst = new PrintWriter(System.err);
            }
            else {
                lst = new PrintWriter(new FileOutputStream(options[0] + ".lst"));
                // path + infront of options
            }
            ClassLoader loader = (new ilcg.tree.Int()).getClass().getClassLoader();
            if(loader == null) {
                throw new Exception("cant get default class loader ");
            }
            Class cgc = loader.loadClass("ilcg.tree." + cgname);
            if(cgc == null) {
                throw new Exception("cant load class " + cgname);
            }
            ilcg.tree.Walker w = (ilcg.tree.Walker) cgc.newInstance();
            if(!training) {  // if training ignore previous experience
                try {
                    /* attempt to load cached walker with optimisation tables */
                    FileInputStream fg = new FileInputStream(cgname + ".vwu");
                    ZipInputStream zi = new ZipInputStream(fg);
                    zi.getNextEntry();
                    ObjectInputStream sg = new ObjectInputStream(zi);
                    Walker dg = (Walker) sg.readObject();
                    sg.close();
                    w = dg;
                    System.out.println(cgname + ".vwu loaded");
                }
                catch(Exception e) {
                    if(verbose) {
                        System.out.println(
                            "Could not load " + cgname + ".vwu " + e);
                    }
                    try {
                        /* attempt to load cached walker with optimisation tables */
                        FileInputStream fg = new FileInputStream(
                            rtldir + "/" + cgname + ".vwu");
                        ZipInputStream zi = new ZipInputStream(fg);
                        zi.getNextEntry();
                        ObjectInputStream sg = new ObjectInputStream(zi);
                        Walker dg = (Walker) sg.readObject();
                        sg.close();
                        w = dg;
                        System.out.println(rtldir + "/" + cgname + ".vwu loaded");
                    }
                    catch(Exception e2) {
                        if(verbose) {
                            System.out.println(
                                "Could not load  system " + rtldir + "/"
                                + cgname + ".vwu " + e2);
                        }
                    }
                }
            }
            if(w == null) {  // not smart or smart failed
                if(cgname.equals("IA32CG")) {
                    w = ia32W;
                }
                else if(cgname.equals("PentiumCG")) {
                    w = pentiumW;
                }
                else if(cgname.equals("K6CG")) {
                    w = k6W;
                }
                else if(cgname.equals("P3CG")) {
                    w = p3W;
                }
                else {   // sorry Paul its got to be dynamic
                    loader = (new ilcg.tree.Int()).getClass().getClassLoader();
                    if(loader == null) {
                        throw new Exception("cant get default class loader ");
                    }
                    cgc = loader.loadClass("ilcg.tree." + cgname);
                    if(cgc == null) {
                        throw new Exception("cant load class " + cgname);
                    }
                    w = (ilcg.tree.Walker) cgc.newInstance();
                }// end of the static bit
            }
            w.setLogfile(lst);
            w.verbose = verbose;
            FileInputStream sf = new FileInputStream(options[0] + ".pas");
            // path + infront of options
            java.io.FileDescriptor fd = sf.getFD();
            if(!fd.valid()) {
                throw new IOException(options[0] + ".pas invalid file");
            }
            Reader source = (new FileReader(fd));
            // if (!path.endsWith("/")) path=path+"/";
            PascalCompiler pascalCompiler = new PascalCompiler(path, w, source,
                    options[0]);
            try {
                // if(intermediateFile)System.out.println("using intermediate file");
                asm.println(";compiler version " + PascalCompilerVer.VERSION);
                asm.println("%include \"macros.asm\"");
                pascalCompiler.compile(asm, intermediateFile);
                for(int u = 0; u < pascalCompiler.unitsUsed.size(); u++) {
                    asm.println(
                        "%include " + pascalCompiler.unitsUsed.elementAt(u));
                }
                String reply = ("compiled ");
                asm.close();
                if(!dontassemble) {
                    if(!w.assemble(asmfile, ofile)) {
                        throw new Exception("assembly failed ");
                    }
                    if(!w.link(ofile, outfile)) {
                        throw new Exception("linking failed ");
                    }
                }
                lst.close();
                // if(smart) streamProgTree(w);
                // if (smart) v.walker = w;
                return reply;
            }
            catch(Exception e) {
                lst.close();
                asm.close();
                String reply = ("compilation failed " + e);
                System.out.flush();
                return reply;
            }
        }
        catch(Exception e) {
            String reply = ("compiled " + (e));
            return reply;
        }
    }

    /**
     * Used for Smart Compiler to deserialize a Walker
     * @return Walker w The deserialised Walker
     */

    /*
     private Walker loadProgTree()
     {
     Walker w=null;
     File progTree = new File(path,fileName);
     if (progTree.exists())
     {
     try
     {
     FileInputStream fis = new FileInputStream(progTree);
     ObjectInputStream ois = new ObjectInputStream(fis);
     w= (Walker) ois.readObject();
     ois.close();
     return w;
     }
     catch(Exception e)
     {
     System.out.println("Deserialisation Failure " + e);
     w= null;
     return w;
     }
     }
     return w;
     }


     private void streamProgTree ( Walker w)
     {
     File progTree = new File(path,fileName);
     try
     {
     FileOutputStream fos = new FileOutputStream(progTree);
     ObjectOutputStream oos = new ObjectOutputStream(fos);
     oos.writeObject(w);
     oos.flush();
     oos.close();
     }
     catch(Exception e)
     {
     System.out.println("Serialisation Failure" + e);
     }
     }*/
}
