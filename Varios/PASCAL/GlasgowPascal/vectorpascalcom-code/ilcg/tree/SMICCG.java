/*
\begin{verbatim}
*/

package ilcg.tree;

/**
 *  Description of the Class
 * Scalar code generator for the Xeon PHI
 *@author     Paul Cockshott
 *@created    Aug 2013
 */
public class SMICCG extends MICCG
{
// Scalar code generator for the Xeon PHI


    public SMICCG()
    {
        super();
        buf = new RollBackBuffer();
        this.verbose = true;
        optimisationLevel=subExpressionOptimise | optimisationLevel;
    }

    /**
     *  Overide this to provide the XMM parallelism
     *
     *@param  elementType  Description of Parameter
     *@return              The parallelism value
     */
    public int getParallelism(String elementType)
    {
        optimisationLevel=subExpressionOptimise | optimisationLevel;
        if(elementType.equals(Node.int32))
            {
                return 1;
            }
        if(elementType.equals(Node.int16))
            {
                return 1;
            }
        if(elementType.equals(Node.int8))
            {
                return 1;
            }
        if(elementType.equals(Node.uint32))
            {
                return 1;
            }
        if(elementType.equals(Node.uint16))
            {
                return 1;
            }
        if(elementType.equals(Node.uint8))
            {
                return 1;
            }
        if(elementType.equals(Node.int64))return 1;
        if(elementType.equals(Node.ieee64)) return 1;
        if(elementType.equals(Node.ieee32))return 1;
        return 1;
    }
}