package ilcg.tree;

import java.io.*;
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public class LocalStoreAllocator implements Serializable
{
    int dir, currentPoint;

    public String toString()
    {
        return "LocalStoreAllocator("+dir+","+(currentPoint<0?-currentPoint:currentPoint)+")";
    }
    /**
     *  creates an allocator whose direction of growth is controled by the
     *  direction parameter and whose starting point is given. Note that the
     *  starting point should always be given as positive. If the stack grwows down
     *  and you want to prereserve 8 bytes, call new LocalStoreAllocator(-1,8)
     *
     *@param  direction  Description of Parameter
     *@param  start      Description of Parameter
     */
    public LocalStoreAllocator(int direction, int start)
    {
        dir = direction;
        currentPoint = start * direction;
    }


    /**
     *  Gets the limit attribute of the LocalStoreAllocator object
     *
     *@return    The limit value
     */
    public int getLimit()
    {
        //	  System.out.println( "  store limit   "+currentPoint);
        return currentPoint;
    }
    public void setLimit(int limit)
    {
//		  System.out.println(" reset store limit to "+limit);
        currentPoint=limit;
    }

    /**
     *  writes: dir currentpoint codeForLocalStoreAllocator
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException
    {
        (new Int(dir)).toBinary(out);
        (new Int(currentPoint)).toBinary(out);
        out.writeByte(Node.codeForLocalStoreAllocator);
    }


    /**
     *  Description of the Method
     *
     *@param  size       Description of Parameter
     *@param  alignment  Description of Parameter
     *@return            Description of the Returned Value
     */
    public int alloc(int size, int alignment)
    {
        //System.out.println("allocate "+size);
        //	 for (StackTraceElement e : new Throwable().getStackTrace())
        //    System.out.println(e);
        if(dir < 0)
            {
                // downward growing stack allocation
                int moveby = dir * size;
                currentPoint += moveby;
                int offset = Math.abs(currentPoint) % alignment;
                if(offset != 0)
                    {
                        int step = alignment - offset;
                        step = step * dir;
                        currentPoint = currentPoint + step;
                    }
                offset = currentPoint;
                return offset;
            }
        int offset = Math.abs(currentPoint) % alignment;
        if(offset != 0)
            {
                int step = alignment - offset;
                step = step * dir;
                currentPoint = currentPoint + step;
            }
        int moveby = dir * size;
        offset = currentPoint;
        currentPoint += moveby;
        return offset;
    }
}
