// Title:        Vector Pascal compiler
/*
 *  / Version
 *  / Copyright:    Copyright (c) 1999
 *  / Author:       Paul Cockshott
 *  / Company:
 *  / Description:  Vector Pascal compiler in java
 *
 *  GNU GENERAL PUBLIC LICENSE
 *  Version 2, June 1991
 *  Copyright (C) 1989, 1991 Free Software Foundation, Inc.
 *  675 Mass Ave, Cambridge, MA 02139, USA
 *  Everyone is permitted to copy and distribute verbatim copi
 *  of this license document, but changing it is not allowed.
 *  Preamble
 *  The licenses for most software are designed to take away your
 *  freedom to share and change it.  By contrast, the GNU General Public
 *  License is intended to guarantee your freedom to share and change free
 *  software--to make sure the software is free for all its users.  This
 *  General Public License applies to most of the Free Software
 *  Foundation's software and to any other program whose authors commit to
 *  using it.  (Some other Free Software Foundation software is covered by
 *  the GNU Library General Public License instead.)  You can apply it to
 *  your programs, too.
 *  When we speak of free software, we are referring to freedom, not
 *  price.  Our General Public Licenses are designed to make sure that you
 *  have the freedom to distribute copies of free software (and charge for
 *  this service if you wish), that you receive source code or can get it
 *  if you want it, that you can change the software or use pieces of it
 *  in new free programs; and that you know you can do these things.
 *  To protect your rights, we need to make restrictions that forbid
 *  anyone to deny you these rights or to ask you to surrender the rights.
 *  These restrictions translate to certain responsibilities for you if you
 *  distribute copies of the software, or if you modify it.
 *  For example, if you distribute copies of such a program, whether
 *  gratis or for a fee, you must give the recipients all the rights that
 *  you have.  You must make sure that they, too, receive or can get the
 *  source code.  And you must show them these terms so they know their
 *  rights.
 *  We protect your rights with two steps: (1) copyright the software, and
 *  (2) offer you this license which gives you legal permission to copy,
 *  distribute and/or modify the software.
 *  Also, for each author's protection and ours, we want to make certain
 *  that everyone understands that there is no warranty for this free
 *  software.  If the software is modified by someone else and passed on, we
 *  want its recipients to know that what they have is not the original, so
 *  that any problems introduced by others will not reflect on the original
 *  authors' reputations.
 *  Finally, any free program is threatened constantly by software
 *  patents.  We wish to avoid the danger that redistributors of a free
 *  program will individually obtain patent licenses, in effect making the
 *  program proprietary.  To prevent this, we have made it clear that any
 *  patent must be licensed for everyone's free use or not licensed at all.
 *  The precise terms and conditions for copying, distribution and
 *  modification follow.
 *  GNU GENERAL PUBLIC LICENSE
 *  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
 *  0. This License applies to any program or other work which contains
 *  a notice placed by the copyright holder saying it may be distributed
 *  under the terms of this General Public License.  The "Program", below,
 *  refers to any such program or work, and a "work based on the Program"
 *  means either the Program or any derivative work under copyright law:
 *  that is to say, a work containing the Program or a portion of it,
 *  either verbatim or with modifications and/or translated into another
 *  language.  (Hereinafter, translation is included without limitation in
 *  the term "modification".)  Each licensee is addressed as "you".
 *  Activities other than copying, distribution and modification are not
 *  covered by this License; they are outside its scope.  The act of
 *  running the Program is not restricted, and the output from the Program
 *  is covered only if its contents constitute a work based on the
 *  Program (independent of having been made by running the Program).
 *  Whether that is true depends on what the Program does.
 *  1. You may copy and distribute verbatim copies of the Program's
 *  source code as you receive it, in any medium, provided that you
 *  conspicuously and appropriately publish on each copy an appropriate
 *  copyright notice and disclaimer of warranty; keep intact all the
 *  notices that refer to this License and to the absence of any warranty;
 *  and give any other recipients of the Program a copy of this License
 *  along with the Program.
 *  You may charge a fee for the physical act of transferring a copy, and
 *  you may at your option offer warranty protection in exchange for a fee.
 *  2. You may modify your copy or copies of the Program or any portion
 *  of it, thus forming a work based on the Program, and copy and
 *  distribute such modifications or work under the terms of Section 1
 *  above, provided that you also meet all of these conditions:
 *  a) You must cause the modified files to carry prominent notices
 *  stating that you changed the files and the date of any change.
 *  b) You must cause any work that you distribute or publish, that in
 *  whole or in part contains or is derived from the Program or any
 *  part thereof, to be licensed as a whole at no charge to all third
 *  parties under the terms of this License.
 *  c) If the modified program normally reads commands interactively
 *  when run, you must cause it, when started running for such
 *  interactive use in the most ordinary way, to print or display an
 *  announcement including an appropriate copyright notice and a
 *  notice that there is no warranty (or else, saying that you provide
 *  a warranty) and that users may redistribute the program under
 *  these conditions, and telling the user how to view a copy of this
 *  License.  (Exception: if the Program itself is interactive but
 *  does not normally print such an announcement, your work based on
 *  the Program is not required to print an announcement.)
 *  These requirements apply to the modified work as a whole.  If
 *  identifiable sections of that work are not derived from the Program,
 *  and can be reasonably considered independent and separate works in
 *  themselves, then this License, and its terms, do not apply to those
 *  sections when you distribute them as separate works.  But when you
 *  distribute the same sections as part of a whole which is a work based
 *  on the Program, the distribution of the whole must be on the terms of
 *  this License, whose permissions for other licensees extend to the
 *  entire whole, and thus to each and every part regardless of who wrote it.
 *  Thus, it is not the intent of this section to claim rights or contest
 *  your rights to work written entirely by you; rather, the intent is to
 *  exercise the right to control the distribution of derivative or
 *  collective works based on the Program.
 *  In addition, mere aggregation of another work not based on the Program
 *  with the Program (or with a work based on the Program) on a volume of
 *  a storage or distribution medium does not bring the other work under
 *  the scope of this License.
 *  3. You may copy and distribute the Program (or a work based on it,
 *  under Section 2) in object code or executable form under the terms of
 *  Sections 1 and 2 above provided that you also do one of the following:
 *  a) Accompany it with the complete corresponding machine-readable
 *  source code, which must be distributed under the terms of Sections
 *  1 and 2 above on a medium customarily used for software interchange; or,
 *  b) Accompany it with a written offer, valid for at least three
 *  years, to give any third party, for a charge no more than your
 *  cost of physically performing source distribution, a complete
 *  machine-readable copy of the corresponding source code, to be
 *  distributed under the terms of Sections 1 and 2 above on a medium
 *  customarily used for software interchange; or,
 *  c) Accompany it with the information you received as to the offer
 *  to distribute corresponding source code.  (This alternative is
 *  allowed only for noncommercial distribution and only if you
 *  received the program in object code or executable form with such
 *  an offer, in accord with Subsection b above.)
 *  The source code for a work means the preferred form of the work for
 *  making modifications to it.  For an executable work, complete source
 *  code means all the source code for all modules it contains, plus any
 *  associated interface definition files, plus the scripts used to
 *  control compilation and installation of the executable.  However, as a
 *  special exception, the source code distributed need not include
 *  anything that is normally distributed (in either source or binary
 *  form) with the major components (compiler, kernel, and so on) of the
 *  operating system on which the executable runs, unless that component
 *  itself accompanies the executable.
 *  If distribution of executable or object code is made by offering
 *  access to copy from a designated place, then offering equivalent
 *  access to copy the source code from the same place counts as
 *  distribution of the source code, even though third parties are not
 *  compelled to copy the source along with the object code.
 *  4. You may not copy, modify, sublicense, or distribute the Program
 *  except as expressly provided under this License.  Any attempt
 *  otherwise to copy, modify, sublicense or distribute the Program is
 *  void, and will automatically terminate your rights under this License.
 *  However, parties who have received copies, or rights, from you under
 *  this License will not have their licenses terminated so long as such
 *  parties remain in full compliance.
 *  5. You are not required to accept this License, since you have not
 *  signed it.  However, nothing else grants you permission to modify or
 *  distribute the Program or its derivative works.  These actions are
 *  prohibited by law if you do not accept this License.  Therefore, by
 *  modifying or distributing the Program (or any work based on the
 *  Program), you indicate your acceptance of this License to do so, and
 *  all its terms and conditions for copying, distributing or modifying
 *  the Program or works based on it.
 *  6. Each time you redistribute the Program (or any work based on the
 *  Program), the recipient automatically receives a license from the
 *  original licensor to copy, distribute or modify the Program subject to
 *  these terms and conditions.  You may not impose any further
 *  restrictions on the recipients' exercise of the rights granted herein.
 *  You are not responsible for enforcing compliance by third parties to
 *  this License.
 *  7. If, as a consequence of a court judgment or allegation of patent
 *  infringement or for any other reason (not limited to patent issues),
 *  conditions are imposed on you (whether by court order, agreement or
 *  otherwise) that contradict the conditions of this License, they do not
 *  excuse you from the conditions of this License.  If you cannot
 *  distribute so as to satisfy simultaneously your obligations under this
 *  License and any other pertinent obligations, then as a consequence you
 *  may not distribute the Program at all.  For example, if a patent
 *  license would not permit royalty-free redistribution of the Program by
 *  all those who receive copies directly or indirectly through you, then
 *  the only way you could satisfy both it and this License would be to
 *  refrain entirely from distribution of the Program.
 *  If any portion of this section is held invalid or unenforceable under
 *  any particular circumstance, the balance of the section is intended to
 *  apply and the section as a whole is intended to apply in other
 *  circumstances.
 *  It is not the purpose of this section to induce you to infringe any
 *  patents or other property right claims or to contest validity of any
 *  such claims; this section has the sole purpose of protecting the
 *  integrity of the free software distribution system, which is
 *  implemented by public license practices.  Many people have made
 *  generous contributions to the wide range of software distributed
 *  through that system in reliance on consistent application of that
 *  system; it is up to the author/donor to decide if he or she is willing
 *  to distribute software through any other system and a licensee cannot
 *  impose that choice.
 *  This section is intended to make thoroughly clear what is believed to
 *  be a consequence of the rest of this License.
 *  8. If the distribution and/or use of the Program is restricted in
 *  certain countries either by patents or by copyrighted interfaces, the
 *  original copyright holder who places the Program under this License
 *  may add an explicit geographical distribution limitation excluding
 *  those countries, so that distribution is permitted only in or among
 *  countries not thus excluded.  In such case, this License incorporates
 *  the limitation as if written in the body of this License.
 *  9. The Free Software Foundation may publish revised and/or new versions
 *  of the General Public License from time to time.  Such new versions will
 *  be similar in spirit to the present version, but may differ in detail to
 *  address new problems or concerns.
 *  Each version is given a distinguishing version number.  If the Program
 *  specifies a version number of this License which applies to it and "any
 *  later version", you have the option of following the terms and conditions
 *  either of that version or of any later version published by the Free
 *  Software Foundation.  If the Program does not specify a version number of
 *  this License, you may choose any version ever published by the Free Software
 *  Foundation.
 *  10. If you wish to incorporate parts of the Program into other free
 *  programs whose distribution conditions are different, write to the author
 *  to ask for permission.  For software which is copyrighted by the Free
 *  Software Foundation, write to the Free Software Foundation; we sometimes
 *  make exceptions for this.  Our decision will be guided by the two goals
 *  of preserving the free status of all derivatives of our free software and
 *  of promoting the sharing and reuse of software generally.
 *  NO WARRANTY
 *  11. BECAUSE THE PROGRAM IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
 *  FOR THE PROGRAM, TO THE EXTENT PERMITTED BY APPLICABLE LAW.  EXCEPT WHEN
 *  OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
 *  PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED
 *  OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS
 *  TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH YOU.  SHOULD THE
 *  PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY SERVICING,
 *  REPAIR OR CORRECTION.
 *  12. IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
 *  WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
 *  REDISTRIBUTE THE PROGRAM AS PERMITTED ABOVE, BE LIABLE TO YOU FOR DAMAGES,
 *  INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES ARISING
 *  OUT OF THE USE OR INABILITY TO USE THE PROGRAM (INCLUDING BUT NOT LIMITED
 *  TO LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY
 *  YOU OR THIRD PARTIES OR A FAILURE OF THE PROGRAM TO OPERATE WITH ANY OTHER
 *  PROGRAMS), EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE
 *  POSSIBILITY OF SUCH DAMAGES.
 *  END OF TERMS AND CONDITIONS
 *  Appendix: How to Apply These Terms to Your New Programs
 *  If you develop a new program, and you want it to be of the greatest
 *  possible use to the public, the best way to achieve this is to make it
 *  free software which everyone can redistribute and change under these terms.
 *  To do so, attach the following notices to the program.  It is safest
 *  to attach them to the start of each source file to most effectively
 *  convey the exclusion of warranty; and each file should have at least
 *  the "copyright" line and a pointer to where the full notice is found.
 *  <one line to give the program's name and a brief idea of what it does.>
 *  Copyright (C) 19yy  <name of author>
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 *  Also add information on how to contact you by electronic and paper mail.
 *  If the program is interactive, make it output a short notice like this
 *  when it starts in an interactive mode:
 *  Gnomovision version 69, Copyright (C) 19yy name of author
 *  Gnomovision comes with ABSOLUTELY NO WARRANTY; for details type `show w'.
 *  This is free software, and you are welcome to redistribute it
 *  under certain conditions; type `show c' for details.
 *  The hypothetical commands `show w' and `show c' should show the appropriate
 *  parts of the General Public License.  Of course, the commands you use may
 *  be called something other than `show w' and `show c'; they could even be
 *  mouse-clicks or menu items--whatever suits your program.
 *  This General Public License does not permit incorporating your program into
 *  proprietary programs.  If your program is a subroutine library, you may
 *  consider it more useful to permit linking proprietary applications with the
 *  library.  If this is what you want to do, use the GNU Library General
 *  Public License instead of this License.
 *  Updates
 *  24.05.07  Optimises \+ reduction and vector dot product to parallelise even dynamic arrays using
 *  new code generating function 'parallelsum' approximately doubles speed on a P4 using
 *  double precision
 *  21.08.03  Put loop invariant code movement into reduction loops
 *  10.03.03  Support for dot product operator "." with parallelised version of the
 *  vector dot product and sequential version of matrix dot product
 *  06.03.03  Check is now made for data hazards in parallel assignment statements.
 *  04.03.03  Replicate now plants constants in data segment
 *  03.03.03  Update to handle singular loops more efficiently and not to save the
 *  upper bound of the for loop or an array expression in a temp if that is not needed
 *  27.02.03  Update array type to ensure that construct \+ v[0..x] works where x is a variable,
 *  the problem was that the array descriptor for the slice was not initialised.
 *  until entry to the loop, but the loop count was initialised from this descriptor
 *  I got round it by causing the class ArrayType to remember the symbolic indices
 *  used to form subranges and thus return ^(x) as the upper bound in this case
 *  instead of returning a reference to one of the words of the descriptor.
 *  12.11.02  Fix method of computing array bounds for reductions to allow indices to be permuted
 *  between the reduction operator itself and the array being reduced. This involved declaring
 *  a pair of hash tables reductionLwb and reductionUpb in which the lower and upper bounds
 *  of all indices used in subscriptions are stored keyed on the indexing variable. This can
 *  be used to determine the size of the dimension being indexed once it has  been used to
 *  subscript an array, even if it is not the last index.
 *  08.11.02  Fix bug in array types which caused sub array value parameters to be passed wrongly
 *  this involved setting the type field in the array to the standard Pentium codegen representaion
 *  which might cause problems on machines with 64 bit pointers later.
 *  The problem is that the class ArrayType does not know what the current code generator is.
 *  10.10.02  Allow utf8 input streams
 *  09.10.02  Put in support for generic sets
 *  08.10.02  Fix bug in adjust lexical level
 *  07.10.02  Allow ISO syntax string type declarations
 *  16.09.02  Allow -T flag on command line to train .vwu file and look for .vwu file in rtl dir as well as in current dir
 *  6.09.02    Allow paramterised units in use list
 *  14.06.02  Ensure that pointer types are returned in registers
 *  05,06.02  Add 'smart' code generation, ie, serialise the code generator
 *  to a zipped file and read it back in at startup, this ensures
 *  that any code generation idioms learned the last time are
 *  retained.
 *  21.05.02  Fix checking type after pointer deref to make sure it explicitly
 *  dereferences the type
 *  16.05.02  Optimise automatic loops over multidimensional arrays to remove
 *  loop invariant code to do with array access out of the inner loop
 *  30.04.02  Implement linkage to VPtex
 *  29.04.02  Implement record file i/o
 *  18.04.02  Implement set comparison and symetric difference
 *  17.04.02  Remove bug associated with type of set components when
 *  doing an in operation, previously defined to be the same
 *  as a boolean, now  uint8
 *  17.04.02  Remove bug which declared procedure name as a return variable
 *  in contexts other than function context
 *  16.04.02  Fix bugs in code for multiple levels of pointer dereference
 *  16.04.02  Fix a bug in forcetypecompatibility which caused infinite recursion
 *  on recursive data types. Bug caused by not resolving pointer type names
 *  to the actual record types they pointed at
 *  16.04.02  Put full path name of the macros.asm file into the include calls
 *  16.04.02  Allow generic units
 *  15.04.02  Allow fully qualified names for identifiers in units
 *  11.04.02  Make POW compute the dimension of its real result and optimise POW 2 and POW -1
 *  10.04.02  Make procedures check the dimensions of real parameters
 *  09.04.02  Fix bug in triggering printordinal.
 *  09.04.02  Fix bug in writing booleans, these need to be a special case not
 *  a standard ordinal
 *  09.04.02  Fix bug in format of constant arrays of strings
 *  09.04.02  Fix bug in comparision of unequal string types
 *  21.3.02   Fix bug associated with prestatements being deleted when code is vectorised
 *  10.3.02   Support predeclared input and output files
 *  10.3.02   Support otherwise or else alternative in case statement
 *  10.3.02   Support parameters to programs, they are just ignored at present
 *  08.3.02   Support protected parameters, check assignment but not parameter passing
 *  08.3.02   Prohibit assignment to const locations
 *  06.3.02   Support writebyte
 *  04.3.02   Allow coercions to be declared
 *  04.3.02   Allow array input to read and readln
 *  1.3. 02   Allow arrays to be passed to write and writeln
 *  20.2.02   Allow exit to return value from a function
 *  20.2.02   Allow cdecl as a procedure modifier
 *  20.2.02   Allow external references to variables in c programs following free pascal syntax
 *  20.2.02	  Allows scalar subranges for array indices
 *  18.2.02   support for vectorisation of reduction operations
 *  16.2.02   improve the handling of reduction to cache interation variable and to execute + reduction
 *  with total on the left not the right which leads to faster code
 *  11.1.02   make sure that all index varaibles used in evaluating bounds fault conditions are extended to
 *  be integers, otherwise we can get attempts to compare integers with bytes
 *  11.1.02   fix resolution of forward declared pointer types in forcederef
 *  11.1.02   allow enumeration labels in case switches
 *  11.1.02   fixed failure to declare tag field in variant records
 */
package ilcg.Pascal;

import java.io.*;
import java.util.*;
import java.util.zip.*;

import VPTeX.vPTeX;
import VPTeX.PascalFile;
import ilcg.tree.*;

import ilcg.SymbolTable;
import ilcg.SyntaxError;

// At run time a file is an integer file handle

/**
 *  classes used in the compiler
 *
 *@author     wpc
 *@created    June 21, 2001
 */

class PascalProgram extends Statement {

    /**
     *  Constructor for the PascalProgram object
     *
     *@param  n  Description of Parameter
     *@param  s  Description of Parameter
     */
    PascalProgram(Node n, Statement s) {
        super(n, s);
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class TypeTag extends Cast implements Serializable {


    Type  thistype;


    /**
     *  Constructor for the TypeTag object
     *
     *@param  v  Value to be typed
     *@param  t  type to which it is tagged
     */
    public TypeTag(Node v, Type t) {
        super(t.returnType(), decast(v));
        thistype = t;
        String  vt  = v.returnType();
        if(t instanceof ScalarRange && !vt.startsWith("ref")) {
            checktype();
        }
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval() {
        Node  tree  = super.eval();
        if(thistype.type.equals(ieee32) || thistype.type.equals(ieee64)) {
            if(tree instanceof Real) {
                return tree;
            }
        }
        else if(tree instanceof CharLit) {
            TypeTag t3= new TypeTag(tree, thistype);
            t3.setAnnotation(getAnnotation());
            return t3;
        }
        if(tree.returnType().equals(Node.int32)
                && thistype.type.equals(Node.int32)) {
            return tree;
        }
        if(tree.returnType().equals(Node.int64)
                && thistype.type.equals(Node.int64)) {
            return tree;
        }
        if(tree.returnType().equals(Node.uint32)
                && thistype.type.equals(Node.uint32)) {
            return tree;
        }
        TypeTag t2= new TypeTag(tree, thistype);
        t2.setAnnotation(getAnnotation());
        return t2;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String returnType() {
        // if(thistype.type.startsWith("ref ref")) return "ref int32";
        return thistype.type;
    }


    /**
     *  Description of the Method
     *
     *@param  v  Description of the Parameter
     *@return    Description of the Returned Value
     */
    // public String toString() {
    // return "(" + thistype + ")" + getSubtree();
    // }

    /**
     *  Description of the Method
     *
     *@param  v  Description of Parameter
     *@return    Description of the Returned Value
     */
    static Node decast(Node v) {
        if(v instanceof Cast) {
            return decast(((Cast) v).getSubtree());
        }
        return v;
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    27 July 2001
 */
class SchemaField extends Field implements Serializable {


    /**
     *  takes on the value 0 for a lower bound 1 for an upper bound
     */
    public int bound;

    /**
     *  takes on the value 0 for the first dimension 1, for the next etc
     */
    public int dimension;
    /**
     *  Description of the Field
     */
    public int usage = 0;


    /**
     *  Constructor for the Field object
     *
     *@param  t   Description of Parameter
     *@param  id  Description of Parameter
     */
    public SchemaField(Type t, String id) {
        name = id;
        fieldType = t;
        validatetype();
    }
}
/** A FieldType is like an array but allows real valued indices and
 * interpolates between given points in the array to return these.
 * It is introduced because it is now possible to implement this
 * efficiently using GPUs
 * */

class FieldType extends ArrayType implements Serializable {
    FieldType(long[][] bounds,ilcg.tree.Type t,int i) {
        super(bounds,t,i);
    }
}
/**
 *  Holds information about record fields
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class Field implements Serializable {


    int         offset;
    Type        fieldType;
    RecordType  recordType;
    String      name;


    /**
     *  Constructor for the Field object
     */
    public Field() {
        offset = 0;
    }


    /**
     *  Constructor for the Field object
     *
     *@param  id  Description of Parameter
     */
    public Field(String id) {
        name = id;
    }


    /**
     *  Constructor for the Field object
     *
     *@param  offs  Description of Parameter
     *@param  t     Description of Parameter
     *@param  id    Description of Parameter
     */
    public Field(int offs, Type t, String id) {
        name = id;
        fieldType = t;
        offset = offs;
        validatetype();
    }


    /**
     *  Sets the type attribute of the Field object
     *
     *@param  t  The new type value
     */
    public void setType(Type t) {
        fieldType = t;
        validatetype();
    }


    /**
     *  Sets the recordType attribute of the Field object
     *
     *@param  r  The new recordType value
     */
    public void setRecordType(RecordType r) {
        recordType = r;
    }


    /**
     *  Sets the offset attribute of the Field object
     *
     *@param  off  The new offset value
     */
    public void setOffset(int off) {
        offset = off;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return name + ":" + ((Ref) fieldType).pointsTo;
    }


    /**
     *  Description of the Method
     */
    void validatetype() {
        if((!(fieldType instanceof Ref)) || (fieldType instanceof Pointer)) {
            fieldType = new Ref(fieldType);
        }
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class LiteralVector extends Cartesian implements Serializable {


    Type    elems;

    String  returns;
    String  stringval;

    /**
     *  args pushed left to right, callee pops args
     */
    public final static int PascalCall = 0;

    /**
     *  args pushed right to left caller pops args
     */
    public final static int CCall = 1;


    /**
     *  Constructor for the LiteralVector object
     *
     *@param  v  Description of Parameter
     *@param  t  Description of Parameter
     */
    LiteralVector(Vector v, Type t) {
        super(v);
        elems = t;
        returns = t.returnType() + " vector ( " + v.size() + " )";
        stringval = "";
        int  n  = argc();
        Walker w= new PentiumCG();
        for(int i = 0; i < n; i++) {
            Node  N  = (Node) v.elementAt(i);
            stringval = stringval +w.decast(N);
            if(i < n - 1) {
                stringval = stringval + ",";
            }
        }
        stringval = stringval + "";
    }


    /**
     *  writes: params count codeForCartesian
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException {
        int  len  = argc();
        for(int i = 0; i < len; i++) {
            ((Node) argi(i)).toBinary(out);
        }
        (new Int(len)).toBinary(out);
        out.writeByte(codeForCartesian);
    }


    /**
     *  returns whatever the function called returns
     *
     *@return    Description of the Returned Value
     */
    public String returnType() {
        return returns;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public Node eval() {
        return this;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public boolean knownAtCompileTime() {
        return true;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return stringval;
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class ForwardProc extends

    Procedure implements Serializable {

    int vmtIndex= -1; // takes value >=0 for methods
    Object vmtDynamicIndex = null; // takes on a value for dynamic methods
    /**
     *  Constructor for the ForwardProc object
     *
     *@param  args     Description of Parameter
     *@param  returns  Description of Parameter
     */
    public ForwardProc(String args, String returns) {
        paramtype = args;
        returntype = returns;
    }
    public ForwardProc(String args, String returns,String name) {
        paramtype = args;
        returntype = returns;
        start = new Label(name+new Label());
    }
}

/**
 *  Used to indicate what dimensions a number has
 *
 *@author     wpc
 *@created    June 21, 2001
 */
interface Dimensioned {


    /**
     *  gives the dimension resulting from the multiple of two dimensioned
     *  quantities
     *
     *@param  d                   Description of Parameter
     *@return                     Description of the Returned Value
     *@exception  DimensionError  Description of Exception
     */
    Dimensioned multiplyby(Dimensioned d) throws DimensionError;


    /**
     *  gives the dimensions resulting from the division of two dimensioned
     *  quantities
     *
     *@param  d                   Description of Parameter
     *@return                     Description of the Returned Value
     *@exception  DimensionError  Description of Exception
     */
    Dimensioned divideby(Dimensioned d) throws DimensionError;


    /**
     *  returns the basis type of the dimension system
     *
     *@return    Description of the Returned Value
     */
    OrdinalType basis();


    /**
     *  returns true if two dimensions are equivalent
     *
     *@param  d  Description of Parameter
     *@return    Description of the Returned Value
     */
    boolean dimensionallyEquivalent(Dimensioned d);


    /**
     *  returns true if two types share the same dimensional basis space
     *
     *@param  d  Description of Parameter
     *@return    Description of the Returned Value
     */
    boolean basisEquivalent(Dimensioned d);


    /**
     *  Gets the scalar attribute of the Dimensioned object
     *
     *@return    The scalar value
     */
    boolean isScalar();


    /**
     *  Description of the Method
     *
     *@param  dimension  Description of Parameter
     *@return            Description of the Returned Value
     */
    int power(int dimension);
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class RealType extends SimpleType implements Dimensioned,Serializable {


    private  OrdinalType  basisSpace  = null;
    private  int[]        dimensions  = {0};


    /**
     *  Constructor for the RealType object
     *
     *@param  representation  Description of Parameter
     *@param  Size            Description of Parameter
     */
    RealType(String representation, int Size) {
        super(representation, Size);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String toString() {
        String  name  = type;
        if(basisSpace != null) {
            name = name + " of " + basisSpace + "[";
            for(int i = 0; i < dimensions.length; i++) {
                name = name + dimensions[i] + " ";
            }
            name = name + "]";
        }
        return name;
    }


    /**
     *  Constructor for the RealType object
     *
     *@param  representation  Description of Parameter
     *@param  Size            Description of Parameter
     *@param  base            Description of Parameter
     *@param  powers          Description of Parameter
     */
    RealType(String representation, int Size, OrdinalType base, int[] powers) {
        super(representation, Size);
        basisSpace = base;
        dimensions = powers;
    }


    /**
     *  Gets the scalar attribute of the RealType object
     *
     *@return    The scalar value
     */
    public boolean isScalar() {
        if(basisSpace == null) {
            return true;
        }
        for(int i = 0; i < dimensions.length; i++) {
            if(dimensions[i] != 0) {
                return false;
            }
        }
        return true;
    }


    /**
     *  Description of the Method
     *
     *@param  d  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean dimensionallyEquivalent(Dimensioned d) {
        if(isScalar()) {
            return d.isScalar();
        }
        if(!basis().equals(d.basis())) {
            return false;
        }
        for(int i = 0; i < dimensions.length; i++) {
            if(!(d.power(i) == power(i))) {
                return false;
            }
            // System.out.println("dim equ?"+power(i)+" "+d.power(i));
        }
        return true;
    }


    /**
     *  Description of the Method
     *
     *@param  d  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean basisEquivalent(Dimensioned d) {
        if(isScalar()) {
            return d.isScalar();
        }
        if(!basis().equals(d.basis())) {
            return false;
        }
        return true;
    }


    /**
     *  Description of the Method
     *
     *@param  dimension  Description of Parameter
     *@return            Description of the Returned Value
     */
    public int power(int dimension) {
        return dimensions[dimension];
    }


    /**
     *  Description of the Method
     *
     *@param  d                   Description of Parameter
     *@return                     Description of the Returned Value
     *@exception  DimensionError  Description of Exception
     */
    public Dimensioned divideby(Dimensioned d) throws DimensionError {
        int    i;
        if(d.isScalar()) {
            return this;
        }
        if(!basisEquivalent(d) && !isScalar()) {
            throw new DimensionError(toString()
                                     + " dimensionally incompatible with " + d);
        }
        int    l   = dimensions.length;
        if(isScalar()) {
            l = ((RealType) d).dimensions.length;
        }
        int[]  nd  = new int[l];
        for(i = 0; i < l; i++) {
            nd[i] = (isScalar() ? 0 : power(i)) - d.power(i);
        }
        return new RealType(type, size, d.basis(), nd);
    }


    /**
     *  Description of the Method
     *
     *@param  d                   Description of Parameter
     *@return                     Description of the Returned Value
     *@exception  DimensionError  Description of Exception
     */
    public Dimensioned multiplyby(Dimensioned d) throws DimensionError {
        int    i;
        if(isScalar()) {
            return d;
        }
        if(d.isScalar()) {
            return this;
        }
        if(!basisEquivalent(d)) {
            throw new DimensionError(toString()
                                     + " dimensionally incompatible with " + d);
        }
        int[]  nd  = new int[dimensions.length];
        for(i = 0; i < dimensions.length; i++) {
            nd[i] = power(i) + d.power(i);
        }
        return new RealType(type, size, basis(), nd);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public OrdinalType basis() {
        return basisSpace;
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class ObsConstOf extends Type implements Serializable {


    /**
     *  Description of the Field
     */
    public Type of;
    int  value;


    /**
     *  Constructor for the ConstOf object
     *
     *@param  o    Description of Parameter
     *@param  val  Description of Parameter
     */
    ObsConstOf(Type o, int val) {
        of = o;
        value = val;
        type = of.type;
    }


    /**
     *  Description of the Method
     *
     *@param  p  Description of Parameter
     *@return    Description of the Returned Value
     */
    public long sizeOf(Walker p) {
        return of.sizeOf(p);
    }


    /**
     *  Description of the Method
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Type t) {
        if(t instanceof ObsConstOf) {
            return ((ObsConstOf) t).of.equals(of)
                   & ((ObsConstOf) t).value == value;
        }
        else {
            return of.equals(t);
        }
    }


    /**
     *  A method that is used by an examiner to visit all locations. This must call
     *  examine on all its subtrees if e.visit(this) is true.
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e) {
    }


    /**
     *  A method that must beinstantiated allowing a TreeModifier to substitute
     *  values into the tree. if e.visit(this) is false the method should return
     *  this.
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m) {
        return this;
    }


    /**
     *  Description of the Method
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class Ref extends Type implements Serializable {


    Type  pointsTo;


    /**
     *  Constructor for the Ref object
     */
    Ref() { }


    /**
     *  Constructor for the Ref object
     *
     *@param  t  Description of Parameter
     */
    Ref(Type t) {
        pointsTo = t;
        type = "ref " + t.type;
    }


    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
    }


    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public int alignment(Walker processor) {
        return (int) sizeOf(processor);
    }


    /**
     *  Description of the Method
     *
     *@param  t  Description of Parameter
     *@return    Description of the Returned Value
     */
    public boolean equals(Type t) {
        return (t instanceof Ref) && ((Ref) t).pointsTo.equals(pointsTo);
    }


    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public String codeGenRepresentation(Walker processor) {
        return "ref " + pointsTo.codeGenRepresentation(processor);
    }


    /**
     *  A method that is used by an examiner to visit all locations. This must call
     *  examine on all its subtrees if e.visit(this) is true.
     *
     *@param  e  Description of Parameter
     */
    public void examine(TreeExaminer e) {
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return "ref " + pointsTo;
    }


    /**
     *  A method that must beinstantiated allowing a TreeModifier to substitute
     *  values into the tree. if e.visit(this) is false the method should return
     *  this.
     *
     *@param  m  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node modify(TreeModifier m) {
        return this;
    }


    /**
     *  Description of the Method
     *
     *@param  out              Description of Parameter
     *@exception  IOException  Description of Exception
     */
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class Pointer extends Ref implements Serializable {


    Walker  cpu;


    /**
     *  Constructor for the Pointer object
     *
     *@param  t          Description of Parameter
     *@param  processor  Description of the Parameter
     */
    Pointer(Type t, Walker processor) {
        super(t);
        cpu = processor;
        // type="^"+t.type;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String returnType() {
        return codeGenRepresentation(cpu);
    }


    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public String codeGenRepresentation(Walker processor) {
        return processor.getAddressType();
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return "^" + pointsTo;
    }


    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class PointerToNamedType extends SimpleType implements Serializable {


    String  typename;


    /**
     *  Description of the Method
     *
     *@param  t  Description of the Parameter
     *@return    Description of the Return Value
     */
    public boolean equals(Type t) {
        // System.out.println("is "+this+"="+t);
        return t.toString().equals(toString());
    }


    /**
     *  Constructor for the PointerToNamedType object
     *
     *@param  name       Description of Parameter
     *@param  processor  Description of the Parameter
     */
    PointerToNamedType(String name, Walker processor) {
        typename = name;
        type = processor.getAddressType();
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return "^" + typename;
    }


    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public String codeGenRepresentation(Walker processor) {
        return processor.getAddressType();
    }


    // public String toString(){return "^"+pointsTo;}

    /**
     *  Description of the Method
     *
     *@param  processor  Description of Parameter
     *@return            Description of the Returned Value
     */
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
    }

}

/**
 *  Associates a pascal return type with an operator
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class TOP extends Op implements Serializable {


    Type  Returns;
    Op    oper;


    /**
     *  Constructor for the TOP object
     *
     *@param  o  Description of Parameter
     *@param  t  Description of Parameter
     */
    TOP(Op o, Type t) {
        super(o.Symbol, o.Left, o.Right, o.Returns);
        oper = o;
        Returns = t;
    }
}

/**
 *  Simple recursive descent pascal compiler
 *
 *@author     wpc
 *@created    June 21, 2001
 */
// -------------------------------------------------------
// -------------------------------------------------------
public class PascalCompiler extends
/*
 *  ilcg.Pascal.
 */
    Compiler implements
    YyCaller {


    /**
     *  defines the null type
     */
    public SimpleType voidType = new SimpleType("uint8", 1);

    /**
     *  maximum integer allowed
     */
    public long maxint = java.lang.Integer.MAX_VALUE;

    /**
     *  max number of alternatives in a case
     */
    public long maxCaseSwitch = 1024;

    /**
     *  Description of the Field
     */
    public String stringTok = "string";
    /**
     *  Description of the Field
     */
    public boolean usemaskedwrite = false;
    // this is used to control whether the end of a parallel loop
    // is handled by writing to memory under a mask -- not fully reliable yet so switch off
    /**
     *  intel array bounds fault
     */
    public int boundsinterrupt = 5;
    /**
     *  Description of the Field
     */
    public static boolean usePascalForDefinition = true;
    /**
     *  maximum number of array dimensions supported
     */
    public int maxdims = 5;
    /**
     *  unroll array subscriptions to help optimisations
     */
    boolean unrollsubscription = true;
    /**
     *  This is true if vector pascal reserved words are not recognised
     */
    static boolean novpwords = false;
    /**
     *  This is true if no x87 processor
     */
    static boolean nox87 = false;
    boolean hardwareabs(){return !nox87;}
    /**
     *  size of the largest string supported
     */
    public int maxstring = 511;

    /**
     *  enable creation of array descriptors during subscripts
     */
    boolean createdescriptors = false;

    boolean      verboseboundserror    = true;
    /**
     *  this holds associations between record types and the record variables that
     *  are of these types and are currently present in an active with statement.
     *  It is used to construct field dereferencing expressions for the fields when
     *  they occur as unqualified variable names in the code enclosed by the with
     *  statement. The table is indexed on record type.
     */
    public SymbolTable withTable = new SymbolTable(new Hashtable());

    /**
     *  stores all of the current for loop iterators as keys the associated value
     *  is a []vector with two elements the lower element is a vector of lower
     *  bounds against which the iterator must be checked, the upper element is a
     *  vector of upper bounds against which it must be checked
     */
    public Hashtable iteratorset = new Hashtable();
    /**
     *  Description of the Field
     */
    public Hashtable arrayiteratorset = new Hashtable();

    /**
     *  the preloopset is indexed on iterator variable and associates with each
     *  iterator a sequence statements that must be executed before the for loop of
     *  the iterator starts.
     */
    public Stack iteratorstack = new Stack();
    /**
     *  Description of the Field
     */
    public Hashtable preloopset = new Hashtable();

    // Set of Functions that are deemed pure
    /**
     *  Description of the Field
     */
    protected Set purefunctions = new HashSet();


    /**
     *  Description of the Method
     *
     *@param  o  Description of the Parameter
     */
    void declareLoopIterator(Object o) {
        Vector[]  boundset  = {new Vector(), new Vector()};
        iteratorset.put(o, boundset);
        preloopset.put(o, new Statement(null));
        iteratorstack.push(o);
    }


    /**
     *  Initialises a vector of indices for implicit loops in write and read
     *  statements
     *
     *@exception  SyntaxError  Description of the Exception
     */
    void initwriteIndices() throws SyntaxError {
        inIOlist=true;
        for(int i = writeindices.length - 1; i >= 0; i--) {
            try {
                writeindices[i] = tempvar(INTEGER);
                declareLoopIterator(writeindices[i]);
            }
            catch(Exception ex) {
                error(ex.toString());
            }
        }
        maxRank = 0;
    }


    /**
     *  Description of the Method
     *
     *@exception  SyntaxError  Description of the Exception
     */
    void freewriteIndices() throws SyntaxError {
        inIOlist=false;
        for(int i = 0; i < writeindices.length; i++) {
            try {
                freeIterator(writeindices[i]);
            }
            catch(Exception ex) {
                error(ex.getMessage());
            }
        }
        maxRank = 0;
    }


    /**
     *  Description of the Method
     *
     *@param  vec  Description of the Parameter
     *@param  e    Description of the Parameter
     *@return      Description of the Return Value
     */
    boolean contains(Object[] vec, Object e) {
        // System.out.println(" is "+e+" in ");
        for(int i = 0; i < vec.length; i++) {
            // System.out.println(vec[i]);
            if(vec[i] != null && vec[i].equals(e)) {
                return true;
            }
        }
        return false;
    }


    /**
     *  vector of iterators automatically allocated to assignments
     */
    Object[] autoiterators = {null};


    /**
     *  Check if all iterators in the list are auto
     *
     *@param  v  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean allautoiterators(Object[] v) {
        for(int i = 0; i < v.length; i++) {
            // System.out.println("is "+v[i]+" an autoiterator?");
            if(!contains(autoiterators, v[i])) {
                return false;
            }
        }
        return true;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    Object innerIterator() {
        return iteratorstack.peek();
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     */
    void freeIterator(Object n) {
        iteratorstack.pop();
        preloopset.remove(n);
    }


    /**
     *  records any actions which must occur before the start of the loop indexed
     *  by indexvar
     *
     *@param  indexvar  Description of the Parameter
     *@param  action    Description of the Parameter
     */
    void recordPreloopAction(Object indexvar, Node action) {
        preloopset.put(indexvar, new Statement((Node) preloopset.get(indexvar),
                                               new Statement(action)));
        // System.out.println("recordPreloopAction"+indexvar+":"+action);
    }


    /**
     *  this grabs the preloop action for the index variable and then nulls the
     *  list for that index variable to make sure the same action does not occur
     *  twice then it returns the preloop action
     *
     *@param  indexvar  Description of the Parameter
     *@return           The preloopAction value
     */
    Node getPreloopAction(Object indexvar) {
        Object  n  = (Node) preloopset.get(indexvar);
        Node    r  = null;
        if(n != null) {
            r = (Node) n;
        }
        // System.out.println("getPreloopAction "+indexvar+":"+n);
        preloopset.put(indexvar, new Statement(null));
        return r;
    }


    /**
     *  cause n to be exectuted before current statement
     *
     *@param  n  Description of Parameter
     */
    void postPrestatement(Node n) {
        if(processor.verbose) {
            System.out.println("Postprestatement " + n+"\n onto "+prestatement);
        }
        if(n == null) {
            return;
        }
        n = n.eval();
        if(n == null) {
            return;
        }
        prestatement = new Statement(prestatement, new Statement(n.eval()));
        if(processor.verbose) {
            System.out.println("Prestatement=" + prestatement);
        }
    }


    /**
     *  Description of the Field
     */
    public Type INTEGER = new IntegralType(-maxint - 1, maxint);
    /**
     *  Description of the Field
     */
    public Type INT16 = new IntegralType(-(0x7fff + 1), 0x7fff);
    /**
     *  Description of the Field
     */
    public Type INT8 = new IntegralType(-128, 127);
    /**
     *  Description of the Field
     */
    public Type WORD = new IntegralType(0, 65535);
    /**
     *  Description of the Field
     */
    public Type REAL = new RealType(Node.ieee32, 4);
    long[][]     indices               = {{0L, 1L}};
    // public Type COMPLEX = new ArrayType(indices, REAL, 4);

    /**
     *  Description of the Field
     */
    public Type DOUBLE = new RealType(Node.ieee64, 8);
    /**
     *  Description of the Field
     */
    public static Type CHAR = new OrdinalType(charset());
    /**
     *  Description of the Field
     */
    public Type BYTE = new IntegralType(0, 255);
    /**
     *  Description of the Field
     */
    public Type PIXEL = new IntegralType(-127, 127, "PIXEL");


    /**
     *  Gets the pixel attribute of the PascalCompiler object
     *
     *@param  t  Description of the Parameter
     *@return    The pixel value
     */
    boolean isPixel(Type t) {
        if(t == PIXEL) {
            return true;
        }
        if(t instanceof IntegralType
                && ((IntegralType) t).name.equals("PIXEL")) {
            return true;
        }
        // return PIXEL.equals(t);
        return false;
    }


    /**
     *  Description of the Field
     */
    public Type TEXT = new PascalFileType(CHAR);
    /**
     *  Description of the Field
     */
    public static String[] truefalse = {"true", "false"};
    /**
     *  Description of the Field
     */
    public static Type BOOLEAN = new OrdinalType(truefalse, -1);
    Node         TRUE                  = new TypeTag(new Int(-1, "int8"), BOOLEAN);
    Node         FALSE                 = new TypeTag(new Int(0, "int8"), BOOLEAN);
    /**
     *  Description of the Field
     */
    public Type LONG = new IntegralType(Long.MIN_VALUE, Long.MAX_VALUE);
    /**
     *  Description of the Field
     */
    public Type PCHAR = new Pointer(CHAR, processor);
    /**
     *  Description of the Field
     */
    public Type ANY = new IntegralType(0, 1, "ANY");
    /**
     *  Description of the Field
     */
    public Type POINTER = new Pointer(ANY, processor);

    /**
     *  the underlying ilcg type for LONG
     */
    public String longrep = LONG.type;

    /**
     *  this defines the format used to represent integers
     */
    public String intrep = INTEGER.type;

    /**
     *  this defines the format used to represent reals, the default is 32 bit ieee
     *  floating point
     */
    public String realrep = REAL.type;

    /**
     *  this defines the format used for chars, we assume them to be 8 bit by
     *  default
     */
    public String charrep = CHAR.type;

    /**
     *  this defines the format used to represent booleans
     */
    public static String boolrep = BOOLEAN.type;

    /**
     *  Description of the Field
     */
    public String byterep = BYTE.type;

    /**
     *  Holds the type of set to which an assignment is occuring
     */
    SetType defsetContext, setAssignmentContext  = null;

    int          expressionContext     = assignContext;
    final static  int          paramContext          = 1;
    final static  int          assignContext         = 2;
    Statement    wholeProgram          = null;

    /**
     *  indicates if reals can be inlined in the output code
     */
    static boolean inLineReals = true;

    /**
     *  This is used to hold a list of initialised data declaration statements that
     *  the assembler will place after the code
     */
    Statement dataDecls = null;

    /**
     *  Description of the Field
     */
    public Type STRING, STRING1, PSTRING;
    /**
     *  Description of the Field
     */
    public Type ADDRESS;
    // Node pascaloutput,pascalinput;// standard pascal files
    String       addrtype;
    int          addrlength            = 4;
    String       pathPrefix;
    // search prefix for all unit files
    // declare operators
    Op           plusii                = Op.sum(intrep, intrep, intrep);
    Op           satplusbb             = new Op("+:", byterep, byterep, byterep);
    Op           satminusbb            = new Op("-:", byterep, byterep, byterep);
    Op           plusiiu               = Op.sum(intrep, intrep, Node.uint32);
    Op           minusii               = Op.dif(intrep, intrep, intrep);
    Op           timesii               = Op.prod(intrep, intrep, intrep);
    Op           divii                 = Op.div(intrep, intrep, intrep);
    Op           modii                 = new Op("MOD", intrep, intrep, intrep);
    Op           plusII                = Op.sum(longrep, longrep, longrep);
    Op           minusII               = Op.dif(longrep, longrep, longrep);
    Op           timesII               = Op.prod(longrep, longrep, longrep);
    Op           divII                 = Op.div(longrep, longrep, longrep);
    Op           modII                 = new Op("MOD", longrep, longrep, longrep);

    Op           andbb                 = new Op("AND", boolrep, boolrep, boolrep);
    Op           orbb                  = new Op("OR", boolrep, boolrep, boolrep);
    Op           andii                 = new Op("AND", intrep, intrep, intrep);
    Op           orii                  = new Op("OR", intrep, intrep, intrep);
    Op           shlii                 = new Op("<<", intrep, intrep, intrep);
    Op           shrii                 = new Op(">>", intrep, intrep, intrep);
    Op           shlbb                 = new Op("<<", byterep, byterep, byterep);
    Op           shrbb                 = new Op(">>", byterep, byterep, byterep);
    // Op shlIi=new Op("<<",longrep,intrep,longrep);
    // Op shrIi= new Op(">>",longrep,intrep,longrep);

    Op           plusrr                = Op.sum(realrep, realrep, realrep);
    Op           minusrr               = Op.dif(realrep, realrep, realrep);
    Op           timesrr               = Op.prod(realrep, realrep, realrep);
    Op           divrr                 = Op.div(realrep, realrep, realrep);

    // string operations
    Op           eqsb                  = new Op("=", stringTok, stringTok, boolrep);
    Op           neqsb                 = new Op("<>", stringTok, stringTok, boolrep);
    Op           leqsb                 = new Op("<=", stringTok, stringTok, boolrep);
    Op           geqsb                 = new Op(">=", stringTok, stringTok, boolrep);
    Op           ltsb                  = new Op("<", stringTok, stringTok, boolrep);
    Op           gtsb                  = new Op(">", stringTok, stringTok, boolrep);
    // Op concatss= new Op("#", stringTok,stringTok,stringTok);
    Op           eqcb                  = new Op("=", charrep, charrep, boolrep);
    Op           neqcb                 = new Op("<>", charrep, charrep, boolrep);
    Op           leqcb                 = new Op("<=", charrep, charrep, boolrep);
    Op           geqcb                 = new Op(">=", charrep, charrep, boolrep);
    Op           ltcb                  = new Op("<", charrep, charrep, boolrep);
    Op           gtcb                  = new Op(">", charrep, charrep, boolrep);
    // Op concatcs= new Op("#", charrep,charrep,stringTok);
    // Op concatscs= new Op("#",stringTok,charrep,stringTok);

    Op           eqib                  = new Op("=", intrep, intrep, boolrep);
    Op           neqib                 = new Op("<>", intrep, intrep, boolrep);
    Op           leqib                 = new Op("<=", intrep, intrep, boolrep);
    Op           geqib                 = new Op(">=", intrep, intrep, boolrep);
    Op           ltib                  = new Op("<", intrep, intrep, boolrep);
    Op           gtib                  = new Op(">", intrep, intrep, boolrep);

    Op           eqIb                  = new Op("=", longrep, longrep, boolrep);
    Op           neqIb                 = new Op("<>", longrep, longrep, boolrep);
    Op           leqIb                 = new Op("<=", longrep, longrep, boolrep);
    Op           geqIb                 = new Op(">=", longrep, longrep, boolrep);
    Op           ltIb                  = new Op("<", longrep, longrep, boolrep);
    Op           gtIb                  = new Op(">", longrep, longrep, boolrep);

    Op           eqbb                  = new Op("=", boolrep, boolrep, boolrep);
    Op           neqbb                 = new Op("<>", boolrep, boolrep, boolrep);
    Op           leqbb                 = new Op("<=", boolrep, boolrep, boolrep);
    Op           geqbb                 = new Op(">=", boolrep, boolrep, boolrep);
    Op           ltbb                  = new Op("<", boolrep, boolrep, boolrep);
    Op           gtbb                  = new Op(">", boolrep, boolrep, boolrep);

    Op           rangeis               = new Op("..", intrep, intrep, "range");
    Op           eqrb                  = new Op("=", realrep, realrep, boolrep);
    Op           neqrb                 = new Op("<>", realrep, realrep, boolrep);
    Op           leqrb                 = new Op("<=", realrep, realrep, boolrep);
    Op           geqrb                 = new Op(">=", realrep, realrep, boolrep);
    Op           ltrb                  = new Op("<", realrep, realrep, boolrep);
    Op           gtrb                  = new Op(">", realrep, realrep, boolrep);
    Hashtable    preDeclaredOperators  = new Hashtable();
    Yylex        lex;


    /**
     *  Description of the Method
     *
     *@param  l  Description of the Parameter
     */
    public void yySet(Yylex l) {
        lex = l;
    }


    SymbolTable  symbolTable           = new SymbolTable(new Hashtable());
    Hashtable    reservedTypes         = new Hashtable();
    Stack        allocatorStack        = new Stack();

    /**
     *  controls whether latexing enabed
     */
    static int latexLevel = -1;

    /**
     *  Lexical level encodes the nested procedure structure of pascal globals are
     *  at level global, identifiers declared in a procedure declared at level n
     *  have level n+1.
     */
    int global = 0;
    int          unitlevel             = 0;
    int          lexicalLevel          = global;

    /**
     *  This keeps track of how deep into record declarations we are it is required
     *  to make sure that implicit declarations of types within records cause the
     *  types to be stored in the symbol table that encloses the record declaration
     */
    int recordLevel = 0;

    /**
     *  the record enclosing scope is set to point at the the current symbol table
     *  just before entering a record declaration at recordLevel 0
     */
    Dictionary recordEnclosingScope = symbolTable;

    /**
     *  is unit is set true when compiling a unit and causes all variables to be
     *  allocated statically
     */
    boolean isunit = false;

    /**
     *  inlib indicates that all interface procedures are to be exported
     */
    boolean inlib = false;
    String       unitName              = "";
    Label        unitbase;
    boolean      isSystemUnit          = false;
    boolean      isThreadUnit          = false;
    Vector       unitsUsed             = new Vector();
    Vector       unitsToCall           = new Vector();
    String       assembledUnits        = "";

    /**
     *  this holds the exit point of the currently compiled function
     */
    Label currentFunctionExit = new Label();

    /**
     *  This holds the name of the current function
     */
    Stack currentFunctionName = new Stack();

    /**
     *  This holds the return type of the current function
     */
    Type currentFunctionType = null;

    /**
     *  statement: empty variable := expression begin statement-list end if
     *  expression then statement if expression then statement else statement case
     *  expression of case-list end while expression do statement repeat
     *  statement-list until expression for varid := for-list do statement procid
     *  procid ( expression-list ) goto label with record-variable-list do
     *  statement label : statement
     */
    Statement prestatement = null;
    int          startcount            = 1;
    int          recordNestingLevel    = 0;
    static boolean      reduceparallelise     = false;
    // controls whether reduction operations
    // are parallelised
    // parallel reduction is unreliable on dynamic arrays or expressions
    // containing these
    static boolean reduceparallelisedynamic = true;
    // allow reduction in parallel on dynamic arrays
    int          setexpcount           = 0;
    int          names                 = 0;
    private       boolean      invokedStandalone     = false;
    final static  int          charmax               = 0xffff;

    // last char in character set


    /**
     *  plant code to float a pixel
     *
     *@param  pixel            Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node pixel2real(Node pixel) throws SyntaxError {
        Node  res  = dyad(floatit(pixel), recipscale, "*");
        // return res;
        return dyad(res, recipoffset, "+");
    }


    Node         recipscale            = declareReal(1.0 / 127.5 );
    Node         recipoffset           = declareReal(0.5 / 127.5, Node.ieee32);


    /**
     *  plants code to convert a real to a pixel
     *
     *@param  real             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node real2pixel(Node real) throws SyntaxError {
        real = dyad(real, declareReal(-1.0, Node.ieee32), Node.max);
        real = dyad(real, declareReal(1.0, Node.ieee32), Node.min);
        Node  floatpixel    = dyad(dyad(real, r2pscale, "*"), r2poffset, "+");
        Node  integerpixel  = round(floatpixel);
        integerpixel = new TypeTag(integerpixel, PIXEL);
        // System.out.println("real2pixel"+real+"="+integerpixel);
        return integerpixel;
    }


    /**
     *  Description of the Method
     *
     *@param  thebyte          Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node byte2pixel(Node thebyte) throws SyntaxError {
        return new TypeTag(dyad(thebyte, b128, "+"), PIXEL);
    }


    /**
     *  Description of the Method
     *
     *@param  thepixel         Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node pixel2byte(Node thepixel) throws SyntaxError {
        try {
            return new TypeTag(new Dyad(thepixel, new Int(128), "+"),BYTE);
        }
        catch(Exception e) {
            error("in pixel 2 byte "+e);
            return null;
        }
    }


    Node         r2pscale              = declareReal(127.5, Node.ieee32);
    Node         r2poffset             = declareReal(-0.5, Node.ieee32);
    Node         b128                  = new Int(-128, Node.int8);


    /**
     *  Description of the Method
     *
     *@param  v                Description of the Parameter
     *@param  t                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node typeTag(Node v, Type t) throws SyntaxError {
        if(isPixel(t)) {
            // System.out.println("is pixel "+t);
            String  vt  = v.returnType();
            // System.out.println(vt);
            if(Format.isReal(vt)) {
                return real2pixel(v);
            }
            else if(!isPixel(getType(v))) {
                error("Right hand side of pixel assignment was not a float or a pixel");
            }
        }
        return new TypeTag(v, t);
    }


    String       sourceName            = "";
    String       compileTimeFunction   = "compileTimeFunction";

    String[]     vpExtensions          = {
        // words not in turbo or extended
        // pascal
        "ABS", "BYTE2PIXEL", "CAST", "CDECL", "DIAG", "FORWARD", "IOTA",
        "LABEL", "MAX", "MIN", "NAME", "OPERATOR", "PERM", "PIXEL2BYTE",
        "REM", "TRANS"
    };
    String[] opExtensions = {"ROUND","SIN","LN","COS","SQRT","TRUNC"}; //,"COS","TAN","SQR","LN"};

    /**
     *  Removes a list of words from the reserved words table recognised by the
     *  lexical analyser and makes them into identifiers that can be over-ridden by
     *  a variable declaration
     *
     *@param  excludees  Description of the Parameter
     */
    void excludeReservedWords(String[] excludees) {
        for(int i = 0; i < excludees.length; i++) {
            String  s  = excludees[i].toLowerCase();
            symbolTable.put(s, "keyword");
            lex.excludeWord(s);
            //    System.out.println("exclude reserved word "+s);
        }
    }


    /**
     *  Creates a compiler with the tree walker w providing the code generator.
     *
     *@param  path        path to sourcefile
     *@param  w           code generator to use
     *@param  source      a stream containing open source
     *@param  sourcename  the name of the programme or unitfile
     */
    public PascalCompiler(String path, Walker w, Reader source,
                          String sourcename) {
        super(w);
        sourceName = sourcename;
        pathPrefix = path;
        lex = new Yylex(source);
        if(nox87)excludeReservedWords(opExtensions);
        try {
            lex.nextsymbol();
        }
        catch(Exception e) {
            System.out.println(e);
        }
        addrtype = processor.getAddressType();
        Format.addressType = addrtype;
        ADDRESS = new SimpleType(addrtype, addrlength = (Format.lengthInBits(addrtype) / 8));
        // ADDRESS = new IntegralType(0, maxint);
        // ADDRESS = INTEGER;
        STRING = new StringType(maxstring, processor);
        STRING1 = new StringType(1, processor);
        PSTRING = new Pointer(STRING, processor);
        symbolTable.put("pchar", PCHAR);
        symbolTable.put("pointer", POINTER);
        symbolTable.put("integer", INTEGER);
        symbolTable.put("real", REAL);
        // symbolTable.put("complex", COMPLEX);
        symbolTable.put("double", DOUBLE);
        symbolTable.put("char", CHAR);
        symbolTable.put("boolean", BOOLEAN);
        defsetContext = null;
        // setAssignmentContext = new SetType(new
        // IntegralType(-8,255));
        symbolTable.put("text", TEXT);
        symbolTable.put("true", TRUE);
        symbolTable.put("false", FALSE);
        symbolTable.put("string", STRING);
        symbolTable.put("pixel", PIXEL);
        symbolTable.put("maxcaseswitch", new Int(maxCaseSwitch, Node.int32));
        symbolTable.put("maxstring", new Int(maxstring, Node.int32));
        symbolTable.put("maxdims", new Int(maxdims, Node.int32));
        symbolTable.put("high", compileTimeFunction);
        symbolTable.put("low", compileTimeFunction);
        symbolTable.put("inc", compileTimeFunction);
        symbolTable.put("dec", compileTimeFunction);
        symbolTable.put("abs", compileTimeFunction);
        symbolTable.put("alias", compileTimeFunction);
        symbolTable.put("new", compileTimeFunction);
        symbolTable.put("setlength", compileTimeFunction);
        symbolTable.put("read", compileTimeFunction);
        symbolTable.put("write", compileTimeFunction);
        symbolTable.put("readln", compileTimeFunction);
        symbolTable.put("writeln", compileTimeFunction);
        symbolTable.put("val",compileTimeFunction);
        symbolTable.put("dispose", compileTimeFunction);
        // now come keywords that can be redefined as variables
        // symbolTable.put("output", pascaloutput=new TypeTag(new
        // Int(1,Node.int32),TEXT));
        // symbolTable.put("input", pascalinput=new TypeTag(new
        // Int(0,Node.int32),TEXT));
        symbolTable.put("nil", new TypeTag(new ilcg.tree.Int(0), ADDRESS));
        // symbolTable.put("nil", new TypeTag(new
        // ilcg.tree.Int(0,Node.int32),POINTER));
        /*
         *  declare operators
         */
        preDeclaredOperators.put("+ii", new TOP(plusii, INTEGER));
        preDeclaredOperators.put("-ii", new TOP(minusii, INTEGER));
        preDeclaredOperators.put("*ii", new TOP(timesii, INTEGER));
        preDeclaredOperators.put("DIVii", new TOP(divii, INTEGER));
        preDeclaredOperators.put("<ii", new TOP(ltib, BOOLEAN));
        preDeclaredOperators.put(">ii", new TOP(gtib, BOOLEAN));
        preDeclaredOperators.put("=ii", new TOP(eqib, BOOLEAN));
        preDeclaredOperators.put("<>ii", new TOP(neqib, BOOLEAN));
        preDeclaredOperators.put("<=ii", new TOP(leqib, BOOLEAN));
        preDeclaredOperators.put(">=ii", new TOP(geqib, BOOLEAN));
        // preDeclaredOperators.put("<<Ii",new TOP(shlIi,LONG));
        preDeclaredOperators.put("<<ii", new TOP(shlii, INTEGER));
        // preDeclaredOperators.put(">>Ii",new TOP(shrIi,LONG));
        preDeclaredOperators.put(">>ii", new TOP(shrii, INTEGER));
        preDeclaredOperators.put("+II", new TOP(plusII, INTEGER));
        preDeclaredOperators.put("-II", new TOP(minusII, INTEGER));
        preDeclaredOperators.put("*II", new TOP(timesII, INTEGER));
        preDeclaredOperators.put("DIVII", new TOP(divII, INTEGER));
        preDeclaredOperators.put("<II", new TOP(ltIb, BOOLEAN));
        preDeclaredOperators.put(">II", new TOP(gtIb, BOOLEAN));
        preDeclaredOperators.put("=II", new TOP(eqIb, BOOLEAN));
        preDeclaredOperators.put("<>II", new TOP(neqIb, BOOLEAN));
        preDeclaredOperators.put("<=II", new TOP(leqIb, BOOLEAN));
        preDeclaredOperators.put(">=II", new TOP(geqIb, BOOLEAN));
        preDeclaredOperators.put("<bb", new TOP(ltbb, BOOLEAN));
        preDeclaredOperators.put(">bb", new TOP(gtbb, BOOLEAN));
        preDeclaredOperators.put("=bb", new TOP(eqbb, BOOLEAN));
        preDeclaredOperators.put("<>bb", new TOP(neqbb, BOOLEAN));
        preDeclaredOperators.put("<=bb", new TOP(leqbb, BOOLEAN));
        preDeclaredOperators.put(">=bb", new TOP(geqbb, BOOLEAN));
        preDeclaredOperators.put("+:ii", new TOP(satplusbb, INTEGER));
        preDeclaredOperators.put("-:ii", new TOP(satminusbb, INTEGER));
        preDeclaredOperators.put("MODii", new TOP(modii, INTEGER));
        preDeclaredOperators.put("ORii", new TOP(orii, INTEGER));
        preDeclaredOperators.put("ORbb", new TOP(orbb, BOOLEAN));
        preDeclaredOperators.put("+SS", new TOP(orbb, BOOLEAN));
        preDeclaredOperators.put("ANDii", new TOP(andii, INTEGER));
        preDeclaredOperators.put("ANDbb", new TOP(andbb, BOOLEAN));
        preDeclaredOperators.put("*SS", new TOP(andbb, BOOLEAN));
        preDeclaredOperators.put("+rr", new TOP(plusrr, REAL));
        preDeclaredOperators.put("-rr", new TOP(minusrr, REAL));
        preDeclaredOperators.put("*rr", new TOP(timesrr, REAL));
        preDeclaredOperators.put("/rr", new TOP(divrr, REAL));
        preDeclaredOperators.put("<rr", new TOP(ltrb, BOOLEAN));
        preDeclaredOperators.put(">rr", new TOP(gtrb, BOOLEAN));
        preDeclaredOperators.put("=rr", new TOP(eqrb, BOOLEAN));
        preDeclaredOperators.put("<>rr", new TOP(neqrb, BOOLEAN));
        preDeclaredOperators.put("<=rr", new TOP(leqrb, BOOLEAN));
        preDeclaredOperators.put(">=rr", new TOP(geqrb, BOOLEAN));
        // string operators
        // preDeclaredOperators.put("#ss",new TOP(concatss,STRING));
        preDeclaredOperators.put("<ss", new TOP(ltsb, BOOLEAN));
        preDeclaredOperators.put(">ss", new TOP(gtsb, BOOLEAN));
        preDeclaredOperators.put("=ss", new TOP(eqsb, BOOLEAN));
        preDeclaredOperators.put("<>ss", new TOP(neqsb, BOOLEAN));
        preDeclaredOperators.put("<=ss", new TOP(leqsb, BOOLEAN));
        preDeclaredOperators.put(">=ss", new TOP(geqsb, BOOLEAN));
        // preDeclaredOperators.put("#cc",new TOP(concatcs,STRING));
        // preDeclaredOperators.put("#sc",new TOP(concatscs,STRING));
        preDeclaredOperators.put("<cc", new TOP(ltcb, BOOLEAN));
        preDeclaredOperators.put(">cc", new TOP(gtcb, BOOLEAN));
        preDeclaredOperators.put("=cc", new TOP(eqcb, BOOLEAN));
        preDeclaredOperators.put("<>cc", new TOP(neqcb, BOOLEAN));
        preDeclaredOperators.put("<=cc", new TOP(leqcb, BOOLEAN));
        preDeclaredOperators.put(">=cc", new TOP(geqcb, BOOLEAN));
    }


    /**
     *  Description of the Method
     *
     *@param  symbol  Description of the Parameter
     */
    public void defineSymbol(String symbol) {
        //      System.out.println(" define "+symbol);Co
        lex.defineSymbol(symbol);
    }


    /**
     *  Description of the Method
     *
     *@param  symbols  Description of the Parameter
     */
    public void defineSymbols(Vector symbols) {
        lex.defineSymbols(symbols);
    }


    /**
     *  plants a data declaration for a constant in node and then returns its label
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Label plant(Node n) {
        return plant(n,null);
    }
    public Label plant(Node n, Label lab) {
        if(lab==null)  lab   = new Label();
        if(inlib) {
            lab = new ExtLabel(unitName + lab.toString());
        }
        Node   decl  = new Statement(lab, new Statement(new Location(n), null));
        dataDecls = new Statement(decl, dataDecls);
        return lab;
    }


    /**
     *  calls declareReal(r,inLineReals)
     *
     *@param  r  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node declareReal(double r) {
        return declareReal(r, inLineReals);
    }
    public Node declareReal(double r,String t) {
        return declareReal(r, inLineReals,t);
    }

    /**
     *  if inLine is false this plants declaration for a real variable and returns
     *  its label, otherwise it simply returns a Num object
     *
     *@param  r       Description of Parameter
     *@param  inLine  Description of Parameter
     *@return         Description of the Returned Value
     */

    public Node declareReal(double r, boolean inLine,String t) {
        if(inLine) {
            return new Real(r, t);
        }
        Label l= plant(new Real(r, t));
        return new Deref(new Memref(l,t));
    }
    public Node declareReal(double r, boolean inLine ) {
        return declareReal(r,inLine,realrep);
    }

    /**
     *  Description of the Method
     *
     *@param  bytes   Description of Parameter
     *@param  offset  Description of Parameter
     *@return         Description of the Returned Value
     */
    public Statement plant(byte[] bytes, int offset) {
        return plant(bytes, 0, bytes.length - 1);
    }


    /**
     *  Description of the Method
     *
     *@param  bytes  Description of the Parameter
     *@param  start  Description of the Parameter
     *@param  fin    Description of the Parameter
     *@return        Description of the Return Value
     */
    public Statement plant(byte[] bytes, int start, int fin) {
        if(start == fin) {
            return new Statement(new Location(new Int(bytes[start], "uint8")));
        }
        if(start > fin) {
            return null;
        }
        Statement  left   = plant(bytes, start, start + (fin - start) / 2);
        Statement  right  = plant(bytes, start + 1 + (fin - start) / 2, fin);
        return new Statement(left, right);
    }


    /**
     *  Description of the Method
     *
     *@param  bytes   Description of the Parameter
     *@param  offset  Description of the Parameter
     *@return         Description of the Return Value
     */
    public Statement plant(char[] bytes, int offset) {
        return plant(bytes, 0, bytes.length - 1);
    }


    /**
     *  Description of the Method
     *
     *@param  bytes  Description of the Parameter
     *@param  start  Description of the Parameter
     *@param  fin    Description of the Parameter
     *@return        Description of the Return Value
     */
    public Statement plant(char[] bytes, int start, int fin) {
        if(start == fin) {
            return new Statement(new Location(new Int(bytes[start], "uint16")));
        }
        if(start > fin) {
            return null;
        }
        return new Statement(plant(bytes, start, start + (fin - start) / 2),
                             plant(bytes, start + 1 + (fin - start) / 2, fin));
    }


    /**
     *  determines if the current string is part of a larger datastructure
     */
    public boolean arraystringcontext = false;

    /**
     *  determines the space to be used by an array string
     */
    public int arraystringlength = 0;


    /**
     *  places a string in the data section of the code if the
     *  arraystringcontext=true then use arraystringlength to determine its length
     *
     *@param  s                string to plant
     *@param  strlen           Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Label plantStringlab(String s, int strlen) throws SyntaxError {
        if(strlen > maxstring) {
            error("string too long");
        }
        char[]  b    = new char[strlen + 1];
        b[0] = (char)(s.length() & 0xffff);
        // b[s.length() + 1] = 0;
        // put in the end of string char for c purposes
        for(int i = 0; i < s.length(); i++) {
            b[1 + i] = s.charAt(i);
        }
        Label   lab  = new Label();
        dataDecls = new Statement(dataDecls, new Statement(lab, new Statement(
                                      plant(b, 0))));
        return lab;
    }


    /**
     *  Description of the Method
     *
     *@param  b  Description of the Parameter
     *@return    Description of the Return Value
     */
    Label plantByteArray(byte[] b) {
        Statement  list  = null;
        Label      lab   = newdatalabel();
        for(int i = b.length - 1; i >= 0; i--) {
            list = new Statement(new Location(new Int(b[i], "uint8")), list);
        }
        dataDecls = new Statement(dataDecls, list);
        return lab;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    Label newdatalabel() {
        Label  lab  = new Label();
        dataDecls = new Statement(dataDecls, new Statement(lab));
        return lab;
    }


    /**
     *  Description of the Method
     *
     *@param  s                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    public Node plantString(String s) throws SyntaxError {
        int    strlen   = s.length();
        // System.out.println("plant string "+s);
        if(arraystringcontext) {
            strlen = arraystringlength;
        }
        Type   newtype  = new StringType(strlen, processor);
        Label  lab      = plantStringlab(s, strlen);
        return new TypeTag(new Memref(lab, new Ref(newtype).returnType()),
                           newtype);
    }


    /**
     *  Description of the Field
     */
    public static int arraybounderr = 201;


    /**
     *  plants call to run time error routine
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node boundserr() throws SyntaxError {
        if(verboseboundserror) {
            return runerr(arraybounderr);
        }
        return new Fail(new Int(5));
    }


    /**
     *  Description of the Method
     *
     *@param  index            Description of the Parameter
     *@param  llimit           Description of the Parameter
     *@param  ulimit           Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node boundserr(Node index, Node llimit, Node ulimit) throws SyntaxError {
        if(verboseboundserror) {
            return boundserr(index, llimit, ulimit, "bounderr");
        }
        return boundserr();
    }


    /**
     *  Description of the Method
     *
     *@param  index            Description of the Parameter
     *@param  llimit           Description of the Parameter
     *@param  ulimit           Description of the Parameter
     *@param  proc             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node boundserr(Node index, Node llimit, Node ulimit, String proc)
    throws SyntaxError {
        if(!verboseboundserror) {
            return boundserr();
        }
        Node[]   p      = {index, llimit, ulimit, new Int(lex.lineno(), INTEGER.type)};
        int      calls  = callcount;
        boolean  par    = unparalleled;
        Node     temp   = procCall(proc, p);
        unparalleled = par;
        callcount = calls;
        return temp;
    }


    /*
     *  plants code to generate an arrray bounds error if bounds are violated in
     *  a loop
     */
    /**
     *  Description of the Method
     *
     *@param  index            Description of the Parameter
     *@param  lwb              Description of the Parameter
     *@param  upb              Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node checkArrayBoundsNotViolatedInLoopForIndex(Node index, Node lwb,
            Node upb) throws SyntaxError {
        Statement  list  = new Statement(null);
        try {
            Vector[]  boundset  = (Vector[]) iteratorset.get(index);
            Object[]  lwbs      = toarray(boundset[0]);
            Object[]  upbs      = toarray(boundset[1]);
            //System.out.println("after boundset got "+lwbs+upbs);
            for(int I = 0; I < lwbs.length; I++) {
                //System.out.println("I="+I);
                if(lwbs[I] != null) {
                    if(lwbs[I] instanceof Node) {
                        Node  lowtest  = dyad(new TypeTag(lwb, INTEGER),
                                              new TypeTag((Node) lwbs[I], INTEGER), "<")
                                         .eval();
                        if(lowtest instanceof Number) {
                            if(((Number) lowtest).intValue() != 0) {
                                error(" lower bound violation in explicit or implicit loop "
                                      + lwb + "<" + lwbs[I]);
                            }
                        }
                        else {
                            list = new Statement(new If(lowtest, boundserr(
                                                            (Node) lwbs[I], lwb, upb, "forerrbelow"))
                                                 .eval(), list);
                        }
                    }
                }
            }
            for(int I = 0; I < upbs.length; I++) {
                if(upbs[I] != null) {
                    if(upbs[I] instanceof Node) {
                        Node  test;
                        list = new Statement(new If(test = dyad(
                                                               new TypeTag(upb, INTEGER),
                                                               new TypeTag((Node) upbs[I], INTEGER), ">")
                                                           .eval(), boundserr((Node) upbs[I], lwb, upb,
                                                                   "forerrabove").eval(), list));
                        if(test instanceof Number) {
                            if(((Number) test).intValue() != 0) {
                                error(" upper bound violation in explicit or implicit loop"
                                      + upb + ">" + upbs[I]);
                            }
                        }
                    }
                }
            }
        }
        catch(Exception ex2) {
            error("Exception in checkArrayBoundsNotViolatedInLoopForIndex\n"
                  + ex2);
        }
        return list;
    }


    /**
     *  Description of the Method
     *
     *@param  e                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node runerr(int e) throws SyntaxError {
        Node[]   p      = {new Int(e, INTEGER.type),
                 new Int(lex.lineno(), INTEGER.type)
        };
        int      calls  = callcount;
        boolean  par    = unparalleled;
        Node     temp   = procCall("runerr", p);
        unparalleled = par;
        callcount = calls;
        return temp;
    }


    /**
     *  Description of the Method
     *
     *@param  labels  Description of Parameter
     *@param  offset  Description of Parameter
     *@return         Description of the Returned Value
     */
    public Statement plant(Label[] labels, int offset) {
        if(offset < labels.length) {
            return new Statement(new Location(new Cast(addrtype,labels[offset])), plant(labels,
                                 offset + 1));
        }
        return null;
    }


    /**
     *  plant a vector of labels in the data seg, labels the first element and
     *  returns that label
     *
     *@param  labels  Description of the Parameter
     *@return         Description of the Return Value
     */
    public Label plant(Label[] labels) {
        Label  lab  = new Label();
        dataDecls = new Statement(lab, new Statement(plant(labels, 0),
                                  (Statement) dataDecls));
        return lab;
    }


    /**
     *  places a vector of bytes in the data segment
     *
     *@param  bytes   Description of Parameter
     *@param  offset  Description of Parameter
     *@return         Description of the Returned Value
     */
    public Statement plant(int[] bytes, int offset) {
        if(offset < bytes.length) {
            return new Statement(new Location(new Int(bytes[offset], intrep)),
                                 plant(bytes, offset + 1));
        }
        return null;
    }


    /**
     *  Description of the Method
     *
     *@param  bytes  Description of Parameter
     *@param  t      Description of the Parameter
     *@return        Description of the Returned Value
     */
    public Node declareSet(byte[] bytes, SetType t) {
        Node  lab   = new Label();
        Node  decl  = new Statement(lab, new Statement(plant(bytes, 0), null));
        dataDecls = new Statement(decl, dataDecls);
        return new TypeTag(new Deref(new Memref(lab, "ref uint8 vector ( "
                                                + (bytes.length) + " )")), t);
    }


    /**
     *  Description of the Method
     *
     *@param  bytes  Description of the Parameter
     *@return        Description of the Return Value
     */
    public Node declareSet(byte[] bytes) {
        return declareSet(bytes, setAssignmentContext);
    }


    /**
     *  create new name space and new allocation area for variables also model the
     *  stack frame. The design of the stack frame is based on that created by the
     *  intel ia32 ENTER instruction
     *
     *@param  params  Description of Parameter
     */
    public void enterScope(boolean params) {
        symbolTable.enterScope();
        if(params) {
            lexicalLevel++;
        }
        if(processor.verbose) {
            System.out.println(" "+lex.lineno()+"enterscope  to lexlevel " + lexicalLevel +" paramflag " +params+" depth "
                               + symbolTable.depth);
        }
        Node  base;
        if(inUnit() || lexicalLevel == global) {
            // base = new ExtLabel("unit$"+unitName+"$base");
            base = unitbase;
        }
        else {
            base = new Cast("ref " + Format.addressType, processor.getFP());
        }
        allocatorStack.push(processor.newAllocator(0, params));
        if(!params) {
            // create the display
            if(lexicalLevel > 0 && !inUnit()) {
                for(int i = 1; i <= lexicalLevel; i++) {
                    try {
                        declareVar("$$display" + (i), (ADDRESS));
                    }
                    catch(Exception e) {
                        System.out.println("Internal " + e);
                    }
                }
            }
        }
        else {
            try {
                declareVar("$$dynamiclink", (ADDRESS));
                declareVar("$$returnaddress", (ADDRESS));
            }
            catch(Exception e) {
                System.out.println("Internal " + e);
            }
        }

    }


    /**
     *  Description of the Method
     */
    public void enterScope() {
        enterScope(false);
    }


    /**
     *  reverse of enter scope
     *
     *@param  params  Description of Parameter
     */
    public void leaveScope(boolean params) {
        if(processor.verbose) {
            System.out.println(" "+lex.lineno()+"Leave scope from lexlevel "+lexicalLevel +" paramflag " + params);
        }
        if(params) {
            lexicalLevel = lexicalLevel - 1;
        }
        symbolTable.leaveScope();
        if(processor.verbose&& params) {
            System.out.println("new lexlevel " + lexicalLevel + " depth "
                               + symbolTable.depth);
            // symbolTable.list();
        }
        allocatorStack.pop();
    }


    /**
     *  Description of the Method
     *
     *@param  s  Description of the Parameter
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    public static String padLeft(String s, int n) {
        return String.format("%1$#" + n + "s", s);
    }


    /**
     *  Description of the Method
     *
     *@param  s  Description of the Parameter
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    public static String padRight(String s, int n) {
        return String.format("%1$-" + n + "s", s);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    String listCurrent() {
        // should list symbol table
        Enumeration  e;
        Dictionary   d   = symbolTable.getCurrentScope();
        e = d.keys();
        String       s   = "";
        Vector       v   = new Vector();
        while(e.hasMoreElements()) {
            Object  o  = e.nextElement();
            v.add(padRight(" " + o, 33) + "\t" + d.get(o));
        }
        String[]     sa  = new String[v.size()];
        for(int i = 0; i < v.size(); i++) {
            sa[i] = v.elementAt(i).toString();
        }
        Arrays.sort(sa);
        for(int j = 0; j < sa.length; j++) {
            s += "\n" + sa[j];
        }
        return "  symbol table" + s;
    }


    /**
     *  Description of the Method
     */
    public void leaveScope() {
        leaveScope(false);
    }


    /**
     *  forces a variable to be derefed to the target type
     *
     *@param  n                Description of Parameter
     *@param  targetType       Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of the Exception
     */
    public Node forcederef(Node n, Type targetType)
    throws
        /*
         *  ilcg.
         */
        SyntaxError {
        Type  rt  = resolvepointertypes(getType(n));
        targetType = resolvepointertypes(targetType);
        // System.out.println("forcederef "+n+":"+rt+"\nto "+targetType);
        if(rt.equals(targetType)) {
            return n;
        }
        if(!(rt.type.startsWith("ref"))) {
            n = new TypeTag(optionalfloat(targetType, n), targetType);
        }
        else {
            return forcederef(new Deref(n), targetType);
        }
        if(!getType(n).equals(targetType)) {
            error("could not coerce type " + rt + " to " + targetType);
        }
        // System.out.println("->"+n);
        return n;
    }


    /**
     *  Description of the Method
     *
     *@param  n                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of the Exception
     */
    public Node forcederef(Node n) throws
        /*
         *  ilcg.
         */
        SyntaxError {
        String  rt  = n.returnType();
        if(processor.verbose) {
            // System.out.println(
            // "forcederef " + n + ":" + getType(n) + " "
            // + getType(n).getClass());
        }
        if(!rt.startsWith("ref") || getType(n) instanceof Pointer) {
            return n;
        }
        if(n instanceof Variable) {
            return new TypeTag(new Deref(n),
                               ((Ref)((Variable) n).getType()).pointsTo);
        }
        return (new Deref(n));
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node parse() throws SyntaxError {
        Node  p  = null;
        try {
            p = program();
        }
        catch(Exception e) {
            if(e instanceof SyntaxError) {
                throw(SyntaxError) e;
            }
            error("internal error " + e);
        }
        return p;
    }


    // this is used to include a unit with the specified name in the current
    // position in the source, substituting the params for the formal params of
    // the unit
    /**
     *  Description of the Method
     *
     *@param  unit             Description of the Parameter
     *@param  params           Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    public Node includeUnit(String unit, Node[] params) throws SyntaxError {
        Yylex   oldlex    = lex;
        String  fileused;
        try {
            java.io.FileDescriptor  fd;
            FileInputStream         sf;
            try {
                sf = new FileInputStream(fileused = pathPrefix + unit + ".pas");
                fd = sf.getFD();
            }
            catch(Exception fe) {
                System.out.println(" search for "+unit+" on path ");
                String  Prefix  = System.getProperty("mmpcdir", pathPrefix)
                                  .replace("\\", "/");
                if(!Prefix.endsWith("/")) {
                    Prefix = Prefix + "/";
                }
                sf = new FileInputStream(fileused = Prefix + unit + ".pas");
                fd = sf.getFD();
                if(!fd.valid()) {
                    error(" file not found " + fe+"("+Prefix + unit + ".pas}");
                }
            }
            Reader                  source   = new InputStreamReader(sf, "UTF-8");
            source = new BufferedReader(source);
            lex = new Yylex(source);
            lex.nextsymbol();
            System.out.println(fileused);
            defineSymbol(getprocessorname());
            mustbe("unit");
            mustbe(lex.TT_IDENTIFIER);
            mustbe('(');
            int                     paramno  = 0;
            mustbe(lex.TT_IDENTIFIER);
            String                  param    = lex.theId;
            symbolTable.put(param, params[paramno]);
            while(have(',')) {
                paramno++;
                if(paramno > (params.length - 1)) {
                    error("too few actual parameters supplied to " + unit);
                }
                param = lex.theId;
                symbolTable.put(param, params[paramno]);
            }
            if(paramno != (params.length - 1)) {
                error("too many actual parameters supplied to " + unit);
            }
            mustbe(')');
            mustbe(';');
            mustbe("interface");
            useSpec();
            enterScope();
            interfaceDecls();
            Dictionary              d        = symbolTable.getCurrentScope();
            mustbe("implementation");
            symbolTable.enterScope();
            symbolTable.load(d);
            // copy declarations from the interface scope
            // into the inner scope
            Block                   bl       = (Block) block();
            mustbe(lex.TT_FULLSTOP);
            symbolTable.leaveScope();
            lex = oldlex;
            return bl;
        }
        catch(Exception e) {
            error(unit + ":" + e);
        }
        lex = oldlex;
        return null;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    public Node localoptimize(Node n) {
        if(n==null) return n;
        return n.eval();
    }


    /**
     *  parses <id> [ ':' 'apu' '[' <intconst> ']' ]
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    String[] unitid() throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        String    id       = lex.theId;
        String    apucode  = getprocessorname();
        if(have(':')) {
            mustbe(lex.TT_IDENTIFIER);
            String  apuname  = lex.theId;
            if(apuname.equals("apu")) {
                mustbe("[");
                mustbe(lex.TT_NUMBER);
                int  apun  = (int) lex.theNumber;
                mustbe("]");
                if(apun >= Apus.length) {
                    error("APU bounds error " + apun + " >= " + (Apus.length));
                }
                apucode = Apus[apun];
            }
            else {
                error("apu expected");
            }
        }
        String[]  pair     = {id, apucode};
        // System.out.println(id + " " + apucode);
        return pair;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    String getprocessorname() {
        String[]  comp  = processor.getClass().toString().split("\\W");
        String    last  = comp[comp.length - 1];
        return last.substring(0, last.length() - 2);
    }


    // this is only true when compiling the system unit
    /**
     *  parses program-unit: UNIT id INTERFACE use_spec interface-decls
     *  IMPLEMENTATION block .
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node unit() throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        String      id       = lex.theId;
        unitbase = new ExtLabel("unit$" + id + "$base");
        // unitbase = new Label();
        unitName = id;
        isSystemUnit = id.equals("system");
        isThreadUnit = id.equals("threadlib");
        mustbe(';');
        mustbe("interface");
        useSpec();
        isunit = true;
        enterScope();
        String      generic  = "";
        lexicalLevel = unitlevel;
        // System.out.println("unit "+id+" lexicalLevel "+unitlevel);
        interfaceDecls();
        while(have("in")) {
            try {
                mustbe(lex.TT_IDENTIFIER);
                generic = lex.theId;
                mustbe('(');
                int                     paramno  = 0;
                String[]                names    = new String[1000];
                mustbe(lex.TT_IDENTIFIER);
                names[paramno] = lex.theId;
                while(have(',')) {
                    paramno++;
                    if(paramno >= names.length) {
                        error("too many parameters to unit");
                    }
                    names[paramno] = lex.theId;
                }
                mustbe(')');
                mustbe(';');
                // this is an invocation of a parameterised unit
                FileInputStream         sf       = new FileInputStream(pathPrefix + generic
                        + ".pas");
                java.io.FileDescriptor  fd       = sf.getFD();
                if(!fd.valid()) {
                    error(generic + ".pas invalid file");
                }
                // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
                // FileReader(fd));
                Reader                  source   = new InputStreamReader(sf, "UTF-8");
                Yylex                   oldlex   = lex;
                lex = new Yylex(source);
                lex.nextsymbol();
                System.out.println(pathPrefix + generic + ".pas");
                mustbe("unit");
                defineSymbol(getprocessorname());
                mustbe(lex.TT_IDENTIFIER);
                mustbe('(');
                int                     params   = 0;
                mustbe(lex.TT_IDENTIFIER);
                String                  param    = lex.theId;
                symbolTable.put(param, symbolTable.checkedGet(names[params]));
                while(have(',')) {
                    params++;
                    if(params > paramno) {
                        error("not enough actual parameters");
                    }
                    param = lex.theId;
                    symbolTable.put(param, symbolTable.checkedGet(names[params]));
                }
                mustbe(')');
                if(params != paramno) {
                    error("number of formal and actual parameters do not match");
                }
                mustbe(';');
                mustbe("interface");
                useSpec();
                interfaceDecls();
            }
            catch(Exception ee) {
                error(" while processing generic unit " + generic + "\n" + ee);
            }
        }
        Dictionary  d        = symbolTable.getCurrentScope();
        mustbe("implementation");
        symbolTable.enterScope();
        symbolTable.load(d);
        // copy declarations from the interface scope into
        // the inner scope
        Block       bl       = (Block) block();
        mustbe(lex.TT_FULLSTOP);
        symbolTable.leaveScope();
        // now write the declarations of the unit to idCpu.mpu
        try {
            // System.out.println(id +" parsed");
            FileOutputStream  f  = new FileOutputStream(pathPrefix + id
                    + getprocessorname() + ".mpu");
            // System.out.println("f created");
            ObjectOutput      s  = new ObjectOutputStream(f);
            // System.out.println("writing file "+pathPrefix+id+".mpu");
            // System.out.flush();
            s.writeObject(d);
            s.flush();
            s.close();
        }
        catch(Exception en) {
            en.printStackTrace();
            error(" while saving unit " + id + " symbol table " + en);

        }
        if(latexLevel >= 0) {
            try {
                String      fileName  = pathPrefix + sourceName;
                PascalFile  latexer   = new PascalFile(fileName);
                latexer.createLatex((byte) latexLevel, true, true);
                System.out.println(fileName + "-> TeX");
            }
            catch(Exception e) {
                System.out.println("Error processing Latex " + e);
            }
        }
        Label       l        = new Label();
        if(inlib) {
            l = new ExtLabel("Pdllmain");
        }
        wholeProgram = new Statement(wholeProgram, new Statement(
                                         // l,
                                         new Statement(new Unit("unit$" + id, unitsToCall, 0, "[]",
                                                 "void", l,
                                                 // new Label(),
                                                 bl, unitbase), new Statement(dataDecls, null))));
        // System.out.println(wholeProgram);
        return wholeProgram;
    }


    /**
     *  parses use_spec: USES uselist ;
     *
     *@exception  SyntaxError  Description of Exception
     */
    public void useSpec() throws SyntaxError {
        if(!isSystemUnit) {
            loadUnit("system");
        }
        if(have("uses")) {
            uselist();
            mustbe(';');
            symbolTable.enterScope();
        }
    }


    /**
     *  parses uselist: id |id , uselist
     *
     *@exception  SyntaxError  Description of Exception
     */
    public void uselist() throws SyntaxError {
        String[]  pair  = unitid();
        String    unit  = pair[0];
        if(!have('(')) {
            loadUnit(pair);
        }
        else {
            int       paramno  = 0;
            String[]  names    = new String[100];
            mustbe(lex.TT_IDENTIFIER);
            names[paramno] = lex.theId;
            while(have(',')) {
                paramno++;
                if(paramno >= names.length) {
                    error("too many parameters to unit");
                }
                names[paramno] = lex.theId;
            }
            mustbe(')');
            Node[]    actuals  = new Node[paramno + 1];
            for(int i = 0; i <= paramno; i++) {
                try {
                    actuals[i] = (Node) symbolTable.checkedGet(names[i]);
                }
                catch(Exception e) {
                    error("invalid parameter " + names[i] + "\n" + e);
                }
            }
            includeUnit(unit, actuals);
        }
        if(have(',')) {
            uselist();
        }
    }


    /**
     *  program-heading: ( identifier-list ) identifier-list: identifier
     *  identifier-list , identifier block: block1 | label-declaration ; block1
     *
     *@param  l                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node block(Type l) throws SyntaxError {
        if(have("label")) {
            label_declaration();
            mustbe(';');
        }
        Label      exit          = new Label();
        symbolTable.put("$exit", exit);
        Statement  retstatement  = null;
        if(l != voidType) {
            String  r  = l.type;
            if(processor.verbose) {
                System.out.println("block of type " + l + " " + l.getClass());
            }
            if(!(l instanceof ArrayType)) {
                if(Format.isReal(r) || Format.isInteger(r)
                        || l instanceof Pointer
                        || l instanceof PointerToNamedType) {
                    retstatement = new Statement(new Return(
                                                     forcederef((Node) symbolTable.get(currentFunctionName.peek().toString()
                                                             + "$val"))));
                    if(processor.verbose) {
                        System.out.println("return statement =" + retstatement);
                    }
                }
            }
        }
        Statement  action;
        int        oldcalls      = callcount;
        action = new Statement(new Statement(block1(), new Statement(exit,
                                             retstatement)), null);
        String[]   dump          = {listCurrent()};
        action.setAnnotation(dump);
        boolean    leafproc      = (callcount == oldcalls);
        // System.out.println("block action="+action +"\n"+ callcount+
        // " "+oldcalls);
        if(leafproc) {
            action = registerOptimise((action));
        }
        // put 1 var in registers
        Block      bl            = new Block(action, (LocalStoreAllocator) allocatorStack.peek());
        // System.out.println("block ="+bl);
        return bl;
    }


    /**
     *  this attempts to put the most commonly used local variable in a location
     *  marked for register caching. It must only be called on the main statement
     *  of a procedure which contains no internal procedure calls.
     *
     *@param  s  Description of the Parameter
     *@return    Description of the Return Value
     */
    Statement registerOptimise(Statement s) {
        try {
            Dictionary  localscope  = symbolTable.getCurrentScope();
            s = registerOptimise(s, localscope, 1);
        }
        catch(Exception e2) {
            /*
             *  ignore it and return the original value
             */
        }
        return s;
    }


    final static int regoptdepth = 2;


    /**
     *  Description of the Method
     *
     *@param  s           Description of the Parameter
     *@param  localscope  Description of the Parameter
     *@param  level       Description of the Parameter
     *@return             Description of the Return Value
     */
    Statement registerOptimise(Statement s, Dictionary localscope, int level) {
        if(level > regoptdepth) {
            return s;
        }
        String  mostfreqname  = findMostFrequentlyUsedVarIn(s, localscope);
        // System.out.println("in register optimise "+s+", most freq="+mostfreqname);
        Memref  mostfreq      = (Memref) localscope.get(mostfreqname);
        if(mostfreq != null) {
            try {
                if(mostfreqname.startsWith("$$disp")) {
                    // then it is a display and is already initialised
                    // it must be copied into a local and the local used instead
                    // of the display
                    // if a register is simply substituted for the original
                    // display we will
                    // be using an unitialised pointer
                    Node       newvar       = tempvar((ADDRESS));
                    s = (Statement) ExpressionSubstituter.substituteAwithBinC(
                            mostfreq, newvar, s);
                    Statement  initialised  = new Statement(new Assign(newvar,
                                                            new Deref(mostfreq)), s);
                    mostfreq = (Memref) newvar;
                    s = new Statement(initialised, null);
                }
                s.setLocal(mostfreq);
                localscope.remove(mostfreqname);
                s = registerOptimise(new Statement(s), localscope, level + 1);
                localscope.put(mostfreqname, mostfreq);
                // System.out.println(" ->"+s);
            }
            catch(Exception nnn) {
            }
        }
        return s;
    }


    /**
     *  Description of the Method
     *
     *@param  s  Description of the Parameter
     *@param  d  Description of the Parameter
     *@return    Description of the Return Value
     */
    String findMostFrequentlyUsedVarIn(Statement s, Dictionary d) {
        Enumeration  list      = d.keys();
        int          most      = 2;
        String       sentence  = s.toString();
        String       freq      = null;
        while(list.hasMoreElements()) {
            Object  key       = list.nextElement();
            Object  element   = d.get(key);
            String  selement  = element.toString();
            String  full      = sentence;
            int     count     = 0;
            int     pos       = 0;
            while((pos = full.indexOf(selement, 0)) > 0 && (count < 10)) {
                count++;
                full = full.substring(pos + 1 + selement.length());
            }
            if(count > most) {
                most = count;
                freq = key.toString();
            }
        }
        return freq;
    }


    /**
     *  label-declaration: label unsigned-integer label-declaration ,
     *  unsigned-integer
     *
     *@exception  SyntaxError  Description of Exception
     */

    public void label_declaration() throws SyntaxError {
        mustbe(lex.TT_NUMBER);
        Label  l  = new Label();
        symbolTable.put(labname(lex.theNumber), l);
        symbolTable.put("levelof" + l, new Int(lexicalLevel));
        if(have(',')) {
            label_declaration();
        }
    }


    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@param  newln            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node fwritelist(Node filevar, boolean newln) throws SyntaxError {
        // System.out.println("fwritelist("+filevar+","+newln+")");
        try {
            Type  t  = getType(forcederef(filevar));
            if(t instanceof PascalFileType) {
                if(have(',')) {
                    return writelist(filevar, newln);
                }
                if(newln) {
                    return callWriteln(filevar);
                }
                error("Write statment had no parameters after file parameter");
                return null;
            }
            else {
                return writelisttail(filevar, null, newln);
            }
        }
        catch(Exception ex) {
            error("in write statement " + ex.getMessage());
        }
        return null;
    }


    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@param  newln            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node freadlist(Node filevar, boolean newln) throws SyntaxError {
        try {
            Type  t  = getType(forcederef(filevar));
            // System.out.println(t);
            if(t instanceof PascalFileType) {
                // System.out.println("read a file ");
                if(have(',')) {
                    return readlist(filevar, newln);
                }
                if(newln) {
                    return callReadln(filevar);
                }
                error("Read statment had no parameters after file parameter");
                return null;
            }
            else {
                return readlisttail(filevar, null, newln);
            }
        }
        catch(Exception ex) {
            error("in read statement " + ex.getMessage());
        }
        return null;
    }


    /**
     *  The indices used in for loops when printing arrays
     */
    Node[] writeindices = new Node[maxdims];

    /**
     *  the maximum rank of array found in an expression
     */
    int maxRank = 0;

    /**
     *  the array with the greatest rank in an expression
     */
    Node maxRankArray = null;


    /**
     *  writelist: writeexpression| writeexpression,writelist| ) <p>
     *
     *  where writeexpression takes the forms e or e:e1 or e:e1:e2 where e,e1,e2
     *  are expressions.
     *
     *@param  filevar          Description of Parameter
     *@param  newln            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    public Node writelist(Node filevar, boolean newln) throws SyntaxError,
        TypeIdError {
        maxRank = 0;
        inIOlist=true;
        Node  e  = expression(0, writeindices.length, writeindices);
        inIOlist=false;
        return writelisttail(e, filevar, newln);
    }
    boolean inIOlist=false;
    void checkIfDescriptorsAllowed()throws SyntaxError {
        if(inIOlist) {
            String s=("partial array indexing not implemented in context of I/O statements\n\n"+
                      "\t You can only transfer entire arrays or scalars.\n"+
                      "\t If you need to transfer part of an array pass \n\t the array slice as an actual parameter to\n"+
                      "\t a procedure and  then do the IO within the procedure. \n\t In the context of which procedure \n"+
                      "\t the formal parameter will count as an entire array.");
            error(s);
        }
    }
    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@param  newln            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    public Node readlist(Node filevar, boolean newln) throws SyntaxError,
        TypeIdError {
        inIOlist=true;
        Node  e  = variable(0, writeindices.length, writeindices);
        inIOlist=false;
        e = derank(e, writeindices.length, writeindices,0);
        return readlisttail(e, filevar, newln);
    }


    /**
     *  This casts all int types to the standard int representation
     *
     *@param  e                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node castToStandard(Node e) throws SyntaxError {
        Type    T  = getType(e);
        if(T.equals(BOOLEAN) & T instanceof OrdinalType) {
            return e;
        }
        if(T == (CHAR)) {
            return e;
        }
        if(isPixel(T)) {
            return pixel2real(e);
        }
        String  t  = e.returnType();
        if(t.equals("int8") || t.equals("int16") || t.equals("uint8")
                || t.equals("uint16")) {
            e = new TypeTag(e, INTEGER);
        }
        return e;
    }
    /** only pixels and reals allow interpolation, only allow these in fields */
    boolean isAValidFieldElement(Type t) {
        if(t instanceof IntegralType) return true;
        if(t instanceof RealType) return true;
        return false;
    }
    Vector<ForwardProc> currentVmt = new Vector<ForwardProc>();
    void addToVmt(ForwardProc p, Object dynamicKey) {
        currentVmt.add(p);
        p.vmtIndex=currentVmt.size()-1;
        p.vmtDynamicIndex=dynamicKey;
    }
    /** the class stack keeps a record on the classes we are currently
     * embedded in whilst parsing , it holds the types of pointers
     * to classtypes*/
    public Stack<Pointer> classStack=new Stack<Pointer>();
    ClassType objtype = new ClassType(processor,this);
    /** tthis parses a list of identifiers separated by commas **/
    ClassType[] heritage()throws SyntaxError {
        Vector<ClassType> types=new Vector<ClassType>();
        Stack s= new Stack();
        variableid_list(s);
        String id="";
        for(Object o:s)try {
                id = o.toString();
                Object a=symbolTable.get(id);
                if(a instanceof Pointer) a= ((Pointer)a).pointsTo;
                if(!(a instanceof ClassType))error(id+ " not a class but a "+a);
                types.add((ClassType)a);
            }
            catch(Exception e) {
                error(id+" not a class name "+e);
            }
        ClassType t[]= {};
        return types.toArray(t);
    }
    public  static final int PUBLIC =0;
    public  static final int PROTECTED=1;
    /** This parses a list of fiels declarations,
     * and, method or constructor declarations
     * */
    public long   componentlist(Vector components,   long predefinedsize,int protstatus)
    throws SyntaxError {
        long start=predefinedsize;
        //System.out.println("call componentlist predefined "+predefinedsize);
        long  f  =0;
        if(have("procedure")) {
            proc_or_fn(false, false, true,true);
            f = componentlist(components,   start,protstatus) ;
        }
        else if(have("pure")) {
            mustbe("function");
            proc_or_fn(true, true, true,true);
            f = componentlist(components,   start,protstatus) ;
        }
        else if(have("function")) {
            proc_or_fn(false, true, true,true);
            f = componentlist(components,   start,protstatus) ;
        }
        else if(have("PUBLIC")) {
            return componentlist(components,start,PUBLIC);
        }
        else if(have("PROTECTED")) {
            return componentlist(components,start,PROTECTED);
        }
        else if(have("VIRTUAL")) {
            if(have(';'))return componentlist(components,   start,protstatus) ;
        }
        else f= recordfield(components, (int)start)+start;
        if(lex.have(';')) {
            f = componentlist(components,   f,protstatus) ;
        }
        return f;
    }
    /**
     *  structured-type: array [ index-list ] of type | record field-list end | set
     *  of simple-type | file of type | packed structured-type
     *
     *@param  packed           does nothing at present
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */

    public Type structured_type(boolean packed) throws SyntaxError {
        if(have("SET")) {
            mustbe("OF");
            Type  t  = type();
            if(!(t instanceof ScalarRange)) {
                // check that < is defined on the type
                if(lessThanDefined(t)) {
                    // parameterise the code for this type of set
                    // enterScope();
                    Node[]      params  = {t};
                    wholeProgram = new Statement(includeUnit("genericset",
                                                 params), wholeProgram);
                    Dictionary  d       = symbolTable.getCurrentScope();
                    leaveScope();
                    SetType     t1      = new SetType(t, d,addrtype);
                    // test the identifiers are there
                    if(getid(t1.symbolTable, "genericsetsingleton") == null) {
                        error("genericsetsingleton not found in " + t1);
                    }
                    return t1;
                }
                error("operators < and = must be defined on elements of a set");
            }
            /*
             *  if(((ScalarRange)t).bottom()<0)
             *  error("Set elements can not be negative ");
             */
            if(t instanceof OrdinalType) {
                return new SetType((OrdinalType) t);
            }
            return new SetType((IntegralType) t);
        }
        if(have("RECORD")) {
            if(recordLevel == 0) {
                recordEnclosingScope = symbolTable.getCurrentScope();
            }
            recordLevel++;
            symbolTable.enterScope();
            Vector  variants  = new Vector();
            Vector  fixed     = new Vector();
            int     size      = fieldlist(fixed, variants, 0);
            mustbe("END");
            recordLevel--;
            return new RecordType(size, fixed, variants, symbolTable.popscope());
        }
        if(have("CLASS")) {
            ClassType [] herit= {objtype};
            Pointer cp = new Pointer(ANY,processor);
            classStack.push(cp);
            if(have("(")) {
                herit=heritage();
                mustbe(")");
            }
            recordLevel++;
            symbolTable.enterScope();
            /* inherit all the fields methods etc of the ancestor */
            Vector  components     = new Vector();
            if(herit.length>0) {
                components.addAll(herit[0].fixedpart);
                symbolTable.putAll((Hashtable)herit[0].lookuptable);
            }
            long prior =(herit.length>0)?  herit[0].size:processor.getAddressLenInBytes();
            long    size      = componentlist(components, prior,PUBLIC);
            // System.out.println("prior="+prior+"total size="+size);
            mustbe("END");
            recordLevel--;
            cp.pointsTo=(new ClassType(size, components, herit,  symbolTable.popscope(),this));
            classStack.pop();
            return cp;
        }
        if(have("ARRAY")) {
            if(have('[')) {
                // standard pascal array declaration
                long[][]  indices  = index_list();
                mustbe(']');
                mustbe("of");
                Type      t        = type();
                return new ArrayType(indices, t, (int) t.sizeOf(processor));
            }
            else {
                // it is a delphi style dynamic array type
                ArrayType  at  = mkDynamicArrayType(1);
                at.setStaticBound(0, 0, 0);
                return at;
            }
        }
        if(have("FILE")) {
            Type  elem  = CHAR;
            if(have("OF")) {
                elem = type();
            }
            return new PascalFileType(elem);
        }
        if(have("STRING")) {
            try {
                Node  e  = new Int(maxstring);
                if(have('[')) {
                    e = constant(false).eval();
                    mustbe(']');
                    if(!(e instanceof Int)) {
                        error("string length must be an integer");
                    }
                }
                else
                    // use iso syntax
                    if(have('(')) {
                        e = constant(false).eval();
                        mustbe(')');
                        if(!(e instanceof Int)) {
                            error("string length must be an integer");
                        }
                    }
                int   i  = ((Int) e).intValue();
                if(i < 1) {
                    error("string length too short");
                }
                if(i > maxstring) {
                    error("string length too long");
                }
                return new StringType(i, processor);
            }
            catch(TypeIdError te) {
                error(te.toString() + " is not a constant expression");
            }
        }
        mustbe("PACKED");
        return structured_type(true);
    }


    /**
     *  index-list: simple-type | index-list , simple-type This returns the array
     *  indices as pairs of lower, upper bounds
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public long[][] index_list() throws SyntaxError {
        Type         t    = simple_type();
        if(!(t instanceof ScalarRange)) {
            error("type not scalar range ");
        }
        ScalarRange  ft   = (ScalarRange) t;
        long[][]     res  = new long[1][2];
        if(have(',')) {
            long[][]  therest  = index_list();
            res = new long[1 + therest.length][2];
            for(int i = 0; i < therest.length; i++) {
                res[i + 1] = therest[i];
            }
        }
        res[0][0] = ft.bottom();
        res[0][1] = ft.top();
        return res;
    }


    /**
     *  parameters: ( formal-parameter-list )
     *
     *@param  params           Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    public void parameters(Vector params) throws SyntaxError {
        formal_parameter_list(params);
        mustbe(')');
    }


    /**
     *  formal-parameter-list: formal-parameter-section formal-parameter-list ; <p>
     *
     *  formal-parameter-section formal-parameter-section: parameterid-list : <p>
     *
     *  typeid var parameterid-list : typeid <P>
     *
     *  procedure identifier parametersopt <p>
     *
     *  function identifier parametersopt : typeid <p>
     *
     *  Note that var params are indicated by having ref types, others have non ref
     *  types
     *
     *@param  params           vector to hold the paramertypes found
     *@exception  SyntaxError  Description of Exception
     */

    public void formal_parameter_list(Vector params) throws SyntaxError {
        int        maxparams      = 50;
        Stack      v              = new Stack();
        Stack      types          = new Stack();
        Hashtable  protectedvars  = new Hashtable();
        int        vcount         = 0;
        do {
            boolean  isprotected  = have("PROTECTED");
            if(have("pure")) {
                mustbe("function");
                mustbe(lex.TT_IDENTIFIER);
                String  fnname  = lex.theId;
                Type    ft      = new Ref(proc_or_fn_type(true, true));
                v.push(fnname);
                types.push(ft);
                params.addElement(ft);
                vcount++;
            }
            else if(have("function")) {
                mustbe(lex.TT_IDENTIFIER);
                String  fnname  = lex.theId;
                Type    ft      = new Ref(proc_or_fn_type(false, true));
                v.push(fnname);
                types.push(ft);
                params.addElement(ft);
                vcount++;
            }
            else if(have("procedure")) {
                mustbe(lex.TT_IDENTIFIER);
                String  pname  = lex.theId;
                Type    pt     = new Ref(proc_or_fn_type(false, false));
                // System.out.println("pname="+pname+"pt="+pt);
                v.push(pname);
                types.push(pt);
                params.addElement(pt);
                vcount++;
            }
            else {
                boolean  isvar   = have("VAR");
                boolean  isproc  = false;
                int      count   = 1;
                mustbe(lex.TT_IDENTIFIER);
                vcount++;
                String   nom     = "";
                v.push(nom = lex.theId);
                if(isprotected) {
                    protectedvars.put(nom, nom);
                }
                while(have(',')) {
                    mustbe(lex.TT_IDENTIFIER);
                    count++;
                    vcount++;
                    v.push(nom = lex.theId);
                    if(isprotected) {
                        protectedvars.put(nom, nom);
                    }
                }
                Type     t       = ANY;
                if(!isvar) {
                    mustbe(':');
                    t = type();
                    if(t instanceof ArrayType) {
                        if(((ArrayType) t).isDynamic) {
                            error("dynamic arrays must be passed by reference as var parameters");
                        }
                    }
                }
                else if(have(':')) {
                    t = type();
                }
                // all vars are of ref type
                // t=new Ref(t);
                // pass by ref ones have two levels of ref
                if(isvar) {
                    t = new Ref(t);
                }
                while(count > 0) {
                    types.push(t);
                    params.addElement(t);
                    count--;
                }
            }
        }
        while(have(';'));
        String[]   names          = new String[vcount];
        Type[]     ts             = new Type[vcount];
        int        p              = vcount;
        try {
            // declare the parameter list in the correct order
            // since the parameters have been stacked they are in the wrong
            // order
            while(!types.empty()) {
                p--;
                Type    t1    = (Type) types.pop();
                String  name  = (String) v.pop();
                names[p] = name;
                ts[p] = t1;
                // System.out.println(name+":"+t1.codeGenRepresentation(processor));
            }
            for(p = 0; p < vcount; p++) {
                declareParam(names[p], ts[p]);
                if(protectedvars.containsKey(names[p])) {
                    Object  var  = symbolTable.get(names[p]);
                    if(var instanceof Variable) {
                        ((Variable) var).Protected = true;
                    }
                }
            }
        }
        catch(Exception e1) {
            error(" in formal parameter list " + e1.toString());
        }
    }


    /**
     *  Generate array subscripting code of the simplest type
     *
     *@param  n                variable being subscripted
     *@param  e                index
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node subscript(Node n, Node e) throws SyntaxError {
        Node  res  = null;
        if(n == null) {
            error("null base variable in subscript");
        }
        if(e == null) {
            error("null offset expression in subscript");
        }
        try {
            // System.out.println("subscript("+n+","+e+")");
            Type       t         = (Type) getType(n);
            // boolean isrefparam=t instanceof Ref;
            // System.out.println(t);
            if(t instanceof Ref) {
                t = ((Ref) t).pointsTo;
            }
            if(!(t instanceof ArrayType)) {
                error("not an array, cant subscript or subscript by " + lex.theString + ":" + t +
                      "\n N.B. the variable in question may be being used to attempt direct or indirect subscription of a pointer");
            }
            ArrayType  at        = (ArrayType) t;
            // System.out.println(" of "+at.elemtype);
            // compute how big the array elements are
            int        elemsize  = at.elemsize(processor);
            Node       es        = new ilcg.tree.Int(elemsize, intrep);
            Node       addrn     = getAddr(n);
            Node [] indices = {e};
            // res=at.indexArray(addrn,indices);
            // System.out.println("base address="+addrn);
            /*
             *  rewritten to use dyad routines for types
             */
            res = (new Memref(
                       dyad(
                           dyad(new Cast(processor.getAddressType(),addrn),
                                new ilcg.tree.Int(-1 * at.indices[0][0] * elemsize,processor.getAddressType()),
                                "+"),
                           dyad(forcederef(e,ADDRESS), es, "*"),
                           "+"),
                       "ref "	 + at.elemtype.codeGenRepresentation(processor))).eval();/* */
            if(processor.verbose) {
                System.out.println("before type tagging res=" + res);
            }
            res = new TypeTag(res, new Ref(at.subscriptedType()));
            if(processor.verbose) {
                System.out.println(res);
            }
        }
        catch(Exception oops) {
            error("Subscription error " + oops);
        }
        return res;
    }


    Node lastarray = null;


    /**
     *  If the indices list contains an array value flatten that to expand the list
     *
     *@param  indices          Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node[] flattenIndices(Node[] indices) throws SyntaxError {
        if(processor.verbose) {
            System.out.println("flatten indices, length=" + indices.length);
        }
        Vector    ind         = new Vector();
        for(int i = 0; i < indices.length; i++) {
            try {
                Node  v  = forcederef(indices[i]);
                Type  T  = getType(v);
                if(processor.verbose) {
                    System.out.println("type " + T);
                }
                if(T instanceof ArrayType) {
                    int  r  = getRank(v);
                    if(processor.verbose) {
                        System.out.println("Rank at position " + i + "=" + r);
                    }
                    if(r > 1) {
                        error("Indexing by multidimensional arrays prohibited");
                    }
                    if(r == 1) {
                        ArrayType  t    = (ArrayType) getType(v);
                        if(t.isDynamic) {
                            error("Indexing by dynamic arrays prohibited");
                        }
                        long       low  = t.indices[0][0];
                        long       hi   = t.indices[0][1];
                        for(long c = low; c <= hi; c++) {
                            Node[]  indin  = {new Int(c, "int32")};
                            if(processor.verbose) {
                                System.out.println(" add in index " + c);
                            }
                            ind.add(subscript(v, indin));
                        }
                    }
                }
                else {
                    ind.add(v);
                }
            }
            catch(Exception eee) {
                error("Attempting to flatten index " + i + "\n" + eee);
            }
        }
        Object[]  oa          = ind.toArray();
        Node[]    newindices  = new Node[oa.length];
        for(int j = 0; j < oa.length; j++) {
            newindices[j] = (Node) oa[j];
        }
        return newindices;
    }


    /**
     *  Find the variable in being derefed an expression
     *
     *@param  indexvar  Description of the Parameter
     *@return           Description of the Return Value
     */
    Node underef(Node indexvar) {
        if(indexvar instanceof Deref) {
            return ((Deref) indexvar).getArg();
        }
        if((!Format.isRef(indexvar.returnType())) && indexvar instanceof Cast) {
            return underef(((Cast) indexvar).getSubtree());
        }
        return indexvar;
    }


    /**
     *  Description of the Method
     *
     *@param  c  Description of the Parameter
     */
    void listcollection(Collection c) {
        Object[]  a  = c.toArray();
        for(int i = 0; i < a.length; i++) {
            System.out.println(a[i].toString());
        }
    }


    /**
     *  Generate array subscripting code using a sequence of indices
     *
     *@param  n                variable to subscript
     *@param  e                the indices
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node subscript(Node n, Node[] e) throws SyntaxError {
        if(processor.verbose) {
            String  s  = n.toString() + "<<";
            for(int k = 0; k < e.length; k++) {
                s = s + e[k] + " ,";
            }
            System.out.println(s + ">>");
        }
        Statement  temp_pre  = prestatement;
        if(e.length > 1 && unrollsubscription) {
            try {
                Node[]  e2          = {e[0]};
                Node[]  e3          = new Node[e.length - 1];
                for(int i = 0; i < e3.length; i++) {
                    e3[i] = e[i + 1];
                }
                Node    firstlevel  = subscript(n, e2);
                Node    tmp         = tempvar(
                                          /*
                                           *  new Ref
                                           */
                                          (getType(firstlevel)));
                postPrestatement(new Assign(tmp, firstlevel));
                return subscript(tmp, e3);
                // return subscript(firstlevel,e3);
            }
            catch(Exception ex) {
                if(processor.verbose) {
                    System.out.println("in subscription " + ex);
                }
                prestatement = temp_pre;
            }
        }
        boolean    list      = lex.lineno() >= Walker.switchon
                               && lex.lineno() <= Walker.switchoff;
        lastarray = n;
        e = flattenIndices(e);
        try {
            checkdatahazards(n, e);
        }
        catch(Exception err) {
            error("checking data hazards" + err);
        }
        Node     res       = null;
        if(n == null) {
            error("null base variable in subscript");
        }
        if(e == null) {
            error("null offset expression in subscript");
        }
        if(e.length < 9) {
            try {
                if(list) {
                    System.out.println("subscript " + n + ", with " + e.length
                                       + " indices");
                }
                Type       t           = (Type) getType(n);
                // boolean isrefparam=t instanceof Ref;
                if(list) {
                    System.out.println("in subscript " + t + "[" + e[0] + "] ");
                }
                if(t instanceof Ref) {
                    t = ((Ref) t).pointsTo;
                }
                if(!(t instanceof ArrayType)) {
                    error("not an array, cant subscript or subscript by " + lex.theString + ":" + t+ "::"+t.getClass()
                          + "\nby " + e+
                          "\n N.B. the variable in question may be being used to attempt direct or indirect subscription of a pointer");
                }
                ArrayType  at          = (ArrayType) t;
                int        theRank     = getRank(at);
                for(int i = 0; i < e.length; i++) {
                    // record the bounds for use in any reduction expressions
                    Node  indexvar  = e[i];
                    Node  an        = getAddr(n);
                    Node  lwb       = at.getLwb(i, an);
                    reductionLwb.put(indexvar.toString(), lwb);
                    Node  upb       = at.getUpb(i, an);
                    reductionUpb.put(indexvar.toString(), upb);
                    if(list) {
                        System.out.println(" in subscript reductionupb("
                                           + indexvar + ") set to " + upb);
                    }
                }
                if(processor.verbose) {
                    System.out.println("rank " + at.rank());
                }
                if(lex.rangechecks) {
                    // process the indices and plant checking code for each one
                    for(int i = 0; i < e.length; i++) {
                        Node       an        = getAddr(n);
                        if(list) {
                            System.out.println("base= " + an);
                        }
                        Node       indexvar  = underef(e[i]);
                        boolean[]  tests     = {false, false};
                        if(processor.verbose) {
                            System.out.println(indexvar);
                        }
                        Node       lwb       = at.getLwb(i, an);
                        Node       upb       = at.getUpb(i, an);
                        //System.out.println("indexvar ="+indexvar);
                        //listcollection(iteratorset.keySet());
                        if(iteratorset.containsKey(indexvar)) {
                            Vector[]  boundset  = (Vector[]) iteratorset.get(indexvar);
                            Vector    low       = boundset[0];
                            Vector    hi        = boundset[1];
                            // System.out.println("iteratorset contains indexvar lwb="+lwb+" low ="+low);
                            if(lwb.knownAtCompileTime()
                                    // && arrayiteratorset.containsKey(indexvar)
                              ) {
                                if(!low.contains(lwb)) {
                                    low.addElement(lwb);
                                }
                                tests[0] = true;
                            }
                            if(upb.knownAtCompileTime()
                                    //&& arrayiteratorset.containsKey(indexvar)
                              ) {
                                if(!hi.contains(upb)) {
                                    hi.addElement(upb);
                                }
                                tests[1] = true;
                            }
                        }
                        //System.out.println(tests[0]+" "+tests[1]);
                        if(!tests[0] && !tests[1]) {
                            postPrestatement(new If(at.getBoundsFaultCondition(
                                                        i, an, new TypeTag(forcederef(e[i]),
                                                                ADDRESS)), boundserr()));
                        }
                        else if(!tests[0]) {
                            postPrestatement(new If(dyad(new TypeTag(indexvar,
                                                         INTEGER), new TypeTag(lwb, INTEGER), "<"),
                                                    boundserr(indexvar, lwb, upb)).eval());
                        }
                        else if(!tests[1]) {
                            postPrestatement(new If(dyad(new TypeTag(upb,
                                                         INTEGER), new TypeTag(indexvar, INTEGER),
                                                         "<"), boundserr(indexvar, lwb, upb)).eval());
                        }
                    }
                }
                Node[]     newindices  = new Node[e.length];
                for(int i = 0; i < e.length; i++) {
                    Node derefed;
                    /*
                     *  dereferences are now being typed to the ADDRESS type
                     *  rather than INTEGER which is by default int32. On larger,
                     *  and smaller address architectures, this will now supply
                     *  the correct address
                     */
                    newindices[i] = new TypeTag(derefed=forcederef(e[i]), ADDRESS);
                    if(Format.isReal(derefed.returnType()))System.out.println("\n"+lex.lineno()+" Warning, rounding a real valued array index\n");
                    /*
                     *  INTEGER is int32, not address width newindices[i] = new
                     *  TypeTag(forcederef(e[i]),INTEGER);
                     */
                    if(list) {
                        System.out.println(" index " + i + "=" + newindices[i]);
                    }
                }
                if(e.length == at.rank()) {
                    // complete indexing of array
                    // res = at.indexArray(getAddr(n), newindices);
                    if(list) {
                        System.out.println("get array address for " + n);
                    }
                    res = new ArraySubscription(at, getAddr(n), newindices);
                    res = new TypeTag(res, new Ref(at.elemtype));
                    if(list) {
                        System.out.println("Subscripted to ->" + res);
                    }
                }
                else {
                    // partial indexing
                    if(list) {
                        System.out.println("partial indexing ");
                    }
                    checkIfDescriptorsAllowed();
                    Node[]     descriptorvalues  = at.createSubArrayDescriptor(
                                                       getAddr(n), newindices);
                    if(list) {
                        for(int j = 0; j < descriptorvalues.length; j++) {
                            System.out.println("desc " + j + " "
                                               + descriptorvalues[j]);
                        }
                    }
                    ArrayType  at2               = new ArrayType(at, at.rank() - e.length);
                    if(!at2.isDynamic) {
                        if(list) {
                            System.out.println("not dynamic descriptor[0]="
                                               + descriptorvalues[0]);
                        }
                        Type  newt  = new Ref(at2);
                        if(list) {
                            System.out.println(" newt =" + newt + " newt.type="
                                               + newt.type);
                        }
                        if(!(descriptorvalues[0] instanceof Memref)) {
                            res = new TypeTag(new Memref(descriptorvalues[0],
                                                         newt.codeGenRepresentation(processor)),
                                              newt);
                        }
                        else {
                            res = new TypeTag(descriptorvalues[0], new Ref(at2));
                        }
                    }
                    else {
                        //
                        Node  v2       = tempvar(at2);
                        if(list) {
                            System.out.println("v2=" + v2);
                        }
                        res = v2;
                        Node  va       = getAddr(v2);
                        if(processor.verbose) {
                            System.out.println("va=" + va);
                        }
                        Node  descini  = null;
                        for(int j = 0; j < descriptorvalues.length; j++) {
                            if(descriptorvalues[j] != null) {
                                // initialise the descriptor
                                Node       ass;
                                Statement  step  = new Statement(
                                    ass = new Assign(
                                    new Memref(new Dyad(va,
                                                        new Int(j * addrlength,
                                                                intrep), "+"),
                                               addrtype),
                                    descriptorvalues[j]));
                                postPrestatement(step);
                            }
                        }
                    }
                }
            }
            catch(Exception oops) {
                error(" array subscription error, " + oops);
            }
        }
        else {
            // more than 2 indices
            // break it down into two steps
            try {
                Node[]  nindices  = new Node[e.length - 1];
                Node[]  single    = new Node[1];
                single[0] = e[e.length - 1];
                for(int i = 1; i < e.length; i++) {
                    // nindices[i-1] = new TypeTag(forcederef(e[i-1]),INTEGER);
                    nindices[i - 1] = e[i - 1];
                }
                res = subscript(subscript(n, nindices), single);
            }
            catch(Exception eee) {
                error("in subscription of array " + eee);
            }
        }
        lastarray = n;
        return res;
    }


    /**
     *  Most complex form of array subscription where subscription is done using
     *  subranges or pairs of values to give sub arrays , always creates a new
     *  descriptor
     *
     *@param  n                Description of the Parameter
     *@param  e                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */

    public Node subscript(Node n, Node[][] e) throws SyntaxError {
        if(processor.verbose) {
            String  s  = n.toString() + "[";
            for(int k = 0; k < e[0].length; k++) {
                s = s + e[0][k] + ".." + e[1][k] + " ,";
            }
            System.out.println(s + "]");
        }
        Node  res  = null;
        if(n == null) {
            error("null base variable in subscript");
        }
        if(e == null) {
            error("null offset expression in subscript");
        }
        try {
            Type       t           = (Type) getType(n);
            // boolean isrefparam=t instanceof Ref;
            if(t instanceof Ref) {
                t = ((Ref) t).pointsTo;
            }
            if(!(t instanceof ArrayType)) {
                error("not an array, cant subscript " + lex.theString + "<"+n+">" + ":" + t + "\nby "
                      + e+
                      "\n N.B. the variable in question may be being used to attempt direct or indirect subscription of a pointer");
            }
            ArrayType  at          = (ArrayType) t;
            for(int j = 0; j < 2; j++) {
                for(int i = 0; i < e[0].length; i++) {
                    // record the bounds for use in any reduction expressions
                    Node  indexvar  = e[j][i];
                    if(indexvar instanceof Deref) {
                        indexvar = ((Deref) indexvar).getArg();
                    }
                    Node  an        = getAddr(n);
                    Node  lwb       = at.getLwb(i, an);
                    reductionLwb.put(indexvar.toString(), lwb);
                    Node  upb       = at.getUpb(i, an);
                    reductionUpb.put(indexvar.toString(), upb);
                }
            }
            if(lex.rangechecks) {
                // process the indices and plant checking code for each one
                for(int j = 0; j < 2; j++) {
                    for(int i = 0; i < e[0].length; i++) {
                        Node     an        = getAddr(n);
                        Node     indexvar  = e[j][i];
                        if(indexvar instanceof Deref) {
                            indexvar = ((Deref) indexvar).getArg();
                        }
                        boolean  testdone  = false;
                        // System.out.println(indexvar);
                        if(iteratorset.containsKey(indexvar)) {
                            // System.out.println("In iterator set");
                            Vector[]  boundset  = (Vector[]) iteratorset.get(indexvar);
                            Vector    low       = boundset[0];
                            Vector    hi        = boundset[1];
                            Node      lwb       = at.getLwb(i, an);
                            Node      upb       = at.getUpb(i, an);
                            if(lwb.knownAtCompileTime()
                                    && upb.knownAtCompileTime()) {
                                if(!low.contains(lwb)) {
                                    low.addElement(lwb);
                                }
                                if(!hi.contains(upb)) {
                                    hi.addElement(upb);
                                }
                                testdone = true;
                            }
                        }
                        if(!testdone) {
                            postPrestatement(new If(at.getBoundsFaultCondition(
                                                        i, an, forcederef(e[j][i])), boundserr()));
                        }
                    }
                }
            }
            Node[][]   newindices  = new Node[2][e[0].length];
            for(int j = 0; j < 2; j++) {
                for(int i = 0; i < e[0].length; i++) {
                    newindices[j][i] = forcederef(e[j][i]);
                }
            }
            {
                // partial indexing
                checkIfDescriptorsAllowed();
                Node[]     descriptorvalues  = at.createSubArrayDescriptor(
                                                   getAddr(n), newindices);
                // ArrayType at2 = new ArrayType(
                // at.rank(),at.elemtype,at.elemsize() );
                ArrayType  at2               = new ArrayType(at, newindices);
                if(at2.isDynamic) {
                    Node  v2  = tempvar(at2);
                    if(processor.verbose) {
                        System.out.println("v2=" + v2);
                    }
                    res = v2;
                    Node  va  = getAddr(v2);
                    if(processor.verbose) {
                        System.out.println("va=" + va);
                    }
                    for(int j = 0; j < descriptorvalues.length; j++) {
                        checkIfDescriptorsAllowed();
                        // initialise the descriptor
                        Node  action  = new Assign(new Memref(new Dyad(va,
                                                              new Int(j * addrlength, Format.addressType),
                                                              "+"), Format.addressType), new Cast(Format.addressType, descriptorvalues[j]));
                        if(descriptorvalues[j].knownAtCompileTime()) {
                            // this
                            // seems
                            // to
                            // give
                            // bugs
                            // full descriptor only needed for procedure params
                            // if(expressionContext==paramContext)
                            postpreloop(action);
                        }
                        else {
                            postPrestatement(action);
                        }
                        if(processor.verbose) {
                            System.out.println("post " + action);
                        }
                    }
                    if(processor.verbose) {
                        System.out.println("descriptor initialised ");
                    }
                }
            }
            if(processor.verbose) {
                System.out.println(res);
            }
        }
        catch(Exception oops) {
            oops.printStackTrace();
            error("array subrange error, " + oops);
        }
        return res;
    }


    /**
     *  This method generates a new variable reference taking into account the
     *  differences between lexical levels of the variable and the current lexical
     *  level. If the current level is greater than the declared level it uses a
     *  display on the stack to access the variable.
     *
     *@param  v              Description of Parameter
     *@return                Description of the Returned Value
     *@exception  Exception  Description of Exception
     */
    /*
     *  ilcg.tree.
     */
    public Variable adjustLexLevel(
        /*
         *  ilcg.tree.
         */
        Variable v)
    throws Exception {
        // v.lexicalLevel <0 indicates a global stored in the data seg not the
        // stack
        if(lexicalLevel == v.lexicalLevel || v.lexicalLevel <= 0|| inUnit()) {
            return v;
        }
        String  refaddr  = "ref " + addrtype;
        Op      plus     = Op.sum(addrtype, addrtype, addrtype);
        // System.out.println("adjust ll "+v.lexicalLevel+" to current ll= "+lexicalLevel);
        String  dn       = "$$display" + v.lexicalLevel;
        Node    base     = (Node) symbolTable.get(dn);
        if(base == null) {
            error(dn + " not found at lexical level "+lexicalLevel);
        }
        ;
        v = (Variable) ExpressionSubstituter.substituteAwithBinC(processor.getFP(), base, v);
        // System.out.println("to "+v);
        return v;
    }


    /**
     *  Description of the Method
     *
     *@param  t  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean lessThanDefined(Type t) {
        if(t instanceof StringType) {
            return true;
        }
        try {
            Node  a  = new TypeTag(new Int(0), t);
            Node  b  = dyad(a, a, "<");
            b = dyad(a, a, "=");
        }
        catch(Exception e) {
            return false;
        }
        return true;
    }


    /**
     *  for-list: expression to expression |expression downto expression <p>
     *
     *  expression-list: expression| expression-list , expression <p>
     *
     *  label: unsigned-integer
     *
     *@exception  SyntaxError  Description of Exception
     */

    /**
     *  for-list: expression to expression expression downto expression
     *  expression-list: expression expression-list , expression label:
     *  unsigned-integer for-list: expression to expression expression downto
     *  expression <p>
     *
     *  expression-list: expression expression-list , expression <p>
     *
     *  label: unsigned-integer <p>
     *
     *  record-variable-list: variable |record-variable-list , variable <p>
     *
     *  This uses the integer recordNestingLevel to record how deep the record
     *  nesting is
     *
     *@exception  SyntaxError  Description of Exception
     */
    public void record_variable_list() throws SyntaxError {
        try {
            Node        n  = variable();
            recordNestingLevel++;
            Type        t  = getType(n);
            while(t instanceof Ref) {
                t = ((Ref) t).pointsTo;
            }
            if(!(t instanceof RecordType)) {
                error(" need a record variable here not " + t);
            }
            RecordType  r  = (RecordType) t;
            // if(false)
            try {
                Node  dn;
                Type  dnt;
                Node  nn   = tempvar(dnt = new Pointer(r, processor));
                postPrestatement(new Statement(new Assign(nn, dn = new TypeTag(
                    getAddr(n), dnt))));
                // System.out.println("n="+n+"\ndn="+dn+"\nnn="+nn+"\t="+t+"\ndnt="+dnt);
                n = nn;
            }
            catch(Exception eee) {
                error(" in with list " + eee);
            }
            symbolTable.enterScope(r.lookuptable);
            // for (Enumeration e = r.lookuptable.elements() ;
            // e.hasMoreElements() ;) {
            // System.out.println(e.nextElement());
            // }
            withTable.put(r, forcederef(n));
            if(have(',')) {
                record_variable_list();
            }
        }
        catch(TypeIdError te) {
            error("Type Identifier error " + te.toString());
        }
    }


    /**
     *  Description of the Method
     *
     *@param  t                Description of the Parameter
     *@param  operator         Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node identityElement(Type t, String operator) throws SyntaxError {
        if(t instanceof Ref && !(t instanceof Pointer)) {
            t = ((Ref) t).pointsTo;
        }
        // System.out.println("get identity element for "+t+","+operator);
        if(operator.equals("+") || operator.equals("-")
                || operator.equals("+:") || operator.equals("-:")) {
            if(t instanceof IntegralType) {
                return new Int(0, t.type);
            }
            if(t instanceof RealType) {
                return declareReal(0.0, t.type);
            }
            if(t instanceof SetType) {
                byte[]  prestate  = new byte[1 + (int) setAssignmentContext.length()];
                if(operator.equals("-")) {
                    for(int i = 0; i < prestate.length; i++) {
                        prestate[i] = -1;
                    }
                }
                return declareSet(prestate);
            }
            if(t instanceof StringType) {
                return plantString("");
            }
        }
        if(operator.equals("OR") && t.equals(BOOLEAN)) {
            return FALSE;
        }
        if(operator.equals("AND") && t.equals(BOOLEAN)) {
            return TRUE;
        }
        if(operator.equals("AND") && t instanceof IntegralType) {
            return new Int(-1, t.type);
        }
        if(operator.equals("OR") && t instanceof IntegralType) {
            return new Int(0, t.type);
        }
        if(operator.equals("XOR") && t instanceof IntegralType) {
            return new Int(0, t.type);
        }
        if((operator.equals("MOD") || operator.equals("mod")
                || operator.equals("REM") || operator.equals("rem"))
                && t instanceof IntegralType) {
            return new Int(1, t.type);
        }
        if(operator.equals("*") || operator.equals("/")
                || operator.equals("DIV") || operator.equals("div")
          ) {
            if(t instanceof IntegralType) {
                return new Int(1, t.type);
            }
            if(t instanceof RealType) {
                return declareReal(1.0, t.type);
            }
            if(t instanceof SetType) {
                byte[]  prestate  = new byte[1 + (int) setAssignmentContext.length()];
                for(int i = 0; i < prestate.length; i++) {
                    prestate[i] = -1;
                }
                return declareSet(prestate);
            }
        }
        if(operator.equals(Node.min)) {
            if(t instanceof OrdinalType) {
                return new Int(((OrdinalType) t).hi, t.type);
            }
            if(t instanceof IntegralType) {
                return new Int(((IntegralType) t).hi, t.type);
            }
            if(t instanceof RealType) {
                return declareReal(Float.MAX_VALUE, t.type);
            }
        }
        if(operator.equals(Node.max)) {
            if(t instanceof OrdinalType) {
                return new Int(((OrdinalType) t).low, t.type);
            }
            if(t instanceof IntegralType) {
                return new Int(((IntegralType) t).low + 1, t.type);
            }
            if(t instanceof RealType) {
                return declareReal(-Float.MAX_VALUE, t.type);
            }
        }
        return (getIdentity(operator, t));
    }


    /**
     *  expression: expression relational-op additive-expression |
     *  additive-expression <p>
     *
     *  Data parallelism handled by passing in rank, and index variables
     *  relational-op: one of < <= = <> => >
     *
     *@param  rank             holds the rank expected of the expression from
     *      context
     *@param  indices          hold the index variables to use to reduce the rank
     *      to 0
     *@param  validindices     Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */

    public Node expression(int rank, int validindices, Node[] indices)
    throws SyntaxError, TypeIdError {
        {
            // System.out.println("enter  exp");
            Node  e1  = simple_expression(rank, validindices, indices);
            if(processor.verbose) {
                System.out.println("additive exp=" + e1 + ":" + getType(e1));
            }
            if(have('<')) {
                return dyad(e1, expression(rank, validindices, indices), "<");
            }
            if(have(">=")) {
                return dyad(e1, expression(rank, validindices, indices), ">=");
            }
            if(have('>')) {
                return dyad(e1, expression(rank, validindices, indices), ">");
            }
            if(have("<=")) {
                return dyad(e1, expression(rank, validindices, indices), "<=");
            }
            if(have("<>")) {
                return dyad(e1, expression(rank, validindices, indices), "<>");
            }
            if(have('=')) {
                return dyad(e1, expression(rank, validindices, indices), "=");
            }
            if(have("min")) {
                return dyad(e1, expression(rank, validindices, indices),
                            Node.min);
            }
            if(have("max")) {
                return dyad(e1, expression(rank, validindices, indices),
                            Node.max);
            }
            if(have("IS")) {
                Type  t  = type();
                if(t instanceof Pointer)t=((Pointer)t).pointsTo;
                if(t instanceof ClassType)
                    try {
                        Node [] params= {e1,new TypeTag(((ClassType)t).vmtlab,POINTER)};
                        Node temp = tempvar(BOOLEAN);
                        postPrestatement(
                            new Statement(procCall("classis",params),
                                          new Statement(new Assign(temp, new Deref(processor.  functionRetReg(BOOLEAN.returnType()))))));
                        return new Deref(temp);
                    }
                    catch(Exception eis) {
                        error("in IS test "+eis);
                    }
                else error("right hand argument to IS should be a class type");
            }
            if(have("IN")) {
                try {
                    Node  e2  = expression(rank, validindices, indices);
                    return isinset(e1, e2, true);
                }
                catch(Exception err) {
                    error("in set membership test" + err);
                }
            }
            return e1;
        }
    }


    /**
     *  The version below handles evaluation of expressions with a required type it
     *  is used for parameter evaluation and forces the set assignment context to
     *  be the set type passed if this is a set
     *
     *@param  rank             Description of the Parameter
     *@param  validindices     Description of the Parameter
     *@param  indices          Description of the Parameter
     *@param  t                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    public Node expression(int rank, int validindices, Node[] indices, Type t)
    throws SyntaxError, TypeIdError {
        if(t instanceof SetType) {
            SetType  oldt  = setAssignmentContext;
            setAssignmentContext = (SetType) t;
            Node     e     = expression(rank, validindices, indices);
            setAssignmentContext = oldt;
            return e;
        }
        else {
            return expression(rank, validindices, indices);
        }
    }


    /**
     *  Description of the Method
     *
     *@param  l                Description of Parameter
     *@param  r                Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node olddyad(Node l, Node r, String op) throws SyntaxError {
        // System.out.println(" "+l+op+r);
        l = widenshorts(forcederef(l));
        r = widenshorts(forcederef(r));
        // System.out.println(" deref to "+l+op+r);
        String[]  t      = {l.returnType(), r.returnType()};
        Type[]    T      = {getType(l), getType(r)};
        String    rt     = t[1];
        String    lt     = t[0];
        Type      oldT0  = T[0];
        int       p1;
        int       p2;
        boolean   isvec  = false;
        boolean   isset  = false;
        // System.out.println(" "+T[0]+":"+lt+op+T[1]+":"+lt);
        // handle the case of them both being sets and rename the types
        if((T[0] instanceof SetType) && (T[1] instanceof SetType)) {
            isset = true;
            // System.out.println("is set "+l);
            if(op.equals("+")) {
                op = "OR";
            }
            else if(op.equals("*")) {
                op = "AND";
            }
            else if(op.equals("-")) {
                op = "AND";
                r = new TypeTag(monad(r, "NOT"), T[1]);
            }
            else {
                error(" operator " + op + " undefined on sets");
            }
        }
        else if((T[0] instanceof StringType) || (T[0] == (CHAR))
                || (T[1] instanceof StringType) || (T[1] == (CHAR))) {
            // handle string operations
            if(op.equals("+")) {
                op = "#";
            }
            for(int i = 0; i < 2; i++) {
                if(T[i] instanceof StringType) {
                    t[i] = "s";
                }
            }
        }
        else
            // handle the case of them both being arrays as general array op
            if((T[0] instanceof ArrayType) && (T[1] instanceof ArrayType)) {
                for(int i = 0; i < 2; i++) {
                    T[i] = ((ArrayType) T[i]).elemtype;
                    t[i] = T[i].type;
                }
                isvec = true;
            }
        Op        OP;
        // handle symetric operations
        if(T[0].equals(T[1])) {
            // generate indexing code to look up predefined operators
            for(int i = 0; i < 2; i++) {
                if(t[i].equals(intrep)) {
                    t[i] = "i";
                }
                else if(t[i].equals("uint16")) {
                    t[i] = "i";
                }
                else if(t[i].equals("int16")) {
                    t[i] = "i";
                }
                else if(t[i].equals("int64")) {
                    t[i] = "I";
                }
                else if(t[i].equals("uint32")) {
                    t[i] = "i";
                }
                else if(t[i].equals(realrep)) {
                    t[i] = "r";
                }
                else if(T[i] == (CHAR)) {
                    t[i] = "c";
                }
                else if(T[i] == (BOOLEAN)) {
                    t[i] = "b";
                }
                else if(t[i].equals("int8")) {
                    t[i] = "i";
                }
                else if(t[i].equals("uint8")) {
                    t[i] = "i";
                }
                else if(t[i].equals("RANGE")) {
                    t[i] = "R";
                }
                else if(T[i] instanceof StringType) {
                    t[i] = "s";
                }
            }
            String  code  = op + t[0] + t[1];
            Object  oper  = preDeclaredOperators.get(code);
            if(oper == null) {
                error(" code=" + code + "\n" + "incompatible types for " + op
                      + "  i.e.   (" + T[0] + "," + T[1] + ") in\n " + l + op
                      + r);
            }
            // OP= new Op(op,lt,rt,lt);
            TOP     top   = (TOP) oper;
            OP = top.oper;
            // System.out.println(code+OP.Returns);
            try {
                // if it is a vector construct new operator on the fly
                // if they are strings cast them to ensure that they pass
                // through the code generator without it rejecting them for
                // being vectors of inconsistent length
                Node  res  = new ilcg.tree.Dyad((t[0].equals("s") ? new Cast(
                                                     stringTok, l) : l), (t[1].equals("s") ? new Cast(
                                                             stringTok, r) : r), (isvec ? new Op(op, lt, lt, lt)
                                                                     : OP));
                if(isset) {
                    res = new TypeTag(res, T[0]);
                }
                else if(isvec) {
                    res = new TypeTag(res, oldT0);
                }
                // else if(isvec)res=res;
                // else res=new TypeTag(res,top.Returns);
                return res;
            }
            catch(Exception ex2) {
                error("type exception in Dyad " + ex2);
            }
        }
        else if(t[0].startsWith("ref ")) {
            return dyad(new Deref(l), r, op);
        }
        else if(t[1].startsWith("ref ")) {
            return dyad(l, new Deref(r), op);
        }
        else if(rt.equals(realrep)) {
            return dyad(new Cast(realrep, floatit(l)), r, op);
        }
        else if(lt.equals(realrep)) {
            return dyad(l, new Cast(realrep, floatit(r)), op);
        }
        else if(rt.equals(intrep)) {
            return dyad(widenit(l), r, op);
        }
        else if(lt.equals(intrep)) {
            return dyad(l, widenit(r), op);
        }
        else if(lt.equals(charrep)) {
            return dyad(tostring(l), r, op);
        }
        else if(rt.equals(charrep)) {
            return dyad(l, tostring(r), op);
        }
        else {
            error("incompatible types for " + op + " i.e.   " + T[0] + ","
                  + T[1] + "in\n" + l + op + r, lex.lineno());
        }
        return null;
    }


    /**
     *  converts a character expression to a string value on the stack
     *
     *@param  c1               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node tostring(Node c1) throws SyntaxError {
        // System.out.println("tostring("+c1+":"+getType(c1)+")");
        Node  c  = forcederef(c1.eval());
        Type  t  = getType(c);
        if(t.equals(CHAR)) {
            Node  C  = c;
            while(C instanceof Cast) {
                C = ((Cast) C).subtree;
            }
            if(C.knownAtCompileTime()) {
                return plantString("" + (char)((Number) C).intValue());
            }
            try {
                Node  v         = tempvar(STRING1);
                Node  set2one   = new Assign(subscript(v, new Int(0)), new Int(1,
                                             charrep));
                Node  setfirst  = new Assign(subscript(v, new Int(1)), c);
                prestatement = new Statement(prestatement, new Statement(
                                                 set2one, new Statement(setfirst, null)));
                return v;
            }
            catch(Exception e) {
                error(e.toString());
            }
        }
        else {
            return forceTypeCompatibility(c, STRING);
        }
        if(gettype(c1) instanceof StringType) {
            // convert back to address
            Node  c2  = processor.decast(c1);
            // if(c2 instanceof Deref)return ((Deref)c2).getArg();
        }
        return c1;
    }


    /**
     *  Converts an instance of a number to a real when required for mixed mode
     *  arithmetic
     *
     *@param  r                Description of Parameter
     *@param  ty               Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node floatit(Node r, Type ty) throws SyntaxError {
        // if (r.knownAtCompileTime()) {
        // return declareReal(new Double( r.eval().toString()).doubleValue());
        // }
        String  t  = r.returnType();
        if(t.equals(Node.uint8) || t.equals(Node.int8) || t.equals(Node.int16)
                || t.equals(Node.uint16)) {
            r = new ilcg.tree.Monad(new Op("EXTEND", t, intrep), r);
        }
        t = r.returnType();
        if(t.equals(Node.int32)) {
            if(r.knownAtCompileTime())return declareReal(((Num)(r.eval())).doubleValue());
            return new TypeTag(new ilcg.tree.Monad(new Op("FLOAT", Node.int32,
                                                   ty.type), r), ty);
        }
        if(t.equals(Node.int64)) {
            if(r.knownAtCompileTime())return declareReal(((Num)(r.eval())).doubleValue());
            return new TypeTag(new ilcg.tree.Monad(new Op("FLOAT", Node.int64,
                                                   ty.type), r), ty);
        }
        error("dont know how to convert type " + t + "(" + r
              + ") to floating point");
        return r;
    }


    /**
     *  Description of the Method
     *
     *@param  r                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    public Node floatit(Node r) throws SyntaxError {
        return floatit(r, REAL);
    }


    /**
     *  Constructs the tree for monadic operator op applied to e
     *
     *@param  e                Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    public Node monad(Node e, String op) throws SyntaxError {
        if(e.returnType().startsWith("ref")) {
            return monad(new Deref(e), op);
        }

        if(op.equals("-")) {
            String  et  = e.returnType();
            // System.out.println("-"+e+":"+et);
            if(et.equals(intrep) || et.equals(Node.int16)
                    || et.equals(Node.int8)) {
                return dyad(new ilcg.tree.Int(0, intrep), e, "-").eval();
            } else if(et.equals(Node.int64)) {
                return dyad(new Int(0L), e, "-").eval();
            } else if(et.equals(realrep)||et.equals("ieee64")) {
                Node d=dyad(declareReal(0.0), e, "-").eval();
                if (verbose)System.out.println("monadic - for real ->"+d);
                return d;
            }
        } else if(op.equals("absi") || op.equals("ABS") || op.equals("absf")) {
            Type  t  = getType(e);
            return new Monad(new Op("ABS", t.type, t.type), e);
        } else if(op.equals("NOT")) {
            Type  t  = getType(e);
            // if(t.equals(BOOLEAN))
            // return dyad(e, new TypeTag(new Int(1, boolrep), BOOLEAN), "<>");
            return new Monad(new Op("NOT", t.type, t.type), e);
        }
        Node[]  params  = {e};
        return procCall(op, params);
    }


    /*
     *  additive-expression: additive-expression additive-op
     *  multiplicative-expression multiplicative-expression additive-op: one of +
     *  - or
     */
    /**
     *  Description of the Method
     *
     *@param  rank             the rank of the expression expected from context
     *@param  indices          the index variables to use in reducing arrays to
     *      rank 0
     *@param  validindices     Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    public Node simple_expression(int rank, int validindices, Node[] indices)
    throws SyntaxError, TypeIdError {
        // System.out.println("enter additive exp");
        Node     e1  = (have("-") ? monad(term(rank, validindices, indices), "-")
                        : (have("+") ? (term(rank, validindices, indices)) : term(rank,
                                validindices, indices)));
        if(processor.verbose) {
            System.out.println("multiplicative exp =" + e1);
        }
        boolean  ok  = false;
        String   op  = addop();
        if(op.length() > 0) {
            Node f1;
            Type  t  = getType(f1=forcederef(e1));
            if(op.equals("OR")) {
                if(!(t .equals(BOOLEAN)||Format.isInteger(f1.returnType())))error("OR applied to non integer or boolean left argument");
            }
            if(t instanceof StringType || t == (CHAR)) {
                try {
                    Node  v1  = tempvar(STRING);
                    e1 = stringassign(v1, tostring(e1));
                    while(op.equals("+")) {
                        // System.out.println(e1);
                        Node e2=term(rank, validindices, indices);
                        e1 = new Statement(e1, new Statement(stringappend(v1,e2), null));
                        op = addop();
                    }
                    prestatement = new Statement(prestatement, new Statement(
                                                     e1, null));
                    return v1;
                }
                catch(Exception e2) {
                    error(e2.toString());
                }
            }
            else {
                while(op.length() > 0) {
                    Node e2=term(rank, validindices, indices);
                    Node f2;
                    Type t2=getType(f2=forcederef(e2));
                    if(op.equals("OR") && !Format.isInteger(f2.returnType())) error("incompatible arguments to OR.");
                    if(t instanceof Pointer//&&( op.equals("+")
                            &&!t.equals(t2)) {
                        //	System.out.println(op+"t="+t+"old e2"+e2);
                        e2=new TypeTag(cast2(e2,t),t);
                        //	System.out.println(" "+e2);
                    }
                    {
                        e1 = dyad(e1, e2, op);
                    }
                    op = addop();
                }
            }
        }
        return e1;
    }


    Dictionary reductionLwb = new Hashtable();
    Dictionary reductionUpb = new Hashtable();
    // sum the expression arraysubs between the bounds lwb and upb using simd instructions if possible

    Node simdsum(Node index, Node lwb, Node upb, Node arraysubs)throws  AssignmentException,SyntaxError,Exception {
        String f=forcederef(arraysubs).returnType();
        int veclen= processor.getParallelism(f);
        if(!reduceparallelisedynamic) {
            if(! lwb.knownAtCompileTime()) return null;
            if(! lwb.knownAtCompileTime()) return null;
            int Lwb = ((Number)lwb.eval()).intValue();
            int Upb = ((Number)upb.eval()).intValue();
            if(processor.verbose)System.out.println("checked bounds known");
            int elements = Upb - Lwb +1;
            // if(elements % veclen !=0) return null;
            //if(processor.verbose)System.out.println("Checked no remainder");
            if(elements / veclen <2) return null;
        }

        Node arg=TypeTag.decast(arraysubs);
        if(processor.verbose)System.out.println("elements/veclen >=2 class of arg="+arg.getClass());
        Type etype = getType(forcederef(arraysubs));
        if(processor.verbose)System.out.println("  now "+arg.getClass());
        if(Format.isVector(arraysubs.returnType())) {
            if(processor.verbose)System.out.println(" abandon simdsum because format.isvector");
            return null;
        }
        long[][] bounds= {{1,veclen}};
        ArrayType vectortemptype = new ArrayType(bounds,    etype,    veclen);
        long len = etype.sizeOf(processor);
        if(processor.verbose)
            System.out.println("vectortemptype="+vectortemptype);
        Memref    temporary  =(Memref) tempvar(vectortemptype);
        if(processor.verbose)
            System.out.println("temporary="+temporary);
        Memref    temp2=(Memref) tempvar(vectortemptype);
        Node parallelversionOfarraysubs =null;
        if(!(arg instanceof ArraySubscription)) {
            try {
                parallelversionOfarraysubs = parallelise(arraysubs,veclen,etype,index);
            }
            catch(Exception parex) {
                if(processor.verbose)System.out.println("in simdsum " +parex);
                return null;
            }
        }
        else {
            ArraySubscription as = (ArraySubscription)arg;
            ArrayType at = as.at;
            if(at.isDynamic) return null;
            parallelversionOfarraysubs = new Memref(as.index,Format.makeVectorType(f,veclen));
        }
        if(processor.verbose)System.out.println( "parallelversionOfarraysubs ="+parallelversionOfarraysubs );
        try {
            Node setindextolwb = new Assign(index,new TypeTag(lwb, (addrlength==4?INTEGER:LONG) ) );
            Node settotaltofirstblock = new Assign(temporary,forcederef(parallelversionOfarraysubs));
            Statement initialise =new Statement(setindextolwb,new Statement(settotaltofirstblock));
            Node computeexp = dyad(forcederef(temporary),forcederef(parallelversionOfarraysubs),"+");
            Node computestep = new Assign(temporary,computeexp);
            Node  one;
            Node  range          = dyad(dyad(upb, lwb, "-").eval(), one = new Int(1, intrep), "+");

            Node  pariterations  = dyad(range, new Int(veclen), Node.divide).eval();
            //   System.out.println("range ="+range+" iters = "+pariterations);
            // calculate the upper bound of the simd loop and store it in memory location
            Node firstupbval = new TypeTag(dyad(dyad(dyad(pariterations, new Int(veclen), "*"), one, "-"), lwb, "+"), (addrlength==4?INTEGER:LONG)).eval();
            Node firstupbvar = tempvar((addrlength==4?INTEGER:LONG));
            postPrestatement(new Statement(new Assign(firstupbvar,firstupbval)));
            Node firstupb = forcederef(firstupbvar);
            //   System.out.println(" firstupb +"+firstupb);
            Node loop = new For(index, dyad(new Int( veclen),lwb,"+"),firstupb, new Int(veclen),computestep);

            loop = new Statement(loop);

            // now do the scalar residue

            Memref    scalartemporary  =(Memref) tempvar(etype);
            computeexp = dyad(forcederef(scalartemporary),forcederef( arraysubs),"+");
            computestep = new Assign(scalartemporary,computeexp);


            Node finalloop =new For(index,  dyad(firstupb,one,"+"),upb, new Int(1),computestep);
            //  System.out.println("   loop \n"+ loop);
            //  System.out.println(" scalar loop \n"+finalloop);
            finalloop=new Statement(new Assign(scalartemporary,new TypeTag( new Int(0),etype)),new Statement(finalloop));
            ((Statement)loop).setLocal((Memref)index);
            Node totaladdress = temp2.index;
            Node sum= forcederef(new Memref(totaladdress,arraysubs.returnType()));
            for(int offs=1; offs<veclen; offs++)
                sum=dyad(sum,forcederef(new Memref(dyad(totaladdress, new Int(offs*len),"+"),arraysubs.returnType())),"+");
            Statement computation = new Statement(initialise,new Statement(loop));
            computation=new Statement(new Statement(computation,new Statement(new Assign(temp2,forcederef(temporary)))));
            computation.setLocal(temporary);
            postPrestatement(new Statement(computation,new Statement(finalloop)));

            return dyad(sum,forcederef(scalartemporary),"+");
        } catch(Exception pe) {
            if(processor.verbose)pe.printStackTrace();
            error("in parallel vector sum "+pe);
            return null;
        }
    }
    /**
     *  unary-expression: unary-op unary-expression| primary -expression unary-op:
     *  one of + - not round sqrt sin cos succ pred
     *
     *@param  rank             Description of Parameter
     *@param  indices          Description of Parameter
     *@param  validindices     Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    public Node unary_expression(int rank, int validindices, Node[] indices)
    throws SyntaxError, TypeIdError {
        if(have("if")) {
            int      oldcalls           = callcount;
            boolean  checks             = lex.rangechecks;
            Node     condition          = forcederef(expression(rank, validindices, indices));
            Type     t1                 = getType(condition);
            if(!(BOOLEAN.equals(t1))) {
                error("you need a boolean expression here");
            }
            mustbe("then");
            // switch off range checks within these expressions
            // since they are not guaranteed to work even in correct vector
            // pascal
            // Both branches of the if statement are evaluated and masking is
            // used to
            // select between them. That masking can be used to ensure that the
            // returned
            // result depends only on values that are within the correct array
            // bounds
            // if this is the case, then were array bounds checking to be on
            // an array bounds fault would be invalidly raised
            lex.rangechecks = false;
            Node     thenpart           = forcederef(expression(rank, validindices, indices));
            mustbe("else");
            Node     elsepart           = forcederef(expression(rank, validindices, indices));
            lex.rangechecks = checks;
            if(!((t1 = getType(thenpart)).equals(getType(elsepart)))) {
                error("two alternatives of if then else must be of same type");
            }
            Node     extendedCondition  = new Cast("int"+Format.lengthInBits(thenpart.returnType()),condition);
            // System.out.println(extendedCondition);
            if(t1 instanceof IntegralType && oldcalls == callcount) {
                // only try evaluating in parallel if values are integers and no
                // chance of recursion
                return dyad(dyad(thenpart, extendedCondition, "AND"), dyad(
                                elsepart, monad(extendedCondition, "NOT"), "AND"), "OR");
            }
            else if(t1 instanceof RealType && oldcalls == callcount)
                try {
                    // only try evaluating in parallel if values are integers and no
                    // chance of recursion
                    String bt = extendedCondition.returnType();
                    return  new Dyad(
                                new Dyad(thenpart,extendedCondition,new Op("AND",thenpart.returnType(),bt,thenpart.returnType())),
                                new Dyad(elsepart, monad(extendedCondition, "NOT"),
                                         new Op("AND",elsepart.returnType(),bt,elsepart.returnType())),
                                new Op("OR", thenpart.returnType(), elsepart.returnType(), thenpart.returnType()));
                }
                catch(Exception eee) {
                    error(eee.toString());
                }
            else {
                unparalleled = true;
                try {
                    Node  temporary  = tempvar(t1);
                    postPrestatement(new Statement(new If(condition,
                                                          new Assign(temporary, thenpart), new Assign(
                                                                  temporary, elsepart))));
                    return temporary;
                }
                catch(Exception e2) {
                    error(e2.toString());
                }
            }
        }
        String   operator  = reduction();
        if(operator != "") {
            try {
                {
                    if(processor.verbose)System.out.println("reduce by an operator");
                    Memref     index            = (Memref) tempvar((addrlength==4?INTEGER:LONG));
                    declareLoopIterator(index);
                    arrayiteratorset.put(index, index);
                    Node[]     newindices       = new Node[validindices + 1];
                    for(int i = 0; i < validindices; i++) {
                        newindices[i] = indices[i];
                    }
                    newindices[validindices] = index;
                    boolean    rc               = lex.rangechecks;
                    lex.rangechecks = false;
                    // switch these off till the end of
                    // the reduction
                    int        oldmaxrank       = maxRank;
                    int        oldcalls         = callcount;
                    // check if any calls are in the
                    // inner loop
                    Statement  oldprestatement  = prestatement;
                    prestatement = null;
                    Node       arg              = term(0, validindices + 1, newindices);
                    maxRank = oldmaxrank;
                    Type       t                = getType(forcederef(arg));
                    int        r                = 0;
                    if(reductionUpb.get(forcederef(index).toString()) == null) {
                        // reduction of a scalar, generate no loop
                        if(processor.verbose) {
                            System.out.println("Reduction of a scalar after"
                                               + " could not find index "
                                               + forcederef(index) + " in "
                                               + reductionUpb);
                        }
                        prestatement = new Statement(oldprestatement,
                                                     prestatement);
                        return dyad(arg, identityElement(t, operator), operator);
                    }
                    else {// reduction of a vector
                        Type       totaltype;
                        Node       total         = tempvar(totaltype = t);
                        // at.elemtype);
                        Node       scalartotal   = total;
                        boolean    isString      = t instanceof StringType;
                        if(isString && !(operator.equals("+"))) {
                            error("only + allowed in string reduction");
                        }
                        // note that in what follows strings have to be treated
                        // as a special case
                        // for efficiency reasons doing appending
                        Node       id            = identityElement(t, operator);
                        Node       init          = (isString ? stringassign(total, id)
                                                    : new Assign(total, id));
                        Node[]     subscription  = {index};
                        Node       loop          = null;
                        int        parfactor     = 1;
                        Node       lwb           = ((Node) reductionLwb.get(forcederef(index).toString()));
                        Node       upb           = (Node) reductionUpb.get(forcederef(index).toString());
                        if(isString && operator.equals("+")) {
                            try {
                                // string concatenation is a special case
                                loop = new For(index, lwb, upb, new Int(1,  INTEGER.type),
                                               new Statement(   prestatement, new Statement(     stringappend(total, arg))));
                                prestatement = null;
                            }
                            catch(Exception apex) {
                                error("appending stings " + apex);
                            }
                        }
                        else {
                            // this may invoke a function call capture it
                            // in newprestatement
                            // thedyad is the elementary totalising expression that
                            // has to go into a loop
                            Node       thedyad          = dyad(arg, total, operator);
                            if(operator.equals("+")) {
                                if(reduceparallelise) {
                                    boolean saved = unparalleled;
                                    unparalleled=false;
                                    if(processor.verbose)
                                        System.out.println("\\+ with reduceparallelise enabled");
                                    Node temp = simdsum(index,lwb,upb,arg);
                                    unparalleled=saved;
                                    if(processor.verbose)
                                        System.out.println("\\+ ->"+temp);

                                    if(temp != null) return temp;
                                }
                                thedyad = dyad(total, arg, operator);
                            }
                            // this will work faster and + is commutative so
                            // it // so it is allowed
                            else {
                                unparalleled = true;
                            }
                            // only attempt to parallelise +
                            // advance the total
                            Node       assign           = new Assign(total, new TypeTag(
                                        thedyad, totaltype));
                            Node       oldassign        = assign;
                            if(processor.verbose)System.out.println("prestatement ="+prestatement);
                            Statement  newprestatement  = prestatement;
                            prestatement = oldprestatement;
                            loop = new For(index,
                                           dyad(upb, new  Int(parfactor - 1, INTEGER.type), "-"),
                                           // // adjust where we
                                           // start
                                           lwb, new Int(  -(parfactor),   INTEGER.type),
                                           new Statement(
                                               newprestatement, new Statement(
                                                   assign))).eval();
                        }
                        if(processor.verbose)		  System.out.println("original "+loop);
                        loop = ((For) loop).optimise();
                        if(processor.verbose)		 System.out.println("optimised "+loop);
                        Statement  action        = new Statement(
                            getPreloopAction(index), new Statement(init,
                                    new Statement(loop)));
                        if(processor.verbose)	 System.out.println(" including init code "+action);
                        if(!isString && (callcount == oldcalls)) {
                            // disable
                            // this for
                            // now
                            // this tries to make sure the total is kept in a
                            // register for the duration
                            // of the loop before being saved to a variable
                            Node  newtotal  = tempvar(t);
                            {
                                try {
                                    action = new Statement(
                                        new Statement(action,
                                                      new Statement(new Assign(
                                                                        newtotal,
                                                                        forcederef(total)))),
                                        null);
                                }
                                catch(Exception e9) {
                                    error(" in serialised reduction " + e9);
                                }
                            }
                            action = new Statement(action, null);
                            action.setLocal((Memref) total);
                            action = new Statement(action, null);
                            action.setLocal(index);
                            // cache the loop variable
                            total = newtotal;
                        }
                        postPrestatement(action);
                        unparalleled = true;
                        // prevent parallelisation being
                        // attempted on any outer loop
                        freeIterator(index);
                        lex.rangechecks = rc;
                        return forcederef(total);
                    }
                }
            }
            catch(Exception e) {

                error("in operator reduction expression :" + e);
                return null;
            }
        }
        else if(have("iota")) {
            boolean  bra  = have('[');
            Node     i    = unary_expression(rank, validindices, indices).eval();
            if(bra) {
                mustbe(']');
            }
            if(!(i instanceof Int)) {
                error("iota takes an integer argument known at compile time");
            }
            int      ind  = ((Int) i).intValue();
            if(ind >= indices.length) {
                error("argument to iota exceeds rank of current context");
            }
            if(ind == indices.length - 1) {
                unparalleled = true;
            }
            // if the last index enters into an
            // expression
            // then this creates dangers for paralellism
            return forcederef(indices[ind]);
        }
        if(have("trans")) {
            Node[]  newindices  = new Node[indices.length];
            for(int i = 0; i < indices.length; i++) {
                newindices[(i + 1) % indices.length] = indices[i];
            }
            Node    res         = unary_expression(rank, validindices, newindices);
            unparalleled = true;
            // System.out.println("transpose to "+res);
            return res;
        }
        if(have("diag")) {
            Node[]  newindices  = new Node[indices.length + 1];
            for(int i = 0; i < indices.length; i++) {
                newindices[(i + 1)] = indices[i];
            }
            newindices[0] = indices[0];
            Node    res         = unary_expression(rank, validindices + 1, newindices);
            unparalleled = true;
            return res;
        }
        if(have("perm")) {
            mustbe('[');
            Node[]  newindices  = new Node[indices.length];
            for(int j = 0; j < indices.length; j++) {
                Node  i    = unary_expression(rank, validindices, indices).eval();
                if(!(i instanceof Int)) {
                    error("perm takes  integer arguments known at compile time");
                }
                int   ind  = ((Int) i).intValue();
                if(ind >= indices.length) {
                    error("argument to perm exceeds rank of current context");
                }
                newindices[j] = indices[ind];
                if(j != (indices.length - 1)) {
                    mustbe(',');
                }
                else {
                    mustbe(']');
                }
            }
            Node    res         = unary_expression(rank, validindices, newindices);
            // can not parallelise unless the last index remains unchanged
            // it it alters elements are not consecutive
            unparalleled = !indices[indices.length - 1]
                           .equals(newindices[indices.length - 1]);
            // the last index must also not occur in the sequence of prior
            // indices
            // since in the parallelised case it will not step through all
            // values
            if(!unparalleled) {
                for(int j = 0; j < indices.length - 1; j++) {
                    if(newindices[j].equals(indices[indices.length - 1])) {
                        unparalleled = true;
                    }
                }
            }
            return res;
        }
        if(have('+')) {
            return unary_expression(rank, validindices, indices);
        }
        if(have('*')) {
            return unary_expression(rank, validindices, indices);
        }
        if(have('/')) {
            Node  e1  = unary_expression(rank, validindices, indices);
            return dyad(identityElement(getType(forcederef(e1)), "/"), e1, "/");
        }
        if(have("DIV")) {
            Node  e1  = unary_expression(rank, validindices, indices);
            return dyad(identityElement(getType(forcederef(e1)), "DIV"), e1,
                        "DIV");
        }
        if(have("REM")) {
            Node  e1  = unary_expression(rank, validindices, indices);
            return dyad(identityElement(getType(forcederef(e1)), "REM"), e1,
                        "REM");
        }
        if(have("MOD")) {
            Node  e1  = unary_expression(rank, validindices, indices);
            return dyad(identityElement(getType(forcederef(e1)), "MOD"), e1,
                        "mod");
        }
        if(have("OR")) {
            return unary_expression(rank, validindices, indices);
        }
        if(have("AND")) {
            Node  e1  = unary_expression(rank, validindices, indices);
            return dyad(identityElement(getType(forcederef(e1)), "AND"), e1,
                        "AND");
        }
        if(have('-')) {
            Node  e1  = unary_expression(rank, validindices, indices);
            return dyad(identityElement(getType(forcederef(e1)), "-"), e1, "-");
        }
        if(have("NOT")) {
            return monad(factor(rank, validindices, indices), "NOT");
        }


        if(have("SQR")) {
            Node  r      = forcederef(unary_expression(rank, validindices, indices));
            Node  r2     = new ilcg.tree.Monad(new Op("SQR", realrep, realrep), r);
            // make a test sequence which we will never use to see if we have a
            // sqr instruction
            int   start  = processor.buf.mark();
            try {
                Node  test  = new Assign(new Memref(new Deref(processor.getFP()),
                                                    r.returnType()), r2);
                if(processor.codeGen(test)) {
                    processor.rollBack(start);
                    return r2;
                }
            }
            catch(Exception asse) {
                if(processor.verbose) {
                    System.out.println("fail " + asse);
                }
            }
            processor.rollBack(start);
            return dyad(r, r, "*");
        }
        if (! nox87) {

            if(have("TRUNC")) {
                Node r = optionalfloat(DOUBLE,
                                       unary_expression(rank, validindices, indices));
                return trunc(r);
            }
            if(have("SQRT")) {
                Node  r  = optionalfloat(REAL, unary_expression(rank, validindices,
                                         indices));
                return new TypeTag(new ilcg.tree.Monad(new Op("SQRT", realrep,
                                                       realrep), r), REAL);
            }
            if(have("ROUND")) {
                Node  r  = optionalfloat(REAL, unary_expression(rank, validindices,
                                         indices));
                return round(r);
            }
            if(have("SIN")) {
                Node  r  = optionalfloat(REAL, unary_expression(rank, validindices,
                                         indices));
                return new TypeTag(new ilcg.tree.Monad(new Op("SIN", realrep,
                                                       realrep), r), REAL);
            }
            if(have("COS")) {
                Node  r  = optionalfloat(REAL, unary_expression(rank, validindices,
                                         indices));
                return new TypeTag(new ilcg.tree.Monad(new Op("COS", realrep,
                                                       realrep), r), REAL);
            }
            if(have("TAN")) {
                Node  r  = optionalfloat(REAL, unary_expression(rank, validindices,
                                         indices));
                return new TypeTag(new ilcg.tree.Monad(new Op("TAN", realrep,
                                                       realrep), r), REAL);
            }
            if(hardwareabs())  if (have("ABS")) { Node oexp
                 = forcederef(unary_expression(rank, validindices, indices)); 
                 Type rt
                 = getType(oexp); // 
                 String absfn =
                 (Format.isInteger(oexp.returnType()) ? "absi" : "absr"); 
                 Node m =
                 monad(oexp, "ABS");

                 try {

                 return (m); } catch (Exception e) { error(e.toString()); } }
               
            if(have("LN")) {
                Node  r  = optionalfloat(REAL, unary_expression(rank, validindices,
                                         indices));
                return new TypeTag(new ilcg.tree.Monad(new Op("LN", realrep,
                                                       realrep), r), REAL);
            }
        }
        if(have("ORD")) {
            Node  oexp  = unary_expression(rank, validindices, indices);
            return ORD(oexp);
        }
        if(have("BYTE2PIXEL")) {
            Node    bexp  = forcederef(unary_expression(rank, validindices, indices));
            String  brt   = bexp.returnType();
            if(!brt.equals(Node.uint8)) {
                error("type error as argument to BYTE2PIXEL representation was "
                      + brt + " not uint8");
            }
            return byte2pixel(bexp);
        }
        if(have("PIXEL2BYTE")) {
            Node    bexp  = forcederef(unary_expression(rank, validindices, indices));
            String  brt   = bexp.returnType();
            if(!brt.equals(Node.int8)) {
                error("type error as argument to PIXEL2BYTE representation was "
                      + brt + " not int8");
            }
            return pixel2byte(bexp);
        }
        if(have("CHR")) {
            Node  n1  = new TypeTag(forcederef(unary_expression(rank,
                                               validindices, indices)), CHAR);
            // System.out.println("CHAR="+CHAR+"n1="+n1);
            return n1;
        }
        boolean  succ      = false;
        boolean  pred      = false;
        succ = have("SUCC");
        if(!succ) {
            pred = have("PRED");
        }
        if(succ || pred) {
            boolean  fnform  = have('(');
            int      inc     = (succ ? 1 : -1);
            Node     oexp    = forcederef((fnform ? expression(rank, validindices,
                                           indices) : unary_expression(rank, validindices, indices)));
            Type     rhst    = getType(oexp);
            if(!((rhst instanceof IntegralType) || (rhst instanceof Pointer) || (rhst instanceof OrdinalType))) {
                error("succ/pred must take scalar or pointer types as argument not"
                      + rhst);
            }
            Node     step    = new Int(inc);
            boolean  extra   = false;
            if(fnform) {
                if(have(',')) {
                    extra = true;
                    step = expression(rank, validindices, indices);
                }
                mustbe(')');
            }
            Node     sucres  = SUCC(oexp, step, rhst, lex.rangechecks,
                                    /*
                                     *  extra &&
                                     */
                                    lex.modularArithmetic);
            if(processor.verbose) {
                System.out.println("SUCC translated to " + sucres);
            }
            return sucres;
        }
        if(have(lex.TT_ADDR)) {
            try {
                // Node v = unary_expression(rank,validindices, indices);
                Node    v   = variable(rank, validindices, indices);
                String  rt  = v.returnType();
                // if (!rt.startsWith("ref")) {
                // error("need a memory reference after address operator ");
                // }
                return new TypeTag(getAddr(v), POINTER);
            }
            catch(TypeIdError aex) {
                if(aex.value instanceof ProcType) {
                    return new TypeTag(getAddr(((ProcType)(aex.value))),
                                       new Ref((ProcType) aex.value));
                }
                error("@ application generated " + aex);
            }
        }
        if(have("SIZEOF")) {
            try {
                mustbe('(');
                Type  t  = type();
                mustbe(')');
                return new Int(t.sizeOf(processor), intrep);
            }
            catch(Exception e8) {
                error("sizeof should have a type as a parameter" + e8);
            }
        }
        Node     pe        = primary_expression(rank, validindices, indices);
        if(processor.verbose) {
            System.out.println("primary_expression->" + pe);
        }
        return pe;
    }


    /**
     *  recognises \ <operator>
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    String reduction() throws SyntaxError {
        if(have('\\')) {
            // reduce by an operator
            String  operator  = null;
            try {
                operator = dyadicOperator();
            }
            catch(Exception e) {
            }
            if(operator == null) {
                error(" \\ requires a dyadic operator to follow it ");
            }
            return operator;
        }
        if(have(lex.TT_SUMATION)) {
            return "+";
        }
        if(have(lex.TT_PRODUCT)) {
            return "*";
        }
        return "";
    }


    /**
     *  Evaluate the Pascal Succ function in its general form
     *
     *@param  oexp             Description of the Parameter
     *@param  step             Description of the Parameter
     *@param  rhst             Description of the Parameter
     *@param  check            Description of the Parameter
     *@param  modulararith     Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node SUCC(Node oexp, Node step, Type rhst, boolean check,
              boolean modulararith) throws SyntaxError {
        try {
            Node    res      = new TypeTag(new Dyad(new TypeTag(oexp, INTEGER), step,
                                                    "+"), rhst).eval();
            String  rep      = rhst.type;
            Node    newstep  = new TypeTag(step, rhst);
            Node    castarg  = new TypeTag(oexp, rhst);
            Node    newinc   = new Dyad(castarg, newstep, "+");
            if(rhst == BOOLEAN) {
                return new Dyad(TRUE, oexp, "XOR");
            }
            // System.out.println("new step="+newstep+"+"+castarg+"->"+newinc);
            if(modulararith) {
                if(fullrange(rhst)) {
                    return newinc;
                }
                if(rhst instanceof ScalarRange) {
                    ScalarRange  s        = (ScalarRange) rhst;
                    Node         low      = new Int((int) s.bottom());
                    Node         range    = new Int((int) s.range());
                    Node         base     = new Dyad(res, low, "-");
                    Node         modular  = new Dyad(base, range, "MOD");
                    // System.out.println("modular ="+modular);
                    // System.out.println("call type tag with rhst="+rhst);
                    res = new TypeTag(new Dyad(modular, low, "+"), rhst);
                }
            }
            //
            // plant bounds check code
            else if(check && rhst instanceof ScalarRange) {
                try {
                    ScalarRange  s  = (ScalarRange) rhst;
                    postPrestatement(new If(dyad(new TypeTag(res, INTEGER),
                                                 new Int((int) s.top(), intrep), ">"), boundserr(
                                                res, new Int((int) s.top()), new Int((int) s.bottom()))));
                    postPrestatement(new If(dyad(new TypeTag(res, INTEGER),
                                                 new Int((int) s.bottom(), intrep), "<"), boundserr(
                                                res, new Int((int) s.top()), new Int((int) s.bottom()))));
                }
                catch(Exception err1) {
                    error("checking range " + err1);
                }
            }
            return res;
        }
        catch(Exception err) {
            error("in succ function " + err);
        }
        return null;
    }


    /**
     *  Description of the Method
     *
     *@param  r  Description of the Parameter
     *@return    Description of the Return Value
     */
    Node round(Node r) {
        return new ilcg.tree.Monad(new Op("ROUND", realrep, intrep), (r));
    }


    Node trunc(Node r) {
        return new ilcg.tree.Monad(new Op("TRUNCATE", realrep, intrep), (r));
    }

    /**
     *  Invokes implicit indexing on a variable
     *
     *@param  v                Description of the Parameter
     *@param  validindices     Description of the Parameter
     *@param  indices          Description of the Parameter
     *@param  rank             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node derank(Node v, int validindices, Node[] indices, int rank)
    throws SyntaxError {
        // resolve rank conflicts
        int  rv  = getRank(v);
        // allow strings to be treated as single dimensional arrays
        if(getType(v) instanceof StringType) {
            if(validindices == 1) {
                if(rank == 0) {
                    rv++;
                }
            }
        }
        if(processor.verbose) {
            // System.out.println(
            // "primary expression " + v + ":" + getType(v) + "\nhas rank "
            // + rv + " context demands " + rank + " with " + validindices
            // + " validindices");
        }
        // record the max rank in case we are in an expression that needs this
        if(rv > maxRank) {
            maxRank = rv;
            maxRankArray = v;
        }
        try {
            if(rv > rank && validindices > 0) {
                if(rv - validindices > rank) {
                    error("not enough implicit indices for an array of rank "
                          + rv);
                }
                Node[]  lastIndices  = new Node[rv - rank];
                int     excess       = validindices - (rv - rank);
                if(excess < 0) {
                    error(" short  of indices, variable rank =" + rv
                          + ", validindices =" + validindices
                          + ",\n contextual rank of expression =" + rank);
                }
                for(int i = 0; i < lastIndices.length; i++) {
                    if((i + excess) >= indices.length) {
                        error(" excess indices " + (i + excess) + ">="
                              + indices.length + "\n" + "validindices ="
                              + validindices);
                    }
                    lastIndices[i] = indices[i + excess];
                }
                try {
                    v = subscript(v, lastIndices);
                }
                catch(Exception mnb) {
                    error(" subscripting on last " + lastIndices.length
                          + " indices " + mnb);
                }
                rv = getRank(v);
                // System.out.println("v mapped to " + v);
            }
        }
        catch(Exception ex1) {
            error(" attempting to reduce rank of variable" + ex1);
        }
        if(rv > rank) {
            error(", a variable has a rank greater than is permited by its context\ncontext demands "
                  + rank + " variable has rank " + rv);
        }
        return v;
    }


    /**
     *  Plant code to create a single null byte tagged as a set of 0..7
     *
     *@return    Description of the Return Value
     */
    Node createNullDset() {
        SetType  st  = new SetType(new IntegralType(0, 7));
        return declareSet(new byte[1], st);
    }


    /**
     *  Evaluates pascal ORD function - booleans are a special case to handle the
     *  fact that they are internally represented as -1,0 not 0,1
     *
     *@param  oexp             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node ORD(Node oexp) throws SyntaxError {
        try {
            if(getType(forcederef(oexp)) == (BOOLEAN)) {
                return dyad(new TypeTag(forcederef(oexp), INTEGER), new Int(1,
                            intrep), "AND");
            }
            return new TypeTag(forcederef(oexp), INTEGER);
        }
        catch(Exception err) {
            error("in ord function " + err);
        }
        return null;
    }


    /**
     *  parses <p>
     *
     *  <setelement>:==<expression>|<expression>..<expression> <p>
     *
     *  and returns a pair of expressions. In the case of singleton elements then
     *  both expressions are the same and indicate a range of one element
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node[] setElement() throws SyntaxError, TypeIdError {
        Node    e1;
        Node    e2;
        e1 = expression();
        if(have("..")) {
            e2 = expression();
        }
        else {
            e2 = e1;
        }
        Node[]  res  = {e1, e2};
        return res;
    }


    /**
     *  Given a vector of range expressions this <p>
     *
     *  1. determines if they are all constants - in which case it generates a
     *  static set of the appropriate size. 2. otherwise it creates a vector of the
     *  results of the expressions and passes it to a routine that will create a
     *  dynamic bitmap on the heap
     *
     *@param  v                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node createDset(Vector v) throws SyntaxError {
        Node[][]  ranges       = new Node[v.size()][2];
        int       i;
        boolean   allconst     = true;
        // System.out.println("create dset vsize="+v.size());
        for(i = 0; i < ranges.length; i++) {
            ranges[i] = (Node[]) v.elementAt(i);
            // System.out.println("ranges["+i+"]="+ranges[i][0]);
            allconst = allconst && ranges[i][0].knownAtCompileTime()
                       && ranges[i][1].knownAtCompileTime();
        }
        // System.out.println("alconst="+allconst);
        if(allconst) {
            int[][]  intranges  = new int[ranges.length][2];
            for(i = 0; i < ranges.length; i++) {
                for(int j = 0; j < 2; j++) {
                    ranges[i][j] = ranges[i][j].eval();
                    while(ranges[i][j] instanceof TypeTag) {
                        ranges[i][j] = ((TypeTag) ranges[i][j]).subtree;
                    }
                    // System.out.println("ranges [i][j]="+ranges[i][j]+ranges[i][j].getClass());
                    intranges[i][j] = ((Number)(ranges[i][j])).intValue();
                }
            }
            int      top;
            int      bottom;
            top = 0;
            bottom = 0;
            for(i = 0; i < ranges.length; i++) {
                if(intranges[i][1] < intranges[i][0]) {
                    // error("range reversed "+intranges[i][0]+
                    // ".."+intranges[i][1]);
                    // ignore
                }
                else {
                    top = (top < intranges[i][1] ? intranges[i][1] : top);
                    bottom = (bottom < intranges[i][0] ? bottom
                              : intranges[i][0]);
                }
            }
            // align top and bottom to byte boundaries in the allocated set
            bottom = bottom & 0xfffffff8;
            top = top | 7;
            SetType  restype    = new SetType(new IntegralType(bottom, top));
            byte[]   prestate   = (top > bottom ? new byte[1 + (top - bottom) / 8]
                                   : new byte[1]);
            // set the bits in prestate to correspond to the ranges
            for(i = 0; i < ranges.length; i++) {
                for(int j = intranges[i][0]; j <= intranges[i][1]; j++) {
                    setbit(prestate, j, bottom);
                }
            }
            Node     resul      = declareSet(prestate, restype);
            return resul;
        }
        // create a temporary array intialised with all of the expressions that
        // determine the bounds
        long[][]  arraybounds  = {{0, 2 * ranges.length - 1}};
        Type      paramvector  = new ArrayType(arraybounds, INTEGER, Format.lengthInBytes(INTEGER.type));
        try {
            Node     temp  = tempvar(paramvector);
            Node     vt    = tempvar(POINTER);
            try {
                for(i = 0; i < ranges.length; i++) {
                    try {
                        if(processor.verbose) {
                            System.out.println(" setup range : " + i + temp);
                        }
                        Node  dest  = subscript(temp, new Int(i * 2, intrep));
                        Node  as1   = new Assign(dest, forcederef(ranges[i][0]));
                        Node  as2   = new Assign(subscript(temp, new Int(
                                                               i * 2 + 1, intrep)), forcederef(ranges[i][1]));
                        postPrestatement(as1);
                        postPrestatement(as2);
                    }
                    catch(Exception init) {
                        error("Initialising range for dynamic set" + init);
                    }
                }
                Node[]     params        = {new Int(ranges.length * 2, "int32"), temp};
                Statement  functioncall  = new Statement(procCall("createdset",
                        params),
                        new Statement(new Assign(vt, new TypeTag(processor.functionRetReg(POINTER.type), POINTER)), null));
                postPrestatement(functioncall);
            }
            catch(AssignmentException e) {
                error("invalid assignment initialising parameters to create a set "
                      + e);
            }
            // System.out.println("create dynamic bitmap type ");
            SetType  ds    = new SetType(INTEGER, symbolTable,addrtype);
            // System.out.println("ds ="+ds);
            return new TypeTag(vt, ds);
        }
        catch(Exception e2) {
            error("whilst setting up call to create a dynamic set " + e2);
            return null;
        }
    }


    /**
     *  recognises primary-expression: variable | unsigned-integer | unsigned-real
     *  | string | nil | funcid ( expression-list ) | [ element-list ] | (
     *  expression ) The strategy for handling set expressions is to <p>
     *
     *  1. generate a constant bitmap initialised to all the fields of the set
     *  expression known at compile time. This is then returned as the result if it
     *  is a constant set. <p>
     *
     *  2. Declare a set variable to hold the temporary result of evaluating the
     *  set. <p>
     *
     *  3. Plant code to intialise the set variable with all elements of the set
     *  and return the set variable. 4. If the set type is unknown, then create a
     *  dynamically sized bitmap with a pointer to it.
     *
     *@param  rank             Description of Parameter
     *@param  indices          Description of Parameter
     *@param  validindices     Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */

    public Node primary_expression(int rank, int validindices, Node[] indices)
    throws SyntaxError, TypeIdError {
        // System.out.println("Primary expression "+rank+" "+validindices);
        // ! char allows a rank one higher than would otherwise be permited
        // to be returned from a variable
        if(have('!')) {
            return primary_expression(rank + 1, validindices, indices);
        }
        if(have('(')) {
            Node  n  = expression(rank, validindices, indices);
            mustbe(')');
            return n;
        }
        if(have('[')) {
            try {
                Node      oldprestatement       = prestatement;
                prestatement = null;
                setexpcount++;
                if(have(']')) {
                    try {
                        prestatement = new Statement(oldprestatement,
                                                     prestatement);
                        if(setAssignmentContext == null) {
                            Node e1= createNullDset();
                            Object[]  resnotes  = {"nullset", e1};
                            TypeTag    value         =new TypeTag(e1,      getType(e1));
                            if(processor.verbose)System.out.println("set annotation "+resnotes+"to");
                            value.setAnnotation(resnotes);
                            return value;
                        }
                        if(setAssignmentContext.bitmapImplementation) {
                            Node e1= declareSet(new byte[(int) setAssignmentContext.length()]);
                            Object[]  resnotes  = {"nullset", e1};
                            TypeTag      value         = new TypeTag(e1,
                                    setAssignmentContext);
                            if(processor.verbose)System.out.println("set annotation "+resnotes+"to");
                            value.setAnnotation(resnotes);
                            return value;
                        }
                        return new TypeTag((Node) getid("nil"),
                                           setAssignmentContext);
                    }
                    catch(Exception whoops4) {
                        error("bad null set implementation" + whoops4);
                    }
                }
                Variable  temporarySetVariable  = null;
                Variable  iterator              = null;
                Node      e1                    = null;
                boolean   allconsts             = true;
                boolean   iteratorAssigned      = false;
                String    setname               = "...Set" + setexpcount;
                String    iteratorname          = "...iset" + setexpcount;
                if(setAssignmentContext == null) {
                    try {
                        /*
                         *  we do not know what set type we have so we may have
                         *  to create a dynamic bitmap set
                         */
                        Vector  list   = new Vector();
                        list.addElement(setElement());
                        while(have(',')) {
                            list.addElement(setElement());
                        }
                        mustbe(']');
                        Node    build  = createDset(list);
                        prestatement = new Statement(oldprestatement,
                                                     prestatement);
                        return build;
                    }
                    catch(Exception whoops5) {
                        error(" bad set of unknown type " + whoops5);
                    }
                }
                if(setAssignmentContext.bitmapImplementation) {
                    try {
                        byte[]       prestate      = new byte[1 + (int) setAssignmentContext.length()];
                        ScalarRange  members       = (ScalarRange) setAssignmentContext.members;
                        int          expcount      = 0;
                        do {
                            // System.out.println("loop on set elements");
                            e1 = expression(rank, validindices, indices).eval();
                            expcount++;
                            if(e1.knownAtCompileTime()) {
                                while(e1 instanceof TypeTag) {
                                    e1 = ((TypeTag) e1).subtree;
                                }
                            }
                            if(!have(lex.TT_ELIPSIS)) {
                                // it is a simple element
                                if(e1.knownAtCompileTime()
                                        && e1 instanceof Number) {
                                    setbit(prestate, ((Number) e1).intValue(),
                                           (int) members.bottom());
                                }
                                else {
                                    if(allconsts) {
                                        declareVar(setname,
                                                   setAssignmentContext);
                                        temporarySetVariable = (Variable) symbolTable.get(setname);
                                    }
                                    prestatement = new Statement(prestatement,
                                                                 new Statement(setbit(
                                                                         temporarySetVariable, e1,
                                                                         new Int(members.bottom(),
                                                                                 intrep)), null));
                                    allconsts = false;
                                }
                            }
                            else {
                                if(!setAssignmentContext.bitmapImplementation) {
                                    error(" Ranges only allowed in ordinal sets");
                                }
                                Node  e2  = expression(rank, validindices,
                                                       indices).eval();
                                expcount++;
                                if(e2.knownAtCompileTime()) {
                                    while(e2 instanceof TypeTag) {
                                        e2 = ((TypeTag) e2).subtree;
                                    }
                                }
                                if(e1.knownAtCompileTime()
                                        && e2.knownAtCompileTime()
                                        && e1 instanceof Number
                                        && e2 instanceof Number) {
                                    // initialise the constant set expression
                                    // for all members of the subrange
                                    int  i  = ((Number)(e1)).intValue();
                                    int  j  = ((Number)(e2)).intValue();
                                    // System.out.println(" initialise the constant set expression for all members of the subrange "+i+".."+j);
                                    for(int k = i; k <= j; k++) {
                                        setbit(prestate, k, (int) members.bottom());
                                    }
                                }
                                else {
                                    if(allconsts) {
                                        declareVar(setname,
                                                   setAssignmentContext);
                                        temporarySetVariable = (Variable) symbolTable.get(setname);
                                    }
                                    prestatement = new Statement(prestatement,
                                                                 new Statement(setbit(
                                                                         temporarySetVariable, e1,
                                                                         new Int(members.bottom(),
                                                                                 intrep))));
                                    allconsts = false;
                                    if(!iteratorAssigned) {
                                        try {
                                            iteratorAssigned = true;
                                            declareVar(iteratorname, INTEGER);
                                            iterator = (Variable) symbolTable.get(iteratorname);
                                        }
                                        catch(Exception en) {
                                            error(" in iterator assignment "
                                                  + en);
                                        }
                                    }
                                    try {
                                        Node  loop  = new For(iterator,
                                                              forcederef(e1, INTEGER),
                                                              forcederef(e2, INTEGER),
                                                              new Int(1, intrep), setbit(
                                                                  temporarySetVariable,
                                                                  new Deref(iterator),
                                                                  new Int(members.bottom(),
                                                                          intrep)));
                                        prestatement = new Statement(
                                            prestatement, new Statement(
                                                loop, null));
                                    }
                                    catch(Exception en) {
                                        error(" in set loop construction " + en);
                                    }
                                }
                            }
                        }
                        while(have(','));
                        Node         ref2ConstSet  = declareSet(prestate);
                        mustbe(']');
                        if(allconsts) {
                            prestatement = new Statement(oldprestatement,
                                                         prestatement);
                            return ref2ConstSet;
                        }
                        Statement    setinit;
                        prestatement = new Statement(oldprestatement,
                                                     setinit = new Statement(new Assign(
                                                             temporarySetVariable, ref2ConstSet),
                                                             prestatement));
                        TypeTag      value         = new TypeTag(temporarySetVariable,
                                setAssignmentContext);
                        if(expcount == 1) {
                            Object[]  notes     = {"singletonsetinit",
                                                   temporarySetVariable, e1
                                                  };
                            setinit.setAnnotation(notes);
                            Object[]  resnotes  = {"singletonset", e1};
                            value.setAnnotation(resnotes);
                        }
                        return value;
                    }
                    catch(Exception whoops1) {
                        error("bad bitmap implementation of set " + whoops1);
                    }
                }
                else {
                    // a generic set
                    try {
                        prestatement = new Statement(oldprestatement,
                                                     prestatement);
                        return recursivesetlist();
                    }
                    catch(Exception whoops2) {
                        error("bad generic set implementation of set expression"
                              + whoops2);
                    }
                }
            }
            catch(Exception whoops) {
                error("bad set expression " + whoops);
            }
        }
        if(have(lex.TT_NUMBER)) {
            try {
                long  rounded  = (long) lex.theNumber;
                if((double) rounded == lex.theNumber) {
                    if((rounded >= -maxint) && (rounded <= maxint)) {
                        return new Int((int) lex.theNumber);
                    }
                    if((rounded >= 0) && (rounded <= ((0xffffffffL)))) {
                        return new Int(rounded, "uint32");
                    }
                    return new ilcg.tree.Int(rounded);
                }
            }
            catch(Exception e) {
            }
            return declareReal(lex.theNumber);
        }
        if(have(lex.TT_REAL)) {
            return declareReal(lex.theNumber);
        }
        String  theString  = lex.theString;
        if(have(lex.TT_STRING)) {
            // String theString = lex.theString;
            if(theString.length() == 1) {
                Node  r  = new TypeTag(
                    new ilcg.tree.CharLit(theString.charAt(0)), CHAR);
                // System.out.println(r+":"+getType(r));
                return r;
            }
            Node  v  = plantString(theString);
            return derank(v, validindices, indices, rank);
        }
        /*
         *  TRUE AND FALSE ARE NOW IDENTIFIERS IN CONFORMITY WITH PASCAL STANDARD
         *  if (have("TRUE")) { return new TypeTag(new BoolLit(true),BOOLEAN); }
         *  if (have("FALSE")) { return new TypeTag(new BoolLit(false),BOOLEAN);
         *  }
         */
        try {
            Node  v   = variable(rank, validindices, indices);
            v = derank(v, validindices, indices, rank);
            Type  vt  = getType(v);
            if(processor.verbose) {
                System.out.println("variable->" + v + ":" + vt + " "
                                   + vt.getClass());
            }
            if(vt instanceof Ref) {
                if(((Ref) vt).pointsTo instanceof ProcType) {
                    throw new TypeIdError("procedure variable", v);
                }
            }
            return v;
        }
        catch(TypeIdError u) {
            // see if the identifier is a procid
            String  id     = u.getMessage();
            Object  value  = u.value;
            //	System.out.println(id+"="+value+" check if procid");
            if(!(value instanceof ProcType||(value instanceof Ref && ((Ref)value).pointsTo instanceof ProcType))) {
                if(!id.equals("procedure variable")) {
                    throw u;
                }
                return parseProcCall(
                           (ProcType)((Ref) getType((Node) value)).pointsTo,
                           java.lang.Boolean.valueOf(true), "", (Node) value, rank,
                           validindices, indices);
            }
            return parseProcCall((ProcType) value, java.lang.Boolean.valueOf(false), id,
                                 null, rank, validindices, indices);
        }
    }
    Node parseProcCall(ProcType p, Boolean isVariable, String id, Node procref,
                       int rank, int validindices, Node[] indices) throws SyntaxError,
        TypeIdError {
        return parseProcCall(p,   isVariable,  id,  procref,
                             rank,   validindices,   indices,null);
    }

    /**
     *  Parse a procedure call. p is the type of the procedure. If a procedure
     *  variable is being called isVariable will be true in which case the id is
     *  undefined and procref will be the node refering to the memory location
     *  holding the procedure address. if isVariable is false then id holds the
     *  name of the procedure.
     *
     *@param  p                Description of the Parameter
     *@param  isVariable      if it is a variable use procref to get the procedure
     *@param  id               Description of the Parameter
     *@param  procref          address of location holding label to proc
     *@param  rank             Description of the Parameter
     *@param  validindices     Description of the Parameter
     *@param  indices          vector of active indices
     *@param instancevar       this is an optional pointer to the instance in case of a methoc call
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */

    Node parseProcCall(ProcType p, Boolean isVariable, String id, Node procref,
                       int rank, int validindices, Node[] indices,Node instancevar) throws SyntaxError,
        TypeIdError {
        Vector     actualParams  = new Vector();
        //System.out.println("in parseproccall proc type p= "+p+
        //                   "\ninstancevar="+instancevar);
        // if we are passed an instance variable we have to pass this
        // as the first actual parameter
        if(instancevar !=null) {
            // call of the form a.b(x,y)
            actualParams.add(instancevar);
        }
        else {
            if(p.method) {
                // call of method within class
                Object mythis = symbolTable.get("this");
                if(!(mythis instanceof Variable))
                    error("call of method outside of class without an instance available");
                instancevar = (Variable)mythis;
                actualParams.add(instancevar);
            }
        }
        boolean    list          = lex.lineno() >= Walker.switchon
                                   && lex.lineno() <= Walker.switchoff;
        int        returnrank    = getRank(p.returns);
        Type[]     formalParams  = p.params;
        if(p.numparams > 0) {
            if(have('(')) {
                for(int j = actualParams.size(); j < p.numparams; j++) {
                    int       paramrank  = getRank(formalParams[j]);
                    Variable  record     = null;
                    Node      exp        = isprocparam(formalParams[j]) ? recogniseProcId()
                                           : expression(paramrank, validindices - returnrank,
                                                        indices, formalParams[j]);
                    // System.out.println(" exp before forceparamcompatibility"+exp);
                    exp = forceParamCompatibility(exp, formalParams[j]);
                    // System.out.println(" exp after forceparamcompatibility"+exp);
                    actualParams.addElement(exp);
                    if(j < (p.numparams - 1)) {
                        if(!have(',')) {
                            System.out.print(id + "(");
                            error(id +":"+p+ " \ntoo few parameters supplied. \nWanted "
                                  + p.numparams + " got " + (j + 1));
                        }
                    }
                }
                mustbe(')');
            }
            else {
                // we fill in the params from iota
                if(p.numparams > validindices) {
                    error("( expected");
                }
                for(int j = 0; j < p.numparams; j++) {
                    actualParams.addElement(forceParamCompatibility(indices[j],
                                            formalParams[j]));
                }
            }
        }
        Cartesian  params        = new Cartesian(actualParams);
        int        indseq        = -1;
        containscalls = true;
        callcount++;
        try {
            String  prt  = resolvepointertypes(p.returns).type;
            String  drt  = Format.typeDeref(prt);
            Function   keepf= !isVariable?new Function(p.theProc):
                              new Function(procref, p.paramtypes(), p.returns.returnType());
            // System.out.println("p.returns="+p.returns);
            if(((p.returns instanceof SimpleType) && (Format.isReal(prt) || Format.isInteger(prt)))
                    || p.returns instanceof Pointer
                    // ||((Format.lengthInBytes(p.returns.type)<=4)&&!Format.isVector(p.returns.type))
                    || p.returns instanceof PointerToNamedType) {
                // Result returned in register
                Node       vt            = tempvar(p.returns);
                Statement  functioncall  = new Statement(
                    new Monad(
                        keepf,
                        params),
                    new Statement(new Assign(vt, new Cast(Format.typeDeref(vt.returnType()),
                                             processor.functionRetReg(p.returns.type))), null));
                // if the procedure is a pure function, add the Function to the
                // set of
                // pure statements
                if(p.isPure()) {
                    purefunctions.add(keepf);
                }
                prestatement = new Statement(prestatement, functioncall);
                unparalleled = true;
                return forcederef(vt);
            }
            else if(!prt.equals("uint8")) {
                // result will not go in register pass return location as final
                // param
                if(list) {
                    System.out.println("not in register " + prt + " "
                                       + p.returns + " " + p.returns.getClass());
                }
                Node       nv                 = tempvar(p.returns);
                Type       pt                 = new Ref(p.returns);
                Node       vt                 = forceParamCompatibility(nv, pt);
                actualParams.addElement(vt);
                Cartesian  aps;
                Statement  functioncall       = new Statement(new Monad(
                            keepf,
                            aps = new Cartesian(
                    actualParams)));
                if(p.isPure()) {
                    purefunctions.add(keepf);
                }
                // Save references to pure
                // functions
                boolean    indexusedinparams  = false;
                String     allparams          = aps.toString();
                // System.out.println(allparams);
                if(validindices > 0) {
                    for(int psel = 0; psel < indices.length; psel++) {
                        indexusedinparams = indexusedinparams
                                            || allparams.contains(indices[psel].toString());
                        // System.out.println("index = "+indices[psel]+
                        // indexusedinparams+validindices);
                    }
                }
                if(indexusedinparams || validindices == 0) {
                    prestatement = new Statement(prestatement, functioncall);
                }
                else {
                    // we move it out of the implicit loop as params do not
                    // depend on the loop
                    postpreloop(functioncall);
                }
                unparalleled = true;
                // System.out.println("return rank="+returnrank+" rank="+rank+"validindices="+validindices);
                if(returnrank > rank && validindices > 0) {
                    Node[]  lastIndices  = new Node[returnrank];
                    int     excess       = validindices - returnrank;
                    for(int i = 0; i < returnrank; i++) {
                        lastIndices[i] = indices[i + excess];
                    }
                    nv = subscript(nv, lastIndices);
                    returnrank = getRank(nv);
                }
                if(returnrank > rank) {
                    error(", function return has a rank greater than is permited by its context\ncontext demands"
                          + rank + " function return has rank " + returnrank);
                }
                return (nv);
            }
            error(" function returning void called in context where value required \n"
                  + p);
        }
        catch(Exception en) {
            en.printStackTrace();
            error("internal compiler error \nprocessing procedure call\n" + en);
        }
        return null;
    }


    /**
     *  Description of the Method
     *
     *@param  f  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean isprocparam(Type f) {
        return f instanceof ProcType ||
               (f instanceof Ref && isprocparam(((Ref) f).pointsTo));
    }


    /**
     *  parses a comma separated list of set elements returning the code to build a
     *  generic set of the appropriate form
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node recursivesetlist() throws SyntaxError {
        //	 System.out.println("recursive set list");
        Node  e  = (Node) getid("nil");
        try {
            Node    e2      = forcederef(expression());
            Type    te;
            if(!((te = getType(e2)).equals(setAssignmentContext.members))) {
                if(!(te instanceof StringType && setAssignmentContext.members instanceof StringType)) {
                    error("expression of type " + getType(e2) + " found where "
                          + setAssignmentContext.members + " expected ");
                }
            }
            //System.out.println("set assignment context members ="+setAssignmentContext.members+" bitmap imp="+setAssignmentContext. bitmapImplementation);
            Node[]  params  = {e2};
            Node    vt      = tempvar(setAssignmentContext);
            try {
                Node       getres        = new Assign(new Cast("ref " + ADDRESS.type, vt),
                                                      new TypeTag(new Deref(processor.functionRetReg(ADDRESS.type)), ADDRESS));
                Statement  functioncall  = new Statement(procCall(
                            setAssignmentContext.symbolTable,
                            "genericsetsingleton", params), new Statement(getres,
                                    null));
                postPrestatement(functioncall);
            }
            catch(Exception ee) {
                System.out.println("set assignment context ="
                                   + setAssignmentContext);
                System.out.println("vt=" + vt);
                error("in set list ( automatic function call) " + ee);
            }
            e = (forcederef(vt));
            if(have(',')) {
                try {
                    Node  vt2  = tempvar(setAssignmentContext);
                    //	System.out.println("set assignment context =" + setAssignmentContext);
                    //   System.out.println("vt2=" + vt2);
                    postPrestatement(new Statement(new Assign(vt2, setop(vt,
                                                   recursivesetlist(), "union"), false)));
                    return vt2;
                }
                catch(Exception ee) {
                    error("in set list (assignment to vt2) " + ee);
                }
            }
        }
        catch(Exception ee) {
            error("in set list " + ee);
        }
        mustbe(']');
        return new TypeTag(e, setAssignmentContext);
    }


    // handle dyadic operators between sets

    /**
     *  Description of the Method
     *
     *@param  left             left set operand
     *@param  right            right set operand
     *@param  op               string defining operation
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  Exception    Description of Exception
     */
    Node setdyad(Node left, Node right, String op) throws SyntaxError,
        Exception {
        Type     lt  = getType(left);
        Type     rt  = getType(right);
        SetType  st  = (SetType) lt;
        if(processor.verbose) {
            System.out.println("in set dyad " + lt + op + rt);
        }
        if(!(lt.equals(rt))) {
            if(processor.verbose) {
                System.out.println("set type " + lt + " does not match type "
                                   + rt + " for " + op);
            }
            SetType  lst    = (SetType) getType(left);
            SetType  rst    = (SetType) getType(right);
            SetType  union  = lst.union(rst);
            if(lst.bitmapImplementation && rst.bitmapImplementation) {
                int     len    = Format.getVectorTypeLength(left.returnType());
                Object[]  ann      = getAnnotations(right);
                if(processor.verbose)System.out.println("first alternative"+ann);
                if(ann!=null) if(processor.verbose)System.out.println("first alternative"+ann[0]+op);
                if(ann != null && ann[0].toString().equals("nullset")&&(op.equals("=")||op.equals("<>"))) {
                    Node       vt            = tempvar(BOOLEAN);
                    Node []p= {toset(forceeval(left)), new Int(len, "int32")};
                    Statement  functioncall  = new Statement(
                        procCall((op.equals("=")?"eq":"neq")+"nullset", p)
                        , new Statement(new Assign(vt,
                                                   processor.functionRetReg(BOOLEAN.type)), null));
                    postPrestatement(functioncall);
                    return vt;
                }
                return setdyad(expandSetTo(left, lst, union), expandSetTo(
                                   right, rst, union), op);
            }
            Type     le     = lst.elemtype;
            Type     re     = rst.elemtype;
            if(lst.bitmapImplementation && Format.isInteger(re.type)) {
                return dyad(makeDynamicBitmapReference(left, lst), right, op);
            }
            if(rst.bitmapImplementation && Format.isInteger(le.type)) {
                return dyad(left, makeDynamicBitmapReference(right, rst), op);
            }
            if(!Format.isInteger(re.type) || !Format.isInteger(le.type)) {
                error("set type " + lt + " does not match type " + rt + " for "
                      + op);
            }
        }
        if(op.equals("+")) {
            if(st.bitmapImplementation) {
                return new TypeTag(new Dyad(left, right, "OR"), lt);
            }
            // System.out.println("call setop");
            return setop(left, right, "union");
        }
        if(op.equals("><")) {
            if(st.bitmapImplementation) {
                return new TypeTag(new Dyad(left, right, "XOR"), lt);
            }
            return setop(left, right, "symetricdifference");
        }
        if(op.equals("=")) {
            return setcompare(left, right, "eq");
        }
        // >, < not in the standard
        // if (op.equals("<") )return setcompare(left,right,"lt");
        // if (op.equals(">") )return setcompare(left,right,"gt");
        if(op.equals("<=")) {
            return setcompare(left, right, "le");
        }
        if(op.equals(">=")) {
            return setcompare(left, right, "ge");
        }
        if(op.equals("<>")) {
            return setcompare(left, right, "neq");
        }
        if(op.equals("*")) {
            if(st.bitmapImplementation) {
                if(processor.verbose) {
                    System.out.println("bitmap implementation of * mapped to AND");
                }
                return new TypeTag(new Dyad(left, right, "AND"), lt);
            }
            return setop(left, right, "intersection");
        }
        if(op.equals("-")) {
            if(st.bitmapImplementation) {
                return new TypeTag(new Dyad(left, new TypeTag(monad(right,
                                            "NOT"), lt), "AND"), lt);
            }
            return setop(left, right, "difference");
        }
        error("operator " + op + " undefined for set types");
        return left;
        // never do this
    }


    /**
     *  Description of the Method
     *
     *@param  e                Description of the Parameter
     *@param  s                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node makeDynamicBitmapReference(Node e, SetType s) throws SyntaxError {
        Node[]  params  = {e, new Int(s.bottom(), intrep),
                           new Int(s.top(), intrep)
                          };
        try {
            Node  m   = procCall("makedynamicbitmapreference", params);
            Node  vt  = tempvar(POINTER);
            prestatement = new Statement(prestatement, new Statement(m,
                                         new Statement(new Assign(vt, processor.functionRetReg(POINTER.type)), null)));
            return new TypeTag(vt, new SetType(INTEGER, symbolTable,addrtype));
        }
        catch(Exception e2) {
            error(" converting static to dynamic set " + e2);
        }
        return null;
    }


    /**
     *  mismatched set dyad called when the left and right set types are not equal
     *
     *@param  value            Description of the Parameter
     *@param  originaltype     Description of the Parameter
     *@param  newtype          Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  Exception    Description of the Exception
     */
    // Node mismatchedsetdyad(Node left, Node right, String op) throws
    // SyntaxError, Exception {

    // }
    /**
     *  Create an empty set in the data area and copy the original into it
     *
     *@param  value            Description of the Parameter
     *@param  originaltype     Description of the Parameter
     *@param  newtype          Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  Exception    Description of the Exception
     */
    Node expandSetTo(Node value, SetType originaltype, SetType newtype)
    throws SyntaxError, Exception {
        if(processor.verbose) {
            System.out.println("expandsetto(" + originaltype + ", " + newtype
                               + ")");
        }
        if(originaltype.equals(newtype)) {
            if(processor.verbose) {
                System.out.println("(" + originaltype + "=" + newtype + ")");
            }
            return value;
        }
        Node  vt    = declareSet(new byte[(int) newtype.length() + 1], newtype);
        Node  i     = tempvar(INTEGER);
        Node  valt  = tempvar(originaltype);
        Node  init  = new Assign(valt, forcederef(value));
        Node  loop  = new For(
            i,
            new Int(0),
            new Int(((originaltype.top() - originaltype.bottom()) / 8),
                    "int32"),
            new Int(1, "int32"),
            new Assign(subscript(vt, dyad(i,
                                          new Int((originaltype.bottom() - newtype.bottom()) / 8,
                                                  "int32"), "+")), forcederef(subscript(valt, i))));
        postPrestatement(new Statement(init, new Statement(loop)));
        // vt= new TypeTag(vt,newtype);
        if(processor.verbose) {
            System.out.println("expanded set =" + vt + ":" + getType(vt));
        }
        return vt;
    }


    /**
     *  Description of the Method
     *
     *@param  setassign        Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node optimiseSetAssign(Node setassign) throws SyntaxError {
        // System.out.println("prestatement = "+prestatement);
        // System.out.println("setassign="+setassign);
        if(prestatement != null && prestatement.next != null) {
            try {
                Object[]  notes  = prestatement.next.getAnnotation();
                if(notes != null
                        && notes[0].toString().equals("singletonsetinit")) {
                    //System.out.println(notes[0]);
                    //System.out.println(setassign);
                    //System.out.println(setassign.getClass());
                    ScalarRange  sr  = (ScalarRange) setAssignmentContext.members;
                    if(setassign instanceof Assign) {
                        Assign  a      = (Assign) setassign;
                        Node    desrc  = TypeTag.decast(a.src);
                        //System.out.println("desrc="+desrc);
                        if(desrc instanceof Dyad) {
                            Dyad  d  = (Dyad) desrc;
                            //System.out.println("a.dest="+forcederef(a.dest));
                            //System.out.println("d.left="+d.left);
                            if(forcederef(a.dest).equals(d.left)) {
                                // statement of the form s:=s op [e]
                                // System.out.println("d.right"+d.right);
                                if(d.O.Symbol.equals("OR")) {
                                    try {
                                        Object[]  ann      = getAnnotations(d.right);
                                        Node      deright  = TypeTag.decast(d.right);
                                        if(ann != null
                                                && ann[0].toString().equals(
                                                    "singletonset")) {
                                            //  System.out.println(ann[0]);
                                            // optimise the insertion of an
                                            // element
                                            Node  e        = (Node) ann[1];
                                            Node  newform  = setbit(
                                                                 a.dest,
                                                                 e,
                                                                 new Int(sr.bottom(), intrep));
                                            //System.out.println("optimsed to "+newform);
                                            prestatement.next = null;
                                            return newform;
                                        }
                                    }
                                    catch(Exception ee) {
                                        System.out.println(ee);
                                    }
                                }
                                if(d.O.Symbol.equals("AND")) {
                                    // check if the op is a minus
                                    Node  deright  = TypeTag.decast(d.right);
                                    if(deright instanceof Monad) {
                                        Monad  dright  = (Monad) deright;
                                        // System.out.println(dright);
                                        if(dright.oper.Symbol.equals("NOT")) {
                                            Node      arg  = dright.getArg();
                                            Object[]  ann  = getAnnotations(arg);
                                            // System.out.println(arg);
                                            if(ann != null
                                                    && ann[0]
                                                    .toString()
                                                    .equals(
                                                        "singletonset")) {
                                                try {
                                                    // System.out.println(ann[0]);
                                                    // optimise the removal of
                                                    // an element
                                                    Node  e        = (Node) ann[1];
                                                    Node  newform  = unsetbit(
                                                                         (Variable) a.dest,
                                                                         e, new Int(sr.bottom(),
                                                                                    intrep));
                                                    // System.out.println(newform);
                                                    prestatement.next = null;
                                                    return newform;
                                                }
                                                catch(Exception eee) {
                                                    // System.out.println(eee);
                                                    // ignore
                                                    // errors
                                                    // just
                                                    // dont
                                                    // optimise
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch(Exception faulty) {
                System.out.println("cant optimse set assignment as " + faulty);
            }
        }
        return setassign;
    }


    /**
     *  Description of the Method
     *
     *@param  array            Description of Parameter
     *@param  index            Description of Parameter
     *@param  lwb              Description of the Parameter
     *@exception  SyntaxError  Description of the Exception
     */
    void setbit(byte[] array, int index, int lwb) throws SyntaxError {
        // System.out.println("setbit("+index+","+lwb+")");
        int  nindex  = index - (lwb & 0xfffffff8);
        try {
            array[nindex >> 3] |= (1 << (nindex & 7));
        }
        catch(Exception e) {
            error(" Value beyond range of set type :" + nindex
                  + " derived from " + index + "\n\t produces offset "
                  + (nindex >> 3) + " but bitmap is of length "
                  + array.length + " bytes");
        }
    }


    /**
     *  Description of the Method
     *
     *@param  array          Description of Parameter
     *@param  index          Description of Parameter
     *@param  lwb            Description of the Parameter
     *@return                Description of the Returned Value
     *@exception  Exception  Description of Exception
     */
    Node setbit(Node array, Node index, Node lwb) throws Exception {
        // System.out.println("dsetbit "+array+","+index+","+lwb);
        index = new TypeTag(forcederef(index), INTEGER);
        lwb = new TypeTag(dyad(forcederef(lwb), new Int(0xfffffff8, intrep),
                               "AND"), INTEGER);
        // System.out.println("after adjust"+index+",  "+lwb);
        index = dyad(index, lwb, "-").eval();
        // System.out.println(" index scaled ="+index);
        Node  offset  = dyad(index, new Int(3, intrep), ">>").eval();
        // new Dyad(forcederef(index, INTEGER),
        // new Int(3, intrep), shrii);
        Node  mask    = new Cast(byterep,
                                 dyad(
                                     new Cast(byterep,
                                              new Int(1, intrep)
                                             )
                                     ,
                                     new Cast(byterep,
                                              new Dyad(forcederef(index, INTEGER), new Int(7, intrep), andii)
                                             )
                                     ,
                                     "<<")
                                ) ;
        Node  target  = subscript(array, offset);
        // System.out.println("target="+target+"\nmask="+mask);
        return new Assign(target, new Dyad(
                              new Cast(byterep, new Deref(target)), mask, "OR"));
    }


    /**
     *  Description of the Method
     *
     *@param  array          Description of the Parameter
     *@param  index          Description of the Parameter
     *@param  lwb            Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Node unsetbit(Variable array, Node index, Node lwb) throws Exception {
        /*  index = new TypeTag(dyad(index, lwb, "-").eval(),
                              getType(forcederef(index)));

          Node      offset   = new Dyad(forcederef(index, INTEGER), new Int(3, intrep),
                                        shrii);
          Node      mask     = dyad(new Int(1, intrep), dyad(forcederef(index, INTEGER),
                                    new Int(7, intrep), "AND"), "<<");*/
        index = new TypeTag(forcederef(index), INTEGER);
        lwb = new TypeTag(dyad(forcederef(lwb), new Int(0xfffffff8, intrep),
                               "AND"), INTEGER);
        // System.out.println("after adjust"+index+",  "+lwb);
        index = dyad(index, lwb, "-").eval();
        // System.out.println(" index scaled ="+index);
        Node  offset  = dyad(index, new Int(3, intrep), ">>").eval();
        // new Dyad(forcederef(index, INTEGER),
        // new Int(3, intrep), shrii);
        Node  mask    =
            dyad(
                // new Cast(byterep,
                new Int(1, intrep)
                //	)
                ,
                //  new Cast(byterep,
                new Dyad(forcederef(index, INTEGER), new Int(7, intrep), andii)
                //  )
                ,      "<<")
            ;
        mask = //  new Cast(byterep,
            dyad(mask, new Int(-1), "XOR")
            // )
            ;
        Variable  maskvar  = (Variable) tempvar(INTEGER);
        Node      init     = new Assign(maskvar, new TypeTag(mask, INTEGER));
        Node     target   =subscript(array, offset);
        // target = new Memref(target.index , intrep);
        return new Assign(target,
                          new Cast(byterep,  dyad(
                                       new Deref(target), mask, "AND")));
    }


    /**
     *  Gets the lab attribute of the PascalCompiler object
     *
     *@param  lab              Description of Parameter
     *@return                  The lab value
     *@exception  SyntaxError  Description of Exception
     */
    Label getLab(double lab) throws SyntaxError {
        Object  l  = symbolTable.getCurrentScope().get(labname(lab));
        if(l == null) {
            error("label was not dececlared in this context or procedure :"
                  + (long) lab);
        }
        return (Label) l;
    }


    /**
     *  Gets the labglobal attribute of the PascalCompiler object
     *
     *@param  lab              Description of the Parameter
     *@return                  The labglobal value
     *@exception  SyntaxError  Description of the Exception
     */
    Label getLabglobal(double lab) throws SyntaxError {
        Object  l  = symbolTable.get(labname(lab));
        if(l == null) {
            error("label was not dececlared   :" + (long) lab);
        }
        return (Label) l;
    }


    /**
     *  Description of the Method
     *
     *@param  s  Description of Parameter
     *@return    Description of the Returned Value
     */
    boolean isreal(String s) {
        return Format.isReal(s);
    }


    /**
     *  Description of the Method
     *
     *@param  r  Description of Parameter
     *@return    Description of the Returned Value
     */
    boolean isreal(Type r) {
        return isreal(r.type);
    }


    /**
     *  Gets the type attribute of the PascalCompiler object
     *
     *@param  v                Description of Parameter
     *@return                  The type value
     *@exception  SyntaxError  Description of Exception
     */
    Type getType(Node v) throws SyntaxError {
        return resolvepointertypes(gettype(v));
    }


    /**
     *  Gets the annotations attribute of the PascalCompiler object
     *
     *@param  n  Description of the Parameter
     *@return    The annotations value
     */
    Object[] getAnnotations(Node n) {
        if(n instanceof Annotated) {
            return ((Annotated) n).getAnnotation();
        }
        return null;
    }


    /**
     *  returns true if an ordinal or integer type occupies the full range of the
     *  possible representation
     *
     *@param  t  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean fullrange(Type t) {
        if(t instanceof ScalarRange) {
            return ((ScalarRange) t).fullrange();
        }
        return false;
    }


    /*
     *  Get the rank of a value, 0 for non array objects
     */
    /**
     *  Gets the rank attribute of the PascalCompiler object
     *
     *@param  v                Description of Parameter
     *@return                  The rank value
     *@exception  SyntaxError  Description of Exception
     */
    int getRank(Node v) throws SyntaxError {
        Type  t  = INTEGER;
        int   r  = 0;
        // System.out.print("Get rank "+v);
        if(v instanceof Type) {
            t = (Type) v;
            if(t instanceof Pointer) {
                return 0;
            }
            if(t instanceof Ref) {
                t = ((Ref) t).pointsTo;
            }
        }
        else {
            return getRank(getType(v));
        }
        // System.out.print(":"+t);
        if(t instanceof StringType) {
            r = 0;
        }
        else if(t instanceof SetType) {
            r = 0;
        }
        // note that sets are stored in arrays of bytes but have rank 0
        else if(t instanceof ArrayType) {
            r = ((ArrayType) t).rank();
        }
        // System.out.println("->"+r);
        return r;
    }


    /**
     *  Description of the Method
     *
     *@param  v                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type gettype(Node v) throws SyntaxError {
        if(processor.verbose) {
            // System.out.println("GetType " + v + ":" + v.getClass());
        }
        if(v instanceof Deref) {
            Node  v1;
            Type  r   = getType(v1 = ((Deref) v).getArg());
            if(!(r instanceof Ref)) {
                try {
                    error("compiler error:in getType, deref operation found on non ref type "
                          + r);
                }
                catch(SyntaxError se) {
                    se.printStackTrace();
                    throw se;
                }
            }
            return ((Ref) r).pointsTo;
        }
        if(v instanceof Variable) {
            Type  res  = (Type)((Variable) v).getType();
            return res;
        }
        if(v instanceof CharLit) {
            return CHAR;
        }
        if(v instanceof BoolLit) {
            return BOOLEAN;
        }
        if(v instanceof Int) {
            String  rt  = v.returnType();
            if(rt.equals(byterep)) {
                return BYTE;
            }
            if(rt.equals(LONG.type)) {
                return LONG;
            }
            return INTEGER;
        }
        if(v instanceof Real) {
            return REAL;
        }
        if(v instanceof TypeTag) {
            return ((TypeTag) v).thistype;
        }
        if(v instanceof Memref) {
            String  rt  = v.returnType();
            if(!rt.startsWith("ref")) {
                error("compiler error:found a memref whose type did not start with ref:"
                      + rt);
            }
            rt = rt.substring(4);
            // remove leading ref
            return new Ref(string2Type(rt));
        }
        String  s  = v.returnType();
        return string2Type(s);
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     *@return    Description of the Returned Value
     */
    boolean isrefany(Node n) {
        // check if an untyped var param
        if(!(n instanceof Ref)) {
            return false;
        }
        Ref  r  = (Ref) n;
        return r.pointsTo.equals(ANY);
    }


    /**
     *  This obtains the address of a variable which must be a memref
     *
     *@param  n                a node of type memref
     *@return                  The addr value
     *@exception  SyntaxError  Description of Exception
     */
    Node getAddr(Node n) throws SyntaxError {
        // System.out.println("in getAddr "+n);
        Type  t   = getType(n);
        while(n instanceof Cast) {
            n = (((Cast) n).getSubtree());
        }
        if(!(n instanceof Memref)) {
            if(t instanceof Pointer) {
                return new TypeTag(n, ADDRESS);
            }
            else if(n instanceof Deref) {
                return getAddr(((Deref) n).getArg());
            }
            else if(n instanceof ProcType) {
                return new TypeTag((((ProcType) n).theProc.start), new Ref((ProcType)n));
            }
            else {
                error("Not a memory reference :" + n);
            }
        }
        Node  n1  = new TypeTag(((Memref) n).index, ADDRESS);
        // System.out.println("Addr "+n+"="+n1);
        return n1;
    }


    /**
     *  Description of the Method
     *
     *@param  op  Description of Parameter
     *@return     Description of the Returned Value
     */
    boolean iscomparison(String op) {
        return op.equals("=") || op.equals("<>") || op.equals("<")
               || op.equals("<=") || op.equals(">") || op.equals(">=");
    }


    /**
     *  Description of the Method
     *
     *@param  op  Description of Parameter
     *@return     Description of the Returned Value
     */
    boolean isboolean(String op) {
        return op.equals("AND") || op.equals("OR") || op.equals("XOR");
    }


    /**
     *  recognises pow expression
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int getpower() throws SyntaxError {
        if(have("pow")) {
            int  sign  = 1;
            if(have('-')) {
                sign = -1;
            }
            else if(have('+')) {
                sign = 1;
            }
            mustbe(lex.TT_NUMBER);
            return (int) lex.theNumber * sign;
        }
        return 1;
    }


    /**
     *  cause n to be exectuted before current loop
     *
     *@param  n  Description of Parameter
     */
    void postpreloop(Node n) {
        if(n == null) {
            return;
        }
        n = n.eval();
        if(n == null) {
            return;
        }
        if(iteratorstack.empty()) {
            postPrestatement(n);
        }
        else {
            recordPreloopAction(innerIterator(), n);
        }
    }


    /**
     *  checks is a name is a schema parameter during type definition
     *
     *@param  name
     *@param  dimension        if name is a schema param sets its dimension field
     *      to this
     *@param  bound            and sets it bound to this
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    boolean schemaParamCheck(String name, int dimension, int bound)
    throws SyntaxError {
        Object       o  = symbolTable.get(name);
        if(!(o instanceof SchemaField)) {
            return false;
        }
        SchemaField  s  = (SchemaField) o;
        s.dimension = dimension;
        s.bound = bound;
        s.usage++;
        if(s.usage > 1) {
            error("A schema parameter must uniquely identify an array bound, but "
                  + name
                  + " is being re-used."
                  + "\n\t\t\t This would cause "
                  + name
                  + " to be an ambiguously defined field of the run-time array descriptor");
        }
        return true;
    }


    /**
     *  Parses 'of' <type> in the context of a dynamic array declaration whose
     *  number of dimensions is given in dims
     *
     *@param  dims             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    ArrayType mkDynamicArrayType(int dims) throws SyntaxError {
        mustbe("of");
        Type       t          = type();
        int        numparams  = 1;
        if(t instanceof ArrayType) {
            numparams += ((ArrayType) t).getNumParams();
        }
        while(t instanceof ArrayType) {
            dims += ((ArrayType) t).rank();
            t = ((ArrayType) t).elemtype;
        }
        ArrayType  at         = new ArrayType(dims, t, (int) t.sizeOf(processor));
        at.setNumParams(numparams);
        return at;
    }


    /**
     *  constant-declaration: const identifier = constant constant-declaration ;
     *  identifier = constant type-declaration: type identifier = type
     *  type-declaration ; identifier = type
     *
     *@exception  SyntaxError  Description of Exception
     */
    void type_declaration() throws SyntaxError {
        String  tid;
        while(have(lex.TT_IDENTIFIER)) {
            tid = lex.theId;
            if(have('(')) {
                // schematic type declaration
                symbolTable.enterScope();
                boolean    more          = true;
                Vector     allnames      = new Vector();
                while(more) {
                    Stack  vars  = new Stack();
                    variableid_list(vars);
                    mustbe(':');
                    Type   t     = type();
                    for(int i = 0; i < vars.size(); i++) {
                        String  name  = (String) vars.elementAt(i);
                        allnames.addElement(name);
                        symbolTable.put(name, new SchemaField(t, name));
                    }
                    more = have(';');
                }
                mustbe(')');
                mustbe('=');
                // System.out.println("parametric type");
                mustbe("ARRAY");
                mustbe('[');
                int        dims          = 0;
                Node[][]   staticbounds  = new Node[32][2];
                boolean    moredims      = true;
                while(moredims) {
                    try {
                        boolean  haveid  = lex.peek(lex.TT_IDENTIFIER);
                        String   theId   = lex.theString;
                        // System.out.println("bound ="+theId);
                        if(haveid && schemaParamCheck(theId, dims, 0)) {
                            mustbe(lex.TT_IDENTIFIER);
                            staticbounds[dims][0] = null;
                        }
                        else {
                            staticbounds[dims][0] = expression().eval();
                        }
                        mustbe("..");
                        haveid = lex.peek(lex.TT_IDENTIFIER);
                        theId = lex.theString;
                        if(haveid && schemaParamCheck(theId, dims, 1)) {
                            mustbe(lex.TT_IDENTIFIER);
                            staticbounds[dims][1] = null;
                        }
                        else {
                            staticbounds[dims][1] = expression().eval();
                        }
                        dims++;
                        if(dims > maxdims) {
                            error("Do you really need this many dimensions in the array?");
                        }
                        moredims = have(',');
                    }
                    catch(Exception e1) {
                        error("While parsing schematic type declaration \n"
                              + e1);
                    }
                }
                mustbe(']');
                ArrayType  at            = mkDynamicArrayType(dims);
                Type       t             = at;
                at.setNumParams(allnames.size());
                for(int jim = 0; jim < allnames.size(); jim++) {
                    String       name  = (String) allnames.elementAt(jim);
                    Object       o     = symbolTable.get(name);
                    if(!(o instanceof SchemaField)) {
                        error(name + "is not a schema parameter");
                    }
                    SchemaField  s     = (SchemaField) o;
                    at.setBoundPosition(s.dimension, s.bound, jim);
                    at.setBoundName(s.dimension, s.bound, name);
                }
                for(int b = 0; b < 2; b++) {
                    for(int d = 0; d < dims; d++) {
                        if(staticbounds[d][b] != null) {
                            Node  bound  = staticbounds[d][b];
                            if(bound instanceof Int) {
                                at.setStaticBound(d, b, ((Int) bound)
                                                  .intValue());
                            }
                            else {
                                error("dimension " + d + " bound " + b
                                      + " not known at compile time"
                                      + ", nor is it a schema parameter");
                            }
                        }
                    }
                }
                symbolTable.leaveScope();
                symbolTable.put(tid, t);
            }
            else {
                mustbe("=");
                Type  t  = type();
                symbolTable.put(tid, t);
            }
            // System.out.println(tid+"="+t);
            mustbe(';');
        }
    }


    /**
     *  Description of the Method
     *
     *@param  rank             Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    Node expression(int rank) throws SyntaxError, TypeIdError {
        Node[]  indices  = new Node[1];
        return expression(rank, 0, indices);
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node expression() throws SyntaxError, TypeIdError {
        return expression(0);
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of Parameter
     */
    void declareExternal(String n) {
        wholeProgram = new Statement(new ImpLabel(Walker.procprefix + n),
                                     wholeProgram);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    boolean inUnit() {
        // System.out.println("isunit="+isunit+" lexicallevel="+lexicalLevel+" unitlevel="+unitlevel);
        return
            /*
             *  isunit &&
             */
            lexicalLevel == unitlevel;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    LocalStoreAllocator currentLocalAllocator() {
        return (LocalStoreAllocator) allocatorStack.peek();
    }


    /**
     *  Check for presence of a token
     *
     *@param  token            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    boolean have(int token) throws SyntaxError {
        // if
        // (processor.verbose)System.out.println("Have("+lex.totext(token)+")");
        return lex.have(token);
    }


    /**
     *  Description of the Method
     *
     *@param  s                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    boolean have(String s) throws SyntaxError {
        // if (processor.verbose)System.out.println("Have("+s+")");
        if(lex.have(s)) {
            // if (processor.verbose)System.out.println("yes");
            return true;
        }
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  s                Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void mustbe(String s) throws SyntaxError {
        if(!have(s)) {
            try {
                lex.mustbe(s);
            }
            catch(SyntaxError sy) {
                error(sy.getMessage());
            }
        }
    }


    /**
     *  Description of the Method
     *
     *@exception  SyntaxError  Description of the Exception
     */
    void nextSym() throws SyntaxError {
        lex.nextsymbol();
    }


    /**
     *  Description of the Method
     *
     *@param  token            Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void mustbe(int token) throws SyntaxError {
        try {
            lex.mustbe(token);
        }
        catch(Exception e) {
            error(e.getMessage());
        }
    }


    /**
     *  Parser routines a la recursive descent
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node program() throws SyntaxError {
        if(have("library")) {
            inlib = true;
            return unit();
        }
        if(have("unit")) {
            return unit();
        }
        mustbe("PROGRAM");
        mustbe(lex.TT_IDENTIFIER);
        String     name  = lex.theString;
        enterScope();
        unitbase = new Label("PmainBase");
        lexicalLevel = global;
        // Node heading =program_headingopt() ;
        if(have('(')) {
            mustbe(lex.TT_IDENTIFIER);
            while(have(',')) {
                mustbe(lex.TT_IDENTIFIER);
            }
            mustbe(')');
        }
        mustbe(lex.TT_SEMICOLON);
        useSpec();
        enterScope();
        Block      bl    = (Block) block();
        leaveScope();
        // System.out.println("block ="+bl);
        mustbe(lex.TT_FULLSTOP);
        if(latexLevel >= 0) {
            String      fileName  = pathPrefix + sourceName;
            vPTeX.printToDoc(fileName,
                             "\\documentclass[10pt, a4paper]{article}\n"
                             + "\\usepackage{graphicx, epsfig}\n"
                             + "\\reversemarginpar\n" + "\\title{" + sourceName
                             + "}\n" + "\\begin{document}\n" + "\\maketitle\n",
                             true);
            vPTeX.printToDoc(fileName, "\\tableofcontents\n\\section{" + name
                             + "}", false);
            PascalFile  latexer   = new PascalFile(fileName);
            latexer.createLatex((byte) latexLevel, true, false);
            Object[]    units     = new Object[unitsToCall.size()];
            for(int y = 0; y < unitsToCall.size(); y++) {
                units[y] = unitsToCall.elementAt(y);
            }
            for(int x = 0; x < units.length; x++) {
                String  uname  = units[x].toString();
                if(!uname.equals("system")) {
                    vPTeX.printToDoc(fileName, "\\section{" + uname
                                     + "}\n\\input{" + uname + "}\n", false);
                }
            }
            System.out.println(fileName + "->TeX");
            vPTeX.printToDoc(fileName, "\\end{document}", false);
        }
        leaveScope();
        Object[]   arr   = new Object[unitsToCall.size()];
        for(int y = 0; y < unitsToCall.size(); y++) {
            arr[y] = unitsToCall.elementAt(y);
        }
        Procedure  main  = new Procedure("Pmain", 0, "[]", "void", new Label(),
                                         bl, global, arr);
        main.isExported = true;
        // System.out.println(wholeProgram==null);
        return new Statement(wholeProgram, new Statement(main, new Statement(
                                 dataDecls, null)));
    }


    /**
     *  Description of the Method
     *
     *@exception  SyntaxError  Description of Exception
     */
    void interfaceDecls() throws SyntaxError {
        boolean  ok  = true;
        while(ok) {
            if(have("const")) {
                constDecls();
            }
            if(have("operator")) {
                opdecls();
            }
            else if(have("type")) {
                type_declaration();
            }
            else if(have("var")) {
                variable_declaration();
            }
            else if(have("procedure")) {
                proc_or_fn(false, false, true);
                have(';');
            }
            else if(have("pure")) {
                mustbe("function");
                proc_or_fn(true, true, true);
                have(';');
            }
            else if(have("function")) {
                proc_or_fn(false, true, true);
                have(';');
            }
            else {
                ok = false;
            }
        }
    }


    /**
     *  Description of the Method
     *
     *@exception  SyntaxError  Description of the Exception
     */
    void opdecls() throws SyntaxError {

        String    sym     = "";
        int args=0;
        String []mons= { "cast"};
        for( String s :mons ) {
            if (have(s)) {
                sym=s;
            }
        }
        if (sym=="cast")sym="$cast";
        if (sym=="") {
            sym=dyadicOperator();
            args=2;
        }
        else args=1;


        //String    sym     = (have("cast") ? "$cast" : dyadicOperator());
        mustbe('=');
        mustbe(lex.TT_IDENTIFIER);
        String    fn      = lex.theId;
        boolean   simple  = (sym.equals("$cast") || sym.equals("<")|| sym.equals(".")
                             || sym.equals(">") || sym.equals(">=") || sym.equals("<=")
                             || sym.equals("<>") || sym.equals("="));
        if(!simple) {
            mustbe(',');
        }
        ProcType  p       = (ProcType) symbolTable.get(fn);
        if(p.returns == null) {
            error(" no value returned by function ");
        }
        if(!(args==1)) {
            if(p.params.length != 2) {
                error(" not dyadic operator ");
            }
        }
        try {
            Node  identity  = (simple ? null : expression(getRank(p.returns)));
            symbolTable.put(sym, new UserDefinedOperator(symbolTable.get(sym),
                            sym, p, identity));
        }
        catch(TypeIdError te) {
            error("type identifiers not allowed here :" + te.getMessage());
        }
        mustbe(';');
    }


    /**
     *  Description of the Method
     *
     *@param  op               Description of the Parameter
     *@param  left             Description of the Parameter
     *@param  right            Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node applyop(UserDefinedOperator op, Node left, Node right)
    throws SyntaxError {
        ProcType   p             = op.getProc();
        Vector     actualParams  = new Vector();
        int        pp            = 0;
        if(left != null) {
            actualParams.addElement(forceParamCompatibility(left,
                                    p.params[pp++]));
        }
        if(right != null) {
            actualParams.addElement(forceParamCompatibility(right,
                                    p.params[pp++]));
        }
        Cartesian  Params        = new Cartesian(actualParams);
        containscalls = true;
        callcount++;
        try {
            String  prt  = p.returns.returnType();
            if(p.returns instanceof SimpleType
                    & (Format.isReal(prt) || Format.isInteger(prt))
                    || p.returns instanceof Pointer
                    || p.returns instanceof PointerToNamedType) {
                // Result returned in register
                Function   keepf;
                Node       call          = new Monad(keepf = new Function(p.theProc), Params);
                if(p.isPure()) {
                    purefunctions.add(keepf);
                }
                Node       vt            = tempvar(p.returns);
                Statement  functioncall  = new Statement(call,
                        new Statement(new Assign(vt, processor.functionRetReg(p.returns.type)), null));
                // must be evaluated in innermost loop
                prestatement = new Statement(prestatement, functioncall);
                unparalleled = true;
                return forcederef(vt);
            }
            else {
                // result will not go in register pass return location as final
                // param
                Node       nv            = tempvar(p.returns);
                Type       pt            = new Ref(p.returns);
                // System.out.println("not in register "+prt+" nv ="+nv+"pt"+pt);
                Node       vt            = forceParamCompatibility(nv, pt);
                actualParams.addElement(vt);
                Function   keepf;
                Statement  functioncall  = new Statement(new Monad(
                            keepf = new Function(p.theProc), new Cartesian(
                                actualParams)));
                if(p.isPure()) {
                    purefunctions.add(keepf);
                }
                prestatement = new Statement(prestatement, functioncall);
                unparalleled = true;
                if(!(p.returns instanceof ArrayType)) {
                    nv = forcederef(nv);
                }
                return new TypeTag(nv, p.returns);
            }
        }
        catch(Exception en) {
            error("internal compiler error \nin operator application\n"
                  + en.getMessage());
            return null;
        }
    }


    /**
     *  Function that evalutes a dyad using a user defined operator LIST
     *
     *@param  op               The head of a list of operators with the correct
     *      symbol
     *@param  left             the left operand, must be a value not a reference to
     *      a value
     *@param  right            the right operand ditto
     *@return                  a syntax tree that evaluates the dyad
     *@exception  SyntaxError  Description of the Exception
     */
    Node dyadlist(UserDefinedOperator op, Node left, Node right)
    throws SyntaxError {
        Type  LT  = op.getLeftType();
        Type  RT  = op.getRightType();
        // System.out.println("dyadlist "+op+LT+RT);
        try {
            return applyop(op, forceTypeCompatibility(left, LT),
                           forceTypeCompatibility(right, RT));
        }
        catch(Exception e) {
            // System.out.println("Failed dyadlist try next");
            Object  n  = op.next;
            if(n == null) {
                error("cannot find operator " + op + " to match context " + "("
                      + LT + "," + RT + ")" + e);
            }
            return dyadlist((UserDefinedOperator) n, left, right);
        }
    }


    /**
     *  Description of the Method
     *
     *@param  right            Description of the Parameter
     *@param  LT               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node cast2(Node right, Type LT) throws SyntaxError {
        if(isreal(LT) && !isreal(right.returnType())) {
            return (optionalfloat(LT, right.eval()));
        }
        UserDefinedOperator  op  = null;
        Type                 RT  = getType(right);
        try {
            op = (UserDefinedOperator) symbolTable.get("$cast");
        }
        catch(Exception nocast) {
            // System.out.println("no casts found"+nocast);
            error("no user defined casts available   ");
        }
        while(op != null) {
            try {
                Type  cret  = op.getProc().returns;
                if(verbose)System.out.println("scan cast list "+op +"->"+cret);
                if(cret.equals(LT)) {
                    Type  cleft     = op.getLeftType();
                    Node  newright  = forceParamCompatibility(right, cleft);
                    return new TypeTag(applyop(op, null, newright), LT);
                }
                
                error("user defined cast operator returns wrong type");
            }
            catch(Exception e) {
                // System.out.println("attempt failed "+e);
                Object  n  = op.next;
                if(n == null) {
                    error("cant find a cast operator to match context for\n"
                          + RT);
                }
                op = (UserDefinedOperator) n;
            }
        }
        return null;
    }


    /**
     *  Gets the identity attribute of the PascalCompiler object
     *
     *@param  op               Description of the Parameter
     *@param  LT               Description of the Parameter
     *@return                  The identity value
     *@exception  SyntaxError  Description of the Exception
     */
    Node getIdentity(UserDefinedOperator op, Type LT) throws SyntaxError {
        if(op.getLeftType().equals(LT)) {
            return op.identityElement;
        }
        Object  n  = op.next;
        if(n == null) {
            error("\ncant find operator to match context " + op.symbol + " "
                  + LT);
        }
        return getIdentity((UserDefinedOperator) n, LT);
    }


    /**
     *  Gets the identity attribute of the PascalCompiler object
     *
     *@param  op               Description of the Parameter
     *@param  LT               Description of the Parameter
     *@return                  The identity value
     *@exception  SyntaxError  Description of the Exception
     */
    Node getIdentity(String op, Type LT) throws SyntaxError {
        Object  list  = symbolTable.get(op);
        if(list == null) {
            error("no predefined or user defined identity element found for "
                  + op + " compatible with " + LT);
            return null;
        }
        return getIdentity((UserDefinedOperator) list, LT);
    }


    /**
     *  Function that evalutes a dyad using a user defined operator op
     *
     *@param  op               The operator symbol
     *@param  left             the left operand, must be a value not a reference to
     *      a value
     *@param  right            the right operand ditto
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node userdyad(String op, Node left, Node right) throws SyntaxError {
        // System.out.println("userdyad("+op+","+left+","+right+" )");
        Object  list  = symbolTable.get(op);
        if(list == null) {
            error("no predefined or user defined operator found for " + op
                  + " compatible with " + getType(left) + op + getType(right));
            return null;
        }
        return dyadlist((UserDefinedOperator) list, left, right);
    }


    /**
     *  Description of the Method
     *
     *@exception  SyntaxError  Description of Exception
     */
    void constDecls() throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        do {
            String  id  = lex.theId;
            if(have(':')) {
                // the constant must be planted in the data declaration area
                // of the assembly code, allowing it to be modified at run time
                Type  prim  = type();
                Type  t     = new Ref(prim);
                mustbe('=');
                try {
                    Label   newlab  = newdatalabel();
                    boolean inlr = inLineReals;
                    inLineReals=true;// we need the actual const for this
                    Node    value   = forceTypeCompatibility(constant(true, prim),
                                      prim);
                    inLineReals=inlr;
                    String  vt;
                    if(!t.type.equals(vt = "ref " + value.returnType())) {
                        error("type error in constant, wanted " + t + " got "
                              + vt);
                    }
                    int     size    = (int) t.sizeOf(processor);
                    Node    index   = (prim instanceof ArrayType
                                       && ((ArrayType) prim).elemtype instanceof StringType ?
                                       // it
                                       // has
                                       // already
                                       // been
                                       // planted
                                       // for
                                       // string
                                       // arrays
                                       // we just need to generate a new data label
                                       newlab
                                       : plant(value));
                    // System.out.println("const ="+value+" addr = "+index);
                    try {
                        Variable  v;
                        symbolTable.put(id,
                                        v = new Variable(size, t, vt, index));
                        v.setName(id);
                        v.Protected = true;
                    }
                    catch(Exception e) {
                        error(e.toString());
                    }
                }
                catch(TypeIdError te) {
                    error("type identifiers not allowed here :"
                          + te.getMessage());
                }
            }
            else {
                mustbe('=');
                try {
                    Node  value  = constant(false);
                    symbolTable.put(id, value);
                }
                catch(TypeIdError te) {
                    error("type identifiers not allowed here :"
                          + te.getMessage());
                }
            }
            mustbe(';');
        }
        while(have(lex.TT_IDENTIFIER));
    }


    // this holds the names of the .o files used in the units that are loaded

    /**
     *  Description of the Method
     *
     *@param  unit             Description of Parameter
     *@param  apuname          Description of the Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void compileUnit(String unit,String pathPrefix, String apuname) throws SyntaxError {
        String  asmfile  = pathPrefix + unit + apuname + ".asm";
        System.out.println("output unit to "+asmfile);
        try {
            // Walker w = (Walker) processor.getClass().newInstance();
            Walker                  w       = getCodeGenerator(apuname + "CG", processor.getLogFile());
            String resolvedprefix = pathPrefix;
            w.verbose = processor.verbose;
            String filename=pathPrefix+unit;
            FileInputStream         sf =null;
            try {
                sf      = new FileInputStream(filename + ".pas");
            }
            catch (Exception fe) {

                //    System.out.println(" try to find unit in mmpcdir");


                String  Prefix  = System.getProperty("mmpcdir", pathPrefix)
                                  .replace("\\", "/");
                if(!Prefix.endsWith("/")) {
                    Prefix = Prefix + "/";
                }
                sf = new FileInputStream( Prefix + unit + ".pas");

                FileDescriptor fd = sf.getFD();
                if(!fd.valid()) {
                    error("Unit file not found " +  "("+Prefix + unit + ".pas)");
                }
                resolvedprefix=Prefix;
            }
            java.io.FileDescriptor  fd      = sf.getFD();
            // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
            // FileReader(fd));
            Reader                  source  = new InputStreamReader(sf, "UTF-8");
            PascalCompiler          p       = new PascalCompiler(resolvedprefix, w, source, unit
                    + ".pas");
            p.notifier = notifier;
            p.defineSymbol(apuname);

            PrintWriter             asm     = new PrintWriter(new FileOutputStream(asmfile));
            // System.out.println(pathPrefix + unit + ".pas");
            w.setLogfile(new PrintWriter(new FileOutputStream(pathPrefix + unit
                                         + getprocessorname() + ".lst")
                                         // System.out // to be shown on the screen instead of the file *.lst
                                        ));
            asm.println(w.directivePrefix() + "ifndef " + unit);
            w.defineSymbol(unit);
            w.defineSymbol("definedunit$" + unit + "$base");
            p.compile(asm, intermediateFile, pathPrefix + unit + apuname);
            //     System.out.println(pathPrefix + unit + apuname+" compiled");
            for(int u = 0; u < p.unitsUsed.size(); u++) {
                asm.println(w.directivePrefix() + "include "
                            + p.unitsUsed.elementAt(u));
            }
            asm.println(w.directivePrefix() + "endif");
            asm.close();
        }
        catch(Exception e) {
            if(verbose)e.printStackTrace();
            try {
                File  f  = new File(pathPrefix + unit + apuname + ".asm");
                if(f.exists()) {
                    System.out.println("Deleting " + pathPrefix + unit
                                       + apuname + ".asm");
                    f.delete();
                }
                f = new File(pathPrefix + unit + apuname + ".mpu");
                if(f.exists()) {
                    System.out.println("Deleting " + pathPrefix + unit
                                       + apuname + ".mpu");
                    f.delete();
                }
            }
            catch(Exception fe) {
            }
            error(unit + ":" + e);
        }
        // if(!processor.assemble(asmfile,pathPrefix+unit+".o"))error(unit+" assembly failed");
        // System.out.println(" assembled");
    }


    // return true if file f1 newer than file f2

    /**
     *  Description of the Method
     *
     *@param  f1  Description of Parameter
     *@param  f2  Description of Parameter
     *@return     Description of the Returned Value
     */
    boolean f1newerthanf2(String f1, String f2) {
        // System.out.println("is " + f1 + " newer than " + f2);
        boolean  ok  = new File(f1).lastModified() > new File(f2).lastModified();
        // System.out.println(ok);
        return ok;
    }


    /**
     *  check is a units compiled version newer than the source
     *
     *@param  unit             unit file name without suffix
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of the Exception
     */
    boolean uptodate(String unit,String pathPrefix) throws SyntaxError {
        if(f1newerthanf2(pathPrefix + unit + getprocessorname() + ".mpu",
                         pathPrefix + unit + ".pas")
                && f1newerthanf2(pathPrefix + unit + getprocessorname()
                                 + ".asm", pathPrefix + unit + ".pas")) {
            try {
                Walker                  w       = (Walker) processor.getClass().newInstance();
                w.verbose = processor.verbose;
                FileInputStream         sf      = new FileInputStream(pathPrefix + unit
                        + ".pas");
                java.io.FileDescriptor  fd      = sf.getFD();
                if(!fd.valid()) {
                    error(unit + ".pas invalid file");
                }
                // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
                // FileReader(fd));
                Reader                  source  = new InputStreamReader(sf, "UTF-8");
                PascalCompiler          p       = new PascalCompiler(pathPrefix, w, source,
                        unit + ".pas");
                p.notifier = notifier;
                boolean                 ok      = p.uselistvalid(pathPrefix + unit);
                source.close();
                  if (ok) System.out.println( unit+" is up to date"); 
                return ok;
            }
            catch(Exception e) {
                if (verbose)e.printStackTrace();
                return false;
            }
        }
        else {
          // System.out.println(unit + " not up to date");
            return false;
        }
    }


    /**
     *  Parses the declaration line and uselist of a unit and checks that a. all
     *  items in the uselist are uptodate b. that the compiled version do items in
     *  the uselist is older than the compiled version of the current file.
     *
     *@param  name             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    boolean uselistvalid(String name) throws SyntaxError {
	 
	 
        defineSymbol(getprocessorname());
        mustbe("unit");
        mustbe(lex.TT_IDENTIFIER);
        mustbe(';');
        mustbe("interface");
        if(have("uses")) {
            do {
                String[]  pair  = unitid();
                String    unit  = pair[0];
                String[] paths=searchpath();
                boolean matched=false;
                for(String p:paths){
					if(!matched){
						matched=uptodate(unit,p);
					}
				}	
				if (!matched) return false;	  
               /* if(uptodate(unit)) {
                    if(!f1newerthanf2(name + getprocessorname() + ".mpu",
                                      pathPrefix + unit + getprocessorname() + ".mpu")) {
                        //	System.out.println("!f1newerthanf2(" + name
                        //		 + getprocessorname() + ".mpu ," + pathPrefix
                        //		 + unit + getprocessorname() + ".mpu)");
                        return false;
                    }
                }
                else {
                    return false;
                }*/
            }
            while(have(','));
        }
        return true;
    }
    // create the search path
    String[] searchpath(){
		String p= System.getProperty("mmpcdir", "").replace("\\", "/");
		String[] paths = { pathPrefix,".",p};
		int i;
		for(i=0;i<paths.length;i++)
		 if(!paths[i].endsWith("/")) {
			    if(paths[i].equals(""))paths[i]=".";
                paths[i] = paths[i] + "/";
                if(verbose)System.out.println(paths[i]);
            };
         return paths;
	 }
     String findunitprefix(String unit) throws SyntaxError
     {
		 String []paths=searchpath();
		 for (String path:paths){
			File tmpf = new File(path+unit+".pas");   // create a File object
			boolean exists = tmpf.exists();     
			if(exists)return path;
		 }
		 error("can not find unit "+unit+" on search path");
		 return "";
	} 

    // Loads the symbol table for the unit
    
    /**
     *  Description of the Method
     *
     *@param  unit             Description of Parameter
     *@param  cpuname          Description of the Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void loadUnit(String unit, String cpuname) throws SyntaxError {
		 
		 
	          String prefused = findunitprefix(unit); 
	        if(!uptodate(unit ,prefused)) {
	            if(verbose)	System.out.println("Compile unit "+unit+ " for "+cpuname);
	            compileUnit(unit,prefused,  cpuname);
	            if(verbose)	  System.out.println("-------------");
	        }
	      
	        unitsUsed.addElement("\"" + prefused + unit + cpuname + ".asm\"");
	        unitsToCall.addElement(unit);
	        // declareExternal("unit$"+unit+"$base");
	          
	            try {
				   if(verbose)	System.out.println("try to load "+unit+" from "+prefused);
	                FileInputStream    f  = new FileInputStream(prefused + unit
	                        + cpuname + ".mpu");
	                ObjectInputStream  s  = new ObjectInputStream(f);
	                Dictionary         d  = (Dictionary) s.readObject();
	                s.close();
	                symbolTable.enterScope(d);
	                symbolTable.put(unit, new UnitHolder(d, unit));
	                assembledUnits = assembledUnits + " " + prefused + unit + cpuname
	                                 + ".o";
	                // System.out.println(assembledUnits);
	               // pathPrefix = prefused;
	                return;
	            }
	            catch(Exception e) {
	                 
	                    error(" loading unit " +prefused+ unit + " :" + e);
	                
	            }
	        
		
    }


    /**
     *  Description of the Method
     *
     *@param  name             Description of the Parameter
     *@exception  SyntaxError  Description of the Exception
     */
    void loadUnit(String name) throws SyntaxError {
        loadUnit(name, getprocessorname());
    }


    /**
     *  Description of the Method
     *
     *@param  name             Description of the Parameter
     *@exception  SyntaxError  Description of the Exception
     */
    void loadUnit(String[] name) throws SyntaxError {
        loadUnit(name[0], name[1]);
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node block() throws SyntaxError {
        return block(voidType);
    }


    /**
     *  block1: block2 constant-declaration ; block2
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node block1() throws SyntaxError {
        while(have("const")) {
            constDecls();
        }
        return block2();
    }


    /**
     *  block2: block3 type-declaration ; block3
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node block2() throws SyntaxError {
        while(have(lex.TT_TYPE)) {
            type_declaration();
        }
        return block3();
    }


    /**
     *  block3: block4 variable-declaration ; block4
     *
     *@return                  executable code of block
     *@exception  SyntaxError  Description of Exception
     */
    Node block3() throws SyntaxError {
        while(have("var")) {
            variable_declaration();
            // mustbe(';'); variable decl eats this up
        }
        return block4();
    }


    /**
     *  block4: block5 proc-and-func-declaration ; block5
     *
     *@param  exec             true if an executable statement is allowed
     *@return                  executable code of the block
     *@exception  SyntaxError  Description of Exception
     */
    Node block4(boolean exec) throws SyntaxError {
        boolean  proc  = false;
        boolean  fn    = false;
        boolean  ok    = true;
        while(ok) {
            boolean  pure  = false;
            if(have("const")) {
                constDecls();
            }
            else if(have("type")) {
                type_declaration();
            }
            else if(have("var")) {
                variable_declaration();
            }
            else {
                if(have("procedure")) {
                    proc = true;
                }
                else if(have("function")) {
                    fn = true;
                }
                else if(have("pure")) {
                    mustbe("function");
                    fn = true;
                    pure = true;
                }
                ok = proc || fn;
            }
            while(proc || fn) {
                Node  n  = proc_or_fn(pure, fn);
                wholeProgram = new Statement(n, wholeProgram);
                mustbe(';');
                fn = false;
                proc = false;
                pure = false;
                if(have("procedure")) {
                    proc = true;
                }
                else if(have("function")) {
                    fn = true;
                }
                else if(have("pure")) {
                    mustbe("function");
                    fn = true;
                    pure = true;
                }
            }
        }
        return block5(exec);
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node block4() throws SyntaxError {
        return block4(true);
    }


    /**
     *  block5: begin statement-list end
     *
     *@param  exec             Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node block5(boolean exec) throws SyntaxError {
        if(!exec) {
            mustbe("end");
            return new Statement(null);
        }
        if(have("begin")) {
            Node  n  = statement_list();
            mustbe("end");
            return n;
        }
        else {
            mustbe("end");
            return new Statement(null);
        }
    }


    /**
     *  Description of the Method
     *
     *@param  lab  Description of Parameter
     *@return      Description of the Returned Value
     */
    String labname(double lab) {
        return "label$" + lab;
    }


    /**
     *  variable-declaration: var variableid-list : type variable-declaration ;
     *  variableid-list : type
     *
     *@exception  SyntaxError  Description of Exception
     */
    void variable_declaration() throws SyntaxError {
        try {
            Stack    vars      = new Stack();
            variableid_list(vars);
            mustbe(':');
            Type     t         = type();
            if(t instanceof ArrayType) {
                ArrayType  at  = (ArrayType) t;
                if(at.isDynamic) {
                    warn("\n\t\tThe type you have given for the variable\n\t \tis an unitialised schematic array type.\n"
                         + "\t\tThis is dangerous as it can cause unpredictable\n\t \tresults since the values of the schema parameters\n"
                         + "\t\tare unknown. Perhaps you intended to declare a \n\t\tpointer to a schematiic array type?");
                }
            }
            boolean  declared  = false;
            if(have('=')) {
                Enumeration  e   = vars.elements();
                String       id;
                declareVar(id = (String) e.nextElement(), t);
                Variable     V   = (Variable) symbolTable.get(id);
                if(e.hasMoreElements()) {
                    error("only one variable may be declared with initialiser");
                }
                try {
                    Type    prim    = t;
                    Type    tf      = new Ref(prim);
                    Label   newlab  = newdatalabel();
                    Node    value   = forceTypeCompatibility(constant(true, prim),
                                      prim);
                    String  vt;
                    if(!tf.type.equals(vt = "ref " + value.returnType())) {
                        error("type error in constant, wanted " + t + " got "
                              + vt);
                    }
                    int     size    = (int) tf.sizeOf(processor);
                    Node    index   = (prim instanceof ArrayType
                                       && ((ArrayType) prim).elemtype instanceof StringType ?
                                       // it
                                       // has
                                       // already
                                       // been
                                       // planted
                                       // for
                                       // string
                                       // arrays
                                       // we just need to generate a new data label
                                       newlab
                                       : plant(value));
                    // System.out.println("const ="+value+" addr = "+index);
                    try {
                        Variable  v;
                        symbolTable.put(id = id + "initialiseor",
                                        v = new Variable(size, t, vt, index));
                        v.setName(id);
                        v.Protected = true;
                        postPrestatement(new Statement(new Assign(V, new Deref(v))));
                    }
                    catch(Exception ev) {
                        error(ev.toString());
                    }
                }
                catch(TypeIdError te) {
                    error("type identifiers not allowed here :"
                          + te.getMessage());
                }
            }
            else if(have(';')) {
                if(have("external")) {
                    mustbe("name");
                    mustbe(lex.TT_STRING);
                    String       extname  = lex.theString;
                    declareExternal(extname);
                    mustbe(';');
                    Enumeration  e        = vars.elements();
                    declareVar((String) e.nextElement(), extname, t);
                    if(e.hasMoreElements()) {
                        error("only one variable may be declared with external name");
                    }
                    if(lex.peek(lex.TT_IDENTIFIER)) {
                        variable_declaration();
                    }
                    declared = true;
                }
                else if(lex.peek(lex.TT_IDENTIFIER)) {
                    variable_declaration();
                }
            }
            if(!declared) {
                declareVars(vars, t);
            }
        }
        catch(Exception ex1) {
            if(verbose)ex1.printStackTrace();
            error("in variable declaration " + ex1);
        }
    }


    // this does the actual declaration of a stack of vars

    /**
     *  Description of the Method
     *
     *@param  v              Description of Parameter
     *@param  t              Description of Parameter
     *@exception  Exception  Description of Exception
     */
    void declareVars(Stack v, Type t) throws Exception {
        // System.out.println("declarevars("+t+")");
        Enumeration  e  = v.elements();
        while(e.hasMoreElements()) {
            declareVar((String) e.nextElement(), t);
        }
    }


    // this declares a single var
    /**
     *  declares an external variable
     *
     *@param  s              Description of Parameter
     *@param  t              Description of Parameter
     *@param  ename          Description of the Parameter
     *@exception  Exception  Description of Exception
     */
    void declareVar(String s, String ename, Type t) throws Exception {
        t = resolvepointertypes(t);
        Type      reft       = new Ref(t);
        checknew(s);
        Node      base       = new ExtLabel(Walker.procprefix + ename);
        int       size       = (int) t.sizeOf(processor);
        int       alignment  = t.alignment(processor);
        Variable  V          = new ilcg.tree.Variable(size, reft, Variable.makeref(t.codeGenRepresentation(processor)), base);
        symbolTable.put(s, V);
    }


    /**
     *  Description of the Method
     *
     *@param  newname          Description of the Parameter
     *@param  oldname          Description of the Parameter
     *@exception  SyntaxError  Description of the Exception
     */
    void declareAlias(String newname, String oldname) throws SyntaxError {
        Object  old  = symbolTable.get(oldname);
        if(old == null) {
            error(oldname + " not declared here ");
        }
        symbolTable.put(newname, old);
    }


    /**
     *  declares a local variable
     *
     *@param  s              Description of Parameter
     *@param  t              Description of Parameter
     *@exception  Exception  Description of Exception
     */
    void declareVar(String s, Type t) throws Exception {
        if(processor.verbose)  System.out.println("declare "+s+":"+t+" ll="+lexicalLevel+"\nt.class"+t.getClass());
        t = resolvepointertypes(t);
        Type                 reft       = new Ref(t);
        if(processor.verbose) System.out.println("reft="+reft);
        checknew(s);
        LocalStoreAllocator  a          = currentLocalAllocator();
        int                  size       = (int) t.sizeOf(processor);
        if(processor.verbose) System.out.println(size);
        int                  alignment  = t.alignment(processor);
        if(processor.verbose) System.out.println(alignment);
        Node                 base;
        if(inUnit()) {
            // base = new ExtLabel("unit$"+unitName+"$base");
            base = unitbase;
        }
        else {
            base = new Cast("ref " + Format.addressType, processor.getFP());
        }
        if(processor.verbose)if(base!=null)System.out.println("base="+base);
        Variable             V          =
            new ilcg.tree.Variable(size,
                                   alignment, a, reft,
                                   Variable.makeref(t.codeGenRepresentation(processor)),
                                   base,
                                   lexicalLevel, false,
                                   // not a call by ref parameter
                                   processor.getAddressType());
        symbolTable.put(s, V);
        if(processor.verbose) System.out.println("leaving delclareVar "+s+":"+t+V+lexicalLevel);
    }


    /**
     *  Description of the Method
     *
     *@param  e                Description of Parameter
     *@param  filevar          Description of Parameter
     *@param  newln            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    Node writelisttail(Node e, Node filevar, boolean newln) throws SyntaxError,
        TypeIdError {
        try {
            // System.out.println(e);
            Node  e1  = new Int(12, intrep);
            Node  e2  = new Int(5, intrep);
            if(getType(e) instanceof RealType) {
                e2 = new Int(0, intrep);
            }
            if(getType(forcederef(e)).equals(CHAR) || getType(e).equals(CHAR)) {
                e2 = e1 = new Int(1, intrep);
            }
            if((getType(e) instanceof StringType)
                    || (getType(forcederef(e)) instanceof StringType)) {
                e1 = strlen(e);
            }
            if(have(':')) {
                e1 = forcederef(expression(), INTEGER);
            }
            if(have(':')) {
                e2 = forcederef(expression(), INTEGER);
            }
            e = callWrite(filevar, e, e1, e2);
            if(have(',')) {
                freewriteIndices();
                initwriteIndices();
                e = new Statement(e, new Statement(writelist(filevar, newln),
                                                   null));
            }
            else if(newln) {
                e = new Statement(e, new Statement(callWriteln(filevar), null));
            }
        }
        catch(Exception en) {
            error(" in writelist \n" + en);
        }
        return e;
    }


    /**
     *  Description of the Method
     *
     *@param  e                Description of Parameter
     *@param  filevar          Description of Parameter
     *@param  newln            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    Node readlisttail(Node e, Node filevar, boolean newln) throws SyntaxError,
        TypeIdError {
        // System.out.println(e);
        e = callRead(filevar, e);
        if(have(',')) {
            freewriteIndices();
            initwriteIndices();
            e = new Statement(e, new Statement(readlist(filevar, newln), null));
        }
        else if(newln) {
            e = new Statement(e, new Statement(callReadln(filevar), null));
        }
        return e;
    }


    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@param  e                Description of Parameter
     *@param  e1               Description of Parameter
     *@param  e2               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node callWrite(Node filevar, Node e, Node e1, Node e2) throws SyntaxError {
        // System.out.println("callWrite("+filevar+","+e+","+e1+","+e2+") maxrank="+maxRank+"\nprestatement="+
        // prestatement);
        String          procname  = "printstring";
        Node            res       = null;
        Node            de        = forcederef(e);
        if(filevar == null) {
            filevar = (Node) symbolTable.get("output");
        }
        Type            t         = getType(de);
        int             therank   = maxRank;
        for(int i = writeindices.length - 1; i > therank; i--) {
            postPrestatement(getPreloopAction(writeindices[i]));
        }
        try {
            if(therank > 0) {
                return callArrayIO(filevar, e, e1, e2, therank, true);
            }
        }
        catch(Exception exx) {
            error("in callArrayIO " + exx);
        }
        Statement oldp=prestatement;
        prestatement=null;
        for(int i = therank; i >= 0; i--) {
            postPrestatement(getPreloopAction(writeindices[i]));
        }
        postPrestatement(oldp);
        PascalFileType  filetype  = (PascalFileType) getType(forcederef(filevar));
        if(filetype.elements.equals(CHAR)) {
            // this is a text file
            if(t instanceof OrdinalType
                    && !(BOOLEAN.equals(t) || CHAR.equals(t))) {
                try {
                    OrdinalType  ot  = (OrdinalType) t;
                    if(ot.transtab != null) {
                        Node[]  ordparams  = {filevar, castToStandard(de), e1,
                                              e2, ot.transtab
                                             };
                        res = procCall("printordinal", ordparams);
                    }
                    else {
                        error("no translation table for type " + ot);
                    }
                }
                catch(Exception eee) {
                    error("in callWrite" + eee);
                }
            }
            else {
                if(!(t instanceof StringType)) {
                    e = castToStandard(de);
                    if(!e.equals(de)) {
                        t = getType(e);
                    }
                    procname = writename(t);
                    if(procname.equals("printstring")) {
                        e = forceParamCompatibility(e, STRING);
                    }
                }
                Node[]  params  = {filevar, e, e1, e2};
                res = procCall(procname, params);
            }
        }
        else {
            // binary file
            e1 = new Int(t.sizeOf(processor), intrep);
            Node[]  params  = {filevar, e, e1};
            res = procCall("binwrite", params);
        }
        return res;
    }


    /**
     *  prints out an array with the lowest dimension separated by spaces and the
     *  higher dimensions separated by newlines
     *
     *@param  filevar          Description of the Parameter
     *@param  e                Description of the Parameter
     *@param  e1               Description of the Parameter
     *@param  e2               Description of the Parameter
     *@param  therank          Description of the Parameter
     *@param  writenotread     Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  Exception    Description of the Exception
     */
    Node callArrayIO(Node filevar, Node e, Node e1, Node e2, int therank,
                     boolean writenotread) throws SyntaxError, Exception {
        // System.out.println("callArrayIO("+filevar+","+e+","+e1+","+e2+","+therank+")");
        Node       v    = maxRankArray;
        maxRank = 0;
        ArrayType  at   = (therank > 0 ? (ArrayType) getType(forcederef(v)) : null);
        // System.out.println("v="+v+" at="+at);
        Node       res  = (writenotread ? callWrite(filevar, e, e1, e2) : callRead(
                               filevar, e));
        if(res == null) {
            error("cant generate io call for " + getType(e));
        }
        res = new Statement(prestatement, new Statement(res));
        prestatement = null;
        for(int k = 0; k < therank; k++) {
            int   i    = therank - 1 - k;
            int   j    = writeindices.length - 1 - k;
            // System.out.println("j="+j);
            Node  lwb  = at.getLwb(i, getAddr(v));
            // System.out.println("lwb="+lwb);
            Node  upb  = at.getUpb(i, getAddr(v));
            // System.out.println("upb="+upb);
            Node  ch   = checkArrayBoundsNotViolatedInLoopForIndex(
                             writeindices[j], lwb, upb);
            // System.out.println("upb="+upb);
            res = new Statement(new Statement(
                                    getPreloopAction(writeindices[j]),
                                    // grab pre-loop
                                    // statements
                                    // place before the loop proper
                                    new Statement(ch)),
                                new Statement(new For((Variable) writeindices[j], lwb, upb,
                                              new Int(1, intrep), res),
                                              new Statement((writenotread ? callWriteln(filevar)
                                                      : callReadln(filevar)))));
            // System.out.println("expanded loop="+res);
            res = new Statement(res.eval());
            // System.out.println("evaluated loop="+res);
        }
        return res;
    }


    /**
     *  Description of the Method
     *
     *@param  v  Description of the Parameter
     *@return    Description of the Return Value
     */
    Object[] toarray(Vector v) {
        Object[]  a  = new Object[v.size()];
        for(int i = 0; i < v.size(); i++) {
            a[i] = v.elementAt(i);
        }
        return a;
    }


    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@param  e                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node callRead(Node filevar, Node e) throws SyntaxError {
        String          procname  = "readstring";
        Node            de        = forcederef(e);
        Type            t         = getType(de);
        int             therank   = maxRank;
        // now move the preloop actions to the prestatement for the
        // outer loops which will never occur
        for(int i = writeindices.length - 1; i > therank; i--) {
            postPrestatement(getPreloopAction(writeindices[i]));
        }
        try {
            if(therank > 0) {
                return callArrayIO(filevar, e, new Int(1), new Int(1), therank,
                                   false);
            }
        }
        catch(Exception exx) {
            error("in callArrayIO " + exx);
        }
        for(int i = therank; i >= 0; i--) {
            postPrestatement(getPreloopAction(writeindices[i]));
        }
        if(filevar == null) {
            filevar = (Node) symbolTable.get("input");
        }
        PascalFileType  filetype  = (PascalFileType) getType(forcederef(filevar));
        if(filetype.elements.equals(CHAR)) {
            if(!(t instanceof StringType)) {
                if(filevar == null) {
                    filevar = (Node) symbolTable.get("input");
                }
                if(getType(de) instanceof OrdinalType) {
                    try {
                        OrdinalType  ot  = (OrdinalType) getType(de);
                        if(ot.transtab != null) {
                            Node[]  ordparams  = {filevar, e, ot.transtab,
                                                  new Int(ot.hi - ot.low + 1, Node.int32)
                                                 };
                            // System.out.println(ordparams[1]);
                            // System.out.println(ot.transtab);
                            return procCall("readordinal", ordparams);
                        }
                    }
                    catch(Exception eee) {
                        error(eee.getMessage());
                    }
                }
                Node[]  params  = {filevar, e};
                procname = readname(getType(de));
                return procCall(procname, params);
            }
            Node[]  params  = {filevar, e, new Int(((StringType) t).length())};
            return procCall("readstring", params);
        }
        else {
            // binary file
            Node    e1      = new Int(t.sizeOf(processor), intrep);
            Node[]  params  = {filevar, e, e1};
            return procCall("binread", params);
        }
    }


    /**
     *  Description of the Method
     *
     *@param  t                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    String readname(Type t) throws SyntaxError {
        // System.out.println(t);
        if(t.equals(REAL)) {
            return "readreal";
        }
        if(t.equals(INTEGER)) {
            return "readint";
        }
        if(t.equals(BYTE)) {
            return "readbyte";
        }
        if(t == (CHAR)) {
            return "readchar";
        }
        if(t == (BOOLEAN)) {
            return "readbool";
        }
        if(!(t instanceof StringType)) {
            error(" can not read type " + t);
        }
        return "readstring";
    }


    /**
     *  Description of the Method
     *
     *@param  t                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    String writename(Type t) throws SyntaxError {
        if(t.equals(BOOLEAN) & t instanceof OrdinalType) {
            return "printbool";
        }
        if(t.equals(DOUBLE)) {
            return "printdouble";
        }
        if(t.equals(INTEGER)) {
            return "printint";
        }
        if(t.type.equals("int64")) {
            return "printint64";
        }
        if(t.equals(CHAR) & t instanceof OrdinalType) {
            return "printchar";
        }
        if(t.equals(REAL) || isPixel(t)) {
            return "printreal";
        }
        return "printstring";
    }


    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node callWriteln(Node filevar) throws SyntaxError {
        if(filevar == null) {
            filevar = (Node) symbolTable.get("output");
        }
        PascalFileType  filetype  = (PascalFileType) getType(forcederef(filevar));
        if(filetype.elements.equals(CHAR)) {
            Node[]  params  = {filevar};
            return procCall("println", params);
        }
        // ignore for non text file
        return new Statement(null);
    }


    /**
     *  Description of the Method
     *
     *@param  filevar          Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node callReadln(Node filevar) throws SyntaxError {
        if(filevar == null) {
            filevar = (Node) symbolTable.get("input");
        }
        PascalFileType  filetype  = (PascalFileType) getType(forcederef(filevar));
        if(filetype.elements.equals(CHAR)) {
            Node[]  params  = {filevar};
            return procCall("readline", params);
        }
        // ignore for non text file
        return new Statement(null);
    }


    /**
     *  variableid-list: identifier variableid-list , identifier
     *
     *@param  v                Stack onto which the variables are to be pushed
     *@exception  SyntaxError  Description of Exception
     */
    void variableid_list(Stack v) throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        v.push(lex.theId);
        if(have(',')) {
            variableid_list(v);
        }
    }


    /**
     *  constant: integer real string constid + constid TADD- constid
     *
     *@param  listallowed      Description of the Parameter
     *@param  t                Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    Node constant(boolean listallowed, Type t) throws SyntaxError, TypeIdError {
        if(listallowed) {
            if(have('(')) {
                if((t instanceof ArrayType)) {
                    ArrayType  at  = (ArrayType) t;
                    // System.out.println("in constant t="+t+", elemtype="+at.elemtype);
                    if(at.rank() > 1) {
                        return constantlist(new ArrayType(at, at.rank() - 1));
                    }
                    return constantlist(at.elemtype);
                }
                else {
                    return constantlist(t);
                }
            }
        }
        Node  n  = expression();
        if(processor.verbose) {
            System.out.println("in constant() n=" + n + ":" + getType(n));
        }
        n = n.eval();
        if(processor.verbose) {
            System.out.println("in constant() n.eval()=" + n + ":" + getType(n));
        }
        if(!isaconstant(n)) {
            if((!inLineReals)&&(n.returnType().equals("ieee64")))
            {   //permissable
            }
            else if((!inLineReals)&&(n.returnType().equals("ieee32")))
            {   //permissable
            }
            else
                error(n.toString() + " is not a constant");
        }
        return n;
    }


    /**
     *  Description of the Method
     *
     *@param  listallowed      Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node constant(boolean listallowed) throws SyntaxError, TypeIdError {
        return constant(true, INTEGER);
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node constant() throws SyntaxError, TypeIdError {
        return constant(true);
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean isaconstant(Node n) {
        if(n.knownAtCompileTime()) {
            return true;
        }
        if(n instanceof Cast) {
            return isaconstant(((Cast) n).getSubtree());
        }
        if(isalabel(n)) {
            return true;
        }
        return false;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean isalabel(Node n) {
        if(n instanceof Label) {
            return true;
        }
        if(n instanceof Memref) {
            return isalabel(((Memref) n).index);
        }
        return false;
    }


    /**
     *  Description of the Method parses list of constants in brackets with
     *  elements separated by ,
     *
     *@param  t                Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node constantlist(Type t) throws SyntaxError {
        // System.out.print("want constlist of type "+t+"\n(");
        if(t instanceof StringType) {
            arraystringcontext = true;
            arraystringlength = ((StringType) t).getstrlen();
        }
        try {
            Vector    v        = new Vector();
            Node      n;
            Node      n1;
            boolean inlr=inLineReals;
            inLineReals=true; //we need these as real literals to init the array
            v.addElement(n = forceTypeCompatibility(constant(true, t), t));
            int       elems    = 1;
            while(have(',')) {
                v.addElement(n1 = forceTypeCompatibility(constant(true, t), t));
                elems++;
                // System.out.print(","+n1);
            }
            mustbe(')');
            inLineReals=inlr;
            arraystringcontext = false;
            long[][]  indices  = new long[1][2];
            indices[0][0] = 0;
            indices[0][1] = elems - 1;
            Type      newtype  = new ArrayType(indices, t, t.sizeOf(processor));
            // System.out.println("):"+newtype);
            return new TypeTag(new LiteralVector(v, t), newtype);
        }
        catch(TypeIdError e) {
            error(" type identifiers not allowed here :" + e.getMessage());
        }
        return null;
    }


    /*
     *  type: simple-type structured-type ^ typeid
     */
    /**
     *  Description of the Method
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type type() throws SyntaxError {
        if(have('^')) {
            try {
                return new Pointer(typeid(), processor);
            }
            catch(UndeclaredType err) {
                return new PointerToNamedType(err.getId(), processor);
            }
        }
        if(lex.peek("ARRAY") || lex.peek("STRING") || lex.peek("RECORD")||lex.peek("FIELD")
                || lex.peek("SET") || lex.peek("FILE") || lex.peek("PACKED")||lex.peek("CLASS")) {
            return structured_type(false);
        }
        if(have("PROCEDURE")) {
            return (proc_or_fn_type(false, false));
        }
        else if(have("FUNCTION")) {
            return (proc_or_fn_type(false, true));
        }
        else if(have("pure")) {
            mustbe("function");
            return (proc_or_fn_type(true, true));
        }
        return simple_type();
    }


    /**
     *  simple-type: ( identifier-list ) constant ... constant typeid
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type simple_type() throws SyntaxError {
        String  id;
        // System.out.println("simple type");
        if(have('(')) {
            Vector       v         = new Vector();
            mustbe(lex.TT_IDENTIFIER);
            v.addElement(lex.theId);
            while(have(',')) {
                mustbe(lex.TT_IDENTIFIER);
                v.addElement(lex.theId);
            }
            mustbe(')');
            String[]     elems     = new String[v.size()];
            for(int i = 0; i < v.size(); i++) {
                elems[i] = v.elementAt(i).toString();
            }
            OrdinalType  t         = new OrdinalType(elems);
            // create the run-time translation table
            long[][]     bounds    = new long[1][2];
            bounds[0][0] = t.low;
            bounds[0][1] = t.hi;
            // ArrayType transtabt=new
            // ArrayType(bounds,PSTRING,PSTRING.sizeOf(processor));
            // System.out.println("transtabt="+transtabt);
            Label[]      pv        = new Label[elems.length];
            // declare the elements
            for(int i = 0; i < v.size(); i++) {
                try {
                    Dictionary  dd  = (recordLevel == 0 ? symbolTable
                                       : recordEnclosingScope);
                    dd.put((String) v.elementAt(i), new TypeTag(new Int(i,
                            t.type), t));
                    pv[i] = (plantStringlab(elems[i], elems[i].length()));
                }
                catch(Exception enn) {
                    error("---" + enn, lex.lineno());
                }
            }
            Node         olddecls  = dataDecls;
            dataDecls = null;
            Node         transtab  = new TypeTag(plant(pv), ADDRESS);//INTEGER);
            dataDecls = new Statement(olddecls, dataDecls);
            // System.out.println("transtab ="+transtab);
            try {
                t.setTransTab(transtab);
            }
            catch(Exception transerr) {
                error(transerr.toString());
            }
            return t;
        }
        try {
            try {
                Node  n  = constant(false);
                // System.out.println("n="+n);
                if(n != null) {
                    mustbe(lex.TT_ELIPSIS);
                    Node  n2  = constant(false);
                    if(n.knownAtCompileTime() && n2.knownAtCompileTime()) {
                        if(getType(n) instanceof IntegralType) {
                            Number  n1  = (Number) TypeTag.decast(n);
                            n2 = TypeTag.decast(n2);
                            return new IntegralType((n1).longValue(),
                                                    ((Number) n2).longValue());
                        }
                        if(getType(n) instanceof OrdinalType) {
                            return new OrdinalType((OrdinalType) getType(n),
                                                   ((Number) TypeTag.decast(n)).longValue(),
                                                   ((Number) TypeTag.decast(n2)).longValue());
                        }
                        error("subrange types must be ordinal or integral");
                    }
                    error("ranges must be defined at compile time ");
                }
                error("type declaration needed here");
                return INTEGER;
                // never get here
            }
            catch(Exception syn) {
                /*
                 *  will arrive here if we have a type identifier indicating a
                 *  procedure type since the code for constant will call
                 *  expression which will want params after the procedure, these
                 *  will not be there generating a syntax error
                 */
                if(verbose)syn.printStackTrace();
                throw new TypeIdError(lex.theId, null);
            }
        }
        catch(TypeIdError te) {
            if(verbose)System.out.println(te);

            if(verbose)te.printStackTrace();
            Type  t1  = typeid(te.getId());
            if(verbose) {
                System.out.println(t1);
                System.out.println("have we an of?");
            }
            if(have("of")) {
                if(!(t1 instanceof RealType)) {
                    error(" only real types can be dimensioned ");
                }
                mustbe(lex.TT_IDENTIFIER);
                String  dimid  = lex.theId;
                try {
                    Node         constt  = (Node) getid(dimid);
                    if(constt == null) {
                        error(dimid + " not known here");
                    }
                    OrdinalType  basis   = (OrdinalType) getType(constt);
                    int[]        powers  = new int[basis.elements.length];
                    for(int i = 0; i < powers.length; i++) {
                        powers[i] = 0;
                    }
                    powers[basis.ord(dimid)] = getpower();
                    while(have('*')) {
                        mustbe(lex.TT_IDENTIFIER);
                        dimid = lex.theId;
                        powers[basis.ord(dimid)] = getpower();
                    }
                    RealType     rt      = (RealType) t1;
                    t1 = new RealType(rt.type, rt.size, basis, powers);
                }
                catch(Exception ee) {
                    error(ee.toString());
                }
            }
            return t1;
        }
    }


    /**
     *  Description of the Method
     *
     *@param  id               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Object getid(String id) throws SyntaxError {
        return getid(symbolTable, id);
    }


    /**
     *  Description of the Method
     *
     *@param  symbolTable      Description of the Parameter
     *@param  id               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Object getid(Dictionary symbolTable, String id) throws SyntaxError {
        try {
            if(symbolTable == null) {
                error("null symbol table in getid");
            }
            Object  loc  = symbolTable.get(id);
            if(loc == null) {
                throw new Undeclared("Undeclared procedure or function " + id,
                                     lex.lineno());
            }
            while(loc instanceof UnitHolder) {
                mustbe('.');
                mustbe(lex.TT_IDENTIFIER);
                String  newid   = lex.theId;
                Object  newloc  = ((UnitHolder) loc).d.get(newid);
                id = id + "." + newid;
                if(newloc == loc) {
                    error("recursive name " + id);
                }
                loc = newloc;
            }
            return loc;
        }
        catch(Exception e) {
            error(e.toString());
        }
        return null;
    }


    /**
     *  Report an error
     *
     *@param  s                error message
     *@exception  SyntaxError  Description of Exception
     */
    void error(String s) throws SyntaxError {
        error(s, lex.lineno());
    }


    /**
     *  Description of the Method
     *
     *@param  s  Description of the Parameter
     */
    void warn(String s) {
        System.out.println("Warning !!! on line " + lex.lineno() + " \n" + s);
    }


    /**
     *  Description of the Method
     *
     *@param  s                Description of the Parameter
     *@param  l                Description of the Parameter
     *@exception  SyntaxError  Description of the Exception
     */
    void error(String s, int l) throws SyntaxError {
        SyntaxError  e  = new SyntaxError(s, l, lex.charno(), sourceName);
        if(processor.verbose) {
            e.printStackTrace();
            // processor.verbose=false;
            System.out.println("throw error " + l + s);
        }
        throw e;
    }


    /**
     *  Description of the Method
     *
     *@param  s  Description of the Parameter
     */
    void notify(String s) {
        notifier.done(s, lex.lineno());
    }


    /**
     *  field-list: fixed-part fixed-part ; variant-part variant-part
     *
     *@param  fixed            Description of Parameter
     *@param  variant          Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int fieldlist(Vector fixed, Vector variant, int start) throws SyntaxError {
        int  f  = fixedpart(fixed, start);
        int  v  = variantpart(fixed, variant, start + f);
        // System.out.println("fixed "+f+" variant "+v);
        return v + f;
    }


    /**
     *  fixed-part: record-field fixed-part ; record-field
     *
     *@param  fixed            Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int fixedpart(Vector fixed, int start) throws SyntaxError {
        int  f  = recordfield(fixed, start);
        if(lex.have(';')) {
            f = fixedpart(fixed, start + f) + f;
        }
        return f;
    }


    /**
     *  record-field: empty fieldid-list : type
     *
     *@param  v                Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int recordfield(Vector v, int start) throws SyntaxError {
        if(lex.peek("CASE")) {
            return 0;
        }
        if(lex.peek(')')) {
            return 0;
        }
        if(lex.peek("END")) {
            return 0;
        }
        Vector  l     = new Vector();
        fieldidlist(l);
        mustbe(':');
        Type    t     = type();
        int     step  = (int) t.sizeOf(processor);
        // System.out.println("field type "+t+" size ="+t.sizeOf(processor));
        for(int i = 0; i < l.size(); i++) {
            ((Field) l.elementAt(i)).setType(t);
            v.addElement(t);
            ((Field) l.elementAt(i)).setOffset(i * step + start);
        }
        return l.size() * step;
    }


    /**
     *  fieldid-list: identifier fieldid-list , identifier
     *
     *@param  v                Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void fieldidlist(Vector v) throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        Field  f;
        v.addElement(f = new Field(lex.theId));
        symbolTable.put(lex.theId, f);
        if(have(',')) {
            fieldidlist(v);
        }
    }


    /**
     *  variant-part: case tag-field of variant-list
     *
     *@param  fixed            Description of Parameter
     *@param  variant          Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int variantpart(Vector fixed, Vector variant, int start) throws SyntaxError {
        if(have("CASE")) {
            int  t  = tagfield(fixed, start);
            // System.out.println("tagfield "+t);
            mustbe("OF");
            int  v  = variantlist(variant, start + t);
            // System.out.println("variantlist "+v);
            return v + t;
        }
        return 0;
    }


    /*
     *  tag-field: typeid identifier : typeid
     */
    /**
     *  Description of the Method
     *
     *@param  v                Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int tagfield(Vector v, int start) throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        String  n  = lex.theId;
        if(have(':')) {
            Type   t  = typeid();
            Field  f;
            v.addElement(f = new Field(start, t, n));
            // System.out.println("declare field "+lex.theId+f);
            symbolTable.put(n, f);
            return (int) t.sizeOf(processor);
        }
        return 0;
    }


    /**
     *  variant-list: variant variant-list ; variant
     *
     *@param  v                Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int variantlist(Vector v, int start) throws SyntaxError {
        int  i  = variant(v, start);
        if(have(';')) {
            i = Math.max(i, variantlist(v, start));
        }
        return i;
    }


    /**
     *  variant: empty case-label-list : ( field-list )
     *
     *@param  v                Description of Parameter
     *@param  start            Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    int variant(Vector v, int start) throws SyntaxError {
        if(lex.peek("END")) {
            return 0;
        }
        caselabellist();
        mustbe(':');
        mustbe('(');
        Vector  fixed  = new Vector();
        Vector  var    = new Vector();
        int     i      = fieldlist(fixed, var, start);
        mustbe(')');
        v.addElement(new RecordType(i, fixed, var, symbolTable.getCurrentScope()));
        return i;
    }


    /*
     *  case-label-list: constant case-label-list , constant
     */
    /**
     *  Description of the Method
     *
     *@exception  SyntaxError  Description of Exception
     */
    void caselabellist() throws SyntaxError {
        try {
            constant(false);
        }
        catch(TypeIdError te) {
            error(te.getId() + " is a type not a constant");
        }
        if(have(',')) {
            caselabellist();
        }
    }


    /**
     *  Description of the Method
     *
     *@param  switchtab        Description of Parameter
     *@param  thisStatement    Description of Parameter
     *@param  base             Description of Parameter
     *@param  range            Description of the Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void caselabellist(Dictionary switchtab, Label thisStatement, long base,
                       int[] range) throws SyntaxError {
        try {
            Node  id   = constant(false);
            if(!(getType(id) instanceof ScalarRange)) {
                error(" constant is not a scalar or subrange  " + id + ":"
                      + getType(id));
            }
            Node  did  = TypeTag.decast(id);
            int   v    = ((Int) did).intValue();
            if((v) < range[0]) {
                range[0] = v;
            }
            if((v) >= range[1]) {
                range[1] = v;
            }
            switchtab.put(new Int(v), thisStatement);
            if(have(lex.TT_ELIPSIS)) {
                Node  id2   = constant(false);
                if(!(getType(id) instanceof ScalarRange)) {
                    error(" constant is not a scalar or subrange  ");
                }
                Node  did2  = TypeTag.decast(id2);
                int   v2    = ((Int) did2).intValue();
                if((v2) < v) {
                    error(" range reversed " + v + ".." + v2);
                }
                if((v2) >= range[1]) {
                    range[1] = v2;
                }
                for(int i = v; i <= v2; i++) {
                    switchtab.put(new Int(i), thisStatement);
                }
            }
        }
        catch(TypeIdError te) {
            error(te.getId() + " is a type not a constant");
        }
        if(have(',')) {
            caselabellist(switchtab, thisStatement, base, range);
        }
    }


    /**
     *  Description of the Method
     *
     *@param  predec  Description of the Parameter
     */
    void copyPriorParameters(ProcType predec) {
        if(predec != null) {
            symbolTable.putAll(predec.getParamScope());
        }
        // copy over params in
        // case
        // they were not redeclared
    }


    /**
     *  proc-and-func-declaration: proc-or-func proc-and-func-declaration ;
     *  proc-or-func proc-or-func: procedure identifier parametersopt ;
     *  block-or-forward block-or-forward: block forward
     *
     *@param  pure             true iff the function is pure
     *@param  fn               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node proc_or_fn(boolean pure, boolean fn) throws SyntaxError {
        return proc_or_fn(pure, fn, false);
    }


    /**
     *  Checks for cdecl etc
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    String modifier() throws SyntaxError {
        if(have("cdecl")) {
            mustbe(';');
            return "cdecl";
        }
        return "";
    }


    /**
     *  Description of the Method
     *
     *@param  pure              true iff the function is pure
     *@param  fn                Description of Parameter
     *@param  interfacecontext  Description of Parameter
     *@return                   Description of the Returned Value
     *@exception  SyntaxError   Description of Exception
     */
    int purenesting = 0;


    /**
     *  Description of the Method
     *
     *@param  pure              true if a pure function
     *@param  fn                true if a function
     *@param  interfacecontext  true if declared in an interface
     *@return                   Description of the Return Value
     *@exception  SyntaxError   Description of the Exception
     */
    Node proc_or_fn(boolean pure, boolean fn, boolean interfacecontext)
    throws SyntaxError {
        Node n= proc_or_fn(pure,fn,interfacecontext,false);
        if(parallelcodegen)
            try {
                if(!(n instanceof ForwardProc))codegen(n,asmFile,1,true);
            }
            catch(Exception ee) {
                ee.printStackTrace();
                error(ee.toString());
            }
        return n;
    }
    Node proc_or_fn(boolean pure, boolean fn, boolean interfacecontext, boolean classcontext)
    throws SyntaxError {
        Dictionary     tempClassScope	;
        if(processor.verbose) {
            System.out.println("proc or fn " + fn);
        }
        mustbe(lex.TT_IDENTIFIER);
        String      name               = lex.theId;
        notify("procedure " + name);
        String      returnvarname      = name + "$val";
        if(pure) {
            purenesting++;
        }
        // only note the function name if we are in a function
        // otherwise it will appear as a variable in procedures
        if(fn) {
            currentFunctionName.push(name);
        }
        // check if it is already declared
        Object      old                = symbolTable.getCurrentScope().get(name);
        ProcType    predec             = null;
        Label       oldfnExit          = currentFunctionExit;
        Pointer parent				   = null;  // this will refer to a pointer to
        // the enclosing class of a method
        currentFunctionExit 			= new Label();
        boolean ismethod			   = false;
        Type        oldfnType          = currentFunctionType;
        Vector      params             = new Vector();
        Type        returnType         = voidType;
        boolean     declaredforward    = false;
        if(old != null) {
            if(old instanceof Pointer) {
                old= ((Pointer)old).pointsTo;
            }
            if(old instanceof ClassType) {
                parent =new Pointer((ClassType)old,processor);
                mustbe('.');
                mustbe(lex.TT_IDENTIFIER);
                ismethod=true;
                name               = lex.theId;
                notify("procedure " + name);
                returnvarname      = name + "$val";
                // only note the function name if we are in a function
                // otherwise it will appear as a variable in procedures
                if(fn) {
                    currentFunctionName.pop();
                    currentFunctionName.push(name);
                }
                symbolTable.enterScope(((ClassType)old).lookuptable);
                old                = symbolTable.getCurrentScope().get(name);
            }
            if(old instanceof ProcType) {
                if(((ProcType) old).theProc instanceof ForwardProc) {
                    // forward decl is allowed all else is an error
                    predec = (ProcType) old;
                    returnType = predec.returns;
                    declaredforward = true;
                }
                else {
                    checknew(name);
                }
            }
            else {
                if(processor.verbose) {
                    System.out.println("reuse of function name " + name);
                }
                checknew(name);
            }
        }
        else {
            checknew(name);
        }
        currentFunctionType = voidType;
        int         paramcount         = 0;
        Label       l                  = new Label();
        Dictionary  outer              = symbolTable.getCurrentScope();
        // if it is a method create a temporary scope to hold the class
        // fields
        if(ismethod) enterScope(false);
        tempClassScope	    			= symbolTable.getCurrentScope();
        enterScope(true);
        Hashtable   paramscope         = (Hashtable) symbolTable.getCurrentScope();
        // for params
        int         startofparams      = currentLocalAllocator().getLimit();
        if(classcontext)parent=classStack.peek();
        if(parent !=null)// make sure a pointer to an instance of this class is the first param
            try {
                Pointer thispt=parent instanceof Pointer?parent:new Pointer(parent,processor);
                params.addElement(thispt);
                declareParam("this", thispt);
            }
            catch(Exception e2) {
                error("whilst declaring implicit parameter THIS"+e2);
            }
        boolean     noparams           = true;
        if(have('(')) {
            int  oldexpressionContext  = expressionContext;
            noparams = false;
            expressionContext = paramContext;
            parameters(params);
            expressionContext = oldexpressionContext;
            paramcount = params.size();
        }
        int         endofparams        = currentLocalAllocator().getLimit();
        if(processor.verbose) {
            System.out.print(name);
            System.out.print("(");
            for(int i = 0; i < paramcount; i++) {
                System.out.print(params.elementAt(i));
                if(i < (paramcount - 1)) {
                    System.out.print(",");
                }
            }
            System.out.print(")");
        }
        Variable    returnvar          = null;
        if(fn) {
            ProcType  previous  = null;
            if(old != null) {
                if(old instanceof ProcType) {
                    previous = (ProcType) old;
                }
            }
            if(previous != null && previous.isPure() != pure) {
                throw new SyntaxError(
                    "Inconsistent declaration of pure function " + name,
                    lex.lineno());
            }
            if(have(':')) {
                // note that the scope of a return type name
                // is not the same as that of the parameters
                Dictionary  pt  = symbolTable.popscope();
                returnType = type();
                symbolTable.enterScope(pt);
                if(returnType instanceof ArrayType) {
                    if(((ArrayType) returnType).isDynamic) {
                        error("bounds of arrays returned by functions must be known at compile time."
                              + "\n\t\t If you want this effect try recoding using a pointer to a dynamic array.");
                    }
                }
                if(processor.verbose) {
                    System.out.print(":" + returnType);
                }
            }
            else if(!declaredforward) {
                error(": expected here");
            }
            currentFunctionType = returnType;
            if(processor.verbose) {
                System.out.println("return type in fn  " + returnvarname + "="
                                   + returnType);
            }
            if(returnType instanceof SimpleType
                    && (Format.isReal(returnType.type) || Format.isInteger(returnType.type))
                    || returnType instanceof Pointer
                    || returnType instanceof PointerToNamedType
              ) {
                copyPriorParameters(predec);
                enterScope();
                // main scope of procedure as the return value must be
                // allocated space in the procedure context
                try {
                    declareVar(returnvarname, (returnType));
                    declareAlias("result", returnvarname);
                }
                catch(Exception de) {
                    error(" while declaring return location " + de);
                }
            }
            else {
                // the type is too big to return in a register
                // treat the return variable as an extra var param
                Type  returnvartype  = new Ref(returnType);
                try {
                    declareParam(returnvarname, returnvartype);
                    declareAlias("result", returnvarname);
                }
                catch(Exception de) {
                    error(" while declaring return location " + de);
                }
                copyPriorParameters(predec);
                // entering the main scope is delayed to ensure return value is
                // allocated
                // space in the parameter context
                endofparams = currentLocalAllocator().getLimit();
                enterScope();
                // main scope of procedure
                params.addElement(returnvartype);
            }
            returnvar = (Variable) symbolTable.get(returnvarname);
        }
        else {
            copyPriorParameters(predec);
            enterScope();
        }
        // main scope of procedure
        mustbe(';');
        String      returnTypeStr      = returnType.codeGenRepresentation(processor);
        String      args               = toParamStr(params);
        if(processor.verbose) {
            System.out.println(" final args " + args + " count =" + paramcount);
        }
        ForwardProc   dummy              = new ForwardProc(args, returnTypeStr,name);
        addToVmt(dummy,null);
        ProcType    pt                 = new ProcType(dummy, paramcount, params, returnType);
        pt.setParamScope(paramscope);
        if(fn && pure) {
            pt.setPure();
        }
        if(!declaredforward) {
            outer.put(name, pt);
        }
        // make accessible in inner scope if not declared
        // already as a forward proc
        Node        res                = null;
        boolean     isext              = false;
        String      proceduremodifier  = modifier();
        if((have("external"))) {
            leaveScope();
            leaveScope(true);
            // if (!declaredforward) {
            // checknew(name);
            // }
            String     extname  = name;
            if(have("name")) {
                mustbe(lex.TT_STRING);
                extname = lex.theString;
            }
            Procedure  p1       = new Procedure(extname, endofparams - startofparams,
                                                args, returnTypeStr, l, new Block(), lexicalLevel + 1);
            p1.isImported = true;
            pt = new ProcType(p1, paramcount, params, returnType);
            if(fn && pure) {
                pt.setPure();
            }
            // System.out.println("external decl of "+name);
            declareExternal(extname);
            symbolTable.put(name, pt);
            // make accessible in outer scope
            res = p1;
        }
        else if(have("forward") || interfacecontext||classcontext) {
            leaveScope();
            leaveScope(true);
            if(ismethod)leaveScope();// remove temporary class varialbes
            pt.method=classcontext;
            symbolTable.put(name, pt);
            // make accessible in outer scope
            res = null;
        }
        else {
            if(ismethod)
                try {
                    ((ClassType)parent.pointsTo).copyFieldDeclsInto(tempClassScope, this);
                }
                catch(Exception fieldcopy) {
                    error("failed to declare all of the fields of the parent class in the method \n"+fieldcopy);
                }
            Block      n         = (Block) block(returnType);
            if(fn) {
                Variable  vv  = returnvar;
                if(!vv.assignedto()) {
                    error(" no value assigned to function " + name);
                }
            }
            leaveScope();
            leaveScope(true);
            if(ismethod)leaveScope();
            ProcType   recdummy  = pt;
            // pt points at a dummy forward decl at this
            // point
            Procedure  p1        = new Procedure(
                (inlib ? unitName + "_" + name : name), endofparams
                - startofparams, args, returnTypeStr, l, n,
                lexicalLevel + 1);
            pt = new ProcType(p1, paramcount, params, returnType);
            if(fn && pure) {
                pt.setPure();
            }
            // make sure calls to forward procs use the right labels
            if(declaredforward) {
                // System.out.println("fix up predeclared "+name);
                p1.start = predec.theProc.start;
                if(!predec.equals(pt)) {
                    if(pt.numparams == 0 && predec.numparams > 0
                            && predec.returns.equals(pt.returns)) {
                        // allow
                        // this
                        // because
                        // the
                        // pascal
                        // standard
                        // allows it - ie you can elide the parameters
                        p1.paramtype = predec.paramtypes();
                        // System.out.println("pt =" +pt+ "\npredec "+predec);
                    }
                    else {
                        error("actual declaration and forward declaration of "
                              + name + " dont match\n predec "+predec +"\n actual "+pt);
                    }
                }
                if(inlib) {
                    p1.isExported = true;
                }
            }
            recdummy.theProc.start = p1.start;
            // make sure dummy has same label
            if(!declaredforward) {
                symbolTable.put(name, pt);
            }
            // make accessible in outer scope
            res = p1;
        }
        if(fn) {
            currentFunctionName.pop();
        }
        if(ismethod) symbolTable.popscope();
        currentFunctionType = oldfnType;
        currentFunctionExit = oldfnExit;
        if(pure) {
            purenesting--;
        }
        return res;
    }


    /**
     *  Description of the Method
     *
     *@param  pure             Description of the Parameter
     *@param  fn               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Type proc_or_fn_type(boolean pure, boolean fn) throws SyntaxError {
        // System.out.println("proc or fn "+fn);
        ProcType    predec         = null;
        Vector      params         = new Vector();
        Type        returnType     = voidType;
        int         paramcount     = 0;
        Dictionary  outer          = symbolTable.getCurrentScope();
        enterScope(true);
        // for params
        int         startofparams  = currentLocalAllocator().getLimit();
        if(have('(')) {
            int  oldexpressionContext  = expressionContext;
            expressionContext = paramContext;
            parameters(params);
            expressionContext = oldexpressionContext;
            paramcount = params.size();
        }
        int         endofparams    = currentLocalAllocator().getLimit();
        if(fn) {
            mustbe(':');
            returnType = type();
            String  returnvarname  = "return$val";
            if(returnType instanceof SimpleType
                    && (Format.isReal(returnType.type) || Format.isInteger(returnType.type))
                    || returnType instanceof Pointer
                    || returnType instanceof PointerToNamedType) {
            }
            else {
                // the type is too big to return in a register
                // treat the return variable as an extra var param
                // System.out.println("return type in fn decl="+returnType);
                Type  returnvartype  = new Ref(returnType);
                try {
                    declareParam(returnvarname, returnvartype);
                }
                catch(Exception de) {
                    error(" while declaring return location " + de);
                }
                // entering the main scope is delayed to ensure return value is
                // allocated
                // space in the parameter context
                endofparams = currentLocalAllocator().getLimit();
                params.addElement(returnvartype);
            }
        }
        else {
        }
        String      returnTypeStr  = returnType.codeGenRepresentation(processor);
        // String proceduremodifier=modifier();
        String      args           = toParamStr(params);
        Procedure   dummy          = new ForwardProc(args, returnTypeStr);
        ProcType    pt             = new ProcType(dummy, paramcount, params, returnType);
        if(pure && fn) {
            pt.setPure();
        }
        leaveScope(true);
        Type rt= new Ref(pt);
        // System.out.println("pt="+rt+", returns "+rt.returnType());
        return rt;
    }


    // return the ilcg equivalent of the vector of parameter types

    /**
     *  Description of the Method
     *
     *@param  v  Description of Parameter
     *@return    Description of the Returned Value
     */
    String toParamStr(Vector v) {
        String  p  = "[";
        for(int i = 0; i < v.size(); i++) {
            p = p + ((Type) v.elementAt(i)).codeGenRepresentation(processor)
                + "  ";
            if(i < (v.size() - 1)) {
                p = p + ",";
            }
        }
        return p + "]";
    }


    /**
     *  Description of the Method
     *
     *@param  name             Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void checknew(String name) throws SyntaxError {
        if(symbolTable.getCurrentScope().get(name) != null) {
            error(name + " already declared in this context");
        }
    }


    // this declares a single var

    /**
     *  Description of the Method
     *
     *@param  s              Description of Parameter
     *@param  t              Description of Parameter
     *@exception  Exception  Description of Exception
     */
    void declareParam(String s, Type t) throws Exception {
        Type                 t1         = t;
        boolean              passbyref  = (t instanceof Ref)
                                          && (!((t instanceof Pointer)));
        if(isprocparam(t)) passbyref=false;
        // System.out.println("declare param "+s+":"+t+" is procparam "+isprocparam(t)+" passby ref "+passbyref);
        if(!passbyref& !isprocparam(t)) {
            t = new Ref(t);
        }
        //   System.out.println("after check for pass by ref "+s+":"+t);
        LocalStoreAllocator  a          = currentLocalAllocator();
        if(passbyref) {
            t1 = ADDRESS;
        }
        int                  size       = (int) t1.sizeOf(processor);
        int                  alignment  = ADDRESS.alignment(processor);
        int                  offset     = a.alloc(size, alignment);
        Node                 index      = dyad(new Int(offset, Format.addressType), new TypeTag(
                new Deref(processor.getFP()), ADDRESS), "+");
        if(passbyref) {
            index = new Deref(new Memref(index, Variable.makeref(addrtype)));
        }
        index = new TypeTag(index, ADDRESS);
        Variable             var        = new ilcg.tree.Variable(size, offset, t, t.codeGenRepresentation(processor), index);
        var.lexicalLevel = lexicalLevel;
        // System.out.println(s+":"+t1+var);
        symbolTable.put(s, var);
    }


    /**
     *  parameterid-list: identifier parameterid-list , identifier statement-list:
     *  statement statement-list ; statement
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Statement statement_list() throws SyntaxError {
        Node  action  = statement();
        int   l       = lex.lineno();
        notify("");
        if(have(';')) {
            return new Statement(action, statement_list(), l);
        }
        else {
            return new Statement(action, null, l);
        }
    }


    /**
     *  convert another type to a real if it need to be
     *
     *@param  assignedTo       type we want to assign to
     *@param  e                expression
     *@return                  the code necessary to do the float
     *@exception  SyntaxError  Description of Exception
     */
    Node optionalfloat(Type assignedTo, Node e) throws SyntaxError {
        Type  t  = getType(e);
        if(t instanceof Ref && (!(t instanceof Pointer))) {
            e = forcederef(e);
        }
        if(isreal(assignedTo.type) && !isreal(e.returnType())) {
            if(isPixel(t)) {
                return pixel2real(e);
            }
            return floatit(e, assignedTo);
        }
        return e;
    }


    /**
     *  Description of the Method
     *
     *@param  t                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of the Exception
     */
    Type resolvepointertypes(Type t) throws SyntaxError {
        try {
            if(t instanceof PointerToNamedType) {
                return new Pointer((Type) symbolTable.checkedGet(((PointerToNamedType) t).typename), processor);
            }
            if(t instanceof Ref) {
                ((Ref) t).pointsTo = resolvepointertypes(((Ref) t).pointsTo);
            }
        }
        catch(Exception e) {
            error("Unknown pointer type " + t + " " + e.getMessage());
        }
        return t;
    }


    /**
     *  Description of the Method
     *
     *@param  s                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type string2Type(String s) throws SyntaxError {
        // System.out.println("string2type "+s);
        if(s.equals(realrep)) {
            return REAL;
        }
        if(s.equals(intrep)||s.equals("word")) {
            return INTEGER;
        }
        if(s.equals(boolrep)) {
            return BOOLEAN;
        }
        if(s.equals(stringTok)) {
            return STRING;
        }
        if(s.equals(charrep)) {
            return CHAR;
        }
        if(s.equals("uint16")) {
            return WORD;
        }
        if(s.equals("int16")) {
            return INT16;
        }
        if(s.equals("int8")) {
            return INT8;
        }
        if(s.equals("int64")) {
            return LONG;
        }
        if(s.equals("uint8") || s.equals("octet")) {
            return BYTE;
        }
        if(s.equals("void")) {
            return ANY;
        }
        if(s.equals("ieee64")) {
            return DOUBLE;
        }
        if(s.startsWith("ref ")) {
            return new Ref(string2Type(Format.typeDeref(s)));
        }
        if(Format.isVector(s)) {
            int       len      = Format.getVectorTypeLength(s);
            Type      elem     = string2Type(Format.getVectorElementType(s));
            long[][]  indices  = {{0, len}};
            return new ArrayType(indices, elem, elem.sizeOf(processor));
        }
        error("Can not resolve type of " + s);
        return BOOLEAN;
    }

    /* variables used in checking for safety of parallelism */
    boolean unparalleled = true;
    BitSet parlines = new BitSet();
    boolean containscalls = false;
    int callcount = 0;

    void profprint() {
        try {
            String listf;
            FileOutputStream fs=new FileOutputStream(listf=(pathPrefix+sourceName).replace(".pas",".lis"));
            PrintStream pw = new PrintStream(fs);
            FileReader ft = new FileReader(pathPrefix+sourceName);
            int c;
            boolean finished=false;
            int l=1;
            System.out.println("\nGenerating SIMD parallelism analysis to "+listf);
            pw.println("listing of file "+sourceName);
            pw.println("A 'P' at the start of a line indicates the line has been SIMD parallelised by the front end");
            pw.println("      Some code generators like AVX2 or MIC may do further SIMD transformations ");
            while(!finished) {
                pw.format("%6d ",l);
                if(parlines.get(l))pw.print("P");
                else pw.print(" ");
                for(c=ft.read(); c!='\n'&& !finished; c=ft.read()) {
                    if(c==-1) finished=true;
                    else if(((char)c)!='\r')pw.print((char)c);
                }
                l++;
                pw.println();
            }
            pw.close();
        }
        catch(Exception e) {
            System.err.println(e.toString());
        }
    }

    /**
     *  Compute using simd parallelism the sum of exp as indexvar ranges from lwb
     *  to upb
     *
     *@param  exp              Description of the Parameter
     *@param  n                Description of the Parameter
     *@param  indexvar         Description of the Parameter
     *@param  lwb              Description of the Parameter
     *@param  upb              Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node parallelsum(Node exp, int n, Node indexvar, Node lwb, Node upb)
    throws SyntaxError {
        /*
         *  The code will be equivalent to: Assume
         *  parallelism of n, exp:T int range = upb - lwb
         *  +1; int firstrange = range and not(n-1); int
         *  top ; T temp [n],temp2; if range >= 2*n then
         *  top = lwb + firstrange; indexvar=lwb;
         *  temp=par exp;
         *
         *  for indexvar=lwb+n to top step n do temp+=
         *  par exp; temp2 =temp[0]+temp[1]...+temp[n-1];
         *  else
         *
         *  top = lwb indexvar = top temp2=exp; fi
         *
         *  for indexvar = top+1 to upb do temp2+= exp;
         *  return temp2
         */
        exp = forcederef(exp);
        lwb = forcederef(lwb);
        upb = forcederef(upb);
        Type    T  = getType(exp);
        String  t  = exp.returnType();
        /*
         *  int range = upb - lwb +1; int firstrange = range and not(n-1); int
         *  top = lwb + firstrange;
         */
        try {
            Node       diff;
            Node       rangeval             = dyad(diff = dyad(upb, lwb, "-"),
                                                   new Int(1, "int32"), "+");
            Node       rangeloc             = tempvar(INTEGER);
            Node       range                = forcederef(rangeloc);
            postPrestatement(new Assign(rangeloc, rangeval));
            // System.out.println("rangeval ="+rangeval+"\ndif="+diff);
            Node       firstrange           = dyad(range, new Int(-1 ^ (n - 1), "int32"), "AND")
                                              .eval();
            Node       toploc               = tempvar(INTEGER);
            Node       top                  = forcederef(toploc);
            Node       inittop              = new Assign(toploc, dyad(lwb, firstrange, "+").eval());
            /*
             *  T temp [n],temp2;
             */
            long[][]   bounds               = new long[1][2];
            bounds[0][0] = 0;
            bounds[0][1] = n - 1;
            ArrayType  at                   = new ArrayType(bounds, T, T.sizeOf(processor));
            Memref     temploc              = (Memref) tempvar(at);
            Node       temp                 = forcederef(temploc);
            Node       regloc               = (Memref) tempvar(at);
            // register cached version of
            // temploc
            Node       reg                  = forcederef(regloc);
            Node       temp2loc             = tempvar(T);
            Node       temp2                = forcederef(temp2loc);
            /*
             *  indexvar=lwb; temp=par exp;
             *
             *  for indexvar=lwb+n to top step n do temp+= par exp; temp2
             *  =temp[0]+temp[1]...+temp[n-1];
             */
            Node       firstassignofindex   = new Assign(indexvar, forcederef(lwb));
            Node       indices[]              = {new Int(0, "int32")};
            Node       pexp;
            Node       assigntemp0          = new Assign(regloc, pexp = parallelise(exp, n, T,
                    indexvar));
            Node       step                 = new Int(n, "int32");
            Statement  firstFor             = new Statement(new For(indexvar, dyad(
                        forcederef(lwb), step, "+"), top, step, new Assign(regloc,
                                new Dyad(reg, pexp, "+"))));
            firstFor.setLocal((Memref) indexvar);
            Node       copyreg              = new Assign(temploc, reg);
            Node       sum                  = forcederef(new Memref(temploc.index, t));
            for(int i = 1; i < n; i++) {
                sum = dyad(sum,
                           forcederef(new Memref(dyad(temploc.index, new Int(i
                                                      * Format.lengthInBytes(t), "int32"), "+"), t)),
                           "+");
            }
            Node       inittemp2            = new Assign(temp2loc, sum);
            /*
             *  else
             *
             *  top = lwb indexvar = lwb temp2=exp; fi
             */
            Node       secondinittop        = new Assign(toploc, forcederef(lwb));
            Node       secondassignofindex  = firstassignofindex;
            Node       secondinittemp2      = new Assign(temp2loc, exp);
            /*
             *  Now form the condition if range >= 2*n then top = lwb +
             *  firstrange; indexvar=lwb; temp=par exp;
             *
             *  for indexvar=lwb+n to top step n do temp+= par exp; temp2
             *  =temp[0]+temp[1]...+temp[n-1]; else
             *
             *  top = lwb indexvar = top temp2=exp; fi
             */
            Statement  localpart;
            Node       theIf                = new If(dyad(range, new Int(2 * n, "int32"), ">=")
                    .eval(),
                    // then
                    new Statement(inittop, new Statement(firstassignofindex,
                                  localpart = new Statement(new Statement(
                                              assigntemp0, new Statement(firstFor,
                                                      new Statement(copyreg,
                                                              new Statement(inittemp2,
                                                                      null))))))),
                    // else
                    new Statement(secondinittop, new Statement(
                                      secondassignofindex, new Statement(secondinittemp2,
                                              null)))).eval();
            localpart.setLocal((Memref) regloc);
            // System.out.println("the if ="+theIf);
            /*
             *  for indexvar = top+1 to upb do temp2+= exp; return temp2
             */
            Node       secondFor            = new For(indexvar, dyad(top, new Int(1, "int32"),
                    "+"), forcederef(upb), new Int(1, "int32"), new Assign(
                        temp2loc, exp));
            postPrestatement(theIf);
            postPrestatement(secondFor);
            return temp2;
        }
        catch(Exception e) {
            error("forming a parallel sum " + e);
            return null;
        }
    }


    /**
     *  Converts an expression n into a data parallel expression of parallelism
     *  given by the second parameter by replacing each array reference by an array
     *  reference to a vector of the appropriate parallelism
     *
     *@param  n              Description of the Parameter
     *@param  parallelism    Description of the Parameter
     *@param  t              Description of the Parameter
     *@param  lastindex      Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Node parallelise(Node n, int parallelism, Type t, Node lastindex)
    throws Exception {
        nonlasti  examiner   = new nonlasti(lastindex.toString(), t.type);
        n.examine(examiner);
        // System.out.println("attempt to parallelise "+n);
        FunctionFinder             af          = new FunctionFinder();
        // do not parallelise if it
        // has function calls
        n.examine(af);
        IfFinder                   IF          = new IfFinder();
        // do not parallelise if it has branches
        n.examine(IF);
        if(examiner.fault||unparalleled || af.count != 0 || IF.count != 0) {
            throw new Exception("should not attempt to parallelise this"+
                                "\n examiner.fault "+examiner.fault+
                                "\n unparalleled "+unparalleled+
                                "\n af.count (function calls )"+ af.count+
                                "\n IF.count "+IF.count
                               );
        }
        Type                       t2          = getType(forcederef(n));
        if(!(t2.equals(t) || t2.equals(ANY))) {
            throw new Exception("trying to form a vector of " + t + " from \n"
                                + n + "\n but got a " + t2);
        }
        CommonSubExpressionFinder  scale       = new CommonScalarFinder(
            forcederef(lastindex));
        CommonSubExpressionFinder  subs        = new CommonSubscriptionFinder(
            forcederef(lastindex));
        int                        attempts    = 0;
        boolean                    pure        = false;
        while((attempts < 7 && !pure) || attempts < 2) {
            attempts++;
            CommonSubExpressionFinder  decaster  = new CommonCastFinder();
            n.examine(decaster);
            if(decaster.getRepeatCount() > 0) {
                Object[]  subcasts  = decaster.getRepeats();
                Cast[]    before    = new Cast[subcasts.length];
                Node[]    after     = new Node[subcasts.length];
                for(int i = 0; i < subcasts.length; i++) {
                    before[i] = (Cast) subcasts[i];
                    after[i] = processor.decast(before[i]);
                    // System.out.println("decast \n"+i+"\n replace \n"+before[i]+"\nwith  \n"+after[i]);
                    Statement  rep  = new Statement(n);
                    rep = (Statement) ExpressionSubstituter.substituteAwithBinC(before[i], after[i], rep);
                    n = rep.action;
                    // System.out.println(n.toString());
                }
                // System.out.println("in parallelise modified to "+n+" on attempt "+attempts);
            }
            else {
                pure = true;
            }
        }
        if(!pure) {
            throw new Exception("Can not purify " + n);
        }
        String                     original    = n.toString();
        n.examine(subs);
        n.examine(scale);
        Object[]                   subexps     = subs.getRepeats();
        Object[]                   scalexp     = scale.getRepeats();
        if(subexps.length == 0 && scalexp.length == 0) {
            throw new Exception("no array subscriptions found ");
        }
        Node                       p           = n;
        Node[]                     a           = new Node[subexps.length + scalexp.length];
        Node[]                     b           = new Node[subexps.length + scalexp.length];
        for(int i = 0; i < subexps.length; i++) {
            ArraySubscription  x  = (ArraySubscription) subexps[i];
            a[i] = x;
            b[i] = x.parallelise(parallelism, forcederef(lastindex));
        }
        for(int i = 0; i < scalexp.length; i++) {
            a[i + subexps.length] = (Node) scalexp[i];
            b[i + subexps.length] = replicate((Node) scalexp[i], parallelism,
                                              getType(forcederef((Node) scalexp[i])), lastindex);
        }
        // System.out.println(" parallel access to array ");
        // for(int i=0;i<subexps.length;i++)
        // System.out.println(" "+a[i]+"\n -> "+b[i]);
        // System.out.println(" replicates ");
        // for(int i=subexps.length;i<a.length;i++)
        // System.out.println(" "+a[i]+"\n -> "+b[i]);
        // System.out.println(" in "+p);
        ExpressionSubstituter      substitute  = new ExpressionSubstituter(a, b);
        if(p.equals(a[0])) {
            p = b[0];
        }
        else {
            p = p.modify(substitute);
            if(substitute.done == 0) {
                throw new Exception(
                    "could not substitute in parallel array accesss, \nit was modified to "
                    + p);
            }
        }
        String                     cooked      = p.toString();
        // System.out.println(original+"\n->"+cooked);
        if(cooked.equals(original)) {
            throw new Exception("parallel code identical to original");
        }
        return p;
    }


    /**
     *  Description of the Method
     *
     *@param  n              Description of the Parameter
     *@param  i              Description of the Parameter
     *@param  t              Description of the Parameter
     *@param  loopindex      Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Node replicate(Node n, int i, Type t, Node loopindex) throws Exception {
        if(i == 1) {
            return n;
        }
        String     t2        = (forcederef(n)).returnType();
        if(!t2.equals(t.returnType())) {
            throw new Exception("trying to form a constant vector of "
                                + t.returnType() + "\n but got a " + t2);
        }
        /*
         *
         */
        long[][]   bounds    = new long[1][2];
        bounds[0][0] = 0;
        bounds[0][1] = i - 1;
        ArrayType  at        = new ArrayType(bounds, t, t.sizeOf(processor));
        int limit =currentLocalAllocator().getLimit();
        Node       v         = tempvar(at);
        try {
            String  vt   = t2 + " vector ( " + i + " )";
            Node    rep  = new Cast(vt, new Dyad(forcederef(n), new Int(i, "int32"), new Op("rep", t2, "int32", vt)));
            Assign  vr   = new Assign(v, rep);
            if(testgen(vr)) {
                // dont use replicate if processor does not support it
                if(!n.knownAtCompileTime()) {
                    // dont do dynamic replication for constants
                    currentLocalAllocator().setLimit(limit);// we dont need the temporary
                    return rep;
                }
            }
        }
        catch(Exception notgen) {
            System.out.println(notgen.toString());
        }
        ;
        if(!n.knownAtCompileTime()) {
            if(forcederef(n).equals(forcederef(loopindex))) {
                error("unsafe to replicate variable," + n
                      + " we dont know where it was initialised");
            }
            recordPreloopAction(loopindex, new Assign(subscript(v, new Int(0,
                                intrep)), new TypeTag(n, t)));
            for(int j = 1; j < i; j++) {
                recordPreloopAction(loopindex, new Assign(subscript(v, new Int(
                                        j, intrep)),
                                    (n.knownAtCompileTime() ? (Node) new TypeTag(n, t)
                                     : (Node) new Deref(subscript(v, new Int(0,
                                                        intrep))))));
            }
            return new Deref(new Memref(getAddr(v), t.type + " vector ( " + i
                                        + " )"));
        }
        currentLocalAllocator().setLimit(limit);// we dont need the temporary
        Node       firstlab  = null;
        for(int j = 0; j < i; j++) {
            Node  l  = plant(n);
            firstlab = l;
        }
        return new Deref(new Memref(firstlab, t.type + " vector ( " + i + " )"));
        /*
         *
         */
    }


    /**
     *  A unit test for JUnit
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    boolean testgen(Node n) {
        int      start  = processor.buf.mark();
        boolean  ok     = processor.codeGen(n);
        processor.rollBack(start);
        if (processor.verbose){
			if(ok)processor.log("testgen succeeds for "+n);
			else processor.log("testgen fails for "+n);
		}
        return ok;
    }


    // variables used to check validity of array assignments
    Node assdest = null;
    Node[] assindices;
    String assdestname = " ";
    boolean hazardcheck = false;

    // must be true to enable hazard checks


    /**
     *  Generates an error if e is the assignment destination and there has been a
     *  permutation of the indices
     *
     *@param  e                Description of the Parameter
     *@param  indices          Description of the Parameter
     *@exception  SyntaxError  Description of the Exception
     */
    void checkdatahazards(Node e, Node[] indices) throws SyntaxError {
        if(hazardcheck) {
            if(assdest == e) {
                for(int i = 0, j = 0; i < assindices.length
                        && j < indices.length; i++, j++) {
                    // int j= i +indices.length-assindices.length;
                    // for (int j=0;j<indices.length;j++)
                    String  s  = (processor.decast(forcederef(assindices[i])))
                                 .toString();
                    String  t  = (processor.decast(indices[j])).toString();
                    if(!s.equals(t)) {
                        {
                            // if
                            // ((assindices.length-i)==(indices.length-j))
                            String  mess  = (" \n\tdata hazard found. Destination \""
                                             + assdestname
                                             + " \" is used with an index permutation on\n"
                                             + "\tright hand side of := which can cause it to be corrupted.\n"
                                             + "\tYou can get round this by assigning to a temporary array instead and then\n"
                                             + "\tassigning the temporary to destination \""
                                             + assdestname + "\"");
                            mess = mess + "\n destination indices ";
                            int     k;
                            for(k = 0; k < assindices.length; k++) {
                                mess = mess
                                       + "\n\t"
                                       + (processor.decast(forcederef(assindices[k])))
                                       .toString()
                                       + (k == i ? "****" : "");
                            }
                            mess = mess + "\n source indices ";
                            for(k = 0; k < indices.length; k++) {
                                mess = mess
                                       + "\n\t"
                                       + (processor.decast(forcederef(indices[k])))
                                       .toString()
                                       + (k == j ? "****" : "");
                            }
                            System.err.println(mess);
                            error(mess);
                        }
                    }
                }
            }
        }
    }


    /**
     *  Given a node which may be a dereference, this finds the memory location
     *  being dereferenced
     *
     *@param  n              Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Memref memrefof(Node n) throws Exception {
        // System.out.println("memref of "+n);
        if(n instanceof Memref) {
            return (Memref) n;
        }
        if(n instanceof Cast) {
            return memrefof(((Cast) n).getSubtree());
        }
        if(n instanceof Deref) {
            return memrefof(((Deref) n).getArg());
        }
        throw new Exception(" Can not find a memref in " + n);
    }


    /**
     *  This checks if there is just a single assignment in the loop and then if
     *  there are array refs in the assignment it collects the pointers to the
     *  array so that they can be register cached.
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    Vector cacheablerefs(Statement n) {
        ArrayFinder  af    = new ArrayFinder();
        n.examine(af);
        int          last;
        Vector       v     = new Vector(0);
        if((last = af.getRepeatCount()) >= 1) {
            Object[]  repeats  = af.getRepeats();
            for(int i = 0; i < last; i++) {
                try {
                    Node    base   = ((ArraySubscription) repeats[i])
                                     .getArrayStart();
                    Node    index  = ((ArraySubscription) repeats[i]).index;
                    Memref  m      = memrefof(base);
                    v.add(m);
                }
                catch(Exception e4) {
                    // ignore
                }
            }
        }
        return v;
    }


    /**
     *  Description of the Method
     *
     *@param  local          Description of the Parameter
     *@param  n              Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Statement cachelocalin(Memref local, Statement n) throws Exception {
        Node       drl;
        Memref     temp  = (Memref) tempvar(getType(drl = forcederef(local)));
        Statement  ns    = new Statement(new Assign(temp, drl), new Statement(
                                             ExpressionSubstituter.substituteAwithBinC(local, temp, n)));
        ns = new Statement(ns);
        ns.setLocal(temp);
        // System.out.println(ns.toString());
        return ns;
    }


    /**
     *  Description of the Method
     *
     *@param  locals         Description of the Parameter
     *@param  node           Description of the Parameter
     *@param  n              Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Statement cachelocalsin(Vector locals, Statement node, int n)
    throws Exception {
        // System.out.println("cachelocals in(locals, node, "+n+")"+locals.size());
        if(n < 0) {
            return node;
        }
        if(locals.size() <= n) {
            return cachelocalsin(locals, node, n - 1);
        }
        return cachelocalsin(locals, cachelocalin((Memref) locals.elementAt(n),
                             node), n - 1);
    }


    /**
     *  Description of the Method
     *
     *@param  v                Description of the Parameter
     *@param  tt               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node doassign(Node v, Type tt) throws SyntaxError {
        if(processor.verbose || dolist()) {
            System.out.println("\n\nDoassign{\n\n");
        }
        Node  res  = Doassign(v, tt);
        if(processor.verbose || dolist()) {
            System.out.println("\n Prestatment: " + prestatement
                               + "\nAssignment:" + res + "\n}\n");
        }
        //	if (!unparalleled)parlines.set(lex.lineno());
        return res;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    boolean dolist() {
        boolean  list  = lex.lineno() >= Walker.switchon
                         && lex.lineno() <= Walker.switchoff;
        return list;
    }


    // generate code to assign to v
    boolean streaming = false;// set true whilst in a streaming assignment indicated by <- operator
    /**
     *  Description of the Method
     *
     *@param  v                Description of the Parameter
     *@param  tt               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node Doassign(Node v, Type tt) throws SyntaxError {
        unparalleled = false;
        boolean  list                  = lex.lineno() >= Walker.switchon
                                         && lex.lineno() <= Walker.switchoff;
        int      oldexpressionContext  = expressionContext;
        expressionContext = assignContext;
        int      oldcalls              = callcount;
        boolean  oldcontains           = containscalls;
        containscalls = false;
        int      therank               = getRank(tt);
        if(therank ==0) unparalleled=true;
        if(v instanceof Variable) {
            if(((Variable) v).Protected) {
                error(" assignment to protected location ");
            }
        }
        if(processor.verbose || list) {
            System.out.println("rank of " + v + ":" + tt + "=" + therank);
            System.out.println("size of " + v + "=" + tt.sizeOf(processor));
            System.out.println("unparalleled ="+unparalleled);
        }
        Node     res                   = null;
        Node[]   indices               = new Node[1];
        Node     e;
        try {
            Statement  saveprestatement  = prestatement;
            Statement  newprestatement   = null;
            Node       v1                = v;
            Type       rest;
            if(therank == 0) {
                e = expression();
                e = forceTypeCompatibility(e, tt);
                rest = getType(e);
                res = new Assign(v, e, false);
                if(dolist()) {
                    System.out.println("in do assign\n\te=" + e + "\n\trest=" + rest + "\n\rres=" + res + "\n\tv=" + v);
                }
            }
            else {
                Node       fd;
                ArrayType  at           = null;
                Type       actualtype   = tt;
                try {
                    actualtype = getType(fd = forcederef(v));
                    at = (ArrayType) actualtype;
                }
                catch(ClassCastException ex1) {
                    at = (ArrayType)((Pointer) actualtype).pointsTo;
                }
                if(at.elemtype instanceof SetType) {
                    setAssignmentContext = (SetType) at.elemtype;
                }
                // collect any bounds checks in new prestatement
                saveprestatement = prestatement;
                prestatement = null;
                indices = new Node[therank];
                for(int i = 0; i < therank; i++) {
                    indices[i] = tempvar((addrlength==4?INTEGER:LONG));
                    if(processor.verbose) {
                        System.out.println("index " + i + " of " + v + "="
                                           + indices[i]);
                    }
                    declareLoopIterator(indices[i]);
                    arrayiteratorset.put(indices[i], indices[i]);
                }
                autoiterators = indices;
                assindices = indices;
                hazardcheck = true;
                assdest = v;
                if(list) {
                    System.out.println(" parse array exp");
                    System.out.println("prestatement=" + prestatement);
                    System.out.println("saveprestatement=" + saveprestatement);
                }
                e = expression(0, therank, indices);
                if(list) {
                    System.out.println("rhs =" + e);
                }
                hazardcheck = false;
                // temporatily switch of range checks
                boolean    oldchecks    = lex.rangechecks;
                lex.rangechecks = false;
                v1 = subscript(v, indices);
                lex.rangechecks = oldchecks;
                Node       DRv1         = new Deref(v1);
                e = forcederef(e);
                e = forceTypeCompatibility(e, at.elemtype);
                // if(!at.elemtype.equals(getType(e)))
                // if(!(at.elemtype instanceof
                // StringType))error("type error,  "+at.elemtype+" <> "+getType(e));
                e = typeTag(e, at.elemtype);
                // System.out.println("lhs="+v1);
                // System.out.println("Rhs="+e);
                rest = getType(e);
                // if array expression surround by for loop
                Node[]     preloops     = new Node[therank];
                Assign     basicassign  = new Assign(v1, e);
                if(list) {
                    System.out.println("prestatement=" + prestatement);
                    System.out.println("saveprestatement=" + saveprestatement);
                    System.out.println("basicassign=" + basicassign);
                }
                try {
                    Node  newass  = optimiseSetAssign(basicassign);
                    // System.out.println("newass="+newass);
                    basicassign = (Assign) newass;
                }
                catch(Exception basic) {
                    // System.out.println(basic);
                }
                newprestatement = prestatement;
                prestatement = saveprestatement;
                if(list) {
                    System.out.println("newprestatement =" + newprestatement
                                       + "\nsaveprestatement=" + saveprestatement);
                }
                res = new Statement(newprestatement, new Statement(basicassign))
                .eval();
                Statement  block;
                for(int i = therank - 1; i >= 0; i--) {
                    Node  lwb       = at.getLwb(i, getAddr(v));
                    if(list) {
                        System.out.println("lwb=" + lwb);
                    }
                    Node  upb       = at.getUpb(i, getAddr(v));
                    Node  ch        = checkArrayBoundsNotViolatedInLoopForIndex(
                                          indices[i], lwb, upb);
                    if(list) {
                        System.out.println("upb=" + upb);
                    }
                    Node  cacheupb  = tempvar(INTEGER);
                    Node  inittemp  = (upb.knownAtCompileTime() ? null
                                       : new Assign(cacheupb, new TypeTag(upb, INTEGER)));
                    res = new Statement(preloops[i] = new Statement(
                        getPreloopAction(indices[i]),
                        // grab pre-loop
                        // statements
                        new Statement(ch)),
                                        // place before the loop proper
                                        new Statement(inittemp, block = new Statement(
                        new For((Variable) indices[i], lwb, (upb.knownAtCompileTime() ? upb
                                : forcederef(cacheupb)), new Int(1,
                                        intrep), res).optimise())));
                    block.setLocal((Memref) indices[i]);
                    if(list) {
                        System.out.println("expanded loop=" + res
                                           + "\n block =" + block);
                    }
                    res = new Statement(res.eval());
                    if(list) {
                        System.out.println("evaluated loop=" + res);
                    }
                    // make the iteration variable register cachable in the
                    // absence of procedure calls
                    if(oldcalls == callcount) {
                        ((Statement) res).setLocal((Variable) indices[i]);
                    }
                }
                if(list) {
                    System.out.println("loop before parallising" + res);
                }
                int        parfactor    = (unparalleled ? 1 : processor.getParallelism(rest.type));
                if(parfactor==1) unparalleled=true;
                Vector     cacheables   = cacheablerefs(new Statement(basicassign));
                if(parfactor > 1) {
                    // try parallelising this
                    int limit = currentLocalAllocator().getLimit();
                    try {
                        if(list) {
                            System.out.println("Basic assign=" + basicassign);
                        }
                        Node       parassign;
                        Statement  parallelversion  = new Statement(
                            newprestatement,
                            new Statement(parassign = parallelise(new Assign(processor.decast(basicassign.dest), processor.decast(basicassign.src)), parfactor,
                                                      rest, (indices[therank - 1]))));
                        if(list) {
                            System.out.println("parallel version="
                                               + parallelversion);
                        }
                        if(!processor.generateable(parallelversion)) {
                            error("can not generate parallel version");
                        }
                        parlines.set(lex.lineno());
                        if(list) {
                            System.out.println("Parallel version =\n"
                                               + parallelversion);
                        }
                        for(int i = therank - 1; i >= 0; i--) {
                            Node       lwb        = at.getLwb(i, getAddr(v));
                            // System.out.println("lwb="+lwb);
                            Node       upb        = at.getUpb(i, getAddr(v)).eval();
                            Node       oldupb     = upb;
                            Node       step       = new Int((i == therank - 1 ? parfactor
                                                             : 1), intrep);
                            boolean    innermost  = false;
                            if(i == therank - 1) {
                                innermost = true;
                                Node  one;
                                Node  range          = dyad(dyad(upb, lwb, "-"), one = new Int(1, intrep), "+");
                                Node  pariterations  = dyad(range, step, Node.divide);
                                upb = dyad(dyad(dyad(pariterations, step, "*"), one, "-"), lwb, "+").eval();
                            }
                            if(list) {
                                System.out.println("upb=" + upb);
                            }
                            Node       pfor;
                            Node       sfor;
                            Node       pcacheupb  = tempvar(ADDRESS);
                            Node       pinittemp  = (upb.knownAtCompileTime() ? null
                                                     : new Assign(pcacheupb, upb));
                            Statement  ploop      = new Statement(new Statement(
                                    new Statement(pinittemp),
                                    block = new Statement(pfor = new For(
                                (Variable) indices[i],
                                lwb,
                                (upb.knownAtCompileTime() ? upb
                                 : forcederef(pcacheupb)
                                ),
                                step,
                                parallelversion) .optimise()
                                                         )
                                                                  )
                                                                 );
                            if(i == therank - 1) {
                                block.setLocal((Memref) indices[i]);
                            }
                            if(list) {
                                System.out.println("ploop=\n" + ploop);
                            }
                            Node masked =null;
                            if(usemaskedwrite)masked=new Statement(newprestatement,
                                                                       new Statement(new Assign((Variable) indices[i],
                                                                               dyad(upb, new Int(1, intrep), "+").eval()),
                                                                               new Statement(maskedassign(parassign, dyad(oldupb, upb, "-")))));
                            Statement  innerloop  = (innermost ? new Statement(
                                                         ploop,
                                                         new Statement(usemaskedwrite ?
                                                                 // we attempt to do a write to memory under a mask
                                                                 // using the shorter vector
                                                                 sfor =masked
                                                                         : new Statement(
                                                                                 // the non parallel loop handles the
                                                                                 // part left over by the
                                                                                 // vectorisation
                                                                                 sfor = new For(
                                (Variable) indices[i],
                                dyad(upb, new Int(1, intrep), "+").eval(),
                                oldupb,
                                new Int(1, intrep),
                                new Statement(
                                    newprestatement,
                                    new Statement(
                                        basicassign)))
                            .optimise())))
                                                     :
                                                     // create nesting if not inner loop
                                                     new Statement(
                                                         sfor = new For(
                                (Variable) indices[i], lwb,
                                upb, new Int(1, intrep),
                                parallelversion).optimise()));
                            parallelversion =
                                // this is to ensure all preloop
                                // actions are replicated here
                                // preloops contains all the pre loop actions
                                // required by the
                                // sequential code, we also call getPreloopAction to
                                // get any
                                // new actions invoked by the parallelisation
                                // these typically involve the replication of
                                // scalars in
                                // scalar to vector arithmetic
                                new Statement(
                                new Statement(preloops[i], new Statement(
                                                  getPreloopAction(indices[i]))),
                                innerloop);
                        }
                        res = parallelversion;
                        // System.out.println("Parallelised to "+res);
                    }
                    catch(Exception nopar) {
                        // ignore this
                        if(list) {
                            System.out.println("Warning unable to vectorise line :"
                                               + lex.lineno()
                                               + " "
                                               + nopar.getMessage());
                            nopar.printStackTrace();
                        }
                        currentLocalAllocator().setLimit(limit);// we dont want to keep space for operations that were not needed
                    }
                }
                v = v1;
                tt = getType(v1);
                for(int i = 0; i < therank; i++) {
                    freeIterator(indices[i]);
                }
            }
            if(tt instanceof RealType) {
                if(!((RealType) tt).dimensionallyEquivalent((RealType) rest)) {
                    System.out.println(tt + "<> " + rest);
                    dimerror(":=");
                }
            }
        }
        catch(Exception ex) {
            error(" assignment invalid " + ex.toString());
        }
        expressionContext = oldexpressionContext;
        containscalls = containscalls || oldcontains;
        // TT changed from binary
        // or
        if(list) {
            System.out.println("do assign returns " + res);
        }
        return res;
    }


    /**
     *  Description of the Method
     *
     *@param  assignment     Description of the Parameter
     *@param  elemcount      Description of the Parameter
     *@return                Description of the Return Value
     *@exception  Exception  Description of the Exception
     */
    Node maskedassign(Node assignment, Node elemcount) throws Exception {
        // given a vector assignment of the form (x vector(n) )a = (x vector (n))b
        // and a number of vector elements to assign this will convert it to
        // a= a and not mask[elemcount] or b and mask[elemcount]
        // where mask is an appropriatee array of binary masks
        Assign  a               = (Assign) assignment;
        String  assignmenttype  = a.src.returnType();
        int     vlen            = Format.getVectorTypeLength(assignmenttype);
        int     elen            = Format.lengthInBytes(Format.getVectorElementType(assignmenttype));
        String  masktype        = Format.typeToFormat("uint8 vector ( " + (vlen * elen) + " )");
        // Now set up the mask array
        byte[]  mask            = new byte[(1 + vlen) * vlen * elen];
        for(int row = 0; row <= vlen; row++) {
            for(int elem = 0; elem < vlen; elem++) {
                for(int bnum = 0; bnum < elen; bnum++) {
                    mask[bnum + elen * (elem + row * vlen)] = (byte)(elem < row ? 0xff : 0);
                }
            }
        }
        Label   masklab         = plantByteArray(mask);
        Node    maski           = new Deref(new Memref(dyad(masklab, dyad(elemcount, new Int(vlen * elen, "int32"), "*"), "+"), masktype));
        return new Assign(new Cast("ref " + masktype, a.dest),
                          new Dyad(new Dyad(new Cast(masktype, new Deref(a.dest)), new Monad(new Op("NOT", masktype, masktype, masktype), maski), "AND"),
                                   new Dyad(a.src, maski, "AND"), "OR"));
    }


    /**
     *  Recognise a procedure identifier in the context of a parameter list
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node recogniseProcId() throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        String  id  = lex.theId;
        Object  n   = symbolTable.get(id);
        if(n == null) {
            error("undeclared identifier " + id);
        }
        Node    N   = (Node) n;
        Type    t   = getType(N);
        if(!(N instanceof ProcType)&& !isprocparam(t)) {
            error("procedure name expected here");
        }
        return (N);
    }


    /**
     *  Description of the Method
     *
     *@return                  ilcg of the parsed satement
     *@exception  SyntaxError  Description of Exception
     */
    Node statement() throws SyntaxError {
        try {
            statements++;
            setAssignmentContext = defsetContext;
            Statement  oldprestatement  = prestatement;
            prestatement = null;
            Node       res              = new Statement(null);
            // variable := expression
            if(lex.peek(lex.TT_IDENTIFIER)) {
                try {
                    assdestname = lex.theString;
                    Object  got  = null;
                    try {
                        got = symbolTable.checkedGet(assdestname);
                    }
                    catch(Exception en) {
                        error("do not recognise " + assdestname + " here");
                    }
                    if(got.toString().equals(compileTimeFunction)) {
                        res = docompiletimeproc(assdestname);
                    }
                    else {
                        Node  v   = variable();
                        Type  vt  = getType(v);
                        // System.out.println("in statement vt="+vt);
                        if(vt instanceof Ref) {
                            Ref  r  = (Ref) vt;
                            if(r.pointsTo instanceof ProcType) {
                                //   System.out.println(r.toString()+" is a proc");
                                if(!lex.peek(lex.TT_ASSIGN)) {
                                    throw new TypeIdError("procedure variable",	v);
                                }
                            }
                            if(r.pointsTo instanceof Ref) {
                                //	System.out.println("var "+v+":"+r.toString()+" is a ref");
                                r = (Ref) r.pointsTo;
                                if(r.pointsTo instanceof ProcType) {
                                    if(!lex.peek(lex.TT_ASSIGN)) {
                                        TypeIdError s= new TypeIdError("procedure variable", v);
                                        //	s.printStackTrace();
                                        throw s;
                                    }
                                }
                            }
                        }
                        //System.out.println("in Statement leading variable of type:"+vt);
                        if(!vt.equals(voidType)) {
                            // a void type can have arisen if the
                            // expression on the lhs was a procedure method call
                            mustbe(lex.TT_ASSIGN);
                            streaming = lex.theString.equals("\u2190");
                            if(v instanceof Variable) {
                                ((Variable) v).assignto();
                            }
                            Type  tt  = (getType(new Deref(v)));
                            if(dolist()) {
                                System.out.println(v.toString() + ":" + tt + ":=");
                            }
                            if(tt instanceof StringType) {
                                res = stringassign(v, expression());
                            }
                            else {
                                if(tt instanceof SetType) {
                                    setAssignmentContext = (SetType) tt;
                                    res = optimiseSetAssign(doassign(v, tt));
                                }
                                else if(tt instanceof ArrayType
                                        && ((ArrayType) tt).elemtype instanceof SetType) {
                                    setAssignmentContext = (SetType)(((ArrayType) tt).elemtype);
                                    res = optimiseSetAssign(doassign(v, tt));
                                }
                                else {
                                    res = doassign(v, tt);
                                }
                            }
                        }
                    }
                }
                catch(TypeIdError u) {
                    boolean  was_proc_var  = false;
                    try {
                        // see if the identifier is a procid
                        String  id     = u.getMessage();
                        //  System.out.println("see if the identifier is a procid u="+u);
                        Object  value  = (id.equals("procedure variable") ? getType((Node) u.value)
                                          : symbolTable.checkedGet(id));
                        //  System.out.println("value="+value);
                        if(value instanceof UnitHolder) {
                            value = u.value;
                        }
                        if(currentFunctionName.contains(id)) {
                            // then this is a function return
                            mustbe(lex.TT_ASSIGN);
                            Node  v                = (Node) symbolTable.checkedGet(id + "$val");
                            Ref   reftypeAssigned  = (Ref) getType(v);
                            ((Variable) v).assignto();
                            Type  typeAssigned     = reftypeAssigned.pointsTo;
                            // cut of the leading ref
                            Type  tt               = typeAssigned;
                            // System.out.println(v.toString()+":"+tt+":=");
                            if(tt instanceof StringType) {
                                Node  e1  = expression();
                                // System.out.println("string assign"+e1);
                                res = stringassign(
                                          adjustLexLevel((ilcg.tree.Variable) v),
                                          e1);
                            }
                            else {
                                if(tt instanceof SetType) {
                                    setAssignmentContext = (SetType) tt;
                                }
                                res = doassign(
                                          adjustLexLevel((ilcg.tree.Variable) v),
                                          tt);
                            }
                        }
                        else if(value instanceof ProcType
                                || value instanceof Ref) {
                            try {
                                // / callprocedure
                                //  System.out.println("Attempt to call procedure "+value);
                                Vector     actualParams  = new Vector();
                                Type       P             = (Type) value;
                                while(P instanceof Ref) {
                                    P = ((Ref) P).pointsTo;
                                }
                                //    System.out.println("expecting a procedure type here "+P);
                                ProcType   p             = (ProcType) P;
                                //  System.out.println("cast to proc type ok ");
                                was_proc_var = true;
                                Type[]     formalParams  = p.params;
                                //  System.out.println("procedure "+id+":"+p+" value="+value);
                                if(p.numparams > 0) {
                                    mustbe('(');
                                    for(int j = 0; j < p.numparams; j++)
                                        try {
                                            Node[]  indices  = new Node[1];
                                            boolean isproc = isprocparam(formalParams[j]);
                                            // System.out.println("is proc "+isproc);
                                            Node    exp      = ((! isproc)? expression(
                                                                    getRank(formalParams[j]), 0,
                                                                    indices, formalParams[j])
                                                                : recogniseProcId());
                                            // System.out.println("exp="+exp+" formal param="+formalParams[j]);
                                            exp = forceParamCompatibility(exp,
                                                                          formalParams[j]);
                                            // System.out.println("after force comp "+exp+" returntype="+exp.returnType());
                                            actualParams.addElement(exp);
                                            if(j < (p.numparams - 1)) {
                                                if(!have(',')) {
                                                    error(" too few actual parameters, wanted "
                                                          + p.numparams
                                                          + " got "
                                                          + (j + 1));
                                                }
                                            }
                                        }
                                        catch(Exception inloop) {
                                            error(" processing parameter list, at param "+j+" got exception<<"+inloop+">>");
                                        }
                                    mustbe(')');

                                }
                                Cartesian  params        = new Cartesian(actualParams);
                                try {
                                    if(id.equals("procedure variable")) {
                                        //	System.out.println("Id is procedure variable "+id);
                                        res = new Monad(new Function(
                                                            /*forcederef*/((Node) u.value), p.paramtypes(), "void"),
                                                        params);
                                    }
                                    else {
                                        Function  keepf  = new Function(p.theProc);
                                        res = new Monad(keepf, params);
                                        if(p.isPure()) {
                                            purefunctions.add(keepf);
                                        }
                                    }
                                    //	 System.out.println("id="+id+"res="+res+"u.value="+u.value);
                                }
                                catch(Exception en) {
                                    error("internal compiler error \nprocessing procedure call\n"
                                          + en.getMessage());
                                }
                            }
                            catch(Exception een) {
                                error("expected a procedure name here " + een);
                            }
                        }
                        else {
                            error(id + " is not a variable or procedure ");
                        }
                    }
                    catch(Exception en1) {
                        error("in statement " + en1.getMessage());
                    }
                }
            }
            /*
             *  begin statement-list end
             */else if(lex.have("begin")) {
                Statement  l  = statement_list();
                lex.mustbe("end");
                res = l;
            }
            else if(have("exit")) {
                try {
                    res = null;
                    if(have('(')) {
                        Node  v                = (Node) symbolTable.checkedGet(currentFunctionName.peek() + "$val");
                        Ref   reftypeAssigned  = (Ref) getType(v);
                        Type  typeAssigned     = reftypeAssigned.pointsTo;
                        // cut of the leading ref
                        if(typeAssigned instanceof StringType) {
                            Node  e1  = expression();
                            res = stringassign(v, e1);
                        }
                        else {
                            if(typeAssigned instanceof SetType) {
                                setAssignmentContext = (SetType) typeAssigned;
                            }
                            res = doassign(v, typeAssigned);
                        }
                        mustbe(')');
                    }
                    res = new Statement(res, new Statement(new Goto(
                            (Node) symbolTable.checkedGet("$exit"))));
                }
                catch(Exception ennn) {
                    error("in exit " + ennn.getMessage());
                }
            }
            /*
             *  if expression then statement if expression then statement else
             *  statement
                                                                                                             */else if(lex.have("if")) {
                try {
                    Node  e         = expression();
                    // System.out.println(e);
                    lex.mustbe("then");
                    Node  thenpart  = new Statement(statement());
                    // System.out.println(thenpart);
                    Node  elsepart  = new Statement(null);
                    if(lex.have("else")) {
                        // System.out.println("about to parse elsepart ");
                        elsepart = statement();
                    }
                    // System.out.println("calling If constructor ");
                    res = new If(forcederef(e), thenpart, elsepart);
                    // System.out.println("res="+res);
                }
                catch(Exception e2) {
                    error(" if statement " + e2);
                }
            }
            /*
             *  write
                                                                                                                                                             */else if(have("write")) {
                initwriteIndices();
                mustbe('(');
                res = fwritelist(expression(0, writeindices.length,
                                            writeindices), false);
                mustbe(')');
                freewriteIndices();
            }
            /*
             *  case expression of case-list end
                                                                                                                                                                                                             */else if(lex.have("case")) {
                Node         selector    = forcederef(expression());
                Type         t           = getType(selector);
                if(!(t instanceof ScalarRange)) {
                    error(" selector must be a non-real scalar range not a "
                          + t);
                }
                ScalarRange  ft          = (ScalarRange) t;
                mustbe("of");
                int[]        bounds      = {-1, 1};
                Dictionary   swdic       = new Hashtable();
                Label        endlab      = new Label();
                Label        elselab     = new Label();
                Label        tablelab    = new Label();
                Node         list        = caselist(swdic, endlab, (long) ft.bottom(), bounds);
                long         switchbase  = bounds[0];
                int          range       = (bounds[1] - bounds[0]) + 1;
                if(processor.verbose) {
                    System.out.println("range=" + range + "," + bounds[0] + " "
                                       + bounds[1] + "\n" + list);
                }
                Label[]      switchlist  = new Label[range];
                try {
                    Node       temp       = tempvar(INTEGER);
                    // make sure the selector is evaluated only once
                    Node       grab       = new Assign(temp, selector);
                    selector = forcederef(temp);
                    // fill in the label table
                    for(int i = 0; i < range; i++) {
                        switchlist[i] = elselab;
                    }
                    for(Enumeration e = swdic.keys(); e.hasMoreElements();) {
                        Int    I  = (Int) e.nextElement();
                        Label  L  = (Label) swdic.get(I);
                        switchlist[I.intValue() - bounds[0]] = L;
                    }
                    Node       switchtab  = plant(switchlist, 0);
                    Statement  decl       = new Statement(tablelab,
                                                          (Statement) switchtab);
                    // dataDecls = new Statement(decl, dataDecls);
                    // construct a computed goto using the label table
                    Node       dojump     = new Goto(new Memref(dyad(tablelab, dyad(
                                                         new Int(Format.lengthInBits(addrtype) / 8), dyad(
                                                                 new TypeTag(selector, INTEGER), new Int(
                                                                         (int) bounds[0]), "-"), "*"), "+"),
                                                     (addrtype)));
                    // guard this with a test that the selector is in bounds
                    dojump = new If(dyad(selector, new Int(bounds[0]), "<"),
                                    new Goto(elselab),
                                    new If(dyad(selector, new Int(bounds[1]), ">"),
                                           new Goto(elselab), dojump));
                    if(processor.verbose) {
                        System.out.println("dojump=" + dojump);
                    }
                    Node       elsepart   = new Statement(elselab, null);
                    if(have("else") || have("otherwise")) {
                        elsepart = new Statement(elsepart, new Statement(
                                                     statement()));
                    }
                    while( have(";")) {}
                    mustbe("end");
                    res = new Statement(grab, new Statement(
                                            new Statement(dojump, decl),
                                            new Statement(list, new Statement(elsepart, new Statement(
                                                    endlab, null))))
                                        // )
                                       );
                }
                catch(Exception tempe) {
                    error("Processing case statement " + tempe);
                }
            }
            /*
             *  while expression do statement
                                                                                                                                                                                                                                                             */else if(lex.have("while")) {
                Label      start        = new Label();
                Label      again        = new Label();
                Statement  beforewhile  = prestatement;
                prestatement = null;
                Node       e            = forcederef(expression());
                Statement  pretest      = prestatement;
                prestatement = null;
                mustbe("do");
                Node       s            = statement();
                res = new Statement(new Goto(again), new Statement(start,
                                    new Statement(s, new Statement(again, new Statement(
                                                      pretest, new Statement(new If(e,
                                                              new Goto(start)), null))))));
                prestatement = beforewhile;
            }
            /*
             *  repeat statement-list until expression
                                                                                                                                                                                                                                                                                                             */else if(lex.have("repeat")) {
                Label      start       = new Label();
                Label      finish      = new Label();
                Node       s           = statement_list();
                mustbe("until");
                Statement  beforetest  = prestatement;
                prestatement = null;
                Node       e           = forcederef(expression());
                res = new Statement(start, new Statement(new Statement(s,
                                    prestatement), new Statement(
                                        new If(e, new Goto(finish)), new Statement(new Goto(
                                                    start), new Statement(finish, null)))));
                prestatement = beforetest;
            }
            else if(lex.have("for")) {
                try {
                    String     endname      = "$end" + startcount+lex.lineno();
                    declareVar(endname, INTEGER);
                    startcount++;
                    Node       endit        = (Node) symbolTable.checkedGet(endname);
                    Node       i;
                    i = variable();
                    try {
                        declareLoopIterator(i);
                    }
                    catch(Exception ex1) {
                        error("declaring loop iterator ");
                    }
                    if(have("in")) {
                        // System.out.println("got in want expression");
                        Node     right      = forceeval(expression());
                        Type     ft         = getType(forcederef(right));
                        if(!(ft instanceof SetType)) {
                            error("set needed here");
                        }
                        SetType  stp        = (SetType) ft;
                        if(stp.bitmapImplementation) {
                            Node         setis  = isinset(i, right, false);
                            mustbe("do");
                            Node         doit   = statement();
                            Type         t      = getType(forcederef(i));
                            if(!(t instanceof ScalarRange)) {
                                error("index not a subrange or scalar");
                            }
                            Node         der    = forcederef(right);
                            SetType      st     = (SetType) getType(der);
                            Node         temp   = tempvar(INTEGER);
                            ScalarRange  rr     = (ScalarRange) st.members;
                            return new For(temp, new Int(rr.bottom(), "int32"),
                                           new Int(rr.top(), "int32"), new Int(1,
                                                   "int32"), new Statement(
                                               new Assign(i, new TypeTag(
                                                              forcederef(temp), t)),
                                               new Statement(new If(setis, doit,
                                                                    null))));
                        }
                        // generic set
                        // System.out.println("generic for in ");
                        Node[]   p1         = {right};
                        Node[]   p2         = {i, right};
                        // System.out.println("call set first");
                        Node     getfirst   = procCall(stp.symbolTable,
                                                       "genericsetfirst", p2);
                        // System.out.println("call set last");
                        Node     test       = procCall(stp.symbolTable,
                                                       "genericsetislast", p2);
                        // System.out.println("call set next ");
                        Node     increment  = procCall(stp.symbolTable,
                                                       "genericsetnext", p2);
                        mustbe("do");
                        Label    start      = new Label();
                        Node     doit       = statement();
                        Node     ok         = forcederef(processor.functionRetReg(BOOLEAN.type));
                        ok = dyad(ok, new TypeTag(new Int(0), BOOLEAN), "<>");
                        return new Statement(
                                   procCall(stp.symbolTable, "genericsetnotempty",
                                            p1),
                                   new Statement(
                                       new If(
                                           ok,
                                           new Statement(
                                               new Statement(getfirst),
                                               new Statement(
                                                   new Statement(
                                                       start),
                                                   new Statement(
                                                       doit,
                                                       new Statement(
                                                           test,
                                                           new Statement(
                                                               new If(
                                                                       ok,
                                                                       new Statement(
                                                                               null),
                                                                       new Statement(
                                                                               increment,
                                                                               new Statement(
                                                                                       new Goto(
                                                                                               start))))))))))));
                    }
                    mustbe(lex.TT_ASSIGN);
                    Node       start        = expression();
                    Node       step;
                    Type       it           = getType(forcederef(i));
                    if(!start.knownAtCompileTime()) {
                        Node  news  = tempvar(INTEGER);
                        start = forcederef(start, INTEGER);
                        /*
                         *  recordPreloopAction(i,
                         */
                        postPrestatement(new Statement(
                                             new Assign(news, start)));
                        start = new TypeTag(forcederef(news), it);
                    }
                    else {
                        start = new TypeTag(start, it);
                    }
                    boolean    up           = true;
                    if(lex.have("to")) {
                        step = new ilcg.tree.Int(1, it.type);
                    }
                    else {
                        lex.mustbe("downto");
                        up = false;
                        step = new ilcg.tree.Int(-1, it.type);
                    }
                    Node       finish       = expression();
                    lex.mustbe("do");
                    Node       finit        = null;
                    if(!finish.knownAtCompileTime()) {
                        finit = (new Assign(endit, forcederef(finish, INTEGER)));
                        finish = new TypeTag(forcederef(endit), it);
                        recordPreloopAction(i, new Statement(finit));
                    }
                    else {
                        finish = new TypeTag(finish, it);
                    }
                    Vector[]   boundset     = {new Vector(), new Vector()};
                    iteratorset.put(i, boundset);
                    // declareloopiterator(i);
                    boolean    oldcontains  = containscalls;
                    containscalls = false;
                    int        oldcalls     = callcount;
                    Label      exitl        = new Label();
                    Label      topl         = new Label();
                    Statement  actions      = new Statement(statement());
                    // collect all bounds tests and apply them before loop
                    // starts
                    if(usePascalForDefinition) {
                        res = new Statement(
                            new If(
                                (up ? dyad(start, finish, "<=") : dyad(
                                     start, finish, ">=")),
                                new Statement(
                                    new Assign(i, start),
                                    new Statement(
                                        topl,
                                        new Statement(
                                            actions,
                                            new Statement(
                                                new If(
                                                    dyad(
                                                        (i),
                                                        finish,
                                                        "="),
                                                    new Goto(
                                                        exitl)),
                                                new Statement(
                                                    it == BOOLEAN ? new Assign(
                                                        i,
                                                        dyad(
                                                            i,
                                                            TRUE,
                                                            "XOR"))
                                                    : new Assign(
                                                        i,
                                                        new TypeTag(
                                                            dyad(
                                                                new TypeTag(
                                                                        forcederef(i),
                                                                        INTEGER),
                                                                new TypeTag(
                                                                        step,
                                                                        INTEGER),
                                                                "+"),
                                                            it)),
                                                    new Statement(
                                                        new Goto(
                                                            topl),
                                                        new Statement(
                                                            exitl)))))))));
                    }
                    else {
                        For rfor =new For(i, start, finish, step, actions);
                        res=rfor;
                        /*System.out.println(" "+lex.lineno()+
                        rfor.callfree()
                         +rfor.innermost()
                         +(rfor.action instanceof Assign)
                         +!rfor.containsloopdependencies());*/
                        if(rfor.callfree()
                                &&rfor.innermost()
                                &&(rfor.action instanceof Assign)
                                &&!rfor.containsloopdependencies())
                            try {
                                unparalleled =false;
                                // we can parallelise this
                                Node       lwb        = start;
                                Node       upb        = finish;
                                Node       oldupb     = upb;
                                Assign     a          = (Assign)rfor. action;
                                Type       rest       = getType(a.src);
                                int        parfactor  = (unparalleled ? 1 : processor.getParallelism(rest.type));
                                Node       newstep    = new Int(parfactor, intrep);
                                Node       one        = new Int(1, intrep);
                                Node       range      = dyad(dyad(upb, lwb, "-"),one,"+");
                                Node  pariterations  = dyad(range, newstep,Node.divide).eval();
                                upb = dyad(dyad(dyad(pariterations, newstep, "*"),one, "-"), lwb, "+");
                                if(parfactor>1) {
                                    Node parassign = parallelise(new Assign(processor.decast(a.dest), processor.decast(a.src)), parfactor,rest,i);
                                    Node pfor      = new For(i, lwb,  upb, newstep, parassign);
                                    Node sfor      = new For(i,dyad(upb, one, "+"),oldupb,one,a);
                                    if(processor.generateable(parassign)) {
                                        res= new Statement(pfor,new Statement(sfor));
                                        parlines.set(lex.lineno());
                                    }
                                    else {
                                        //  System.out.println("can not generate parallel code for "+lex.lineno());
                                    }
                                }
                                else {
                                    //System.out.println("parfactor ="+parfactor);
                                }
                            }
                            catch(Exception ee) {
                                //System.out.println(" failed to parallelise "+ee);
                                // ignore and return the scalar code
                            }
                    }
                    res = new Statement(getPreloopAction(i), new Statement(
                                            checkArrayBoundsNotViolatedInLoopForIndex(i, start,
                                                    finish), new Statement(res)));
                    if(oldcalls == callcount) {
                        ((Statement) res).setLocal((Variable) i);
                    }
                    containscalls = containscalls | oldcontains;
                    // after parsing the statement all of the bounds tests are
                    // in the iteratorset
                    iteratorset.remove(i);
                    freeIterator(i);
                }
                catch(Exception u1) {
                    error(" in for loop " + u1);
                }
            }
            /*
             *  goto label the complexity here arises from the possibility in
             *  pascal to jump out of a procedure to one of the enclosing scopes.
             *  If this occurs the frame pointer must be set in such a way as to
             *  be valid in the destination scope
             */
            else if(have("goto")) {
                mustbe(lex.TT_NUMBER);
                Label  l1         = getLabglobal(lex.theNumber);
                int    lablev     = ((Int) symbolTable.get("levelof" + l1)).intValue();
                // check
                // lexical
                // level
                // of
                // label
                int    alignment  = ADDRESS.alignment(processor);
                int    offset     = lablev * alignment;
                Node   index      = dyad(
                                        // find the index of the saved frame pointer in the
                                        // display
                                        new TypeTag(new Deref(processor.getFP()), ADDRESS),
                                        new Int(offset, Format.addressType), "-");
                index = new Deref(new Memref(index, Variable.makeref(addrtype)));
                // dereference
                // it
                try {
                    Node  rescope  = new Assign(processor.getFP(), index);
                    // assign
                    // it
                    // to
                    // the
                    // current
                    // frame
                    // pointer
                    res = new Statement(rescope, new Statement(new Goto(l1)));
                    // goto
                    // the
                    // destination
                    if(lexicalLevel == lablev) {
                        res = new Goto(l1);
                    }
                    // no need to adjust frame pointer
                    // in this case
                }
                catch(Exception e) {
                    error("on goto " + e);
                }
            }
            /*
             *  with record-variable-list do statement
                                                                                                                                                                                                                                                                                                                                                                                                                                                             */else if(have("with")) {
                // System.out.println(" have with ");
                int   oldnesting  = recordNestingLevel;
                recordNestingLevel = 0;
                record_variable_list();
                mustbe("do");
                Node  temp        = statement();
                for(int i = 0; i < recordNestingLevel; i++) {
                    symbolTable.leaveScope();
                    withTable.leaveScope();
                }
                recordNestingLevel = oldnesting;
                res = temp;
            }
            /*
             *  label : statement
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             */else if(have(lex.TT_NUMBER)) {
                res = getLab(lex.theNumber);
                mustbe(':');
                return new Statement(res, new Statement(statement(), null));
            }
            /*
             *  empty
             */
            if(prestatement != null) {
                res = new Statement(prestatement, new Statement(res, null));
            }
            prestatement = oldprestatement;
            return res;
        }
        catch(TypeIdError ee) {
            error(" this is a type name " + ee);
        }
        return new Statement(null);
    }


    /**
     *  Description of the Method
     *
     *@param  id               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node docompiletimeproc(String id) throws SyntaxError {
        mustbe(lex.TT_IDENTIFIER);
        try {
            if(id.equals("read")) {
                return mkCodeForRead();
            }
            if(id.equals("val")) {
                return mkCodeForVal();
            }
            if(id.equals("writeln")) {
                return mkCodeForWriteln();
            }
            if(id.equals("write")) {
                return mkCodeForWrite();
            }
            if(id.equals("readln")) {
                return mkCodeForReadln();
            }
            if(id.equals("new")) {
                return mkCodeForNew();
            }
            if(id.equals("alias")) {
                return mkCodeForAlias();
            }
            if(id.equals("dispose")) {
                return mkCodeForDispose();
            }
            if(id.equals("setlength")) {
                return mkCodeForSetLength();
            }
            if(id.equals("inc")) {
                return mkCodeForInc();
            }
            if(id.equals("dec")) {
                return mkCodeForDec();
            }
            error(" unknown procedure " + id);
        }
        catch(Exception e2) {
            error("Processing built in procedure " + id + e2);
        }
        return (null);
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node mkCodeForAbs() throws SyntaxError {
        try {
            mustbe('(');
            Node  oexp  = forcederef(expression());
            mustbe(')');
            Type  rt    = getType(oexp);
            // String absfn = (Format.isInteger(oexp.returnType()) ? "absi" :
            // "absr");
            Node  m     = monad(oexp, "ABS");
            return (m);
        }
        catch(Exception e) {
            error(e.toString());
            return null;
        }
    }


    /*
     *  writeln
     */
    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node mkCodeForWriteln() throws SyntaxError, TypeIdError {
        Node  res  = null;
        if(have('(')) {
            initwriteIndices();
            res = fwritelist(expression(0, writeindices.length, writeindices),
                             true);
            mustbe(')');
            freewriteIndices();
        }
        else {
            res = callWriteln(null);
        }
        return res;
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node mkCodeForWrite() throws SyntaxError, TypeIdError {
        Node  res  = null;
        if(have('(')) {
            initwriteIndices();
            res = fwritelist(expression(0, writeindices.length, writeindices),
                             false);
            mustbe(')');
            freewriteIndices();
        }
        else {
            // res = callWriteln(null);
        }
        return res;
    }


    /*
     *  read
     */
    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node mkCodeForRead() throws SyntaxError, TypeIdError {
        initwriteIndices();
        mustbe('(');
        Node  res  = freadlist(expression(0, writeindices.length, writeindices),
                               false);
        mustbe(')');
        freewriteIndices();
        return res;
    }


    /*
     *  readln
     */
    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node mkCodeForReadln() throws SyntaxError, TypeIdError {
        Node  res  = null;
        if(have('(')) {
            initwriteIndices();
            res = freadlist(expression(0, writeindices.length, writeindices),
                            true);
            mustbe(')');
            freewriteIndices();
        }
        else {
            res = callReadln(null);
        }
        return res;
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  TypeIdError  Description of the Exception
     */
    Node mkCodeForDispose() throws SyntaxError, TypeIdError {
        mustbe('(');
        Node    v       = expression();
        Type    t       = getType((v));
        // System.out.println("new applied to arg of type "+t);
        if((t instanceof Ref) && !(t instanceof Pointer)) {
            t = ((Ref) t).pointsTo;
            v = forcederef(v);
        }
        // System.out.println(t);
        if(!(t instanceof Pointer)) {
            error("argument to dispose must be a pointer type");
        }
        t = ((Pointer) t).pointsTo;
        int     size    = (int) t.sizeOf(processor);
        Node[]  params  = {new TypeTag(v, POINTER), new Int(size)};
        Node    res     = procCall("freemem", params);
        while(have(',')) {
            Node  n  = expression();
        }
        mustbe(')');
        return res;
    }


    /**
     *  Description of the Method
     *
     *@return                          Description of the Return Value
     *@exception  SyntaxError          Description of the Exception
     *@exception  TypeIdError          Description of the Exception
     *@exception  AssignmentException  Description of the Exception
     */
    Node mkCodeForDec() throws SyntaxError, TypeIdError, AssignmentException {
        mustbe('(');
        Node  v  = variable();
        Type  t  = getType(v);
        if(!(t instanceof Ref)) {
            error("argument to dec must be a variable ");
        }
        t = ((Ref) t).pointsTo;
        if(!(t instanceof IntegralType)) {
            error("argument to dec must be an integer type");
        }
        mustbe(')');
        return new Assign(v, dyad(new Deref(v), new Int(1), "-"));
    }


    /**
     *  Description of the Method
     *
     *@return                          Description of the Return Value
     *@exception  SyntaxError          Description of the Exception
     *@exception  TypeIdError          Description of the Exception
     *@exception  AssignmentException  Description of the Exception
     */
    Node mkCodeForInc() throws SyntaxError, TypeIdError, AssignmentException {
        mustbe('(');
        Node  v  = variable();
        Type  t  = getType(v);
        if(!(t instanceof Ref)) {
            error("argument to inc must be a variable ");
        }
        t = ((Ref) t).pointsTo;
        if(!(t instanceof IntegralType)) {
            error("argument to inc must be an integer type");
        }
        mustbe(')');
        return new Assign(v, dyad(new Deref(v), new Int(1), "+"));
    }
    Node mkCodeForVal()throws SyntaxError, TypeIdError {
        mustbe('(');
        Node s=expression();
        Type t = getType(s);
        if(!(t instanceof StringType)) {
            if(t instanceof Ref) {
                if(!(((Ref)t).pointsTo instanceof StringType)) error("first parameter of val must be a string, found "+t);
            }
            else error("first parameter of val must be a string, found "+t);
        }
        mustbe(',');
        Node res=variable();
        t  = getType(res);
        if(!(t instanceof Ref)) {
            error("2nd argument to val must be a variable ");
        }
        t = ((Ref) t).pointsTo;
        if(!(t instanceof IntegralType)&& !(t instanceof RealType)) {
            error("2nd argument to inc must be of an integer or a real type");
        }
        mustbe(',');
        Node code=variable();
        Type t2  = getType(code);
        if(!(t2 instanceof Ref)) {
            error("3nd argument to val must be a variable ");
        }
        t2 = ((Ref) t2).pointsTo;
        if(!(t2 instanceof IntegralType)) {
            error("3nd argument to inc must be of an integer type not "+t2);
        }
        mustbe(')');
        String ret=t.returnType();
        String suffix="";
        if(ret.equals("int32"))suffix="i";
        else if(ret.equals("ieee32"))suffix="r";
        else if(ret.equals("ieee64"))suffix="d";
        else error("precision of argument 2 must be 32 bits not "+ret);
        Node[] p= { (s),res,code};
        return procCall("pval"+suffix, p);
    }

    /**
     *  parse and generate code for new statements
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node mkCodeForNew() throws SyntaxError {
        Node  res  = null;
        try {
            mustbe('(');
            Node     v        = variable();
            Type     t        = getType(v);
            // System.out.println("new applied to arg of type "+t);
            if(!(t instanceof Ref)) {
                error("argument to new must be a variable ");
            }
            t = ((Ref) t).pointsTo;
            // System.out.println(t);
            if(!((t instanceof Pointer))) {
                error("argument to new must be a pointer  ");
            }
            boolean isclass=false;
            if((((Pointer)t).pointsTo instanceof ClassType)) {
                isclass=true;
            }
            {
                t = ((Pointer) t).pointsTo;
            }
            boolean  dynamic  = false;
            // System.out.println(t);
            if(t instanceof ArrayType) {
                dynamic = ((ArrayType) t).isDynamic;
                // System.out.println(" is an array type but is it dynamic?"+dynamic);
            }
            if(!dynamic) {
                while(have(',')) {
                    Node  n  = expression();
                }
                int     size    = (int) t.sizeOf(processor);
                Node[]  params  = {v, new Int(size, intrep)};
                if(isclass) {
                    size= (int)((ClassType)t).size;
                    params[0]=
                        new TypeTag(new Memref(getAddr(v),processor.getAddressType()),new Ref(new Pointer(ANY,processor)));
                }
                try {
                    //	System.out.println("params[0]="+params[0]);
                    res = procCall("getmem", params);
                    if(isclass) {
                        res=new Statement(res,
                                          new Statement(new Assign(new Memref(new Deref(v),ADDRESS.returnType()), ((ClassType)t).vmtlab)));
                    }
                }
                catch(Exception err1) {
                    error(" in object allocation  " + err1);
                }
            }
            else {
                ArrayType  aT         = (ArrayType) t;
                int        size       = aT.headersize(processor);
                // System.out.println("headersize ="+size);
                Node[]     params     = {v, new Int(size, intrep)};
                res = procCall("getmem", params);
                Node       vAsInt     = new TypeTag(forcederef(v), ADDRESS);
                int        offset     = 0;
                Node       diminit    = res;
                Node[]     paramvec   = new Node[aT.getNumParams()];
                for(int i = 0; i < aT.getNumParams(); i++) {
                    mustbe(',');
                    paramvec[i] = forcederef(expression());
                }
                for(int i = 0; i < aT.rank(); i++) {
                    try {
                        offset += addrlength;
                        Node  low;
                        if(aT.isBoundStatic(i, 0)) {
                            low = aT.getLwb(i);
                        }
                        else {
                            low = paramvec[aT.getBoundPosition(i, 0)];
                        }
                        Node  Ass1  = new Assign(new Memref(dyad(vAsInt, new Int(
                                                                offset), "+"), addrtype), new Cast(addrtype, low));
                        offset += addrlength;
                        Node  high;
                        if(aT.isBoundStatic(i, 1)) {
                            high = aT.getUpb(i);
                        }
                        else {
                            int  pos  = aT.getBoundPosition(i, 1);
                            high = paramvec[pos];
                        }
                        Node  Ass2  = new Assign(new Memref(dyad(vAsInt, new Int(
                                                                offset), "+"), addrtype), new Cast(addrtype, high));
                        offset += addrlength;
                        diminit = new Statement(diminit, new Statement(Ass1,
                                                new Statement(Ass2)));
                    }
                    catch(AssignmentException ex) {
                        error(" while initialising array header " + ex);
                    }
                }
                Node[]     newparams  = {v, new Int(aT.rank()),
                                         new Int(aT.elemsize())
                                        };
                res = new Statement(diminit, new Statement(procCall("initvec",
                                    newparams)));
            }
            mustbe(')');
        }
        catch(Exception err) {
            error("in parsing new " + err);
        }
        return res;
    }

    Node mkCodeForAlias() throws SyntaxError {
        Node  res  = null;
        try {
            mustbe('(');
            Node     v        = variable();
            Type     t        = getType(v);
            // System.out.println("new applied to arg of type "+t);
            if(!(t instanceof Ref)) {
                error("argument to alias must be a variable ");
            }
            t = ((Ref) t).pointsTo;
            // System.out.println(t);
            if(!(t instanceof Pointer)) {
                error("first argument to alias must be a pointer type");
            }
            t = ((Pointer) t).pointsTo;
            boolean  dynamic  = false;
            // System.out.println(t);
            if(t instanceof ArrayType) {
                dynamic = ((ArrayType) t).isDynamic;
                // System.out.println(" is an array type but is it dynamic?"+dynamic);
            }
            else error("alias must take a pointer to an array as first argument");
            if(!dynamic) {
                error("alias must take a pointer to a dynamic array as its first argument");
            }
            else {
                ArrayType  aT         = (ArrayType) t;
                int        size       = aT.headersize(processor);
                // System.out.println("headersize ="+size);
                mustbe(',');
                Node second =variable();
                Type     t2        = getType(second);
                Node []nparams     = {v, new Int(size, intrep),second};
                if(!(t2 instanceof Ref)) {
                    error("2nd argument to alias must be a variable ");
                }
                t2 = ((Ref) t2).pointsTo;
                dynamic  = false;
                // System.out.println(t);
                if(!t.equals(t2)) {
                    error("type of 2nd parameter incompatible with first parameter\n"+t+"\n<> "+t2);
                }
                res =  new Statement(procCall("calias",nparams));
            }
            mustbe(')');
        }
        catch(Exception err) {
            error("in parsing alias " + err);
        }
        return res;
    }

    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node mkCodeForSetLength() throws SyntaxError {
        Node  res  = null;
        try {
            if(!AsmLink.gcenable) {
                warn(" Setlength will create an array on the heap and should only be used if garbage collection\n"
                     + " has been enabled by setting the -BOEHM flag on the compiler comand line.");
            }
            mustbe('(');
            Node       v        = variable();
            Type       t        = getType(v);
            if(!(t instanceof Ref)) {
                error("argument to SetLength must be a variable ");
            }
            t = ((Ref) t).pointsTo;
            if(!(t instanceof ArrayType)) {
                error("argument to SetLength must be an array type");
            }
            ArrayType  aT       = ((ArrayType) t);
            boolean    dynamic  = aT.isDynamic;
            if(!dynamic) {
                error("only values of dynamic array types can have their length adjusted");
            }
            else {
                int     size       = aT.headersize(processor);
                Node    vAsInt     = new TypeTag(getAddr(v), ADDRESS);
                int     offset     = 0;
                Node    diminit    = res;
                Node[]  paramvec   = new Node[aT.rank()];
                for(int i = 0; i < aT.rank(); i++) {
                    mustbe(',');
                    paramvec[i] = forcederef(expression());
                }
                for(int i = 0; i < aT.rank(); i++) {
                    try {
                        offset += addrlength;
                        Node  low   = new Int(0,addrtype);
                        Node  Ass1  = new Assign(new Memref(dyad(vAsInt, new Int(
                                                                offset), "+"), addrtype), low);
                        offset += addrlength;
                        Node  high  = dyad(paramvec[i], new Int(-1,addrtype), "+");
                        Node  Ass2  = new Assign(new Memref(dyad(vAsInt, new Int(
                                                                offset), "+"), addrtype), high);
                        offset += addrlength;
                        diminit = new Statement(diminit, new Statement(Ass1,
                                                new Statement(Ass2)));
                    }
                    catch(AssignmentException ex) {
                        ex.printStackTrace();
                        error(" while initialising array header " + ex);
                    }
                }
                Node[]  newparams  = {v, new Int(aT.rank()),
                                      new Int(aT.elemsize())
                                     };
                res = new Statement(diminit, new Statement(procCall(
                                        "delphiinitvec", newparams)));
            }
            mustbe(')');
        }
        catch(Exception err) {
            error("in parsing setlength(...) " + err);
        }
        return res;
    }


    /**
     *  Description of the Method
     *
     *@param  id               Description of the Parameter
     *@param  params           Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node procCall(String id, Node[] params) throws SyntaxError {
        return procCall(symbolTable, id, params);
    }


    /**
     *  generate code for procedure call
     *
     *@param  d                where to find the procedure
     *@param  id               identifier
     *@param  params           list of params
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node procCall(Dictionary d, String id, Node[] params) throws SyntaxError {
        Object  value  = getid(d, id);
        unparalleled = true;
        // we can not parallelise procedure calls
        containscalls = true;
        // we need to know this for register caching
        // purposes
        // dont cache any iteration variables if there is a procedure call in a
        // loop
        callcount++;
        if(value != null) {
            try {
                if(value instanceof ProcType) {
                    ProcType   proc          = (ProcType) value;
                    Vector     actualParams  = new Vector();
                    for(int i = 0; i < params.length; i++) {
                        // System.out.println("Check parameter "+params[i]+":"+getType(params[i])+" to "+proc.params[i]+":"+getType(proc.params[i]));
                        actualParams.addElement(forceParamCompatibility(
                                                    params[i], proc.params[i]));
                    }
                    ProcType   p             = (ProcType) value;
                    Cartesian  Params        = new Cartesian(actualParams);
                    try {
                        Function  keepf  = new Function(p.theProc);
                        if(p.isPure()) {
                            purefunctions.add(keepf);
                        }
                        return new Monad(keepf, Params);
                    }
                    catch(Exception en) {
                        error("internal compiler error \nin procCall\n"
                              + en.getMessage());
                    }
                }
            }
            catch(Exception err2) {
                if(processor.verbose)err2.printStackTrace();
                error("in procedure call " + err2);
            }
        }
        error(id + " undeclared");
        return null;
    }


    /**
     *  This checks type compatibility on the expression doing any legal coercions
     *  for parameter passing
     *
     *@param  exp              Description of Parameter
     *@param  t                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */

    Node forceTypeCompatibility(Node exp, Type t) throws SyntaxError {
        String  trep    = t.codeGenRepresentation(processor);
        String  exprep  = exp.returnType();
        Type    expt    = getType(exp);
        if(processor.verbose) {
            System.out.println("force type compatibility of "+exp+":"+expt+" to "+t);
        }
        t = resolvepointertypes(t);
        expt = resolvepointertypes(expt);
        if(!t.equals(expt)) {
            // System.out.println("types unequal");
            if(exprep.equals(trep)) {
                if(expt instanceof ArrayType) {
                    error("array types not equal to non array types");
                }
                if(t instanceof ArrayType) {
                    if(!(expt instanceof ArrayType)) {
                        error(" Array and other types incompatible");
                    }
                    // System.out.println(" passing "+t+"\nas equal to "+expt);
                }
            }
            else {
                // if destination is a set type and source a larger set type
                // with the same lower bound then it is legal
                if(t instanceof SetType && expt instanceof SetType
                        && ((SetType) t).bitmapImplementation
                        && ((SetType) expt).bitmapImplementation) {
                    if(((SetType) t).bottom() == ((SetType) expt).bottom()
                            && ((SetType) t).top() <= ((SetType) expt).top()) {
                        return new TypeTag(exp, t);
                    }
                }
                // System.out.println("try coercion strategies");
                if(t.equals(POINTER)) {
                    if(expt instanceof Pointer) {
                        return exp;
                    }
                    if(expt instanceof SetType) {
                        if(!((SetType) expt).bitmapImplementation) {
                            return exp;
                        }
                    }
                }
                if(expt.equals(POINTER)) {
                    if(t instanceof Pointer) {
                        return exp;
                    }
                }
                if(t instanceof Pointer && expt instanceof Pointer) {
                    Pointer pt = (Pointer)t;
                    Pointer pexpt =(Pointer)expt;
                    if(pt.pointsTo instanceof ClassType && pexpt.pointsTo instanceof ClassType) {
                        ClassType ct = (ClassType) pt.pointsTo;
                        ClassType cexpt = (ClassType) pexpt.pointsTo;
                        if(cexpt.derivedfrom(ct))return exp;
                    }
                }
                if(t.equals(PCHAR)) {
                    if(expt instanceof StringType) {
                        return getAddr(exp);
                    }
                }
                if(expt instanceof StringType && t instanceof StringType) {
                    return exp;
                }
                if(t instanceof StringType && expt.equals(CHAR)) {
                    return tostring(exp);
                }
                if(expt.equals(POINTER)) {
                    if(t instanceof Pointer) {
                        return exp;
                    }
                }

                if(expt instanceof Ref && ((Ref) expt).pointsTo.equals(t)
                        && !(expt instanceof Pointer)) {
                    return forcederef(exp, t);
                }
                if(t instanceof Ref && exprep.startsWith("ref")
                        && !(t instanceof Pointer)) {
                    return getAddr(exp);
                }
                if(exprep.startsWith("ref") && !(expt instanceof Pointer)) {
                    return forceTypeCompatibility(forcederef(exp), t);
                }
                if((Format.isInteger(trep)) && Format.isInteger(exprep)) {
                    return new TypeTag(exp, t);
                }
                if(t.equals(REAL) && isPixel(expt)) {
                    return pixel2real(exp);
                }
                if(t.equals(REAL) && Format.isInteger(exprep)) {
                    return floatit(exp);
                }
                if(t.equals(DOUBLE) && expt.equals(REAL)) {
                    return new TypeTag(exp, DOUBLE);
                }
                if(isPixel(t)) {
                    // System.out.println("forceTypeCompatibility to pixel "+exp);
                    if(expt.equals(REAL) || expt.equals(DOUBLE)) {
                        return real2pixel(exp);
                    }
                }
                try {
                    // System.out.println("try user cast");

                    return cast2(exp, t);
                }
                catch(Exception ex) {
                    if (expt.toString().equals(t.toString()) )return exp;
                    error("type mismatch: " + expt + " incompatible with " + t
                          + ex);
                }
            }
        }
        return exp;
    }


    /**
     *  this is like force type compatibility except that it returns the address of
     *  things for which the formal param is a ref type <p>
     *
     *  For an untyped var param it returns the address of the var in all cases <p>
     *
     *  If any argument is a string type then tag the value as having the type of
     *  the formal param to ensure that string length limist are observed. <p>
     *
     *  Otherwise if the types are unequal force compatability on them using
     *  forceTypeCompatibility
     *
     *@param  exp              the expression to be checked
     *@param  formalParam      type of the formal paramere
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  can be thrown if no address exists
     */

    Node forceParamCompatibility(Node exp, Type formalParam) throws SyntaxError {
        String   trep      = formalParam.codeGenRepresentation(processor);
        Type     actual    = getType(exp);
        String   exprep    = exp.returnType();
        boolean  varparam  = formalParam instanceof Ref
                             && !(formalParam instanceof Pointer);
        // System.out.println("line "+lex.lineno()+"force param compatibility "+exp+":"+actual+",  "+formalParam+"\nformal param representation"+trep);
        // handle the special case of untyped var params
        if(varparam) {
            // System.out.println("is var param");
            if(isrefany(formalParam) || isprocparam(formalParam)) {
                return getAddr(exp);
            }
            else if(exprep.startsWith("ref")) {
                actual = resolvepointertypes(actual);
                formalParam = resolvepointertypes(formalParam);
                Type  df   = ((Ref) formalParam).pointsTo;
                Type  da   = ((Ref) actual).pointsTo;
                if(!actual.equals(formalParam)) {
                    boolean  specialcase  = false;
                    // System.out.println("is it special, does "+df+"="+da);
                    if((da instanceof Pointer) && (df instanceof Pointer)) {
                        specialcase = df.equals(POINTER);
                    }
                    boolean  isset        = (da instanceof SetType);
                    if(isset) {
                        specialcase = df.equals(POINTER)
                                      && !((SetType) da).bitmapImplementation;
                        ;
                        // System.out.println(" is set "+da+specialcase);
                    }
                    // untyped pointers are special case
                    if(!specialcase) {
                        error("actual param of type " + actual
                              + " \nfound where formal param of type "
                              + formalParam + " wanted");
                    }
                }
                if(df instanceof RealType && da instanceof RealType) {
                    if(!((RealType) df).dimensionallyEquivalent((RealType) da)) {
                        error("dimensionally incompatible var parameter\n" + da
                              + "<>" + df);
                    }
                }
                Node  res  = getAddr(exp);
                // System.out.println(exp+"forced to address "+res);
                return res;
            }
            else {
                error("value passed in var parameter context");
            }
        }
        else if((formalParam instanceof StringType)) {
            // handle the case of string value params
            if(actual instanceof StringType) {
                return new TypeTag(exp, formalParam);
            }
            else {
                exp = tostring(forcederef(exp));
                actual = getType(exp);
                if(actual instanceof StringType) {
                    return new TypeTag(exp, formalParam);
                }
                error("string parameter required where type " + actual
                      + " found");
            }
        }
        else if(!exprep.equals(trep)) {
            // System.out.println("exprep="+exprep+" trep ="+trep);
            if(exp instanceof ProcType && formalParam instanceof ProcType) {
                Type[]  p1  = ((ProcType) exp).params;
                Type[]  p2  = ((ProcType) formalParam).params;
                if(p1.length != p2.length) {
                    error("formal and actual procedure parameters have different numbers of arguments");
                }
                for(int i = 0; i < p1.length; i++) {
                    if(!p1[i].equals(p2[i])) {
                        error("parameter types mismatch for formal and actual procedure parameters");
                    }
                }
                return exp;
            }
            Node  res  = forceTypeCompatibility(exp, formalParam);
            return res;
        }
        if(formalParam instanceof RealType && actual instanceof RealType) {
            if(!((RealType) formalParam)
                    .dimensionallyEquivalent((RealType) actual)) {
                error("dimensionally incompatible value parameter");
            }
        }
        // actual val param that matches the formal
        if(actual.equals(formalParam)) {
            return exp;
        }
        return forceTypeCompatibility(exp, formalParam);
    }


    /**
     *  Description of the Method
     *
     *@param  e                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node widenit(Node e) throws SyntaxError {
        return forceTypeCompatibility(e, INTEGER);
    }


    /**
     *  Description of the Method
     *
     *@param  e                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node widenshorts(Node e) throws SyntaxError {
        String  rt  = e.returnType();
        if(rt.equals(Node.int16) || rt.equals(Node.uint16)) {
            return widenit(e);
        }
        return e;
    }


    /**
     *  do compile time function this handles built in pseudo functions like Low
     *  and High
     *
     *@param  id               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node docompiletimefunction(String id) throws SyntaxError {
        try {
            if(id.equals("abs")) {
                return mkCodeForAbs();
            }
            if(id.equals("high")) {
                return dohilow(true);
            }
            else if(id.equals("low")) {
                return dohilow(false);
            }
            error(" unknown function " + id);
        }
        catch(Exception e2) {
            error("Processing built in function " + id + e2);
        }
        return (null);
    }


    /**
     *  Return an array variable without reducing it
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node unreducedArrayVariable() throws SyntaxError {
        Node[]  indices  = new Node[0];
        try {
            Node  e1  = variable(5, 0, indices);
            return e1;
        }
        catch(TypeIdError t) {
            error("Array type needed here " + t);
            return null;
        }
    }


    /**
     *  This function plants code for the built in functions High and Low that are
     *  inherited from Delphi
     *
     *@param  high             Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node dohilow(boolean high) throws SyntaxError {
        mustbe('(');
        Node  e1  = unreducedArrayVariable();
        mustbe(')');
        Type  t   = getType(e1);
        if(t instanceof Ref) {
            t = ((Ref) t).pointsTo;
        }
        if(!(t instanceof ArrayType)) {
            error(" array type expected not \n" + t + "\n:" + t.getClass());
        }
        try {
            e1 = getAddr(e1);
            if(high) {
                return ((ArrayType) t).getUpb(0, e1);
            }
            else {
                return ((ArrayType) t).getLwb(0, e1);
            }
        }
        catch(Exception e2) {
            error("Fault finding upper or lower bound" + e2);
            return null;
        }
    }


    /**
     *  variable: identifier variable [ subscript-list ] variable . fieldid
     *  variable ^
     *
     *@return                         Description of the Returned Value
     *@exception  SyntaxError
     *@exception  UndeclaredVariable
     *@exception  TypeIdError
     */
    Node variable() throws SyntaxError, UndeclaredVariable, TypeIdError {
        Node[]  indices  = new Node[0];
        return variable(0, 0, indices);
    }


    /**
     *  Description of the Method
     *
     *@param  rank                    Description of the Parameter
     *@param  validindices            Description of the Parameter
     *@param  indices                 Description of the Parameter
     *@return                         Description of the Return Value
     *@exception  SyntaxError         Description of the Exception
     *@exception  UndeclaredVariable  Description of the Exception
     *@exception  TypeIdError         Description of the Exception
     */
    Node variable(int rank, int validindices, Node[] indices)
    throws SyntaxError, UndeclaredVariable, TypeIdError {
        mustbe(lex.TT_IDENTIFIER);
        String  id   = lex.theId;
        Object  loc  = getid(id);
        if(processor.verbose || dolist()) {
            System.out.println("in variable " + id + " rank=" + rank
                               + " validindices=" + validindices+
                               "unparalleled ="+unparalleled);
        }
        if(loc == null) {
            System.out.println(id + " undeclared ");
            // symbolTable.list();
            throw new UndeclaredVariable(id, lex.lineno());
        }
        if(!((loc instanceof Variable) || (loc instanceof ObsConstOf))) {
            // System.out.println(loc);
            if(loc.toString().equals(compileTimeFunction)) {
                return docompiletimefunction(id);
            }
            else if(loc instanceof Type) {
                throw new TypeIdError(id, loc);
            }
            else if(loc instanceof Field) {
                Field       f     = (Field) loc;
                RecordType  rt    = f.recordType;
                Node        base  = (Node) withTable.get(rt);
                if(base == null) {
                    error("undeclared base " + base + " for field " + id);
                }
                loc = new TypeTag(new Memref(dyad(getAddr(base),
                                                  new Int(((Field) loc).offset, Format.addressType), "+"), f.fieldType.returnType()), f.fieldType);
            }
        }
        try {
            Node     V         = (Node)(loc instanceof Variable ? adjustLexLevel((ilcg.tree.Variable) loc)
                                        : loc);
            boolean  tryagain;
            do {
                tryagain = false;
                Type  t  = getType(V);
                if(t instanceof ArrayType)
                    if(arraynesting > 0) {
                        unparalleled = true;
                    }
                // do not allow parallelisation of
                // subscription of arrays by arrays
                if(processor.verbose || dolist()) {
                    if(unparalleled)System.out.println("Variable " +id+" @ "+ V +
                                                           ":" + t + "\nunparalleled=" + unparalleled +
                                                           "\n   array nesting=" + arraynesting);
                }
                if(have('^')) {
                    // Pointer deref
                    // ---------------------------------------------------------
                    try {
                        // System.out.println
                        // (" deref "+V+":"+t+" using explicit deref");
                        if(t.toString().startsWith("ref")) {
                            t = getType(forcederef(V));
                        }
                        if(!(t instanceof Pointer)) {
                            try {
                                // result may be an array in which case index it
                                V = derank(V, validindices, indices, 0);
                                t = getType(forcederef(V));
                            }
                            catch(Exception en) {
                                error("pointer required for ^\n");
                            }
                        }
                        if(!(t instanceof Pointer)) {
                            error("pointer required for ^\n");
                        }
                        Type  dereft  = ((Ref) t).pointsTo;
                        dereft = new Ref(dereft);
                        V = new Variable(0, 0, dereft, dereft.type,
                                         new TypeTag(new Deref(V), ADDRESS));
                        // System.out.println("after ^ , V="+V);
                        tryagain = true;
                    }
                    catch(Exception defefex) {
                        error(" invalid dereference operation "
                              + defefex.toString() + defefex.getClass());
                    }
                }
                else if(have('[')) {
                    // Array subscription
                    // ---------------------------------------------------------
                    try {
                        Node[][]  initialindices  = new Node[2][1];
                        int       indexcount      = 0;
                        boolean   subrange        = false;
                        do {
                            if(have(']')) {
                                // null index for whole array
                                ArrayType  at    = (ArrayType) getType(forcederef(V));
                                Node       base  = getAddr(V);
                                initialindices[0][indexcount] = at.getLwb(
                                                                    indexcount, base);
                                subrange = true;
                                initialindices[1][indexcount] = at.getUpb(
                                                                    indexcount, base);
                                indexcount++;
                                // extend the index vector
                                Node[][]   temp  = new Node[2][indexcount + 1];
                                for(int k = 0; k < indexcount; k++) {
                                    temp[0][k] = initialindices[0][k];
                                    temp[1][k] = initialindices[1][k];
                                }
                                initialindices = temp;
                            }
                            else {
                                do {
                                    // derive the indexing expression
                                    arraynesting++;
                                    Node      e          = expression(rank, validindices,
                                                                      indices);
                                    arraynesting--;
                                    initialindices[0][indexcount] = e;
                                    Node[]    flat       = flattenIndices(initialindices[0]);
                                    int       extension  = 1 + flat.length
                                                           - initialindices[0].length;
                                    initialindices[0] = flat;
                                    // extension now holds the number of indices
                                    // that
                                    // have been recorded
                                    // we have to allow for the index variable
                                    // being a tuple
                                    // of integers
                                    if(have(lex.TT_ELIPSIS)) {
                                        // subrange index
                                        initialindices[1][indexcount] = expression(
                                                                            rank, validindices, indices);
                                        initialindices[1] = flattenIndices(initialindices[1]);
                                        if(initialindices[1].length != initialindices[0].length) {
                                            error("subrange is not a paralliped");
                                        }
                                        subrange = true;
                                    }
                                    else {
                                        initialindices[1][indexcount] = e;
                                        initialindices[1] = flattenIndices(initialindices[1]);
                                    }
                                    indexcount += extension;
                                    tryagain = true;
                                    // extend the index vector
                                    Node[][]  temp       = new Node[2][indexcount + 1];
                                    for(int k = 0; k < indexcount; k++) {
                                        temp[0][k] = initialindices[0][k];
                                        temp[1][k] = initialindices[1][k];
                                    }
                                    initialindices = temp;
                                }
                                while(have(','));
                                mustbe(']');
                                // extend the index vector
                                Node[][]  temp  = new Node[2][indexcount + 1];
                                for(int k = 0; k < indexcount; k++) {
                                    temp[0][k] = initialindices[0][k];
                                    temp[1][k] = initialindices[1][k];
                                }
                                initialindices = temp;
                            }
                        }
                        while(have('['));
                        if(processor.verbose) {
                            System.out.println("evaluating indices, indexcount="
                                               + indexcount);
                        }
                        // compact the index vector
                        if(!subrange) {
                            Node[]  finalindices  = new Node[indexcount];
                            for(int i = 0; i < indexcount; i++) {
                                finalindices[i] = initialindices[0][i];
                                // System.out.println("final indices ["+i+"]="+finalindices[i]);
                            }
                            if(processor.verbose) {
                                System.out.println("before subscription of "
                                                   + V + "\nby " + finalindices);
                            }
                            V = subscript(V, finalindices);
                            // System.out.println("after subscription V="+V+"\n in method variable()");
                        }
                        else {
                            Node[][]  finalindices  = new Node[2][indexcount];
                            for(int i = 0; i < indexcount; i++) {
                                for(int j = 0; j < 2; j++) {
                                    finalindices[j][i] = initialindices[j][i];
                                }
                            }
                            V = subscript(V, finalindices);
                        }
                    }
                    catch(Exception ex1) {
                        error(" in array index computation " + ex1);
                    }
                }
                else if(have('.')) {
                    if(t instanceof Ref) {
                        t = ((Ref) t).pointsTo;
                    }
                    /*
                     *  Delphi extension to allow automatic dereferencing of
                     *  pointers
                     */
                    if(t instanceof Pointer) {
                        t = ((Pointer) t).pointsTo;
                        if (t instanceof ArrayType) {
                            // pointer to array on the heap, we may have overiding operator for matrix product
                            return dyad(V,unary_expression(0,    validindices,             indices),".");
                        }
                        V = forcederef(V);
                    }
                    if(!(t instanceof RecordType)) {
                        if(!(t instanceof ArrayType)) {
                            error(" .  requires record type not " + V + ":" + t);
                        }
                        try {
                            // dot product or schema subscription
                            if(lex.peek(lex.TT_IDENTIFIER)) {
                                V = ((ArrayType) t).getBound(lex.theString,
                                                             getAddr(V));
                                lex.mustbe(lex.TT_IDENTIFIER);
                            }
                            else {
                                error(" not identifier");
                            }
                        }
                        catch(Exception dp) {
                            // is dot
                            // product---------------------------------------------------------------------
                            // create loop
                            // System.out.println("caught "+dp);
                            Memref     nindex             = (Memref) tempvar(INTEGER);
                            declareLoopIterator(nindex);
                            Node[]     lindices           = new Node[validindices + 1];
                            Node[]     rindices           = new Node[validindices + 1];
                            Node[]     nindices           = new Node[validindices + 1];
                            for(int I = 0; I < validindices; I++) {
                                nindices[I] = indices[I];
                            }
                            nindices[validindices] = nindex;
                            if(validindices <= 1) {
                                lindices = rindices = nindices;
                            }
                            // vector dot product
                            if(validindices >= 2) {
                                lindices = new Node[2];
                                lindices[0] = nindices[0];
                                lindices[1] = nindices[2];
                                rindices = new Node[2];
                                rindices[0] = nindices[2];
                                rindices[1] = nindices[1];
                            }
                            if(((ArrayType) t).rank() == 1) {
                                lindices = new Node[1];
                                lindices[0] = nindex;
                            }
                            // System.out.println(" generated both index sets ");
                            // if(validindices>2)error("dot product not allowed to deliver rank > 2");
                            Node       oldlast            = lastarray;
                            lastarray = null;
                            int        oldmaxrank         = maxRank;
                            int        oldcalls           = callcount;
                            Statement  oldprestatement    = prestatement;
                            prestatement = null;
                            Node       larg               = unary_expression(0,
                                                            (validindices < 2 ? validindices + 1 : 2),
                                                            rindices);
                            // boolean rc=lex.rangechecks;
                            // lex.rangechecks=false;
                            Node       thelastarray       = lastarray;
                            lastarray = oldlast;
                            Node       subV               = subscript(V, lindices);
                            Node       mult               = dyad(subV, larg, "*");
                            // lex.rangechecks=rc;
                            Type       T;
                            Memref       total            =(Memref) tempvar(T = getType(mult));
                            Memref       Ttotal			  =(Memref) tempvar(T);
                            Node       sum                = dyad(Ttotal, mult, "+");
                            // System.out.println("V="+V+" t ="+t);
                            Node       lwb                = ((ArrayType) t).getLwb(
                                                                lindices.length - 1, getAddr(V));
                            Node       upb                = ((ArrayType) t).getUpb(
                                                                lindices.length - 1, getAddr(V));
                            int        currentcalls       = callcount;
                            Node       ch                 = checkArrayBoundsNotViolatedInLoopForIndex(
                                                                nindex, lwb, upb);
                            oldcalls += (currentcalls - callcount);
                            Statement  For;
                            Node       action             = assign(Ttotal, sum);
                            Node       loopprestatement   = ch;
                            Node       initialise         = assign(Ttotal,
                                                                   forcederef(identityElement(T, "+")));
                            For = new Statement(
                                new For(nindex,  lwb,  upb,new Int(1, INTEGER.type),
                                        new Statement(
                                            loopprestatement = prestatement,
                                            new Statement(action))
                                       ),
                                new Statement(new Assign(total, new Deref(Ttotal)))
                            );
                            Statement  loop               =new Statement(new Statement(initialise,For),null,Ttotal);
                            Statement  extraprestatement  = prestatement;
                            prestatement = oldprestatement;
                            //   System.out.println("for with var "+For+"\nmain body "+loop);
                            //    loop.setLocal(  nindex);
                            // System.out.println("for with var "+For+"\nmain body "+loop);
                            // now try to parallelise
                            // the vector case : vector dot product
                            int        parfactor          = processor.getParallelism(forcederef(sum)
                                                            .returnType());
                            if(validindices < 2
                                    && oldcalls == callcount
                                    && (Format.isReal(T.type) || T.type.equals("int16"))
                                    && lwb.knownAtCompileTime()
                                    && upb.knownAtCompileTime()) {
                                // Array
                                // bounds
                                // are
                                // statically
                                // known
                                System.out.println("try to parallelise");
                                int  range  = ((Number)(dyad(upb, lwb, "-")
                                                        .eval())).intValue() + 1;
                                if((range % parfactor) != 0) {
                                    parfactor = 1;
                                }
                                // System.out.println("parfactor"+parfactor);
                                if(parfactor > 1) {
                                    long[][]  bounds      = new long[1][2];
                                    bounds[0][0] = 0;
                                    bounds[0][1] = parfactor - 1;
                                    Type      totaltype   = new ArrayType(bounds, T, T.sizeOf(processor));
                                    String    totty       = T.type + " vector ( "
                                                            + parfactor + " )";
                                    Memref    totalarray  = (Memref) tempvar(totaltype);
                                    // build
                                    // up
                                    // partial
                                    // product
                                    // multiple
                                    // words
                                    // at
                                    // a
                                    // time
                                    // in
                                    // this
                                    // which we will cache to a register
                                    Memref    sumarray    = (Memref) tempvar(totaltype);
                                    // then
                                    // store
                                    // it
                                    // in
                                    // this
                                    // variable
                                    // and
                                    // sum
                                    // the
                                    // elements
                                    // of
                                    // the
                                    // array
                                    try {
                                        Node[]     subindices       = rindices;
                                        Node       arg              = mult.eval();
                                        Node       pararg           = parallelise(processor.decast(arg), parfactor, T,
                                                                      nindex);
                                        // System.out.println("pararg="+pararg);
                                        Node       bottomost        = lwb;
                                        Node       setit            = new Assign(nindex,
                                                bottomost);
                                        Node       init             = new Statement(
                                            new Statement(
                                                new Statement(
                                                    loopprestatement,
                                                    new Statement(
                                                        setit)),
                                                new Statement(
                                                    getPreloopAction(nindex))),
                                            new Statement(new Assign(
                                                              totalarray, pararg)));
                                        Node       assign           = new Assign(totalarray,
                                                new Cast(totty, new Dyad(
                                                             forcederef(totalarray,
                                                                        totaltype),
                                                             pararg, "+")));
                                        // System.out.println("init ="+init+"\n assign="+assign);
                                        if(!processor.generateable(assign)) {
                                            error("can not generate parallel code ");
                                        }
                                        Node       newlwb           = dyad(lwb, new Int(
                                                                               parfactor, INTEGER.type), "+");
                                        Statement  newprestatement  = prestatement;
                                        prestatement = oldprestatement;
                                        Statement  ifor;
                                        Statement  dploop           = new Statement(
                                            new Statement(
                                                init,
                                                ifor = new Statement(
                                            new For(
                                                nindex,
                                                newlwb,
                                                upb,
                                                new Int(
                                                    (parfactor),
                                                    INTEGER.type),
                                                new Statement(
                                                    prestatement,
                                                    new Statement(
                                                        assign)))
                                            .optimise(),
                                            new Statement(
                                                new Assign(
                                                    sumarray,
                                                    forcederef(
                                                        totalarray,
                                                        totaltype))))));
                                        ifor.setLocal(nindex);
                                        dploop.setLocal(totalarray);
                                        Node       firstelement     = subscript(sumarray,
                                                                                new Int(0, "int32"));
                                        Node       subtotal         = firstelement;
                                        for(int i = 1; i < parfactor; i++) {
                                            subtotal = dyad(
                                                           subtotal,
                                                           subscript(sumarray,
                                                                     new Int(i, "int32")),
                                                           "+");
                                        }
                                        postPrestatement(dploop);
                                        // System.out.println(dploop);
                                        // System.out.println(subtotal);
                                        unparalleled = true;
                                        // we must set this
                                        // to prevent an
                                        // attempt to
                                        // parallelise
                                        // again on the
                                        // final
                                        // assignment
                                        parlines.set(lex.lineno());
                                        return subtotal;
                                    }
                                    catch(Exception ex) {
                                        // drop through
                                        if(processor.verbose) {
                                            System.out.println(" " + ex);
                                        }
                                    }
                                }
                            }
                            postPrestatement(loop);
                            //        System.out.println("dp loop is "+loop);
                            unparalleled = true;
                            // we must set this to prevent
                            // an attempt to parallelise
                            // again on the final
                            // assignment
                            // System.out.println(" dot product loop "+loop);
                            return forcederef(total);
                            // end of dot product
                            // -------------------------------------------------------------
                        }
                    }
                    else {
                        mustbe(lex.TT_IDENTIFIER);
                        tryagain = true;
                        String idis=lex.theId;
                        Object  f             = ((RecordType) t).lookuptable.get(lex.theId);
                        if(f == null) {
                            throw new UndeclaredVariable(lex.theId, lex.lineno());
                        }
                        if(f instanceof ProcType) {
                            Node vmtaddr = new Memref(getAddr(V).eval(),processor.getAddressType());
                            Procedure pr=((ProcType) f).theProc;
                            if(!(pr instanceof ForwardProc))error(idis+" not a class method");
                            ForwardProc fp = (ForwardProc)pr;
                            Node procedureaddress =
                                new Memref(
                                dyad(
                                    new Int(fp.vmtIndex*
                                            processor.getAddressLenInBytes()),
                                    new Deref(vmtaddr),
                                    "+"),processor.getAddressType());
                            return parseProcCall((ProcType)f,true,lex.theId,procedureaddress,rank,validindices,indices,V);
                        }
                        if(!(f instanceof Field)) {
                            error(lex.theId + " not a field");
                        }
                        Type oldt=t;
                        t = ((Field) f).fieldType;
                        t = resolvepointertypes(t);
                        Node    recordaddr    = getAddr(V).eval();
                        Node    fieldoffset   = new Int(((Field) f).offset);
                        Node    finaladdress  = dyad(recordaddr,
                                                     new TypeTag(fieldoffset, ADDRESS), "+").eval();
                        V = new TypeTag(
                            new Memref(finaladdress, t.returnType()), (t));
                        if(dolist()) {
                            System.out.println("field subscription " + lex.theId + ":" + t +
                                               " \n\t" + t.sizeOf(processor) + " bytes" +
                                               "\n\tV=" + V + "\n\tclass of t" + t.getClass()
                                              );
                        }
                        tryagain = true;
                    }
                }
                if(dolist()) {
                    System.out.println("variable " + V + ":" + t + " " + t.sizeOf(processor) + " bytes, return type=" + t.returnType());
                }
            }
            while(tryagain);
            return V;
        }
        catch(Exception addrcalc) {
            error(" in primary expression started by " + id + " " + addrcalc);
        }
        return null;
    }


    int arraynesting = 0;


    /**
     *  subscript-list: expression subscript-list , expression subscript-list:
     *  expression subscript-list , expression case-list: case-label-list :
     *  statement | case-list ; case-label-list : statement <p>
     *
     *  Associate a label with each case-label-list and preface the statement by it
     *
     *@param  labs             Description of Parameter
     *@param  endlab           Description of Parameter
     *@param  base             Description of Parameter
     *@param  range            Description of the Parameter
     *@return                  Description of the Returned Value
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Statement caselist(Dictionary labs, Label endlab, long base, int[] range)
    throws SyntaxError {
        if(lex.peek("end")) {
            return null;
        }
        Label      thislab  = new Label();
        caselabellist(labs, thislab, base, range);
        mustbe(':');
        Node       s        = statement();
        Statement  therest  = null;
        if(have(';')) {
            if(!lex.peek("otherwise")) {
                if(!lex.peek("else")) {
                    therest = caselist(labs, endlab, base, range);
                }
            }
        }
        return new Statement(thislab, new Statement(s, new Statement(new Goto(
                                 endlab), therest)));
    }


    /**
     *  boolean reduction, returns the additive identity element if the boolean is
     *  false otherwise the returns the non boolean arguement
     *
     *@param  boolarg          Description of the Parameter
     *@param  nonboolarg       Description of the Parameter
     *@param  nonbooltype      Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node booleanreduce(Node boolarg, Node nonboolarg, Type nonbooltype)
    throws SyntaxError {
        if(isreal(nonbooltype)) {
            return dyad(dyad(new Int(-1, "int32"),
                             new TypeTag(boolarg, INTEGER), "*"), nonboolarg, "*");
        }
        if(nonbooltype instanceof IntegralType
                || nonbooltype instanceof OrdinalType) {
            return dyad(new TypeTag(boolarg, nonbooltype), nonboolarg, "AND");
        }
        return dyad(nonboolarg, dyad(new Int(-1, "int32"), new TypeTag(boolarg,
                                     INTEGER), "*"), "*");
    }


    /**
     *  Constructs a dyad using the appropriate operator
     *
     *@param  l                Description of Parameter
     *@param  r                Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception new version of dyad written
     *      april 2001 this is rewritten from scratch to distinguish clearly
     *      between pascal types and machine types
     */
    Node dyad(Node l, Node r, String op) throws SyntaxError {
        // if(processor.verbose) System.out.println("dyad( " + l + "\n" + op +
        // ", " + r+")" );
        // first obtain dereferenced versions of the arguments
        Node  left   = forcederef(l);
        Node  right  = forcederef(r);
        // get the types
        Type  lt     = getType(left);
        Type  rt     = getType(right);
        if(processor.verbose) {
            System.out.println("dyad " + left + ":" + lt + "\n" + op + "\n"
                               + right + ":" + rt);
        }
        // System.out.println(" ");
        // Now categorise the types into sets, strings, numbers and chars
        try {
            // System.out.println("class of lt="+lt.getClass());
            if("AND".equals(op)) {
                if(lt.equals(BOOLEAN) && !rt.equals(BOOLEAN)) {
                    return booleanreduce(left, right, rt);
                }
                if(!lt.equals(BOOLEAN) && rt.equals(BOOLEAN)) {
                    return booleanreduce(right, left, lt);
                }
            }
            if(lt instanceof SetType) {
                // System.out.println("set type");
                return setdyad(left, right, op);
            }
            else
                // + means concatenation of strings,
                // * means multiplication of them
                if((lt instanceof StringType)
                        // || ((op.equals("+") || op.equals("*")) && lt == CHAR&& )
                        || (rt instanceof StringType)) {
                    // System.out.println("string type");
                    return stringdyad(l, r, op);
                }
                else if(isreal(lt) || isreal(rt)) {
                    // System.out.println("real type");
                    return realdyad(optionalfloat(REAL, left), optionalfloat(REAL,
                                    right), op);
                }
                else if(lt instanceof OrdinalType) {
                    // System.out.println("ordinal type");
                    if(rt instanceof OrdinalType) {
                        return ordinaldyad(left, right, op);
                    }
                    return integraldyad(left, right, op);
                }
                else if(lt instanceof IntegralType) {
                    // System.out.println("\n\nintegral type\n\n");
                    return integraldyad(left, right, op);
                }

                else if(lt instanceof Pointer
                        || lt instanceof PointerToNamedType || lt == ADDRESS
                        || rt instanceof Pointer
                        || rt instanceof PointerToNamedType || rt == ADDRESS) {
                    if(processor.verbose) {
                        System.out.println("pointer type op" + left + op + right);
                    }
                    return addressdyad(left, right, op);
                }
                else {
                    // error("can not type validate expression");
                    return olddyad(l, r, op);
                }
        }
        catch(Exception ex) {
            try {
                if(processor.verbose) {
                    System.out.println("dyad fails " + ex);
                }
                return userdyad(op, left, right);
            }
            catch(Exception ex2) {
                error("processing dyadic expression "
                      + lt
                      + " "
                      + op
                      + " "
                      + rt
                      + ex.toString()
                      + "\n \tand no user defined operator matches context after rank reduction\n"
                      + ex2);
                return null;
            }
        }
    }


    // handles dyadic operators between strings

    /**
     *  Description of the Method
     *
     *@param  left             Description of Parameter
     *@param  right            Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  Exception    Description of the Exception
     */
    Node stringdyad(Node left, Node right, String op) throws SyntaxError,
        Exception {
        // System.out.println("string dyad " + left + op + right);
        Type  lt  = getType(forcederef(left));
        Type  rt  = getType(forcederef(right));
        if(!(lt.equals(rt))) {
            if(lt == CHAR) {
                return dyad(tostring(left), right, op);
            }
            if(rt == CHAR) {
                return dyad(left, tostring(right), op);
            }
            if(!((lt instanceof StringType) && (rt instanceof StringType))) {
                error("incompatible types " + lt + " and " + rt
                      + " for operation " + op);
            }
        }
        if(op.equals("=")) {
            return stringcompare(left, right, "eq");
        }
        if(op.equals("<")) {
            return stringcompare(left, right, "lt");
        }
        if(op.equals(">")) {
            return stringcompare(left, right, "gt");
        }
        if(op.equals("<>")) {
            return stringcompare(left, right, "neq");
        }
        if(op.equals("<=")) {
            return stringcompare(left, right, "leq");
        }
        if(op.equals(">=")) {
            return stringcompare(left, right, "geq");
        }
        error("operator " + op + " is not defined on string types");
        return left;
        // never do this
    }


    // return the type with the greatest precision of the two

    /**
     *  Description of the Method
     *
     *@param  lt               Description of Parameter
     *@param  rt               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type maxprecision(OrdinalType lt, Type rt) throws SyntaxError {
        if(processor.verbose) {
            System.out.println(" ordinal maxprecision(" + lt + "," + rt + ")");
        }
        if(rt instanceof OrdinalType) {
            OrdinalType  Rt  = (OrdinalType) rt;
            if(lt.elements == Rt.elements) {
                if(lt.size > Rt.size) {
                    return lt;
                }
                return rt;
            }
        }
        error("right hand side of operator should be ordinal type compatible with"
              + lt + " not " + rt);
        return lt;
    }


    // return the type with the greatest precision of the two

    /**
     *  Description of the Method
     *
     *@param  lt               Description of Parameter
     *@param  rt               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type maxprecision(IntegralType lt, Type rt) throws SyntaxError {
        if(processor.verbose) {
            System.out.println("integral maxprecision(" + lt + "," + rt + ")");
        }
        if(lt == PIXEL && rt != PIXEL && rt instanceof IntegralType
                || (rt == PIXEL && lt != PIXEL)) {
            return REAL;
        }
        // pixels treated as reals when combined with integers
        if(rt instanceof IntegralType) {
            IntegralType  Rt  = (IntegralType) rt;
            if(processor.verbose) {
                System.out.println("maxprecision" + lt.range() + ","
                                   + Rt.range());
            }
            if(lt.range() > Rt.range()) {
                return lt;
            }
            if(Rt.range() > lt.range()) {
                return rt;
            }
            if(processor.verbose) {
                System.out.println("bottoms" + lt.bottom() + "," + Rt.bottom());
            }
            if(lt.bottom() < Rt.bottom()) {
                return lt;
            }
            return rt;
        }
        if(rt instanceof RealType) {
            return rt;
        }
        error("right hand side of operator should be integral type compatible with"
              + lt + " not " + rt);
        return lt;
    }


    // return the type with the greatest precision of the two

    /**
     *  Description of the Method
     *
     *@param  lt               Description of Parameter
     *@param  rt               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type maxprecision(RealType lt, Type rt) throws SyntaxError {
        if(processor.verbose) {
            System.out.println("real maxprecision(" + lt + "," + rt + ")");
        }
        if(rt instanceof IntegralType) {
            return lt;
        }
        if(rt instanceof RealType) {
            if(((RealType) rt).size > lt.size) {
                return rt;
            }
            return lt;
        }
        error("right hand side of operator should be real type compatible with"
              + lt + " not " + rt);
        return lt;
    }


    // handles dyadic operators between ordinals

    /**
     *  Description of the Method
     *
     *@param  left             Description of Parameter
     *@param  right            Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  Exception    Description of Exception
     *@exception  SyntaxError  Description of Exception
     */
    Node ordinaldyad(Node left, Node right, String op) throws Exception,
        SyntaxError {
        OrdinalType  lt  = (OrdinalType) getType(left);
        Type         rt  = getType(right);
        if(lt == BOOLEAN || rt == BOOLEAN) {
            // swap them round since booleans are implemented as 0,-1 not 0, 1
            // as required by the standard
            Node  temp  = left;
            left = right;
            right = temp;
        }
        if(!(lt.equals(rt))) {
            Type  precise  = maxprecision(lt, rt);
            // if(isreal(precise)) return
            // dyad(optionalfloat(precise,left),right,op);
            return dyad(new TypeTag(left, precise),
                        new TypeTag(right, precise), op);
        }
        if(iscomparison(op) || isboolean(op)) {
            return new TypeTag(new Dyad(left, right, new TOP(new Op(op,
                                        lt.type, rt.type, BOOLEAN.type), rt)), BOOLEAN);
        }
        if(op == "min" || op == "max") {
            return new TypeTag(new Dyad(left, right, new TOP(new Op(op,
                                        lt.type, rt.type, rt.type), rt)), rt);
        }
        error("operator " + op + " is not defined on ordinal types");
        return left;
        // never get here
    }


    // handles dyadic operators between addresses

    /**
     *  Description of the Method
     *
     *@param  left             Description of Parameter
     *@param  right            Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  Exception    Description of Exception
     */
    Node addressdyad(Node left, Node right, String op) throws SyntaxError,
        Exception {
        if(processor.verbose) {
            System.out.println("addr dyad " + left.returnType() + op
                               + right.returnType());
        }
        Type  lt   = getType(left);
        Type  rt   = getType(right);
        if(processor.verbose) {
            System.out.println("addr dyad " + lt + op + rt);
        }
        if(lt instanceof Pointer) {
            lt = ADDRESS;
        }
        if(lt instanceof PointerToNamedType) {
            lt = ADDRESS;
        }
        if(rt instanceof Pointer) {
            rt = ADDRESS;
        }
        if(rt instanceof PointerToNamedType) {
            rt = ADDRESS;
        }
        if(!(lt.equals(rt))) {
            if(!(Format.isInteger(lt.type) && Format.isInteger(rt.type))) {
                error("type error in address arithmetic");
            }
            Type  precise  = ADDRESS;
            return dyad(new TypeTag(left, precise),
                        new TypeTag(right, precise), op);
        }
        if(iscomparison(op) || isboolean(op)) {
            return new TypeTag(new Dyad(new TypeTag(left, ADDRESS),
                                        new TypeTag(right, ADDRESS), new TOP(new Op(op, lt.type,
                                                rt.type, BOOLEAN.type), rt)), BOOLEAN);
        }
        Node  res  = null;
        if(op.equals("+")) {
            res = new Dyad(left, right, new TOP(Op.sum(lt.type, rt.type,
                                                rt.type), rt));
        }
        else if(op.equals("-")) {
            res = new Dyad(left, right, new TOP(Op.dif(lt.type, rt.type,
                                                rt.type), rt));
        }
        else if(op.equals("*")) {
            res = new Dyad(left, right, new TOP(Op.prod(lt.type, rt.type,
                                                rt.type), rt));
        }
        else if(op.equals("DIV")) {
            res = new Dyad(left, right, new TOP(Op.div(lt.type, rt.type,
                                                rt.type), rt));
        }
        if(res == null) {
            error("operator " + op + " is not defined on address types");
        }
        return new TypeTag(res, ADDRESS);
    }


    // handles dyadic operators between integers

    /**
     *  Description of the Method
     *
     *@param  left             Description of Parameter
     *@param  right            Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  Exception    Description of Exception
     */
    Node integraldyad(Node left, Node right, String op) throws SyntaxError,
        Exception {
        if(processor.verbose) {
            System.out.println("int dyad " + left.returnType() + op
                               + right.returnType());
        }
        Type  lt   = getType(left);
        Type  rt   = getType(right);
        if(processor.verbose) {
            System.out.println("int types " + lt + op + rt);
        }
        if(!(lt.equals(rt) && left.returnType().equals(right.returnType()))) {
            if(processor.verbose) {
                System.out.println("determine max precision");
            }
            IntegralType  LT       = (IntegralType) lt;
            Type          precise  = maxprecision(LT, rt);
            if(isreal(precise)) {
                return dyad(optionalfloat(precise, left), optionalfloat(
                                precise, right), op);
            }
            return dyad(new TypeTag(left, precise),
                        new TypeTag(right, precise), op);
        }
        if(iscomparison(op)) {
            return new TypeTag(new Dyad(left, right, new TOP(new Op(op, left.returnType(), right.returnType(), BOOLEAN.type), rt)),
                               BOOLEAN);
        }
        if(isboolean(op)) {
            return new TypeTag(new Dyad(left, right, new TOP(new Op(op,
                                        lt.type, rt.type, lt.type), rt)), lt);
        }
        Node  res  = null;
        if(isPixel(lt)) {
            if(op.equals("+")) {
                op = "+:";
            }
            else if(op.equals("-")) {
                op = "-:";
            }
            else if(op.equals("*")) {
                op = "*:";
            }
        }
        if(op.equals("+:")) {
            if(Format.lengthInBytes(lt.type) > 1) {
                error("+: not supported on types of 16 bit precision and over");
            }
            res = new Dyad(left, right, new TOP(new Op(op, lt.type, rt.type,
                                                lt.type), lt));
        }
        if(op.equals("-:")) {
            if(Format.lengthInBytes(lt.type) > 1) {
                error("+: not supported on types of 16 bit precision and over");
            }
            res = new Dyad(left, right, new TOP(new Op(op, lt.type, rt.type,
                                                lt.type), lt));
        }
        else if(op.equals("+:") || op.equals("-:") || op.equals("*:")) {
            if(Format.lengthInBytes(lt.type) > 1) {
                error(op
                      + " not supported on types of 16 bit precision and over");
            }
            res = new Dyad(left, right, new TOP(new Op(op, lt.type, rt.type,
                                                lt.type), lt));
        }
        else if(op.equals("+")) {
            res = new Dyad(left, right, new TOP(Op.sum(lt.type, rt.type,
                                                rt.type), rt));
        }
        else if(op.equals("-")) {
            res = new Dyad(left, right, new TOP(Op.dif(lt.type, rt.type,
                                                rt.type), rt));
        }
        else if(op.equals("*")) {
            if(lt == PIXEL) {
                res = new Dyad(new Cast(Node.int16, left), new Cast(Node.int16,
                               right), Op.prod(Node.int16, Node.int16, Node.int16));
                res = dyad(res, new Int(6, Node.int32), ">>");
            }
            else {
                res = new Dyad(left, right, new TOP(Op.prod(lt.type, rt.type,
                                                    rt.type), rt));
            }
        }
        else if(op.equals("div") || op.equals("DIV")) {
            res = new Dyad(left, right, new TOP(Op.div(lt.type, rt.type,
                                                lt.type), lt));
        }
        else if(op.equals("rem") || op.equals("REM")) {
            res = new Dyad(left, right, "MOD");
        }
        else if(op.equals(Node.min) || op.equals(Node.max)) {
            res = new Dyad(left, right, op);
        }
        else if(op.equals("/")) {
            res = dyad(optionalfloat(REAL, left), optionalfloat(REAL, right),
                       op);
            return new TypeTag(res, REAL);
        }
        else if(op.equals(">>") || op.equals("<<")) {
            res = new Dyad(left, right, op);
        }
        if(res == null) {
            error("operator " + op + " is not defined on integral types");
        }
        return new TypeTag(res, lt);
    }


    // handles dyadic operators between reals

    /**
     *  Description of the Method
     *
     *@param  left             Description of Parameter
     *@param  right            Description of Parameter
     *@param  op               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  Exception    Description of Exception
     *@exception  SyntaxError  Description of Exception
     */
    Node realdyad(Node left, Node right, String op) throws Exception,		SyntaxError {
        RealType  lt  = (RealType) getType(left);
        Type      rt  = getType(right);
        // System.out.println("realdyad " + lt + op + rt);
        if(!(lt.equals(rt))) {
            RealType  precise  = (RealType) maxprecision(lt, rt);
            return realdyad(new TypeTag(left, precise), new TypeTag(right,
                            precise), op);
        }
        RealType  RT  = (RealType) rt;
        if(iscomparison(op)) {
            if(!lt.dimensionallyEquivalent(RT)) {
                dimerror(op);
            }
            return new TypeTag(new Dyad(left, right, new TOP(new Op(op,
                                        lt.type, rt.type, BOOLEAN.type), rt)), BOOLEAN);
        }
        if(isboolean(op)) {
            return   new Dyad(left, right, new TOP(new Op(op,
                                                   lt.type, rt.type, lt.type), lt));
        }
        if(op.equals("+")) {
            if(!lt.dimensionallyEquivalent(RT)) {
                dimerror(op);
            }
            return new TypeTag(new Dyad(left, right, new TOP(Op.sum(lt.type,
                                        rt.type, rt.type), rt)), lt);
        }
        if(op.equals("-")) {
            if(!lt.dimensionallyEquivalent(RT)) {
                dimerror(op);
            }
            return new TypeTag(new Dyad(left, right, new TOP(Op.dif(lt.type,
                                        rt.type, rt.type), rt)), lt);
        }
        else if(op.equals(Node.min) || op.equals(Node.max)) {
            if(!lt.dimensionallyEquivalent(RT)) {
                dimerror(op);
            }
            return new Dyad(left, right, op);
        }
        if(op.equals("*")) {
            return new TypeTag(new Dyad(left, right, new TOP(Op.prod(lt.type,
                                        rt.type, rt.type), rt)), (Type) lt.multiplyby(RT));
        }
        if(op.equals("/")) {
            Node  divided  = new TypeTag(new Dyad(left, right, new TOP(Op.div(
                    lt.type, rt.type, rt.type), rt)), (Type) lt.divideby(RT));
            // System.out.println(" "+divided+":"+lt.divideby(RT));
            return divided;
        }
        error("operator " + op + " is not defined on real types");
        // never get here
        return left;
    }


    /**
     *  Description of the Method
     *
     *@param  op               Description of Parameter
     *@exception  SyntaxError  Description of Exception
     */
    void dimerror(String op) throws SyntaxError {
        error("args to " + op + " dimensionally incompatible");
    }


    /**
     *  build general asssignment including string assignment
     *
     *@param  v                Description of the Parameter
     *@param  s                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node assign(Node v, Node s) throws SyntaxError {
        if(getType(s) instanceof StringType) {
            return stringassign(v, s);
        }
        try {
            return new Assign(v, s);
        }
        catch(Exception ee) {
            error(" assignment problem " + ee);
            return null;
        }
    }


    /**
     *  Description of the Method
     *
     *@param  v                Description of Parameter
     *@param  s                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node stringassign(Node v, Node s) throws SyntaxError {
        // System.out.println("string assign "+v+":="+s);
        Type    t       = getType(new Deref(v));
        s = tostring(s);
        if(!(t instanceof StringType)) {
            error("string assignment to invalid variable " + v);
        }
        Node    len     = new Int(((StringType) t).getstrlen());
        Node[]  params  = {v, len, s};
        return procCall("stringassign", params);
    }


    /**
     *  generate code to dompare two strings under an operator
     *
     *@param  v                A string
     *@param  s                A string
     *@param  op               the operator
     *@return                  ilcg to do the comparison
     *@exception  SyntaxError  Description of Exception
     *@exception  Exception    Description of the Exception
     */
    Node stringcompare(Node v, Node s, String op) throws SyntaxError, Exception {
        Node[]     params        = {tostring(v), tostring(s)};
        Node       vt            = tempvar(BOOLEAN);
        Statement  functioncall  = new Statement(procCall("string" + op, params),
                new Statement(new Assign(vt, processor.functionRetReg(BOOLEAN.type)), null));
        postPrestatement(functioncall);
        return vt;
    }


    /**
     *  Description of the Method
     *
     *@param  s                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node strlen(Node s) throws SyntaxError {
        Node[]  params  = {tostring(s)};
        try {
            Node       vt            = tempvar(INTEGER);
            Statement  functioncall  = new Statement(procCall("length", params),
                    new Statement(new Assign(vt, processor.functionRetReg(INTEGER.type)), null));
            postPrestatement(functioncall);
            return vt;
        }
        catch(Exception a) {
            error("in determining string length " + a);
            return null;
        }
    }


    /**
     *  undoes dereferencing of a set var
     *
     *@param  derefset  Description of the Parameter
     *@return           Description of the Return Value
     */
    Node toset(Node derefset) {
        if(processor.verbose)System.out.print("toset("+derefset+")");
        while(derefset instanceof Cast) {
            derefset = ((Cast) derefset).subtree;
        }
        String  t  = derefset.returnType();
        if(!t.startsWith("ref")) {
            if(derefset instanceof Deref) {
                return ((Deref) derefset).getArg();
            }
        }
        if(processor.verbose) {
            System.out.println("toset returns " + derefset);
        }
        return derefset;
    }


    /**
     *  Force an expression to be evalueated to a temporary
     *
     *@param  v                Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node forceeval(Node v) throws SyntaxError {
        if(!v.returnType().startsWith("ref")) {
            Node v1= processor.decast(v);
            if(v1 instanceof Deref) return ((Deref)v1).getArg();
            if(processor.verbose)System.out.println("forceeval ("+v+") "+v.returnType());
            try {
                Node  vt1  = tempvar(getType(v));
                postPrestatement(new Assign(vt1, v));
                v = vt1;
            }
            catch(Exception e) {
                error("Forcing evaluation " + e);
            }
        }
        return v;
    }


    /**
     *  plant code to compare two sets under the operator
     *
     *@param  v                Description of the Parameter
     *@param  s                Description of the Parameter
     *@param  op               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  Exception    Description of the Exception
     */
    Node setcompare(Node v, Node s, String op) throws SyntaxError, Exception {
        if(processor.verbose) {
            System.out.println("setcompare " + v + op + s);
        }
        String   t       = forcederef(v).returnType();
        SetType  st      = (SetType) getType(v);
        Node[]   params;
        try {
            if(st.bitmapImplementation) {
                int     len    = Format.getVectorTypeLength(t);
                Object[]  ann      = getAnnotations(s);
                if(ann != null && ann[0].toString().equals("nullset")&&(op.equals("eq")||op.equals("neq"))) {
                    Node       vt            = tempvar(BOOLEAN);
                    Node []p= {toset(forceeval(v)), new Int(len, "int32")};
                    Statement  functioncall  = new Statement(
                        procCall(op+"nullset", p)
                        , new Statement(new Assign(vt,
                                                   processor.functionRetReg(BOOLEAN.type)), null));
                    postPrestatement(functioncall);
                    return vt;
                }
                // pre evaluate any subsidiary set expressions and save the
                // results in vt1,vt2
                Node[]  param  = {toset(forceeval(v)), toset(forceeval(s)),
                                  new Int(len, "int32")
                                 };
                params = param;
            }
            else {
                Node[]  param  = {new TypeTag(v, POINTER),
                         new TypeTag(s, POINTER)
                };
                params = param;
            }
            Node       vt            = tempvar(BOOLEAN);
            Statement  functioncall  = new Statement(
                st.bitmapImplementation ? procCall("set" + op, params)
                : procCall(st.symbolTable, "genericset" + op,
                           params), new Statement(new Assign(vt,
                                                  processor.functionRetReg(BOOLEAN.type)), null));
            postPrestatement(functioncall);
            return vt;
        }
        catch(Exception e) {
            error("in Set comparison " + e);
            return v;
        }
    }


    /**
     *  plant code to operate on generic sets goes indirect on the symbol table of
     *  the set type
     *
     *@param  v                Description of the Parameter
     *@param  s                Description of the Parameter
     *@param  op               Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     *@exception  Exception    Description of the Exception
     */
    Node setop(Node v, Node s, String op) throws SyntaxError, Exception {
        try {
            String   t       = forcederef(v).returnType();
            Node[]   params  = {toset(v), toset(s)};
            SetType  st      = (SetType) getType(forcederef(v));
            if(processor.verbose) {
                System.out.println("set type=" + st + "=" + v.returnType()
                                   + " in setop " + op);
            }
            Node     vt      = tempvar(POINTER);
            if(processor.verbose) {
                System.out.println("tempvar =" + vt + getType(vt) + ","
                                   + v.returnType());
            }
            try {
                Node       call          = procCall(st.symbolTable, "genericset" + op, params);
                if(processor.verbose) {
                    System.out.println("call " + call);
                }
                Node       result        = new TypeTag(processor.functionRetReg(POINTER.type), POINTER);
                if(processor.verbose) {
                    System.out.println("result  " + result);
                }
                Node       setresult     = new Assign(vt, result);
                if(processor.verbose) {
                    System.out.println("setresult to " + setresult);
                }
                Statement  functioncall  = new Statement(call, new Statement(
                            setresult));
                postPrestatement(functioncall);
                // System.out.println("setop returns "+vt);
            }
            catch(Exception err) {
                System.out.println("Error " + err);
                error("in set operation " + op + err);
            }
            return new TypeTag(forcederef(vt), st);
        }
        catch(Exception err) {
            System.out.println("Error " + err);
            error("in set operation :" + op + err);
            return null;
        }
    }


    /**
     *  Description of the Method
     *
     *@param  v                Description of Parameter
     *@param  s                Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Node stringappend(Node v, Node s) throws SyntaxError {
        Type    t       = getType(new Deref(v));
        s = tostring(s);
        // v=tostring(v);
        if(s instanceof StringType) {
            // reduction operations can lead to a derefed string here
            Node  c  = processor.decast(s);
            if(c instanceof Deref) {
                s = ((Deref) c).getArg();
            }
        }
        // System.out.println(gettype(s));System.out.println(gettype(v));
        if(!(t instanceof StringType)) {
            error("string append to invalid variable " + v);
        }
        Node    len     = new Int(((StringType) t).getstrlen());
        Node[]  params  = {v, len, s};
        return procCall("stringappend", params);
    }


    /**
     *  recognises an addition operator (+, -, +:, -:, or) in the input stream
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    String addop() throws SyntaxError {
        if(have('+')) {
            return "+";
        }
        if(have('-')) {
            return "-";
        }
        if(have("min")) {
            return Node.min;
        }
        if(have("max")) {
            return Node.max;
        }
        if(have(lex.TT_SATPLUS)) {
            return "+:";
        }
        if(have(lex.TT_SATMINUS)) {
            return "-:";
        }
        if(have(lex.TT_SETXOR)) {
            return "><";
        }
        if(have("OR")) {
            return "OR";
        }
        return "";
    }


    /**
     *  factor : unary-expression {expop unary_expression}
     *
     *@param  rank             rank of result we want to return
     *@param  validindices     number of the indices that are valid ( since we can
     *      not have arrays of length 0)
     *@param  indices          indices available to reduce rank
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    Node factor(int rank, int validindices, Node[] indices) throws SyntaxError,
        TypeIdError {
        Node  e  = unary_expression(rank, validindices, indices);
        // System.out.println("Factor "+e);
        try {
            if(have("POW")) {
                Node    power;
                Node[]  params   = {e,
                                    power = unary_expression(rank, validindices, indices)
                                   };
                Type    pt       = getType(power = forcederef(power));
                if(!(pt instanceof IntegralType)) {
                    error(" POW takes integral right arg");
                }
                Type    t        = getType(forcederef(e));
                Type    returnt  = t;
                if(t instanceof RealType) {
                    if(!((RealType) t).isScalar()) {
                        if(!power.knownAtCompileTime()) {
                            error("dimension of result of POW not known at compile time");
                        }
                        int  pow  = ((Int) power.eval()).intValue();
                        // handle most common cases with function calls
                        if(pow == 2) {
                            return dyad(e, e, "*");
                        }
                        if(pow == -1) {
                            return dyad(new Int(1), e, "/");
                        }
                        if(pow > 0) {
                            while(pow > 1) {
                                returnt = (RealType)((RealType) returnt)
                                          .multiplyby((RealType) t);
                                pow--;
                            }
                        }
                        else {
                            while(pow <= 0) {
                                returnt = (RealType)((RealType) returnt)
                                          .divideby((RealType) t);
                                pow++;
                            }
                        }
                    }
                }
                Node    m        = procCall("ripow", params);
                if(t instanceof IntegralType) {
                    m = procCall("iipow", params);
                }
                Node    vt       = tempvar(returnt);
                prestatement = new Statement(prestatement, new Statement(m,
                                             new Statement(new Assign(vt, processor.functionRetReg(t.type)), null)));
                return (vt);
            }
            if(have("**")) {
                Node[]  params  = {e,
                                   unary_expression(rank, validindices, indices)
                                  };
                Node    m       = procCall("rpow", params);
                Node    vt      = tempvar(REAL);
                prestatement = new Statement(prestatement, new Statement(m,
                                             new Statement(new Assign(vt, processor.functionRetReg(REAL.type)), null)));
                return (vt);
            }
        }
        catch(Exception ex) {
            error(ex.toString());
        }
        return e;
    }


    /**
     *  multiplicative-op: one of / div mod and in
     *
     *@return                  tree for the multiplicative expression
     *@exception  SyntaxError  Description of Exception
     */
    String multiplicativeop() throws SyntaxError {
        // System.out.println("multiplicative op? "+lex.text);
        if(have('*')) {
            return "*";
        }
        if(have("/")) {
            return "/";
        }
        if(have('/')) {
            return "/";
        }
        if(have("DIV")) {
            return "DIV";
        }
        if(have("MOD")) {
            return Node.remainder;
        }
        if(have("REM")) {
            return "REM";
        }
        if(have("AND")) {
            return "AND";
        }
        if(have("SHR")) {
            return ">>";
        }
        if(have("SHL")) {
            return "<<";
        }
        return "";
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    String compop() throws SyntaxError {
        if(have(">")) {
            return ">";
        }
        if(have("<")) {
            return "<";
        }
        if(have(">=")) {
            return ">=";
        }
        if(have("<=")) {
            return "<=";
        }
        if(have("=")) {
            return "=";
        }
        if(have("<>")) {
            return "<>";
        }
        return "";
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    String dyadicOperator() throws SyntaxError {
        String  t  = multiplicativeop();
        if(t.equals("")) {
            t = addop();
        }
        if(t.equals("")) {
            t = compop();
        }

        if(t.equals("")) {
            if(have("**")) {
                return "**";
            }
            if(have(".")) {
                return ".";
            }
            mustbe("POW");
            return "POW";
        }
        else {
            return t;
        }
    }


    /**
     *  parse multiplicative expressions
     *
     *@param  rank             rank of array types expected
     *@param  indices          indices to be used
     *@param  validindices     Description of the Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     *@exception  TypeIdError  Description of Exception
     */
    Node term(int rank, int validindices, Node[] indices) throws SyntaxError,
        TypeIdError {
        Node f1;
        Node    e1  = factor(rank, validindices, indices);
        Type t = getType(f1=forcederef(e1));
        String  op  = multiplicativeop();
        if(op.equals("AND")) {
            if(!(Format.isInteger(f1.returnType())|| t .equals(BOOLEAN)))error("wanted an integer or boolean expression before AND.\nHint  probably missing brackets are the problem");
        }
        while(!op.equals("")) {
            Node e2=factor(rank, validindices, indices);
            Node f2;
            Type t2 =   getType(f2=forcederef(e2));
            if(op.equals("AND")) {

                //	if(!t.equals(t2))error(" types on left and right of boolean operator do not match.\nHint AND is a high priority operator and overides comparisons. ");
                if(!(Format.isInteger(f2.returnType())|| t2 .equals(BOOLEAN)))error("wanted an integer or boolean expression after AND.\nHint probably missing brackets are the problem");
            }
            if(t instanceof Pointer                     &&!t.equals(t2)) {
                //	System.out.println(op+"t="+t+"old e2"+e2);
                e2=new TypeTag(cast2(e2,t),t);
                //	System.out.println(" "+e2);
            }
            e1 = dyad(e1, e2, op);
            op = multiplicativeop();
        }
        return e1;
    }


    /**
     *  Description of the Method
     *
     *@param  e1               Description of the Parameter
     *@param  e2               Description of the Parameter
     *@param  boundscheck      Description of the Parameter
     *@return                  Description of the Return Value
     *@exception  SyntaxError  Description of the Exception
     */
    Node isinset(Node e1, Node e2, boolean boundscheck) throws SyntaxError {
        try {
            Type     t1  = getType(forcederef(e1));
            Type     t2  = getType(forcederef(e2));
            if(!(t2 instanceof SetType)) {
                error(" not a set");
            }
            SetType  st  = (SetType) t2;
            if(!st.bitmapImplementation) {
                Node    bb      = tempvar(BOOLEAN);
                Node[]  params  = {e2, e1, bb};
                Node    call    = procCall(st.symbolTable, "genericsetisin", params);
                postPrestatement(call);
                return bb;
            }
            else {
                try {
                    ScalarRange  mem     = (ScalarRange) st.members;
                    // mask the bitmap to determine presence of bit
                    Node         index   = new TypeTag(forcederef(e1), INTEGER);
                    Node         lwb     = new Int(mem.bottom() & 0xfffffff8, intrep);
                    index = new TypeTag(dyad(index, lwb, "-").eval(),
                                        getType(index));
                    Node         offset  = new Dyad(index, new Int(3, intrep), shrii);
                    Node         mask    = new Cast(byterep, new Dyad(new Cast(byterep,
                                                    new Int(1)), new Cast(byterep, new Dyad(index,
                                                            new Int(7, intrep), "AND")), shlbb));
                    Node         target  = forcederef(subscript(e2, offset));
                    Node         check   = new TypeTag(new Dyad(new Dyad(target, mask,
                                                       "AND"), new Int(0, "uint8"), "<>"), BOOLEAN);
                    if(st.members.equals(t1)) {
                        boundscheck = false;
                    }
                    if(boundscheck) {
                        Node  temp   = tempvar(BOOLEAN);
                        Node  init   = new Assign(temp, new Int(0, boolrep));
                        Node  guard  = new If(dyad(index, new Int(0, intrep),
                                                   ">="), new If(dyad(index, new Int(mem.top()
                                                           - mem.bottom(), intrep), "<="),
                                                           new Assign(temp, check)));
                        postPrestatement(init);
                        postPrestatement(guard);
                        return forcederef(temp);
                    }
                    return check;
                }
                catch(Exception e8) {
                    error("in bitmap test " + e8);
                }
            }
        }
        catch(Exception e5) {
            error("in set membership " + e5);
        }
        return e1;
    }


    // this synthesises illegal pascal names

    /**
     *  this synthesises illegal pascal names
     *
     *@return    Description of the Returned Value
     */
    String newname() {
        names++;
        return illegal + names + Math.random();
    }


    String illegal = " t e m p";


    /**
     *  declares a temp variable of given type
     *
     *@param  t              Description of Parameter
     *@return                Description of the Returned Value
     *@exception  Exception  Description of Exception
     */
    Node tempvar(Type t) throws Exception {
        String  name  = newname();
        declareVar(name, t);
        Node v=(Variable) symbolTable.checkedGet(name);
        if(processor.verbose)
            System.out.println("declare\n"+name+":"+t+" @ "+v);
        return v;
    }


    /**
     *  element-list: empty | element | element-list , element
     *
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */

    /**
     *  element-list: empty | element | element-list , element element-list: empty
     *  | element | element-list , element element: expression expression ...
     *  expression
     *
     *@return                  Description of the Returned Value
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */

    /**
     *  Parses a typeid element-list: empty | element | element-list , element
     *  element-list: empty | element | element-list , element element: expression
     *  expression ... expression element-list: empty | element | element-list ,
     *  element element: expression expression ... expression constid: identifier
     *  typeid: identifier
     *
     *@return                  Description of the Returned Value
     *@return                  Description of the Returned Value
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type typeid() throws SyntaxError {
        String  id;
        mustbe(lex.TT_IDENTIFIER);
        id = lex.theId;
        return typeid(id);
    }


    /**
     *  checks that an id is a type name and if it is a real allows it to be
     *  followed by a dimension
     *
     *@param  id               Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  SyntaxError  Description of Exception
     */
    Type typeid(String id) throws SyntaxError {
        // System.out.print(" typeid("+id+")");
        Object  val  = null;
        try {
            val = getid(id);
        }
        catch(Exception e2) {
        }
        if(val == null) {
            throw new UndeclaredType(id, lex.lineno());
        }
        if(!(val instanceof Type)) {
            error(id
                  + "  is not a type or constant, \n\t\tbut it should be from the context in which it was found");
        }
        // System.out.println(" "+val);
        return (Type) val;
    }


    /**
     *  Auxilliary processor names are stored in Apus. These specify the code
     *  generators to be used in compiling any units that are to run on auxilliary
     *  processors. When a unit that is to run on an auxilliary processor is
     *  encountered, then the compiler is called recursively to compile for these
     *  processors. The apu strings are then passed as the cpu string on the
     *  recursive call.
     */
    static String[] Apus = {""};
    static boolean verbose = false;
    static String rtldir = ".";
    static boolean training = false;
    static String defaultcg = "gnuP4CG";
    static int optimisationlevel = Walker.subExpressionOptimise;
    static String helptext = "Vector Pascal Compiler         \n"
                             + "                    \n"
                             + "Usage: vpc srcname [options] [non pascal files]        \n"
                             + "	- srcname should not include the .pas extension        \n"
                             + "	- output will be in an executable srcname.exe for Windows or        \n"
                             + "	  simply srcname for Linux        \n"
                             + "                    \n"
                             + "Non Pascal files        \n"
                             + "	you can supply a list of .a, .o, .s or .c files that        \n"
                             + "	are to be compiled and linked with your program        \n"
                             + "	this is typically done to give a Pascal program access        \n"
                             + "	to libraries written in another language        \n"
                             + " Options for user programs        \n"
                             + "-A<asmfile>     Allows you to specify the assembler file name used        \n"/*
                             + "-apu<digit><name>  Deprecated      \n"
                             + "		specifies what code generator is to be used for         \n"
                             + "		auxilliary processor n, eg:        \n"
                             + "		-apu0SonyVPU0 -apu1SonyVPU1        \n"
                             + "		You can specify that particular Pascal Units        \n"
                             + "		in your program are to be targeted to particular        \n"
                             + "		auxilliary processors. This feature is not fully        \n"
                             + "		debugged yet. If several apus are listed on the        \n"
                             + "		command line they must be in ascending order of APU number        \n"*/
                             + "          		        \n"
                             + "-BOEHM		        \n"
                             + "		link with the BOEHM garbage collector which must        \n"
                             + "		be installed in your gcc linkage path        \n"
                             + "-NOBOEHM       	default        \n"
                             + "-coresN generate code for N cores executing in parallel\n"
                             + "-cpu<NAME>      specifies the code generator to be used in compiling        \n"
                             + "		code. Default on 32 bit systems is gnuP4, other available <NAME>s include        \n"
                             + "        AMD64 - AMD64 bit instructions using SSE2 and gas \n"
                             + "        AVX64 - AVX instructions 64 bit address space using NASM        \n" 
                             + "        C     - translates Pascal to 32 bit C and compiles with gcc\n"
                             + "        EE    - for Sony PS2 Emotion Engine ( cross compiler )        \n"
                             + "        gnuPentium, gnu486 intel 32 bit processors but using gas \n"
                             + "        IA32  - Intel 486 using NASM  - no SIMD use      \n"
                             //    + "		K6    - AMD 3D now using  NASM        \n"
                             + "        P3    - Intel 32 bit with SSE1 using NASM        \n"
                             + "        P4    - Intel 32 bit with SSE2 using NASM        \n"
                             + "        Opteron - version of Opteron code generator without PIC needs gcc-4.8        \n"
                             //  + "        nvidia - Intel CPU with Nvidia GPU(compute 3.0 or greater) using  \n"
                             //  + "                 NASM and NVCC. For 64-bit hardware but compiles in 32bit mode.\n"
                             //  + "                 Not thread safe.        \n"
                             // + "		NIOS - Altera NIOS ( cross compiler )        \n"
                             + "        MIC   - Intel XeonPhi with 64 bit code \n"
                             + "-fastforloop   Does more optimisation of for loops, this form of loop will not \n"
                             + "               terminate correctly if the limit to the loop = MAXINT \n"
							 + "               this is turned on by default if optimisation level >0 \n"
                             + "-NOVPWORDS     Allows Vector Pascal reserved words that do not occur in Turbo \n"
                             + "               or in Extended Pascal to be used as identifiers \n"
                             + "-D<symbol>      Define compiler pre-processor flag for conditional compilation        \n"
                             + "-d<symbol>      Define the directory path in which to find files        \n"
                             + "-fcoff		Get assembler to generate coff output        \n"
                             + "-felf		Get assembler to generate elf output        \n"
                             + "-gnu		generate assembler using the gnu Pentium assembler        \n"
                             + "                    \n"
                             + "?        \n"
                             + "-h        \n"
                             + "-help        \n"
                             + "--h        \n"
                             + "--help		print this text        \n"
                             + "-inter		generate an intermediate ilc file for the syntax tree        \n"
                             + "-parallelsum attempt to evaluate \\+ in parallel \n" 
                             + "-L<digit>	Output a Latex listing of the program with variable levels        \n"
                             + "		of detail included        \n"
                             + "-nobalance	switches off cannonical re-ordering of expression trees        \n"
                             + "-nolink        switdches off linking so that a .o file is generated \n"
                             + "-o<filename>    Specifies the name of the object file generated by         \n"
                             + "		the assembler pass	        \n"
                             + "-opt<decimal number> select an optimisation level in range 0..31, default is 1.\n"
                             + "        The number is a sum of powers of 2 which switch on \n"
                             + "        distinct optimisations.\n"
                             + "     1  Subexpression optimiser, common sub expressions in a statement\n"
                             + "        are evaluated once.\n"
                             + "     2  removeloopinvariants, invariant statements or expressions in implicit \n"
                             + "        or explicit loops are taken out of loop and executed first.\n"
                             + "        This will involve allocating implicit loop variables which can be \n"
                             + "        register optimised by CacheLocals\n"
                             + "     4  unrollLoops, short loops replaced with inline code, longer ones have\n"
                             + "        multiple logical iterations for each actual jump to the start of the\n"
                             + "        unrolled loop.\n"
                             + "     8  CacheLocals, implicit local variables that have been \n"
                             + "        allocated for array expressions are allocated to registers. \n"
                             + "     16 Try alternatives, generate several possible instruction sequences using\n"
                             + "        different opcodes with the same semantics and  chose the shortest. \n"
                             + "-S		Generate an assembler output but do not assemble or link      \n"
                             + "-T		Run in training mode, do not load any of the pre-learned      \n"
                             + "		code generation tactics stored in the .vwu file        \n"
                             + "-U		Generate underlines as prefix for external symbols to the \n"
                             + "                linker        \n"
                             + "Compiler development options        \n"
                             + "-V		switch on verbose mode for entire compilation        \n"
                             + "-switchon<number>           \n"
                             + "		switch on verbose mode whilst generate src line <number>        \n"
                             + "-switchon<nuber>..<number>         \n"
                             + "		switch on verbose mode between range of lines        \n"
                             + "                in source when code generating code        \n"
                             + "-cputest	do not compile a program but send test patterns        \n"
                             + "		to the code generator to test what arithmetic        \n"
                             + "		operations it can do and print the result to        \n"
                             + "		the standard output        \n" + "                    \n"
                             + "------------------------";

    static boolean intermediateFile = false;


    /**
     *  main entry point of the program
     *
     *@param  args  The command line arguments
     */

    public static void main(String[] args) {
        PrintWriter  asm;
        PrintWriter  lst;
        try {
            int                     i;
            String                  cgname          = defaultcg;
            boolean                 console         = false;
            String                  assemprefix     = "";
            boolean                 cputest         = false;
            boolean                 dontassemble    = false;
            boolean                 dontlink        = false;
            boolean  				proflist		= true;
            int                     disp            = args[0].indexOf(".pas");
            if(disp > 0) {
                args[0] = args[0].substring(0, disp);
            }
            String                  asmfile         = "p.asm";
            String                  ofile           = "p.o";
            String                  outfile         = "p.exe";
            Vector                  defines         = new Vector();
            rtldir = (System.getProperty("mmpcdir", ".")).replace("\\", "/");
            // System.out.println("mmpcdir="+rtldir);
            AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
            AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
            AsmLink.gc = rtldir + "/" + AsmLink.gc;
            AsmLink.rtldir = rtldir;
            int                     threadcount     = 1;
            String                  path            = "";
            int                     maxapu          = -1;
            String[]                apus            = new String[10];
            for(i = 0; i < args.length; i++) {
                // System.out.println(args[i]);
                if(args[i].startsWith("-h") || args[i].startsWith("--h")
                        || args[i].startsWith("?")) {
                    System.out.println(helptext);
                    System.exit(0);
                }
                if(args[i].startsWith("-fastforloop")) {
                    usePascalForDefinition = false;
                }
                if(args[i].startsWith("-noproflist")) {
                    proflist = false;
                }
                if(args[i].startsWith("-nolink")) {
                    dontlink = true;
                }
                if(args[i].startsWith("-cores")) {
                    String  nums  = args[i].substring(6);
                    // strip of -cores
                    threadcount = java.lang.Integer.valueOf(nums).intValue();
                }
                else if(args[i].startsWith("-BOEHM")) {
                    AsmLink.gcenable = true;
                }
                else if(args[i].startsWith("-NOBOEHM")) {
                    AsmLink.gcenable = false;
                }
                else if(args[i].startsWith("-count")) {
                    Walker.linecount = true;
                }
                else if(args[i].startsWith("-parallelsum")) {
                    reduceparallelise = true;
                }
                else if(args[i].startsWith("-switchon")) {
                    int  last_dot  = args[i].lastIndexOf("..");
                    if(last_dot != -1) {
                        Walker.switchon = java.lang.Integer.valueOf(args[i]
                                                                .substring(9, last_dot)).intValue();
                        Walker.switchoff = java.lang.Integer.valueOf(args[i]
                                .substring(last_dot + 2)).intValue();
                    }
                    else {
                        Walker.switchon = java.lang.Integer.valueOf(args[i]
                                                                .substring(9)).intValue();
                    }
                }
                else if(args[i].startsWith("-cputest")) {
                    cputest = true;
                }
                else if(args[i].startsWith("-gnu")) {
                    assemprefix = "gnu";
                }
                else if(args[i].startsWith("-par")) {
                    parallelcodegen=true;
                }
                else if(args[i].startsWith("-opt")&& args[i].length()>=5) {
					optimisationlevel = java.lang.Integer.parseInt(args[i].substring(4)) ;
                  //  optimisationlevel = (int)args[i].charAt(4)-'0';
                }
             
                else if(args[i].startsWith("-apu")) {
                    if(args[i].length() < 7) {
                        throw new Exception(
                            "on command line, apu parameter invalid: "
                            + args[i]);
                    }
                    char  nc  = args[i].charAt(4);
                    if(nc > '9' || nc < '0') {
                        throw new Exception(
                            "on command line, apus must be in range 0..9");
                    }
                    int   n   = (int)(nc - '0');
                    if(n > (maxapu + 1)) {
                        throw new Exception("on command line, apu" + nc
                                            + " specified before apu" + (n - 1));
                    }
                    if(n > maxapu) {
                        maxapu = n;
                    }
                    apus[n] = args[i].substring(6);
                    Apus = new String[n + 1];
                    for(short ii = 0; ii <= n; ii++) {
                        Apus[ii] = apus[ii];
                    }
                }
                else if(args[i].startsWith("-cpu")) {
                    cgname = args[i].substring(4) + "CG";

                }
                else if(args[i].startsWith("-mmpcdir=")) {
                    rtldir = (args[i].substring(9)).replace("\\", "/");
                    // System.out.println("mmpcdir="+rtldir);
                    AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
                    AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
                    AsmLink.gc = rtldir + "/" + AsmLink.gc;
                }
                else if(args[i].startsWith("-A")) {
                    asmfile = args[i].substring(2);
                }
                else if(args[i].startsWith("-L")) {
                    latexLevel = 4;
                }
                else if(args[i].startsWith("-L1")) {
                    latexLevel = 1;
                }
                else if(args[i].startsWith("-L2")) {
                    latexLevel = 2;
                }
                else if(args[i].startsWith("-L3")) {
                    latexLevel = 3;
                }
                else if(args[i].startsWith("-L0")) {
                    latexLevel = 0;
                }
                else if(args[i].startsWith("-NOVPWORDS")) {
                    novpwords = true;
                }
                else if(args[i].startsWith("-V")) {
                    verbose = true;
                }
                else if(args[i].startsWith("-o")) {
                    outfile = args[i].substring(2);
                }
                else if(args[i].startsWith("-console")) {
                    console = true;
                }
                else if(args[i].startsWith("-inter")) {
                    intermediateFile = true;
                }
                else if(args[i].startsWith("-S")) {
                    dontassemble = true;
                }
                else if(args[i].startsWith("-f")&&!(args[i].startsWith("-fast"))) {
                    AsmLink.objectformat = args[i].substring(2);
                }
                else if(args[i].startsWith("-d")) {
                    path = args[i].substring(2);
                }
                else if(args[i].startsWith("-D")) {
                    defines.add(args[i].substring(2));
                    AsmLink.rtl = AsmLink.rtl+ " "+args[i];
                }
                else if(args[i].startsWith("-nobalance")) {
                    Dyad.treeBalance = false;
                }
                else if(args[i].startsWith("-T")) {
                    training = true;
                }
                else if(args[i].startsWith("-U")) {
                    Walker.procprefix = "_";
                }
                else if (args[i].startsWith("-l")) {
                    AsmLink.libs += (" "+args[i]);
                }
                else if(args[i].endsWith(".a") || args[i].endsWith(".c")
                        || args[i].endsWith(".s") || args[i].endsWith(".o")) {
                    AsmLink.rtl = AsmLink.rtl + " " + args[i];
                }
                // do these again
            }

            int                     dispout         = outfile.indexOf(".pas");
            if(dispout > 0) {
                outfile = outfile.substring(0, dispout);
            }
            if(AsmLink.objectformat.equals("coff")) {
                // Walker.procprefix = "_";
            }
            if(AsmLink.objectformat.equals("elf")) {
                // Walker.procprefix = "";
            }
            asmfile = path + asmfile;
            outfile = path + outfile;
            // if(intermediateFile)System.out.println("using intermediate file");
            if(cgname == "undefined cpu") {
                throw new Exception(
                    "target CPU not defined on command line "
                    + "\nUsage:\n\t java ilcg.pascal.PascalCompiler sourcefile -cpuCPU");
            }
            //System.out.println("defines ="+defines);
            cgname = assemprefix + cgname;
            asm = new PrintWriter(new FileOutputStream(asmfile));
            if(console) {
                lst = new PrintWriter(System.err);
            }
            else {
                lst = new PrintWriter(new FileOutputStream(path + args[0]
                                      + ".lst"));
            }
            ilcg.tree.Walker        w               = getCodeGenerator(cgname, lst);
            AsmLink.cpu=w;
            w.setLogfile(lst);
            if(optimisationlevel >= 0) {
                w.setOptimisationLevel(optimisationlevel);
                if( (w.optimisationLevel&w.unrollLoops) > 0) {
                     For.loopunroll = true;
                }
                if((w.optimisationLevel &w.removeloopinvariants)> 0) {
                   For.optimiseon = true;
                   w.disableTransforms();
                    usePascalForDefinition = false;
                }
                if((w.optimisationLevel  )> 1) {
             
                    usePascalForDefinition = false;
                }
            }
            
            w.verbose = verbose;
            System.out.println("Glasgow  Pascal Compiler (with vector exensions)");
            if(cputest) {
                if(!w.selftest()) {
                    System.out.println("cputest fails");
                    System.exit(-1);
                }
                System.out.println("cputest ok");
                 System.exit(0);
            }
            FileInputStream         sf              = new FileInputStream(path + args[0] + ".pas");
            java.io.FileDescriptor  fd              = sf.getFD();
            if(!fd.valid()) {
                throw new IOException(args[0] + ".pas invalid file");
            }
            // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
            // FileReader(fd));
            Reader                  source          = new InputStreamReader(sf);
            try {
                source = new InputStreamReader(sf, "UTF-8");
            }
            catch(UnsupportedEncodingException ue) {
                System.out.println("utf-8 not supported using ascii");
                source = new InputStreamReader(sf);
            }
            if(threadcount > 1) {
                AsmLink.rtl = AsmLink.rtl + " " + rtldir + "/" + "threadlib.c "
                              + rtldir + "/" + cgname + "taskexecute.s -pthread";
            }
            // if (!path.endsWith("/")) path=path+"/";
            PascalCompiler          pascalCompiler  = (threadcount == 1 ? new PascalCompiler(
                        path, w, source, args[0] + ".pas")
                    : new MultiThreadPascal(path, w, source, args[0] + ".pas",
                                            threadcount));
            try {
                pascalCompiler.defineSymbol(cgname);
                pascalCompiler. defineSymbols(defines);
                if(cgname.startsWith("ARM")) {
                    nox87=true;
                    inLineReals=false;
                }
                if(novpwords) {
                    pascalCompiler.excludeReservedWords(pascalCompiler.vpExtensions);
                }
                if(nox87) {
                    pascalCompiler.excludeReservedWords(pascalCompiler.opExtensions);
                }

                // if(intermediateFile)System.out.println("using intermediate file");
                // asm.println(";#compiler version "+PascalCompilerVer.VERSION);
                if(!w.macrofile().equals("")) {
                    asm.println(w.directivePrefix() + "include \"" + rtldir
                                + "/" + w.macrofile() + "\"");
                }
                asm.println(w.prelude());
                if(verbose) {
                    System.out.print(" " + w.invocations);
                }
                if(w.optimisationLevel > 1) {
                    pascalCompiler.lex.rangechecks = false;
                    pascalCompiler.lex.rcheck = false;
                }
                pascalCompiler.compile(asm, intermediateFile, path + args[0]);
                if(verbose) {
                    System.out.print(" " + w.invocations);
                }
                for(int u = 0; u < pascalCompiler.unitsUsed.size(); u++) {
                    asm.println(w.directivePrefix() + "include "
                                + pascalCompiler.unitsUsed.elementAt(u));
                }
                asm.println(w.sectionDirective() + " .data");
                w.reservebytes(256);
                System.out.println("compiled");
                asm.close();
                if(!dontassemble) {
                    if(dontlink) {
                        ofile = path + args[0] + ".o";
                    }
                    if(!w.assemble(asmfile, ofile)) {
                        throw new Exception("assembly failed");
                    }
                    if(!dontlink) {
                        if(!w.link(ofile, outfile)) {
                            throw new Exception("linking failed");
                        }
                    }
                }
                lst.close();
                if(new Random().nextFloat() > 0.7) {
                    // save the cached compilation details
                    FileOutputStream  fo  = new FileOutputStream(cgname + ".vwu");
                    ZipOutputStream   zo  = new ZipOutputStream(fo);
                    zo.putNextEntry(new ZipEntry(cgname));
                    ObjectOutput      so  = new ObjectOutputStream(zo);
                    so.writeObject(w);
                    so.flush();
                    so.close();
                }
            }
            catch(Exception e) {
                lst.close();
                asm.close();
                System.out.println("compilation failed" + e);
                if(verbose)e.printStackTrace();
                System.out.flush();
                System.exit(-1);
            }
        }
        catch(Exception e) {
            System.out.println(e);
            System.exit(-1);
        }
    }


    /**
     *  Load a named code generator attempting to load a vwu version of it if
     *  possible
     *
     *@param  cgname         Description of the Parameter
     *@param  lst            Description of the Parameter
     *@return                The codeGenerator value
     *@exception  Exception  Description of the Exception
     */
    static Walker getCodeGenerator(String cgname, PrintWriter lst)
    throws Exception {
        Walker  w;
        if(cgname.equals(defaultcg)) {
            w = new AMD64CG();
        }
        else {
            ClassLoader  loader  = (new ilcg.tree.Int()).getClass()
                                   .getClassLoader();
            if(loader == null) {
                throw new Exception("cant get default class loader ");
            }
            Class        cgc     = loader.loadClass("ilcg.tree." + cgname);
            if(cgc == null) {
                throw new Exception("cant load class " + cgname);
            }
            w = (ilcg.tree.Walker) cgc.newInstance();
            // now make sure that the address type in Format is right
            // this handles whether we have 32 bit or 64 bit addresses
            // the walker class knows which to use
            Format.addressType=w.getAddressType();
        }
        if(!training) {
            // if training ignore previous experience
            try {
                if(new Random().nextFloat() > 0.9) {
                    throw new Exception(" Dont load it every time");
                }
                /*
                 *  attempt to load cached walker with optimisation tables
                 */
                FileInputStream    fg  = new FileInputStream(cgname + ".vwu");
                ZipInputStream     zi  = new ZipInputStream(fg);
                zi.getNextEntry();
                ObjectInputStream  sg  = new ObjectInputStream(zi);
                Walker             dg  = (Walker) sg.readObject();
                sg.close();
                w = dg;
                if(verbose)System.out.println(cgname + ".vwu loaded");
            }
            catch(Exception e) {
                if(verbose) {
                    System.out.println("Could not load " + cgname + ".vwu " + e);
                }
                try {
                    /*
                     *  attempt to load cached walker with optimisation tables
                     */
                    FileInputStream    fg  = new FileInputStream(rtldir + "/"
                            + cgname + ".vwu");
                    ZipInputStream     zi  = new ZipInputStream(fg);
                    zi.getNextEntry();
                    ObjectInputStream  sg  = new ObjectInputStream(zi);
                    Walker             dg  = (Walker) sg.readObject();
                    sg.close();
                    w = dg;
                    if(verbose)System.out.println(rtldir + "/" + cgname + ".vwu loaded");
                }
                catch(Exception e2) {
                    if(verbose) {
                        System.out.println("Could not load  system " + rtldir
                                           + "/" + cgname + ".vwu " + e2);
                    }
                }
            }
        }
        w.setLogfile(lst);
        if(optimisationlevel >= 0) {
            w.setOptimisationLevel(optimisationlevel);
            if(w instanceof Opteron)  w.setOptimisationLevel(optimisationlevel>2?2:optimisationlevel);
        }
        w.verbose = verbose;
        return w;
    }


    /**
     *  This is how the compiler is called from the Viper development environment
     *
     *@param  args         Description of the Parameter
     *@param  selectedCpu  Description of the Parameter
     *@param  notifier     Description of the Parameter
     */
    public static void ViperEntryPoint(String[] args, Walker selectedCpu,
                                       ProgressNotifier notifier) {
        PrintWriter  asm;
        PrintWriter  lst;
        // String defaultcg="PentiumCG";
        try {
            int                     i;
            String                  cgname             = defaultcg;
            boolean                 console            = false;
            String                  assemprefix        = "";
            int                     optimisationlevel  = Walker.subExpressionOptimise;
            boolean                 dontassemble       = false;
            boolean                 intermediateFile   = false;
            String                  asmfile            = "p.asm";
            String                  ofile              = "p.o";
            String                  outfile            = "p.exe";
            Vector                  defines            = new Vector();
            rtldir = System.getProperty("mmpcdir", ".").replace("\\", "/");
            // System.out.println("mmpcdir="+rtldir);
            AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
            AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
            AsmLink.gc = rtldir + "/" + AsmLink.gc;
            String                  path               = "./";
            for(i = 0; i < args.length; i++) {
                // System.out.println(args[i]);
                if(args[i].startsWith("-BOEHM")) {
                    AsmLink.gcenable = true;
                }
                else if(args[i].startsWith("-NOBOEHM")) {
                    AsmLink.gcenable = false;
                }
                else if(args[i].startsWith("-count")) {
                    Walker.linecount = true;
                }
                else if(args[i].startsWith("-switchon")) {
                    Walker.switchon = java.lang.Integer.valueOf(args[i]
                                                            .substring(9)).intValue();
                }
                else if(args[i].startsWith("-gnu")) {
                    assemprefix = "gnu";
                }
                else if(args[i].startsWith("-opt1")) {
                    optimisationlevel = Walker.subExpressionOptimise;
                }
                else if(args[i].startsWith("-opt2")) {
                    optimisationlevel = Walker.subExpressionOptimise
                                        + Walker.cacheLocals;
                }
                else if(args[i].startsWith("-opt0")) {
                    optimisationlevel = 0;
                }
                else if(args[i].startsWith("-opt3")) {
                    optimisationlevel = 7;
                }
                else if(args[i].startsWith("-mmpcdir=")) {
                    rtldir = args[i].substring(9).replace("\\", "/");
                    // System.out.println("mmpcdir="+rtldir);
                    AsmLink.rtl = rtldir + "/" + AsmLink.rtl;
                    AsmLink.rtlb = rtldir + "/" + AsmLink.rtlb;
                    AsmLink.gc = rtldir + "/" + AsmLink.gc;
                }
                else if(args[i].startsWith("-A")) {
                    asmfile = args[i].substring(2);
                }
                else if(args[i].startsWith("-L")) {
                    latexLevel = 4;
                }
                else if(args[i].startsWith("-L1")) {
                    latexLevel = 1;
                }
                else if(args[i].startsWith("-L2")) {
                    latexLevel = 2;
                }
                else if(args[i].startsWith("-L3")) {
                    latexLevel = 3;
                }
                else if(args[i].startsWith("-L0")) {
                    latexLevel = 0;
                }
                else if(args[i].startsWith("-V")) {
                    verbose = true;
                }
                else if(args[i].startsWith("-o")) {
                    outfile = args[i].substring(2);
                }
                else if(args[i].startsWith("-console")) {
                    console = true;
                }
                else if(args[i].startsWith("-inter")) {
                    intermediateFile = true;
                }
                else if(args[i].startsWith("-S")) {
                    dontassemble = true;
                }
                else if(args[i].startsWith("-f")) {
                    AsmLink.objectformat = args[i].substring(2);
                }
                else if(args[i].startsWith("-d")) {
                    path = args[i].substring(2);
                }
                else if(args[i].startsWith("-D")) {
                    defines.add(args[i].substring(2));
                }
                else if(args[i].startsWith("-T")) {
                    training = true;
                }
                else if(args[i].startsWith("-U")) {
                    Walker.procprefix = "_";
                }
                else if(args[i].endsWith(".a") || args[i].endsWith(".c")
                        || args[i].endsWith(".s") || args[i].endsWith(".o")) {
                    AsmLink.rtl = AsmLink.rtl + " " + args[i];
                }
                // do these again
            }
            if(AsmLink.objectformat.equals("coff")) {
                // Walker.procprefix = "_";
            }
            if(AsmLink.objectformat.equals("elf")) {
                // Walker.procprefix = "";
            }
            // System.out.println("Proc prefix = "+Walker.procprefix);
            asmfile = path + asmfile;
            outfile = path + outfile;
            asm = new PrintWriter(new FileOutputStream(asmfile));
            if(console) {
                lst = new PrintWriter(System.err);
            }
            else {
                lst = new PrintWriter(new FileOutputStream(path + args[0]
                                      + ".lst"));
            }
            ilcg.tree.Walker        w                  = selectedCpu;
            // w.listmatches();
            /*
             *  Walker w; if(cgname.equals("IA32CG")) w= new IA32CG();else
             *  if(cgname.equals("PentiumCG"))w = new PentiumCG();else
             *  if(cgname.equals("K6CG")) w= new K6CG();else
             *  if(cgname.equals("P3CG"))w = new P3CG();else throw new
             *  Exception("code generator "+cgname+" not supported");
             */
            w.setLogfile(lst);
            if(optimisationlevel >= 0) {
                w.setOptimisationLevel(optimisationlevel);
            }
            w.verbose = verbose;
            FileInputStream         sf                 = new FileInputStream(path + args[0] + ".pas");
            java.io.FileDescriptor  fd                 = sf.getFD();
            if(!fd.valid()) {
                throw new IOException(args[0] + ".pas invalid file");
            }
            // Reader source = new FileReader(fd);//new LowerASCIIFilter(new
            // FileReader(fd));
            Reader                  source             = new InputStreamReader(sf);
            try {
                source = new InputStreamReader(sf, "UTF-8");
            }
            catch(UnsupportedEncodingException ue) {
                System.out.println("utf-8 not supported using ascii");
                source = new InputStreamReader(sf);
            }
            // if (!path.endsWith("/")) path=path+"/";
            PascalCompiler          pascalCompiler     = new PascalCompiler(path, w, source,			args[0] + ".pas");
            pascalCompiler.lex.defineSymbols(defines);
            pascalCompiler.notifier = notifier;
            try {
                // if(intermediateFile)System.out.println("using intermediate file");
                // asm.println(";#compiler version "+PascalCompilerVer.VERSION);
                asm.println(w.directivePrefix() + "include \"" + rtldir + "/"
                            + w.macrofile() + "\"");
                if(verbose) {
                    System.out.print(" " + w.invocations);
                }
                pascalCompiler.compile(asm, intermediateFile, path + args[0]);
                if(verbose) {
                    System.out.print(" " + w.invocations);
                }
                for(int u = 0; u < pascalCompiler.unitsUsed.size(); u++) {
                    asm.println(w.directivePrefix() + "include "
                                + pascalCompiler.unitsUsed.elementAt(u));
                }
                asm.println(w.sectionDirective() + " .data");
                w.reservebytes(256);
                System.out.println("compiled");
                asm.close();
                if(!dontassemble) {
                    if(!w.assemble(asmfile, ofile)) {
                        throw new Exception("assembly failed");
                    }
                    if(!w.link(ofile, outfile)) {
                        throw new Exception("linking failed");
                    }
                }
                lst.close();
            }
            catch(Exception e) {
                lst.close();
                asm.close();
                System.out.println("compilation failed" + e);
                System.out.flush();
                System.exit(-1);
            }
        }
        catch(Exception e) {
            System.out.println(e);
            System.exit(-1);
        }
    }


    /**
     *  Invokes parsing,optimization and code generation, output to PrintWriter asm
     *
     *@param  asm               Assembler file to output
     *@param  intermediateFile  file to write ilcg to
     *@param  module            name of module being compiled
     *@exception  Exception     Description of Exception
     */
    public void compile(PrintWriter asm,
                        boolean intermediateFile,
                        String module)
    throws Exception {
        asmFile = asm;
        processor.notifier = notifier;

        //     System.out.println("Parsing");
        tree = parse();//.eval();
        profprint();
        //	System.out.println("parsed " + module + "\n intermediateFile set to "
        //		 + intermediateFile);
        if(intermediateFile) {
            // System.out.println("using intermediate for ilc ");
            PrintStream  dout  = new PrintStream(new FileOutputStream(module
                                                 + ".ilc"));
            try {
                dout.println("/* Program */\n" + tree.eval());
                dout.close();
                System.out.println("intermediate code in file " + module
                                   + ".ilc");
            }
            catch(Exception e4) {
                System.err.println(e4);
            }
            // dout.close();
            // DataInputStream din = new DataInputStream(new
            // FileInputStream("inter.tre"));
            // tree = Loader.load(din,processor);
        }
        // convert array subscriptions to simple memrefs which the code
        // generator can optimize
        //    System.out.println("optimising");
        tree = optimize(tree);
        processor.setdeadline(120000);
           //   System.out.println("codegenerating");
           //   System.out.println("time budget allowed "+(processor.timeleft()/1000.0)+" seconds");
        codegen(tree, asm, statements);

    }


    /**
     *  Forms the characterset as a string array
     *
     *@return    Description of the Returned Value
     */
    static String[] charset() {
        // returns the chars that are valid
        String[]  cs  = new String[charmax + 1];
        for(int i = 0; i < charmax + 1; i++) {
            cs[i] = "'" + i + "'";
        }
        return cs;
    }

}// end of Pascal compiler
/**
*  Description of the Class
*
*@author     wpc
*@created    10 February 2011
*/
class FunctionFinder extends CommonSubExpressionFinder {


    int  count  = 0;


    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {
        if(n instanceof Function) {
            count++;
        }
    }

}
/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class UndeclaredType extends UndeclaredVariable implements Serializable {


    /**
     *  Constructor for the UndeclaredType object
     *
     *@param  id    Description of Parameter
     *@param  line  Description of Parameter
     */
    public UndeclaredType(String id, int line) {
        super(id, line);
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class UndeclaredVariable extends SyntaxError implements Serializable {


    /**
     *  Constructor for the UndeclaredVariable object
     *
     *@param  s  Description of Parameter
     *@param  i  Description of Parameter
     */
    public UndeclaredVariable(String s, int i) {
        super(s, i);
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return super.toString() + " undeclared variable";
    }


    /**
     *  Gets the id attribute of the UndeclaredVariable object
     *
     *@return    The id value
     */
    String getId() {
        return getMessage();
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class TypeIdError extends Exception {


    Object  value;


    /**
     *  Constructor for the TypeIdError object
     *
     *@param  s    Description of Parameter
     *@param  val  Description of the Parameter
     */
    public TypeIdError(String s, Object val) {
        super(s);
        value = val;
    }


    /**
     *  Gets the id attribute of the TypeIdError object
     *
     *@return    The id value
     */
    String getId() {
        return getMessage();
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class DimensionError extends Exception {


    /**
     *  Constructor for the DimensionError object
     *
     *@param  s  Description of Parameter
     */
    public DimensionError(String s) {
        super(s);
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class LowerASCIIFilter extends PushbackReader {


    /**
     *  Constructor for the LowerASCIIFilter object
     *
     *@param  r  Description of Parameter
     */
    LowerASCIIFilter(Reader r) {
        super(r);
    }


    /**
     *  Description of the Method
     *
     *@return                  Description of the Returned Value
     *@exception  IOException  Description of Exception
     */
    public int read() throws IOException {
        int  i  = super.read();
        // System.out.println(i);
        if(i > 128) {
            i = ' ';
        }
        return i;
    }


    /**
     *  maps upper ascii control chars to space
     *
     *@param  cbuf             Description of Parameter
     *@param  off              Description of Parameter
     *@param  len              Description of Parameter
     *@return                  Description of the Returned Value
     *@exception  IOException  Description of Exception
     */
    public int read(char[] cbuf, int off, int len) throws IOException {
        int  c;
        int  l  = super.read(cbuf, off, len);
        for(int i = 0; i < l; i++) {
            c = cbuf[i + off];
            // System.out.print((char)c);
            if(c > 128 && c < 160) {
                c = ' ';
            }
            cbuf[i + off] = (char) c;
        }
        return l;
    }
}

/**
 *  Used to search for memory references that can be substituted with register
 *  references
 *
 *@author     wpc
 *@created    June 22, 2001
 */

class CommonSubscriptionFinder extends CommonSubExpressionFinder {


    Node    parindex;
    String  parstring;


    /**
     *  Constructor for the CommonSubscriptionFinder object
     *
     *@param  index  Description of the Parameter
     */
    CommonSubscriptionFinder(Node index) {
        parindex = TypeTag.decast(index);
        parstring = parindex.toString();
    }


    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {
        if((n instanceof ArraySubscription)) {
            ArraySubscription  m  = (ArraySubscription) n;
            //System.out.println("look for "+parstring+" in "+m.getLastIndex());
            if(m.getLastIndex().toString().contains(parstring)) {
                record(n);
                record(n);
            }
        }
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    public boolean visit(Node n) {
        return !(n instanceof Memref);
    }

}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class CommonScalarFinder extends CommonSubscriptionFinder {


    /**
     *  Constructor for the CommonScalarFinder object
     *
     *@param  index  Description of the Parameter
     */
    CommonScalarFinder(Node index) {
        super(index);
    }


    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {
        if((n instanceof ArraySubscription)) {
            if(!((ArraySubscription) n).parallelisablewith(parindex)) {
                // record it twice to make it appear as a common sub expression
                record(n);
                record(n);
            }
        }
        else if(n instanceof Memref || n.knownAtCompileTime()) {
            record(n);
            record(n);
        }
    }

}
/**
 *  This class is used to search an expression tree to see if all occurences
 *  of a particulare loop index variable occur as the least significant
 *  array index in all array indexing operation within which the index
 *  occurs. It is useful in telling if a statement can be vectorised.
 *
 *@author     wpc
 *@created    10 February 2011
 */
class nonlasti  implements TreeExaminer {
    boolean fault=false;
    String istring,tstring;
    public nonlasti(String i,String t) {
        istring=i;
        tstring=t;
    }
    public boolean visit(Node n) {
        if(n instanceof Memref) {
            Node index=((Memref)n).index;
            if(index.toString().contains(istring)) {
                suspectdyad d = new suspectdyad(istring,tstring);
                index.examine(d);
                ArrayFinder a=new ArrayFinder();
                // we dont allow vectorisation if we have
                // subscription of array by array
                index.examine(a);
                if(a.getRepeatCount()>=1) {
                    fault=true;
                }
                return false;
            }
            else return false;
        }
        return true;
    }
    public void leave(Node n) {}

    class suspectdyad implements TreeExaminer { // search for any dyad that is a multiplier

        String istring ;
        int tlen;
        public suspectdyad(String i,String tstring) {
            istring=i;
            tlen=Format.lengthInBytes(tstring);
        }
        public void leave(Node n) {}
        public boolean visit(Node n) {
            if(n instanceof Dyad) {
                if(! n .toString().contains(istring)) return false;
                // we have a dyad in an address part of a memref that contains i
                Dyad D = (Dyad)n;
                // if the operator is + or - go down the tree
                String o = D.O.toString();
                if(o.equals("+") || o.equals("-")) return true;
                if(o.equals("*")) {
                    // i is being multiplied by something
                    if(D.left.toString().contains(istring)) {
                        if(!D.right.knownAtCompileTime()) {
                            fault=true;
                            //System.out.println("right arg not known at compile time "+n);
                            return false;// the steping is unsafe
                        }
                        else {
                            Node r = D.right.eval();
                            if(!(r instanceof Number)) {
                                fault=true; // System.out.println("right arg not a number "+n);
                                return false;// the steping is unsafe
                            }
                            else {
                                int step = ((Number)r).intValue();
                                if((step == tlen)) {
                                    // no hazard dont set fault but dont go down tree either
                                    return false;
                                }
                                // otherwise it is dangerous
                                fault=true;//System.out.println("right arg not = "+tlen+"\nin "+n);
                                return false;
                            }
                        }
                    }
                    // we know from the way that trees are evaluated that the constant should be on the right
                    // so if i is on the right it is a danger
                    fault=true;
                    return false;
                }
                // any other operator is dangerous as well
                fault=true;
            }
            return true;
        }
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class CommonCastFinder extends CommonSubExpressionFinder {


    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {
        if(n instanceof Cast) {
            // record it twice to make it appear as a common sub expression
            record(n);
            record(n);
        }
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    public boolean visit(Node n) {
        boolean  res  = !(n instanceof Memref);
        // System.out.println("visit inm"+getClass()+"\n visiting "+n.getClass()+"\n  "+n+"\n->"+res);
        return res;
    }

}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class TreeSearcher implements TreeExaminer {


    Node     findthis;
    boolean  found     = false;


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     *@return    Description of the Return Value
     */
    public boolean visit(Node n) {
        return true;
    }


    /**
     *  Description of the Method
     *
     *@param  n  Description of the Parameter
     */
    public void leave(Node n) {
        if(n.equals(findthis)) {
            found = true;
        }
    }


    /**
     *  Constructor for the TreeSearcher object
     *
     *@param  n  Description of the Parameter
     */
    TreeSearcher(Node n) {
        findthis = n;
    }


    /**
     *  Description of the Method
     *
     *@param  A  Description of the Parameter
     *@param  B  Description of the Parameter
     *@return    Description of the Return Value
     */
    static boolean AcontainsB(Node A, Node B) {
        TreeSearcher  s  = new TreeSearcher(B);
        A.examine(s);
        return s.found;
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class BoolLit extends	Int implements Serializable {


    /**
     *  Constructor for the BoolLit object
     *
     *@param  b  Description of the Parameter
     */
    public BoolLit(boolean b) {
        super((b ? -1 : 0), PascalCompiler.boolrep);
    }

}

// At run time a file is an integer file handle
/**
 *  Description of the Class At run time a file is an integer file handle
 *
 *@author     wpc
 *@created    June 21, 2001
 */
class PascalFileType extends IntegralType implements Serializable {


    Type  elements;


    /**
     *  Constructor for the PascalFileType object
     *
     *@param  t  Description of Parameter
     */
    PascalFileType(Type t) {
        low = -maxint;
        hi = maxint;
        elements = t;
        type = Node.int32;
        size = 4;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Returned Value
     */
    public String toString() {
        return "file of " + elements;
    }


    /**
     *  Gets the elements attribute of the PascalFileType object
     *
     *@return    The elements value
     */
    Type getElements() {
        return elements;
    }
}

/**
 *  Used to search for array references that can be substituted with register
 *  references
 *
 *@author     wpc
 *@created    June 22, 2001
 */

class ArrayFinder extends CommonSubExpressionFinder {


    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {
        if(n instanceof ArraySubscription) {
            record(n);
            record(n);
        }
    }

}



/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class IfFinder extends CommonSubExpressionFinder {


    int  count  = 0;


    /**
     *  This is called after all subtrees have been visited
     *
     *@param  n  Description of Parameter
     */
    public void leave(Node n) {
        if(n instanceof If) {
            count++;
        }
    }

}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class UnitHolder implements Serializable {


    Dictionary  d;
    String      name;


    /**
     *  Constructor for the UnitHolder object
     *
     *@param  dict  Description of the Parameter
     *@param  s     Description of the Parameter
     */
    UnitHolder(Dictionary dict, String s) {
        d = dict;
        name = s;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String toString() {
        return name;
    }
}

/**
 *  Description of the Class
 *
 *@author     wpc
 *@created    10 February 2011
 */
class Undeclared extends Exception {


    /**
     *  Description of the Field
     */
    public int line, cpos      = 0;
    String  unitname  = "<undefined>";


    /**
     *  Constructor for the Undeclared object
     *
     *@param  s     Description of the Parameter
     *@param  Line  Description of the Parameter
     *@param  pos   Description of the Parameter
     *@param  unit  Description of the Parameter
     */
    public Undeclared(String s, int Line, int pos, String unit) {
        super(s);
        line = Line;
        cpos = pos;
        unitname = unit;
    }


    /**
     *  Description of the Method
     *
     *@return    Description of the Return Value
     */
    public String toString() {
        return "\nError " + line + "," + cpos + "[" + unitname + "]\t "
               + getMessage();
    }


    /**
     *  Constructor for the Undeclared object
     *
     *@param  s     Description of the Parameter
     *@param  Line  Description of the Parameter
     */
    public Undeclared(String s, int Line) {
        super(s);
        line = Line;
    }
}
class ClassType extends RecordType implements Serializable {
    Type[] H= {};
    Vector<ForwardProc> vmt = new Vector<ForwardProc>();
    Label vmtlab;
    public boolean derivedfrom(ClassType possibleAncestor) {
        if(equals(possibleAncestor))return true;
        for(Type t:H) {
            if(t instanceof ClassType)
                if(((ClassType)t).derivedfrom(possibleAncestor))return true;
        }
        return false;
    }
    /** This copies all the current fields into the dictionary
     * having changed all of their base addresses so that
     * they are now expressed as offsets from the THIS pointer */
    public         void copyFieldDeclsInto(Dictionary tempClassScope,PascalCompiler C)throws Exception {
        Node thispointer = (Node)C.symbolTable.get("this");
        for(Enumeration K = lookuptable.keys();
                K.hasMoreElements();) {
            String name = (K.nextElement()).toString();
            Object o = lookuptable.get(name);
            if(o instanceof Field) {
                Field f = (Field)o;
                Type t= f.fieldType;
                int offset= f.offset;
                int size = Format.lengthInBytes(t.returnType());
                // create a dummy variable addressed via this
                Variable v = new Variable(size, t, t.returnType(),C.dyad(new Deref(thispointer),new Int(offset),"+"));
                tempClassScope.put(name, v);
            }
        }
    }
    void plantVmt(PascalCompiler C) { // out put the vmt to the data section
        Label[] l= new Label[vmt.size()];
        for(ForwardProc p:vmt)l[p.vmtIndex]=p.start;
        Label [] ancestortablink = {plantancestorTable(C)};
        vmtlab=C.plant(l);
        C.plant(ancestortablink);
    }
    Label plantancestorTable(PascalCompiler C) {
        if(H.length>0) {
            Label []L= {};
            Vector<Label>l=new Vector<Label>();
            int i=0;
            for(Type t:H) {
                if(t != null)
                    if(t instanceof ClassType) {
                        Label p=((ClassType)t).vmtlab;
                        if(p!=null)
                            l.add(p);
                    }
            }
            C.plant(l.toArray(L));
            Node count = new Int(l.size(),"int32");
            Label start = C.plant(count,new Label("ancestorTable"+new Label()));
            return start;
        }
        return C.plant(new Int(0,"int32"),new Label("emtptytable"+new Label()));
    }
    public ClassType(long sizeInBytes, Vector fixed, Type[] heritage, Dictionary d, PascalCompiler C) {
        super((int)sizeInBytes,fixed,new Vector(),d);
        H=heritage;
        if(H==null)
            try {
                C.error("can not pass null heritage list to a class type constructor");
            }
            catch(Exception e) {
                System.out.println(e.toString());
                e.printStackTrace();
            }
        vmt=C.currentVmt;
        plantVmt(C);
        C.currentVmt=new Vector<ForwardProc>();
        //System.out.println("size="+size+" Sizeinbytes="+sizeInBytes);
    }

    // return the class Object
    ClassType(Walker processor, PascalCompiler C) {
        size = processor. getAddressLenInBytes();
        Type[]t= {};
        Dictionary d= new Hashtable();
        Vector v=new Vector();
        fixedpart=v;
        Field l = new Field();
        Type vmttype = new Pointer(C.ANY, processor);
        l.setType(vmttype);
        v.addElement(t);
        (l).setOffset(0);
        variantpart = null;
        d.put("vMt",v);
        lookuptable = d;
        scanLookuptable();
    }
}

