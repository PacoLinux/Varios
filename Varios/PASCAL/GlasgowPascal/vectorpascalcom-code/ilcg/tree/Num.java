package ilcg.tree;


/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public abstract class Num extends Number implements java.io.Serializable
{

    /**
     *  States which of the possible ilcg representations of a number this is
     */
    public String representation;
    public int weight()
    {
        return 0;
    }
    public int[] weights()
    {
        int[] nullw= {0};
        return nullw;
    }
    public Node getCost()
    {
        return new Real(weight());
    }
    /**
     *  Constructor for the Num object
     */
    public Num() {}

    /**
     *  Numbers are all known at compile time
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime()
    {
        return true;
    }

    /**
     *  Numbers evaluate to themselves
     *
     *@return    Description of the Returned Value
     */
    public Node eval()
    {
        return (Node) this;
    }

    /**
     *  The equals method inherited from Object tests for numeric equality
     *
     *@param  o  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Object o)
    {
        if(o instanceof java.lang.Number)
            {
                return ((Number) o).doubleValue() == doubleValue();
            }
        return false;
    }

    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType()
    {
        return representation;
    }
}
