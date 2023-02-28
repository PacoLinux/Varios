package ilcg.tree;
import java.util.*;
import java.io.*;
import ilcg.*;
public abstract class BUR  extends Walker implements TreeExaminer
{
    Ilcg2Tree grammarReader;
    int pass=1;

    void test(Node m)
    {
        System.out.println("Test prematch for \n"+m);
        if(prematch(m))
            {
                System.out.println("Succeded");
                Object[] v=((Hashtable)(associations.get(m))).values().toArray();
                for(int i=0; i<v.length; i++)
                    System.out.println(m.toString()+"->"+v[i]);
            }
    }
    public void loadTree(String path)throws Exception
    {
        grammarReader=grammarReader.loadTree(path);
        for(Enumeration e =grammarReader.names.keys() ; e.hasMoreElements() ;)
            {
                Object element=e.nextElement();
                if(element!=null)
                    {
                        //	 System.out.println(element.toString()+"\t"+grammarReader.names.get(element));
                    }
            }
        //	for(int i=0;i<grammarReader.pats.size();i++)
        //		System.out.println("\t"+i+"\t"+grammarReader.pats.elementAt(i));
    }
    /**
         *  This is called each time a node is visited, but before any subtrees are
         *  visited. If it returns false the subtree below the node is not visited
         *
         *@param  n  Description of Parameter
         *@return    Description of the Returned Value
         */
    public boolean visit(Node n)
    {
        System.out.println(padding()+"Visit "+n);
        pad++;
        return true;
    }
    int pad=0;
    String padding()
    {
        return padding(pad);
    }
    String padding(int i)
    {
        if(i<1) return "";
        return " "+padding(i-1);
    }
    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n)
    {
        pad--;
        System.out.println(padding()+"Leave");
        switch(pass)
            {
            case 1:
            {
                matchCtoallpatterns(n);
                break;
            }
            case 2:
            {
                break;
            }
            }
    }
    SymbolTable associations=new SymbolTable(new Hashtable());

    boolean prematch(Node n)
    {
        pass=1;
        associations=new SymbolTable(new Hashtable());
        n.examine(this);
        Object v0= associations.get(n);
        if(v0==null) return false;
        Hashtable v= (Hashtable)v0;
        return v.size()>0;
    }

    void matchCtoallpatterns(Node C)
    {
        System.out.println(padding()+"match "+C+" to all patterns");
        Hashtable l=new Hashtable();
        Vector v=new Vector();
        for(int i=0; i <grammarReader.pats.size(); i++)
            {
                //	for (Enumeration e = grammarReader.names.elements() ; e.hasMoreElements() ;) {
                Object element=grammarReader.pats.elementAt(i);//e.nextElement();
                if(element!=null)
                    {
                        System.out.println("\t"+i);
                        if(element instanceof Pattern)
                            {
                                Pattern P = (Pattern)element;
                                boolean ok=P.matches(C,associations);
                                //	boolean ok=P.matchusingDtoC(associations,C);
                                if(ok)
                                    {
                                        System.out.println(padding()+"associate "+C+" to "+P);
                                        l.put(P,P);
                                        associations.put(C,l);
                                        v.add(P);
                                    }
                            }
                    }
            }
        System.out.println("Associations of "+C);
        for(int i=0; i<v.size(); i++)
            System.out.println("\t"+i+"\t"+v.elementAt(i));
    }
}


