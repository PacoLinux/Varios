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

/** VpLex helps to split up program structures into subStructures and tokens.
  * Is specialized to deal with VectorPascal code (backwards compatible with earlier versions of Pascal).
*/
public class VpLex
{
        int colInd;
        String input;

        /** Create an instance of this lexer.
              @ param inp the input source of this lexer.
        */
        VpLex(String inp)
        {
                colInd= 0;
                input = inp;
        }

        /** Is the current character an alphabetic ('a'..'Z')?
             @ return boolean- whether current character is alphabetic.
        **/
        public boolean alphabetic()
        {
                return ((!end()) && alphabetic(input.charAt(colInd)));
        }

        /** is character 'ch' an alphabetic ('a'..'Z')?
             @ return boolean- whether current character is alphabetic.
        **/
        private static boolean alphabetic(char ch)
        {
                return ((ch >= 'a')  & ch <= 'z') | ((ch >= 'A') & (ch<='Z'));
        }

        /** Checks if the string s occurs at the current position (or after some space) in the 'input' String.
             @ param s the String to look for.
             @return boolean - true iff the string was found
        **/
        public boolean canHave(String s)
        {
                boolean found;
                int oldInd= colInd;
                found= have(s);
                colInd= oldInd;
                return found;
        }

        /** Gives the character of the current posisiton in the input String.
             @return char - the character of the current posisiton in VpLex
        **/
        public char currentChar()
        {
                return input.charAt(colInd);
        }

        /** Tests if this VpLex has reached the end of it's input
             @return boolean - true iff VpLex has reached the end
        **/
        public boolean end()
        {
                return (colInd == input.length());
        }

        /** Get a sequence of alphabeics ('a'-'Z') and numerics ('0'-'9').
             @return String - the sequence of aphabetics/numerics
        **/
        public String getAlphaNumerics() throws SyntaxError
        {
                skipWhiteSpace();                                              // Move to the hexadecimal value.
                int searchInd= colInd;
                char currentChar= input.charAt(searchInd);      // Get the character at the current pos. in the input
                String retVal;
                while (searchInd < (input.length()) && (alphabetic(currentChar) || numeric(currentChar)))
                {
                        currentChar= input.charAt(searchInd);
                        searchInd++;
                }
                if (colInd==searchInd)
                        throw new SyntaxError();
                if (searchInd== input.length())
                        retVal= new String(input.substring(colInd, searchInd));
                else
                        retVal= new String(input.substring(colInd, searchInd-1));
                colInd= searchInd-1;
                return retVal;
        }

        /** Gets an identifier (of the form:  letter (letter | digit | '_')*.
            @return String - the identifier.
        **/
        public String getIdentifier() throws SyntaxError
        {
                skipWhiteSpace();                                              // Move to the integer
                int searchInd= colInd;
                char currentChar= input.charAt(searchInd);      // Get the character at the current pos. in the input
                String retVal= new String();
                if (alphabetic(currentChar) || currentChar=='_' || currentChar=='.') {
                        while (searchInd < (input.length()) && (alphabetic(currentChar) || numeric(currentChar) || currentChar=='_' || currentChar=='.'))
                        {
                                currentChar= input.charAt(searchInd);
                                searchInd++;
                                if (alphabetic(currentChar) || numeric(currentChar))
                                        retVal+= currentChar;
                                if (currentChar=='_')
                                        retVal+= "\\_";
                                if (currentChar=='.')
                                        retVal+= ".";
                        }
                        if (colInd==searchInd)
                                throw new SyntaxError();
                        colInd= searchInd-1;
                } else {
                        throw new SyntaxError();
                }
                return retVal;
        }

        /** Gets a sequence of digits (a decimal integer or a component of some other number)
             @return String - the digits.
        **/
        public String getInt() throws SyntaxError
        {
                skipWhiteSpace();                                              // Move to the integer
                int searchInd= colInd;
                char currentChar= input.charAt(searchInd);      // Get the character at the current pos. in the input
                String retVal;
                while (searchInd < (input.length()) && numeric(currentChar))
                {
                        currentChar= input.charAt(searchInd);
                        searchInd++;
                }
                if (colInd==searchInd)
                        throw new SyntaxError();
                if (searchInd== input.length())
                        retVal= new String(input.substring(colInd, searchInd));
                else
                        retVal= new String(input.substring(colInd, searchInd-1));
                colInd= searchInd-1;
                return retVal;
        }

        /** Get a number (real or integer) of any form allowed in Vector Pascal.
            @return String - the number we got.
        **/
        public String getNumber() throws SyntaxError
        {
                int currentPos= colInd;
                String retVal= new String();
                if (have("$")) {
                // This is a hexadecimal integer number
                        retVal+= "\\$";
                        retVal+= getAlphaNumerics();
                } else {
                // This can be a variety of integers and reals which all start with a simple int (digits only)
                        retVal+= getInt();
                        if (have("#")) {
                        // This is a user-defined-base integer.
                                retVal+= "\\#";
                                retVal+= getAlphaNumerics();
                        } else {
                                if (!canHave("..") && have(".")) {
                                // This is a decimal number.
                                        retVal+= '.';
                                        retVal+= getInt();
                                }
                                if (have('e')) {
                                // This is a decimal number multiplied by some power of 10 (not nexessarily containing a '.').
                                        retVal+= "e";
                                        if (have("-")) {
                                                retVal+= "-";
                                        } else {
                                                have("+");
                                        }
                                        retVal+= getInt();
                                }
                        }
                }
                while (retVal.charAt(retVal.length()-1)==' ')
                {
                        retVal= retVal.substring(0, retVal.length()-1);
                }
                while (retVal.charAt(0)==' ')
                {
                        retVal= retVal.substring(1, retVal.length());
                }
                return retVal;
        }

        /** Skips the caracter c if it occurs at the current position (or after some space in the 'input' string.
             @return boolean - true iff the string was found (and hence skipped).
        */
        public boolean have (char c)
        {
                boolean retVal= !end() && input.charAt(colInd)==c;
                if (retVal) {
                        colInd++;
                }
                return retVal;
        }

        /** Skips the string s if it occurs at the current position (or after some space) in the 'input' string.
              If s is an identifier (valid identifier syntax), immediately followed by a valid identifier-character,
              then false is returned (since there is something else and longer here), and nothing is skipped.
             @return boolean - true iff the string was found (and hence skipped).
        **/
        public boolean have(String s)
        {
                boolean retVal= false;
                int OldInd= colInd;
                if (s.startsWith("\\")) {
                        skipWhiteSpace();
                        int oldInd= colInd;
                        if (input.charAt(colInd)=='\\') {
                                colInd++;
                                 if (have(s.substring(1))) {
                                        retVal= true;
                                 } else {
                                        colInd= oldInd;
                                 }
                        }
                } else {
                        skipWhiteSpace();
                        String tempString;
                        if (input.length() - colInd >= s.length())  {
                                tempString= input.substring(colInd, colInd+s.length());
                                if (tempString.equalsIgnoreCase(s)) {
                                        colInd+= (s.length());
                                        retVal= true;
                                }
                        }
                }
                try {
                        if (isIdentifier(s) && (alphabetic() || numeric() || input.charAt(colInd)=='_')) {
                                colInd= OldInd;
                                retVal= false;
                        }
                } catch (StringIndexOutOfBoundsException e) {
                        ; // Yes nothing should be done!!!
                        // This error occured because the end of the string has been reached.
                }
                return retVal;
        }

        /** Tests whether the given string is a valid Vector Pascal identifier.
             @param s the string to test for
             @return - whether or not s is an identifier
        */
        public static boolean isIdentifier(String s)
        {
                boolean retVal= true;
                char currentChar;
                if (numeric(s.charAt(0))) {
                        retVal= false;
                }
                for (int i= 0; i<s.length(); i++)
                {
                        currentChar= s.charAt(i);
                        if (!(alphabetic(currentChar) || numeric(currentChar) || currentChar=='_')) {
                                retVal= false;
                        }
                }
                return retVal;
        }

        /** Tests if the given string is just space (i.e ' ' or '\t').
              @param s the String to look in.
              @return boolean - True if there is nothing but spaces or tabs in the string
        */
        public static boolean justSpace(String s)
        {
                boolean retVal= true;
                char currentChar;
                for (int i= 0; i< s.length(); i++)
                {
                        currentChar= s.charAt(i);
                        retVal= retVal & (currentChar==' ' || currentChar=='\t');
                }
                return retVal;
        }

        /** Skips the string s if it occurs at the current position (or after some space) in the 'input' string.
             Throws SyntaxError if the string wasn't found or if some longer identifier is found (c.f. 'public String have' above).
        **/
        public void mustBe(String s) throws SyntaxError
        {
                if (!have(s))
                        throw new SyntaxError();
        }

        /** Is character at colInd a numeric ('0'..'9')?
             @ return - whether current character is numeric.
        **/
        public boolean numeric()
        {
                return ((!end()) && numeric(input.charAt(colInd)));
        }

        /** is character 'ch' a numeric ('0'..'9')?
             @ return - whether ch is numeric.
        **/
        private static boolean numeric(char ch)
        {
                return (ch >= '0')  & (ch <= '9');
        }

        /** Skips everything up to the character ch and returns everything that was skipped.
             If the character wasn't found then null is returned.
             @param ch the character to skip to.
             @return String - everything that was skipped.
        **/
        public String skipTo(char ch)
        {
                int oldInd= colInd;
                while (!end() && (ch != input.charAt(colInd)))
                // Move colInd to the first occurance of ch (if any).
                {
                        colInd++;
                }
                if (end()) {
                // If there were no occurances
                        colInd=oldInd;
                        return null;
                } else {
                // If an occurance was found
                        return input.substring(oldInd, colInd);
                }
        }

        /** Skips everything up to the string s and returns everything that was skipped.
             @param s the String to skip to.
             @return String - everything that was skipped. If the String wasn't found then null is returned.
        **/
        public String skipTo(String s)
        {
                int oldInd= colInd;
                int slength= s.length();
                boolean found= false;
                while (colInd+slength<input.length()+1 && (!(found= s.equalsIgnoreCase(input.substring(colInd, colInd+slength)))))
                // Move colInd to the first occurance of ch (if any).
                {
                        colInd++;
                }
                if (!found) {
                // If there were no occurances
                        colInd=oldInd;
                        return null;
                } else {
                // If an occurance was found
                        return input.substring(oldInd, colInd);
                }
        }

        /** Skips everything up to the first occurance of any of the characters in chs and returns everything that was skipped.
             @param chs the characters to skip to (the first occurance of).
             @return String - everthing that was skipped.
        **/
        public String skipTo(char[] chs)
        {
                int tempInd, searchInd;
                char tempChar;
                boolean done= false;
                searchInd= colInd;
                String retVal;
                try {
                        tempChar= input.charAt(searchInd);
                        for (int i= 0; i< chs.length; i++) {
                                if (tempChar==chs[i]) {
                                        done= true;
                                }
                        }
                        while (!done)
                        {
                                searchInd++;
                                tempChar= input.charAt(searchInd);
                                for (int i= 0; i< chs.length; i++) {
                                        if (tempChar==chs[i]) {
                                                done= true;
                                        }
                                }
                        }
                        tempInd= colInd;
                        colInd= searchInd;
                        retVal= input.substring(tempInd, searchInd);
                        // Return whatever came before the first occurance of a character in chs.
                } catch (IndexOutOfBoundsException e) {
                // colInd remains unchanged, and null will be returned.
                        retVal= null;
                }
                return retVal;
        }

        /** Moves to the first occurance of 'separator' or to the end of the scope (which is recognised by '']' or '')'.
             Moves past any skopes that are nested within the current scope. Scopes are started by '(' or '[' and ended by ')' or ']'.
             Moves past any quotes in this scope.
             @param separator the character to stop at.
             @return String - the String that the lexer moved past. Return null if the 'separator' isn't found.
        **/
        public String skipTo_within_nonNestedScope (char separator)
        {
                int nestLevels= 0;
                boolean inQuote= false;
                int oldColInd= colInd;
                String retVal;
                try {
                        char currentChar= input.charAt(colInd);
                        while (!end() && nestLevels >= 0)
                        {
                                currentChar=input.charAt(colInd);
                                if (currentChar=='\'') {
                                        inQuote= !inQuote;
                                }
                                if (!inQuote) {
                                        if (currentChar=='(' || currentChar=='[')
                                                nestLevels++;
                                        if ((nestLevels== 0 && currentChar== separator) || currentChar==')' || currentChar==']')
                                                nestLevels--;
                                        if (nestLevels >= 0)
                                                colInd++;
                                }
                        }
                        if (end()) {
                                throw new IndexOutOfBoundsException();
                        }
                        return input.substring(oldColInd, colInd);
                } catch (IndexOutOfBoundsException e) {
                        retVal= null;
                        colInd= oldColInd;
                }
                return retVal;
        }

        /** Moves to the first occurance of 'separator' or to the end of the scope (which is recognised by '']' or '')'.
             Moves past any skopes that are nested within the current scope. Scopes are started by '(' or '[' and ended by ')' or ']'.
             Moves past any quotes in this scope.
             @param separator the character to stop at.
             @return String - the String that the lexer moved past. Return null if the 'separator' isn't found.
        **/
        public String skipTo_within_nonNestedScope (String separator)
        {
                int nestLevels= 0;
                int length= separator.length();
                boolean inQuote= false;
                int oldColInd= colInd;
                String retVal;
                try {
                        char currentChar= input.charAt(colInd);
                        while (!end() && nestLevels >= 0)
                        {
                                currentChar=input.charAt(colInd);
                                if (currentChar=='\'') {
                                        inQuote= !inQuote;
                                }
                                if (!inQuote) {
                                        if (currentChar=='(' || currentChar=='[')
                                                nestLevels++;
                                        if ((nestLevels== 0 && separator.equals(input.substring(colInd, colInd + length))) || currentChar==')' || currentChar==']')
                                                nestLevels--;
                                        if (nestLevels >= 0)
                                                colInd++;
                                }
                        }
                        if (end()) {
                                throw new IndexOutOfBoundsException();
                        }
                        return input.substring(oldColInd, colInd);
                } catch (IndexOutOfBoundsException e) {
                        retVal= null;
                        colInd= oldColInd;
                }
                return retVal;
        }

        /** Moves past an arbitrary-length sequence of spaces and tabs ' '.
        **/
        public void skipWhiteSpace()
        {
                while (!end() && (input.charAt(colInd)==' '  || input.charAt(colInd)=='\t'))
                {
                        colInd++;
                }
        }

        /** Returns the rest of the input String.
             @return - the rest of the input String.
        */
        public String theRest()
        {
                return input.substring(colInd, input.length());
        }

}