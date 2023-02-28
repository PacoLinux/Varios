/**
 *  Pascal representation for VPTeX. The Viper Team
 *  Copyright (c) 2002 VIPER Team
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *  @author Eirik Jensen Opland
 */

package VPTeX;

import java.util.Vector; // Necessary to keep the subtrees of an ExpressionTree.

/** An ExpressionTree is a datastructure capable of holding a whole VectorPascal expression.
        * An expression can be a procedure call, or the Left/Right Hand Side of  the := in an assignment.
        * An expression can also occur in a declaration.
        * ExpressionTree is NOT designed to hold type definitions.
     * ExpressionTree can be build up incrementally using various constructors and methods.
     * toString is overridden to get a string representation for the contents of 'this' ExpressionTree.
     * toString_ommitDollars offers a way of displaying a String if you're already in mathsmode,
        and don't want to repeat the dollars (which would have caused latex errors).
*/
public class ExpressionTree
{

        /******************************************************************************/
        /** The greatest nodeType allowed. */
        private static final int LAST_NODE_TYPE= 8;

        /** A tree representing a construct of the form: ['perm' setConstruction expression] */
        public static final int PERMUTATION_TREE= 8;
        /** A tree representing a pair of brackets and it's contents. */
        public static final int BRACKETING_SCOPE= 7;
        /** A tree representing a function call. */
        public static final int FUNCTION_CALL= 6;
        /** A tree representing an array reference (with subscripts). */
        public static final int ARRAY_REFERENCE= 5;
        /** A tree representing a binary operation including both operands */
        public static final int BINARY_OPERATION= 4;
        /** A tree representing unary operatorin including the (right) operand. */
        public static final int UNARY_OPERATION=3;
        /** A tree representing a single identifier, i.e a leaf of the ExpressionTree. */
        public static final int LEAF_IDENTIFIER=2;
        /** A tree representing a single litteral, i.e a leaf of the ExpressionTree. */
        public static final int LEAF_LITTERAL=1;
        /** An empty ExpressionTree. */
        public static final int EMPTY_TREE=0;

        /** The value in this node. */
        private String val;

        /** The priority of the current operation (in the case of the ExpressionTree representing an operation) */
        private int priority;

        /** Varies between 1, 2 and multiple children.*/
        private Vector children;

        /** One of the numbers at the top. */
        private int nodeType;

        /** The width of this node. */
        private double width;

        /** The maximum number of normal sized characters 'that' can be displayed on one line.
             NB! The longest string of 'W's (in $mathsmode$) displaying ps-files in ghostview is 51.
        */
        private int maxWidth= 92;

        /** True if there should be brackets;  It only applies to unary functions.*/
        private boolean brackets= false;

        static final double DEFAULT_WIDTH= 1.0;

        /** The Greek lower case letters. */
        static final String greekLower[]= {"alpha", "epsilon", "theta", "lambda", "pi", "sigma",
								      
                                                                      "phi", "omega", "beta", "varepsilon", "vartheta", "mu",
                                                                      "varpi", "varsigma", "varphi", "gamma", "zeta", "iota",
                                                                      "nu", "rho", "tau", "chi", "delta", "eta", "kappa", "xi", "varrho",
                                                                      "upsilon", "psi","iota"};

        /** The valid operators in order of priority.
           * Highest priority has highest index and appears to the right.
        */
        static final String operators[]= {"^", "^.", ":=", "..", ".", "in", ">=", "<=", ">", "<", "<>", "=",
                                                   "or_else", "or", "><", "\\-", "\\+", "\\/", "\\*", "\\max", "\\min", "\\and", "\\or",
                                                   "-", "+", "and_then", "and", "mod", "div", "/", "*", "pow", "**", ":"};

        /** The representations of each operator */
        static final String opRep[]= {"$\\uparrow$", "$\\uparrow$.", "$\\leftarrow$ ", "..", ".", " $\\in$ ", " $\\geq$ ", " $\\leq$ ", " $>$ ", " $<$ ", " $\\neq$ ", " $=$ ",
                                              VpMathFont.KeyWord(" or$\\_$else "), " $\\vee$ ", " $><$ ", " $\\backslash -$ ", " $\\sum$ ",
                                              " $\\backslash /$ ", " $\\prod$ ", VpMathFont.KeyWord(" $\\backslash max$ "),
                                              VpMathFont.KeyWord(" $\\backslash min $ "), VpMathFont.KeyWord(" $\\backslash \\wedge$  "),
                                              " $\\backslash$ or ", " - ", " + ", VpMathFont.KeyWord(" and$\\_$then "), " $\\wedge$ ",
                                              VpMathFont.KeyWord(" mod "), " $\\div$ ", " / ", " $\\times$ ", " pow ", " ** ", " : "};

        /** The width of each operator-representation (Currently obolete, but kept in case of future extensions */
        static final double opWidth[]= {DEFAULT_WIDTH,DEFAULT_WIDTH,2.0, 2.0, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, 2.0, DEFAULT_WIDTH,
                                              7.0, 2.0, 2.0, 2.0, 2.0, DEFAULT_WIDTH, 2.0, DEFAULT_WIDTH, DEFAULT_WIDTH,
                                              8.0, 2.0, 3.0, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, 3.0, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH,
                                              DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH,
                                              DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH, DEFAULT_WIDTH};

        /** The fuctions that have special Latex-representations. */
        static final String reservedFunctions[]= {"iota", "abs", "sqr", "sin", "cos", "tan", "exp", "ln", "sqrt", "arctan", "arg", "re", "im", "trans"};

        /** The latex-code that should appear to the left of the arguments to each function */
        static final String leftRep[]= {"$\\iota_{", VpMathFont.KeyWord("abs ")+"", "", "$\\sin$ ", "$\\cos$ ", "$\\tan$ ", VpMathFont.KeyWord("exp ") + "ln",
                                                        "$\\ln$", "$\\sqrt{", "$\\arctan$", VpMathFont.KeyWord("arg")+"", "$\\Re$", "$\\Im$", ""};

        /** The latex-code that should appear to the right of the arguments to each function */
        static final String rightRep[]= {"}$", "", "$^2$", "", "", "", "", "", "}$", "", "", "", "", "$^T$"};

        /** Those words that should get the reserved-word highliting in the output. */
        public static String reservedWords[] = {"ABS", "ADDR", "AND", "ARRAY", "BEGIN", "BYTE2PIXEL", "CASE", "CDECL",
                                                                        "CHR", "CONST", "COS", "DISPOSE", "DIV", "DO", "DOWNTO", "END",
                                                                         "ELSE", "EXIT", "EXTERNAL", "FALSE", "FILE", "FOR", "FUNCTION", "GOTO",
                                                                         "IF", "IMPLEMENTATION", "IN", "INTERFACE", "IOTA", "LABEL", "LIBRARY", "LN",
                                                                        "MAX", "MIN", "MOD", "NAME", "NDX", "NEW", "NOT", "OF",
                                                                        "OR", "ORD", "PACKED", "PERM", "PIXEL2BYTE", "POW", "PRED", "PROCEDURE",
                                                                        "PROGRAM", "RDU", "READ", "READLN", "RECORD", "REPEAT", "ROUND", "SET",
                                                                        "SHL", "SHR", "SIN", "SIZEOF", "STRING", "SQRT", "SUCC", "TAN",
                                                                        "THEN", "TO", "TRANS", "TRUE", "TYPE", "VAR", "WITH", "WHILE",
                                                                        "WRITE", "WRITELN", "UNIT", "UNTIL", "USES"};

        /** Create a new empty expression tree.
        **/
        public ExpressionTree()
        {
                children= new Vector();
                this.nodeType= EMPTY_TREE;
                width= 0.0;
        }

        /** Create a new ExpressionTree. (Used to create a single identifier or litteral.)
             @param val the value of 'this' (single node) ExpressionTree
        **/
        public ExpressionTree(String val)
        {
                children= new Vector();
                this.val= new String(val);
                if (val.length() > 0 && val.charAt(0) >= '0' & val.charAt(0) <= '9')
                        this.nodeType= LEAF_LITTERAL; // Set to be a leaf litteral.
                else
                        this.nodeType= LEAF_IDENTIFIER; // Set to be a leaf identifier.
                width= (double)val.length();
        }

        /** Create a new empty ExpressionTree, and define it's type.
            This is useful to distinguish functions and arrays from single variables.
             @param val the value of 'this' ExpressionTree.
             @param nodeType the type of this node (e.g. FUNCTION_CALL).
        **/
        public ExpressionTree(String val, int nodeType) throws SyntaxError
        {
                children= new Vector();
                this.val= new String(val);
                if (nodeType > LAST_NODE_TYPE) {
                        throw new SyntaxError();
                }
                this.nodeType= nodeType;
                width= (double)val.length();
        }

        /** Create a new 'perm' ExpressionTree.
            Useful for the special case of a permutation.
           * Caution:
                The ExpressionTree paramaters should normally be a set construction and a variable identification (respectively).
                Attempts to do otherwise will be successful, and may generate unsensible output.
             @param val Normally "perm".
             @param setConstruction The first parameter (Normally a set construction)
             @param variableIdentification The second parameter (Normally any variable identification)
        **/
        public ExpressionTree(String val, ExpressionTree setConstruction, ExpressionTree variableIdentification)
        {
                this.val= new String(val);
                this.nodeType= PERMUTATION_TREE;
                this.width= 0.0;
                children= new Vector();
                children.addElement(setConstruction.cloneTree());
                children.addElement(variableIdentification.cloneTree());
        }

        /** Create a new empty ExpressionTree, define it's type, and whether to enclose the parameters within brackets.
            This is useful to distinguish functions and arrays from single variables.
             @param val the value of 'this' ExpressionTree.
             @param nodeType the type of this node (e.g. ARRAY_REFERENCE).
             @param brackets True if the function parameters should be within brackets.
        **/
        public ExpressionTree(String val, int nodeType, boolean brackets) throws SyntaxError
        {
                children= new Vector();
                this.val= new String(val);
                if (nodeType > LAST_NODE_TYPE) {
                        throw new SyntaxError();
                }
                this.nodeType= nodeType;
                this.brackets= brackets && nodeType==FUNCTION_CALL;
                width= (double)val.length();
        }

        /** Create a new ExpressionTree to represent a conditional update
             @param cond the condition that determines the update.
             @param ifTrue the value that would be given by the expression if cond be true.
             @param ifFalse the value that would be given by the expression if cond be false.
        **/
        public ExpressionTree(ExpressionTree cond, ExpressionTree ifTrue, ExpressionTree ifFalse)
        {
                children= new Vector();
                this.val= new String();
                this.nodeType= 8;
                if (ifTrue.width > ifFalse.width) {
                        width= ifTrue.width;
                } else {
                        width= ifFalse.width;
                }
                if (cond.width >= FUNCTION_CALL) {
                        width+= (cond.width + 3);
                } else {
                        width+= 9;
                }
                children.addElement(cond);
                children.addElement(ifTrue);
                children.addElement(ifFalse);
        }

        /** Clones the top node of this expression-tree.
             @return ExpressionTree - The cloned tree.
        **/
        public ExpressionTree cloneTree()
        {
                ExpressionTree retVal= new ExpressionTree(val);
                retVal.children= children;
                retVal.brackets= brackets;
                retVal.priority= priority;
                retVal.nodeType= nodeType;
                retVal.width= width;
                return retVal;
        }

        /** Is s in ss, and if so, at which position.
             @param s the String to look for.
             @param ss the array of Strings to look for it in
             @return int - the position of s in ss (or -1 if s is not in ss).
        */
        private static int in(String s, String ss[])
        {
                for (int i= 0; i<ss.length; i++) {
                        if (s.equalsIgnoreCase(ss[i])) {
                                return i;
                        }
                }
                return -1;
        }

        /** Returns the priority of the given operator. Throws OperatorError if  optr is not a valid operator.
             @param optr the operator to check the priority of.
             @return int - the priority of optr.
        */
        private static int priority(String optr) throws OperatorError
        {
                int i;
                for (i= 0; i < operators.length; i++)
                {
                        if (operators[i].equals(optr)) {
                                break;
                        }
                }
                if (i==operators.length)
                        throw new OperatorError(); // Not a valid operator
                else
                        return i;
        }

        /** Returns whether or not the given string is a valid operator.
             @param optr the operator we want to check for validity.
             @return boolean - True if optr is a valid operator.
        **/
        public static boolean isOperator(String optr)
        {
                boolean retVal= false;
                for (int i= 0; i < operators.length; i++)
                {
                        if (operators[i].equals(optr))
                        {
                                retVal= true;
                                break;
                        }
                }
                return retVal;
        }

        /** Puts brackets around an ExpressionTree
        **/
        public void bracket()
        {
                ExpressionTree temp= this.cloneTree();
                val= new String("");
                priority= 0;
                children= new Vector();
                children.addElement(temp);
                nodeType= BRACKETING_SCOPE;
                width+= 2.0;
        }

        /** Adds the expression in 'that' to the children of 'this'.
             (Applies to Arrays, giving them an additional subscript-field (to the right of the others - if any)
              Applies to Function calls - giving them an additional parameter.)
             @param that the subexpression we want to add to this function/array.
        **/
        public void addRightSubexpression(ExpressionTree that)
        {
                if (nodeType==ARRAY_REFERENCE) {
                        if (children.size()==0)
                                width+= 1.0;
                        children.addElement(that);
                        width+= (that.width + 1.0);
                }
                if (nodeType==FUNCTION_CALL) {
                        if (children.size()==0)
                                width+= 1.0;
                        children.addElement(that);
                        width+= (that.width + 1.0);
                }
        }

        /** Applies a unary operator to 'this' ExpressionTree.
             @param optr The operator to be applied to 'this' ExpressionTree.
        **/
        public void applyUnary(String optr) throws OperatorError
        {
                if (isOperator(optr))
                {
                        ExpressionTree child= (ExpressionTree)this.cloneTree();
                        val= optr;
                        brackets= false;
                        priority= priority(optr);
                        nodeType= UNARY_OPERATION;
                        children= new Vector();
                        children.addElement(child);
                        width+= optr.length();
                } else {
                        throw new OperatorError();
                }
        }

        /** Applies a unary operator to 'this' ExpressionTree.
             @param optr the operator we want to apply to 'this' ExpressionTree.
             @param brackets true if there should be brackets around the operand of the unary operator.
        **/
        public void applyUnary(String optr, boolean brackets) throws OperatorError
        {
                if (isOperator(optr))
                {
                        this.brackets= brackets;
                        ExpressionTree child= (ExpressionTree)this.cloneTree();
                        val= optr;
                        this.brackets= brackets;
                        priority= priority(optr);
                        nodeType= UNARY_OPERATION;
                        children= new Vector();
                        children.addElement(child);
                        width+= optr.length();
                } else {
                        throw new OperatorError();
                }
        }

        /** Applies an operation (dyadic operator, operand) to the right of 'this' ExpressionTree.
             Ignores the operator if the tree is empty (just inserts the value.)
             Effectively changes 'this' to "this optr operand" (infix-notation).
             @param optr The operator to apply.
             @param opearand The other operand.
        */
        public void applyRight(String optr, String operand) throws OperatorError
        {
                this.applyRight(optr, new ExpressionTree(operand));
        }

        /** Applies an operation (dyadic operator, operand) to the right of 'this' ExpressionTree.
             Ignores the operator if the tree is empty (just inserts the value.)
             Effectively changes 'this' to "this optr that" (infix-notation).
             @param optr The operator to apply.
             @param that The other operand.
        */
        public void applyRight(String optr, ExpressionTree that) throws OperatorError
        {
                if (isOperator(optr)) {
                // if optr is a valid operator
                        int pri= priority(optr);
                        if (false & this.nodeType==BINARY_OPERATION && this.priority<pri) {
                                if (false & that.nodeType==BINARY_OPERATION && that.priority<pri) {
                                        ((ExpressionTree)this.children.elementAt(1)).applyRight(
                                                optr, (ExpressionTree)that.children.elementAt(0));
                                        if (this.priority < that.priority) {
                                                that.children.setElementAt( this.children.elementAt(1),0);
                                                this.children.setElementAt( (ExpressionTree)that,1);
                                        } else {
                                                that.children.setElementAt( this,1);
                                                this.children= that.children;
                                                this.val= that.val;
                                                this.priority= that.priority;
                                        }
                                } else {
                                        ((ExpressionTree)this.children.elementAt(1)).applyRight(optr, that);
                                }
                        } else {
                                if (that.nodeType==BINARY_OPERATION && that.priority<pri) {
                                        ExpressionTree temp= this.cloneTree();
                                        temp.applyRight(optr, (ExpressionTree)that.children.elementAt(0));
                                         this.children= new Vector();
                                         this.children.addElement(temp);
                                         this.children.addElement(that.children.elementAt(1));
                                         this.val= that.val;
                                         this.priority= that.priority;
                                         this.nodeType= BINARY_OPERATION;
                                } else {
                                        ExpressionTree left= this.cloneTree();
                                        ExpressionTree right= that;
                                        children= new Vector();
                                        children.addElement(left);
                                        children.addElement(right);
                                        val= new String(optr);
                                        priority= pri;
                                        nodeType= BINARY_OPERATION;
                                        width= left.width + right.width + val.length();
                                }
                        }
                } else {
                        throw new OperatorError();
                }
        }

        /** Returns a String representation of 'this' ExpressionTree.
              @return String - The string to be displayed.
        */
        public String toString()
        {
                return toString(92.0);
        }

        /** Returns a String representation of 'this' ExpressionTree.
             @param maximumWidth Currantly redundant. The maximum width of the outputString before it must be broken up into lines.
             @return String - The String to be displayed.
        */
        public String toString(double maximumWidth)
        {
                String retVal;
                String valRep;
                int size= children.size();
                switch (this.nodeType) {
                case EMPTY_TREE: // Empty tree
                        return "";
                case LEAF_LITTERAL: // Leaf litteral
                        return val;
                case LEAF_IDENTIFIER: // Leaf identifier
                         int pos= in(val, greekLower);
                         if (pos>= 0) {
                                 return VpMathFont.Identifier(VpMathFont.mathTexify(val));
                         } else {
                                return VpMathFont.Identifier(val);
                         }
                case UNARY_OPERATION: // Unary operation
                        try {
                                valRep= new String(opRep[priority(val)]);
                        } catch (OperatorError e) {
                                valRep= VpMathFont.Identifier(val);
                        }
                        retVal= new String(valRep);
                        if (brackets) {
                                retVal+= "(";
                        } else {
                                retVal+= " ";
                        }
                        retVal+= ((ExpressionTree)children.elementAt(0)).toString(maximumWidth);
                        if (brackets) {
                                retVal+= ")";
                        } else {
                                retVal+= " ";
                        }
                        return retVal;
                case BINARY_OPERATION: // Binary operation
                        if (val.equals("**") || val.equalsIgnoreCase("pow")) {
                        // The operation is the power-operation, and must be treated specially
                                ExpressionTree temp = (ExpressionTree)children.elementAt(1);
                                 while (temp.nodeType==BRACKETING_SCOPE)
                                 {
                                        temp =  (ExpressionTree)temp.children.elementAt(0);
                                 }
                                retVal= new String("" + ((ExpressionTree)children.elementAt(0)).toString(maximumWidth) + "$^{");
                                boolean highlight=  VpMathFont.highlightIdentifiers();
                                VpMathFont.highlightIdentifiers(false);
                                retVal+= (temp.toString_ommitDollars(maximumWidth) + "}$");
                                VpMathFont.highlightIdentifiers(highlight);
                        } else if (val.equalsIgnoreCase("/") || val.equalsIgnoreCase("div")) {
                        // The operation is the division-operation, and must be treated specially
                                ExpressionTree temp1 = (ExpressionTree)children.elementAt(0);
                                ExpressionTree temp2 = (ExpressionTree)children.elementAt(1);
                                 while (temp1.nodeType==BRACKETING_SCOPE)
                                 {
                                        temp1 =  (ExpressionTree)temp1.children.elementAt(0);
                                 }
                                 while (temp2.nodeType==BRACKETING_SCOPE)
                                 {
                                        temp2 =  (ExpressionTree)temp2.children.elementAt(0);
                                 }
                                retVal= new String(("$\\frac{" + temp1.toString_ommitDollars(maximumWidth)) + "}{"+ temp2.toString_ommitDollars(maximumWidth) + "}$");
                        } else {
                                try {
                                                        valRep= new String(opRep[priority(val)]);
                                } catch (OperatorError e) {
                                        e.printStackTrace();
                                        valRep= VpMathFont.KeyWord(val);
                                        // In theory this shouldn't be able to happen since clients are prevented from making trees with bad operands.
                                }
                                retVal= new String(((ExpressionTree) children.elementAt(0)).toString(maximumWidth) + valRep);
                                if (width > maxWidth) {
                                        retVal+= VpMathFont.lineBreak;
                                } else {
                                        ;
                                }
                                retVal+= ((ExpressionTree)children.elementAt(1)).toString(maximumWidth-4.0);
                        }
                        return retVal;
                case ARRAY_REFERENCE: // Array with subscripts
                        if (val.equals("\\subscripts")) {
                                retVal= "";
                        } else {
                                retVal= VpMathFont.Identifier(val);
                        }
                        if (val.equals("")) {
                                if (size > 0) {
                                        boolean highlight=  VpMathFont.highlightIdentifiers();
                                        VpMathFont.highlightIdentifiers(false);
                                        retVal+= ("[" + ((ExpressionTree)children.elementAt(0)).toString(maximumWidth));
                                        for(int i= 1; i< children.size(); i++)
                                        {
                                                retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString(maximumWidth));
                                        }
                                        retVal+= "]";
                                        VpMathFont.highlightIdentifiers(highlight);
                                }
                        } else {
                                if (size > 0) {
                                        retVal+= ("$_{" + ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth));
                                        for(int i= 1; i< children.size(); i++)
                                        {
                                                retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString_ommitDollars(maximumWidth));
                                        }
                                        retVal+= "}$";
                                }
                        }
                        return retVal;
                case FUNCTION_CALL: // Function with paramenters
                        String id= val.substring(0, val.length());
                        int reserved= in(id, reservedFunctions);
                        int reservedWord= in(id, reservedWords);
                        boolean oddDollars= false;
                        boolean bracketingFunction= !(val.equalsIgnoreCase("sqrt"));
                        retVal= new String();
                        if (reserved>=0) {
                        // If the function is a reserved function
                                retVal+= leftRep[reserved];
                                if (brackets && bracketingFunction) {
                                        retVal+= "(";
                                } else {
                                        retVal+= " ";
                                }
                                oddDollars= ((countOccurancesOf(leftRep[reserved], '$')%2)==1);
                        } else if (reservedWord>=0) {
                        // If the function is a reserved word.
                                retVal+= VpMathFont.KeyWord(val);
                                if (brackets && bracketingFunction) {
                                        retVal+= "(";
                                } else {
                                        retVal+= " ";
                                }
                        } else {
                        // If the function is just an identifier
                                retVal+= VpMathFont.Identifier(val)+" ";
                                if (brackets && bracketingFunction) {
                                        retVal+= "(";
                                } else {
                                        retVal+= " ";
                                }
                        }
                        if (size > 0) {
                                if (oddDollars) {
                                        retVal+= ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth);
                                } else {
                                        retVal+= ((ExpressionTree)children.elementAt(0)).toString(maximumWidth);
                                }
                                for(int i= 1; i< children.size(); i++)
                                {
                                        if (oddDollars) {
                                                retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString_ommitDollars(maximumWidth));
                                        } else {
                                                retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString(maximumWidth));
                                        }
                                }
                        }
                        if (reserved>=0) {
                        // If the function is a reserved function
                                if (brackets && bracketingFunction) {
                                        retVal+= ")";
                                } else {
                                        retVal+= " ";
                                }
                                retVal+= rightRep[reserved];
                        } else {
                        // If the function is not a reserved word
                                if (brackets && bracketingFunction) {
                                        retVal+= ")";
                                } else {
                                        retVal+= " ";
                                }
                        }
                        return retVal;
                case BRACKETING_SCOPE: // Subexpression within brackets
                        return ("(" + ((ExpressionTree)children.elementAt(0)).toString(maximumWidth) + ")");
                case PERMUTATION_TREE: // Permutation expression
                        ExpressionTree right= ((ExpressionTree)children.elementAt(1));
                        String space;
                        if (val.equals("perm")) {
                                space= " ";
                        } else {
                                space= "";
                        }
                        return (VpMathFont.KeyWord(val) + " " +
                                       ((ExpressionTree)children.elementAt(0)).toString(maximumWidth) + space +
                                       right.toString(maximumWidth)
                                       );
                default:
                        return "";// Can't happen unless someone alters the class ExpressionTree itself.
                }
        }

        /** Strips off any '$' signs within the String s.
             @param s The string to remove '$'s from.
             @return String - The version of s with no '$'s.
        */
        private static String ommitDollars(String s)
        {
                String retVal= new String();
                char currentChar;
                for (int i=0; i< s.length(); i++)
                {
                        currentChar= s.charAt(i);
                        if (currentChar != '$') {
                                retVal+= currentChar;
                        }
                }
                return retVal;
        }

        /** Counts the number of occurances of the character c in the string s.
              @param s The String to search.
              @param c The character to search for.
              @return int - The number of occurances.
        */
        private int countOccurancesOf(String s, char c)
        {
                int retVal= 0;
                for (int i= 0; i< s.length(); i++)
                {
                        if (s.charAt(i)==c) {
                                retVal++;
                        }
                }
                return retVal;
        }

        /** Returns a String-representation of 'this' ExpressionTree.
             Ommits all $-characters which are used to toggle between maths-mode and latex-mode.
             This is useful for expressions that are nested within mathematical expressions.
             @return String - The String to be displayed.
        */
        public String toString_ommitDollars()
        {
                return toString_ommitDollars(92.0);
        }

        /** Returns a String-representation of 'this' ExpressionTree.
             Ommits all $-characters which are used to toggle between maths-mode and latex-mode.
             This is useful for expressions that are nested within mathematical expressions.
             @param maximumWidth Currantly redundant. The maximum width of the outputString before it must be broken up into lines.
             @return String - The String to be displayed.
        */
        private String toString_ommitDollars(double maximumWidth)
        {
                String retVal;
                String valRep;
                int size= children.size();
                switch (this.nodeType) {
                case EMPTY_TREE: // Empty tree
                        return "";
                case LEAF_LITTERAL: // Leaf litteral
                        return val;
                case LEAF_IDENTIFIER: // Leaf identifier
                         int pos= in(val, greekLower);
                         if (pos>= 0) {
                                 return VpMathFont.Identifier(VpMathFont.mathTexify(val));
                         } else {
                                return VpMathFont.Identifier(val);
                        }
                case UNARY_OPERATION: // Unary operation
                        try {
                                valRep= new String(ommitDollars(opRep[priority(val)]));
                        } catch (OperatorError e) {
                                valRep= VpMathFont.KeyWord(val);
                        }
                        return valRep + " "+ ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth);
                case BINARY_OPERATION: // Binary operation
                        if (val.equals("**") || val.equalsIgnoreCase("pow")) {
                        // The operation is the power-operation, and must be treated specially
                                ExpressionTree temp = (ExpressionTree)children.elementAt(1);
                                 while (temp.nodeType==BRACKETING_SCOPE)
                                 {
                                        temp =  (ExpressionTree)temp.children.elementAt(0);
                                 }
                                retVal= new String(("" + ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth)) + "^{");
                                boolean highlight=  VpMathFont.highlightIdentifiers();
                                VpMathFont.highlightIdentifiers(false);
                                retVal+= (temp.toString_ommitDollars(maximumWidth) + "}");
                                VpMathFont.highlightIdentifiers(highlight);
                        } else {
                                try {
                                        valRep= new String(ommitDollars(opRep[priority(val)]));
                                } catch (OperatorError e) {
                                        e.printStackTrace();
                                        valRep= VpMathFont.Identifier(val);
                                        // In theory this shouldn't be able to happen since clients are prevented from makeing trees with bad operands.
                                }
                                retVal= new String((((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth)) + valRep);
                                retVal+= ((ExpressionTree)children.elementAt(1)).toString_ommitDollars(maximumWidth) + "";
                        }
                        return retVal;
                case ARRAY_REFERENCE: // Array with subscripts
                        if (val.equals("\\subscripts")) {
                                retVal= "";
                        } else {
                                retVal= VpMathFont.Identifier(val);
                        }
                        if (val.equals("")) {
                                if (size > 0) {
                                        retVal+= ("[" + ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth));
                                        for(int i= 1; i< children.size(); i++)
                                        {
                                                retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString_ommitDollars(maximumWidth));
                                        }
                                        retVal+= "]";
                                }
                        } else {
                                if (size > 0) {
                                        boolean highlight=  VpMathFont.highlightIdentifiers();
                                        VpMathFont.highlightIdentifiers(false);
                                        retVal+= ("_{" + ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth));
                                        for(int i= 1; i< children.size(); i++)
                                        {
                                                retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString_ommitDollars(maximumWidth));
                                        }
                                        retVal+= "}";
                                        VpMathFont.highlightIdentifiers(highlight);
                                }
                        }
                        return retVal;
                case FUNCTION_CALL: // Function with paramenters
                        String id= val.substring(0, val.length());
                        int reserved= in(id, reservedFunctions);
                        int reservedWord= in(id, reservedWords);
                        retVal= new String();
                        boolean bracketingFunction= !(val.equalsIgnoreCase("sqrt"));
                        if (reserved>=0) {
                        // If the function is a reserved function
                                retVal+=  ommitDollars(leftRep[reserved]);
                                if (brackets && bracketingFunction) {
                                        retVal+= "(";
                                } else {
                                        retVal+= " ";
                                }
                        } else if (reservedWord>=0) {
                                retVal+= VpMathFont.KeyWord(val);
                                if (brackets && bracketingFunction) {
                                        retVal+= "(";
                                } else {
                                        retVal+= " ";
                                }
                        } else {
                        // If the function is just an identifier
                                retVal+= VpMathFont.Identifier(val)+" ";
                                if (brackets && bracketingFunction) {
                                        retVal+= "(";
                                } else {
                                        retVal+= " ";
                                }
                        }
                        if (size > 0) {
                                retVal+= ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth);
                                for(int i= 1; i< children.size(); i++)
                                {
                                        retVal+= (", " + ((ExpressionTree)children.elementAt(i)).toString_ommitDollars(maximumWidth));
                                }
                        }
                        if (reserved>=0) {
                        // If the function is a reserved function
                                if (brackets && bracketingFunction) {
                                        retVal+= ")";
                                } else {
                                        retVal+= " ";
                                }
                                retVal+= ommitDollars(rightRep[reserved]);
                        } else {
                        // If the function is not a reserved word
                                if (brackets && bracketingFunction) {
                                        retVal+= ")";
                                } else {
                                        retVal+= " ";
                                }
                        }
                        return retVal;
                case BRACKETING_SCOPE: // Subexpression within brackets
                        return ("(" + ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth) + ")");
                case PERMUTATION_TREE: // Permutation expression
                        ExpressionTree right= ((ExpressionTree)children.elementAt(1));
                        String space;
                        if (val.equals("perm")) {
                                space= " ";
                        } else {
                                space= "";
                        }
                        return (VpMathFont.KeyWord(val) + " " +
                                       ((ExpressionTree)children.elementAt(0)).toString_ommitDollars(maximumWidth) + space +
                                       right.toString_ommitDollars(maximumWidth)
                                       );
                default:
                        return "";// Can't happen unless someone alters this class ExpressionTree itself.
                }
        }
}
