
//Title:        ilcg.tree.Procedure
//Version:
//Copyright:    Copyright (c) 1998
//Author:       Paul Cockshott
//Company:
//Description:  storage location representation


package ilcg.tree;
import java.util.*;
public class Unit extends Procedure implements java.io.Serializable
{
    Label base;

    public Label getBase()
    {
        return base;
    }
    /** This method converts a block to a procedure at lexical nesting level 0 */
    public Unit(String externalname,
                Vector unitsToCall,
                int params,
                String argtype,
                String returns,
                Label localname,
                Block b,
                Label baselab)
    {
        base=baselab;
        toCall=new Object[unitsToCall.size()];
        for(int i=0; i<unitsToCall.size(); i++)
            toCall[i]= unitsToCall.elementAt(i);
        //toCall=unitsToCall.toArray();
        alloc=b.alloc;
        paramspace=params;
        lexLevel=0;
        subtree=b.subtree;
        start=localname;
        name=externalname;
        paramtype=argtype;
        returntype=returns;
    }

}





