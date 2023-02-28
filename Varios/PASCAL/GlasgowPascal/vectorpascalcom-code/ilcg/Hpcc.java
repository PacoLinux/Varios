package ilcg;
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * Copyright (C) 1997, 1998 Etienne Gagnon (gagnon@sable.mcgill.ca). *
 * All rights reserved.                                              *
 *                                                                   *
 * This work was done as a project of the Sable Research Group,      *
 * School of Computer Science, McGill University, Canada             *
 * (http://www.sable.mcgill.ca/).  It is understood that any         *
 * modification not identified as such is not covered by the         *
 * preceeding statement.                                             *
 *                                                                   *
 * This work is free software; you can redistribute it and/or        *
 * modify it under the terms of the GNU Library General Public       *
 * License as published by the Free Software Foundation; either      *
 * version 2 of the License, or (at your option) any later version.  *
 *                                                                   *
 * This work is distributed in the hope that it will be useful,      *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of    *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU *
 * Library General Public License for more details.                  *
 *                                                                   *
 * You should have received a copy of the GNU Library General Public *
 * License along with this library; if not, write to the             *
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,      *
 * Boston, MA  02111-1307, USA.                                      *
 *                                                                   *
 * To submit a bug report, send a comment, or get the latest news on *
 * this project and other Sable Research Group projects, please      *
 * visit the web site: http://www.sable.mcgill.ca/                   *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/*
 Change History
 --------------
 A) Notes:

 Please use the following template.  Most recent changes should
 appear at the top of the list.

 - Modified on [date (March 1, 1900)] by [name]. [(*) if appropriate]
   [description of modification].

 Any Modification flagged with "(*)" was done as a project of the
 Sable Research Group, School of Computer Science,
 McGill University, Canada (http://www.sable.mcgill.ca/).

 You should add your copyright, using the following template, at
 the top of this file, along with other copyrights.

 *                                                                   *
 * Modifications by [name] are                                       *
 * Copyright (C) [year(s)] [your name (or company)].  All rights     *
 * reserved.                                                         *
 *                                                                   *

 B) Changes:

 - Modified on June 7, 1998 by Etienne Gagnon (gagnon@sable.mcgill.ca). (*)
   Changed the license.
*/
import ca.mcgill.sable.simple.node.*;
import ca.mcgill.sable.simple.lexer.*;
import ca.mcgill.sable.simple.parser.*;
import ca.mcgill.sable.util.*;
import java.io.*;

public class Hpcc
{
    public static void main(String[] arguments)
    {
        if(arguments.length != 1)
            {
                System.out.println("usage:");
                System.out.println("  java Main filename");
                System.exit(1);
            }
        compile("", arguments[0]);
    }

    private static void compile(String dir, String name)
    {
        File f;
        if(dir.equals(""))
            {
                f = new File(name);
            }
        else
            {
                f = new File(dir, name);
            }
        if(f.isFile())
            {
                compile(f);
            }
        else
            {
                System.out.println("Error: " + f.getAbsolutePath() + " does not exist.");
            }
    }

    private static void compile(File file)
    {
        try
            {
                System.out.println();
                System.out.println("***************************************");
                System.out.println(file.getAbsolutePath());
                Lexer lexer = new Lexer(
                    new PushbackReader(
                        new BufferedReader(
                            new FileReader(file)), 1024));
                Parser parser = new Parser(lexer);
                Start ast = parser.parse();
                ast.apply(new ModifyAST());
                Declarations declarations = new Declarations(ast);
                PointsTo pto = new PointsTo(ast, declarations);
                System.out.println(pto);
            }
        catch(Exception e)
            {
                e.printStackTrace(System.out);
            }
    }
}
