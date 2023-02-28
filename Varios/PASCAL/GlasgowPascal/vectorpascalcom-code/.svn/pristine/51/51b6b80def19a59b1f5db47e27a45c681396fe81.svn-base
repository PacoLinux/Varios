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

 C) Modified by W P Cockshott to handle grammar for ilcg
*/
package ilcg;
import ilcg.node.*;
import ilcg.lexer.*;
import ilcg.parser.*;
import ilcg.analysis.*;
import ilcg.tree.StreamGobbler;
import java.io.*;

public class Ilcg
{
    public static void main(String[] arguments)
    {
        if(arguments.length != 3)
            {
                System.out.println("usage:");
                System.out.println("java ilcg.Main sourcefile destfile destclass ");
                System.exit(1);
            }
        Parser parser;
        try
            {
                FileReader r=    new FileReader(arguments[0]);
                PushbackReader pr =  new PushbackReader(new BufferedReader(r), 1024)  ;
                Lexer lexer = new Lexer(pr);
                parser = new Parser(lexer);
                Node ast = parser.parse();
                try
                    {
                        ast.apply(new IlcgTreeWalkGenerator(arguments[1],arguments[2],"ilcg.tree"));
                        Runtime sys = Runtime.getRuntime();
                        Process p = sys.exec("astyle   --style=java "+arguments[1]);
                        // any error message?
                        StreamGobbler errorGobbler = new
                        StreamGobbler(p.getErrorStream(), "ERROR");
                        // any output?
                        StreamGobbler outputGobbler = new
                        StreamGobbler(p.getInputStream(), "OUTPUT");
                        // kick them off
                        errorGobbler.start();
                        outputGobbler.start();
                        if(p.waitFor() == 0)
                            {
                            }
                        else
                            {
                                System.out.println(" failed to run astyle on output, have you installed astyle?");
                            }
                    }
                catch(Exception c)
                    {
                        c.printStackTrace();
                        System.exit(-1);
                    }
            }
        catch(Exception e)
            {
                System.out.println(e);
                System.out.println("exit");
                System.exit(-1);
            }
        //ast.apply(new Interpreter());
    }
}

