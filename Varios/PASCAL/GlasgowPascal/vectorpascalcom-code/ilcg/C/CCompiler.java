package ilcg.C;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.*;
import org.antlr.v4.runtime.ParserRuleContext;
import ilcg.*;
import ilcg.tree.*;
import java.util.*;

import java.util.zip.*;
import java.io.*;
class CerrorListener extends BaseErrorListener {
    public void syntaxError(Recognizer<?, ?> recognizer,
                            Object offendingSymbol,
                            int line,
                            int charPositionInLine,
                            String msg,
                            RecognitionException e) {
        System.err.println("Fatal syntax error "+line+":"+charPositionInLine+" "+msg);
        System.exit(-1);
        }
    }
public class CCompiler extends CBaseListener {
    // shared variables of the compiler
    CParser parser;
    int enumcount = 0;
    int tasks=1;// num parallel threads used
    int maxrank = 0, iotalevel = 0, reductlevel = 0, assrank = 0, maxass = 0, subscriptnest = -1;
    Node one = new ilcg.tree.Integer(1, "int32");
    Node[] sectionlengths = {null, null, null, null, null, null };
    Vector<Node>initvec = new Vector<Node>();
    Node[] sectionsteps = {one, one, one, one, one, one, one };
    SymbolTable  symbolTable           = new SymbolTable(new Hashtable());
    int lexicalLev = 0; // 0 = global,1 = in a procedure
    int lineno, charno; // position in source
    int names = 1; // system generated name count
    String currentfn = "";
    Set<Label>used = new HashSet<Label>();
    int structnest = 0; // degree of nesting within structures of a declaration
    Stack< Node> transStack = new Stack< Node> ();
    Stack<Node> reductions = new Stack<Node>();
    Stack<Short>reductionlevels = new Stack<Short>();
    Stack tempStack = new Stack();
    Stack <Label>exits = new Stack<Label>();
    Stack <Hashtable<java.lang.Integer,Label>> switches = new Stack<Hashtable<java.lang.Integer,Label>>();
    Stack <Label> continuations = new Stack<Label>();
    Stack <Label> defaults = new Stack<Label>();
    Stack <Label> breaks = new Stack<Label>();
    Stack<LocalStoreAllocator>  allocatorStack        = new Stack<LocalStoreAllocator> ();
    //  Stack <structure> structContext = new Stack<structure>();
    SymbolTable revt = new SymbolTable(new Hashtable());
    Walker processor;
    Node [] bases;
    static String sourceName;
    Type ADDRESS, BOOLEAN, REAL, BYTE, LONG, INTEGER, SHORT, INT8, DOUBLE, FLOAT, VOID,charpntr;
    // -------- details of structures
    class Field {
        Field(Type t, int offset) {
            fieldType = t;
            fieldOffset = offset;
            }
        boolean equals(Field f2) {
            return fieldType.equals(f2.fieldType);
            }
        Type fieldType;
        int recursion =0; // to prevent recursion on structs
        // which contain pointers to themselves
        public String toString() {
            String s="int *";
            recursion ++;
            if(recursion<3) {
                s= fieldType.toString();
                }
            recursion --;
            return s;

            }
        int fieldOffset;
        }
    class structure extends Type {
        Vector<String> fieldNames = new Vector<String>();
        Hashtable<String, Field> index = new Hashtable<String, Field>();
        int length = 0; // lenth in bytes
        String name;
        boolean isunion = false;
        structure() {
            if(processor.verbose) {
                System.out.print("structure type initialising call to setType ");
                }
            setType();// this will be the wrong type but it will not be null
            }
        String fieldlist() {
            String s = "";
            for(String f : fieldNames) {
                s += (" " + index.get(f) + " " + f + "; ");
                }
            return s;
            }
        void recomputeoffsets() {
            if(processor.verbose) {
                System.out.print("recomputeoffsets ");
                }

            int i = 0;
            for(int j=1; j<3; j++)
                for(String nom : fieldNames) {
                    Field f = index.get(nom);
                    Type finalt = (Type)symbolTable.get(nom);
                    f.fieldType = finalt;
                    f.fieldOffset = i;
                    if(processor.verbose) {
                        System.out.println("field "+nom+" reset to type "+finalt+" rep "+finalt.codeGenRepresentation(processor)+
                                           " f.fieldType.type "+f.fieldType.type+"\n own type ="+type);
                        }
                    i += Format.lengthInBytes(finalt.codeGenRepresentation(processor));
                    setType();
                    if(f.fieldType instanceof Ref) {
                        ((Ref)f.fieldType).type = "ref "+((Ref)f.fieldType).pointsTo.returnType();    // handle recursive pointers to self
                        }
                    }
            }
        boolean addField(String id, Type t) {
            if(index.contains(id)) {
                return false;
                }
            fieldNames.add(id);
            int size = Format.lengthInBytes(t.codeGenRepresentation(processor));
            int align = 0;
            int chunk = 1;
            switch(size) {
                case(1):
                    chunk = 1;
                    break;
                case(2):
                    chunk = 2;
                    break;
                case(3):
                case(4):
                    chunk = 4;
                    break;
                case(5):
                case(6):
                case(7):
                case(8):
                    chunk = 8;
                    break;
                default:
                    if(size > 8) {
                        chunk = 8;
                        }
                }
            align = chunk - (length % chunk);
            if((length % chunk) == 0) {
                align = 0;
                }
            //   System.out.println(id+" chunk="+chunk+" length="+length+" align="+align+" size="+size);
            if(!isunion) {
                length += align;
                }
            index.put(id, new Field(t, (isunion ? 0 : length)));
            if(!isunion) {
                length += size;
                }
            else {
                length = (size > length ? size : length);
                }
            return true;
            }
        public  long sizeOf(Walker processor) {
            return length;
            }
        public void setType() {
            type =  Format. makeVectorType(Node.int8,  length); //toString();
            if(processor.verbose)System.out.println("setType of "+
                                                        toString()+ "to "+type);
            }
        public  boolean equals(Type t) {
            if(!(t instanceof structure)) {
                return false;
                }
            int i;
            structure s = (structure)t;
            if(s.fieldNames.size() != fieldNames.size()) {
                return false;
                }
            if(s.toString().equals(toString())) {
                return true;
                }
            for(i = 0; i < fieldNames.size(); i++) {
                String n1 = fieldNames.elementAt(i);
                String n2 = s.fieldNames.elementAt(i);
                if(! n1.equals(n2)) {
                    return false;
                    }
                Field f1 = index.get(n1);
                Field f2 = s.index.get(n1);
                if(!f1.equals(f2)) {
                    return false;
                    }
                }
            return true;
            }
        public String codeGenRepresentation(Walker processor) {
            return Format.makeVectorType("int8", length);
            }
        public Node modify(TreeModifier m) {
            if(m.visit(this)) {
                return  m.modified(this);
                }
            return this;
            }
        public void toBinary(DataOutputStream out) throws IOException {
            throw new IOException("toBinary unimplemented in " + this);
            }
        public String toString() {
            return "struct{" + fieldlist() + "}";
            }
        }

    public void exitStructtypedecl(@NotNull CParser.StructtypedeclContext ctx) {
        String id = ctx.Identifier().getText();
        //if(verbose) System.out.println("exitStructtypedecl "+id+":"+ symbolTable.get(id));
        }
    public void enterStructtypedecl(@NotNull CParser.StructtypedeclContext ctx) {
        String id = ctx.Identifier().getText();
        try {
            Object o =  symbolTable.get(id) ;
            if(processor.verbose) {
                System.out.print("enterstructtypedecl "+id+" ");
                }
            structure s = new structure();
            if(!(o == null)) {
                //throw new Exception(id+ " already declared ");
                if(o instanceof structure) {
                    s = (structure)o;
                    }
                else {
                    throw new Exception(id + " already declared as non struct");
                    }
                }
            s.isunion = ctx.structOrUnion().getText().equals("union");
            specifiers.beingDeclared = s;
            specifiers.basetypeName = id;
            symbolTable.put(id, s);
            //System.out.println("symboltable.put ("+id+","+s+")");
            }
        catch(Exception e) {
            quit("in structorunionspecifier ", e, ctx);
            }
        }
    public void enterAnonymousstruct(@NotNull CParser.AnonymousstructContext ctx) {
        try {
            if(processor.verbose) {
                System.out.print("enterAnonymousstruct ");
                }
            structure s = new structure();
            s.isunion = ctx.structOrUnion().getText().equals("union");
            specifiers.beingDeclared = s;
            specifiers.basetypeName = ctx.getText();

            symbolTable.put(specifiers.basetypeName, s);
            //  System.out.println("symboltable.put ("+specifiers.basetypeName+","+s+")");

            }
        catch(Exception e) {
            quit("in anonymous structure specifier ", e, ctx);
            }
        }
    public void enterStructBody(@NotNull CParser.StructBodyContext ctx) {
        saveSpecifiers();
        structnest++;
        specifiers = new Specifiers();
        symbolTable.enterScope();
        }

    void declarefield(String id, Type t)throws Exception {
        structure s = (structure)specifierstack.peek().beingDeclared;
        symbolTable.put(id, t);
        if(!s.addField(id, t)) {
            throw new Exception("can not declare field " + id);
            }
        }
    public void exitStructBody(@NotNull CParser.StructBodyContext ctx) {
        structure s = (structure)specifierstack.peek().beingDeclared;
        s. recomputeoffsets();// because the array sizes not know when we call declare field
        restoreSpecifiers();
        if(processor.verbose) {
            System.out.println("exit struct body ");
            }
        ((structure)specifiers.beingDeclared).setType();
        structnest--;
        symbolTable.leaveScope();
        }
    public void enterStructref(@NotNull CParser.StructrefContext ctx) {
        String id = ctx.Identifier().getText();
        try {
            Object o =  symbolTable.get(id) ;
            if(!(o instanceof structure)) { //throw new Exception(id+ " not a struct or union "+o);
                if(processor.verbose) {
                    System.out.print("enterstructref ");
                    }
                o = new structure();
                symbolTable.put(id,o);
                }
            structure s = (structure)o;
            specifiers.beingDeclared = s;
            specifiers.basetypeName = id;
            }
        catch(Exception e) {
            quit("in struct reference ", e, ctx);
            }
        }


    public void enterStructDeclaration(CParser.StructDeclarationContext ctx) {
        specifiers. clearSpecifiers();
        }
    // ------------- enumerations

    public void enterEnumspec(@NotNull CParser.EnumspecContext ctx) {
        enumcount = 0;
        }
    public void enterStdenum(@NotNull CParser.StdenumContext ctx) {
        symbolTable.put(ctx.getText(), new ilcg.tree.Int(enumcount));
        enumcount++;
        }
    public void exitSpecenum(@NotNull CParser.SpecenumContext ctx) {
        Node v = popexp();
        symbolTable.put(ctx.enumerationConstant().getText(), v);
        if(!v.knownAtCompileTime()) {
            quit("enumerationConstant not known at compile time", new Exception("non constant expression "), ctx);
            }
        }
    //--------- flags for type declaration


    class Specifiers implements Cloneable {

        boolean isStatic, isRegister, isTypedef, isExtern, isAuto, isFndef, isSigned = true;
        String basetypeName = "void", fndeclName = "", procargString = "", declarator;
        int initfield = 0;
        Type beingDeclared = VOID;
        void print() {
            System.out.println(toString());
            }
        public String toString() {
            String s = "";
            if(isFndef) {
                s += "func ";
                }
            if(isStatic) {
                s += " static ";
                }
            if(isRegister) {
                s += " rygister ";
                }
            if(isTypedef) {
                s += "typedef ";
                }
            if(isAuto) {
                s += " auto ";
                }
            if(isExtern) {
                s += " extern ";
                }
            if(isSigned) {
                s += " signed ";
                }
            s += (basetypeName) + " " + fndeclName + ":" + beingDeclared;
            return s;
            }

        void clearSpecifiers() {
            //System.out.println("clear specifiers");
            isFndef = isStatic = isRegister = isTypedef = isAuto = isExtern = false;
            isSigned = true;
            beingDeclared = VOID;
            basetypeName = "void";
            }
        public Specifiers clone() throws CloneNotSupportedException {
            return (Specifiers) super.clone();
            }
        }
    Specifiers specifiers = new Specifiers();
    Stack<Specifiers>specifierstack = new Stack<Specifiers>();
    void saveSpecifiers() {
        //System.out.println("<<<<Save specifiers" + specifiers);
        try {
            specifierstack.push(specifiers.clone());
            }
        catch(Exception e) {
            specifierstack.push(specifiers);
            specifiers = new Specifiers();
            }
        }
    void restoreSpecifiers() {
        specifiers = specifierstack.pop();
        //System.out.println("restore specifiers>>>>>"+specifiers);
        }
    int procparamcount = 0, reflevel;
    /**
     *  this defines the format used to represent integers
     */
    public String intrep = "int32";
    public CCompiler(CParser p, Walker cpu) {
        parser = p;
        processor = cpu;
        declareStdTypes();
        Node b [] = { cpu.getFP(), cpu.getFP(), cpu.getFP() };
        bases = b;
        enterScope(false, true);
        }
    // get the type of last C expression
    Type typeOf()throws SyntaxError {
        return  getType(transStack.peek());
        }
    // define the type of a C component
    void tag(Type t) {
        if(transStack.empty()) {
            System.out.println("trans stack empty");
            }
        transStack.push(new TypeTag(transStack.pop(), t));
        }
    void detag() {


        transStack.push(TypeTag.decast(transStack.pop()));
        }
    String showstack() {
        String t = "transStack<<<<<<" + transStack;
        t += ">>>>>>>\n";
        t += ("statement stack <<<<<" + statements + ">>>>>>\n");
        t += ("prestatement stack <<<< " + prestatements + ">>>>>\n");
        t += ("temp stack <<<<<" + tempStack + ">>>>>>\n");
        return t;
        }
    // return the ilcg of last C component
    Node popexp() {
        if(transStack.empty())try {
                System.out.println("trans stack empty");
                return transStack.pop();
                }
            catch(Exception e) {
                e.printStackTrace();
                }
        //   System.out.println("pop "+transStack.peek());

        return transStack.pop();
        }
    void derefTos()throws Exception { // deref top of stack
        pushexp(forcederef(popexp()));
        }
    // define the ilcg of a C component
    void pushexp(Node n) {
        // System.out.println("push "+n);
        transStack.push(n);
        }
    void pushexp(Node n, Type t) {
        pushexp(n);
        tag(t);
        }
    void declareAStdType(String name, String rep) {
        Type t;
        symbolTable.put(name, t = new CType(name, rep));
        revt.put(rep, t);
        }
    void declareStdTypes() {
        declareAStdType("int", "int32");
        declareAStdType("long", "int32");
        declareAStdType("long int", "int32");
        declareAStdType("long long", "int64");

        declareAStdType("long long int", "int64");
        declareAStdType("short", "int16");
        declareAStdType("short int", "int16");
        declareAStdType("char", "int8");
        declareAStdType("float", "ieee32");
        declareAStdType("double", "ieee64");
        declareAStdType("unsigned char", "uint8");
        declareAStdType("unsigned int", "uint32");
        declareAStdType("unsigned", "uint32");
        declareAStdType("unsigned long int", "uint32");
        declareAStdType("unsigned long", "uint32");
        declareAStdType("unsigned short int", "uint16");
        declareAStdType("unsigned short", "uint16");
        declareAStdType("void", "word");
        declareAStdType("void*", processor.getAddressType());
        ADDRESS = new CType("ADDRESS", processor.getAddressType());
        INT8 = BOOLEAN = (Type)symbolTable.get("char");
        charpntr = new Pointer(INT8,processor);
        DOUBLE = REAL = (Type)symbolTable.get("double");
        BYTE = (Type)symbolTable.get("unsigned char");
        LONG = (Type) symbolTable.get("long long");
        INTEGER = (Type)symbolTable.get("int");
        SHORT = (Type)symbolTable.get("short");
        FLOAT = (Type)symbolTable.get("float");
        VOID  = (Type)symbolTable.get("void");
        }
    Variable handleProcScopes() throws Exception {
        enterScope(true,false);
        Variable taskidparam = (Variable) tempvar((INTEGER));
        enterScope(false,false);
        declareVar("$$dynamiclink",ADDRESS);
        return taskidparam;
        }

    void leaveprocscopes() {
        leaveScope(false,false);
        leaveScope(true,false);
        }
    public void enterScope(boolean params, boolean newframe) {
        //  System.out.println("enterscope("+params+","+newframe+")");
        symbolTable.enterScope();
        if(params) {
            lexicalLev++;
            }
        int start = 0;
        if(params || newframe) {
            allocatorStack.push(processor.newAllocator(start, params));
            //System.out.println("push new allocator ");
            }
        if(!params) {}
        else {
            try {
                declareVar("$$dynamiclink", (ADDRESS));
                declareVar("$$returnaddress", (ADDRESS));
                }
            catch(Exception e) {
                System.out.println("Internal " + e);
                }
            }
        if(processor.verbose)try {
                System.out.println("enter scope( " +params+","+newframe+ ")new lex lev"+ lexicalLevel() + " depth " + symbolTable.depth);
                throw new Exception("enter scope called from");

                }
            catch(Exception ex) {
                ex.printStackTrace();
                }
        }
    public void enterScope() {
        enterScope(false, false);
        }
    public void leaveScope() {
        leaveScope(false, false);
        }
    int lexicalLevel() {
        return lexicalLev;
        }
    public void leaveScope(boolean params, boolean newframe) {

        if(params) {

            lexicalLev--;
            }
        symbolTable.leaveScope();
        if(processor.verbose)try {
                throw new Exception("Leave scope (" + params+","+newframe+")");
                }
            catch(Exception ex) {
                System.out.println(" "+ex);
                ex.printStackTrace();
                }
        if(processor.verbose) {
            System.out.println("new ll " + lexicalLevel() + " depth "
                               + symbolTable.depth);
            }
        if(params || newframe) {
            allocatorStack.pop();
            }
        }
    LocalStoreAllocator currentLocalAllocator() {
        if(allocatorStack.empty()) {
            return null;
            }
        return (LocalStoreAllocator) allocatorStack.peek();
        }
    Memref tempvar(Type t) throws Exception {
        String  name  = newname();
        declareVar(name, t);
        Memref v = (Memref) symbolTable.checkedGet(name);
        tempStack.push(v);
        return v;
        }
    Statement nestTemps(Statement s) {
        if(tempStack.empty()) {
            return s;
            }
        Object o = tempStack.pop();
        if(o instanceof String) {
            return s;
            }
        //System.out.println("nest temp "+s+" with "+o);
        Statement s2 = new Statement(s);
        if(!s.toString().contains("[")) {
            s2.setLocal((Memref)o);
            }
        //System.out.println("returning "+s2);
        return nestTemps(s2);
        }
    public Statement plant(byte[] bytes, int offset) {
        return plant(bytes, 0, bytes.length - 1);
        }

    public Statement plant(int[] bytes, int offset) {
        if(offset < bytes.length) {
            return new Statement(new Location(new Int(bytes[offset], intrep)),
                                 plant(bytes, offset + 1));
            }
        return null;
        }
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


    public Statement plant(char[] bytes, int offset) {
        return plant(bytes, 0, bytes.length - 1);
        }
    public Statement plant(char[] bytes, int start, int fin) {
        if(start == fin) {
            return new Statement(new Location(new Int(bytes[start], "uint8")));
            }
        if(start > fin) {
            return null;
            }
        return new Statement(plant(bytes, start, start + (fin - start) / 2),
                             plant(bytes, start + 1 + (fin - start) / 2, fin));
        }


    public Label plant(Node n) {
        return plant(n, null);
        }
    public Label plant(Node n, Label lab) {
        if(lab == null) {
            lab   = new Label();
            }
        Node   decl  = new Statement(lab, new Statement(new Location(n), null));
        dataDecls = new Statement(decl, dataDecls);
        return lab;
        }
    String removequotes(String s) { // remove the "" around a string
        boolean inesc = false;
        int i;
        String s2 = "";
        for(i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            if(inesc) {
                s2 += c;
                inesc = false;
                }
            else {
                if(c == '\\') {
                    inesc = true;
                    }
                else if(c == '"') {   // do nothing
                    }
                else {
                    s2 += c;
                    }
                }
            }
        return s2;
        }
    boolean ishex(char c) {
        if(Character.isDigit(c)) {
            return true;
            }
        if((c >= 'a') && (c <= 'f')) {
            return true;
            }
        return (c >= 'A') && (c <= 'F');
        }
    boolean isoct(char c) {
        return c <= '9' && c >= '0';
        }
    String processString(String s) { // remove C style escapes
        //  s = removequotes(s);
        boolean inesc = false;
        int i;
        String s2 = "";
        for(i = 0; i < s.length(); i++) {
            char c = s.charAt(i);
            //System.out.println(s+ " "+i+" "+c+" "+s2);
            if(inesc) {
                if(c == 'n') {
                    c = '\n';
                    }
                else if(c == 'a') {
                    c = 7;
                    }
                else if(c == 'r') {
                    c = '\r';
                    }
                else if(c == 'b') {
                    c = '\b';
                    }
                else if(c == 'f') {
                    c = '\f';
                    }
                else if(c == 't') {
                    c = '\t';
                    }
                else if(c == 'v') {
                    c = 11;
                    }
                else if(c == 'x' && ishex(s.charAt(i + 1)) && ishex(s.charAt(i + 2))) {
                    c = (char)java.lang.Integer.parseInt(s.substring(i + 1, i + 2), 16);
                    i += 3;
                    }
                else if(isoct(c) && isoct(s.charAt(i + 1)) && isoct(s.charAt(i + 2))) {
                    c = (char)java.lang.Integer.parseInt(s.substring(i, i + 3), 8);
                    i += 3;
                    }
                s2 += c;
                inesc = false;
                }
            else {
                if(c == '\\') {
                    inesc = true;
                    }
                else if(c != '"') {
                    s2 += c;
                    }
                }
            }
        return s2;
        }
    public Node plantStringlab(String s, int strlen) throws SyntaxError {
        char[]  b    = new char[strlen + 1];
        // put in the end of string char for c purposes
        for(int i = 0; i < s.length(); i++) {
            b[i] = s.charAt(i);
            }
        b[s.length()] = 0;
        Label   lab  = new Label();
        dataDecls = new Statement(dataDecls, new Statement(lab, new Statement(
                                      plant(b, 0))));
        //System.out.println("plant(" + s + ")");
        return new TypeTag(lab,charpntr);
        }
    String newname() {
        names++;
        return " v" + names + Math.random();
        }
    Node iota(int i)// this creates the local iterators for array operations
    throws Exception {
        String id = "iota" + i;
        Object n = symbolTable.get(id);
        if(n == null) {
            declareVar(id, INTEGER);
            n = iota(i);
            }
        return (Node) n;
        }
    void declareVar(String s, Type t) throws Exception {
        declareVar(s, t, false, false);
        }
    void declareVar(String s, Type t, boolean Static, boolean Extern) throws Exception {
        //System.out.println("Declare " + s + ": " + t);
        if(structnest > 0) {
            declarefield(s, t);
            return;
            }
        Type                 reft       = new Ref(t);
        checknew(s);
        LocalStoreAllocator  a          = currentLocalAllocator();
        int                  size       = (int) t.sizeOf(processor);
        int                  alignment  = t.alignment(processor);
        Node                 base = bases[lexicalLevel()];
        if((lexicalLevel() == 0||Static)&& !Extern) {
            Label l = new Label(s);
            Node res = new Dyad(l, new ilcg.tree.Integer(size),
                                new Op("bss", "int32", "int32", "int32"));
            a = new LocalStoreAllocator(1, 0);
            base = l;
            dataDecls = new Statement(res, dataDecls);
            }
        Variable             V          ;
        if(!Extern)
            V = new ilcg.tree.Variable(
                size,
                alignment,
                a,
                reft,
                Variable.makeref(t.returnType()),
                base,
                lexicalLevel(),
                false,
                processor.getAddressType());
        else
            V = new Variable(size,
                             reft,
                             reft.type,
                             new Label(s));
        symbolTable.put(s, V);
        //System.out.println("Declared " + s + "= " + V+":"+V.getType());
        }
    Object lookup(String name)throws Exception {
        Object n = symbolTable.get(name);
        if(n == null) { //error(" \'" + name + "\' undeclared here");
            return new Label(name);
            }
        return n;
        }
    void checknew(String name) throws SyntaxError {
        Object o;
        if((o=symbolTable.getCurrentScope().get(name)) != null) {

            if(o instanceof Variable) {
                Variable v=(Variable)o;
                if(v.index.toString().contains(name)) {
                    // variable declared as an extern
                    // we simply rename the label as the var will be redeclared
                    Label l = findlabel(v.index);
                    l.labval=new Label().toString();
                    return;
                    }
                }
            error(name + " already declared in this context");
            }
        }
    class LabelFinder implements TreeExaminer {
        /** This is called each time a node is visited, but before any subtrees are visited. If it returns
             false the subtree below the node is not visited */
        public boolean visit(Node n) {
            return ! found;
            }
        boolean found=false;
        Label l;
        /** This updates state on leaving*/
        public void leave(Node n) {

            if(n instanceof Label) {
                found=true;
                l=(Label)n;
                }
            }

        }
    Label findlabel(Node index) {
        LabelFinder f = new LabelFinder();
        index.examine(f);
        return f.l;
        }
    //------------- Error handling
    void error(String s, int l) throws SyntaxError {
        SyntaxError  e  = new SyntaxError(s, l, charno, sourceName);
        if(processor.verbose) {
            e.printStackTrace();
            System.out.println("throw error " + l + s);
            }
        throw e;
        }
    void error(String s) throws SyntaxError {
        error(s, lineno);
        }
    void quit(String s) {

        processor.getLogFile().close();
        Quit(s);
        }
    static void Quit(String s) {
        System.err.println(s);

        System.exit(-1);
        }
    void quit(String s, Exception e, ParserRuleContext c) {
        // e.printStackTrace();
        int line = c.start.getLine();
        int cpos = c.start.getCharPositionInLine();
        System.err.println("Line " + line + ":" + cpos + " " + s + "\n" + e + "\nwhen parsing  " + c.getText());
        if(processor.verbose) {
            e.printStackTrace();
            }
        System.exit(-1);
        }
    //--------------- string functions
    String unescapeString(String st) {
        StringBuilder sb = new StringBuilder(st.length());
        for(int i = 0; i < st.length(); i++) {
            char ch = st.charAt(i);
            if(ch == '\\') {
                char nextChar = (i == st.length() - 1) ? '\\' : st
                                .charAt(i + 1);
                // Octal escape?
                if(nextChar >= '0' && nextChar <= '7') {
                    String code = "" + nextChar;
                    i++;
                    if((i < st.length() - 1) && st.charAt(i + 1) >= '0'
                            && st.charAt(i + 1) <= '7') {
                        code += st.charAt(i + 1);
                        i++;
                        if((i < st.length() - 1) && st.charAt(i + 1) >= '0'
                                && st.charAt(i + 1) <= '7') {
                            code += st.charAt(i + 1);
                            i++;
                            }
                        }
                    sb.append((char) Long.parseLong(code, 8));
                    continue;
                    }
                switch(nextChar) {
                    case '\\':
                        ch = '\\';
                        break;
                    case 'b':
                        ch = '\b';
                        break;
                    case 'f':
                        ch = '\f';
                        break;
                    case 'n':
                        ch = '\n';
                        break;
                    case 'r':
                        ch = '\r';
                        break;
                    case 't':
                        ch = '\t';
                        break;
                    case '\"':
                        ch = '\"';
                        break;
                    case '\'':
                        ch = '\'';
                        break;
                    // Hex Unicode: u????
                    case 'u':
                        if(i >= st.length() - 5) {
                            ch = 'u';
                            break;
                            }
                        int code = (int) Long.parseLong(
                                       "" + st.charAt(i + 2) + st.charAt(i + 3)
                                       + st.charAt(i + 4) + st.charAt(i + 5), 16);
                        sb.append(Character.toChars(code));
                        i += 5;
                        continue;
                    }
                i++;
                }
            sb.append(ch);
            }
        return sb.toString();
        }
    String getSuffix(String s, String validSuffixChars) {
        int last = s.length() - 1;
        boolean ok = last >= 0;
        String suffix = "";
        while(ok) {
            String c = "" + s.charAt(last);
            if(validSuffixChars.contains(c)) {
                suffix = c + suffix;
                last--;
                }
            else {
                ok = false;
                }
            if(ok) {
                ok = last >= 0;
                }
            }
        return suffix;
        }
    String getPrefix(String s, String suffix) {
        int last = s.length() - suffix.length();
        return "" + s.subSequence(0, last);
        }
    // code generation of arithmetic
    void dyad(String op)throws Exception {
        derefTos();
        Type rt = typeOf();
        Node r = popexp();
        derefTos();
        Type lt = typeOf();
        Node l = popexp();
        //  System.out.println("Dyad "+l+op+r);
        pushexp(dyad(l, lt, r, rt, op), (iscomparison(op) ? BOOLEAN : maxprecision(lt, rt)));
        }
    Node dyad(Node l, Node r,  String op) throws SyntaxError {
        return dyad(l, getType(l), r, getType(r), op);
        }
    Node dyad(Node l, Type lt, Node r, Type rt, String op) throws SyntaxError {
        // first obtain dereferenced versions of the arguments
        Node  left   = forcederef(l);
        Node  right  = forcederef(r);
        if(op.equals("|")) {
            op = Node.or;
            }
        else if(op.equals("^")) {
            op = Node.xor;
            }

        else if(op.equals("&")) {
            op = Node.and;
            }
        if(processor.verbose) {
            System.out.println("dyad " + left + ": " + lt + "\n" + op + "\n"
                               + right + ": " + rt);
            }
        // Now categorise the types
        try {
            if(isreal(lt) || isreal(rt)) {
                // System.out.println("real type");
                return realdyad(optionalfloat(REAL, left), optionalfloat(REAL,
                                right), op);
                }
            else if(ispointer(lt) || ispointer(rt)|| isarray(lt)||isarray(rt)) {
                if(processor.verbose) {
                    System.out.println("pointer dyad " + left + op + right);
                    }
                return addressdyad(left, right, op);
                }
            else if(isinteger(gettype(left))) {
                // System.out.println("\n\nintegral type\n\n");
                return integraldyad(left, right, op);
                }
            else {
                error("can not type validate expression");
                }
            }
        catch(Exception ex) {
            if(processor.verbose) {
                System.out.println("dyad fails " + ex);
                }
            }
        return null;
        }
    Type maxprecision(Type lt, Type rt) throws SyntaxError {
        //System.out.println("Maxprecision " + lt + " , " + rt);
        if((isinteger(lt) && isinteger(rt)) || (isreal(lt) && isreal(lt))) {
            if(Format.lengthInBits(lt.type) > Format.lengthInBits(rt.type)) {
                return lt;
                }
            return rt;
            }
        if(isinteger(lt) && isreal(rt)) {
            return rt;
            }
        return lt;
        }
    int sizeof(Node e) {
        String t = e.returnType();
        return Format.lengthInBytes(t);
        }
    Node addressdyad(Node left, Node right, String op) throws SyntaxError,  Exception {
        if(processor.verbose) {
            System.out.println("addr dyad " + left.returnType() + op
                               + right.returnType());
            }
        left = forcederef(left);
        right = forcederef(right);
        Type  lt   = getType(left);
        Type  rt   = getType(right);
        if(processor.verbose) {
            System.out.println("addr dyad " + left + ":" + lt +" "+ op + right + ":" + rt);
            }
        if(isarray(lt)) {
            if(!op.equals("+")) error("only addition allowed to arrays");
            Node na= new Dyad(new TypeTag(((Memref)left).index,ADDRESS), new TypeTag(right, ADDRESS),new TOP(Op.sum(ADDRESS.type, rt.type,    ADDRESS.type), ADDRESS)).eval();
            na=new Memref(na,lt.returnType());
            na = new TypeTag(na,lt);
            return na;
            }
        if(isarray(rt))return addressdyad(right,left,op);
        if(ispointer(lt) && ispointer(rt)) {
            if(!iscomparison(op)) {
                return new TypeTag(new Dyad(new TypeTag(left, LONG),
                                            new TypeTag(right, LONG), new TOP(new Op(op, LONG.type,
                                                    LONG.type, LONG.type),LONG)), LONG);
                }
            else {
                op= optrans(op);
                return new TypeTag(new Dyad(new TypeTag(left, ADDRESS),
                                            new TypeTag(right, ADDRESS), new TOP(new Op(op, lt.type,
                                                    rt.type, BOOLEAN.type), rt)), BOOLEAN);
                }
            }
        boolean leftint = ! ispointer(lt);

        if(op.equals("-")) {
            if(leftint) {
                error("operation of form int - pointer not allowed");
                }
            else {
                return new TypeTag(new Dyad(left, new Dyad(right, new Int(sizeof(forcederef(left)), "int32"), "*"),
                                            new TOP(Op.dif(lt.type, rt.type,    rt.type), rt)), ADDRESS);
                }
            }
        else if(op.equals("+")) {
            int elementsize = getElemsize(leftint ? rt : lt);

            // here we should put in the code to handle the addition of
            // integers to pointers as per the C standard where you
            // have to scale the integer by the size of the base element
            if(!leftint) {
                Node d= new Dyad(new TypeTag(left, ADDRESS), new Dyad(right, new Int(elementsize, "int32"), "*"), new TOP(Op.sum(ADDRESS.type, rt.type,    ADDRESS.type), ADDRESS)).eval();
                d=new TypeTag(d.eval(),new Pointer(((Pointer)lt).pointsTo,processor));;
                Type dt = getType(d);
                //if(processor.verbose)System.out.println( " before cast "+dt+" after cast "+lt);
                return d;
                }
            else {
                return new Dyad(new Dyad(left, new Int(elementsize, "int32"), "*"), new TypeTag(right, ADDRESS), new TOP(Op.sum(lt.type, ADDRESS.type,  ADDRESS.type), ADDRESS));
                }
            }
        if(!(lt.equals(rt))) {
            if(!(Format.isInteger(lt.type) && Format.isInteger(rt.type))) {
                error("type error in address arithmetic");
                }
            Type  precise  = ADDRESS;
            return dyad(new TypeTag(left, precise),
                        new TypeTag(right, precise),optrans(op));
            }
        error("operator " + op + " is not defined on address types");
        return null;
        }
    Node realdyad(Node left, Node right, String op) throws Exception,       SyntaxError {
        Type  lt  =   getType(left);
        Type      rt  = getType(right);
        // System.out.println("realdyad " + lt + op + rt);
        if(!(lt.equals(rt))) {
            Type  precise  =  maxprecision(lt, rt);
            return realdyad(new TypeTag(left, precise), new TypeTag(right,
                            precise), op);
            }
        Type  RT  =   rt;
        if(iscomparison(op)) {
            return new TypeTag(new Dyad(left, right, new TOP(new Op(optrans(op),
                                        lt.type, rt.type, BOOLEAN.type), rt)), BOOLEAN);
            }
        else if(op.equals("+")) {
            return new TypeTag(new Dyad(left, right, new TOP(Op.sum(lt.type,
                                        rt.type, rt.type), rt)), lt);
            }
        else if(op.equals("-")) {
            return new TypeTag(new Dyad(left, right, new TOP(Op.dif(lt.type,
                                        rt.type, rt.type), rt)), lt);
            }
        else if(op.equals("*")) {
            return new TypeTag(new Dyad(left, right, new TOP(Op.prod(lt.type,
                                        rt.type, rt.type), rt)), maxprecision(lt, rt));
            }
        else if(op.equals(" / ")) {
            Node  divided  = new TypeTag(new Dyad(left, right, new TOP(Op.div(
                    lt.type, rt.type, rt.type), rt)), (Type) maxprecision(lt, rt));
            // System.out.println(" "+divided+": "+lt.divideby(RT));
            return divided;
            }
        error("operator " + op + " is not defined on real types");
        // never get here
        return left;
        }
    String optrans(String s) {
        if(processor.verbose) {
            System.out.println("optrans "   + s
                              );
            }
        if(s.equals("==")) {
            s= "=";
            }
        else if(s.equals("!=")) {
            s= "<>";
            }
        if(processor.verbose) {
            System.out.println("optrans to "   + s
                              );
            }
        return s;
        }
    Node integraldyad(Node left, Node right, String op) throws SyntaxError,
        Exception {
        if(processor.verbose) {
            System.out.println("int dyad " + left.returnType() + op
                               + right.returnType());
            }
        Node  res  = null;
        Type  lt   = getType(left);
        Type  rt   = getType(right);
        if(processor.verbose) {
            System.out.println("int types " + lt + op + rt+" is a comparison "+iscomparison(op));
            }
        if(!(lt.equals(rt) && left.returnType().equals(right.returnType()))) {
            if(processor.verbose) {
                System.out.println("determine max precision");
                }
            Type          precise  = maxprecision(lt, rt);
            if(isreal(precise)) {
                return dyad(optionalfloat(precise, left), optionalfloat(
                                precise, right), op);
                }
            else
                return dyad(new TypeTag(left, precise),
                            new TypeTag(right, precise), op);
            }
        else if(iscomparison(op)) {
            if(processor.verbose) {
                System.out.println("int comparison dyad " + left.returnType() + op
                                   + right.returnType());
                }
            return new TypeTag(new Dyad(left, right, new TOP(new Op(optrans(op),
                                        lt.type, rt.type, BOOLEAN.type), rt)),
                               BOOLEAN);
            }
        else if(isbitwise(op)) {
            res= new TypeTag(new Dyad(left, right, op), lt);
            }
        else if(op.equals("+")) {
            res = new Dyad(left, right,  Node.plus);
            }
        else if(op.equals("+:")) {
            res = new Dyad(left, right,  Node.satplus);
            }
        else if(op.equals("-")) {
            res = new Dyad(left, right,  Node.minus);
            }
        else if(op.equals("*")) {
            res = new Dyad(left, right,  Node.times);
            }
        else if(op.equals("-:")) {
            res = new Dyad(left, right,  Node.satminus);
            }
        else if(op.equals("/")) {
            res = new Dyad(left, right,  Node.divide);
            }
        else if(op.equals("%")) {
            res = new Dyad(left, right, "MOD");
            }
        else if(op.equals(Node.min) || op.equals(Node.max)) {
            res = new Dyad(left, right, op);
            }
        else if(op.equals(">>") || op.equals("<<")) {
            res = new Dyad(left, right, op);
            }
        if(res == null) {
            error("operator " + op + " is not defined on integral types");
            }
        return new TypeTag(res, lt);
        }
    Node optionalfloat(Type assignedTo, Node e) throws SyntaxError {
        Type  t  = getType(e);
        if(t instanceof Ref && (!(t instanceof Pointer))) {
            e = forcederef(e);
            }
        if(isreal(assignedTo.type) && !isreal(e.returnType())) {
            return floatit(e, assignedTo);
            }
        return e;
        }
    public Node floatit(Node r, Type ty) throws SyntaxError {
        String  t  = r.returnType();
        if(t.equals(Node.uint8) || t.equals(Node.int8) || t.equals(Node.int16)
                || t.equals(Node.uint16)) {
            r = new ilcg.tree.Monad(new Op("EXTEND", t, intrep), r);
            }
        t = r.returnType();
        if(t.equals(Node.int32)) {
            return new TypeTag(new ilcg.tree.Monad(new Op("FLOAT", Node.int32,
                                                   ty.type), r), ty);
            }
        if(t.equals(Node.int64)) {
            return new TypeTag(new ilcg.tree.Monad(new Op("FLOAT", Node.int64,
                                                   ty.type), r), ty);
            }
        error("dont know how to convert type " + t + "(" + r
              + ") to floating point");
        return r;
        }
    public Node forcederef(Node n) throws   SyntaxError {
        String  rt  = n.returnType();
        if(!rt.startsWith("ref") || getType(n) instanceof Pointer) {
            return n;
            }
        if(n instanceof Variable)

            try {
                Variable v = (Variable)n;
                Type t=(Type)v.getType();
                if(t instanceof Array) {
                    return n;
                    }
                return new TypeTag(new Deref(n),
                                   ((Ref)v.getType()).pointsTo);
                }
            catch(Exception e) {
                throw new SyntaxError("in forcederef type of n "+n.getClass()+"\n"+e,-1);
                }
        return (new Deref(n));
        }
    public Node forcederef(Node n, Type targetType)
    throws
        SyntaxError {
        Type  rt  = resolvepointertypes(getType(n));
        targetType = resolvepointertypes(targetType);
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
        return n;
        }
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
    Type string2Type(String s) throws SyntaxError {
        // System.out.println("string2type '"+s+"'");
        if(s.equals("int16")) {
            return SHORT;
            }
        if(s.equals("int8")) {
            return INT8;
            }
        if(s.equals("int64")) {
            return LONG;
            }
        if(s.equals("ieee64")) {
            return DOUBLE;
            }
        if(s.equals("word")) {
            return VOID;
            }

        if(s.startsWith("ref ")) {
            return new Ref(string2Type(Format.typeDeref(s)));
            }
        Type t = (Type)revt.get(s);
        if(t == null) {
            t = (Type)symbolTable.get(s);
            if(t==null) {
                error("could not resolve C type for " + s);
                }
            }
        return t;
        }
    Type getType(Node v) throws SyntaxError {
        return resolvepointertypes(gettype(v));
        }
    Type gettype(Node v) throws SyntaxError {
        if(processor.verbose) {
            System.out.println("GetType " + v + " : " + v.returnType()+","+v.getClass());
            }
        if(v instanceof TypeTag) {
            if(processor.verbose) {
                System.out.println("GetType " + v + " : " + ((TypeTag)v).thistype+","+v.getClass());
                }
            return ((TypeTag)v).thistype;
            }
        else if(v instanceof Deref) {
            Node  v1;
            Type  r   = getType(v1 = ((Deref) v).getArg());
            if(!(r instanceof Ref)) {
                try {
                    error("compiler error : in getType, deref operation found on non ref type "
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
            //System.out.println("get type of variable "+v+":"+res);
            return res;
            }
        if(v instanceof Int) {
            String  rt  = v.returnType();
            if(rt.equals(BYTE.type)) {
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
                error("compiler error : found a memref whose type did not start with ref : "
                      + rt);
                }
            rt = rt.substring(4);
            // remove leading ref
            return new Ref(string2Type(rt));
            }
        String  s  = v.returnType();
        return string2Type(s);
        }
    public Node floatit(Node r) throws SyntaxError {
        return floatit(r, REAL);
        }
    boolean isreal(String s) {
        return Format.isReal(s);
        }
    boolean isreal(Type r) {
        return isreal(r.type);
        }
    int getElemsize(Type t) {
        if(t instanceof Ref && !(t instanceof Pointer)) {
            return getElemsize(((Ref)t).pointsTo);
            }
        return Format.lengthInBytes(((Pointer)t).pointsTo.returnType());
        }
    boolean ispointer(Type t) {
        // System.out.println("is pointer ? "+t);
        if(t instanceof Ref && !(t instanceof Pointer)) {
            return ispointer(((Ref)t).pointsTo);
            }
        return
            t instanceof Pointer;
        }
    boolean isarray(Type t) {
        return t instanceof Array;
        }
    boolean isbitwise(String op) {
        return op.equals(" & ") || op.equals(" | ") || op.equals(" ^ ") || op.equals(Node.or) || op.equals(Node.and) || op.equals(Node.xor);
        }
    boolean isinteger(Type t) {
        return Format.isInteger(t.returnType());
        }
    Node forceTypeCompatibility(Node exp, Type t) throws SyntaxError {
        String  trep    = t.returnType();
        String  exprep  = exp.returnType();
        Type    expt    = getType(exp);
        if(processor.verbose) {
            System.out.println("force type compatibility of " + exp + " : " + expt + " to " + t
                               +"\n representations "+exprep+ " and "+trep);

            }
        t = resolvepointertypes(t);
        expt = resolvepointertypes(expt);
        if(!t.equals(expt)) {

            if(exprep.equals(trep)) {}
            else {

                if(expt instanceof Array&& t instanceof Pointer) {
                    // type int[n] must coerce to int* etc
                    if(((Pointer)t).pointsTo .equals(((Array)expt).element)) {
                        ilcg.tree.Node nd = TypeTag.decast(exp);
                        if(nd instanceof Memref) {
                            nd = ((Memref)nd).index;
                            if(processor.verbose)System.out.println("since "+expt + " incompatible with " + t
                                                                        + "\ntrep = " + trep + " exprep = " + exprep+
                                                                        "\n we cast "+exp +" to " +new TypeTag(nd,t)
                                                                       );
                            return new TypeTag(exp,t);
                            }
                        }
                    }
                if(t instanceof Pointer) {
                    if(exprep .equals(processor.getAddressType())) {
                        return new TypeTag(exp,t);
                        }
                    }
                if((Format.isInteger(trep)) && Format.isInteger(exprep)) {
                    return new Cast(trep, exp);
                    }
                else if(Format.isReal(trep) && Format.isInteger(exprep)) {
                    return floatit(exp);
                    }
                else if(Format.isReal(exprep) && Format.isInteger(trep)) {
                    return truncit(exp,exprep,trep);
                    }
                else if(trep.equals("ieee64") && exprep.equals("ieee32")) {
                    return new Cast("ieee64", exp);
                    }
                else if(trep.equals("ieee32") && exprep.equals("ieee64")) {
                    return new Cast("ieee32", exp);
                    }
                //      return new TypeTag(exp,t);
                error("type mismatch : " + expt + " incompatible with " + t
                      + "\ntrep = " + trep + " exprep = " + exprep);
                }
            }
        return exp;
        }
    Node truncit(Node r,String realrep, String intrep) {
        return new ilcg.tree.Monad(new Op("TRUNCATE", realrep, intrep), (r));
        }
    Node typeTag(Node v, Type t) {
        return new TypeTag(v, t);
        }
    Type pointerise(Type t) {
        return pointerise(t, reflevel);
        }
    Type pointerise(Type t, int refs) {
        if(refs == 0) {
            return t;
            }
        Type p= new Pointer(pointerise(t, refs - 1), processor);

        // System.out.println("pointerise("+t+","+reflevel+")->"+p);
        return p;
        }
    boolean iscomparison(String op) {
        return op.equals("==") || op.equals("!=") || op.equals("<")
               || op.equals("<=") || op.equals(">") || op.equals(">=");
        }
    //-------------------------------------- store statements and prestatements
    // this handles the chaining together of ilcg actions into a final list
    Stack<Statement> prestatements = new Stack<Statement>();
    Stack<Node> statements = new Stack<Node>();// used to build up the statement trees for compounds, if then else etc
    Statement   dataDecls = null;
    void postPrestatement(Statement s) {
        if(processor.verbose) {
            System.out.println("post prestatement "+s);
            }
        prestatements.push(s);
        }
    Statement arrayiterate(Statement s) {
        if(processor.verbose) {
            System.out.println("maxrank =" + maxrank + " assrank=" + assrank + " maxass=" + maxass + " for " + s);
            }
        //  if(maxrank<assrank)maxrank=assrank;
        if(maxrank == 0) {
            return s;
            }
        maxrank --;
        return arrayiterate(wrap(s, maxrank));
        }
    Statement wrap(Statement s, int l) {
        if(tasks<2 || maxrank != 1)
            try {
                Node loop = new For(iota(l), new ilcg.tree.Integer(0, "int32"),
                                    dyad(sectionlengths[l], new ilcg.tree.Integer(-1, "int32"), "+"),
                                    sectionsteps[l], s);
                // System.out.println("in wrap loop ="+loop);
                sectionlengths[l] = null; // restore the length and step to defaults after use
                sectionsteps[l] = one;
                return new Statement(loop);
                }
            catch(Exception e) {
                quit("trying to generate array operation loop for" + s + "\n" + e);
                return null;
                }
        else try {
                // we attempt to construct loop that will run over multiple cores
                Variable taskid= handleProcScopes();
                // task id is a parameter passed to the task indicating which task it is currently
                Statement loop = new Statement(new For(iota(l), new Deref(taskid),
                                                       dyad(sectionlengths[l], new ilcg.tree.Integer(-1, "int32"), "+"),
                                                       dyad(sectionsteps[l], new ilcg.tree.Integer(tasks,"int32"),"*"), s));
                loop.setLocal((Memref)iota(l));
                Vector<Node> keep = new Vector<Node>(); // these are the vars we will keep
                Node dl =(Node) lookup("$$dynamiclink");
                LocalStoreAllocator loc = currentLocalAllocator();
                leaveprocscopes();
                // we need to find all temp variables and leave them as they are
                // same with iota
                class tempfinder implements TreeExaminer {
                    Vector<Node> keep;
                    tempfinder(Vector<Node> k) {
                        keep=k;
                        }
                    public boolean visit(Node n) {
                        return true;
                        }
                    /** This is called after all subtrees have been visited */
                    public void leave(Node n) {
                        if(n instanceof Statement) {
                            Statement s = (Statement)n;
                            if(s.hasLocal()) {
                                keep.add(s.getLocal());
                                }
                            }
                        }
                    }

                tempfinder fn= new tempfinder(keep);
                loop.examine(fn);
                Node [] A1 = new Node[keep.size()+1];
                Object [] T = keep.toArray(A1);
                int numk = T.length;
                Node [] A = new Node[numk+1];

                Node [] B = new Node[numk+1];
                for(int i= 0; i<numk; i++) {
                    B[i]=A[i]=(Node)T[i];
                    }
                A[numk]=processor.getFP();
                B[numk]=dl;
                ExpressionSubstituter sub = new ExpressionSubstituter(A,B);
                loop=new Statement(loop.modify(sub));
                Procedure p=
                    new Procedure("stub"+new Label(), //String externalname,
                                  2,         //int params,
                                  "[int32,int32]",               //String argtype,
                                  "int32",
                                  new Label(),                //Label localname,
                                  new Block(loop,loc));
                Label l1= new Label();
                return new Statement(
                           new Statement(
                               new Goto(l1),
                               new Statement(p,
                                             new Statement(l1,dispatch(p)))));
                }
            catch(Exception e) {
                quit("trying to generate parallelised array operation loop for" + s + "\n" + e);
                return null;
                }
        }


    Node minusone= new Int(-1,"int32");
    Node procCall(String id, Node[] params) throws SyntaxError {
        return procCall(symbolTable, id, params);
        }



    Node procCall(Dictionary d, String id, Node[] params) throws SyntaxError {
            {
            try {
                // if(value instanceof ProcType)
                    {
                    // ProcType   proc          = (ProcType) value;
                    Vector     actualParams  = new Vector();
                    for(int i = 0; i < params.length; i++) {
                        // System.out.println("Check parameter "+params[i]+":"+getType(params[i])+" to "+proc.params[i]+":"+getType(proc.params[i]));
                        actualParams.addElement(
                            params[i]);
                        }
                    //   ProcType   p             = (ProcType) value;
                    Cartesian  Params        = new Cartesian(actualParams);
                    try {
                        Function  keepf  = new Function((Procedure)d.get(id));

                        return new Monad(keepf, Params);
                        }
                    catch(Exception en) {
                        error("internal compiler error \nin procCall\n"
                              + en.getMessage());
                        }
                    }
                }
            catch(Exception err2) {
                //  if(processor.verbose)err2.printStackTrace();
                error("in proccall " + err2);
                }
            }

        return null;
        }

    Statement dispatch(Node l)throws Exception {
        Node Ti = tempvar(INTEGER);
        Node Tr=	new Deref(Ti);							// routine for different rows
        Node[] params = { l,new TypeTag(new Deref(processor.getFP()),ADDRESS),
                          Tr
                        };
        Node Tc = new Int(tasks, "int32");
        Node limit = tempvar(INTEGER);
        Node zero = new Int(0,"int32");
        Node check=  new Assign(limit,Tc) ;
        Node dlimit =Tc;
        //  Node test = new If(dyad(Tr,upb,">"),new Goto(lab));
        Node call = new Statement(new Statement(procCall("post_job", params)));
        Node[] p2 = { Tr };
        Node delay = new Statement(procCall("wait_on_done", p2));
        // lauch all the tasks first then wait
        // for completion
        return new Statement(
                   new Statement(new For(Ti,dlimit,zero,minusone, call)
                                 , new Statement(new For(Ti,zero,dlimit,one,delay)
                                                )));


        }

    int savedreductionlevel() {
        return reductionlevels.peek().intValue();
        }
    void postreduction(Node n) {
        Node prior = null;
        if(!reductions.empty()) {
            int priorlevel = savedreductionlevel();
            if(priorlevel == reductlevel) {
                reductionlevels.pop();
                prior = reductions.pop();
                }
            }
        reductionlevels.push(new Short((short)reductlevel));
        reductions.push(
            new Statement(
                prior,
                new Statement(n)
            )
        );
        }
    void poststatement(Statement s) {
        Node prior = null;
        if(!statements.empty()) {
            prior = statements.pop();
            }
        statements.push(new Statement(
                            prior,
                            arrayiterate(
                                nestTemps(
                                    new Statement(allPrestatements(),   s)
                                )
                            )
                        )
                       );
        //System.out.println(" at end of poststatement "+s+"\nstatements="+statements);
        clearIota();
        }
    void poststatementwithoutlocals(Statement s) {
        Node prior = null;
        if(!statements.empty()) {
            prior = statements.pop();
            }
        statements .push(new Statement(
                             prior,
                             arrayiterate(
                                 new Statement(allPrestatements(),   s)
                             )));
        clearIota();
        }
    Statement allPrestatements() {
        if(prestatements.empty()) {
            //   System.out.println("Prestatement stack empty");
            return null;
            }
        Statement s2 = prestatements.pop();
        // System.out.println("poped prestatement "+s2);
        return  new Statement(allPrestatements(), s2);
        }
    boolean codegen(String asmfilename)

        {
        //   Procedure dummy = new Procedure();
        //    dummy.alloc =allocatorStack.empty()?new LocalStoreAllocator(1,1): allocatorStack.peek();
        boolean ok =true;// processor.codeGen(dummy);
        Walker w = processor;
        if(!w.macrofile().equals("")) {
            String  rtldir = (System.getProperty("mmpcdir", ".")).replace("\\", "/");
            w. buf.writeln(w.directivePrefix() + "include \"" + rtldir
                           + "/" + w.macrofile() + "\"");
            }
        if(! statements.empty()) {
            ok = ok & processor.codeGen(new Statement(statements.pop()));
            }
        processor.buf.writeln(processor.sectionDirective() + " " + ".data");
        // System.out.println("datadecls ="+dataDecls);
        ok = ok && processor.codeGen(dataDecls);
        if(ok)try {
                PrintWriter asm = new PrintWriter(asmfilename);
                processor.flush(asm);
                asm.close();
                }
            catch(Exception e) {
                System.out.println(" " + e);
                ok = false;
                }
        return ok;
        }
    //------------------------------------------------------------------------------------------------
    //-------------------------------------- tree traversal methods inherited from CBaseListener
    //------------------------------------------------------------------------------------------------
    public void enterCompoundStatement(@NotNull CParser.CompoundStatementContext ctx) {
        enterScope(false, blocknest < 1);
        blocknest++;
        saveSpecifiers();
        statements.push(null);// we need this to create a new level on the statement stack
        //System.out.println("enter compound statement "+ctx.getText());
        }
    public void exitCompoundStatement(@NotNull CParser.CompoundStatementContext ctx) {
        statements.push(new Block(statements.pop(), currentLocalAllocator()));
        blocknest--;
        leaveScope(false, blocknest < 1);
        restoreSpecifiers();
        }
    /** the following is called if a compound statement occurs within a list of statements so it must be appended to the list
     * reducing the statement stack by one */
    public void exitCompstat(@NotNull CParser.CompstatContext ctx) {
        poststatementwithoutlocals(new Statement(statements.pop()));
        }
    int blocknest = 0;
    public void enterPstatement(@NotNull CParser.PstatementContext ctx) {
        statements.push(null);
        //System.out.println("enter pstatement  "+ctx.getText());
        }
    public void exitPstatement(@NotNull CParser.PstatementContext ctx) {
        // poststatement(new Statement());
        // transStack.push(statements);
        // System.out.println("exitPstatement  "+statements);
        // statements = compounds.pop();
        }
    public void exitIfthen(@NotNull CParser.IfthenContext ctx) {
        Node act = statements.pop();
        Node cond = transStack.pop();
        poststatementwithoutlocals(new Statement(new If(cond, new Statement(act))));
        }
    public void exitIfelse(@NotNull CParser.IfelseContext ctx) {
        Statement elseact = new Statement(statements.pop());
        Statement act = new Statement(statements.pop());
        Node cond = transStack.pop();
        poststatementwithoutlocals(new Statement(new If(cond, act, elseact)));
        }
    public void enterSwitchstat(@NotNull CParser.SwitchstatContext ctx) {
        switches.push(new Hashtable<java.lang.Integer,Label>());
        breaks.push(new Label());
        defaults.push(new Label());
        }
    public void enterCaselab(@NotNull CParser.CaselabContext ctx) {
        //System.out.println("at enter case lab statement stack ="+statements);
        }
    public void exitCaselab(@NotNull CParser.CaselabContext ctx) {
        poststatement(null);
        //System.out.println("at exit case lab statement stack ="+statements);
        }
    public void exitCaseprefix(@NotNull CParser.CaseprefixContext ctx) {
        Node c = popexp().eval();
        if(!(Format.isInteger(c.returnType())&& c.knownAtCompileTime()))quit("not a integer constant in case label " + ctx.getText()
                    + " instead class was " + c.getClass());
        while(c instanceof TypeTag) {
            c = ((TypeTag)c).decast(c);
            }

        int i = ((ilcg.tree.Int)c).intValue();
        Label l = addcase(i);
        }
    Label addcase(int i) { // add a case to the current swithch vector
        Hashtable<java.lang.Integer,Label> v = switches.peek();
        //System.out.println("addcase("+i+")");

        //System.out.println("after ensure capacity size = "+v.size());
        Label l = new Label();
        v.put(new java.lang.Integer(i),l);
        poststatement(new Statement(l));
        return l;
        }
    public void exitSwitchstat(@NotNull CParser.SwitchstatContext ctx) {
        try {
            Node act = statements.pop();
            Type rt = typeOf();
            Node exp = transStack.pop();
            Hashtable<java.lang.Integer,Label>switchvect = switches.pop();
            Statement branch =                                           computebranch(switchvect, exp, rt, ctx);
            Label def = defaults.pop();
            poststatementwithoutlocals(new Statement(branch,
                                       new Statement(act, new Statement(breaks.pop(),
                                               new Statement(!used.contains(def) ? def : null))
                                                    ))
                                      );
            }
        catch(Exception e) {
            quit("processing switch statement", e, ctx);
            }
        }
    void fillInDefaults(Vector v) {
        int i;
        for(i = 0; i < v.size(); i++) {
            if(v.elementAt(i) == null) {
                v.setElementAt(defaults.peek(), i);
                }
            }
        }
    Statement computebranch(Hashtable<java.lang.Integer,Label> v , Node exp, Type rt, CParser.SwitchstatContext ctx) {
        //  fillInDefaults(v);
        try {
            Memref temp = (Memref) tempvar(rt);
            Statement init = new Statement(new Assign(temp, exp));
            //  Node jumptabase = createJumpTab(v);

            for(java.lang.Integer  i :v.keySet()) {

                init = new Statement(init,
                                     new Statement(new If(new Dyad(temp, new Int(i.intValue(), "int32"), Node.eq),
                                                   new Goto(v.get(i)))));
                }
            init = new Statement(init, new Statement(new Goto(defaults.peek())));
            init.setLocal(temp);
            return init;
            //  return new Statement(
            // new Goto(
            // new Deref( dyad(jumptabase,exp,"+"))));
            }
        catch(Exception e) {
            quit("processing switch", e, ctx);
            }
        return null;
        }

    public void exitVoidexp(@NotNull CParser.VoidexpContext ctx) {
        if(ctx.e == null) {
            statements.push(null);
            return;
            }
        Node discard = popexp();
        statements.push(allPrestatements());
        }
    public void enterDostatement(@NotNull CParser.DostatementContext ctx) {
        continuations.push(new Label());
        breaks.push(new Label());
        }
    public void exitDostatement(@NotNull CParser.DostatementContext ctx) {
        Node cond = popexp();
        Node act = statements.pop();
        //     System.out.println("act ="+act+ " cond ="+cond);
        Label contin = continuations.pop();
        Label top = new Label();
        Label entry = new Label();
        poststatementwithoutlocals(
            new Statement(
                new Statement(
                    new Statement(new Statement(),
                                  new Statement(top,
                                                new Statement(act,
                                                        new Statement(contin,
                                                                new Statement(new If(cond,    new Goto(top)))
                                                                     )
                                                             )
                                               )
                                 )
                ),
                new Statement(breaks.pop())
            )
        );
        }
    public void exitContinuestatement(@NotNull CParser.ContinuestatementContext ctx) {
        poststatement(new Statement(new Goto(continuations.peek())));
        }
    public void exitBreakstatement(@NotNull CParser.BreakstatementContext ctx) {
        poststatement(new Statement(new Goto(breaks.peek())));
        }
    public void enterWhilestatement(@NotNull CParser.WhilestatementContext ctx) {
        breaks.push(new Label());
        continuations.push(new Label());
        }
    public void exitWhilestatement(@NotNull CParser.WhilestatementContext ctx) {
        //      System.out.println(showstack());
        Node act = statements.pop();
        Node cond = popexp();
        Label contin = continuations.pop();
        Label top = new Label();
        Label entry = new Label();
        poststatementwithoutlocals(
            new Statement(
                new Statement(
                    new Statement(new Goto(entry),
                                  new Statement(top,
                                                new Statement(act,
                                                        new Statement(new Statement(entry, new Statement(contin)),
                                                                new Statement(new If(cond, new Goto(top)))
                                                                     )
                                                             )
                                               )
                                 )
                ),
                new Statement(breaks.pop())
            )
        );
        }
    public void enterOldfor(@NotNull CParser.OldforContext ctx) {
        continuations.push(new Label());
        breaks.push(new Label());
        }
    public void exitOldfor(@NotNull CParser.OldforContext ctx) {
        //System.out.println("begining of exitoldfor state of stacks \n"+showstack());
        Node act = statements.pop();
        Node inc = statements.pop();
        Node test = popexp();
        Label top = new Label();
        Label contin = continuations.pop();
        Label entry = contin;
        Node init = statements.pop();
        poststatementwithoutlocals(
            new Statement(
                new Statement(init,
                              new Statement(new Goto(entry),
                                            new Statement(top,
                                                    new Statement(new Statement(act, new Statement(inc)),
                                                            new Statement(entry,
                                                                    new Statement(new If(test, new Goto(top)))
                                                                         )
                                                                 )
                                                         )
                                           )
                             ),
                new Statement(breaks.pop())
            )
        );
        }

    public void enterAnsiparams(@NotNull CParser.AnsiparamsContext ctx) {
        saveSpecifiers();
        specifiers.isFndef = false;
        }
    public void exitAnsiparams(@NotNull CParser.AnsiparamsContext ctx) {
        restoreSpecifiers();
        }
    public void enterKrfndef(CParser.KrfndefContext ctx) {
        enterScope(true, false);

        exits.push(new Label());
        }
    public void enterKrdef(CParser.KrdefContext ctx) {
        currentfn = ctx.directDeclarator().getText();
        specifiers. isFndef = true;
        }


    public void exitBlockstat(@NotNull CParser.BlockstatContext ctx) {
        poststatement(null);
        }
    public void exitKrfndef(CParser.KrfndefContext ctx) {
        if(processor.verbose) {
            System.out.println("exit KRfndef" + showstack());
            }
        try {
            //{ showstack();}
            Block b = (Block)statements.pop();
            b.subtree = new Statement(b.subtree, new Statement(exits.pop()));
            if(specifiers.beingDeclared==null) {
                specifiers.beingDeclared=VOID;
                }
            Procedure p = new Procedure(specifiers.fndeclName, //String externalname,
                                        procparamcount,         //int params,
                                        specifiers.procargString,               //String argtype,
                                        specifiers. beingDeclared .type,        //String returns,
                                        new Label(),                //Label localname,
                                        b);
            p.isExported = true;
            poststatement(new Statement(p));
            if(processor.verbose) {
                System.out.println("added fn to list " + p);
                }
            //   if(! processor.codeGen((p)))throw new Exception("code generation failed");
            //  System.out.println("code generated "+ctx.getText());
            leaveScope(true, false);
            symbolTable.put(specifiers.fndeclName, p);
            }
        catch(Exception e) {
            quit(" in KRfnDef  ", e, ctx);
            }
        }
    public void enterAnsifndef(@NotNull CParser.AnsifndefContext ctx) {
        enterScope(true, false);
        specifiers. isFndef = true;
        currentfn = ctx.directDeclarator().getText();
        exits.push(new Label());
        //System.out.println("enter ansifndef");
        }
    public void exitAnsifndef(@NotNull CParser.AnsifndefContext ctx) {
        if(processor.verbose) {
            System.out.println("exit ansifndef" + showstack());
            }
        try {
            //{ showstack();}
            Block b = (Block)statements.pop();
            b.subtree = new Statement(b.subtree, new Statement(exits.pop()));
            if(specifiers.beingDeclared==null) {
                specifiers.beingDeclared=VOID;
                }
            Procedure p = new Procedure(specifiers.fndeclName, //String externalname,
                                        procparamcount,         //int params,
                                        specifiers.procargString,               //String argtype,
                                        specifiers. beingDeclared .type,        //String returns,
                                        new Label(),                //Label localname,
                                        b);
            p.isExported = true;
            poststatement(new Statement(p));
            if(processor.verbose) {
                System.out.println("added fn to list " + p);
                }
            //   if(! processor.codeGen((p)))throw new Exception("code generation failed");
            //  System.out.println("code generated "+ctx.getText());
            leaveScope(true, false);
            symbolTable.put(specifiers.fndeclName, p);
            }
        catch(Exception e) {
            quit(" in AnsifnDef  ", e, ctx);
            }
        }
    public void enterKrfnDeclarator(@NotNull CParser.KrfnDeclaratorContext ctx) {
        specifiers. isFndef = true;
        enterScope(true,false);
        //System.out.println("enterKrfnDeclarator");
        }

    public void exitKrfnDeclarator(@NotNull CParser.KrfnDeclaratorContext ctx) {
        //    System.out.println("exitKrfnDeclarator specifiers = " + specifiers);
        Procedure p = new Procedure(specifiers.fndeclName, //String externalname,
                                    procparamcount,         //int params,
                                    specifiers.procargString,               //String argtype,
                                    specifiers.beingDeclared .type,     //String returns,
                                    new Label(),                //Label localname,
                                    null,
                                    new LocalStoreAllocator(-1, 8),
                                    0);
        p.isImported = true;
        symbolTable.put(specifiers.fndeclName, p);
        }

    public void enterAnsifnDeclarator(@NotNull CParser.AnsifnDeclaratorContext ctx) {
        saveSpecifiers();
        specifiers. isFndef = true;
        //     enterScope(true,false);
        ;
        if(processor.verbose) {
            System.out.println("enterAnsifnDeclarator");
            }
        }
    public void enterBracketedansiparams(@NotNull CParser.BracketedansiparamsContext ctx) {
        saveSpecifiers();
        enterScope(true, false);
        specifiers.clearSpecifiers();
        }

    public void exitBracketedansiparams(@NotNull CParser.BracketedansiparamsContext ctx) {
        if(processor.verbose) {
            System.out.println("exitbrakedted ansi params"+ctx.getText()+" specifiers = "+specifiers);
            }
        leaveScope(true, false);
        restoreSpecifiers();
        }
    public void exitAnsifnDeclarator(@NotNull CParser.AnsifnDeclaratorContext ctx) {
        String n = specifiers.fndeclName;
        if(processor.verbose) {
            System.out.println("exitAnsifnDeclarator "+ctx.getText()+" specifiers = "+specifiers);
            }
        try {
            //  Procedure p = new Procedure(specifiers.fndeclName, //String externalname,
            //                              procparamcount,         //int params,
            //                              specifiers.procargString,               //String argtype,
            //                              specifiers.beingDeclared .type,     //String returns,
            //                              new Label(),                //Label localname,
            //                              new Block());
            Procedure p = new Procedure(n, //String externalname,
                                        procparamcount,         //int params,
                                        specifiers.procargString,               //String argtype,
                                        specifiers.beingDeclared .type,     //String returns,
                                        new Label(n),                //Label localname,
                                        null,
                                        new LocalStoreAllocator(-1, 8),
                                        0);
            p.isImported = specifiers.isExtern;
            symbolTable.put(n, p);
            }
        catch(Exception e) {
            quit("processing Ansi fn declarator ", e, ctx);
            }
        restoreSpecifiers();
        }
    public void exitArgexp1(@NotNull CParser.Argexp1Context ctx) {
        Vector v = new Vector();
        v.add(handleparamcoercion(popexp()));
        pushexp(new Cartesian(v));
        }
    Node handleparamcoercion(Node n) {
        String t = n.returnType();
        if(Format.isReal(t)) {
            return new Cast("ieee64", n);
            }
        if(Format.isRef(t))
            if(Format.isReal(Format.typeDeref(t))) {
                return handleparamcoercion(new Deref(n));
                }
        return n;
        }
    public void exitArgexp2(@NotNull CParser.Argexp2Context ctx) {
        Node tl = handleparamcoercion(popexp());
        try {
            Cartesian hd = (Cartesian)popexp();
            hd.append(tl);
            pushexp(hd);
            }
        catch(Exception e) {
            quit("processing argument list", e, ctx);
            }
        }
    public void exitNullparamcall(@NotNull CParser.NullparamcallContext ctx) {
        try {
            Node fn = popexp();
            Function  keepf;
            String ret;
            if(fn instanceof Procedure) {
                keepf  = new Function((Procedure)fn);
                ret=((Procedure)fn).getResult();
                }
            else {
                keepf = new Function(fn, VOID.returnType(), "int32");
                ret="int32";
                }

            if(processor.verbose) {
                System.out.println("in "+ctx.getText()+", fn="+fn+":"+fn.returnType()+"\n keepf="+keepf);
                }
            postPrestatement(new Statement(new Monad(keepf, new Cartesian())));
            Node t = tempvar(string2Type(ret));
            Node retreg = processor. functionRetReg(ret);

            postPrestatement(new Statement(new Assign(t,retreg)));
            pushexp(t);
            }
        catch(Exception e) {
            quit("processing null param function call", e, ctx);
            }
        }
    public void exitPostcall(@NotNull CParser.PostcallContext ctx) {
        Node args = popexp();
        try {
            Node fn = popexp();
            Function  keepf;
            if(fn instanceof Procedure) {
                keepf  = new Function((Procedure)fn);
                }
            else {
                keepf = new Function(fn, args.returnType(), "int32");
                }
            postPrestatement(new Statement(new Monad(keepf, args)));
            Node t = tempvar(string2Type(keepf.returnType()));
            postPrestatement(new Statement(new Assign(t, new Deref(processor. functionRetReg(keepf.returnType())))));
            pushexp(t);
            }
        catch(Exception e) {
            quit("processing function call", e, ctx);
            }
        }
    public void exitGotostatement(@NotNull CParser.GotostatementContext ctx) {
        String id = ctx.Identifier().getText();
        poststatement(new Statement(new Goto(new Label(currentfn + "_" + id))));
        }
    public void exitIdexp(@NotNull CParser.IdexpContext ctx) {
        String id = ctx.Identifier().getText();
        try {
            Node n = (Node)lookup(id);
            pushexp(n);
            }
        catch(Exception e) {
            quit("processing identifier ", e, ctx);
            }
        }

    public void exitUnaryop(@NotNull CParser.UnaryopContext ctx) {
        String op = ctx.unaryOperator().getText();
        try {
            if(op.equals("~")) {
                derefTos();
                Type t = typeOf();
                pushexp(new Monad("NOT", popexp()), t);
                }
            else if(op.equals("!")) {
                derefTos();
                Type t = typeOf();
                pushexp(dyad(popexp(), new ilcg.tree.Integer(0, "int32"), "=="), t);
                }
            else if(op.equals("-")) {
                derefTos();
                Type t = typeOf();
                pushexp(dyad(popexp(), new ilcg.tree.Integer(-1, "int32"), "*"), t);
                }
            else if(op.equals("*")) {
                derefTos();
                Type t = typeOf();
                if(!(t instanceof Pointer))throw new Exception(" argument to * must be a pointer but " + ctx.castExpression().getText() +
                            " is a " + t);
                Node v = popexp();
                //System.out.println("v = " + v + " : " + t);
                v = new Memref(v, ((Ref)t).pointsTo.returnType());
                //  System.out.print("post deref "+v);
                pushexp(v);
                //  System.out.println(" : "+typeOf());
                }
            else if(op.equals("*")) {
                derefTos();
                Type t = typeOf();
                if(!(t instanceof Pointer))throw new Exception(" argument to * must be a pointer but " + ctx.castExpression().getText() +
                            " is a " + t);
                Node v = popexp();
                //System.out.println("v = " + v + " : " + t);
                v = new Memref(v, ((Ref)t).pointsTo.returnType());
                System.out.print("post deref " + v);
                pushexp(v);
                //System.out.println(" : " + typeOf());
                }
            else if(op.equals("&")) {
                Node v = popexp();
                Type tt= getType(v);
                while(v instanceof TypeTag) {
                    v = ((TypeTag)v).decast(v);
                    }
                if(!(v instanceof Memref))throw new Exception(" argument to & must be a memory reference but " + ctx.castExpression().getText() +
                            " is a " + v.returnType() + " " + v);
                pushexp(new TypeTag(((Memref)v).index,new Pointer(tt,processor)));
                }
            }
        catch(Exception e) {
            quit("processing unary operation ", e, ctx);
            }
        }
    public void enterPostarraysubscript(@NotNull CParser.PostarraysubscriptContext ctx) {
        //    System.out.println("enter postarraysubscript "+ctx.getText()+
        //                      " iotalevel ="+iotalevel+" reductlevel="+reductlevel+" iotalevel set to "+0);
        iotalevel = 0;
        subscriptnest++;
        }
    public void exitPostarraysubscript(@NotNull CParser.PostarraysubscriptContext ctx) {
        subscriptnest--;
        try {
            dosubscript(ctx.getText());
            }
        catch(Exception e) {
            quit("processing array subscription operation ", e, ctx);
            }
        }
    public void enterReduc(@NotNull CParser.ReducContext ctx) {
        reductlevel++;
        //   System.out.println("enter reduc "+ctx.getText()+" iotalevel ="+iotalevel+" reductlevel ="+reductlevel);
        }
    Node getredindex() { // find the index variable for current reduction level
        return(Node) symbolTable.get("iota" + (reductlevel + assrank - 1));
        }
    Node getredlen() { // find the length of the array being reduced
        return sectionlengths[reductlevel + assrank - 1];
        }
    void clearredlen() {
        sectionlengths[reductlevel + assrank - 1] = null;
        }
    public void exitReduc(@NotNull CParser.ReducContext ctx) {
        try {
            Node exp = (popexp()); // get the expression and build a for loop round it
            Node i = getredindex();
            Node len = getredlen();
            Node temp = tempvar(getType(forcederef(exp)));
            Node last = dyad(len, one, "-");
            String op = ctx.reductionOperator().getText();
            Node eval = dyad(forcederef(temp), forcederef(exp), op);
            if(processor.verbose) {
                System.out.println(ctx.getText() + " exp =" + exp + "\n len =" + len + " last =" + last + " eval =" + eval + " op =" + op);
                }
            /* form the sequence
             * i = len-1
             * temp = exp[i]
             * for i = len-2 to 0 step -1 do temp = exp[i] op temp
             * return temp
             * */
            if(reductions.empty() || savedreductionlevel() == reductlevel) {
                Statement code = new Statement(
                    new Assign(i, last),
                    new Statement(
                        new Assign(temp, forcederef(exp)),
                        new Statement(
                            new For(i, dyad(i, one, "-"), new Int(0, "int32"), new Int(-1, "int32"),
                                    new Assign(temp, eval)
                                   )
                        )
                    )
                );
                if(reductlevel == 1) {
                    postPrestatement(code);
                    }
                else {
                    postreduction(code);
                    }
                //  System.out.println(ctx.getText()+" generates "+code+(reductlevel==1?" as prestatement ":" pushed on reductionstack"));
                }
            else {
                Statement nestedreduction = (Statement) reductions.pop();
                Statement code = new Statement(
                    new Assign(i, last),
                    new Statement(
                        new Statement(// we need to run the inner loop once for the
                            // first value of the outer reduction
                            nestedreduction,
                            new Statement(
                                new Assign(temp, forcederef(exp))
                            )
                        ),
                        new Statement(
                            new For(
                                i,                 //iterator
                                dyad(i, one, "-"), //start
                                new Int(0, "int32"), //finish
                                new Int(-1, "int32"), //step
                                new Statement(
                                    nestedreduction,
                                    new Statement(
                                        new Assign(temp, eval)
                                    )
                                )
                            )
                        )
                    )
                );
                //   System.out.println(ctx.getText()+" generates "+code+(reductlevel==1?" as prestatement ":" pushed on reductionstack"));
                if(reductlevel == 1) {
                    postPrestatement(code);
                    }
                else {
                    postreduction(code);
                    }
                }
            pushexp(temp);
            clearredlen(); // we no longer need current length so forget it
            reductlevel--;
            }
        catch(Exception e) {
            quit("processing reduction operation ", e, ctx);
            }
        }

    public void enterTriple(@NotNull CParser.TripleContext ctx) { }
    public void exitThelot(@NotNull CParser.ThelotContext ctx) {
        int level = iotalevel;
        if(0 < assrank) {
            level = (reductlevel - subscriptnest) + assrank - 1;
            }
        //  System.out.println("level ="+level);
        try {
            if(sectionlengths[level] == null) {
                throw new Exception("array section length unknown in this context");
                }
            pushexp(iota(level));  // iota will be the loop index variable
            iotalevel++;
            if(maxass < iotalevel) {
                maxass = iotalevel;
                }
            if(maxrank < (iotalevel - reductlevel)) {
                maxrank = (iotalevel - reductlevel);
                }
            }
        catch(Exception e) {
            quit("processing array section operation ", e, ctx);
            }
        }
    void clearIota() {
        iotalevel = 0;
        Node [] empty = {null, null, null, null, null, null, null };
        sectionlengths = empty;
        reductlevel = 0;
        //  maxrank=0;
        assrank = 0;
        maxass = 0;
        }
    public void exitTriple(@NotNull CParser.TripleContext ctx) {
        // System.out.println("exit triple "+ctx.getText()+" iotalevel ="+iotalevel+" reductlevel ="+reductlevel);
        int level = iotalevel;
        if(0 < assrank) {
            level = (reductlevel - subscriptnest) + assrank - 1;
            }
        //  System.out.println("level ="+level);
        try {
            Node stride = popexp();
            Node len = popexp();
            if(sectionlengths[ level] == null) {
                sectionlengths[ level] = len;
                }
            else if(!len.equals(sectionlengths[ level]))
                throw new Exception("array section length " + len + " incompatible with previous value in same statement :" + sectionlengths[ level] +
                                    "\nAssumed dimension was " + iotalevel);
            Node start = popexp();
            pushexp(dyad(start, dyad(stride, iota(level), "*"), "+"));  // iota will be the loop index variable
            iotalevel++;
            if(maxass < iotalevel) {
                maxass = iotalevel;
                }
            if(maxrank < (iotalevel - reductlevel)) {
                maxrank = (iotalevel - reductlevel);
                }
            }
        catch(Exception e) {
            quit("processing array section operation ", e, ctx);
            }
        }
    public void exitPair(@NotNull CParser.PairContext ctx) {
        int level = iotalevel ;
        if(0 < reductlevel) {
            level = (reductlevel - subscriptnest) + assrank - 1;
            }
        if(processor.verbose)System.out.println("exit pair " + ctx.getText() +
                                                    " iotalevel =" + iotalevel + " reductlevel=" + reductlevel + "\nassrank=" + assrank + " subscriptnest=" + subscriptnest
                                                    + "\n final level selected =" + level);
        try {
            Node len = popexp();
            if(sectionlengths[ level] == null) {
                sectionlengths[ level] = len;
                }
            else if(!len.equals(sectionlengths[ level]))
                throw new Exception("array section length " + len + " incompatible with previous value in same statement:" + sectionlengths[ level] +
                                    "\nAssumed dimension was " + iotalevel);
            Node start = popexp();
            pushexp(dyad(start, iota(level), "+"));  // iota will be the loop index variable
            iotalevel++;
            if(maxass < iotalevel) {
                maxass = iotalevel;
                }
            if(maxrank < (iotalevel - reductlevel)) {
                maxrank = (iotalevel - reductlevel);
                }
            }
        catch(Exception e) {
            quit("processing array section operation ", e, ctx);
            }
        }
    public void exitPostpointersubscript(@NotNull CParser.PostpointersubscriptContext ctx) {
        try {
            Type t = typeOf();
            Node base = popexp();
            if(t instanceof Ref) {
                t = ((Ref)t).pointsTo;
                }
            if(!(t instanceof Pointer))throw new Exception(" operand on the left of -> is not pointer  but a \n"
                        + t + "\n");
            t = ((Pointer)t).pointsTo;
            if(!(t instanceof structure))throw new Exception(" operand on the left of -> is not pointer to struct but a \n"
                        + t + "\n");
            base = new Deref(base);
            String fieldname = ctx.Identifier().getText();
            Field f = ((structure)t).index.get(fieldname);
            if(processor.verbose)System.out.println(" exitPostpointersubscript "+fieldname +
                                                        ":"+f+
                                                        " f.fieldType "+f.fieldType+
                                                        "  f.fieldType.type "+ f.fieldType.type);
            base = dyad(new TypeTag(base, ADDRESS), new Int(f.fieldOffset, "int32"), "+");
            if(f.fieldType instanceof Array) {
                pushexp(new Memref(base,"int8"));
                tag(f.fieldType);
                }
            else {
                pushexp(
                    new   Variable((int)f.fieldType.sizeOf(processor), (Object)new Ref(f.fieldType), "ref "+f.fieldType.type,base)
                );
                //  pushexp(new Memref(base, f.fieldType.type));
                };
            }
        catch(Exception e) {
            quit("processing pointer subscription operation ", e, ctx);
            }
        }
    public void exitPostfieldsubscript(@NotNull CParser.PostfieldsubscriptContext ctx) {
        try {
            //     derefTos();
            Type t = typeOf();
            Node base = popexp();
            if(t instanceof Ref) {
                t = ((Ref)t).pointsTo;
                }
            if(!(t instanceof structure))throw new Exception(" operand on the right of . is not of type struct but a \n"
                        + t + "\n");
            base = ((Memref)base).index;
            String fieldname = ctx.Identifier().getText();
            Field f = ((structure)t).index.get(fieldname);

            if(f==null) {
                error("field '"+fieldname+"' not known in structure "+t);
                }
            if(processor.verbose) {
                System.out.println("  exitPostfieldsubscript "+fieldname+" "+f);
                }
            base = dyad(base, new Int(f.fieldOffset, "int32"), "+");
            if(f.fieldType instanceof Array) {
                pushexp(new Memref(base,"int8"));
                tag(f.fieldType);
                }
            else {
                pushexp(new Memref(base, f.fieldType.type));
                };
            }
        catch(Exception e) {
            quit("processing field subscription operation ", e, ctx);
            }
        }
    //  public void enterPostarraysubscript(@NotNull CParser.PostarraysubscriptContext ctx) {subscriptnest++; }

    void dosubscript(String txt) throws Exception {
        Node index = popexp();
        Type t = typeOf();
        if(t instanceof Array) {

            Array a = (Array)t;
            detag();
            Memref array = (Memref) popexp();

            index = dyad(index, new ilcg.tree.Int(a.sizeOfIndex(0)), "*");
            t = a.derank();
            String te = t.returnType();
            if(processor.verbose) {
                System.out.println("in do subscript element type "+te);
                }
            if(!te.startsWith("ref")) {
                te= "ref "+te;
                }
            index =
                //     (new TypeTag(new Memref(dyad(array.index, index, "+"), a.element.returnType()),a.derank()));
                new   Variable((int)t.sizeOf(processor), (Object)t, te, dyad(array.index, index, "+"));

            pushexp(index);
            }
        else {
            if(t.returnType().startsWith("ref ref")) derefTos();
            t = typeOf();
            // System.out.println("  t="+t);
            if(!(t instanceof Pointer))throw new Exception(" argument to [] must be a pointer but " +
                        txt + " is a " + t);
            Node array = popexp();
            Type tp = ((Pointer)t).pointsTo;
            pushexp(new TypeTag(new Memref(dyad(array, index, "+"), tp.returnType()), new Ref(tp)));
            }
        }
    public void enterOldarraysyntax(@NotNull CParser.OldarraysyntaxContext ctx) { }
    public void exitOldarraysyntax(@NotNull CParser.OldarraysyntaxContext ctx) {
        try {
            dosubscript(ctx.getText());
            }
        catch(Exception e) {
            quit("processing array subscription operation ", e, ctx);
            }
        }

    public void enterInitlists(@NotNull CParser.InitlistsContext ctx) {
        if(initdepth == 0) {
            initvec = new Vector<Node>();
            }
        initdepth++;
        }
    Node coercetoV(Node n, Node V) { // make sure n has type of v
        String vt=Format.typeDeref(V.returnType());
        String nt = n.returnType();
        if(vt.equals(nt)) {
            return n;
            }
        if(Format.isInteger(vt)&&Format.isReal(nt)) {
            return new Cast(vt,n);
            }
        return  new Cast(vt,n);
        }
    public void exitInitializeddec(@NotNull CParser.InitializeddecContext ctx) {
        try {
            String id = specifiers.declarator;
            Variable v = (Variable) symbolTable.get(id);
            Type t = (Type) v.type_;
            while(t instanceof Ref) {
                t = ((Ref)t).pointsTo;
                }
            // System.out.println("at "+ctx.getText()+" lexicallevel ="+lexicalLevel());
            if(lexicalLevel() > 0) {
                if(t instanceof Array) {
                    Array a = (Array)t;
                    String f = a.element.returnType();
                    int size = Format.lengthInBytes(f);
                    for(int i = 0; i < initvec.size(); i++)
                        try {
                            poststatement(new Statement(new Assign(new Memref(dyad(new ilcg.tree.Integer(i * size), v.index, "+"), "ref " + f), initvec.elementAt(i))));
                            }
                        catch(Exception e) {
                            quit("generating initialising assign for an array value ", e, ctx);
                            }
                    }
                else if(t instanceof structure) {
                    if(processor.verbose) {
                        System.out.println("structure initialisation in "+ctx.getText()+"\nintvecsize "+initvec.size());
                        }
                    structure s = (structure)t;
                    Vector<String>fields = s.fieldNames;

                    for(int i = 0; i < initvec.size(); i++)
                        try {
                            String n = fields.elementAt(i);
                            Field f=s.index.get(n);
                            postPrestatement(new Statement(new Assign(new Memref(dyad(new ilcg.tree.Integer(f.fieldOffset), v.index, "+"), "ref " + f.fieldType.type), initvec.elementAt(i))));
                            }
                        catch(Exception e) {
                            quit("generating initialising assign for a statement value ", e, ctx);
                            }
                    }
                else
                    try {
                        //   poststatement(new Statement(new Assign(v, initvec.elementAt(0))));
                        poststatement(new Statement(new Assign(v, coercetoV(popexp(),v))));
                        }
                    catch(Exception e) {
                        quit("generating initialising assign for a scalar value ", e, ctx);
                        }
                }
            else {
                if(!(t instanceof Array)) {
                    // put the initialiser in the data segment with a label
                    Node initialiser = popexp();
                    if(initialiser instanceof Label) {
                        pushexp(initialiser);
                        }
                    else {
                        Node l = new Label();
                        dataDecls = new Statement(dataDecls,
                                                  new Statement(l,
                                                                new Statement(new Location(initialiser))));
                        // return the label
                        pushexp(l);
                        }
                    }
                else {
                    Node l2 = new Label();
                    dataDecls = new Statement(dataDecls,
                                              new Statement(l2,
                                                            new Statement(flatten(initvec, 0))));
                    // return the label
                    pushexp(l2);
                    }
                // the variable will be to a label in the bss
                Node bss = v.index;
                while(bss instanceof Cast) {
                    bss = ((Cast)bss).getSubtree();
                    }
                if(!(bss instanceof Dyad)) {
                    throw new Exception("bss not a Dyad but a " + bss);
                    }
                Dyad D = (Dyad)bss;
                Label bsslab = (Label)findlabel(D);
                // we need to replace it with the equivalent label in
                // the data segment now on the stack
                Label dataseglab = (Label)popexp();
                v.index = dataseglab;
                // but this will leave the label in the bss with the
                // name of the identifier so swap the names of the labels
                String temp = bsslab.labval;
                bsslab.labval = dataseglab.labval;
                dataseglab.labval = temp;
                }
            }
        catch(Exception e) {
            //e.printStackTrace();
            quit("in initialising declaration ", e, ctx);
            }
        }

    Node flatten(Vector<Node>v, int i) {
        if(i >= v.size()) {
            return null;
            }
        return new Statement(new Location(v.elementAt(i)), new Statement(flatten(v, i + 1)));
        }
    public void exitInitlists(@NotNull CParser.InitlistsContext ctx) {
        initdepth--;
        } public void enterInitlist(@NotNull CParser.InitlistContext ctx) {
        initdepth++;
        }
    public void exitInitlist(@NotNull CParser.InitlistContext ctx) {
        initdepth--;
        }
    public void exitInitializerelement(@NotNull CParser.InitializerelementContext ctx) { }
    int initdepth = 0;
    public void exitInitvalue(@NotNull CParser.InitvalueContext ctx) {
        if(processor.verbose)System.out.println("exitInitvalue initdepth = "+initdepth);
        if(initdepth>0) {
            initvec.add(popexp());
            }
        }
    // public void exitDeclaration(@NotNull CParser.DeclarationContext ctx)
    public void enterDeclarationSpecifiers(@NotNull CParser.DeclarationSpecifiersContext ctx) {
        if(specifiers . isFndef) {
            specifiers.clearSpecifiers();
            specifiers.isFndef = true;
            }
        else {
            specifiers.clearSpecifiers();
            }
        //System.out.println("Enter declarationspecifiers  " + ctx.getText());
        }
    public void enterTypedcast(@NotNull CParser.TypedcastContext ctx) {
        saveSpecifiers();
        specifiers.clearSpecifiers();
        }

    public void exitTypedcast(@NotNull CParser.TypedcastContext ctx) {
        try {
            Node n = popexp();
            n = forcederef(n);
            pushexp(n, specifiers.beingDeclared);
            }
        catch(Exception e) {
            quit(" in cast expression ", e, ctx);
            }
        restoreSpecifiers();
        }
    public void enterTypedefspec(@NotNull CParser.TypedefspecContext ctx) {
        specifiers.clearSpecifiers();
        specifiers.isTypedef = true;
        }
    public void enterIssigned(@NotNull CParser.IssignedContext ctx) {
        specifiers.isSigned = true;
        }
    public void enterExternspec(@NotNull CParser.ExternspecContext ctx) {
        specifiers.isExtern = true;
        }
    public void enterStaticspec(@NotNull CParser.StaticspecContext ctx) {
        specifiers. isStatic = true;
        }
    String theString = "";
    public void enterStringexp(@NotNull CParser.StringexpContext ctx) {
        theString = "";
        }
    public void exitStringexp(@NotNull CParser.StringexpContext ctx) {
        theString = ctx.getText();
        try {
            theString = processString(theString);
            pushexp(plantStringlab((theString), theString.length()));

            }
        catch(Exception e) {
            quit(" in string expression ", e, ctx);
            }
        }
    public void enterAutospec(@NotNull CParser.AutospecContext ctx) {
        specifiers. isAuto = true;
        }
    public void enterParameterTypeList(@NotNull CParser.ParameterTypeListContext ctx) {
        procparamcount = 0;
        specifiers.  procargString = "";
        }
    public void enterParameterDeclaration(@NotNull CParser.ParameterDeclarationContext ctx) {
        specifiers.clearSpecifiers();
        }
    public void enterRegisterspec(@NotNull CParser.RegisterspecContext ctx) {
        specifiers.isRegister = true;
        }
    public void exitBasetypespec(@NotNull CParser.BasetypespecContext ctx) {
        // System.out.println("exitbasetype " + ctx.getText() + " basetypename = " + specifiers.basetypeName);
        if(specifiers.basetypeName.equals("void")) {
            specifiers.basetypeName = ctx.getText();
            }
        else {
            specifiers.basetypeName += (" " + ctx.getText());
            }
        if(!specifiers.isSigned) {
            if(!specifiers.basetypeName.contains("unsigned")) {
                specifiers. basetypeName = "unsigned " + specifiers.basetypeName;
                }
            }
        if(processor.verbose)System.out.println("exit base type "+ctx.getText()+" basetypname set to "+specifiers.basetypeName
                                                   );
        try {
            Object n=lookup(specifiers.basetypeName);
            if(!(n instanceof Type)) {
                throw new Exception("undeclared type "+specifiers.basetypeName);
                }
            specifiers . beingDeclared = (Type) n;
            }
        catch(Exception e) {
            quit(" in basetype ", e, ctx);
            }
        // System.out.println("being declared = "+beingDeclared);
        }
    public void enterUnsigned(@NotNull CParser.UnsignedContext ctx) {
        specifiers.isSigned = false;
        }
    public void enterPointer(@NotNull CParser.PointerContext ctx) {
        reflevel++;
        }

    public void exitDeclarator(@NotNull CParser.DeclaratorContext ctx) {
        reflevel = 0;
        }
    public void enterDeclaration(@NotNull CParser.DeclarationContext ctx) {
        //System.out.println("Enter declaration "+ctx.getText());
        specifiers.clearSpecifiers();
        }
    Node getbase(Node n) {
        if(lexicalLevel() == 0) {
            return n;
            }
        return bases[lexicalLevel()];
        }
    public void exitUnspecifiedarrayDeclarator(CParser.UnspecifiedarrayDeclaratorContext ctx) {
        try {
            String id = specifiers.declarator;
            Node n = (Node)symbolTable.get(id);

            if(n instanceof Variable) { // normal case
                Variable v = (Variable)symbolTable.get(id);
                Array a;
                Type elemt = (Type)v.type_;
                v.type_ = a = new Array(elemt, 1);

                }
            else {
                // in a struct we just have the type here
                symbolTable.put(id, new Array((Type)n, 0));
                }
            }
        catch(Exception e) {
            quit("processing unspecified length array declarator ", e, ctx);
            }
        }
    public void exitArrayDeclarator(CParser.ArrayDeclaratorContext ctx) {
        try {
            String id = specifiers.declarator;
            Node n = (Node)symbolTable.get(id);
            Node len = popexp().eval();
            if(! len.knownAtCompileTime()) {
                throw new Exception("Arrays must have sizes known at compile time in C ");
                }
            if(n instanceof Variable) { // normal case
                Variable v = (Variable)symbolTable.get(id);
                Array a;
                Type elemt = (Type)v.type_;
                v.type_ = a = new Array(elemt, ((Number)len).intValue());
                v.index = dyad(getbase(v.index), new Int(currentLocalAllocator().alloc((int)a.sizeOf(processor), 16)), "+");
                }
            else {
                // in a struct we just have the type here
                symbolTable.put(id, new Array((Type)n, ((Number)len).intValue()));
                }
            }
        catch(Exception e) {
            quit("processing array declarator ", e, ctx);
            }
        }
    public void exitIdDeclarator(@NotNull CParser.IdDeclaratorContext ctx) {
        String id = ctx.getText();
        if(processor.verbose) {
            System.out.println("in exidIDDeclarator "+id + " : " + specifiers);
            }
        if(specifiers.beingDeclared==null) {
            specifiers.beingDeclared=VOID;
            }
        try {
            if(specifiers.isFndef) {
                specifiers.fndeclName = id;
                }
            else if(specifiers.isTypedef) {
                if(processor.verbose) {
                    System.out.println("declare "+id+" as a typedef for "+specifiers.beingDeclared);
                    }
                symbolTable.put(id, specifiers.beingDeclared);
                }
            else {
                declareVar(id, pointerise(specifiers.beingDeclared), specifiers.isStatic, specifiers.isExtern);
                specifiers.declarator = id;
                specifiers.initfield = 0;
                }
            }
        catch(Exception e) {
            quit(" in declaration of  " + id + " ", e, ctx);
            }
        }
    public void exitTypedefName(@NotNull CParser.TypedefNameContext ctx) {
        String id = ctx.getText();
        //System.out.println(id + " :typedefname? "  );
        try {
            Object ent = symbolTable.get(id);
            //System.out.println(" found "+ent);
            if(!(ent instanceof Type)) {
                throw new Exception(id+" not a type");
                }
            specifiers.beingDeclared = (Type)ent;
            }
        catch(Exception ei) {
            // come here if nothing declared or not a type
            if(processor.verbose) {
                System.out.println("in exit typdedefname exception thrown"+ei+" specifiers.basetypeName ="+specifiers.basetypeName);
                }
            //Object n=lookup(specifiers.basetypeName);
            try {
                if(specifiers.isFndef) {
                    specifiers.fndeclName = id;
                    }
                else if(specifiers.isTypedef) {
                    if(processor.verbose) {
                        System.out.println("is a typedef, set "+id+" to "+specifiers.beingDeclared);
                        }
                    symbolTable.put(id, specifiers.beingDeclared);
                    }
                else {
                    if(specifiers.basetypeName.equals("void")) {
                        if(!specifiers.isSigned) {
                            specifiers.beingDeclared=(Type)lookup("unsigned");
                            }
                        }
                    declareVar(id, pointerise(specifiers.beingDeclared), specifiers.isStatic, specifiers.isExtern);
                    }
                }
            catch(Exception e) {
                quit(" in declaration of  " + id + " ", e, ctx);
                }
            }
        }
    public void enterSimplelab(@NotNull CParser.SimplelabContext ctx) {
        //    statements.push(null);// put on stack to ensure statement not prejoined to
        //what comes before it
        }
    Node zero = new ilcg.tree. Integer(0, "int32");
    public void exitReturnstatement(@NotNull CParser.ReturnstatementContext ctx) {
        poststatement(new Statement(new Goto(exits.peek())));
        }

    public void exitReturnvalue(@NotNull CParser.ReturnvalueContext ctx) {
        try {
            poststatement(new Statement(new ilcg.tree.Return(forcederef(popexp())), new Statement(new Goto(exits.peek()))));
            }
        catch(Exception e) {
            quit(" in return statement  " , e, ctx);
            }
        }
    public void exitDefaultprefix(@NotNull CParser.DefaultprefixContext ctx) {
        poststatement(new Statement(defaults.peek()));
        used.add(defaults.peek());
        }
    public void exitDefaultlab(@NotNull CParser.DefaultlabContext ctx) {
        poststatement(null);
        }
    public void exitLabelprefix(@NotNull CParser.LabelprefixContext ctx) {
        Label l = new Label(currentfn + "_" + ctx.Identifier().getText());
        poststatement(new Statement(l));
        }
    public void exitSimplelab(@NotNull CParser.SimplelabContext ctx) {
        poststatement(null);
        }
    public void exitExpressionStatement(@NotNull CParser.ExpressionStatementContext ctx) {
        //  poststatementwithoutlocals(new Statement());
        if(ctx.e != null)
            if(!transStack.empty()) {
                //  System.out.println(" about to pop stack in expression statement "+ctx.getText()+"\n"+showstack());
                Node a = transStack.pop();
                }
        }
    public void enterAnassignment(@NotNull CParser.AnassignmentContext ctx) {
        if(processor . verbose) {
            System.out.println("enteranassignment " + ctx.getText() + "set assrank to " + maxass);
            }
        assrank = maxass;
        }
    public void exitRealcond(@NotNull CParser.RealcondContext ctx) {
        try {
            Node elsepart=popexp();
            Node thenpart=popexp();
            Node cond =popexp();
            Memref temp =tempvar(gettype(elsepart));
            poststatement(
                new Statement(
                    new If(cond,
                           new Assign(temp,thenpart),
                           new Assign(temp,elsepart)
                          )
                )
            );
            pushexp(temp);

            }
        catch(Exception e) {
            quit("processing conditional expression ",e,ctx);
            }
        }
    public void exitAnassignment(@NotNull CParser.AnassignmentContext ctx) {
        // handle a=b
        Node b = transStack.pop();
        Node a = transStack.pop();
        try {

            b = forcederef(b);

            Type  tt  = (getType(new Deref(a)));

            b = forceTypeCompatibility(b, tt);

            String op = ctx.assignmentOperator().getText();
            if(op.equals("=")) {
                poststatement(new Statement(doAssign(a, b)));
                }
            else {
                op = op.substring(0, op.length() - 1);
                poststatement(new Statement(doAssign(a, dyad(a, b, op))));
                }
            pushexp(a);// assignment leaves value assigned on stack
            }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("a = "+a+"\nb = "+b);
            quit("processing assignment ", e, ctx);
            }
        }
    ilcg.tree.Assign doAssign(Node a, Node b)throws AssignmentException {
        return new Assign(a,b);
        }
    public void exitTimesexp(@NotNull CParser.TimesexpContext ctx) {
        try {
            dyad("*");
            }
        catch(Exception e) {
            quit(" in multiplicative expression ", e, ctx);
            }
        }
    public void exitLeftshift(@NotNull CParser.LeftshiftContext ctx) {
        try {
            dyad(Node.shl);
            }
        catch(Exception e) {
            quit(" in shift expression ", e, ctx);
            }
        }
    public void exitRightshift(@NotNull CParser.RightshiftContext ctx) {
        try {
            dyad(Node.shr);
            }
        catch(Exception e) {
            quit(" in shift expression ", e, ctx);
            }
        }
    public void exitEqexp(@NotNull CParser.EqexpContext ctx) {
        try {
            dyad("==");
            }
        catch(Exception e) {
            quit(" in comparision expression ", e, ctx);
            }
        }
    public void exitNeexp(@NotNull CParser.NeexpContext ctx) {
        try {
            dyad("!=");
            }
        catch(Exception e) {
            quit(" in comparision expression ", e, ctx);
            }
        }
    public void exitGeexp(@NotNull CParser.GeexpContext ctx) {
        try {
            dyad(">=");
            }
        catch(Exception e) {
            quit(" in comparision expression ", e, ctx);
            }
        }
    public void exitGtexp(@NotNull CParser.GtexpContext ctx) {
        try {
            dyad(">");
            }
        catch(Exception e) {
            quit(" in comparision expression ", e, ctx);
            }
        }
    public void exitLeexp(@NotNull CParser.LeexpContext ctx) {
        try {
            dyad("<=");
            }
        catch(Exception e) {
            quit(" in comparision expression ", e, ctx);
            }
        }
    public void exitLtexp(@NotNull CParser.LtexpContext ctx) {
        try {
            dyad("<");
            }
        catch(Exception e) {
            quit(" in comparision expression ", e, ctx);
            }
        }
    public void exitDivexp(@NotNull CParser.DivexpContext ctx) {
        try {
            dyad(Node.divide);
            }
        catch(Exception e) {
            quit(" in multiplicative expression ", e, ctx);
            }
        }
    public void exitModexp(@NotNull CParser.ModexpContext ctx) {
        try {
            dyad(Node.remainder);
            }
        catch(Exception e) {
            quit(" in multiplicative expression ", e, ctx);
            }
        }
    public void enterPostinc(@NotNull CParser.PostincContext ctx) {
        tempStack.push("++");
        }
    public void exitPostinc(@NotNull CParser.PostincContext ctx) {
        try {
            Node val = popexp();
            pushexp(val);
            derefTos();
            Type t = (Type)typeOf();
            Memref i = (Memref)tempvar(t);
            postPrestatement(new Statement(new Assign(i, popexp())));
            postPrestatement(new Statement(new Assign(val, new TypeTag(dyad(forcederef(i), new Int(1, "int32"), "+"),t))));
            pushexp(i);
            }
        catch(Exception e) {
            quit(" in post increment expression ", e, ctx);
            }
        }
    public void enterPostdec(@NotNull CParser.PostdecContext ctx) {
        tempStack.push("--");
        }
    public void exitPostdec(@NotNull CParser.PostdecContext ctx) {
        try {
            Node val = popexp();
            pushexp(val);
            derefTos();
            Type t = (Type)typeOf();
            Memref i = (Memref)tempvar(t);
            //   postPrestatement(new Statement(new Assign(i, transOf())));
            postPrestatement(new Statement(new Assign(i, popexp())));
            postPrestatement(new Statement(new Assign(val, dyad(forcederef(i), new Int(-1, "int32"), "+"))));
            pushexp(i);
            }
        catch(Exception e) {
            quit(" in post decrement expression ", e, ctx);
            }
        }
    public void enterAlignoftype(@NotNull CParser.AlignoftypeContext ctx) {
        savedbase = specifiers.basetypeName;
        specifiers.basetypeName = "void";
        }
    public void exitAlignoftype(@NotNull CParser.AlignoftypeContext ctx) {
        try {
            String name = ctx.typeName().getText();
            Type t = (Type)lookup(name);
            pushexp(new Int(t.alignment(processor), "int32"));
            specifiers.basetypeName = savedbase;
            }
        catch(Exception e) {
            quit(" in align of type expression ", e, ctx);
            }
        }
    String savedbase;
    public void enterSizoftype(@NotNull CParser.SizoftypeContext ctx) {
        savedbase = specifiers.basetypeName;
        specifiers.basetypeName = "void";
        }
    public void exitSizoftype(@NotNull CParser.SizoftypeContext ctx) {
        try {
            String name = ctx.typeName().getText();
            if(name.endsWith("*")) {
                name = "void*";
                }
            Type t = (Type)lookup(name);
            pushexp(new Int(Format.lengthInBytes(t.type), "int32"));
            specifiers.basetypeName = savedbase;
            }
        catch(Exception e) {
            quit(" in size of type expression ", e, ctx);
            }
        }
    public void exitSizeofval(@NotNull CParser.SizeofvalContext ctx) {
        try {
            derefTos();
            pushexp(new Int(Format.lengthInBytes(popexp().returnType())));
            }
        catch(Exception e) {
            quit(" in size of value expression ", e, ctx);
            }
        }
    public void exitPredec(@NotNull CParser.PredecContext ctx) {
        try {
            Type t = typeOf();
            Node v = popexp();
            postPrestatement(new Statement(new Assign(v, dyad(new ilcg.tree.Integer(-1, "int32"), v, "+"))));
            pushexp(v);
            }
        catch(Exception e) {
            quit(" in predecrement expression ", e, ctx);
            }
        }
    public void exitPreinc(@NotNull CParser.PreincContext ctx) {
        try {
            Type t = typeOf();
            Node v = popexp();
            postPrestatement(new Statement(new Assign(v, dyad(new ilcg.tree.Integer(1, "int32"), v, "+"))));
            pushexp(v);
            }
        catch(Exception e) {
            quit(" in preincrement expression ", e, ctx);
            }
        }
    public void exitAdditivesum(@NotNull CParser.AdditivesumContext ctx) {
        try {
            dyad("+");
            }
        catch(Exception e) {
            quit(" in additivesum ", e, ctx);
            }
        }
    public void exitSatadditivesum(@NotNull CParser.SatadditivesumContext ctx) {
        try {
            dyad("+:");
            }
        catch(Exception e) {
            quit(" in additivesum ", e, ctx);
            }
        }
    public void exitSatadditivesub(@NotNull CParser.SatadditivesubContext ctx) {
        try {
            dyad("-:");
            }
        catch(Exception e) {
            quit("in additivesub ", e, ctx);
            }
        }
    public void exitAdditivesub(@NotNull CParser.AdditivesubContext ctx) {
        try {
            dyad("-");
            }
        catch(Exception e) {
            quit("in additivesub ", e, ctx);
            }
        }
    public void enterConstant(@NotNull CParser.ConstantContext ctx) {
        String tok = ctx.getText();
        if(ctx.sort.equals("int")) {
            String suf = getSuffix(tok.toUpperCase(), "LU");
            String pref = getPrefix(tok, suf).toUpperCase();
            boolean islong = suf.contains("LL");
            boolean isunsigned = suf.contains("U");
            String format = (isunsigned ? "u" : "") + "int" + (islong ? 64 : 32);
            long l ;
            if(pref.startsWith("0X")) {
                l = java.lang. Long.parseLong(pref.substring(2), 16);
                }
            else if(pref.startsWith("0")) {
                l = java.lang.Long.parseLong(pref, 8);
                }
            else {
                l = java.lang.Long.parseLong(pref, 10);
                }
            pushexp(new ilcg.tree.Int(l, format));
            String ctype = (isunsigned ? "unsigned " : "") +
                           (islong ? "long long" : "int");
            tag((Type)symbolTable.get(ctype));
            }
        else if(ctx.sort.equals("char")) {
            tok = tok.substring(1, tok.length() - 1);
            String escaped = unescapeString(tok);
            pushexp(new ilcg.tree.Int(escaped.charAt(0), "uint8"));
            tag((Type)symbolTable.get("char"));
            }
        else if(ctx.sort.equals("float")) {
            String suf = getSuffix(tok.toUpperCase(), "LF");
            String pref = getPrefix(tok, suf).toUpperCase();
            boolean islong = !suf.contains("F");
            String format =  "ieee" + (islong ? 64 : 32);
            double l ;
            l = java.lang.Double.parseDouble(pref);
            pushexp(new ilcg.tree.Real(l, format));
            String ctype = (islong ? "double" : "float");
            tag((Type)symbolTable.get(ctype));
            }
        }
    //--------------------------------------------------------------------------------
    //------------------------------------ end of traversal code
    public static void main(String[] args) {
        Flags f = new Flags(args);
        for(int i = 0; i < f.cfiles.size(); i++) {
            String c = f.cfiles.elementAt(i);
            String prefix = "/tmp/" + i + "f" + c.hashCode();
            String preprocessed = prefix + ".c";
            String assembler = prefix + ".asm";

            Dyad.infix=true;
            String objfile = (c.substring(0, c.lastIndexOf('.'))) + ".o";
            if(i==0&&f.objspecified) {
                objfile=f.objname;
                }
            preprocessfile(c, preprocessed, f);
            processfile(preprocessed, assembler, f);
            //  System.out.println("\n assembler in "+assembler);
            if(!assemble(assembler, objfile, f)) {
                Quit("assembly failed");
                }
            f.pass2gcc.add(objfile);
            }
        for(String s : f.pass2asm) {
            assemble(s, s + ".o", f);
            f.pass2gcc.add(s + ".o");
            }
        link(f);
        System.exit(0);
        }
    static void link(Flags f) {
        if(f.objname.endsWith(".o")) {
            return;
            }
        for(int i = 1; i < f.pass2gcc.size(); i++) {
            AsmLink.libs += (" " + f.pass2gcc.elementAt(i));
            }
        AsmLink.rtl = "";
        Walker w = null;
        try {
            w = f.getCodeGenerator(f.cgname, new PrintWriter(f.cgname + "linking.lst"));
            if(!w.link(f.pass2gcc.elementAt(0), f.objname)) {
                throw new Exception("link failed");
                };
            }
        catch(Exception e) {
            System.err.println("Error " + e);
            }
        }
    static boolean assemble(String asmfile, String ofile, Flags f) {
        Walker w = null;
        try {
            w = f.getCodeGenerator(f.cgname, new PrintWriter(asmfile + ".lst"));
            //System.out.println("\n using "+w.getClass()+" to assemble");
            if(!w.assemble(asmfile, ofile)) {
                throw new Exception("assembly failed");
                };
            }
        catch(Exception e) {
            System.err.println("Error " + e);
            return false;
            }
        return true;
        }
    static void preprocessfile(String cfile, String prep, Flags f) {
        Runtime sys = Runtime.getRuntime();
        try {
            // String com =  "as --32 -mmnemonic=intel -msyntax=intel --no-warn -g -o " + ofile + " " + infile;
            String com = "cpp ";
            for(String s : f.pass2cpp) {
                com += (" " + s);
                }
            com += (" " + cfile + " " + prep);
            if(f.verbose) {
                System.out.println(com);
                }
            Process p = sys.exec(com);
            StreamGobbler errorGobbler = new      StreamGobbler(p.getErrorStream(), "ERROR");
            // any output?
            StreamGobbler outputGobbler = new            StreamGobbler(p.getInputStream(), "OUTPUT");
            // kick them off
            errorGobbler.start();
            outputGobbler.start();
            if(p.waitFor() == 0) {
                return ;
                }
            }
        catch(Exception ep) {
            System.err.println(ep);
            }
        }
    static void processfile(String cfile, String asmfile , Flags f) {
        Walker w = null;
        try {
            w = f.getCodeGenerator(f.cgname, new PrintWriter(cfile + ".lst"));
            ANTLRFileStream input = new ANTLRFileStream(cfile);
            sourceName = cfile;
            CLexer lexer = new CLexer(input);
            CommonTokenStream tokens = new CommonTokenStream(lexer);
            CParser parser = new CParser(tokens);
            parser.addErrorListener(new CerrorListener());
            ParserRuleContext/*<Token> */tree = parser.compilationUnit();  // parse
            ParseTreeWalker walker = new ParseTreeWalker();  // create standard walker
            CCompiler comp = new CCompiler(parser, w);
            walker.walk(comp, tree);  // initiate walk of tree with listener
            if(!comp.codegen(asmfile)) {
                throw new Exception("Code generation failed");
                }
            w.getLogFile().flush();
            }
        catch(Exception e) {
            System.err.println("Error " + e);
            if(w.verbose) {
                e.printStackTrace();
                }
            w.getLogFile().flush();
            Quit("compilation failed");
            }
        }

    }
class Flags {
    boolean verbose = false;
    boolean training = true;
    boolean objspecified=false;
    int opt_level = 1;
    String rtldir = ".";
    static final String defaultcg = "gnuP4CG";
    String cgname = defaultcg;
    String objname = "a.out";
    Vector<String> cfiles = new Vector<String>();
    Vector<String> pass2gcc = new Vector<String>();
    Vector<String> pass2asm = new Vector<String>();
    Vector<String> pass2cpp = new Vector<String>();
    String[]cppprefix = {"-U", "-D", "-I" };
    String[]objpref = {"-o" };
    Flags(String[] args) {
        for(int i = 0; i < args.length; i++) {
            String s = args[i];
            if(s.endsWith(".c")) {
                cfiles.add(s);
                }
            else if(s.startsWith("-o")) {
                if(merged(s, objpref)) {
                    objname = s.substring(2);
                    objspecified=true;
                    }
                else if(separate(s, objpref)) {
                    objname = args[i + 1];
                    objspecified=true;
                    i++;
                    }
                }
            else if(s.endsWith(".asm") || s.endsWith(".s")) {
                pass2asm.add(s);
                }
            else if(s.startsWith("-cpu")) {
                cgname = args[i].substring(4) + "CG";
                }
            else if(s.startsWith("-O")) {
                opt_level = s.charAt(2) - '0';
                }
            else if(s.startsWith("-V")) {
                verbose = true;
                }
            else if(merged(s, cppprefix)) {
                pass2cpp.add(s);
                }
            else if(separate(s, cppprefix)) {
                pass2cpp.add(s + " " + args[i]);
                i++;
                }
            else {
                pass2gcc.add(s);
                }
            }
        }
    int wherein(String[] l, String s) {
        for(int i = 0; i < l.length; i++)if(s.startsWith(l[i])) {
                return i;
                }
        return -1;
        }
    boolean merged(String s, String[]list) {
        int i = wherein(list, s);
        if(i >= 0) {
            return s.length()>list[i].length() ;
            }
        return false;
        }
    boolean separate(String s, String[]list) {
        return (wherein(list, s) >= 0) && (!merged(s, list));
        }

    Walker getCodeGenerator(String cgname, PrintWriter lst)
    throws Exception {
        Walker  w;
//   if(cgname.equals(defaultcg))
//   {   w = new gnuPentiumCG();
//    }
//   else
            {
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
                if(verbose) {
                    System.out.println(cgname + ".vwu loaded");
                    }
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
                    if(verbose) {
                        System.out.println(rtldir + "/" + cgname + ".vwu loaded");
                        }
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
        if(opt_level >= 0) {
            w.setOptimisationLevel(opt_level);
            if(w.optimisationLevel > 0) {
                For.optimiseon = true;
                }
            if(w.optimisationLevel > 1) {
                For.loopunroll = true;
                }
            }
        w.verbose = verbose;
        return w;
        }


    }
///------------------------------------------------ other classes
class CType extends  Type {
    String name;
    CType(String typename, String ilcgrep) {
        name = typename;
        type = ilcgrep;
        }
    public  long sizeOf(Walker processor) {
        return Format.lengthInBytes(type);
        }
    public boolean equals(Type t) {
        if(!(t instanceof CType)) {
            return false;
            }
        return ((CType)t).name.equals(name);
        }
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
        }
    public Node modify(TreeModifier m) {
        if(m.visit(this)) {
            return  m.modified(this);
            }
        return this;
        }
    }
class Ref extends Type {
    Type  pointsTo;
    Ref() { }
    Ref(Type t) {
        pointsTo = t;
        type = "ref " + t.type;
        }
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
        }
    public int alignment(Walker processor) {
        return (int) sizeOf(processor);
        }
    public boolean equals(Type t) {
        return (t instanceof Ref) && ((Ref) t).pointsTo.equals(pointsTo);
        }
    public String codeGenRepresentation(Walker processor) {
        return "ref " + pointsTo.codeGenRepresentation(processor);
        }
    public void examine(TreeExaminer e) {}
    public String toString() {
        return "ref " + pointsTo;
        }
    public Node modify(TreeModifier m) {
        return this;
        }
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
        }
    }
class TypeTag extends Cast {
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
        if(!vt.startsWith("ref")) {
            checktype();
            }
        }
    public Node eval() {
        Node  tree  = super.eval();
        if(thistype.type.equals(ieee32) || thistype.type.equals(ieee64)) {
            if(tree instanceof Real) {
                return new Real(((Real) tree).doubleValue(), thistype.type);
                }
            }
        else if(tree instanceof CharLit) {
            TypeTag t3 = new TypeTag(tree, thistype);
            t3.setAnnotation(getAnnotation());
            return t3;
            }
        else if(tree.returnType().equals(Node.int32)
                && thistype.type.equals(Node.int32)) {
            return tree;
            }
        else if(tree.returnType().equals(Node.int64)
                && thistype.type.equals(Node.int64)) {
            return tree;
            }
        else if(tree.returnType().equals(Node.uint32)
                && thistype.type.equals(Node.uint32)) {
            return tree;
            }
        TypeTag t2 = new TypeTag(tree, thistype);
        t2.setAnnotation(getAnnotation());
        return t2;
        }
    /**
    *  Description of the Method
    * returns string format of the type in ilcg
    */
    public String returnType() {
        return thistype.type;
        }
    /**
    *  Description of the Method
    *
    * removes a cast from a type tagged value
    */
    static Node decast(Node v) {
        if(v instanceof Cast) {
            return decast(((Cast) v).getSubtree());
            }
        return v;
        }
    }
class Array extends Type {
    Type element;
    int rank;
    int [] lengths = {1, 1, 1, 1, 1, 1 };
    public Array() {}
    public String returnType() {
        return element.returnType() + " vector ( " + size() + " )";
        }
    int sizeOfIndex(int i) {
        if(rank <= (i - 1)) {
            return Format.lengthInBytes(Format.typeDeref(element.returnType()));
            }
        return lengths[i + 1] * sizeOfIndex(i + 1);
        }
    public Type derank() {
        if(1 == rank) {
            return element;
            }
        Array a = new Array();
        a.element = element;
        a.rank = rank - 1;
        for(int i = 0; i < a.rank; i++) {
            a.lengths[i] = lengths[i + 1];
            }
        return a;
        }

    public Array(Type t , int  len) {
        //System.out.println("create an array type with element"+t);
        if(t instanceof Array) {
            Array a = (Array)t;
            rank = a.rank + 1;
            element = a.element;
            for(int i = 0; i < rank - 1; i++) {
                lengths[i] = a.lengths[i];
                }
            lengths[rank - 1] = len;
            }
        else {
            rank = 1;
            lengths[0] = len;
            element = t;//new Ref(t);
            }
        }
    public String toString() {
        String s = element.toString();
        for(int i = 0; i < rank; i++) {
            s = s + "[" + lengths[i] + "]";
            }
        return s;
        }
    public  boolean equals(Type t) {
        if(t instanceof Array) {
            Array a = (Array)t;
            if(rank != a.rank) {
                return false;
                }
            if(!element.equals(a.element)) {
                return false;
                }
            for(int i = 0; i < lengths.length ; i++)
                if(lengths[i] != a.lengths[i]) {
                    return false;
                    }
            return true;
            }
        return false;
        }
    public Node modify(TreeModifier m) {
        return this;
        }
    int size() {
        int l = 1;
        for(int i : lengths) {
            l *= i;
            }
        return l;
        }
    public long sizeOf(Walker processor) {
        long l = element.sizeOf(processor);
        for(int i : lengths) {
            l *= i;
            }
        return l;
        }
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
        }
    }
class Pointer extends Ref {
    Walker  cpu;
    Pointer(Type t, Walker processor) {
        super(t);
        pointsTo = t;
        cpu = processor;
        }
    public String returnType() {
        return codeGenRepresentation(cpu);
        }
    public String codeGenRepresentation(Walker processor) {
        return processor.getAddressType();
        }
    public String toString() {
        return   pointsTo + "*";
        }
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
        }
    }
class PointerToNamedType extends SimpleType {
    String  typename;
    public boolean equals(Type t) {
        return t.toString().equals(toString());
        }
    PointerToNamedType(String name, Walker processor) {
        typename = name;
        type = processor.getAddressType();
        }
    public String toString() {
        return typename+"*";
        }
    public String codeGenRepresentation(Walker processor) {
        return processor.getAddressType();
        }
    public long sizeOf(Walker processor) {
        return processor.getAddressLenInBytes();
        }
    }
class SimpleType extends Type {
    int size;
    SimpleType() {
        size = 1;
        type = Node.octet;
        }
    SimpleType(String representation, int Size) {
        size = Size;
        type = representation;
        }
    public void toBinary(DataOutputStream out) throws IOException {
        throw new IOException("toBinary unimplemented in " + this);
        }
    public boolean equals(Object t) {
        if(t instanceof SimpleType) {
            return type.equals(((SimpleType) t).type);
            }
        return false;
        }
    public  boolean equals(Type t) {
        return equals((Object)t);
        }
    public long sizeOf(Walker processor) {
        return size;
        }
    public String codeGenRepresentation(Walker processor) {
        return type;
        }
    public void examine(TreeExaminer e) {}
    public Node modify(TreeModifier m) {
        return this;
        }
    }
class TOP extends Op {
    Type  Returns;
    Op    oper;
    TOP(Op o, Type t) {
        super(o.Symbol, o.Left, o.Right, o.Returns);
        oper = o;
        Returns = t;
        }
    }
