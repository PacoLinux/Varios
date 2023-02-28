package ilcg.tree;


/** A class that  provides information about the object file
 formats and the run time library to be used

 It requires gcc and nasmw as linker and assembler to be installed */

public class AsmLink
{
    public static String rtldir="";
    public static String objectformat = "elf";
    public static String objectforce32 = "elf32";
    public static String underline = "_";
    public static String rtl = "rtl.c";
    public static String rtlb = "rtlb.o"; // "rtl.c -DBOEHM -I ";
    public static boolean gcenable = false;
    public static String gc = "gc.a"; // was "gc.a";
    public static String libs = "  ";
    public static Walker cpu = null;// new PentiumCG(); /* stores current code generator class */
}
