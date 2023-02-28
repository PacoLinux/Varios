package ilcg.tree;


import java.util.*;


/**
 *  This class builds up a hashtabe of common sub-expression found in a tree. It
 *  should be used once- that is applied to a tree once only. A new instance
 *  should be created for each use.
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class CommonSubExpressionFinder implements TreeExaminer
{

    /**
     *  Description of the Field
     */
    public Vector commonExpressions = new Vector();
    Hashtable allexp = new Hashtable();

    /** return number of repeated nodes */
    public int getRepeatCount()
    {
        // System.out.println("\n\nrepeat count="+repeats);
        return repeats;
    }

    public float score(Node n)   // gives a weighting that should be applied to a node that is found
    {
        Node c=n.getCost();
        if(c instanceof Number) return ((Number)c).floatValue();
        return n.weight();
    }

    int repeats = 0;

    /** return a sorted vector of repeated nodes, with most frequent first */
    public Object[] getRepeats()
    {
        Object[] nodes = new Object[commonExpressions.size()];
        // commonExpressions.toArray();
        for(int i = 0; i < commonExpressions.size(); i++)
            {
                nodes[i] = commonExpressions.elementAt(i);
            }
        float[]scores = new float[nodes.length];
        for(int i = 0; i < nodes.length; i++)
            {
                scores[i] = usage((Node) nodes[i]) * score((Node) nodes[i]);
            }
        for(int j = 1; j < nodes.length; j++)
            {
                for(int i = 1; i < nodes.length; i++)
                    {
                        if(scores[i - 1] < scores[i])    // swap
                            {
                                Object tempobj = nodes[i - 1];
                                nodes[i - 1] = nodes[i];
                                nodes[i] = tempobj;
                                float temp = scores[i - 1];
                                scores[i - 1] = scores[i];
                                scores[i] = temp;
                            }
                    }
            }
        //   System.out.println("Scores:usages");
        //     for(int i=0;i<nodes.length;i++)
        //      System.out.println(scores[i]+":"+usage((Node)nodes[i])+":"+nodes[i]);
        //       System.out.println(" ");
        return nodes;
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
        return true;
    }

    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n)
    {
        record(n);
    }

    /** Call this whenever you encounter an object */
    public void record(Node n)
    {
        String s = n.toString();
        // System.out.println("record "+s);
        Object o = allexp.get(s);
        if(o == null)
            {
                int[]count = new int[1];
                count[0] = 1;
                allexp.put(s, count);
                // System.out.println("record "+s);
            }
        else
            {
                int[] freq = (int[]) o;
                if(freq[0] == 1)
                    {
                        // first repetition add to vector
                        commonExpressions.addElement(n);
                        repeats++;
                    }
                freq[0]++;
                // System.out.println("count="+freq[0]+" repeats="+repeats+"\nfor "+s);
            }
    }

    /** Returns how often the node n has been found in the tree */
    public int usage(Node n)
    {
        String s = n.toString();
        Object o = allexp.get(s);
        if(o == null)
            {
                return 0;
            }
        else
            {
                int[] freq = (int[]) o;
                return freq[0];
            }
    }
}
