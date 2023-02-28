package ilcg.Pascal;

import ilcg.tree.Function;
import ilcg.tree.Node;
import java.util.Set;

/**
 * Counts the number of functions that are not pure
 * @author tajaddin
 *
 */
public class NonPureFunctionFinder extends FunctionFinder {

    private Set purefunctions;
    public String nonpure="";

    /**
     * Default constructor
     * @param proctypes Hashtable of Procedure objects as keys, ProcType objects as values
     */
    public NonPureFunctionFinder(Set purefunctions) {
        super();
        this.purefunctions = purefunctions;
    }
    public boolean visit(Node n) {
        if(n instanceof ilcg.tree.Procedure) return false; // do not examine the inside of called function
        return true;
    }
    /**
     * counts the number of functions that are not pure
     */
    public void leave(Node n) {
        if(n instanceof Function && !purefunctions.contains(n)) {
            count++;
            ilcg.tree.Procedure p = ((Function)n).proc;
            nonpure += " "+ p.name+"="+p.getStartAddressLabel();
        }
    }



}
