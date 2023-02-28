package ilcg.tree;
public class C32CG extends CCG
{
    public boolean link(String infile, String ofile)
    {
        return Slink(infile, ofile);
    }
    public   boolean Slink(String infile, String ofile)
    {
        Runtime sys = Runtime.getRuntime();
        try
            {
                String com = "gcc   " +   "-m32  -g   "+(AsmLink.gcenable?"-DBOEHM":"")+"  -w  -o " + ofile+  " " + infile+".c "+AsmLink.rtl+" " + AsmLink.libs+ " -lm";
                System.out.println("Warning - this code generator assumes 32 bit code,\n 32 bit development system must be installed");
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
                        /*AlignmentFixer AF=new AlignmentFixer();
                          AF.map("p.o.s","p.o.f.s");
                          String com2 = "gcc   "   + " -g    -DC64CG "+(AsmLink.gcenable?"-DBOEHM":"")+"  -w -o " + ofile + " " +  "p.o.f.s "+AsmLink.rtl+" " + AsmLink.libs+ " -lm";


                          System.out.println(com2);
                          Process p2 = sys.exec(com2);
                          StreamGobbler errorGobbler2 = new
                          StreamGobbler(p2.getErrorStream(), "ERROR");
                          // any output?
                          StreamGobbler outputGobbler2 = new
                          StreamGobbler(p2.getInputStream(), "OUTPUT");
                          // kick them off
                          errorGobbler2.start();
                          outputGobbler2.start();
                          if(p2.waitFor() == 0) {*/
                        return true;
                        // }
                    }
            }
        catch(Exception ep)
            {
                System.err.println(ep);
            }
        return false;
    }
    public String getAddressType()
    {
        return Node.int32;
    }
    public String bits()
    {
        return "BITS 32";
    }
    public int getAddressLenInBytes()
    {
        return 4;
    }

}
