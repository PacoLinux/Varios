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




public class Operation
{
    public String id,meaning,printsAs;
    /** id is the ilcg label for the operation, m the meainging and
        p the printable assembler form*/
    public Operation(String i, String m, String p)
    {
        id=i;
        meaning=m;
        printsAs=p;
    }
    //public String toString(){return printsAs;}
}
