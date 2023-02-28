
// Title:        ilcg.tree.Control
// Version:
// Copyright:    Copyright (c) 1999
// Author:       Paul Cockshott
// Company:      Faraday
// Description:  Intermediate language for code generation control abstraction
package ilcg.tree;


/**
 *  interface from which all program control structures are descended
 *
 *@author     wpc
 *@created    June 21, 2001
 */
public interface Control
{

    /**
     *  Returns true if the control is in its simplest form
     *
     *@return    The simple value
     */
    public boolean isSimple();

    /**
     *  Converts control to its simplest form
     *
     *@return    Description of the Returned Value
     */
    public Node simplify();
}
