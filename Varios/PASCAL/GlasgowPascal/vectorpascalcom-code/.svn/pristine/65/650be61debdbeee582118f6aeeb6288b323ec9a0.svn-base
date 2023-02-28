/**
Part of the intermediate language for code generation
package.
Contains definintions for pattern paramaeters within parameterised
grammar rules.


Copyright University of Glasgow

Author Paul Cockshott
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
public class pattern
{
    String name=" ",context="unknown";
    public Dictionary parameters;
    Node ND;
    public String internalrecognisingProc, printingProc,meaningstring;
    public pattern(Node nd,String n, String c,Dictionary p,String r, String pp,String meaning)
    {
        name=n;
        context=c;
        parameters = p;
        internalrecognisingProc=r;
        meaningstring=meaning;
        printingProc=pp;
        ND=nd;
    }
    public Node getNode()
    {
        return ND;
    }
    public String getMeaning()
    {
        return meaningstring;
    }
}
