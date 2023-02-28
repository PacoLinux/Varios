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

/** VpMathFont is used to highlight identifiers and keywords.
      It also has a linebreaker and a method to put pieces of Latex-code into mathsmode.
*/
public class VpMathFont {

        private static boolean highlightIdentifiers= true;

        /** Set whether or not identifiers should be highlighted.
                @param highlight Decides whether or not to highlight.
        */
        public static void highlightIdentifiers(boolean highlight)
        {
                highlightIdentifiers= highlight;
        }

        /** Check if identifiers are currently being highlighted.
                @return boolean - Whether identifiers are currently being highlighted.
        */
        public static boolean highlightIdentifiers()
        {
                return highlightIdentifiers;
        }

        /**  Stub that can be changed to break a line if explicit linebreaking is desired.
               Kept for extendability (if we decide to do line breaking in the future).
               Old version: public static String lineBreak= new String("}\\\\ \n \\>\\textsf{");
        */
        public static String lineBreak= new String("");

        /** Returns the string s in keyword format.
             @param  s the string to format.
             @return String - the formatted String.
        */
        public static String KeyWord(String s)
        {
                return "\\textbf{" + s+"}";
        }

        /** Returns the string s in identifier format.
             @param  s the string to format.
             @return String - the formatted String.
        */
        public static String Identifier(String s)
        {
                if (highlightIdentifiers) {
                        return "\\textit{" + s+"}";
                } else {
                        return s;
                }
        }

        /** Returns the latex mathsmode version of s.
             @param  s the string to format.
             @return String - the formatted String.
        */
        public static String mathTexify(String s)
        {
                return ("$\\"+s+"$");
        }

}