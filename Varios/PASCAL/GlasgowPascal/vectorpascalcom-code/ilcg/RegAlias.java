/**
Part of the intermediate language for code generation
package.
Contains definintions for pattern paramaeters within parameterised
grammar rules.


Copyright University of Glasgow

Author Paul Cochshott
*/


package ilcg;
import ca.mcgill.sable.util.*;
import ilcg.node.*;
import java.io.*;
import java.util.Hashtable;
import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Vector;
import ilcg.analysis.*;
//import com.c3d.structured.Relation;
import ilcg.tree.Format;
public class RegAlias
{
    RegDetails parent;
    int low,high;
    public RegAlias(RegDetails p, int l, int h)
    {
        parent=p;
        low=l;
        high=h;
    }
}
