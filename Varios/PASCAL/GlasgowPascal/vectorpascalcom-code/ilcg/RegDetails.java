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

/** holds the details of a register in the symbol table */
public class RegDetails
{
    public String format,printsAs,internalname;
    public RegAlias alias;
    public RegDetails(String f,String n, String inn,RegAlias a)
    {
        format=f;
        printsAs=n;
        alias=a;
        internalname=inn;
    }
}
