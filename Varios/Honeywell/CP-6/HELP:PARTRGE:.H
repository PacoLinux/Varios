Format: 
!PARTRGE [source][,update] {ON|OVER|INTO} [object][,listing] (opts) 
Parameters: 
source    names the FID of a file from which PARTRGE is to obtain the syntax 
definition nodes.  All PL-6 preprocessor directives are permitted in addition 
to the node definition statements. 
update    names a FID of a file containing updates to the source file.  These 
updates are in the form described in the section on XUU Services, used by all 
CP-6 compilers. 
object    names a FID to be used for the output generated by PARTRGE that can 
be linked with the program that calls the X$PARSE service. 
listing    specifies where the syntax definition nodes and a map of the object 
tree generated by PARTRGE are to be printed. 
opts    lists one or more options separated by commas.  See 
HELP (PARTRGE) OPTIONS or HELP (PARTRGE) OPTIONS opt_name for description of 
these options. 
For information on the elements that may be included within parse nodes, see 
HELP (PARTRGE) P_METALANGUAGE or HELP (PARTRGE) P_METALANGUAGE TOPICS  .  Also 
see the topics LITERALS, SYMBOLS, COMPOUND_FORMS, DELIMITED_STRINGS, 
SYMBOL_SIZE_LIMIT, END_OF_TEXT, SYNTAX_OPERATORS, BLANKS. 
  ************************************************************** 
  *   Copyright, (c) Bull HN Information Systems Inc., 1992 
  ************************************************************** 
The parsing of blanks in text strings is a special mode in X$PARSE; the 
default mode considers one or more blanks as a single delimiter.  This allows 
specification of syntax definitions which do not explicitly handle blanks 
(except where required). 
The symbol .B/LANK is used to describe the occurrence of one or more blanks. 
The default mode causes X$PARSE to automatically skip trailing blanks once a 
syntax node has been matched to the text.  In effect, the parser ignores 
blanks in the text being processed.  To turn this mode off, the user marks the 
particular nodes which should not have blanks skipped after the match.  This 
is done by appending a '-' to the particular element. 
Example 1:  Blank(s) permitted, not required 
LIST = < COMMA, ELEMENT > 
COMMA = ',' 
ELEMENT = .SYMBOL 
Example 2:  Blank(s) required after the comma, permitted (not required) after 
elements 
LIST = < COMMA, ELEMENT > 
COMMA = ',' .BLANK 
ELEMENT = .SYMBOL 
Example 3:  Blank(s) forbidden anywhere 
LIST = < COMMA, ELEMENT > 
COMMA = ','- 
ELEMENT = .SYMBOL- 
The new PARTRGE invocation option [N]PREF has been added.  A new metalanguage 
element 'External reference' has also been added. 
Compound elements can be created by specifying a symbol, the plus sign, and a 
literal. 
NOTE:  Blanks are not permitted on either side of the plus sign. 
Example:  .DECIMAL+'.$' 
          stands for contiguous characters from this set:  0-9 . $ 
Example:  .ALPHA+'0123456789' 
          stands for contiguous characters that are alpha or numeric. 
Two special symbols that are normally used in compound form are explained 
below. 
 .AS/YM    defines an "anti-symbol".  X$PARSE returns as a single string all 
    characters up to, but not including, the first delimiter encountered.  The 
    delimiter characters are specified as a literal following the plus sign. 
    If no delimiter is encountered or .ASYM is used without specifying 
    delimiters, all characters to the end of the input text are returned as a 
    single string.  .ASYM always returns a (possibly null) string. 
 .N/ULL    permits a symbol to be defined by the user.  The permitted 
    characters are specified as a literal following the plus sign.  .NULL may 
    not be used alone. 
PARTRGE.:SYS (PARse TRee GEnerator) is a tool to facilitate creation of the 
syntax definition tree (i.e., parse nodes) specified in a call to library 
services such as XUG$GETCMD, XUR$GETCMD, or X$PARSE.    PARTRGE accepts source 
and update files containing a metalanguage syntax tree definition, and 
produces an object unit.  The object unit produced by PARTRGE may be LINKed 
into a program which calls the X$PARSE library service, directly or 
indirectly. 
PARTRGE reads the metalanguage source and updates through the standard DCBs 
M$SI and M$UI, and produces its output through the standard DCBs M$OU and 
M$LO.  These DCBs may be assigned either via the standard CP-6 processor 
invocation syntax or via !SET commands. 
For further information, enter one of the following: 
!HELP (PARTRGE) TOPICS 
!HELP (PARTRGE) OPTIONS 
!HELP (PARTRGE) NODE 
!HELP (PARTRGE) P_METALANGUAGE 
HELP is also available for the Parser by typing: 
!HELP (HOSTLIB) X$PARSE 
For complete information on X$PARSE and PARTRGE, see the CP-6 Host Library 
Services Reference Manual. 
PARTRGE makes use of the standard PL-6 preprocessor (for more information, 
type:  HELP (PL6) PREPROCESSOR).  Refer to this HELP topic for a description 
of the capabilities of the preprocessor (%MACROs, %EQUates, system files, and 
so forth). 
Delimited strings define symbols that begin and end with a special character. 
PARTRGE provides symbols for two types of delimited strings: 
 .Q/UOTE    defines a string beginning and ending with a single quotation 
    mark.  If a quotation mark is part of the string, it is indicated by a 
    double occurrence. 
       Example:  'DON''T' in the input text will be returned as DON'T 
 .SL/ASH    defines a string beginning and ending with a slash.  A double 
    occurrence of a slash denotes a single occurrence within the string. 
Provision is also made for user definition of delimited strings: 
 .DS/TRING    defines a string delimiter.  .DSTRING is usually followed by the 
    plus sign and the literal delimiter; if it is not, then any printable, 
    non-alphanumeric ASCII character may be used (at the user's choice) as the 
    delimiter. 
       Examples:  .QUOTE = .DSTRING+'''' 
                  .SLASH = .DSTRING+'/' 
The optional .E/ND symbol specifies that command text must exactly match the 
syntax definition.  Extraneous trailing text characters cause X$PARSE to 
return an error code. 
Example:  A_CMD = 'A' '=' .DECIMAL .END 
              The text A=7, B=9 is not considered a match for 
              the node called A_CMD. 
NOTE:  Comments and trailing blanks are treated as non-existent when the text 
is evaluated by X$PARSE. 
If a node definition is coded without the .END symbol, a text line which 
exactly matches a valid syntax definition can be parsed successfully even 
though there is additional text in the buffer; the additional text is ignored 
by X$PARSE. 
Example:  A_CMD = 'A' '=' .DECIMAL 
              The text A=7, B=9 is considered a match for 
              the node called A_CMD. 
A node that is defined in another compilation unit can be explicitly defined 
as being external with the optional .EX/TERNAL symbol.  If this is used, it 
must comprise the entire definition of the node in this module; the actual 
node definition and options are supplied at link time from the module where 
the node is actually defined. 
Examples:  OTHERNODE = .EXTERNAL      /* legal usage */ 
               SOMENODE (DEF) = .EXTERNAL /* not legal; contains options */ 
               BADNODE = (.EXTERNAL|.END) /* not legal; used in definition */ 
    By default, a reference to a node not defined in the current compile unit 
    is also treated as an external reference, but such references are 
    specially marked as PREFs, and their presence will cause the compilation 
    to return an error in STEPCC if the NPREF invocation is specified.  The 
    .EXTERNAL symbol provides a way to make external references in a module 
    compiled with the NPREF option. 
B 
  Blanks - 
      HELP BLANKS 
C 
  Compound Forms - 
      HELP COMPOUND_FORMS 
D 
  Delimited Strings - 
      HELP DELIMITED_STRINGS 
E 
  End of Text - 
      HELP END_OF_TEXT 
  External reference - 
      HELP EXTERNAL_REFERENCE 
L 
  Literals - 
      HELP LITERALS 
N 
  Node Definition Statement - 
      HELP NODE 
P 
  PARTRGE Metalanguage - 
      HELP P_METALANGUAGE 
S 
  Symbol Size Limitation - 
      HELP SYMBOL_SIZE_LIMIT 
  Symbols - 
      HELP SYMBOLS 
  Syntax Operators - 
      HELP SYNTAX_OPERATORS 
00001
00002
00003
00004
00005
00006
00007
HELP_INDEX
Literals are enclosed in single quotation marks.  Abbreviations are defined 
within the quote string by a slash (/) following the last required character. 
NOTE:  If a slash or single quotation mark is desired, it must be repeated, as 
in EDIT (e.g., 'A//B' for A/B). 
Example:  'ACC/ESS' 
          which is recognized as the literal ACC, ACCE, ACCES, or ACCESS 
X$PARSE finds a match to an alphabetic literal for either upper-case or 
lower-case alphabetic characters.  For instance, the text input acc is a match 
for 'ACC/ESS'. 
To define a literal for an exact match, the first character of the quote 
string must be an equals sign.  (The equals sign is not considered part of the 
literal.) 
Example:  '=AlPha' 
          which represents the literal AlPha, but not ALPHA or alpha. 
Non-printable characters may be represented within the quote string by the 
number sign followed by a 3-digit octal number.  (If '#' is not followed by 
three octal digits, it is considered an actual ASCII # character.) 
Example:  '#015#012' 
          stands for the ASCII codes for carriage return and line feed. 
CHANGES
Format: 
nodename [([output_code] [option_list])] = ... 
Parameters: 
nodename    is a 1 to 63 character name composed of alphanumeric characters 
and $ _ # @. 
output_code    is a numeric identifier which is returned to the user by 
X$PARSE.  Output_code is generally a name for which the user supplies a 
corresponding decimal code in a separate INCLUDE file presented to PARTRGE. 
The run unit which calls X$PARSE can use the same INCLUDE file when analyzing 
the codes returned in the output tree.  Output codes are returned in the 
structure OUT$BLK (generated via the PARSE$OUT macro) and the OUT$SYM 
(generated via the PARSE$SYM macro).  A pointer in the Parse Control Block 
gives the user access to these blocks. 
option_list    specifies one or more of the following: 
NOTE:  The slash is not a part of the following option names, but indicates 
the abbreviated forms allowed.  For example, N/OOUT can be coded N, NO, NOO, 
NOOU, or NOOUT. 
    {N/OOUT|O/UT}    requests exceptions to the usual parser output.  NOOUT 
    specifies that no output block is to be generated for the node even though 
    an output_code is specified (for identification purposes, perhaps).  OUT 
    specifies that an output block is to be generated even though an output 
    code is not specified for this node. 
    L/IT = n    requests PARTRGE to automatically assign output codes to 
    literals consisting of more than one character (e.g.,'A1' but not 'A') 
    defined in the statement.  The codes are assigned sequentially to a 
    maximum of 1023 beginning with the decimal number specified by n. 
    NOTE:  Inserting a new literal into a node defined with the L/IT = n 
    option throws off the codes which follow.  Thus the program calling 
    X$PARSE must be modified to match any code changes. 
    RTEXT    requests that instead of building subblocks for this node, that 
    the portion of text defined be returned intact (with no editing or case 
    conversion).  When RTEXT is specified, the text is stored in OUT$SYM.TEXT. 
    MAKEUC    if specified for a node of any symbolic or string type, requests 
    that the text of the symbol or string is to be converted to upper-case in 
    the OUT$SYM block. 
    P/RE    requests that the user receive control at the user routine 
    previous to parsing of a node. 
    S/UCC    requests that the user receive control at the user routine after 
    successful parsing of a node. 
    F/AIL    requests that the user receive control at the user routine after 
    failure to successfully parse a node. 
    D/EF    generates a SYMDEF to nodename in the object unit it produces. 
 ....    represents the metalanguage elements that define command syntax. 
These elements are summarized in topic METALANGUAGE.  The typical node 
definition includes a number of subnode names.  These names are usually 
defined immediately following the statement where they are first used; 
thereafter a name may be used within the same file without redefinition. 
Example: 
ROOTNODE = ... 
NODE_1 (NODE1) = .... 
NODE_2 (NODE2, NO) = .... 
NODE_3 (NODE3, LIT = 4) = .... 
The user defines the output codes that correspond to NODE1, NODE2, and NODE3 
in a separate INCLUDE file.  In the example of NODE_3, literals defined by 
this statement are numbered starting with the output code 4. 
Usage Notes: 
1.  In lists, null elements are not recognized by X$PARSE.  No output block is 
    returned for null elements or any text which follows the null element. 
2.  Optional alternatives are always successfully matched by X$PARSE.  Any 
    time an optional alternative is coded, define it as the last alternative 
    in the list.  Or, preferably, revise the syntax definition by coding 
    square brackets outside the parentheses defining a set of alternatives. 
3.  If two or more branches of the syntax definition tree begin with the same 
    node, present the longest branch first. 
    Example:  COMMAND = (AB_CMD | A_CMD) 
              AB_CMD = 'A' 'B' .SYMBOL 
              A_CMD = 'A' .SYMBOL 
                If the node definitions are parsed using COMMAND as the root 
                node, parsing of the string 'ABXYZ' results in a match with 
                AB_CMD.  (Presenting the nodes in reverse order would result 
                in a match of 'ABXYZ' with A_CMD.) 
4.  Left-side recursion is not permitted in node definitions. That is, an 
    element defined as the node name must not be the left-most element in the 
    syntax definition, either explicitly or implicitly.  An example of direct 
    left recursion is shown below. 
       Wrong:  NODE_A = NODE_A NODE_B 
       Acceptable:  NODE_A = NODE_B NODE_A 
    Indirect left-side recursion must also be avoided. 
       Wrong:  NODE_A = NODE_B NODE_C 
               NODE_C = NODE_D NODE_E 
               NODE_D = NODE_A NODE_F 
       Acceptable:   NODE_A = NODE_B NODE_C 
                     NODE_C = NODE_E NODE_D 
                     NODE_D = NODE_F NODE_A 
5.  For notational purposes, the slash is the only special character used in 
    the discussion of the metalanguage.  The slash denotes an optional portion 
    of a metalanguage element.  For example, the metalanguage symbol .B/LANK 
    means that the element can be coded in any of these forms: 
       .B 
       .BL 
       .BLA 
       .BLAN 
       .BLANK 
    NOTE:  The slash is also used by the metalanguage to define abbreviation. 
    Metalanguage elements such as symbols, node names, and literals must be 
    separated by one or more blanks, except in the special case of compound 
    forms.  The use of blanks with syntax operators should conform to the 
    specific requirements stated or to the examples shown. 
6.  The semi-colon at the end of a line is used to indicate continuation of a 
    syntax definition.  Comments included in the syntax definitions are 
    enclosed in slash, asterisk and asterisk, slash characters (/*...*/), the 
    same conventions used in PL-6. 
7.  Code multiple root nodes if performance is critical.  For example, a root 
    node is defined containing all command names for IBEX.  Separate root 
    nodes are defined for individual commands or groups of commands.  X$PARSE 
    is called first specifying the root node of IBEX command names and again 
    specifying the root node for the particular command syntax. 
00002
00001
00003
To obtain HELP messages for these options, enter 
!HELP (PARTRGE) OPTIONS opt_name 
opt_name may be any of the following: 
BC, NCSYS, NLS, NLU, NMAP, NOPTUI, NOU, NSCHEMA, NSYS, NUI, NXREF, SRCH. 
Descriptions are in tabular format with two columns, as follows: 
  Option    Description 
  BC(n1,n2,n3,...) 
            Batch Compile only the specified ECUs (External Compile Units).  A 
            PARTRGE source file may contain up to 99 ECUs, separated by 
            "%EOD;" statements.  Use of the BC option will cause PARTRGE to 
            translate only the specified ECUs (the first being #1, the second 
            being #2, etc.).  Default is to translate all ECUs. 
  [N]CSYS 
            Create a new preprocessor system file through the M$SYSTEM DCB. 
            Use of CSYS implies NSYS.  Default is NCSYS. 
  [N]LS 
            Produce a source listing.  Defaults to LS if a "listing" FID was 
            provided as part of the invocation, or to NLS otherwise. 
  [N]LU 
            If LS is also specified (or implied), list all of the plus-card 
            updates (if any) at the beginning of the LS listing.  Default is 
            NLU. 
  [N]MAP 
            Produce a map of all symbols defined or used.  Default is NMAP. 
  [N]OPTUI 
            Use "optional" updates.  If M$UI is assigned to a file which 
            exists, OPTUI implies UI; if M$UI is not assigned to a file which 
            exists, OPTUI implies NUI.  Default is NOPTUI. 
  [N]OU 
            Produce an object unit file through M$OU, containing the 
            translated parse tree(s).  Defaults to OU, unless the IBEX command 
            !DONT OUTPUT has been issued. 
  [N]PREF 
            Accept references to undefined nodes as external references. 
            NPREF sets STEPCC to indicate an error if any undefined nodes are 
            referenced.  The default is PREF. 
  [N]SCHEMA 
            Causes PARTRGE to generate debug-schema entries for each named 
            node within each ECU.  The fields within each node are named and 
            formatted according to the structures and documentation contained 
            in the %INCLUDE file XU_MACRO_C.:LIBRARY, and may be examined 
            under DELTA via the following sequence of commands: 
                !START rununit UNDER DELTA 
                >SCHEMA first_node_name_in_ECU 
                >DISPLAY nodename.fieldname 
            The default for this option is SCHEMA. 
  NSYS 
            Do not attempt to use any system file which may be available 
            through the M$SYSTEM DCB.  Default is not(NSYS). 
  [N]UI 
            Read plus-card updates through the M$UI DCB.  Default is UI if an 
            "update" FID was provided as part of the command invocation, NUI 
            otherwise. 
  [N]XREF 
            Produce a cross-reference listing.  Default is NXREF. 
  SRCH(fid,fid,...) 
            Search each fid (i.e., account and optionally a packset and/or 
            password) for any files %INCLUDE'd by the metalanguage 
            description.  Accounts are searched from left to right until the 
            file is found; the user's file management account and the :LIBRARY 
            account will also be searched (in that order) if an %INCLUDE'd 
            file is not found in any specified SRCH account, or if the SRCH 
            option is not specified. 
00001
00002
00003
00004
00005
00006
00007
00008
00009
00010
00011
00012
00013
To obtain HELP messages for these options, enter 
!HELP (PARTRGE) P_METALANGUAGE element 
element may be any of the following: 
SYMBOLS, LITERALS, COMPOUND_FORMS, CONCATENATION, ALTERNATIVES, 
REDUCING_ALTERNATIVES, OPTIONALITY, LISTS, OPTIONAL_BLANKS, REPETITION, 
REQUIRED_BLANKS, END_OF_TEXT. 
Descriptions are in tabular format with two columns, as follows: 
  Element   Meaning 
  Symbols 
            Symbols are distinguished by a leading period and a keyword: 
             .OCTAL 
             .DECIMAL 
             .HEX 
             .ALPHA 
             .ANUM 
             .SYMBOL 
             .PL6SYM 
             .ASYM 
             .NULL 
             .FID 
             .ACCOUNT 
             .JOBNAME 
             .QUOTE 
             .SLASH 
             .DSTRING 
            They may be followed by a number from 1 to 511 to limit the size 
            of the text element. 
  Literals 
            Literals are enclosed in single quotation marks: 
            'literal' 
            Including the equals sign as the first character before a literal 
            means that the text input must match the literal exactly.  For 
            example, the use of upper-case and lower-case letters must be 
            identical. 
            '=literal' 
            Note that if the literal is two or more characters long and the 
            first character is the equals sign, then the literal should begin 
            with two "=" (e.g., '==<' for the literal =<). 
            Specifying the # character before 3-digit octal numbers represents 
            non-printable literals: 
            '#nnn#nnn' 
            The slash defines the shortest acceptable abbreviation for a 
            symbol.  Any portion of the string is acceptable if it includes 
            the characters to the left of the slash: 
            'l/iteral' 
  Compound forms 
            Compound forms consist of a symbol, the plus sign, and a literal 
            to define the extended set of characters permitted in an element 
            of text: 
             .symbol+'literal' 
            Certain symbols can only be used in compound form: 
             .NULL 
  Concatenation 
            Concatenation is represented by combining the elements in the 
            required sequence with intervening blanks. 
  Alternatives 
            Alternative elements are enclosed in parentheses and separated by 
            a vertical bar: 
            (element|element|element) 
  Reducing Alternatives 
            Reducing alternatives, that is, one-time elements, are enclosed in 
            braces and separated by a vertical bar. 
            {element|element} 
  Optionality 
            Optional elements are enclosed in square brackets.  Refer to the 
            detailed explanation for a caution on optional alternatives. 
            [element(s)] 
  Lists 
            Lists are enclosed in < > and contain the separator, a comma, and 
            an element: 
            <separator,listelement> 
  Optional blanks 
            The forms shown above specify "skip trailing blanks" by default. 
            To override the "skip trailing blanks" flag, use the following 
            form: 
            element- 
  Repetition 
            Occurrences of repetition are represented by enclosing asterisks: 
            *element* 
  Required blanks 
            The .BLANK symbol specifies required blanks (one or more). 
  End of text 
            The .END symbol specifies that input must exactly match the syntax 
            definition.  Extraneous trailing text is a syntax error. 
  External reference 
            The .EXTERNAL symbol specifies that a node is defined in a 
            different compilation unit. 
00005
00003
00004
00012
00013
00008
00002
00007
00009
00006
00010
00011
00001
Symbols describe the occurrence of a contiguous set of characters, each a 
member of a particular character set.  They are preceded by a leading period. 
The most frequently used symbols are listed below.  Additional symbols are 
described under the headings Compound Forms and Delimited Strings. 
 .O/CTAL    describes the occurrence of one or more contiguous octal digits 
    (0-7). 
 .D/ECIMAL    describes the occurrence of one or more contiguous decimal 
    digits (0-9). 
 .HEX    describes the occurrence of one or more contiguous hexadecimal digits 
    (0-9, A-F). 
 .AL/PHA    describes a contiguous set of characters which are all letters, 
    either upper-case or lower-case. 
 .AN/UM    describes the occurrence of one or more contiguous characters drawn 
    from the set of characters defined by .ALPHA and .DECIMAL.  At least one 
    character in the string must be alphabetic. 
    NOTE:  See "Compound Forms" for an example of how to specify the 
    occurrence of contiguous characters that contain alphanumeric data (and 
    may contain all numerics). 
 .S/YMBOL    describes the set of characters which consists of the .ANUM set 
    plus the following: 
    $ _ # @ 
    At least one character in the string must be non-numeric. 
 .F/ID    describes the set of characters which constitute a valid CP-6 FID. 
    The set consists of valid .SYMBOL characters plus the following: 
    _ - . / * ? : 
    and single-quote strings. The intent of the FID symbol is to acquire a 
    string of characters which may then be passed to the M$FID monitor service 
    for further processing. 
 .ACC/OUNT    describes the set of characters which constitute a valid account 
    name.  The set consists of any combination of upper- and lower-case 
    letters, digits, plus any of the following: 
    $ _ - ? : * 
    The first character need not be alphabetic.  It may also be a quoted 
    string identical to that accepted by .FID. 
 .JOB/NAME    describes the set of characters which are valid for job names. 
    The set consists of any combination of upper- and lower-case letters, 
    digits, plus any of the following: 
    $ _ - : * 
    The first character must not be a digit. 
 .P/L6SYM describes the set of characters which are valid PL-6 identifiers. 
    This set consists of upper-case and lower-case letters, numbers, and $ _ # 
    @ .  The first must be a letter. 
The maximum size of any symbol element may be specified by following the 
symbol keyword with a decimal number between 1 and 511.  Blanks are not 
permitted before the number; compound forms follow the number. 
   Examples:  .DEC3 
              describes a decimal string limited to 3 
              or fewer digits. 
               .DSTR6+':' 
              describes a string delimited by ':' 
              and containing no more than 6 characters. 
              (For example, :ABC::DE: is accepted since 
              the '::' represents a single character.) 
    Syntax operators are metalanguage elements that express relationship.  The 
    various relationships are described below. 
o   Concatenation -- combining elements in a specific order -- is represented 
    by simply placing items in the required sequence with intervening blanks. 
    Example:  'BATCH' .B FIDLIST 
              means that the command begins with BATCH which must be followed 
              by one or more blanks and then elements that correspond to the 
              subnode FIDLIST. 
              Example:  A_CMD = 'A' '=' .DECIMAL 
              specifies that a node contains items in this order:  the literal 
              A, the literal =, and one or more contiguous decimal digits. 
o   Lists are composed of groups of elements connected by separators.  Lists 
    are represented by the general form: 
    <separator,listelement> 
    Null elements in a list are not recognized by X$PARSE. 
    Example:  <',',.DEC> 
              causes X$PARSE to consider the text 1,2 to be a 2-element list 
              containing 1 and 2. 
o   Alternatives are elements any one of which is considered a match to the 
    command syntax.  Alternatives are represented by enclosing them in 
    parentheses with a vertical bar separating each alternative. 
    Example:  YES_ON = ('YES' | 'ON') 
    defines YES and ON as literals which have interchangeable meaning within 
    the command language being defined. 
    DISPLAYOPT = (DALL | DDDCBS | DFLAG | DUSER ....) 
    defines a number of possible alternatives which may occur in command text 
    but do not have interchangeable meaning. 
o   Repetition is represented by enclosing asterisks. 
    Example:  BINARY (n) = *DIGIT* 
              DIGIT = (ZERO|ONE) 
              ZERO (0) = '0' 
              ONE (1) = '1' 
o   Reducing alternatives are elements, each of which may be be specified only 
    once.  Reduction is represented by enclosing alternatives in braces with a 
    vertical bar separating the alternatives. 
    Example:  {'ALL'|'NONE'} 
              assuming these alternatives are part of a list, means that ALL 
              can be specified only once. 
    A reducing alternative node must be a subnode of either a list node or a 
    repeat node in order for any effect to occur.  The effect is also 
    restarted for each such list or repeat node. 
    Example:  RED = {'A'|'B'} is the reducing node. 
                   Case 1:  RED 'OR' RED permits: 
                                 'A OR A', 'A OR B', 'B OR A', 'B OR B' 
                   Case 2:  <'OR',RED> permits: 
                                 'A', 'B', 'A OR B', 'B OR A' 
                   Case 3:  *RED 'OR' RED* 
                                 'A OR B', 'B OR A' 
                   Case 4:  *RED* 'OR' *RED* permits: 
                                 'A OR A', 'A OR AB', 'A OR B', 'A OR BA' 
                                 'AB OR A', 'AB OR AB', 'AB OR B', 'AB OR 
                                 BA' 'B OR A', 'B OR AB', 'B OR B', 'B OR 
                                 BA' 'BA OR A', 'BA OR AB', 'BA OR B', 
                                 'BA OR BA' 
o   Optionality is represented by enclosing square brackets.  Optionality 
    implies that the node is always successfully matched by X$PARSE.  This is 
    particularly important when used with alternatives. X$PARSE will match the 
    first optional alternative whether the text string matches that exact node 
    definition or not. Thus, anytime any optional alternative is used, define 
    it as the last alternative in the list.  As a general rule, it is 
    preferable to code square brackets outside the parentheses defining a set 
    of alternatives. 
    Example:  MINUTES (LIM_MINUTS) = .DECIMAL [':' .DECIMAL] 
              means that minutes can be expressed as 
              contiguous decimal digits only, or as contiguous 
              decimal digits, a colon, and additional contiguous 
              decimal digits. 
    An optional node produces output block(s) only if the text matches the 
    node definition. 
