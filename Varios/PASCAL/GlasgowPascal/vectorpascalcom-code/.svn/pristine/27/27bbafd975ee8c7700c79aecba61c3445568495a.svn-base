
//Title:        ilcg.tree.Modifier
//Version:
//Copyright:    Copyright (c) 2000
//Author:       Paul Cockshott
//Company:      Faraday
//Description:  Intermediat language for code generation
/** interface for modifiying ilcg trees, this is capable of subtituting
    values into the midst of a tree.
 */

package ilcg.tree;
import ilcg.tree.Node;
public interface TreeModifier
{
    /** This is called each time a node is visited, but before any subtrees are visited. If it returns
            false the subtree below the node is not visited */
    public boolean visit(Node n);

    /** This returns the rewritten node n */
    public Node modified(Node n);
}
