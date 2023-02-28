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


/** Translates pieces of program (VectorPascal) code into mathematical syntax.
  * Can deal with different types of code so long as the type (see Field Summary) is specified.
*/
public class VpMath
{
        /** Identifies a simple statement (so it can be destinguished from other structures (below). */
        public static int SIMPLE_STATEMENT= 0;

        /** Identifies a variable declaration. */
        public static int VARIABLE_DECLARATION = 1;

        /** Identifies a constant declaration. */
        public static int CONSTANT_DECLARATION =  2;

        /** Identifies a type declaration. */
        public static int TYPE_DECLARATION= 3;

        /** Translates a simple statement or a var/const declaration into mathematical notation.
             @param input The code that should be translated. The contents of input are changed into mathematical notation.
             @param indentation Currantly redundant. Would be used for linebreaking purposes. Kept for extendability.
             @param category Identifies the input as a statement or type of declaration (see Field Summary).
             @return - The translated code (in latex code).
        **/
        public static String simpleToMath (String input, int indentation, int category) throws SyntaxError
        {
                boolean succeeded=false;
                try {
                        if (category==SIMPLE_STATEMENT){
                                // Parse a simple statement
                                String content= new String(input);
                                String changedContent= new String();
                                VpLex lex = new VpLex(content);
                                String temp= lex.skipTo_within_nonNestedScope(';');
                                while (temp != null)
                                {
                                        changedContent+= parseStatement(temp + ";", (double)(92 - 4 * 0)) + "; ";
                                        lex.mustBe(";");
                                        temp= lex.skipTo_within_nonNestedScope(';');
                                }
                                lex.skipWhiteSpace();
                                if (!lex.end()) {
                                        changedContent+= parseStatement(lex.theRest() + ";", (double)(92 - 4 * 0));
                                }
                                input= changedContent;
                                succeeded= true;
                                return changedContent;
                        } else if (category==CONSTANT_DECLARATION) {
                                // Parse a constant declaration
                                String content= new String(input);
                                String changedContent= parseConstDecl(content, (double)(92 - 4 * 0));
                                input= changedContent;
                                succeeded= true;
                                return changedContent;
                        } else if (category==VARIABLE_DECLARATION){
                                // Parse a variable declaration
                                String content= new String(input);
                                String changedContent= parseVarDecl(content, (double)(92 - 4 * 0));
                                input= changedContent;
                                succeeded= true;
                                return changedContent;
                        } else if (category==TYPE_DECLARATION) {
                                // Parse a type declaration
                                throw new SyntaxError();
                        } else {
                                // Procedure has been called with an illegal  category paramter.
                                throw new SyntaxError();
                        }
                } catch (SyntaxError e) {
                        CodeLine codeLine= new CodeLine(input, 0, "", TYPE_DECLARATION, false);
                        return codeLine.toString();
                } catch (Exception e) {
                        CodeLine codeLine= new CodeLine(input, 0, "", TYPE_DECLARATION, false);
                        return codeLine.toString();
                }
		//if (!succeeded) throw new SyntaxError();
        }

        /** Parse one single constant declaration.
              @param inputString The code to parse.
              @param maximumWidth Currently Redundant. The maximum width the output can take up. Kept for extendability.
              @return String - The translated code.
        */
        private static String parseConstDecl (String inputString, double maximumWidth) throws SyntaxError
        {
                String constType; // The type definition of the constant
                String outputString;  // String to return at end of procedure

                String exp1, exp2;
                ExpressionTree tree1, tree2;
                CodeLine codeLine;

                VpLex lex= new VpLex(inputString);  // Lexer to analyse the input

                exp1= lex.skipTo(":="); // Move to the first separator (:=)
                if (exp1==null) {
                        exp1= lex.skipTo(';'); // Move to the first terminator (;)
                }
                tree1= parseExpression(exp1);
                outputString= new String("\\textsf{" + tree1);

                if (lex.have(":")) {
                        constType=lex.skipTo("=");
                        codeLine= new CodeLine(constType, 0, "", TYPE_DECLARATION, false);
                        constType= codeLine.emphasisedLine(codeLine.content);
                        outputString+= (": " + constType);
                }
                lex.mustBe("=");
                outputString+= "= ";
                if (lex.have("(")) {
                        outputString+= "(";
                        exp2= lex.skipTo(',');
                        while (lex.have(","))
                        {
                                tree2= parseExpression(exp2);
                                outputString+= (tree2 + ", ");
                                exp2= lex.skipTo(',');
                        }
                        exp2= lex.skipTo(')');
                        tree2= parseExpression(exp2);
                        outputString+= (tree2 + ")");
                } else {
                        exp2= lex.skipTo(';');
                        tree2= parseExpression(exp2);
                        outputString+=  tree2;
                }
                outputString+= ";}";
                return outputString;
        }

        /** Parse one single variable declaration.
              @param inputString The code to parse.
              @param maximumWidth The maximum width the output can take up (currently redundant).
              @return String - The translated code.
        */
        private static String parseVarDecl (String inputString, double maximumWidth) throws SyntaxError
        {
                String outputString;  // String to return at end of procedure

                String exp1, exp2;
                ExpressionTree tree1;

                VpLex lex= new VpLex(inputString);  // Lexer to analyse the input

                outputString= new String("\\textsf{Let ");

                exp1=lex.skipTo(',');
                lex.have(",");
                while (exp1 != null)
                {
                        tree1= parseExpression(exp1);
                        outputString+= (tree1 + ", ");
                        exp1= lex.skipTo(',');
                        lex.have(",");
                }
                exp1= lex.skipTo(':');
                lex.mustBe(":");
                exp2= lex.skipTo(';');
                exp2= Line.formatString(exp2);

                tree1= parseExpression(exp1);

                outputString+= (tree1 + " $\\in$ " + exp2 + ";}");
                return outputString;
        }

        /** Parse one single simple statement. Can also cope with expressions within loops, case and if statements.
              @param inputString The code to parse.
              @param maximumWidth Currantly redundant. The maximum width the output can take up. Kept for extendability.
              @return String - The translated code.
        */
        private static String parseStatement (String inputString, double maximumWidth) throws SyntaxError
        {
                String outputString,  // String to return at end of procedure
                           id;                   // Temporary variable to hold name of identifier.

                ExpressionTree tree1, // Will hold a procedure call or the LH.Side of an assignment.
                                            tree2;  // Will hold the Right hand side of the (possible) assignment
                String exp1,
                           exp2;
                char terminators[]= {':', ';'}; // Characters that indicate the end of an expression.

                VpLex lex= new VpLex(inputString);  // Lexer to analyse the input

                if (lex.have("begin ") || lex.have("if ") || lex.have("for ") || lex.have("case ") ) {
                        throw new SyntaxError();
                } else {

                        lex.skipWhiteSpace();

                        outputString= new String("\\textsf{");
                        if (lex.have(":")) {
                                // Line preceeded by a label.
                                outputString+= ": ";
                        }
                        exp1= lex.skipTo_within_nonNestedScope(":=");
                        if (exp1==null) {
                        // None of terminators were found by lex.
                                exp1= lex.skipTo_within_nonNestedScope(';');
                        }
                        if (exp1==null) {
                        // None of terminators were found by lex.
                                exp1=lex.theRest();
                        }
                        // Get the lefthandside of the assignment or the whole procedure(-expression) in the case of a procedure-call.
                        tree1= parseExpression(exp1+";"); // Parse L.H.S.
                        if (lex.have(":=")) {
                                if (lex.have("if")) {
                                // This is a conditional assignment statement.
                                         outputString+= "$" + tree1.toString_ommitDollars() + "\\leftarrow \\left\\{ \\begin{array}{ll}\n";
                                         ExpressionTree t1, t2, t3;

                                         exp2= lex.skipTo("then");
                                         t1= parseExpression(exp2);
                                         lex.mustBe("then");

                                         exp2= lex.skipTo("else");
                                         t2= parseExpression(exp2);
                                         lex.mustBe("else");
                                         exp2= lex.skipTo(terminators);
                                         if (exp2 == null) {
                                         // None of terminators were found by lex, so just get the rest of the input.
                                                 exp2=lex.theRest();
                                         }
                                         t3= parseExpression(exp2);
                                         outputString+= "       " + t2.toString_ommitDollars() + " & \\mbox{if " + t1 + "}\\\\ \n";
                                         outputString+= "       " + t3.toString_ommitDollars() + " & \\mbox{otherwise}\\\\ \n";
                                         outputString+= "\\end{array} \\right.$";
                                } else {
                                        exp2= lex.theRest();
                                        tree2= parseExpression(exp2);
                                        try {
                                                tree1.applyRight(":=", tree2);
                                                outputString+= tree1.toString(maximumWidth);
                                        } catch (OperatorError e) {
                                                // This really shouldn't be able to happen.
                                                // If it does, then check that ":=" as written immediately above is in ExpressionTree.operators.
                                                throw new SyntaxError();
                                        }
                                }
                        } else {
                                outputString+= tree1;
                        }
                        outputString+= "}";
                        return outputString;
                }
        }

        /** Parse one single expression.
              @param exp - the code to parse.
              @return ExpressionTree - The translated code on the form of an ExpressionTree (overrides .toString()).
        */
        private static ExpressionTree parseExpression(String exp) throws SyntaxError
        {
                String recExpr;
                String id= new String();           // Used to store the name of identifiers.
                ExpressionTree recTree1;
                exp += "; "; // Avoids an infinite loop at the end, looking for an identifier
                if (exp.length()==0) {
                        return new ExpressionTree();
                } else {
                        ExpressionTree retVal,
                                                locTree,    // Holds the local expression tree.
                                                locTree1,  // Hold the even ...
                                                locTree2; //   ...more local expression trees.

                        String locExp;  // Used to hold a local expression (normally used for recursive calls)

                        retVal= new ExpressionTree();

                        VpLex lex= new VpLex(exp);      // Lexical analyser

                        boolean precOp= false;
                        String precOperator= new String("");
                        for (int i= 0; i< (ExpressionTree.operators).length; i++) {
                        // Get the appropriate operator (if available)
                                if (lex.canHave(ExpressionTree.operators[i])) {
                                        precOp= true;
                                        if (precOperator.length() < (ExpressionTree.operators[i]).length()) {
                                                precOperator= new String(ExpressionTree.operators[i]);
                                        }
                                }
                        }
                        if (precOp) {
                                lex.have(precOperator);
                                try {
                                        recExpr= lex.theRest();
                                        retVal= parseExpression(recExpr);
                                        retVal.applyUnary(precOperator);
                                } catch (OperatorError e) {
                                        e.printStackTrace();
                                }
                                return retVal;
                        } else {
                                if (lex.have("(")) {
                                // Bracketed expression
                                        locExp=  lex.skipTo_within_nonNestedScope(')');                      // Get subexpression
                                        if (locExp==null) {
                                        // No occurance of ';' was found by lex.
                                                throw new SyntaxError();
                                        }
                                        locTree= parseExpression(locExp); // Parse subexpression
                                        locTree.bracket();                              // Put the expression between brackets.
                                        lex.mustBe(")");
                                        if (lex.have("[")) {
                                                locTree1= new ExpressionTree("\\subscripts", ExpressionTree.ARRAY_REFERENCE);
                                                boolean comma= true;
                                                while (comma) {
                                                        locExp= lex.skipTo_within_nonNestedScope (',');  // Get each subscript
                                                        if (locExp==null) {
                                                                throw new SyntaxError();
                                                        }
                                                        comma = (lex.have("][") || lex.have(","));
                                                        locTree2= parseExpression(locExp);                       // Parse the subscript-expression
                                                        locTree1.addRightSubexpression(locTree2);             // Add the subscript to the array
                                                }
                                                lex.have("]");
                                                locTree= new ExpressionTree("", locTree, locTree1);
                                        }
                                } else if (lex.have("[")) {
                                // Entering an set construction
                                        locTree= new ExpressionTree("", ExpressionTree.ARRAY_REFERENCE);
                                        while (!lex.have("]")) {
                                                locExp= lex.skipTo_within_nonNestedScope (',');  // Get each subscript
                                                if (locExp==null) {
                                                        throw new SyntaxError();
                                                }
                                                lex.have(",");
                                                locTree1= parseExpression(locExp);                       // Parse the subscript-expression
                                                locTree.addRightSubexpression(locTree1);             // Add the subscript to the array
                                        }
                                } else if (lex.alphabetic() || lex.currentChar()=='_') {
                                // Either variable_name, array (with subscripts) or procedure/function (with parameters)
                                        id= lex.getIdentifier();
                                        lex.skipWhiteSpace();
                                        boolean recUnary= false;
                                        ExpressionTree topTree, tempTree, recTree;
                                        topTree= tempTree= null;
                                        if (lex.alphabetic() || lex.numeric()) {
                                        // This is a non-bracketed unary function.
                                                boolean foundOp = false;
                                                for (int i= 0; i< (ExpressionTree.operators).length; i++) {
                                                // Get the appropriate operator (if available)
                                                        if (lex.canHave(ExpressionTree.operators[i])) {
                                                                foundOp= true;
                                                                break;
                                                        }
                                                }
                                                if (! foundOp) {
                                                        topTree=  new ExpressionTree(id, ExpressionTree.FUNCTION_CALL, false);
                                                        tempTree= topTree;
                                                        recUnary= true;
                                                        if (lex.alphabetic()) {
                                                                id= lex.getIdentifier();
                                                                lex.skipWhiteSpace();
                                                                while (lex.alphabetic())
                                                                {
                                                                        recTree= new ExpressionTree(id, ExpressionTree.FUNCTION_CALL, false);
                                                                        tempTree.addRightSubexpression(recTree);              // Add the argument to the function call
                                                                        tempTree= recTree;
                                                                        id= lex.getIdentifier();
                                                                        lex.skipWhiteSpace();
                                                                }
                                                        }
                                                }
                                        }
                                        if (lex.numeric()) {
                                        // So there's a number (integer or real.)
                                                id= lex.getNumber();
                                                locTree= new ExpressionTree(id, ExpressionTree.LEAF_LITTERAL);
                                        } else if (lex.have("[")) {
                                        // Entering an array with subscripts
                                                if (id.equalsIgnoreCase("perm")) {
                                                        locTree= new ExpressionTree("", ExpressionTree.ARRAY_REFERENCE);
                                                        boolean comma= true;
                                                        while (comma) {
                                                                locExp= lex.skipTo_within_nonNestedScope (',');  // Get each subscript
                                                                if (locExp==null) {
                                                                        throw new SyntaxError();
                                                                }
                                                                comma = (lex.have("][") || lex.have(","));
                                                                locTree1= parseExpression(locExp);                       // Parse the subscript-expression
                                                                locTree.addRightSubexpression(locTree1);             // Add the subscript to the array
                                                        }
                                                        lex.have("]");
                                                        ExpressionTree t1= parseExpression(lex.theRest());
                                                        locTree= new ExpressionTree(id, locTree, t1);
                                                } else {
                                                        locTree= new ExpressionTree(id, ExpressionTree.ARRAY_REFERENCE);
                                                        boolean comma= true;
                                                        while (comma) {
                                                                locExp= lex.skipTo_within_nonNestedScope (',');  // Get each subscript
                                                                if (locExp==null) {
                                                                        throw new SyntaxError();
                                                                }
                                                                comma = (lex.have("][") || lex.have(","));
                                                                locTree1= parseExpression(locExp);                       // Parse the subscript-expression
                                                                locTree.addRightSubexpression(locTree1);             // Add the subscript to the array
                                                        }
                                                        lex.have("]");
                                                }
                                        } else if (lex.have("(")) {
                                        // Entering a function with parameters
                                                locTree= new ExpressionTree(id, ExpressionTree.FUNCTION_CALL, true);
                                                boolean foundBracket= false;
                                                while (!lex.have(")")) {
                                                        locExp= lex.skipTo_within_nonNestedScope (',');  // Get each argument.
                                                        if (locExp==null) {
                                                                throw new SyntaxError();
                                                        }
                                                        lex.have(",");
                                                        locTree1= parseExpression(locExp);                        // Parse the subscript-expression
                                                        locTree.addRightSubexpression(locTree1);              // Add the argument to the function call
                                                }
                                                while (lex.canHave("(") || lex.canHave("[")) {
                                                        if (lex.have("[")) {
                                                                locTree1= new ExpressionTree("\\subscripts", ExpressionTree.ARRAY_REFERENCE);
                                                                boolean comma= true;
                                                                while (comma) {
                                                                        locExp= lex.skipTo_within_nonNestedScope (',');  // Get each subscript
                                                                        if (locExp==null) {
                                                                                throw new SyntaxError();
                                                                        }
                                                                        comma = (lex.have("][") || lex.have(","));
                                                                        locTree2= parseExpression(locExp);                       // Parse the subscript-expression
                                                                        locTree1.addRightSubexpression(locTree2);             // Add the subscript to the array
                                                                }
                                                                lex.mustBe("]");
                                                                locTree= new ExpressionTree("", locTree, locTree1);
                                                        } else {
                                                                lex.mustBe("(");
                                                                locTree1= new ExpressionTree("", ExpressionTree.FUNCTION_CALL, true);
                                                                boolean comma= true;
                                                                while (comma) {
                                                                        locExp= lex.skipTo_within_nonNestedScope (',');  // Get each subscript
                                                                        if (locExp==null) {
                                                                                throw new SyntaxError();
                                                                        }
                                                                        comma = (lex.have(","));
                                                                        locTree2= parseExpression(locExp);                       // Parse the subscript-expression
                                                                        locTree1.addRightSubexpression(locTree2);             // Add the subscript to the array
                                                                }
                                                                lex.mustBe(")");
                                                                locTree= new ExpressionTree("", locTree, locTree1);
                                                        }
                                                }
                                        } else {
                                        // We just passed a single variable or a sequence of unary non-bracketed functions recursively applied to some varible.
                                                locTree= new ExpressionTree(id);        // Make an expression-tree with a single variable
                                        }
                                        if(recUnary) {
                                                tempTree.addRightSubexpression(locTree);
                                                locTree= topTree;
                                        }
                                } else if (lex.numeric() || lex.currentChar()=='$') {
                                // So there's a number (integer or real.)
                                        id= lex.getNumber();
                                        locTree= new ExpressionTree(id, ExpressionTree.LEAF_LITTERAL);
                                } else if (lex.have("\'")) {
                                // So there's a string literal
                                        String theString= lex.skipTo('\'');
                                        while (lex.have("'\'"))
                                        {
                                                theString+= ("\'" + lex.skipTo('\''));
                                        }
                                        if (theString==null) {
                                                theString= new String();
                                        }
                                        Line l= new Line("", 0, false); // Dummy Line
                                        id= ("\\textrm{\\textup { " + '`'+l.formatString(theString)+"\' } }");
                                        lex.mustBe("'");
                                        locTree= new ExpressionTree(id);
                                } else {
                                        throw new SyntaxError();
                                }
                                retVal= locTree;
                                // SET the return value.
                                boolean found= false;
                                String op= new String("");
                                if (!lex.end()) {
                                        for (int i= 0; i< (ExpressionTree.operators).length; i++) {
                                        // Get the appropriate operator (if available)
                                                if (lex.canHave(ExpressionTree.operators[i])) {
                                                        found= true;
                                                        if (op.length() < (ExpressionTree.operators[i]).length())
                                                                op= new String(ExpressionTree.operators[i]);
                                                }
                                        }
                                }
                                if (!lex.end() && found) {
                                // There's more to come (the expression is not yet complete).
                                        lex.have(op);
                                        lex.skipWhiteSpace();
                                        if (op.equals("^")) {
                                                while (lex.have("^")) {
                                                        try {
                                                                retVal.applyRight("^", new ExpressionTree("", 2));
                                                        } catch (OperatorError e) {
                                                                e.printStackTrace();
                                                                throw new SyntaxError();
                                                        }
                                                }
                                        }
                                        recExpr= lex.theRest();
                                        if (recExpr.startsWith(";")) {
                                                recTree1= new ExpressionTree("", 2);
                                        } else {
                                                recTree1= parseExpression(recExpr);
                                        }
                                        try {
                                                retVal.applyRight(op, recTree1);
                                        } catch (OperatorError e) {
                                                // Can't happen - since 'op' takes it's value from the table 'operators in ExpressionTree.
                                                e.printStackTrace();
                                                throw new SyntaxError();
                                        }
                                }
                                return retVal;
                        }
                }
        }

}
