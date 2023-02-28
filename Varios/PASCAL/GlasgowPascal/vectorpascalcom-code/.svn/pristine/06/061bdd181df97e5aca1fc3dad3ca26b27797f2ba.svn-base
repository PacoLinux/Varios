package ilcg.tree;
import java.util.*;
import java.io.*;
public interface MySet<E>
{
    public boolean contains(E n);
    public Iterator iterator();
    public void add(E n);
    public int size();
}


class MyVecSet  implements Serializable, MySet
{
    Vector v=new Vector();
    public Iterator iterator()
    {
        return v.iterator();
    }
    public void add(Object n)
    {
        v.add(n);
    }
    public boolean contains(Object n)
    {
        return v.contains(n);
    }
    public int size()
    {
        return v.size();
    }
}
