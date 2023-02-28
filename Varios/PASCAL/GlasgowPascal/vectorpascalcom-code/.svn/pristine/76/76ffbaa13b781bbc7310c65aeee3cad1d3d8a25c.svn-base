package ilcg.tree;
import java.util.Hashtable;
public class BoundedHinttable extends Hashtable
{
    int bound=10;
    public BoundedHinttable(int capacity)
    {
        super(capacity);
        bound=capacity;
    }
    public Object put(Object key, Object value)
    {
        if(size()>bound)clear();
        return super.put(key,value);
    }
}
