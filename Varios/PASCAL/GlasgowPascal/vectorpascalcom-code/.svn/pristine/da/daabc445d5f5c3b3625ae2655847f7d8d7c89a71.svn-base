
//Title:        ilcg
//Version:
//Copyright:    Copyright (c) 2000
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation
/** interface for examining ILCG trees  */
package ilcg.tree;
public interface TreeExaminer
{
    /** This is called each time a node is visited, but before any subtrees are visited. If it returns
            false the subtree below the node is not visited */

    public boolean visit(Node n);

    /** This is called after all subtrees have been visited */
    public void leave(Node n);
}
