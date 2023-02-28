package ilcg.tree;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class CharLit extends Int implements   Node, java.io.Serializable
{

    /**
     *  Constructor for the CharLit object
     *
     *@param  c  Description of Parameter
     */
    public CharLit(char c)
    {
        val = c;
        representation = Node.uint16;
    }

    /**
     *  This class implements integer literals in the expression tree
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */

    public boolean equals(Node n)
    {
        if(n instanceof Num)
            {
                return (double) val == ((Num) n).doubleValue();
            }
        return false;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString()
    {
        // char[] c = {'\'', (char) ((short) val), '\''};
        // return new String(c);
        return " " + ((int) val);
    }

    public String sig()
    {
        return toString();
    }

}
