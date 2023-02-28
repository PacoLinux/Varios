package ilcg.tree;

/**
 *  Description of the Class
 *
 * @author     Paul Cockshott
 * @created    22 November 2005
 */
public class Vec extends Format implements Serializable
{
    /**
     *  Description of the Field
     */
    public Node basetype;
    /**
     *  Description of the Field
     */
    public int len;


    /**
     *Constructor for the Vec object
     *
     * @param  n  base type of vector
     * @param  l  length of vector
     */
    public Vec(Node n, int l)
    {
        super("vector");
        basetype = n;
        len = l;
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String returnType()
    {
        return basetype.returnType().toString() + " vector(" + len + ")";
    }


    /**
     *  Description of the Method
     *
     * @return    Description of the Return Value
     */
    public String returnFormat()
    {
        return typeToFormat(basetype.returnType()).toString() + " vector(" + len + ")";
    }

}

