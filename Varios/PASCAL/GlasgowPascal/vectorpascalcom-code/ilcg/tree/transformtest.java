

package ilcg.tree;


import java.io.*;
class transformtest
{
    public   static void main(String []args)
    {
        try
            {
                MIC m= new MICCG();
                Node i = new Memref(new Int(10,"int64"), "int32");
                Node di =new Dyad(new Int(4,"int32"), new Deref(i),"*");
                Node src=new Deref(new Memref(new Dyad(new Int(400,"int64"),di,"+"),"int32"));
                Node src1=new Deref(new Memref(new  Int(600,"int64"), "ieee32"));
                Node src2=new Deref(new Memref(new Dyad(new Int(14,"int64"),new Dyad(src,new Int(4),"*"),"+"), "ieee32"));
                Node f= new For(i,new Int(0),new Int(15),new Int(1),
                                new Assign(new Memref(new Dyad(new Int(100,"int64"),di,"+"),"ieee32"),
                                           src2));
                //  new Dyad(src2,src1,"*")));
                System.out.println(f.toString());
                m.verbose=true;
                PrintWriter file=new PrintWriter("transformtest.log");
                m.setLogfile(file);
                Node f2= m.transformer(f);
                String vet = Format.makeVectorType("int32",16);
                // System.out.println(vet+"->"+Format.nextUp(vet));
                m.buf.rollBackTo(0);
                System.out.println("\ntransformed to\n"+f2);
                System.out.println("codegenerated ="+m.codeGen(f2));
                PrintWriter asm=new PrintWriter("p.asm");
                m. flush(asm);
                m.flushlog();
                asm.close();
            }
        catch(Exception e)
            {
                System.out.println("Error "+e);
            }
    }
}
